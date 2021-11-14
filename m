Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC0444FBE6
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 22:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEE789BB0;
	Sun, 14 Nov 2021 21:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E91589BB0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 21:56:51 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z5so3123569edd.3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 13:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+a45scJUghbWle9ZBsDg+s+2wzuH5GEQRWeFAD8t7E=;
 b=AKBJYmPfyiaYmwd7oyncnL6zw9NtPWAJSbT7wJ9CoM5XRX4y7lYR4azZmAWJhnkbx3
 wApEFEVRRFjCRlk8LcnF6jhjQwm5wv7r4B6Skyc7KmZmOOftQeLeqyS9W4PEM5aCIXOK
 3C2t8LKXJCZlA74FYaRzy+O2yuqZGrD9mvi+IO33lc7L6Yucfzu+gveGnyIDEh2HehQo
 GXFDuQDrEVz3+SlIQXV7z/Scjb381zZkmaPcGnIu7xzfs3l25xVRGofL7jjsWciVrfFx
 LQ7c+cenNltzXc/rnPZhVahuvpT8J2ioVmkhvGdpu+lB9nG1RnYh946IZT2OyC/m7P+O
 T77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+a45scJUghbWle9ZBsDg+s+2wzuH5GEQRWeFAD8t7E=;
 b=WVkglk2e1WzUgeQt6S+wsYIy7ef1KHauuAw7BlNgK1n3+5FK9j23VyWNqb8FCNr4f2
 lXjyTWn4yEeqZkG/74QiCd9Rnla3wFYnxtk1HwkX9Ew2FeXiHaokf0aeXAKBsvA5o/KQ
 H6JkiBPHnVKFixw2widpbqz80JNjSLReIRHRkd+TTDTzBnoRQID5bB+SwZ6K2JamxTcm
 hThqjNX8wk1jDEa2a4Ohz41MyhI22KFYRksVrWSQP2VkVeez46mXBlb5+STsZZpoaMki
 Q730b37HH1ZvBAF+sASmWzT95meVofLutckk0VgXlOUwL9vOWobaM2kKEq2A2dLJehjh
 tIwA==
X-Gm-Message-State: AOAM533h/Ptf2KSbz1w2qh3v1k9P+w1fExzrLuXPXtOY2TNK75HASF56
 kYsjETqoNLk4Up62KF4nwtsMsv6VqJHbaPXOyHKMSQ==
X-Google-Smtp-Source: ABdhPJyomQczgvwHG7w6id4jh3N0ebh0Ihr1LveJ55TvN/g341+OWtesIcRAQSmVB1tvezeAr3cMSOUbMM62omekLG0=
X-Received: by 2002:a05:6402:190d:: with SMTP id
 e13mr47552746edz.339.1636927009693; 
 Sun, 14 Nov 2021 13:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20211111041500.17363-1-yunfei.dong@mediatek.com>
 <20211111041500.17363-16-yunfei.dong@mediatek.com>
In-Reply-To: <20211111041500.17363-16-yunfei.dong@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 14 Nov 2021 18:56:37 -0300
Message-ID: <CAAEAJfBWgP1fMsEQQEa=2Rk810oHzDo609TzicYgwPbU8AMunQ@mail.gmail.com>
Subject: Re: [PATCH v10, 15/19] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
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

Yunfei,

On Thu, 11 Nov 2021 at 01:15, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Adds decoder dt-bindings for mt8192.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 261 ++++++++++++++++++
>  1 file changed, 261 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> new file mode 100644
> index 000000000000..1886fae6e39d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -0,0 +1,261 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Mediatek Video Decode Accelerator With Multi Hardware
> +
> +maintainers:
> +  - Yunfei Dong <yunfei.dong@mediatek.com>
> +
> +description: |
> +  Mediatek Video Decode is the video decode hardware present in Mediatek
> +  SoCs which supports high resolution decoding functionalities. Required
> +  main and subdev device node.
> +
> +  About the Decoder Hardware Block Diagram, please check below:
> +
> +    +---------------------------------+------------------------------------+
> +    |                                 |                                    |
> +    | input -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output
 |

To be completely honest, I can't really understand what is the meaning
of the blocks
with input -> lat hw -> lat buffer, and how this means lat- and core-
are children of some parent.

> +    |            ||                   |                     ||             |
> +    +------------||-------------------+---------------------||-------------+
> +                 ||       lat thread  |  core thread        ||     <parent>
> +    -------------||-----------------------------------------||----------------
> +                 ||                                         ||     <child>
> +                 \/ <----------------HW index-------------->\/
> +           +------------------------------------------------------+
> +           |                    enable/disable                    |
> +           |           clk     power    irq    iommu port         |
> +           |                 (lat/lat soc/core0/core1)            |
> +           +------------------------------------------------------+
> +
> +  As above, <parent> mean in main device, <child> mean in subdev device. The information
> +  of each hardware will be stored in subdev device. There are two workqueues in main device:
> +  lat and core. Enable/disable the lat clk/power/irq when lat need to work through hardware
> +  index, core is the same.
> +
> +  Normally the smi common may not the same for each hardware, can't combine all hardware in
> +  one node, or leading to iommu fault when access dram data.
> +

To what extent the lat- and core- devices are really "children"
or "subdevices" of the  video-codec@16000000 device?

I.e. what resources do they share? What are the details of
their bus topology?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mt8192-larb-port.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +    #include <dt-bindings/power/mt8192-power.h>
> +
> +    video-codec@16000000 {
> +        compatible = "mediatek,mt8192-vcodec-dec";
> +        reg = <0x16000000 0x1000>;             /* VDEC_SYS */
> +        mediatek,scp = <&scp>;
> +        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +        vcodec-lat@16010000 {
> +            compatible = "mediatek,mtk-vcodec-lat";
> +            reg = <0x16010000 0x800>;
> +            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> +            iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> +                <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> +            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +                <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> +                <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> +                <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> +                <&topckgen CLK_TOP_MAINPLL_D4>;
> +            clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
> +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> +        };
> +
> +        vcodec-core@16025000 {
> +            compatible = "mediatek,mtk-vcodec-core";
> +            reg = <0x16025000 0x1000>;

The children address space might need some thinking.
In other words,

video-codec@16000000 {

  vcodec-lat@16010000 {
  }

  vcodec-core@16025000 {
  }
}

Your proposal has vcodec-lat as children of video-codec, but its address space
are really on the same level, instead of children being contained in
the parent address space:

video-codec@16000000 {

  vcodec-lat@10000 {
  }

  vcodec-core@25000 {
  }
}

I think this last tree makes more sense from a device-tree point of view.
The ranges property allows you to put the right translation information,
so the device driver itself will get the correct address 0x16000000 + 0x25000.

You might find that the ranges property is tricky to understand at first.

Thanks,
Ezequiel


> +            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> +            iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> +                <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> +            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +                <&vdecsys CLK_VDEC_VDEC>,
> +                <&vdecsys CLK_VDEC_LAT>,
> +                <&vdecsys CLK_VDEC_LARB1>,
> +                <&topckgen CLK_TOP_MAINPLL_D4>;
> +            clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
> +            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> +        };
> +    };
> --
> 2.25.1
>
