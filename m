Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 594DE3D3909
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 13:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CE56FAD5;
	Fri, 23 Jul 2021 11:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922CB6FAD5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 11:06:03 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id o185so1351892oih.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 04:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h3PVeHrBDfh+vFrvtg0HNvyd1nJwSx2sg1QYPbwvgc8=;
 b=r3xtxpPy/Wlh5EPI9uHsojLU4cR7W5jX1/bxV/RE4A3cw656GchXh4Z+ztQr48NvYw
 AAL0BjGdfuB/PlEXWDel4qbhyX2tzuEI6GIIUzFNuNB2avZPWiKnanbewjPaahAnrNG+
 fegLacht1UbyGOVvpKetZf5nezJo4YYjHcaShhuQ0V4TIr0KG8vv04mGEhUhOQFmjxzA
 houNicKD5zbedk1f8Jd91jqRkvRugGtzUKfHsmJNdh6mxDsvdHEfDR3loP0f+TiYEAd6
 zMY+WpfbfMYC29h5Mp0peZpFL5D93EwsWQBawIVG/s8bGvw5JA1dfUIB1mJj0LQtPyAn
 KJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h3PVeHrBDfh+vFrvtg0HNvyd1nJwSx2sg1QYPbwvgc8=;
 b=f+Mm1XKs8WkyNnzKdckkcEokvocUMrQyqZYLpIqFB1YelW1qncjTh/29DryXhnOLzy
 WrRNYwmJngzRUanNP9yrDOywYxEXLUX+CCp271khkrFEawAZQlMYX0TdxV8oJXRM5YpD
 Pzo2NvTSN4HMSjV1G5uBS5O0tiHP66oPqstbeTN8bt+rCQDZZE9cR57o9OAkUM0gH7Tw
 cbg3GKb/gTUpNqLpzpgSg+ye5ErZhCAIBpcVznUVPv53n6p548YmRNdrE1so+fngVcxy
 981aS0EH+L3fblxbTbD6N/ou4NOAXyDTHPChydf8MGEoIlVX8spa/DuketDT4Ix5mu9i
 sPTQ==
X-Gm-Message-State: AOAM533mPaIdTCPAMfb1jJwWraemvdD5lQ5Q0aRbvgRXoxmkAmu1jI/1
 uOfgEa7eEJLUAg14r+dyihQif0k81uDZ3ypEHLE=
X-Google-Smtp-Source: ABdhPJxyWrUCsIs5PyVujahPBnOFeUVNh+s71utnmwU97Qy+H7OuNz7AlcqsUFvGQerKg8vjMBcAoNL8Vpp+fWInSeU=
X-Received: by 2002:aca:3904:: with SMTP id g4mr8094234oia.129.1627038362981; 
 Fri, 23 Jul 2021 04:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-8-nancy.lin@mediatek.com>
In-Reply-To: <20210722094551.15255-8-nancy.lin@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 23 Jul 2021 13:05:50 +0200
Message-ID: <CAFqH_53UpoChfrhXf41YRMGGPzjC9N2g3yNQQxc-J=7uPE44Cw@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys1
To: "Nancy.Lin" <nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nancy,

Thank you for your patch.

Missatge de Nancy.Lin <nancy.lin@mediatek.com> del dia dj., 22 de jul.
2021 a les 11:45:
>
> Add mt8195 vdosys1 clock driver name and routing table to
> the driver data of mtk-mmsys.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h    | 83 ++++++++++++++++++++++++--
>  drivers/soc/mediatek/mtk-mmsys.c       | 10 ++++
>  include/linux/soc/mediatek/mtk-mmsys.h |  2 +
>  3 files changed, 90 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> index 73e9e8286d50..104ba575f765 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -64,16 +64,16 @@
>  #define SOUT_TO_VPP_MERGE0_P1_SEL                              (1 << 0)
>
>  #define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL                      0xf40
> -#define SOUT_TO_HDR_VDO_FE0                                    (0 << 0)

This definition was introduced in this patch [1] that didn't land yet.
And you're removing it now. Could you sync with Jason and only
introduce the bits that are needed for your patches. Also all the
comments I made to the Jason's patch apply here.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210723090233.24007-3-jason-jh.lin@mediatek.com/

> +#define SOUT_TO_MIXER_IN1_SEL                                  (1 << 0)
>
>  #define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL                      0xf44
> -#define SOUT_TO_HDR_VDO_FE1                                    (0 << 0)
> +#define SOUT_TO_MIXER_IN2_SEL                                  (1 << 0)
>
>  #define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL                      0xf48
> -#define SOUT_TO_HDR_GFX_FE0                                    (0 << 0)
> +#define SOUT_TO_MIXER_IN3_SEL                                  (1 << 0)
>
>  #define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL                      0xf4c
> -#define SOUT_TO_HDR_GFX_FE1                                    (0 << 0)
> +#define SOUT_TO_MIXER_IN4_SEL                                  (1 << 0)
>
>  #define MT8195_VDO1_MIXER_IN1_SOUT_SEL                         0xf58
>  #define MIXER_IN1_SOUT_TO_DISP_MIXER                           (0 << 0)
> @@ -88,7 +88,7 @@
>  #define MIXER_IN4_SOUT_TO_DISP_MIXER                           (0 << 0)
>
>  #define MT8195_VDO1_MIXER_OUT_SOUT_SEL                         0xf34
> -#define MIXER_SOUT_TO_HDR_VDO_BE0                              (0 << 0)
> +#define MIXER_SOUT_TO_MERGE4_ASYNC_SEL                         (1 << 0)
>
>  #define MT8195_VDO1_MERGE4_SOUT_SEL                            0xf18
>  #define MERGE4_SOUT_TO_VDOSYS0                                 (0 << 0)
> @@ -185,6 +185,79 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
>         }, {
>                 DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
>                 MT8195_VDO0_SEL_OUT, SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN1_SEL
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN2_SEL
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN3_SEL
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN4_SEL
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MIXER_OUT_SOUT_SEL, MIXER_SOUT_TO_MERGE4_ASYNC_SEL
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MIXER_IN1_SEL_IN, MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MIXER_IN2_SEL_IN, MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MIXER_IN3_SEL_IN, MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MIXER_IN4_SEL_IN, MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MIXER_SOUT_SEL_IN, MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
> +       },
> +       {
> +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> +               MT8195_VDO1_MERGE4_ASYNC_SEL_IN, MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
> +       },
> +       {
> +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> +               MT8195_VDO1_DISP_DPI1_SEL_IN, DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
> +       },
> +       {
> +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> +               MT8195_VDO1_MERGE4_SOUT_SEL, MERGE4_SOUT_TO_DPI1_SEL
> +       },
> +       {
> +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> +               MT8195_VDO1_DISP_DP_INTF0_SEL_IN,
> +               DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
> +       },
> +       {
> +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> +               MT8195_VDO1_MERGE4_SOUT_SEL, MERGE4_SOUT_TO_DP_INTF0_SEL
>         }
>  };
>
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 1fb241750897..9e31aad6c5c8 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -59,6 +59,12 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
>         .num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
>  };
>
> +static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
> +       .clk_driver = "clk-mt8195-vdo1",
> +       .routes = mmsys_mt8195_routing_table,
> +       .num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +};
> +
>  struct mtk_mmsys {
>         void __iomem *regs;
>         const struct mtk_mmsys_driver_data *data;
> @@ -168,6 +174,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>                 .compatible = "mediatek,mt8195-vdosys0",
>                 .data = &mt8195_vdosys0_driver_data,
>         },
> +       {
> +               .compatible = "mediatek,mt8195-vdosys1",

Why do you need a second compatible, isn't this the same IP block? I
mean, I understand that you have 2 mmsys blocks, but both are the same
IP block, right? or are they different?

Thanks,
  Enric

> +               .data = &mt8195_vdosys1_driver_data,
> +       },
>         { }
>  };
>
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 34cb605e5df9..338c71570aeb 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -49,6 +49,8 @@ enum mtk_ddp_comp_id {
>         DDP_COMPONENT_DSC1,
>         DDP_COMPONENT_DSC1_VIRTUAL0,
>         DDP_COMPONENT_DP_INTF0,
> +       DDP_COMPONENT_DP_INTF1,
> +       DDP_COMPONENT_PSEUDO_OVL,
>         DDP_COMPONENT_ID_MAX,
>  };
>
> --
> 2.18.0
>
