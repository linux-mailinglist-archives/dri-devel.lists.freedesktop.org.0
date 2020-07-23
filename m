Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F2B22B2AD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 17:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8C588C5A;
	Thu, 23 Jul 2020 15:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E04988C5A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 15:40:15 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j18so5366860wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 08:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wBabrqE3i8LyE40s1GoKcwchCmG/WV84eabwjVOE7Ww=;
 b=Gfsdqsrl5xtjbmI1fasGBb8mUZWlPjqdMj9Bnv2HRVGAvZBRiWbMtEWPJTgZoS41+f
 bJXE5Zv7YwHt0QdquwOm32dm5RrbthmvJA4UxR57N8ThrKNYyCcBdI8FlZO8nTRGHlq6
 TBQ2k0j65WGLDZn3fGy+pB1zB0KDyjQyedBaxATC9YjH9PbLodGKQ449rZr+eTKrDVG3
 hIK8PjcaMN/Dl6vqysSzQD8Ka1PLIg5s+gHqroFEdZG1uxzxXV61/eZIhTayLhJUnRAo
 huAm9nQ01GQVodr3EOvlJ8EGVoK2+6MnomrGZk8jSo9FC9eXOA2pmaQvbuRm9uEp4w6v
 MulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wBabrqE3i8LyE40s1GoKcwchCmG/WV84eabwjVOE7Ww=;
 b=EJgoLArO6xwLU6Omn+Dv/SLJvFd0IaEdRwpDqDfbz7dxSGahU7q9pjE4vzZfxQe+cP
 xxNo8GtyY/ok4Ip6oDZDC7yuHN5Wtv3m/fTi0kzSADscmG6sZwWKNXTnbtUWXUNVuRPL
 YR8BI8OWr/0KF60FEY3OiJ2gst7m5Aqofk9IJVL0MLPf3w4t5N1tM2mI5/o+UgpImrwV
 VF0qH9nlqm6gCPODvTfbscxmB2jJIKU7+BYj8nXolaQuc0pbO0fvSyJ4ahGUJwwkhuvZ
 E8c651KL5E8CIY9QeqV8ySvvnkGF5B51bM+XBmzJZvXtLFukAqUroP9Q/sPcAUUN3HlR
 eAIw==
X-Gm-Message-State: AOAM531mE3FfCIC7TSqJn3Geswvg22bhtjVpYobhRMIYRtjJieajo7Ka
 NySAwSzYhAiqoqRzfWw0zQ8=
X-Google-Smtp-Source: ABdhPJwm34fdwCrlghEBRYd1CsCSXPJ94pnJAwMVauCz+vT4xUAinPPVb9+4s6YVjAIDWPnxTgAAcg==
X-Received: by 2002:a1c:7f0e:: with SMTP id a14mr4865316wmd.21.1595518813644; 
 Thu, 23 Jul 2020 08:40:13 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id b63sm4025460wme.41.2020.07.23.08.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 08:40:12 -0700 (PDT)
Subject: Re: [v7, PATCH 7/7] drm/mediatek: add support for mediatek SOC MT8183
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-8-git-send-email-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <5aaad1ac-a27d-6772-3a88-0e85d27b60ea@gmail.com>
Date: Thu, 23 Jul 2020 17:40:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595469798-3824-8-git-send-email-yongqiang.niu@mediatek.com>
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23/07/2020 04:03, Yongqiang Niu wrote:
> This patch add support for mediatek SOC MT8183
> 1.ovl_2l share driver with ovl
> 2.rdma1 share drive with rdma0, but fifo size is different
> 3.add mt8183 mutex private data, and mmsys private data
> 4.add mt8183 main and external path module for crtc create

Please fix your commit message, this is seems to describe what the whole series 
is doing.

Regards,
Matthias

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 18 ++++++++++++
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  6 ++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp.c   | 47 ++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 43 +++++++++++++++++++++++++++++
>   4 files changed, 114 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 28651bc..8cf9f3b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -430,11 +430,29 @@ static int mtk_disp_ovl_remove(struct platform_device *pdev)
>   	.fmt_rgb565_is_0 = true,
>   };
>   
> +static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
> +	.addr = DISP_REG_OVL_ADDR_MT8173,
> +	.gmc_bits = 10,
> +	.layer_nr = 4,
> +	.fmt_rgb565_is_0 = true,
> +};
> +
> +static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
> +	.addr = DISP_REG_OVL_ADDR_MT8173,
> +	.gmc_bits = 10,
> +	.layer_nr = 2,
> +	.fmt_rgb565_is_0 = true,
> +};
> +
>   static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
>   	{ .compatible = "mediatek,mt2701-disp-ovl",
>   	  .data = &mt2701_ovl_driver_data},
>   	{ .compatible = "mediatek,mt8173-disp-ovl",
>   	  .data = &mt8173_ovl_driver_data},
> +	{ .compatible = "mediatek,mt8183-disp-ovl",
> +	  .data = &mt8183_ovl_driver_data},
> +	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
> +	  .data = &mt8183_ovl_2l_driver_data},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 794acc5..51f2a0c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -355,11 +355,17 @@ static int mtk_disp_rdma_remove(struct platform_device *pdev)
>   	.fifo_size = SZ_8K,
>   };
>   
> +static const struct mtk_disp_rdma_data mt8183_rdma_driver_data = {
> +	.fifo_size = 5 * SZ_1K,
> +};
> +
>   static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
>   	{ .compatible = "mediatek,mt2701-disp-rdma",
>   	  .data = &mt2701_rdma_driver_data},
>   	{ .compatible = "mediatek,mt8173-disp-rdma",
>   	  .data = &mt8173_rdma_driver_data},
> +	{ .compatible = "mediatek,mt8183-disp-rdma",
> +	  .data = &mt8183_rdma_driver_data},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index 014c1bb..60788c1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -15,6 +15,8 @@
>   
>   #define MT2701_DISP_MUTEX0_MOD0			0x2c
>   #define MT2701_DISP_MUTEX0_SOF0			0x30
> +#define MT8183_DISP_MUTEX0_MOD0			0x30
> +#define MT8183_DISP_MUTEX0_SOF0			0x2c
>   
>   #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
>   #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
> @@ -25,6 +27,18 @@
>   
>   #define INT_MUTEX				BIT(1)
>   
> +#define MT8183_MUTEX_MOD_DISP_RDMA0		0
> +#define MT8183_MUTEX_MOD_DISP_RDMA1		1
> +#define MT8183_MUTEX_MOD_DISP_OVL0		9
> +#define MT8183_MUTEX_MOD_DISP_OVL0_2L		10
> +#define MT8183_MUTEX_MOD_DISP_OVL1_2L		11
> +#define MT8183_MUTEX_MOD_DISP_WDMA0		12
> +#define MT8183_MUTEX_MOD_DISP_COLOR0		13
> +#define MT8183_MUTEX_MOD_DISP_CCORR0		14
> +#define MT8183_MUTEX_MOD_DISP_AAL0		15
> +#define MT8183_MUTEX_MOD_DISP_GAMMA0		16
> +#define MT8183_MUTEX_MOD_DISP_DITHER0		17
> +
>   #define MT8173_MUTEX_MOD_DISP_OVL0		11
>   #define MT8173_MUTEX_MOD_DISP_OVL1		12
>   #define MT8173_MUTEX_MOD_DISP_RDMA0		13
> @@ -74,6 +88,10 @@
>   #define MUTEX_SOF_DSI2			5
>   #define MUTEX_SOF_DSI3			6
>   
> +#define MT8183_MUTEX_SOF_DPI0			2
> +#define MT8183_MUTEX_EOF_DSI0			(MUTEX_SOF_DSI0 << 6)
> +#define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
> +
>   
>   struct mtk_disp_mutex {
>   	int id;
> @@ -153,6 +171,20 @@ struct mtk_ddp {
>   	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
>   };
>   
> +static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
> +	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
> +	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
> +	[DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
> +	[DDP_COMPONENT_OVL_2L1] = MT8183_MUTEX_MOD_DISP_OVL1_2L,
> +	[DDP_COMPONENT_RDMA0] = MT8183_MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_RDMA1] = MT8183_MUTEX_MOD_DISP_RDMA1,
> +	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
> +};
> +
>   static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_DSI3 + 1] = {
>   	[DDP_MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>   	[DDP_MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> @@ -163,6 +195,12 @@ struct mtk_ddp {
>   	[DDP_MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
>   };
>   
> +static const unsigned int mt8183_mutex_sof[DDP_MUTEX_SOF_DSI3 + 1] = {
> +	[DDP_MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> +	[DDP_MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
> +	[DDP_MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
> +};
> +
>   static const struct mtk_ddp_data mt2701_ddp_driver_data = {
>   	.mutex_mod = mt2701_mutex_mod,
>   	.mutex_sof = mt2712_mutex_sof,
> @@ -184,6 +222,13 @@ struct mtk_ddp {
>   	.mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
>   };
>   
> +static const struct mtk_ddp_data mt8183_ddp_driver_data = {
> +	.mutex_mod = mt8183_mutex_mod,
> +	.mutex_sof = mt8183_mutex_sof,
> +	.mutex_mod_reg = MT8183_DISP_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8183_DISP_MUTEX0_SOF0,
> +};
> +
>   struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id)
>   {
>   	struct mtk_ddp *ddp = dev_get_drvdata(dev);
> @@ -402,6 +447,8 @@ static int mtk_ddp_remove(struct platform_device *pdev)
>   	  .data = &mt2712_ddp_driver_data},
>   	{ .compatible = "mediatek,mt8173-disp-mutex",
>   	  .data = &mt8173_ddp_driver_data},
> +	{ .compatible = "mediatek,mt8183-disp-mutex",
> +	  .data = &mt8183_ddp_driver_data},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, ddp_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 6bd3694..267e91e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -119,6 +119,24 @@
>   	DDP_COMPONENT_DPI0,
>   };
>   
> +static const enum mtk_ddp_comp_id mt8183_mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_OVL_2L0,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_CCORR,
> +	DDP_COMPONENT_AAL0,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_DITHER,
> +	DDP_COMPONENT_DSI0,
> +};
> +
> +static const enum mtk_ddp_comp_id mt8183_mtk_ddp_ext[] = {
> +	DDP_COMPONENT_OVL_2L1,
> +	DDP_COMPONENT_RDMA1,
> +	DDP_COMPONENT_DPI0,
> +};
> +
>   static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>   	.main_path = mt2701_mtk_ddp_main,
>   	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> @@ -143,6 +161,13 @@
>   	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
> +	.main_path = mt8183_mtk_ddp_main,
> +	.main_len = ARRAY_SIZE(mt8183_mtk_ddp_main),
> +	.ext_path = mt8183_mtk_ddp_ext,
> +	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
> +};
> +
>   static int mtk_drm_kms_init(struct drm_device *drm)
>   {
>   	struct mtk_drm_private *private = drm->dev_private;
> @@ -380,12 +405,20 @@ static void mtk_drm_unbind(struct device *dev)
>   	  .data = (void *)MTK_DISP_OVL },
>   	{ .compatible = "mediatek,mt8173-disp-ovl",
>   	  .data = (void *)MTK_DISP_OVL },
> +	{ .compatible = "mediatek,mt8183-disp-ovl",
> +	  .data = (void *)MTK_DISP_OVL },
> +	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
> +	  .data = (void *)MTK_DISP_OVL_2L },
>   	{ .compatible = "mediatek,mt2701-disp-rdma",
>   	  .data = (void *)MTK_DISP_RDMA },
>   	{ .compatible = "mediatek,mt8173-disp-rdma",
>   	  .data = (void *)MTK_DISP_RDMA },
> +	{ .compatible = "mediatek,mt8183-disp-rdma",
> +	  .data = (void *)MTK_DISP_RDMA },
>   	{ .compatible = "mediatek,mt8173-disp-wdma",
>   	  .data = (void *)MTK_DISP_WDMA },
> +	{ .compatible = "mediatek,mt8183-disp-ccorr",
> +	  .data = (void *)MTK_DISP_CCORR },
>   	{ .compatible = "mediatek,mt2701-disp-color",
>   	  .data = (void *)MTK_DISP_COLOR },
>   	{ .compatible = "mediatek,mt8173-disp-color",
> @@ -394,22 +427,30 @@ static void mtk_drm_unbind(struct device *dev)
>   	  .data = (void *)MTK_DISP_AAL},
>   	{ .compatible = "mediatek,mt8173-disp-gamma",
>   	  .data = (void *)MTK_DISP_GAMMA, },
> +	{ .compatible = "mediatek,mt8183-disp-dither",
> +	  .data = (void *)MTK_DISP_DITHER },
>   	{ .compatible = "mediatek,mt8173-disp-ufoe",
>   	  .data = (void *)MTK_DISP_UFOE },
>   	{ .compatible = "mediatek,mt2701-dsi",
>   	  .data = (void *)MTK_DSI },
>   	{ .compatible = "mediatek,mt8173-dsi",
>   	  .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt8183-dsi",
> +	  .data = (void *)MTK_DSI },
>   	{ .compatible = "mediatek,mt2701-dpi",
>   	  .data = (void *)MTK_DPI },
>   	{ .compatible = "mediatek,mt8173-dpi",
>   	  .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8183-dpi",
> +	  .data = (void *)MTK_DPI },
>   	{ .compatible = "mediatek,mt2701-disp-mutex",
>   	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt2712-disp-mutex",
>   	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8173-disp-mutex",
>   	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8183-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt2701-disp-pwm",
>   	  .data = (void *)MTK_DISP_BLS },
>   	{ .compatible = "mediatek,mt8173-disp-pwm",
> @@ -426,6 +467,8 @@ static void mtk_drm_unbind(struct device *dev)
>   	  .data = &mt2712_mmsys_driver_data},
>   	{ .compatible = "mediatek,mt8173-mmsys",
>   	  .data = &mt8173_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt8183-mmsys",
> +	  .data = &mt8183_mmsys_driver_data},
>   	{ }
>   };
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
