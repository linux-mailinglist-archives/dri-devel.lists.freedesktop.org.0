Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A921534BEC
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 10:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D8810F055;
	Thu, 26 May 2022 08:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 32C7D10ED44
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 08:49:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EFF51474;
 Thu, 26 May 2022 01:49:18 -0700 (PDT)
Received: from [10.1.37.22] (e122027.cambridge.arm.com [10.1.37.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2930D3F70D;
 Thu, 26 May 2022 01:49:14 -0700 (PDT)
Message-ID: <226e48d3-5772-bed5-443b-db9acd1365b8@arm.com>
Date: Thu, 26 May 2022 09:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/9] dt-bindings: Add compatible for Mali Valhall (JM)
Content-Language: en-GB
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
 <20220525145754.25866-2-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220525145754.25866-2-alyssa.rosenzweig@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/05/2022 15:57, Alyssa Rosenzweig wrote:
> From the kernel's perspective, (pre-CSF, "Job Manager") Valhall is more
> or less compatible with Bifrost, although they differ to userspace. Add
> a compatible for Valhall to the existing Bifrost bindings documentation.
> 
> As the first SoC with a Valhall GPU receiving mainline support, add a
> specific compatible for the MediaTek MT8192, which instantiates a
> Mali-G57.
> 
> v2: Change compatible to arm,mali-valhall-jm (Daniel Stone).
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> CC: devicetree@vger.kernel.org

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++--------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 85f8d4764740..78964c140b46 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -14,16 +14,21 @@ properties:
>      pattern: '^gpu@[a-f0-9]+$'
>  
>    compatible:
> -    items:
> -      - enum:
> -          - amlogic,meson-g12a-mali
> -          - mediatek,mt8183-mali
> -          - realtek,rtd1619-mali
> -          - renesas,r9a07g044-mali
> -          - renesas,r9a07g054-mali
> -          - rockchip,px30-mali
> -          - rockchip,rk3568-mali
> -      - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,meson-g12a-mali
> +              - mediatek,mt8183-mali
> +              - realtek,rtd1619-mali
> +              - renesas,r9a07g044-mali
> +              - renesas,r9a07g054-mali
> +              - rockchip,px30-mali
> +              - rockchip,rk3568-mali
> +          - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> +      - items:
> +          - enum:
> +              - mediatek,mt8192-mali
> +          - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
>  
>    reg:
>      maxItems: 1

