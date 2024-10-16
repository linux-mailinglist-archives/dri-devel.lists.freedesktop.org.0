Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF7A9A0329
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 09:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE3810E123;
	Wed, 16 Oct 2024 07:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DCFfpoWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C4D10E123;
 Wed, 16 Oct 2024 07:54:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7AEE15C5A5A;
 Wed, 16 Oct 2024 07:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D055EC4CEC5;
 Wed, 16 Oct 2024 07:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729065248;
 bh=nSnk6F/Qg9kwlRfzoeNCv4lXQf3Gz1lsGHi2kPhLZ54=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DCFfpoWaUFN06ZS2y5Po02RE85ejdu3wDTTXJYQssi6TXQX46pYJr0UdUbcKL5q5p
 LCH2Rm8eeYb1KLoG0mLfzbs71VGcipeWxmBQkJCf1d5Q1UCA3cJgvAFBk2/HFLakdp
 LbyNSq/XHrXN6zi69Z2ySU9XyAI22Mx0mzWtI48g4n9TFG28ko/2DyLPtAhfGUFwp+
 nIiW1Jst3fbd3X22+Z5UXResE58C2j/16igbLoIqpAx9CppOoPkO2Q4owFs9KK6OyJ
 dPH0dd7Itw2cP72TlXcjJsWL8twUecTxuR/oj4Y5nzSK8nPA3oAhQZIduk+ZwLfD7R
 0BdtMcLVa2jKA==
Message-ID: <294bf353-4aff-4d89-a5d7-5d2d19b089c1@kernel.org>
Date: Wed, 16 Oct 2024 09:53:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com>
 <20241012-gpu-acd-v1-2-1e5e91aa95b6@quicinc.com>
 <he6cfrofgmdw2se4mcok25c54sboovevmlli42xh6ttnqiogat@ja6el35jyd65>
 <20241015191314.pbz5v5u65gbpjheg@hu-akhilpo-hyd.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241015191314.pbz5v5u65gbpjheg@hu-akhilpo-hyd.qualcomm.com>
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

On 15/10/2024 21:13, Akhil P Oommen wrote:
> On Mon, Oct 14, 2024 at 09:39:01AM +0200, Krzysztof Kozlowski wrote:
>> On Sat, Oct 12, 2024 at 01:59:29AM +0530, Akhil P Oommen wrote:
>>> Add a new schema which extends opp-v2 to support a new vendor specific
>>> property required for Adreno GPUs found in Qualcomm's SoCs. The new
>>> property called "qcom,opp-acd-level" carries a u32 value recommended
>>> for each opp needs to be shared to GMU during runtime.
>>>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 84 ++++++++++++++++++++++
>>>  1 file changed, 84 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
>>> new file mode 100644
>>> index 000000000000..9fb828e9da86
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
>>> @@ -0,0 +1,84 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Adreno compatible OPP supply
>>> +
>>> +description:
>>> +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
>>> +  ACD related information tailored for the specific chipset. This binding
>>> +  provides the information needed to describe such a hardware value.
>>> +
>>> +maintainers:
>>> +  - Rob Clark <robdclark@gmail.com>
>>> +
>>> +allOf:
>>> +  - $ref: opp-v2-base.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: operating-points-v2-adreno
>>> +
>>> +patternProperties:
>>> +  '^opp-?[0-9]+$':
>>> +    type: object
>>> +    additionalProperties: false
>>> +
>>> +    properties:
>>> +      opp-hz: true
>>> +
>>> +      opp-level: true
>>> +
>>> +      opp-peak-kBps: true
>>> +
>>> +      opp-supported-hw: true
>>> +
>>> +      qcom,opp-acd-level:
>>> +        description: |
>>> +          A positive value representing the acd level associated with this
>>
>> What is acd?
> 
> Adaptive Clock Distribution, a fancy name for clock throttling during voltage
> droop. I will update the description to capture this.
> 
>>
>>> +          OPP node. This value is shared to GMU during GPU wake up. It may
>>
>> What is GMU?
> 
> A co-processor which does power management for Adreno GPU.

Everything, except obvious GPU, should be explained. GMU is not really
that obvious:
https://en.wikipedia.org/wiki/GMU

> 
>>
>>> +          not be present for some OPPs and GMU will disable ACD while
>>
>> acd or ACD?
> 
> should be uppercase everywhere in description.
> 
>>
>>> +          transitioning to that OPP.
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +
>>> +    required:
>>> +      - opp-hz
>>> +      - opp-level
>>> +
>>> +required:
>>> +  - compatible
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +
>>
>> Drop blank line
>>
>>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>>> +
>>> +    gpu_opp_table: opp-table {
>>> +        compatible = "operating-points-v2-adreno";
>>> +
>>> +        opp-550000000 {
>>> +                opp-hz = /bits/ 64 <550000000>;
>>> +                opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>>> +                opp-peak-kBps = <6074219>;
>>> +                qcom,opp-acd-level = <0xc0285ffd>;
>>> +        };
>>> +
>>> +        opp-390000000 {
>>> +                opp-hz = /bits/ 64 <390000000>;
>>> +                opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>>> +                opp-peak-kBps = <3000000>;
>>> +                qcom,opp-acd-level = <0xc0285ffd>;
>>
>> That's the same value used everywhere. What's the point? Just encode it
>> in the driver.
> 
> I will update this to keep a different value. In a real implmentation,
> these values may vary between OPPs. For eg:, please check the DT patch
> in this series:
> 
> https://patchwork.freedesktop.org/patch/619413/

OK. I still have concerns that it is just some magic hex value. Which
looks exactly how downstream code. No explanation, no meaning: neither
in property description nor in actual value (at least I could not spot it).

And why this is hex? Unit of "level" is either some logical meaning,
like "high" or "low", or some unit, e.g. Hertz or kBps. None of them are
hex values in real world.

Best regards,
Krzysztof

