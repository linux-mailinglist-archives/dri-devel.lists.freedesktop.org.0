Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1508B3C7FD5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 10:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E17E6E194;
	Wed, 14 Jul 2021 08:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3CD6E194
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 08:13:08 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623] (unknown
 [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 516A11F42B01;
 Wed, 14 Jul 2021 09:13:06 +0100 (BST)
Subject: Re: [PATCH v6 01/11] dt-binding: mediatek: Get rid of mediatek, larb
 for multimedia HW
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <20210714025626.5528-2-yong.wu@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <56885a72-9130-c6be-e9e5-cb4755ff0827@collabora.com>
Date: Wed, 14 Jul 2021 10:13:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714025626.5528-2-yong.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Xia Jiang <xia.jiang@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 ming-fan.chen@mediatek.com, Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
thanks for the patch

On 14.07.21 04:56, Yong Wu wrote:
> After adding device_link between the consumer with the smi-larbs,
> if the consumer call its owner pm_runtime_get(_sync), the
> pm_runtime_get(_sync) of smi-larb and smi-common will be called
> automatically. Thus, the consumer don't need the property.
> 
> And IOMMU also know which larb this consumer connects with from
> iommu id in the "iommus=" property.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> ---
>   .../bindings/display/mediatek/mediatek,disp.txt          | 9 ---------
>   .../devicetree/bindings/media/mediatek-jpeg-decoder.yaml | 9 ---------
>   .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml | 9 ---------

On which repo are these patches based on ?
In linux-next the file mediatek-jpeg-encoder.yaml don't exist

Thanks,
Dafna

>   Documentation/devicetree/bindings/media/mediatek-mdp.txt | 8 --------
>   .../devicetree/bindings/media/mediatek-vcodec.txt        | 4 ----
>   5 files changed, 39 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index fbb59c9ddda6..867bd82e2f03 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -61,8 +61,6 @@ Required properties (DMA function blocks):
>   	"mediatek,<chip>-disp-rdma"
>   	"mediatek,<chip>-disp-wdma"
>     the supported chips are mt2701, mt8167 and mt8173.
> -- larb: Should contain a phandle pointing to the local arbiter device as defined
> -  in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
>   - iommus: Should point to the respective IOMMU block with master port as
>     argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>     for details.
> @@ -91,7 +89,6 @@ ovl0: ovl@1400c000 {
>   	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   	clocks = <&mmsys CLK_MM_DISP_OVL0>;
>   	iommus = <&iommu M4U_PORT_DISP_OVL0>;
> -	mediatek,larb = <&larb0>;
>   };
>   
>   ovl1: ovl@1400d000 {
> @@ -101,7 +98,6 @@ ovl1: ovl@1400d000 {
>   	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   	clocks = <&mmsys CLK_MM_DISP_OVL1>;
>   	iommus = <&iommu M4U_PORT_DISP_OVL1>;
> -	mediatek,larb = <&larb4>;
>   };
>   
>   rdma0: rdma@1400e000 {
> @@ -111,7 +107,6 @@ rdma0: rdma@1400e000 {
>   	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   	clocks = <&mmsys CLK_MM_DISP_RDMA0>;
>   	iommus = <&iommu M4U_PORT_DISP_RDMA0>;
> -	mediatek,larb = <&larb0>;
>   	mediatek,rdma-fifosize = <8192>;
>   };
>   
> @@ -122,7 +117,6 @@ rdma1: rdma@1400f000 {
>   	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   	clocks = <&mmsys CLK_MM_DISP_RDMA1>;
>   	iommus = <&iommu M4U_PORT_DISP_RDMA1>;
> -	mediatek,larb = <&larb4>;
>   };
>   
>   rdma2: rdma@14010000 {
> @@ -132,7 +126,6 @@ rdma2: rdma@14010000 {
>   	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   	clocks = <&mmsys CLK_MM_DISP_RDMA2>;
>   	iommus = <&iommu M4U_PORT_DISP_RDMA2>;
> -	mediatek,larb = <&larb4>;
>   };
>   
>   wdma0: wdma@14011000 {
> @@ -142,7 +135,6 @@ wdma0: wdma@14011000 {
>   	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   	clocks = <&mmsys CLK_MM_DISP_WDMA0>;
>   	iommus = <&iommu M4U_PORT_DISP_WDMA0>;
> -	mediatek,larb = <&larb0>;
>   };
>   
>   wdma1: wdma@14012000 {
> @@ -152,7 +144,6 @@ wdma1: wdma@14012000 {
>   	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   	clocks = <&mmsys CLK_MM_DISP_WDMA1>;
>   	iommus = <&iommu M4U_PORT_DISP_WDMA1>;
> -	mediatek,larb = <&larb4>;
>   };
>   
>   color0: color@14013000 {
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index 9b87f036f178..052e752157b4 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -42,13 +42,6 @@ properties:
>     power-domains:
>       maxItems: 1
>   
> -  mediatek,larb:
> -    $ref: '/schemas/types.yaml#/definitions/phandle'
> -    description: |
> -      Must contain the local arbiters in the current Socs, see
> -      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> -      for details.
> -
>     iommus:
>       maxItems: 2
>       description: |
> @@ -63,7 +56,6 @@ required:
>     - clocks
>     - clock-names
>     - power-domains
> -  - mediatek,larb
>     - iommus
>   
>   additionalProperties: false
> @@ -83,7 +75,6 @@ examples:
>         clock-names = "jpgdec-smi",
>                       "jpgdec";
>         power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> -      mediatek,larb = <&larb2>;
>         iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
>                  <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
>       };
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> index fcd9b829e036..8bfdfdfaba59 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> @@ -35,13 +35,6 @@ properties:
>     power-domains:
>       maxItems: 1
>   
> -  mediatek,larb:
> -    $ref: '/schemas/types.yaml#/definitions/phandle'
> -    description: |
> -      Must contain the local arbiters in the current Socs, see
> -      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> -      for details.
> -
>     iommus:
>       maxItems: 2
>       description: |
> @@ -56,7 +49,6 @@ required:
>     - clocks
>     - clock-names
>     - power-domains
> -  - mediatek,larb
>     - iommus
>   
>   additionalProperties: false
> @@ -75,7 +67,6 @@ examples:
>         clocks =  <&imgsys CLK_IMG_VENC>;
>         clock-names = "jpgenc";
>         power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> -      mediatek,larb = <&larb2>;
>         iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
>                  <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
>       };
> diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
> index caa24943da33..53ef26e2c857 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
> @@ -27,9 +27,6 @@ Required properties (DMA function blocks, child node):
>   - iommus: should point to the respective IOMMU block with master port as
>     argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>     for details.
> -- mediatek,larb: must contain the local arbiters in the current Socs, see
> -  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> -  for details.
>   
>   Example:
>   	mdp_rdma0: rdma@14001000 {
> @@ -40,7 +37,6 @@ Example:
>   			 <&mmsys CLK_MM_MUTEX_32K>;
>   		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   		iommus = <&iommu M4U_PORT_MDP_RDMA0>;
> -		mediatek,larb = <&larb0>;
>   		mediatek,vpu = <&vpu>;
>   	};
>   
> @@ -51,7 +47,6 @@ Example:
>   			 <&mmsys CLK_MM_MUTEX_32K>;
>   		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   		iommus = <&iommu M4U_PORT_MDP_RDMA1>;
> -		mediatek,larb = <&larb4>;
>   	};
>   
>   	mdp_rsz0: rsz@14003000 {
> @@ -81,7 +76,6 @@ Example:
>   		clocks = <&mmsys CLK_MM_MDP_WDMA>;
>   		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   		iommus = <&iommu M4U_PORT_MDP_WDMA>;
> -		mediatek,larb = <&larb0>;
>   	};
>   
>   	mdp_wrot0: wrot@14007000 {
> @@ -90,7 +84,6 @@ Example:
>   		clocks = <&mmsys CLK_MM_MDP_WROT0>;
>   		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   		iommus = <&iommu M4U_PORT_MDP_WROT0>;
> -		mediatek,larb = <&larb0>;
>   	};
>   
>   	mdp_wrot1: wrot@14008000 {
> @@ -99,5 +92,4 @@ Example:
>   		clocks = <&mmsys CLK_MM_MDP_WROT1>;
>   		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   		iommus = <&iommu M4U_PORT_MDP_WROT1>;
> -		mediatek,larb = <&larb4>;
>   	};
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index ad1321e5a22d..71237355cc7e 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -13,7 +13,6 @@ Required properties:
>   - reg : Physical base address of the video codec registers and length of
>     memory mapped region.
>   - interrupts : interrupt number to the cpu.
> -- mediatek,larb : must contain the local arbiters in the current Socs.
>   - clocks : list of clock specifiers, corresponding to entries in
>     the clock-names property.
>   - clock-names: avc encoder must contain "venc_sel", vp8 encoder must
> @@ -46,7 +45,6 @@ vcodec_dec: vcodec@16000000 {
>             <0 0x16027800 0 0x800>,   /*VP8_VL*/
>             <0 0x16028400 0 0x400>;   /*VP9_VD*/
>       interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
> -    mediatek,larb = <&larb1>;
>       iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
>                <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
>                <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
> @@ -99,7 +97,6 @@ vcodec_enc_avc: vcodec@18002000 {
>                <&iommu M4U_PORT_VENC_REF_CHROMA>,
>                <&iommu M4U_PORT_VENC_NBM_RDMA>,
>                <&iommu M4U_PORT_VENC_NBM_WDMA>;
> -    mediatek,larb = <&larb3>;
>       mediatek,vpu = <&vpu>;
>       clocks = <&topckgen CLK_TOP_VENC_SEL>;
>       clock-names = "venc_sel";
> @@ -120,7 +117,6 @@ vcodec_enc_vp8: vcodec@19002000 {
>                <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
>                <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
>                <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> -    mediatek,larb = <&larb5>;
>       mediatek,vpu = <&vpu>;
>       clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
>       clock-names = "venc_lt_sel";
> 
