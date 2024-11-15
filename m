Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F9C9CF536
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 20:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201E810E8B6;
	Fri, 15 Nov 2024 19:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DpQBKQBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E387010E8BA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 19:48:04 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6ea0b25695dso19636957b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 11:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731700084; x=1732304884; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5hqZZY2Xw4Iij5lMmhTNFkUvBmDKTrsfUBUbIBiu3tQ=;
 b=DpQBKQBzZMaCoPZUFydQmquFBzaJvqVLmSmsoj++xOCyzhuSI99lf/RJmidFPvUWHi
 ez1uD80Zlho4Znl7iGH1xlKUV5dPAAKp8AtC1/8g+uB/+HLB7n4gjD2Id/iIYxPPw4b1
 Rdj90U3tTs0eRVDSznFpSejlWg3lZT2m87FuptIPDiW/oyGJHlHqiYk7wjHJYfwm41CP
 6EKY75UpVTkPkF7TrUM2lvhHHFn0yQX8UPb5VODYZ3wUVXonrj+UMYVMDmxkRIyDkoLH
 PSd3H8DzYL2dAzt/06O2pKdhJjAo+cD17FQ7ocl6ZsxfDFI3iQsG6pjxpBXsMRAnorv+
 hraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731700084; x=1732304884;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5hqZZY2Xw4Iij5lMmhTNFkUvBmDKTrsfUBUbIBiu3tQ=;
 b=JZ2B5ygg+bp0gcFmOXCh8fIQpJqWNJLt7uK7fHx7nEQGk/yGYgee9CkGVe161HZCT8
 nFsV2A4SK53Tf6foWb1CpqFJltk1TYSBJD5oygJwjnCloeOdN808VUovMHxeRTtCNTE0
 v1K6pJiP8gxN4/HWzYwNWdR2IotV3xW5xigjZAg8q6Yir+8DTe1yHbZbApmuQtdVmxqR
 agOKA5ZOqc5SlA/lzcFz1fEQJRVA5u2UQlow6ow5HI3NYekDl/c6Eg+yZszmkrkTedSh
 xpimoYK3ZmQAZ4GI1s48XfXUas1PKUTxCryIly1xDY5iC0S5YT2YX4cXDnHYRntTpznJ
 837Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWPKoue2jClBBszd4Z8ZxV0Ta69mALk9afHBtgcitSbhxn5fFqCYveYwX1YBPZBFzbtmHNrrQpAm4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3vA52d9QcFBjYu3WUdZfYZcGEKouMVC05slCg7Gwt/GLvSIZJ
 YK28n75Ysjg0EjN3Q+Y2hJ7gGLpAgw1v6zgF7WXfgNfL5+JIUI8asGfdA4byK4X8XRdRBh/hnXM
 zQCGIb4SV1yGMckv8Xx82Mbctp6kl9Fn7Xpnzog==
X-Google-Smtp-Source: AGHT+IGIukyB05CdIVdL1icbGYosMbFDk6j/Gtkmjlh6kGKZaRFg/N+JXtJlBfPhO8UT5MJlHu9T5PXAioWUh56J1Wc=
X-Received: by 2002:a05:690c:e18:b0:6ea:8c14:7bfc with SMTP id
 00721157ae682-6ee55cbbedamr42076707b3.34.1731700083691; Fri, 15 Nov 2024
 11:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20241021-gpu-acd-v2-0-9c25a62803bc@quicinc.com>
 <20241021-gpu-acd-v2-2-9c25a62803bc@quicinc.com>
 <mz4zpcr4tqh2w7vt75f4ofxjzfve54ozzgpdbi2jjzk5pdxbk7@t36tlt3mmprt>
 <d858dadb-4098-4c9f-b4f0-393dc988db5f@quicinc.com>
 <4426b4kybtac6rc4twa5pgm3hvlegofemvqjcrvh6ni7f5z2h6@5dnlv3hgywh5>
 <c5e868e1-2dae-466c-a6fc-ef0f247fa0ce@quicinc.com>
 <278e62e1-02a4-4e33-8592-fb4fafcedf7e@quicinc.com>
 <CAA8EJprgshjbNqNErOb06jqV__LmbWvocsK5eD8PQqL+FaLb1g@mail.gmail.com>
 <f67c72c3-7393-47b0-9b9c-1bfadce13110@quicinc.com>
In-Reply-To: <f67c72c3-7393-47b0-9b9c-1bfadce13110@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Nov 2024 21:47:52 +0200
Message-ID: <CAA8EJppy+V9m-t_qPEJh2iTkC7tyDcf2y8wD9vYoHtFSp=HrkQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 15 Nov 2024 at 19:54, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 11/15/2024 3:54 AM, Dmitry Baryshkov wrote:
> > Hello Akhil,
> >
> > On Thu, 14 Nov 2024 at 20:50, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>
> >> On 11/1/2024 9:54 PM, Akhil P Oommen wrote:
> >>> On 10/25/2024 11:58 AM, Dmitry Baryshkov wrote:
> >>>> On Thu, Oct 24, 2024 at 12:56:58AM +0530, Akhil P Oommen wrote:
> >>>>> On 10/22/2024 11:19 AM, Krzysztof Kozlowski wrote:
> >>>>>> On Mon, Oct 21, 2024 at 05:23:43PM +0530, Akhil P Oommen wrote:
> >>>>>>> Add a new schema which extends opp-v2 to support a new vendor specific
> >>>>>>> property required for Adreno GPUs found in Qualcomm's SoCs. The new
> >>>>>>> property called "qcom,opp-acd-level" carries a u32 value recommended
> >>>>>>> for each opp needs to be shared to GMU during runtime.
> >>>>>>>
> >>>>>>> Cc: Rob Clark <robdclark@gmail.com>
> >>>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>>>>> ---
> >>>>>>>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 96 ++++++++++++++++++++++
> >>>>>>>  1 file changed, 96 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> >>>>>>> new file mode 100644
> >>>>>>> index 000000000000..6d50c0405ef8
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> >>>>>>> @@ -0,0 +1,96 @@
> >>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>>>> +%YAML 1.2
> >>>>>>> +---
> >>>>>>> +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
> >>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>>> +
> >>>>>>> +title: Qualcomm Adreno compatible OPP supply
> >>>>>>> +
> >>>>>>> +description:
> >>>>>>> +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
> >>>>>>> +  ACD related information tailored for the specific chipset. This binding
> >>>>>>> +  provides the information needed to describe such a hardware value.
> >>>>>>> +
> >>>>>>> +maintainers:
> >>>>>>> +  - Rob Clark <robdclark@gmail.com>
> >>>>>>> +
> >>>>>>> +allOf:
> >>>>>>> +  - $ref: opp-v2-base.yaml#
> >>>>>>> +
> >>>>>>> +properties:
> >>>>>>> +  compatible:
> >>>>>>> +    items:
> >>>>>>> +      - const: operating-points-v2-adreno
> >>>>>>> +      - const: operating-points-v2
> >>>>>>> +
> >>>>>>> +patternProperties:
> >>>>>>> +  '^opp-?[0-9]+$':
> >>>>>>
> >>>>>> '-' should not be optional. opp1 is not expected name.
> >>>>>
> >>>>> Agree. Will change this to '^opp-[0-9]+$'
> >>>>>
> >>>>>>
> >>>>>>> +    type: object
> >>>>>>> +    additionalProperties: false
> >>>>>>> +
> >>>>>>> +    properties:
> >>>>>>> +      opp-hz: true
> >>>>>>> +
> >>>>>>> +      opp-level: true
> >>>>>>> +
> >>>>>>> +      opp-peak-kBps: true
> >>>>>>> +
> >>>>>>> +      opp-supported-hw: true
> >>>>>>> +
> >>>>>>> +      qcom,opp-acd-level:
> >>>>>>> +        description: |
> >>>>>>> +          A positive value representing the ACD (Adaptive Clock Distribution,
> >>>>>>> +          a fancy name for clk throttling during voltage droop) level associated
> >>>>>>> +          with this OPP node. This value is shared to a co-processor inside GPU
> >>>>>>> +          (called Graphics Management Unit a.k.a GMU) during wake up. It may not
> >>>>>>> +          be present for some OPPs and GMU will disable ACD while transitioning
> >>>>>>> +          to that OPP. This value encodes a voltage threshold and few other knobs
> >>>>>>> +          which are identified by characterization of the SoC. So, it doesn't have
> >>>>>>> +          any unit.
> >>>>>>
> >>>>>> Thanks for explanation and other updates. I am still not happy with this
> >>>>>> property. I do not see reason why DT should encode magic values in a
> >>>>>> quite generic piece of code. This creates poor ABI, difficult to
> >>>>>> maintain or understand.
> >>>>>>
> >>>>>
> >>>>> Configuring GPU ACD block with its respective value is a requirement for each OPP.
> >>>>> So OPP node seems like the natural place for this data.
> >>>>>
> >>>>> If it helps to resolve your concerns, I can elaborate the documentation with
> >>>>> details on the GMU HFI interface where this value should be passed on to the
> >>>>> hardware. Also replace "few other knobs" with "Delay cycles & Calibration margin"
> >>>>> in the above doc.
> >>>>
> >>>> Usually the preference for DT is to specify data in a sensible way
> >>>> rather than just the values being programmed to the register. Is it
> >>>> possible to implement this approach for ACD values?
> >>
> >> Krzysztof/Dmitry,
> >>
> >> BIT(0)-BIT(15) are static configurations which doesn't change between
> >> OPPs. We can move it to driver.
> >>
> >> BIT(16)-BIT(31) indicates a threshold margin which triggers ACD. We can
> >> keep this in the devicetree. And the driver can construct the final
> >> value from both data and send it to GMU.
> >>
> >> If this is acceptable, I will send the v3 revision.
> >
> > Can the upper bitfield have a sensible representation in DT (like uV
> > or something similar)?
>
> Closest approximation is quantized voltage steps. So, unit-less.
> Converting it to the exact voltage requires identifying the pmic voltage
> steps and other stuffs which are outside of my expertise.
>
> It is convenient if we can abstract it as an integer which correlates
> with the voltage margin that should be maintained for each regulator corner.

I'd say, this is up to the DT maintainers then.

>
> -Akhil.
>
> >
> >>
> >> -Akhil.
> >>
> >>>
> >>> I am still checking about this. Will get back.
> >>>
> >>> -Akhil
> >>>
> >>>>
> >>>>>
> >>>>>>
> >>>>
> >>>
> >>
> >
> >
>


-- 
With best wishes
Dmitry
