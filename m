Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048789FBABB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 09:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F57210E298;
	Tue, 24 Dec 2024 08:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KmJ+8c9l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0019D10E295;
 Tue, 24 Dec 2024 08:51:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4A8DE5C5D4C;
 Tue, 24 Dec 2024 08:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22752C4CED7;
 Tue, 24 Dec 2024 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735030285;
 bh=Z413MmWl8girlEV89H1wBTkln/48gWBRXOGxo7wVLgY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KmJ+8c9lBhvaBulElssjB/vB18bw5faDTZsih+WsDlNoAZxTiOMW2QfwZ3IEh2oSO
 LipVCr1h2ckliu8Rqn8yFSoVOBhG2gc2Rrf6T/5crRMnp6lPGdNurvwFe9xZPhDuWJ
 5ILyY70IX8TVXaTEVWO/YAPYwMgniPVoW+W1cXxu06p5TZ5G3fPCSYTZWY6DeWQPKy
 3QB36XhOPf/9ekXS0QfiyzVStQX13nl7MldUOP1EKy3Xgzs+dNKLTpYdPG3Tvo+hes
 amR8uAEQohaW/kKx6/tPX71PrF5F55DkKkhfL1wb/n9pZ28ytXZW3liMHoQ3hq8ihv
 1oVsgksP2m0fw==
Message-ID: <8d2092a6-e0c3-49ab-8a3e-64eb9051d353@kernel.org>
Date: Tue, 24 Dec 2024 09:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
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
 <rzhm6lkryxfqepgejpgmu4mr2z5qlzcvuptmmxhhndafc4kwlo@uw6eiw4cqlmd>
 <f1cf95be-af6c-45d9-8e26-2b978327260f@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <f1cf95be-af6c-45d9-8e26-2b978327260f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 23/12/2024 22:31, Akhil P Oommen wrote:
> On 12/23/2024 5:24 PM, Dmitry Baryshkov wrote:
>> On Mon, Dec 23, 2024 at 12:31:27PM +0100, Konrad Dybcio wrote:
>>> On 4.12.2024 7:18 PM, Akhil P Oommen wrote:
>>>> On 11/16/2024 1:17 AM, Dmitry Baryshkov wrote:
>>>>> On Fri, 15 Nov 2024 at 19:54, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>
>>>>>> On 11/15/2024 3:54 AM, Dmitry Baryshkov wrote:
>>>>>>> Hello Akhil,
>>>>>>>
>>>>>>> On Thu, 14 Nov 2024 at 20:50, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>
>>>>>>>> On 11/1/2024 9:54 PM, Akhil P Oommen wrote:
>>>>>>>>> On 10/25/2024 11:58 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Thu, Oct 24, 2024 at 12:56:58AM +0530, Akhil P Oommen wrote:
>>>>>>>>>>> On 10/22/2024 11:19 AM, Krzysztof Kozlowski wrote:
>>>>>>>>>>>> On Mon, Oct 21, 2024 at 05:23:43PM +0530, Akhil P Oommen wrote:
>>>>>>>>>>>>> Add a new schema which extends opp-v2 to support a new vendor specific
>>>>>>>>>>>>> property required for Adreno GPUs found in Qualcomm's SoCs. The new
>>>>>>>>>>>>> property called "qcom,opp-acd-level" carries a u32 value recommended
>>>>>>>>>>>>> for each opp needs to be shared to GMU during runtime.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Cc: Rob Clark <robdclark@gmail.com>
>>>>>>>>>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 96 ++++++++++++++++++++++
>>>>>>>>>>>>>  1 file changed, 96 insertions(+)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
>>>>>>>>>>>>> new file mode 100644
>>>>>>>>>>>>> index 000000000000..6d50c0405ef8
>>>>>>>>>>>>> --- /dev/null
>>>>>>>>>>>>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
>>>>>>>>>>>>> @@ -0,0 +1,96 @@
>>>>>>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>>>>>>>> +%YAML 1.2
>>>>>>>>>>>>> +---
>>>>>>>>>>>>> +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>>>>>>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +title: Qualcomm Adreno compatible OPP supply
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +description:
>>>>>>>>>>>>> +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
>>>>>>>>>>>>> +  ACD related information tailored for the specific chipset. This binding
>>>>>>>>>>>>> +  provides the information needed to describe such a hardware value.
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +maintainers:
>>>>>>>>>>>>> +  - Rob Clark <robdclark@gmail.com>
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +allOf:
>>>>>>>>>>>>> +  - $ref: opp-v2-base.yaml#
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +properties:
>>>>>>>>>>>>> +  compatible:
>>>>>>>>>>>>> +    items:
>>>>>>>>>>>>> +      - const: operating-points-v2-adreno
>>>>>>>>>>>>> +      - const: operating-points-v2
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +patternProperties:
>>>>>>>>>>>>> +  '^opp-?[0-9]+$':
>>>>>>>>>>>>
>>>>>>>>>>>> '-' should not be optional. opp1 is not expected name.
>>>>>>>>>>>
>>>>>>>>>>> Agree. Will change this to '^opp-[0-9]+$'
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>> +    type: object
>>>>>>>>>>>>> +    additionalProperties: false
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    properties:
>>>>>>>>>>>>> +      opp-hz: true
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +      opp-level: true
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +      opp-peak-kBps: true
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +      opp-supported-hw: true
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +      qcom,opp-acd-level:
>>>>>>>>>>>>> +        description: |
>>>>>>>>>>>>> +          A positive value representing the ACD (Adaptive Clock Distribution,
>>>>>>>>>>>>> +          a fancy name for clk throttling during voltage droop) level associated
>>>>>>>>>>>>> +          with this OPP node. This value is shared to a co-processor inside GPU
>>>>>>>>>>>>> +          (called Graphics Management Unit a.k.a GMU) during wake up. It may not
>>>>>>>>>>>>> +          be present for some OPPs and GMU will disable ACD while transitioning
>>>>>>>>>>>>> +          to that OPP. This value encodes a voltage threshold and few other knobs
>>>>>>>>>>>>> +          which are identified by characterization of the SoC. So, it doesn't have
>>>>>>>>>>>>> +          any unit.
>>>>>>>>>>>>
>>>>>>>>>>>> Thanks for explanation and other updates. I am still not happy with this
>>>>>>>>>>>> property. I do not see reason why DT should encode magic values in a
>>>>>>>>>>>> quite generic piece of code. This creates poor ABI, difficult to
>>>>>>>>>>>> maintain or understand.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Configuring GPU ACD block with its respective value is a requirement for each OPP.
>>>>>>>>>>> So OPP node seems like the natural place for this data.
>>>>>>>>>>>
>>>>>>>>>>> If it helps to resolve your concerns, I can elaborate the documentation with
>>>>>>>>>>> details on the GMU HFI interface where this value should be passed on to the
>>>>>>>>>>> hardware. Also replace "few other knobs" with "Delay cycles & Calibration margin"
>>>>>>>>>>> in the above doc.
>>>>>>>>>>
>>>>>>>>>> Usually the preference for DT is to specify data in a sensible way
>>>>>>>>>> rather than just the values being programmed to the register. Is it
>>>>>>>>>> possible to implement this approach for ACD values?
>>>>>>>>
>>>>>>>> Krzysztof/Dmitry,
>>>>>>>>
>>>>>>>> BIT(0)-BIT(15) are static configurations which doesn't change between
>>>>>>>> OPPs. We can move it to driver.
>>>>>>>>
>>>>>>>> BIT(16)-BIT(31) indicates a threshold margin which triggers ACD. We can
>>>>>>>> keep this in the devicetree. And the driver can construct the final
>>>>>>>> value from both data and send it to GMU.
>>>>>>>>
>>>>>>>> If this is acceptable, I will send the v3 revision.
>>>>>>>
>>>>>>> Can the upper bitfield have a sensible representation in DT (like uV
>>>>>>> or something similar)?
>>>>>>
>>>>>> Closest approximation is quantized voltage steps. So, unit-less.
>>>>>> Converting it to the exact voltage requires identifying the pmic voltage
>>>>>> steps and other stuffs which are outside of my expertise.
>>>>>>
>>>>>> It is convenient if we can abstract it as an integer which correlates
>>>>>> with the voltage margin that should be maintained for each regulator corner.
>>>>
>>>> Krzysztof,
>>>>
>>>> Could you please confirm if this approach would be acceptable?
>>>>
>>>> To reiterate, move the lower 16 bits which is same across OPPs to the
>>>> driver. Abstract the higher 16 bits as number of quantized voltage
>>>> margin when ACD mitigation gets triggered.
>>>
>>> I know I'm not Krzysztof, but given this is ultimately a magic value
>>> passed to the firmware, I'm a bit lukewarm on decomposing it and would
>>> rather see the entire 32b passed in a property, so that if a future
>>> target needs a different constant in the lower word, we don't have to
>>> pull our hair out again, trying to add more spaghetti logic to account
>>> for that.

I can also imagine future SoC not respecting existing interface and
switching to something new, duplicating the effort. All this is "driven
by downstream" approach... but sure, let's go with existing approach.



Best regards,
Krzysztof
