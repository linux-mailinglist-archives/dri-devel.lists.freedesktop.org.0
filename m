Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE0BAE8304
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 14:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C28310E701;
	Wed, 25 Jun 2025 12:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="WnPJvUam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A242810E701
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 12:45:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250625124523euoutp01b942a0d38f19ac51e18b478d23996b82~MSdJl6Ina1094810948euoutp01R
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 12:45:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250625124523euoutp01b942a0d38f19ac51e18b478d23996b82~MSdJl6Ina1094810948euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750855523;
 bh=li13uomVIBNy/2kXVMydN0UNjlz7j3CE3FoJs7BtxsE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=WnPJvUamiquioaZ6cdfiTIA1RJPVBBRed/gTb61NfY9zxn5QZUq41j7BxlqjoxICP
 g5YLmDLenLnke7L2prZ0ylrCyngQjzdulyKDaPEIRBx6Hg+izjfspun1deuO7OjtQY
 SSBEqreBHxqjhIIsv2vv68gIXUwAFqZXmpQwiQ1k=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250625124522eucas1p20e5ac7f9f29dd397d16647c341b886ce~MSdIqCv4c2367423674eucas1p2m;
 Wed, 25 Jun 2025 12:45:22 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250625124521eusmtip23e10383c21022da7c38afee3b97fd9aa~MSdHo9v8m1900619006eusmtip2m;
 Wed, 25 Jun 2025 12:45:21 +0000 (GMT)
Message-ID: <d154d2d0-3d59-4176-a8fb-3cb754cf2734@samsung.com>
Date: Wed, 25 Jun 2025 14:45:20 +0200
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
In-Reply-To: <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250625124522eucas1p20e5ac7f9f29dd397d16647c341b886ce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250623114436eucas1p1ab8455b32937a472f5f656086e38f428
X-EPHeader: CA
X-CMS-RootMailID: 20250623114436eucas1p1ab8455b32937a472f5f656086e38f428
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
 <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
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



On 6/24/25 15:53, Matt Coster wrote:
> On 23/06/2025 12:42, Michal Wilczynski wrote:
>> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's
>> specific GPU compatible string.
>>
>> The thead,th1520-gpu compatible, along with its full chain
>> img,img-bxm-4-64, and img,img-rogue, is added to the
>> list of recognized GPU types.
>>
>> The power-domains property requirement for img,img-bxm-4-64 is also
>> ensured by adding it to the relevant allOf condition.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..9b241a0c1f5941dc58a1e23970f6d3773d427c22 100644
>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -21,6 +21,11 @@ properties:
>>            # work with newer dts.
>>            - const: img,img-axe
>>            - const: img,img-rogue
>> +      - items:
>> +          - enum:
>> +              - thead,th1520-gpu
>> +          - const: img,img-bxm-4-64
>> +          - const: img,img-rogue
>>        - items:
>>            - enum:
>>                - ti,j721s2-gpu
>> @@ -93,7 +98,9 @@ allOf:
>>        properties:
>>          compatible:
>>            contains:
>> -            const: img,img-axe-1-16m
>> +            enum:
>> +              - img,img-axe-1-16m
>> +              - img,img-bxm-4-64
> 
> This isn't right – BXM-4-64 has two power domains like BXS-4-64. I don't
> really know what the right way to handle that in devicetree is given the
> TH1520 appears to expose only a top-level domain for the entire GPU, but
> there are definitely two separate domains underneath that as far as the
> GPU is concerned (see the attached snippet from integration guide).
> 
> Since power nodes are ref-counted anyway, do we just use the same node
> for both domains and let the driver up/down-count it twice?

Hi Matt,

Thanks for the very helpful insight. That's a great point, it seems the
SoC's design presents a tricky case for the bindings.

I see what you mean about potentially using the same power domain node
twice. My only hesitation is that it might be a bit unclear for someone
reading the devicetree later. Perhaps another option could be to relax
the constraint for this compatible?

Krzysztof, we'd be grateful for your thoughts on how to best model this
situation.

> 
> Cheers,
> Matt
> 
>>      then:
>>        properties:
>>          power-domains:
>>
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
