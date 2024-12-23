Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4FC9FADF1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 12:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216A410E520;
	Mon, 23 Dec 2024 11:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BOzwGR2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733E410E525
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 11:54:50 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54026562221so4376544e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 03:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734954889; x=1735559689; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3+jwbDtoVtKwBF8Oc10PBTbPC29IY38yVbu5FIsCHHg=;
 b=BOzwGR2ezz02TAEeN/d2VVlnriqfVmZREEX+9KunCfi3dnvONN+BSGAI8lzv93AEex
 drNXiZ5v9vff63EPaXjfFpk2RsrrcOQZlCbWGIbEymDK/XRksyDVOF+PmZ7OziNmw6M6
 2ypH1xU2tp6miU8v5qASOlc4KZDARwQVR1efCxvumjMnpd2oAKm6R+eT9xYmH5AqEVjH
 d5Vxr34lsTDK+2v0HNyHj9DuG5DDNL8AKSP/aEi1r1MT8QwntB5OTIAfazgU6ws4L+lM
 nOlxc8NPTbHbvHF2DNW6Q9OJ0dcVbwlfhKyjaXD3zjJ4fDYQ5ElH0fTBfhu13zI+Dm+A
 jPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734954889; x=1735559689;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3+jwbDtoVtKwBF8Oc10PBTbPC29IY38yVbu5FIsCHHg=;
 b=PwisZCPHjngZli/Fxeyfg+zHcza8MQuZ2pFn6MjYS5hHmhVHVclppuEjzdK71finl8
 5XWuz4bCno2CWg71OH3eUdxKZaC53RGJxjXRoacy4a3jsnrJZ3vx3/QPICPPcRYNWhEA
 Cp5B1tUI1R14IM+BVjEI5H1hD0wBAQnJOCH4kBLyW/zqbSFefyLG65yNoLj7r0n8V6SI
 I3pt5+Ib/NjjKyTGyw4PAHOZwYsN8S/T/strE100gn5Lqb8VpG/1ecwn9/zPeAzgtKAW
 SqqpKSlO6sZN6t1TmrMLQ9sUbw9WozLbSUMiN6n5s5qaVPhx4OgJHcJLq0Efn0sIX7q0
 ZFKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbqZsPgskPb76gZeuYKbOY37/Q/Ny/NqQ4L6uPYUC2xkhlWbGJ4JNiSsqiSbw/yrnk9E528nUUF/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB4ex/mLLkkP3/TVQarDZZa5jZuwQUSQNe8oWezXgK4QghT2Sb
 10VhOKRfWfcDfTKWe20KlbUy/lEeAnTC2+mUFMrAhIODF0Jjq/sHXI5jETDdTmA=
X-Gm-Gg: ASbGncsnT8D5Vwy6YiXmR5Jf/wo6t/YNFM6x6mbNjrLXtC0y+trB6j08LsMqivrd1zf
 u1u10qI7GfJ+aphL8hfk98s89aKRYzRah+M/MJfsRmjC+hWfbC2fkulM8ab2lN74dxmuHpIwaYe
 JRaibD05qYIl9at6Pmvwnth6kiXwzja2J3PSdRSwnqp8uwf3AjZeX3/dNXcWX6JzBPAMPbs0mEc
 ipwpBT0X8j3zplM0capPJ32illjSeEoN8wwmH9IOtVGM3ln6xOy3PL1CipFLl9GMDBtJFZh4GQk
 Tx4Gbygkm4S7OXxswA7Pb8YsgSrAGr8gdpFW
X-Google-Smtp-Source: AGHT+IHgkznHFCE0oE4dZjBLaQaWr27Qjn5XAujqFFNK/MnseaS1Hy38/C0iy2Xshg8Nfw4fVADUyw==
X-Received: by 2002:a05:6512:10d4:b0:540:23af:837e with SMTP id
 2adb3069b0e04-5422955fc5bmr3470236e87.39.1734954888661; 
 Mon, 23 Dec 2024 03:54:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238214a6sm1249965e87.195.2024.12.23.03.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 03:54:47 -0800 (PST)
Date: Mon, 23 Dec 2024 13:54:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
Message-ID: <rzhm6lkryxfqepgejpgmu4mr2z5qlzcvuptmmxhhndafc4kwlo@uw6eiw4cqlmd>
References: <mz4zpcr4tqh2w7vt75f4ofxjzfve54ozzgpdbi2jjzk5pdxbk7@t36tlt3mmprt>
 <d858dadb-4098-4c9f-b4f0-393dc988db5f@quicinc.com>
 <4426b4kybtac6rc4twa5pgm3hvlegofemvqjcrvh6ni7f5z2h6@5dnlv3hgywh5>
 <c5e868e1-2dae-466c-a6fc-ef0f247fa0ce@quicinc.com>
 <278e62e1-02a4-4e33-8592-fb4fafcedf7e@quicinc.com>
 <CAA8EJprgshjbNqNErOb06jqV__LmbWvocsK5eD8PQqL+FaLb1g@mail.gmail.com>
 <f67c72c3-7393-47b0-9b9c-1bfadce13110@quicinc.com>
 <CAA8EJppy+V9m-t_qPEJh2iTkC7tyDcf2y8wD9vYoHtFSp=HrkQ@mail.gmail.com>
 <982686bb-0ddd-45a2-b620-564af4f01800@quicinc.com>
 <16e1145c-6ef4-4274-a8f9-966f0edef9fe@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16e1145c-6ef4-4274-a8f9-966f0edef9fe@oss.qualcomm.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 23, 2024 at 12:31:27PM +0100, Konrad Dybcio wrote:
> On 4.12.2024 7:18 PM, Akhil P Oommen wrote:
> > On 11/16/2024 1:17 AM, Dmitry Baryshkov wrote:
> >> On Fri, 15 Nov 2024 at 19:54, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>>
> >>> On 11/15/2024 3:54 AM, Dmitry Baryshkov wrote:
> >>>> Hello Akhil,
> >>>>
> >>>> On Thu, 14 Nov 2024 at 20:50, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>>>>
> >>>>> On 11/1/2024 9:54 PM, Akhil P Oommen wrote:
> >>>>>> On 10/25/2024 11:58 AM, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, Oct 24, 2024 at 12:56:58AM +0530, Akhil P Oommen wrote:
> >>>>>>>> On 10/22/2024 11:19 AM, Krzysztof Kozlowski wrote:
> >>>>>>>>> On Mon, Oct 21, 2024 at 05:23:43PM +0530, Akhil P Oommen wrote:
> >>>>>>>>>> Add a new schema which extends opp-v2 to support a new vendor specific
> >>>>>>>>>> property required for Adreno GPUs found in Qualcomm's SoCs. The new
> >>>>>>>>>> property called "qcom,opp-acd-level" carries a u32 value recommended
> >>>>>>>>>> for each opp needs to be shared to GMU during runtime.
> >>>>>>>>>>
> >>>>>>>>>> Cc: Rob Clark <robdclark@gmail.com>
> >>>>>>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>>>>>>>> ---
> >>>>>>>>>>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 96 ++++++++++++++++++++++
> >>>>>>>>>>  1 file changed, 96 insertions(+)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> >>>>>>>>>> new file mode 100644
> >>>>>>>>>> index 000000000000..6d50c0405ef8
> >>>>>>>>>> --- /dev/null
> >>>>>>>>>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> >>>>>>>>>> @@ -0,0 +1,96 @@
> >>>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>>>>>>> +%YAML 1.2
> >>>>>>>>>> +---
> >>>>>>>>>> +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
> >>>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>>>>>> +
> >>>>>>>>>> +title: Qualcomm Adreno compatible OPP supply
> >>>>>>>>>> +
> >>>>>>>>>> +description:
> >>>>>>>>>> +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
> >>>>>>>>>> +  ACD related information tailored for the specific chipset. This binding
> >>>>>>>>>> +  provides the information needed to describe such a hardware value.
> >>>>>>>>>> +
> >>>>>>>>>> +maintainers:
> >>>>>>>>>> +  - Rob Clark <robdclark@gmail.com>
> >>>>>>>>>> +
> >>>>>>>>>> +allOf:
> >>>>>>>>>> +  - $ref: opp-v2-base.yaml#
> >>>>>>>>>> +
> >>>>>>>>>> +properties:
> >>>>>>>>>> +  compatible:
> >>>>>>>>>> +    items:
> >>>>>>>>>> +      - const: operating-points-v2-adreno
> >>>>>>>>>> +      - const: operating-points-v2
> >>>>>>>>>> +
> >>>>>>>>>> +patternProperties:
> >>>>>>>>>> +  '^opp-?[0-9]+$':
> >>>>>>>>>
> >>>>>>>>> '-' should not be optional. opp1 is not expected name.
> >>>>>>>>
> >>>>>>>> Agree. Will change this to '^opp-[0-9]+$'
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>>> +    type: object
> >>>>>>>>>> +    additionalProperties: false
> >>>>>>>>>> +
> >>>>>>>>>> +    properties:
> >>>>>>>>>> +      opp-hz: true
> >>>>>>>>>> +
> >>>>>>>>>> +      opp-level: true
> >>>>>>>>>> +
> >>>>>>>>>> +      opp-peak-kBps: true
> >>>>>>>>>> +
> >>>>>>>>>> +      opp-supported-hw: true
> >>>>>>>>>> +
> >>>>>>>>>> +      qcom,opp-acd-level:
> >>>>>>>>>> +        description: |
> >>>>>>>>>> +          A positive value representing the ACD (Adaptive Clock Distribution,
> >>>>>>>>>> +          a fancy name for clk throttling during voltage droop) level associated
> >>>>>>>>>> +          with this OPP node. This value is shared to a co-processor inside GPU
> >>>>>>>>>> +          (called Graphics Management Unit a.k.a GMU) during wake up. It may not
> >>>>>>>>>> +          be present for some OPPs and GMU will disable ACD while transitioning
> >>>>>>>>>> +          to that OPP. This value encodes a voltage threshold and few other knobs
> >>>>>>>>>> +          which are identified by characterization of the SoC. So, it doesn't have
> >>>>>>>>>> +          any unit.
> >>>>>>>>>
> >>>>>>>>> Thanks for explanation and other updates. I am still not happy with this
> >>>>>>>>> property. I do not see reason why DT should encode magic values in a
> >>>>>>>>> quite generic piece of code. This creates poor ABI, difficult to
> >>>>>>>>> maintain or understand.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Configuring GPU ACD block with its respective value is a requirement for each OPP.
> >>>>>>>> So OPP node seems like the natural place for this data.
> >>>>>>>>
> >>>>>>>> If it helps to resolve your concerns, I can elaborate the documentation with
> >>>>>>>> details on the GMU HFI interface where this value should be passed on to the
> >>>>>>>> hardware. Also replace "few other knobs" with "Delay cycles & Calibration margin"
> >>>>>>>> in the above doc.
> >>>>>>>
> >>>>>>> Usually the preference for DT is to specify data in a sensible way
> >>>>>>> rather than just the values being programmed to the register. Is it
> >>>>>>> possible to implement this approach for ACD values?
> >>>>>
> >>>>> Krzysztof/Dmitry,
> >>>>>
> >>>>> BIT(0)-BIT(15) are static configurations which doesn't change between
> >>>>> OPPs. We can move it to driver.
> >>>>>
> >>>>> BIT(16)-BIT(31) indicates a threshold margin which triggers ACD. We can
> >>>>> keep this in the devicetree. And the driver can construct the final
> >>>>> value from both data and send it to GMU.
> >>>>>
> >>>>> If this is acceptable, I will send the v3 revision.
> >>>>
> >>>> Can the upper bitfield have a sensible representation in DT (like uV
> >>>> or something similar)?
> >>>
> >>> Closest approximation is quantized voltage steps. So, unit-less.
> >>> Converting it to the exact voltage requires identifying the pmic voltage
> >>> steps and other stuffs which are outside of my expertise.
> >>>
> >>> It is convenient if we can abstract it as an integer which correlates
> >>> with the voltage margin that should be maintained for each regulator corner.
> > 
> > Krzysztof,
> > 
> > Could you please confirm if this approach would be acceptable?
> > 
> > To reiterate, move the lower 16 bits which is same across OPPs to the
> > driver. Abstract the higher 16 bits as number of quantized voltage
> > margin when ACD mitigation gets triggered.
> 
> I know I'm not Krzysztof, but given this is ultimately a magic value
> passed to the firmware, I'm a bit lukewarm on decomposing it and would
> rather see the entire 32b passed in a property, so that if a future
> target needs a different constant in the lower word, we don't have to
> pull our hair out again, trying to add more spaghetti logic to account
> for that.

Also obviously being non-Krzysztof, if we don't have a semantic value
for the upper half I'm fine with having the magic value as a single
instance instead of spreading it between two places.

-- 
With best wishes
Dmitry
