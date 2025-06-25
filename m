Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294ACAE86CA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 16:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508AF10E73D;
	Wed, 25 Jun 2025 14:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RPTkFSpG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA01310E73D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 14:41:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C989760010;
 Wed, 25 Jun 2025 14:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3CAC4CEEA;
 Wed, 25 Jun 2025 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750862497;
 bh=G6puNagQFSMyUjbE+LIXearsZJYWlEPDrvFoYitM1po=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RPTkFSpGXwsznlbnK1kUH0xY734FEMB9huWys+Ev9Cd+4RJT8ipohTvGXg1+rNrW2
 xZXfCYR8VgiqpycgDQJU81jj7xQmtcM7lUCtaXdTKEsFK07SBk0DaA58xdjAtQT/0f
 ErLdmRUotPrLCgcHkamQUiCRjkBx+tzhoSM6XbZ0szoBmgSrosAW8TAg6NPWKtKGyR
 7BtssmQmLb903HrvtT6vIoSUszrN5gfh8b46F9KOoPTmVlI1Rg8AbfNLeSEmq4iE5o
 wyhdS1BfCk4M1YjE+no4eesqtrBibQTlgAk4QmmTo/CGP2ZO4DNpPZontcAgGNLi4O
 gq/YUuVWNzbWQ==
Message-ID: <27068fd3-92b5-402b-9f3c-fd786db56668@kernel.org>
Date: Wed, 25 Jun 2025 16:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Matt Coster <Matt.Coster@imgtec.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
 <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
 <d154d2d0-3d59-4176-a8fb-3cb754cf2734@samsung.com>
 <e1a3d854-93bc-4771-9b8e-1639ca57b687@kernel.org>
 <d12fd4fb-0adb-40c4-8a0a-c685cd6327b3@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <d12fd4fb-0adb-40c4-8a0a-c685cd6327b3@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 25/06/2025 16:18, Michal Wilczynski wrote:
> 
> 
> On 6/25/25 15:55, Krzysztof Kozlowski wrote:
>> On 25/06/2025 14:45, Michal Wilczynski wrote:
>>>
>>>
>>> On 6/24/25 15:53, Matt Coster wrote:
>>>> On 23/06/2025 12:42, Michal Wilczynski wrote:
>>>>> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's
>>>>> specific GPU compatible string.
>>>>>
>>>>> The thead,th1520-gpu compatible, along with its full chain
>>>>> img,img-bxm-4-64, and img,img-rogue, is added to the
>>>>> list of recognized GPU types.
>>>>>
>>>>> The power-domains property requirement for img,img-bxm-4-64 is also
>>>>> ensured by adding it to the relevant allOf condition.
>>>>>
>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>>>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 9 ++++++++-
>>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>>> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..9b241a0c1f5941dc58a1e23970f6d3773d427c22 100644
>>>>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>>> @@ -21,6 +21,11 @@ properties:
>>>>>            # work with newer dts.
>>>>>            - const: img,img-axe
>>>>>            - const: img,img-rogue
>>>>> +      - items:
>>>>> +          - enum:
>>>>> +              - thead,th1520-gpu
>>>>> +          - const: img,img-bxm-4-64
>>>>> +          - const: img,img-rogue
>>>>>        - items:
>>>>>            - enum:
>>>>>                - ti,j721s2-gpu
>>>>> @@ -93,7 +98,9 @@ allOf:
>>>>>        properties:
>>>>>          compatible:
>>>>>            contains:
>>>>> -            const: img,img-axe-1-16m
>>>>> +            enum:
>>>>> +              - img,img-axe-1-16m
>>>>> +              - img,img-bxm-4-64
>>>>
>>>> This isn't right – BXM-4-64 has two power domains like BXS-4-64. I don't
>>>> really know what the right way to handle that in devicetree is given the
>>>> TH1520 appears to expose only a top-level domain for the entire GPU, but
>>>> there are definitely two separate domains underneath that as far as the
>>>> GPU is concerned (see the attached snippet from integration guide).
>>>>
>>>> Since power nodes are ref-counted anyway, do we just use the same node
>>>> for both domains and let the driver up/down-count it twice?
>>>
>>> Hi Matt,
>>>
>>> Thanks for the very helpful insight. That's a great point, it seems the
>>> SoC's design presents a tricky case for the bindings.
>>>
>>> I see what you mean about potentially using the same power domain node
>>> twice. My only hesitation is that it might be a bit unclear for someone
>>> reading the devicetree later. Perhaps another option could be to relax
>>> the constraint for this compatible?
>>>
>>> Krzysztof, we'd be grateful for your thoughts on how to best model this
>>> situation.
>>
>>
>> It's your hardware, you should tell us, not me. I don't know how many
>> power domains you have there, but for sure it is not one AND two domains
>> the same time. It is either one or two, because power domains are not
>> the same as regulator supplies.
> 
> Hi Krzysztof, Matt,
> 
> The img,bxm-4-64 GPU IP itself is designed with two separate power
> domains. The TH1520 SoC, which integrates this GPU, wires both of these
> to a single OS controllable power gate (controlled via mailbox and E902
> co-processor).

This helps... and also sounds a lot like regulator supplies, not power
domains. :/

> 
> This means a devicetree for the TH1520 can only ever provide one power
> domain for the GPU. However, a generic binding for img,bxm-4-64 should

If this was a supply, you would have two supplies. Anyway internal
wirings of GPU do not matter in such case and more important what the
SoC has wired. And it has one power domain.


> account for a future SoC that might implement both power domains.
> 
> That's why I proposed to relax the constraints on the img,bmx-4-64 GPU.

This should be constrained per each device, so 1 for you and 2 for
everyone else.

Best regards,
Krzysztof
