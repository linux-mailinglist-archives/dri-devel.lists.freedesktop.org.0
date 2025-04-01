Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF97BA780C6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 18:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A9E10E628;
	Tue,  1 Apr 2025 16:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="eDI49ygt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593AA10E628
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 16:45:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250401164534euoutp0269e183ad684b43ea27d08e7f5bc1b55a~yP5lyeGmd1862218622euoutp02L
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 16:45:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250401164534euoutp0269e183ad684b43ea27d08e7f5bc1b55a~yP5lyeGmd1862218622euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1743525934;
 bh=Du8cCR/sSoRf9rcgO+pEyuLkob3npJUMn2Zdq/2m35Y=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=eDI49ygtc4ET/2jwW0/2sPXZM0iaB6W4wILNPTLDkg8WbgxVk7h6t/O9OumvfzYqM
 C26tYbnG/Ki25PGCMClThCdiZ+jpWVZAphVWUsGfoNyKP7UpKahoGZ6k4MHRLlvZ1l
 wLmGIc6Z5lNmnYQZg8bkgR/Ji2FmGdNuriql/4yY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250401164533eucas1p2e13c79cd7be796d91c5ac2dbd00652ec~yP5lbJE652058120581eucas1p2Z;
 Tue,  1 Apr 2025 16:45:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id D6.4D.20397.D281CE76; Tue,  1
 Apr 2025 17:45:33 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250401164532eucas1p12733b49f77201419ad208931bd8bbaee~yP5kuU7FM0420604206eucas1p1r;
 Tue,  1 Apr 2025 16:45:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250401164532eusmtrp2c5b611f960b39ac9ed7d3470861d6235~yP5ktimqz2743327433eusmtrp2q;
 Tue,  1 Apr 2025 16:45:32 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-17-67ec182dd26d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CF.2D.19654.C281CE76; Tue,  1
 Apr 2025 17:45:32 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250401164531eusmtip189b291997140378de0a617b6bf7a559f~yP5jwXRGe2785927859eusmtip1G;
 Tue,  1 Apr 2025 16:45:31 +0000 (GMT)
Message-ID: <a9716af2-2403-44a4-b1a7-c3ab832c3c1c@samsung.com>
Date: Tue, 1 Apr 2025 18:45:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
To: Matt Coster <matt.coster@imgtec.com>, Frank Binns
 <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Randolph
 Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250326-sets-bxs-4-64-patch-v1-v5-1-e4c46e8280a9@imgtec.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOKsWRmVeSWpSXmKPExsWy7djP87q6Em/SDU5NV7Q4cX0Rk8WBV2uY
 Lb4/bWO2WLP3HJPFxBVeFvOPnGO1uPL1PZvFuqcX2C2Wf57NbvFy1j02i02Pr7FaXN41h81i
 4cetLBZLduxitGjrXMZq8ebHWSaL/3t2sFt09Nxks5j9bj+7xZY3E1kt/p/9wO4g6rH32wIW
 j52z7rJ79Ow8w+ixaVUnm8e8k4Ee97uPM3lsXlLvsfl0tcfxG9uZPD5vkgvgiuKySUnNySxL
 LdK3S+DKuH/pDWNBu2XF/Nb1LA2M+3S6GDk5JARMJFb+/8rWxcjFISSwglFi0cqbUM4XRonW
 Be9YIJzPjBIvr25jgml59u8NI4gtJLCcUeLMrTCIoreMErfuz2YFSfAK2Ek0fd8O1MDBwSKg
 InH/XTVEWFDi5MwnLCC2qIC8xP1bM9hBbGGBYIlL+16zgswREfjELLF11z4wh1lgAZNE48d7
 YJuZBcQlbj2ZD2azCRhJPFg+H2wZp4C3xPUXLSwQNfISzVtnM4M0Swi845Q4t/gtM8gVEgIu
 EnsmJUJ8ICzx6vgWdghbRuL/zvlQn+VLPNj6iRnCrpHY2XMcyraWuHPuFxvIGGYBTYn1u/Qh
 wo4S93e+ZIeYzidx460gxAV8EpO2TYdayivR0SYEUa0mMbWnF27puRXbmCYwKs1CCpVZSH6c
 heSXWQh7FzCyrGIUTy0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMm6f/Hf+6g3HFq496hxiZ
 OBgPMUpwMCuJ8EZ8fZkuxJuSWFmVWpQfX1Sak1p8iFGag0VJnHfR/tZ0IYH0xJLU7NTUgtQi
 mCwTB6dUA5P3369vFD59tyldnOL8YdERsYvqm3dvuPrakv3DQtMTHYsmVaWtKZ4r8awo3Urw
 edmV2S05XUfZuN/c/ishaTL3Hl+uwcn6l9MZbRNX3WpTmvBUoKJgbayO7BTXx+mXkmOMupZO
 KmpPyXP8q1uk4FzckX7G2Nkjf5XmKrHZVbvF21OOW9zmkn/+9OqM0Gb+lDnJWTUTdjJZBDvo
 6j8pnFq08/emhmvJGukHtObl9F9qs525caW5hj4P2wyuJFl/vSe3bv51DNdXvR+39fiVGcun
 vOUO2CIv7cKxiuP4lbawlEWB/zwcbutIzd3C63p/l8mX6poynZN8eU9nM9QFODZGCulO2Gy8
 RGCVt87y+UosxRmJhlrMRcWJAAPCYCIKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42I5/e/4XV0diTfpBvt/6lucuL6IyeLAqzXM
 Ft+ftjFbrNl7jsli4govi/lHzrFaXPn6ns1i3dML7BbLP89mt3g56x6bxabH11gtLu+aw2ax
 8ONWFoslO3YxWrR1LmO1ePPjLJPF/z072C06em6yWcx+t5/dYsubiawW/89+YHcQ9dj7bQGL
 x85Zd9k9enaeYfTYtKqTzWPeyUCP+93HmTw2L6n32Hy62uP4je1MHp83yQVwRenZFOWXlqQq
 ZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehl3L/0hrGg3bJifut6
 lgbGfTpdjJwcEgImEs/+vWHsYuTiEBJYyijx6/MDRoiEjMS17pcsELawxJ9rXWwQRa8ZJX68
 mQCW4BWwk2j6vp2pi5GDg0VAReL+u2qIsKDEyZlPwEpEBeQl7t+awQ5iCwsES1za95oVZI6I
 wBdmiY3r5jOBOMwCi5gkjt2bzwqx4T6jROeX1WBnMAuIS9x6AlLFycEmYCTxYDlIEScHp4C3
 xPUXLSwgm5kF1CXWzxOCKJeXaN46m3kCo9AsJIfMQjJpFkLHLCQdCxhZVjGKpJYW56bnFhvp
 FSfmFpfmpesl5+duYgSmim3Hfm7Zwbjy1Ue9Q4xMHIyHGCU4mJVEeCO+vkwX4k1JrKxKLcqP
 LyrNSS0+xGgKDIuJzFKiyfnAZJVXEm9oZmBqaGJmaWBqaWasJM7LduV8mpBAemJJanZqakFq
 EUwfEwenVAOTztyHpw8wf/yc4BG9JHzGJf590tvS287x5+bpGTXnRYu9O2QZWNws2s1jM4vh
 YqbXNHn75fPm+uxeYX5uVmqaTnKJtH7D2k/Tc6esfNP7tfLHUa6/on9WzPvMPqf925br/5/V
 Oi0NYKy5fWlC6xPhybz53iERuiXvzyf5s/sWvuF/unXlnZSEz79nbRDeKDzpRrzg4/wtjA8+
 LIjoMHib8ivM++E6FZmO6CbpS/t8BIzyLa5fEUi+Mb2pd9aWj+s+f7sdX6p5QXDmDhGtjb7b
 5xh/6hUwXn498Z6O1Jnyurn3n4dfX/TEIjyl9kzK89/m0zc9svVtznCNvfgpx2NRFJ9K6sZa
 o+RfNwKtTa9kK7EUZyQaajEXFScCAKm3/u6eAwAA
X-CMS-MailID: 20250401164532eucas1p12733b49f77201419ad208931bd8bbaee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250326164909eucas1p1525faf017c81554f0d3739123edc1298
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250326164909eucas1p1525faf017c81554f0d3739123edc1298
References: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
 <CGME20250326164909eucas1p1525faf017c81554f0d3739123edc1298@eucas1p1.samsung.com>
 <20250326-sets-bxs-4-64-patch-v1-v5-1-e4c46e8280a9@imgtec.com>
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



On 3/26/25 17:48, Matt Coster wrote:
> The first compatible strings added for the AXE-1-16M are not sufficient to
> accurately describe all the IMG Rogue GPUs. The current "img,img-axe"
> string refers to the entire family of Series AXE GPUs, but this is
> primarily a marketing term and does not denote a level of hardware
> similarity any greater than just "Rogue".
> 
> The more specific "img,img-axe-1-16m" string refers to individual AXE-1-16M
> GPU. For example, unlike the rest of the Series AXE GPUs, the AXE-1-16M
> only uses a single power domain.
> 
> The situation is actually slightly worse than described in the first
> paragraph, since many "series" (such as Series BXS found in the TI AM68
> among others and added later in this series) contain cores with both Rogue
> and Volcanic architectures.
> 
> Besides attempting to move away from vague groupings defined only
> by marketing terms, we want to draw a line between properties inherent to
> the IP core and choices made by the silicon vendor at integration time.
> For instance, the number of power domains is a property of the IP core,
> whereas the decision to use one or multiple clocks is a vendor one.

Hi,
We’ve had an interesting discussion on how to synchronize clock and
reset management for the T-HEAD SoC [1] with regard to the Imagination
GPU. Long story short, there is a preference to place SoC-specific
elements in the generic PM driver - however since drm/imagination driver
currently attempts to manage clocks itself, we would need to provide
some empty stubs, which does seem like an ugly solution.

I agree that a number of clocks is a vendor decision, but the clocks
doesn't have to necessarily be managed from the consumer driver. Would
you be open to a patch which makes the clock management from the
drm/imagination driver optional ? Same way I've proposed an optional
reset [2] previously.

This way if the clocks/reset are not provided, it would be assumed that
there is something SoC specific to how they're mangaged and they would
be implemented in the generic PM driver.	

Regards,
Michał

[1] - https://lore.kernel.org/all/ef17e5d1-b364-41e1-ab8b-86140cbe69b2@samsung.com/
[2] - https://lore.kernel.org/all/20250219140239.1378758-14-m.wilczynski@samsung.com/

> 
> In the original compatible strings, we must use "ti,am62-gpu" to constrain
> both of these properties since the number of power domains cannot be fixed
> for "img,img-axe".
> 
> Work is currently underway to add support for volcanic-based Imagination
> GPUs, for which bindings will be added in "img,powervr-volcanic.yaml".
> As alluded to previously, the split between rogue and volcanic cores is
> non-obvious at times, so add a generic top-level "img,img-rogue" compatible
> string here to allow for simpler differentiation in devicetrees without
> referring back to the bindings.
> 
> The currently supported GPU (AXE-1-16M) only requires a single power
> domain. Subsequent patches will add support for BXS-4-64 MC1, which has
> two power domains. Add infrastructure now to allow for this.
> 
> Also allow the dma-coherent property to be added to IMG Rogue GPUs, which
> are DMA devices. The decision for coherency is made at integration time and
> this property should be applied wherever it accurately describes the
> vendor integration.
> 
> Note that the new required properties for power domains are conditional on
> the new base compatible string to avoid an ABI break.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v5:
> - Remove extraneous (and error-causing) power-domains minItems constraint
> - Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-1-d987cf4ca439@imgtec.com
> Changes in v4:
> - Add img,img-rogue back to ti,am62-gpu compatible strings to allow
>   compatibility with older kernels
> - Revert change to power-domains property and add proper constraint
> - Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-1-143b3dbef02f@imgtec.com
> Changes in v3:
> - Remove unnecessary example
> - Remove second power domain details, add these where they're used instead
> - Avoid ABI breaks by limiting new required properties to new compatible
>   strings and making all binding changes in a single patch.
> - Links to v2:
>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-1-3fd45d9fb0cf@imgtec.com
>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-3-3fd45d9fb0cf@imgtec.com
>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-4-3fd45d9fb0cf@imgtec.com
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 43 +++++++++++++++++++---
>  1 file changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 256e252f8087fa0d6081f771a01601d34b66fe19..e1056bf2af84c3eb43733bdc91124a66aaf51d35 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -12,10 +12,23 @@ maintainers:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - ti,am62-gpu
> -      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ti,am62-gpu
> +          - const: img,img-axe-1-16m
> +          # This deprecated element must be kept around to allow old kernels to
> +          # work with newer dts.
> +          - const: img,img-axe
> +          - const: img,img-rogue
> +
> +      # This legacy combination of compatible strings was introduced early on
> +      # before the more specific GPU identifiers were used.
> +      - items:
> +          - enum:
> +              - ti,am62-gpu
> +          - const: img,img-axe
> +        deprecated: true
>  
>    reg:
>      maxItems: 1
> @@ -37,6 +50,12 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  power-domain-names:
> +    items:
> +      - const: a
> +
> +  dma-coherent: true
> +
>  required:
>    - compatible
>    - reg
> @@ -47,6 +66,18 @@ required:
>  additionalProperties: false
>  
>  allOf:
> +  # Constraints added alongside the new compatible strings that would otherwise
> +  # create an ABI break.
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: img,img-rogue
> +    then:
> +      required:
> +        - power-domains
> +        - power-domain-names
> +
>    - if:
>        properties:
>          compatible:
> @@ -64,10 +95,12 @@ examples:
>      #include <dt-bindings/soc/ti,sci_pm_domain.h>
>  
>      gpu@fd00000 {
> -        compatible = "ti,am62-gpu", "img,img-axe";
> +        compatible = "ti,am62-gpu", "img,img-axe-1-16m", "img,img-axe",
> +                     "img,img-rogue";
>          reg = <0x0fd00000 0x20000>;
>          clocks = <&k3_clks 187 0>;
>          clock-names = "core";
>          interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>          power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
> +        power-domain-names = "a";
>      };
> 
