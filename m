Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38693B0FA41
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 20:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B27710E08C;
	Wed, 23 Jul 2025 18:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Eoi0yhoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E3010E08C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 18:25:26 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250723182524euoutp02444e698db138dc2787a44adbecddbc14~U9KBbpNpC1309313093euoutp02c
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 18:25:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250723182524euoutp02444e698db138dc2787a44adbecddbc14~U9KBbpNpC1309313093euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1753295124;
 bh=G6lUJBsrYso7PwE/gZWaei8bxr8s7smO7yvVENy5ZWM=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Eoi0yhoDJhygGHXhdPx4SWp+qGp7DRtgM2eSAyUAjZkjRpZj/Zxnkd+teGujPpUSs
 /BJUadrrmfQXFsq0AhNuTEPXIRbf613uCcGWQzC9rvL+qoiPTx467N3dyEftJXywub
 LN4ffyCTLdxXUzX24A1kuDF+jJc4nDp+otxwCBnM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250723182523eucas1p220449ccef4d32615f84483b37faff727~U9KAiikNS1921119211eucas1p2c;
 Wed, 23 Jul 2025 18:25:23 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250723182522eusmtip1bed061c359b01d486f01c16f2257ca7c~U9J-SKJbB3063330633eusmtip1Q;
 Wed, 23 Jul 2025 18:25:22 +0000 (GMT)
Message-ID: <07410f0c-8369-4683-9143-c79c6cb3f5b0@samsung.com>
Date: Wed, 23 Jul 2025 20:25:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
To: Matt Coster <Matt.Coster@imgtec.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, Frank
 Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <9c4f962d-6877-4a53-b0f3-218930f94e1e@imgtec.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250723182523eucas1p220449ccef4d32615f84483b37faff727
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250623114436eucas1p1ab8455b32937a472f5f656086e38f428
X-EPHeader: CA
X-CMS-RootMailID: 20250623114436eucas1p1ab8455b32937a472f5f656086e38f428
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
 <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
 <d154d2d0-3d59-4176-a8fb-3cb754cf2734@samsung.com>
 <e1a3d854-93bc-4771-9b8e-1639ca57b687@kernel.org>
 <d12fd4fb-0adb-40c4-8a0a-c685cd6327b3@samsung.com>
 <27068fd3-92b5-402b-9f3c-fd786db56668@kernel.org>
 <f25c1e7f-bef2-47b1-8fa8-14c9c51087a8@imgtec.com>
 <491b69ce-5a2f-4df1-95af-9318bbe6c9b0@samsung.com>
 <9c4f962d-6877-4a53-b0f3-218930f94e1e@imgtec.com>
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



On 7/23/25 18:50, Matt Coster wrote:
> On 23/07/2025 17:26, Michal Wilczynski wrote:
>> On 7/23/25 11:45, Matt Coster wrote:
>>> On 25/06/2025 15:41, Krzysztof Kozlowski wrote:
>>>> On 25/06/2025 16:18, Michal Wilczynski wrote:
>>>>>
>>>>>
>>>>> On 6/25/25 15:55, Krzysztof Kozlowski wrote:
>>>>>> On 25/06/2025 14:45, Michal Wilczynski wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 6/24/25 15:53, Matt Coster wrote:
>>>>>>>> On 23/06/2025 12:42, Michal Wilczynski wrote:
>>>>>>>>> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's
>>>>>>>>> specific GPU compatible string.
>>>>>>>>>
>>>>>>>>> The thead,th1520-gpu compatible, along with its full chain
>>>>>>>>> img,img-bxm-4-64, and img,img-rogue, is added to the
>>>>>>>>> list of recognized GPU types.
>>>>>>>>>
>>>>>>>>> The power-domains property requirement for img,img-bxm-4-64 is also
>>>>>>>>> ensured by adding it to the relevant allOf condition.
>>>>>>>>>
>>>>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>>>>>>>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>>>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>>>>>>>> ---
>>>>>>>>>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 9 ++++++++-
>>>>>>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>>>>>>> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..9b241a0c1f5941dc58a1e23970f6d3773d427c22 100644
>>>>>>>>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>>>>>>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>>>>>>> @@ -21,6 +21,11 @@ properties:
>>>>>>>>>            # work with newer dts.
>>>>>>>>>            - const: img,img-axe
>>>>>>>>>            - const: img,img-rogue
>>>>>>>>> +      - items:
>>>>>>>>> +          - enum:
>>>>>>>>> +              - thead,th1520-gpu
>>>>>>>>> +          - const: img,img-bxm-4-64
>>>>>>>>> +          - const: img,img-rogue
>>>>>>>>>        - items:
>>>>>>>>>            - enum:
>>>>>>>>>                - ti,j721s2-gpu
>>>>>>>>> @@ -93,7 +98,9 @@ allOf:
>>>>>>>>>        properties:
>>>>>>>>>          compatible:
>>>>>>>>>            contains:
>>>>>>>>> -            const: img,img-axe-1-16m
>>>>>>>>> +            enum:
>>>>>>>>> +              - img,img-axe-1-16m
>>>>>>>>> +              - img,img-bxm-4-64
>>>>>>>>
>>>>>>>> This isn't right – BXM-4-64 has two power domains like BXS-4-64. I don't
>>>>>>>> really know what the right way to handle that in devicetree is given the
>>>>>>>> TH1520 appears to expose only a top-level domain for the entire GPU, but
>>>>>>>> there are definitely two separate domains underneath that as far as the
>>>>>>>> GPU is concerned (see the attached snippet from integration guide).
>>>>>>>>
>>>>>>>> Since power nodes are ref-counted anyway, do we just use the same node
>>>>>>>> for both domains and let the driver up/down-count it twice?
>>>>>>>
>>>>>>> Hi Matt,
>>>>>>>
>>>>>>> Thanks for the very helpful insight. That's a great point, it seems the
>>>>>>> SoC's design presents a tricky case for the bindings.
>>>>>>>
>>>>>>> I see what you mean about potentially using the same power domain node
>>>>>>> twice. My only hesitation is that it might be a bit unclear for someone
>>>>>>> reading the devicetree later. Perhaps another option could be to relax
>>>>>>> the constraint for this compatible?
>>>>>>>
>>>>>>> Krzysztof, we'd be grateful for your thoughts on how to best model this
>>>>>>> situation.
>>>>>>
>>>>>>
>>>>>> It's your hardware, you should tell us, not me. I don't know how many
>>>>>> power domains you have there, but for sure it is not one AND two domains
>>>>>> the same time. It is either one or two, because power domains are not
>>>>>> the same as regulator supplies.
>>>>>
>>>>> Hi Krzysztof, Matt,
>>>>>
>>>>> The img,bxm-4-64 GPU IP itself is designed with two separate power
>>>>> domains. The TH1520 SoC, which integrates this GPU, wires both of these
>>>>> to a single OS controllable power gate (controlled via mailbox and E902
>>>>> co-processor).
>>>>
>>>> This helps... and also sounds a lot like regulator supplies, not power
>>>> domains. :/
>>>
>>> Apologies for taking so long to get back to you with this, I wanted to
>>> make sure I had the whole picture from our side before commenting again.
>>>
>>> From the GPU side, a "typical" integration of BXM-4-64 would use two
>>> power domains.
>>>
>>> Typically, these domains exist in silicon, regardless of whether they
>>> are exposed to the host OS, because the SoC's power controller must have
>>> control over them. As part of normal operation, the GPU firmware (always
>>> in domain "a" on Rogue) will request the power-up/down of the other
>>> domains, including during the initial boot sequence. This all happens
>>> transparently to the OS. The GPU block itself has no power gating at
>>> that level, it relies entirely on the SoC integration.
>>>
>>> However, it turns out (unknown to me until very recently) that this
>>> functionality is optional. The integrator can opt to forego the
>>> power-saving functionality afforded by firmware-controlled power gating
>>> and just throw everything into a single domain, which appears to be
>>> what's happened here.
>>>
>>> My only remaining issue here, then, is the naming. Since this
>>> integration doesn't use discrete domains, saying it has one domain
>>> called "a" isn't correct*. We should either:
>>>
>>>  - Drop the name altogether for this integration (and others like it
>>>    that don't use the low-power functionality, if there are any), or
>>
>> Hi Matt,
>>
>> Thanks for the detailed explanation, that clears things up perfectly.
> 
> I'm glad I could get to the bottom of this one, it was bothering me too!
> 
>>
>> I agree with your assessment. Dropping the power-domain-names property
>> for this integration seems like the cleanest solution. As you pointed
>> out, since the OS sees only a single, undifferentiated power domain,
>> giving it a name like "gpu" would be redundant. This approach correctly
>> models the hardware without setting a potentially confusing precedent.
> 
> That seems reasonable. I was very much on the fence for this one, so
> I'll happily go along with dropping the name altogether.
> 
> Just to make sure I understand correctly, the change here would be to
> move "required: - power-domain-names" from "img,img-rogue" to every
> conditional block that constrains the number of domains?
> 
> Can we add negative constraints in conditionals? Then we could add
> "power-domain-names: false" to the "thead,th1520-gpu" conditional block
> alongside "power-domains: maxItems: 1".

Yeah the diff with v7 would look like so:
diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 263c40c8438e..338746f39cbb 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -89,6 +89,11 @@ allOf:
         compatible:
           contains:
             const: img,img-rogue
+      not:
+        properties:
+          compatible:
+            contains:
+              const: thead,th1520-gpu
     then:
       required:
         - power-domains
@@ -100,11 +105,12 @@ allOf:
           contains:
             const: thead,th1520-gpu
     then:
+      required:
+        - power-domains
       properties:
         power-domains:
           maxItems: 1
-        power-domain-names:
-          maxItems: 1
+        power-domain-names: false
 
   - if:
       properties:


This change ensures power-domain-names is required for all img,img-rogue
devices, except for thead,th1520-gpu. For the thead specifically,
power-domains remains required, but power-domain-names is explicitly
forbidden.

> 
>>
>> To follow through on this, I assume we'll need to adjust
>> pvr_power_domains_init() to handle nodes that don't have the
>> power-domain-names property. Does that sound right to you?
> 
> You should get away without making any code changes here, since we
> already shortcut on "domain_count <= 1" to just allow the pm_runtime to
> deal with the single (or missing) domain directly.

Great !

> 
> If we ever start controlling the individual domains ourselves from the
> kernel (rather than just ensuring they all come on and off in the
> correct sequence), we can add checks/handling for the no-name case then.
> 
> Cheers,
> Matt
> 
>>
>>>  - Come up with a new domain name to signal this explicitly (perhaps
>>>    simply "gpu")? Something that's unlikely to clash with the "real"
>>>    names that are going to start appearing in the Volcanic bindings
>>>    (where we finally ditched "a", "b", etc.).
>>>
>>> Cheers,
>>> Matt
>>>
>>> *Yes, I know that's what we said for the AXE-1-16M, but that tiny GPU is
>>> the exception to the rule; AFAIK it's the only one we've ever produced
>>> that truly has only one power domain.
>>>
>>>>
>>>>>
>>>>> This means a devicetree for the TH1520 can only ever provide one power
>>>>> domain for the GPU. However, a generic binding for img,bxm-4-64 should
>>>>
>>>> If this was a supply, you would have two supplies. Anyway internal
>>>> wirings of GPU do not matter in such case and more important what the
>>>> SoC has wired. And it has one power domain.
>>>>
>>>>
>>>>> account for a future SoC that might implement both power domains.
>>>>>
>>>>> That's why I proposed to relax the constraints on the img,bmx-4-64 GPU.
>>>>
>>>> This should be constrained per each device, so 1 for you and 2 for
>>>> everyone else.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>>
>>
>> Best regards,
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
