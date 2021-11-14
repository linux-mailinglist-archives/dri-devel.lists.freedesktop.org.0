Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBA144FC19
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 23:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB7E89994;
	Sun, 14 Nov 2021 22:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7FA89994
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 22:04:35 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id v11so63126778edc.9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 14:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XGXI0pGKW9jw8ve7rtCgznIqb0N0U9eB1A1huwUMCKY=;
 b=Jg8GOdYGrH+j/Oz375DXqiyJ8UgTS/K9i745bjh5ZBTjKQ2L+7gdEcWPi+JDZwpZeD
 ogAC/RRybNFO5cvC3UK6uEc2QmVyvFoEAlXnyDH6T2GA8JmtS+H+AmSqUBSQwFn3fkj6
 3MjnzJFAmbFG3iG1cQ69oUPhc3897Fb1q0wMqiQRuf4lJ30E9Tgbftsf2Bvk7D6YjdxD
 f8h5xo7GRePI2ysrJLIrm8KHIaCejAZSs363lQADwuZeN9w1kl7wiwhuqtqiSyQ9baB+
 +6hLX9m2K7q7z8Utdne6v5GicED3Ezk26/2XG2kxissFaWulRE+M2vMzGUAoP4Ir9eId
 CB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XGXI0pGKW9jw8ve7rtCgznIqb0N0U9eB1A1huwUMCKY=;
 b=gEiIQbYHRVOXnUKco1v+TbqysoQyocc4OrD/bZqne2qXbeBGtejDD3qjfx4wd0Y+Aj
 lQlgYKT892bNrzXI/svpRC9eu5oz+Z7zTnDrJTbiXLwvJx1k2LSlo4PsidzsU3Rql+tx
 ZodjSaa+6nXIyIIrRH2yLSy2doibzKRMKI6DZJEtxwGysNUk7Iondi25skvo8lbxB23m
 CdPzCxvQyNpKgVlCS89W9AEXYzKbAP83fvXZldcLxbYDlSE3OlFTzcXQzTmXyM12GxX1
 xce3RbVSnpzmld3Ir9WzEaDw9u/SWLPiw4XTK2tsrjZUg6CFnbesHOmvDugn/12jGPo7
 2RXA==
X-Gm-Message-State: AOAM533dldoto/fdRDyCtIAUdKhXZkgHlT/2uD1HO7pcOafakeg+0SDh
 k/bONfhFG18C7BfFzsuQ8j0ucPV31+LgQ5ma8F3uzA==
X-Google-Smtp-Source: ABdhPJwJrQ10JMR83VRQsh+aHUb3E7LThFdNmZ0fTfwGv0tUuN5p8AdcBbcSDoyDQy5iHZi8U9GgRSL6LznSceCI7Ts=
X-Received: by 2002:a17:906:1c56:: with SMTP id
 l22mr18527239ejg.208.1636927474270; 
 Sun, 14 Nov 2021 14:04:34 -0800 (PST)
MIME-Version: 1.0
References: <20211111041500.17363-1-yunfei.dong@mediatek.com>
In-Reply-To: <20211111041500.17363-1-yunfei.dong@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 14 Nov 2021 19:04:22 -0300
Message-ID: <CAAEAJfDrCihxPEnV8K=Unj7ejzqgcUOrP9pZO71DYDHCtWDdVQ@mail.gmail.com>
Subject: Re: [PATCH v10,
 00/19] Support multi hardware decode using of_platform_populate
To: Yunfei Dong <yunfei.dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Fritz Koenig <frkoenig@chromium.org>,
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunfei,

On Thu, 11 Nov 2021 at 01:15, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> This series adds support for multi hardware decode into mtk-vcodec, by first adding use
> of_platform_populate to manage each hardware information: interrupt, clock, register
> bases and power. Secondly add core work queue to deal with core hardware message,
> at the same time, add msg queue for different hardware share messages. Lastly, the
> architecture of different specs are not the same, using specs type to separate them.
>
> This series has been tested with both MT8183 and MT8173. Decoding was working for both chips.
>

How are you testing Decoding? If you are running some test suite, it would
be good to add such information.

Are you testing some edge-cases such as parallel/concurrent decoding,
removing the driver while streaming, and so on? This should help catch
some typical issues.

Thanks,
Ezequiel

> Patches 1~3 rewrite get register bases and power on/off interface.
> Patches 4 export decoder pm interfaces.
> Patches 5 add to support 8192.
> Patch 6 support multi hardware.
> Patch 7 separate video encoder and decoder document
> Patch 8-17 add interfaces to support core hardware.
> Patch 18-19 remove mtk_vcodec_release_dec/enc_pm interfaces.
> ---
> changes compared with v9:
> - need not to build ko, just export pm interfaces for patch 04/19.
> - fix comments for patch 06/19
>
> changes compared with v8:
> - add new patch 18~19 to remove mtk_vcodec_release_de/enc_pm interfaces.
> - fix spelling mistakes for patch 17/19
> - fix yaml comments for patch 15/19
>
> Changes compared with v7:
> - add new patch 4 to build decoder pm file as module
> - add new patch 5 to support 8192
> - fix comments for patch 6/17
> - change some logic for using work queue instead of create thread for core hardware decode for patch 10/17
> - using work queue for hardware decode instead of create thread for patch 13/17
> - add returen value for patch 14/17
> - fix yaml check fail 15/17
>
> Changes compared with v6:
> - Use of_platform_populate to manage multi hardware, not component framework for patch 4/15
> - Re-write dtsi document for hardware architecture changed for patch 13/15 -The dtsi will write like below in patch 13/15:
>     vcodec_dec: vcodec_dec@16000000 {
>         compatible = "mediatek,mt8192-vcodec-dec";
>         #address-cells = <2>;
>         #size-cells = <2>;
>         ranges;
>         reg = <0 0x16000000 0 0x1000>;          /* VDEC_SYS */
>         mediatek,scp = <&scp>;
>         iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
>         dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
>         vcodec_lat {
>             compatible = "mediatek,mtk-vcodec-lat";
>             reg = <0 0x16010000 0 0x800>;               /* VDEC_MISC */
>             reg-name = "reg-misc";
>             interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
>             iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
>                  <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
>             clocks = <&topckgen CLK_TOP_VDEC_SEL>,
>                  <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
>                  <&vdecsys_soc CLK_VDEC_SOC_LAT>,
>                  <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
>                  <&topckgen CLK_TOP_MAINPLL_D4>;
>             clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
>                   "vdec-vdec", "vdec-top";
>             assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
>             assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
>             power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
>         };
>
>         vcodec_core {
>             compatible = "mediatek,mtk-vcodec-core";
>             reg = <0 0x16025000 0 0x1000>;              /* VDEC_CORE_MISC */
>             reg-names = "reg-misc";
>             interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
>             iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
>                  <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
>             clocks = <&topckgen CLK_TOP_VDEC_SEL>,
>                  <&vdecsys CLK_VDEC_VDEC>,
>                  <&vdecsys CLK_VDEC_LAT>,
>                  <&vdecsys CLK_VDEC_LARB1>,
>                  <&topckgen CLK_TOP_MAINPLL_D4>;
>             clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
>                   "vdec-vdec", "vdec-top";
>             assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
>             assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
>             power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
>         };
>     };
>
> Changes compared with v5:
> - Add decoder hardware block diagram for patch 13/15
>
> Changes compared with v4:
> - Fix comments for patch 4/15
>   >> +     if (dev->is_comp_supported) {
>   >> +             ret = mtk_vcodec_init_master(dev);
>   >> +             if (ret < 0)
>   >> +                     goto err_component_match;
>   >> +     } else {
>   >> +             platform_set_drvdata(pdev, dev);
>   >> +     }
>   Fix platform_set_drvdata.
> - Fix build error for patch 9/15
> - Add depend patch in case of error header file for patch 13/15
>
> Changes compared with v3:
> - Fix return value for patch 1/15
> - Fix comments for patch 4/15
>   > Looking up "mediatek,mtk-vcodec-core" to determine if it uses component framwork sounds like...
>   Add prameter in pdata, for all platform will use compoent after mt8183
>
>   >> +     if (dev->is_comp_supported) {
>   >> +             ret = mtk_vcodec_init_master(dev);
>   >> +             if (ret < 0)
>   >> +                     goto err_component_match;
>   >> +     } else {
>   >> +             platform_set_drvdata(pdev, dev);
>   >> +     }
>   > + Has asked the same question in [1].  Why it removes the
>   > +platform_set_drvdata() above?  mtk_vcodec_init_master() also calls platform_set_drvdata().
>   Must call component_master_add_with_match after platform_set_drvdata for component architecture.
> - Fix yaml files check fail for patch 5/15
> - Fix yaml file check fail for patch 14/15
>
> Changes compared with v1:
> - Fix many comments for patch 3/14
> - Remove unnecessary code for patch 4/14
> - Using enum mtk_vdec_hw_count instead of magic numbers for patch 6/14
> - Reconstructed get/put lat buffer for lat and core hardware for patch 7/14
> - Using yaml format to instead of txt file for patch 12/14
>
> Yunfei Dong (19):
>   media: mtk-vcodec: Get numbers of register bases from DT
>   media: mtk-vcodec: Align vcodec wake up interrupt interface
>   media: mtk-vcodec: Refactor vcodec pm interface
>   media: mtk-vcodec: export decoder pm functions
>   media: mtk-vcodec: Support MT8192
>   media: mtk-vcodec: Manage multi hardware information
>   dt-bindings: media: mtk-vcodec: Separate video encoder and decoder
>     dt-bindings
>   media: mtk-vcodec: Use pure single core for MT8183
>   media: mtk-vcodec: Add irq interface for multi hardware
>   media: mtk-vcodec: Add msg queue feature for lat and core architecture
>   media: mtk-vcodec: Generalize power and clock on/off interfaces
>   media: mtk-vcodec: Add new interface to lock different hardware
>   media: mtk-vcodec: Add work queue for core hardware decode
>   media: mtk-vcodec: Support 34bits dma address for vdec
>   dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
>   media: mtk-vcodec: Add core dec and dec end ipi msg
>   media: mtk-vcodec: Use codec type to separate different hardware
>   media: mtk-vcodec: Remove mtk_vcodec_release_dec_pm
>   media: mtk-vcodec: Remove mtk_vcodec_release_enc_pm
>
>  .../media/mediatek,vcodec-decoder.yaml        | 176 +++++++++++
>  .../media/mediatek,vcodec-encoder.yaml        | 187 ++++++++++++
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 261 ++++++++++++++++
>  .../bindings/media/mediatek-vcodec.txt        | 131 --------
>  drivers/media/platform/mtk-vcodec/Makefile    |   6 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   4 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   1 +
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 219 +++++++++++---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 172 +++++++++++
>  .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  55 ++++
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 104 +++++--
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  12 +-
>  .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   2 +
>  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |  20 ++
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  75 ++++-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  21 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  10 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |   3 +-
>  .../platform/mtk-vcodec/mtk_vcodec_intr.c     |  27 +-
>  .../platform/mtk-vcodec/mtk_vcodec_intr.h     |   4 +-
>  .../platform/mtk-vcodec/mtk_vcodec_util.c     |  87 +++++-
>  .../platform/mtk-vcodec/mtk_vcodec_util.h     |   8 +-
>  .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   2 +-
>  .../mtk-vcodec/vdec/vdec_h264_req_if.c        |   2 +-
>  .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   2 +-
>  .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   2 +-
>  .../media/platform/mtk-vcodec/vdec_drv_if.c   |  21 +-
>  .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  16 +-
>  .../platform/mtk-vcodec/vdec_msg_queue.c      | 286 ++++++++++++++++++
>  .../platform/mtk-vcodec/vdec_msg_queue.h      | 148 +++++++++
>  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  46 ++-
>  .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  22 ++
>  .../platform/mtk-vcodec/venc/venc_h264_if.c   |   2 +-
>  .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   2 +-
>  34 files changed, 1841 insertions(+), 295 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
>
> --
> 2.25.1
>
