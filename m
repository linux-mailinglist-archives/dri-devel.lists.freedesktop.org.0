Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6156879DC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 11:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482CC10E4D1;
	Thu,  2 Feb 2023 10:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB1310E4D1
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 10:11:29 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso934918wmq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 02:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kehAeDFDI9+Coxdzpkfd5f02TNG8UY6zTHh/E3RlszI=;
 b=jJBlhSkS+4wWP8PiTg88A0bl5w6edXWfOS54C8cb1Dnq/eeA+Yh6bzf4DfuSK2z1Ng
 qr51M8oa7UYQiQ3hVgpTfWiINl2wjisIeDu5lyeD2yC7QO1+VwhurFMgKUhkwfpZrbiN
 rmZlvMTONnomtQkzzw16Z6K2VKi0i5CckMZ+fk6B7lokoaTmbpYkTPI1h2hF5vjncnc3
 F+ngv2jzyL1MhWfZtX9xaPw4TZo4wz6w6GTgAeo/h5PMW6G9YG6tKf2fQC388Ht+cTKT
 vGRF4yWqltA/BBxrnCEkAgTsKI3FfkBJfyHv6UwPBdF/Z1LfsbAWLea0s7vVBYneQ6Wv
 ZJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kehAeDFDI9+Coxdzpkfd5f02TNG8UY6zTHh/E3RlszI=;
 b=7v3AG9JxAXkyA12rydg9wyB+gT9/npDqHEjibBGXSH+QsvqaOXMzvD4nmmr64wHKC0
 FSfOUu3i4qDxpCDewg1XD/KSAAqqKH26cKgNrUXa9Wcm5XKPtO8A5XiD0gLFkIZa2YEy
 Yi/RnbsYqYoUF1B19k6rtDTA2R7sGTt4JzzjZdzDRvHzZveHNiNN7CugXz1dw3hQplT7
 6hiwXK9dm/sKcTJbDHgo3XBFzBtlASF6pLpQlmhETJYP/9eBbhpZduXV1Rm5Z+M+D7qb
 hwfc71B7H8e9tzCvvEH5nT84S9NJmmtUsAo+VUiI5AhGxd5XVt5tqUsoXW6WDyofyGG0
 zVUw==
X-Gm-Message-State: AO0yUKWfk01h4LDIk7bBxnSWrBeC6ZJpD+//IiuqCD9YR1n2wTBNNqzk
 wD6edPvuGPNh+9SD/ydM4NE=
X-Google-Smtp-Source: AK7set+c5o09HTu29Y4zDBE1Aaho6L6YPEDRQTLQJ8GCZHzJxWPkerb6SBhDbLdtpe+eZUUBC1E7Pg==
X-Received: by 2002:a05:600c:3b1e:b0:3dc:4d94:62de with SMTP id
 m30-20020a05600c3b1e00b003dc4d9462demr5246333wms.14.1675332687889; 
 Thu, 02 Feb 2023 02:11:27 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 k32-20020a05600c1ca000b003ddf2865aeasm4691822wms.41.2023.02.02.02.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 02:11:27 -0800 (PST)
Message-ID: <e96bd735-cf36-0dbd-cf93-446c1ab28778@gmail.com>
Date: Thu, 2 Feb 2023 11:11:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] drm/mediatek: Refactor pixel format logic
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20230201170210.1253505-1-greenjustin@chromium.org>
 <20230201170210.1253505-2-greenjustin@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230201170210.1253505-2-greenjustin@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, wenst@chromium.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 01/02/2023 18:02, Justin Green wrote:
> Add an DDP component interface for querying pixel format support and move list
> of supported pixel formats into DDP components instead of mtk_drm_plane.c
> 
> Tested by running Chrome on an MT8195.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 44 +++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 ++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 ++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 ++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++++-------
>   drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
>   8 files changed, 123 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 33e61a136bbc..0df6a06defb8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -96,6 +96,8 @@ void mtk_ovl_register_vblank_cb(struct device *dev,
>   void mtk_ovl_unregister_vblank_cb(struct device *dev);
>   void mtk_ovl_enable_vblank(struct device *dev);
>   void mtk_ovl_disable_vblank(struct device *dev);
> +const u32 *mtk_ovl_get_formats(struct device *dev);
> +size_t mtk_ovl_get_num_formats(struct device *dev);
>   
>   void mtk_rdma_bypass_shadow(struct device *dev);
>   int mtk_rdma_clk_enable(struct device *dev);
> @@ -115,6 +117,8 @@ void mtk_rdma_register_vblank_cb(struct device *dev,
>   void mtk_rdma_unregister_vblank_cb(struct device *dev);
>   void mtk_rdma_enable_vblank(struct device *dev);
>   void mtk_rdma_disable_vblank(struct device *dev);
> +const u32 *mtk_rdma_get_formats(struct device *dev);
> +size_t mtk_rdma_get_num_formats(struct device *dev);
>   
>   int mtk_mdp_rdma_clk_enable(struct device *dev);
>   void mtk_mdp_rdma_clk_disable(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 84daeaffab6a..8743c8047dc9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -66,6 +66,20 @@
>   #define	OVL_CON_VIRT_FLIP	BIT(9)
>   #define	OVL_CON_HORZ_FLIP	BIT(10)
>   
> +static const u32 mt8173_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_UYVY,
> +	DRM_FORMAT_YUYV,
> +};
> +
>   struct mtk_disp_ovl_data {
>   	unsigned int addr;
>   	unsigned int gmc_bits;
> @@ -73,6 +87,8 @@ struct mtk_disp_ovl_data {
>   	bool fmt_rgb565_is_0;
>   	bool smi_id_en;
>   	bool supports_afbc;
> +	const u32 *formats;
> +	size_t num_formats;
>   };
>   
>   /*
> @@ -138,6 +154,20 @@ void mtk_ovl_disable_vblank(struct device *dev)
>   	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
>   }
>   
> +const u32 *mtk_ovl_get_formats(struct device *dev)
> +{
> +	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
> +
> +	return ovl->data->formats;
> +}
> +
> +size_t mtk_ovl_get_num_formats(struct device *dev)
> +{
> +	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
> +
> +	return ovl->data->num_formats;
> +}
> +
>   int mtk_ovl_clk_enable(struct device *dev)
>   {
>   	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
> @@ -495,6 +525,8 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
>   	.gmc_bits = 8,
>   	.layer_nr = 4,
>   	.fmt_rgb565_is_0 = false,
> +	.formats = mt8173_formats,
> +	.num_formats = ARRAY_SIZE(mt8173_formats),
>   };
>   
>   static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
> @@ -502,6 +534,8 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
>   	.gmc_bits = 8,
>   	.layer_nr = 4,
>   	.fmt_rgb565_is_0 = true,
> +	.formats = mt8173_formats,
> +	.num_formats = ARRAY_SIZE(mt8173_formats),

mt8173_formats are the same as the old struct formats. Maybe we should use that 
and only overwrite where we actually use a different array.

Regarding num_formats, see my comment below.

>   };
>   
>   static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
> @@ -509,6 +543,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
>   	.gmc_bits = 10,
>   	.layer_nr = 4,
>   	.fmt_rgb565_is_0 = true,
> +	.formats = mt8173_formats,
> +	.num_formats = ARRAY_SIZE(mt8173_formats),
>   };
>   
>   static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
> @@ -516,6 +552,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
>   	.gmc_bits = 10,
>   	.layer_nr = 2,
>   	.fmt_rgb565_is_0 = true,
> +	.formats = mt8173_formats,
> +	.num_formats = ARRAY_SIZE(mt8173_formats),
>   };
>   
>   static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
> @@ -524,6 +562,8 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
>   	.layer_nr = 4,
>   	.fmt_rgb565_is_0 = true,
>   	.smi_id_en = true,
> +	.formats = mt8173_formats,
> +	.num_formats = ARRAY_SIZE(mt8173_formats),
>   };
>   
>   static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
> @@ -532,6 +572,8 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
>   	.layer_nr = 2,
>   	.fmt_rgb565_is_0 = true,
>   	.smi_id_en = true,
> +	.formats = mt8173_formats,
> +	.num_formats = ARRAY_SIZE(mt8173_formats),
>   };
>   
>   static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
> @@ -541,6 +583,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
>   	.fmt_rgb565_is_0 = true,
>   	.smi_id_en = true,
>   	.supports_afbc = true,
> +	.formats = mt8173_formats,
> +	.num_formats = ARRAY_SIZE(mt8173_formats),
>   };
>   
>   static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 0ec2e4049e07..cf92df845160 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -54,8 +54,24 @@
>   
>   #define RDMA_MEM_GMC				0x40402020
>   
> +static const u32 mt8173_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_UYVY,
> +	DRM_FORMAT_YUYV,
> +};
> +
>   struct mtk_disp_rdma_data {
>   	unsigned int fifo_size;
> +	const u32 *formats;
> +	size_t num_formats;
>   };
>   
>   /*
> @@ -126,6 +142,20 @@ void mtk_rdma_disable_vblank(struct device *dev)
>   	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT, 0);
>   }
>   
> +const u32 *mtk_rdma_get_formats(struct device *dev)
> +{
> +	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
> +
> +	return rdma->data->formats;
> +}
> +
> +size_t mtk_rdma_get_num_formats(struct device *dev)
> +{
> +	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
> +
> +	return rdma->data->num_formats;
> +}
> +
>   int mtk_rdma_clk_enable(struct device *dev)
>   {
>   	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
> @@ -360,18 +390,26 @@ static int mtk_disp_rdma_remove(struct platform_device *pdev)
>   
>   static const struct mtk_disp_rdma_data mt2701_rdma_driver_data = {
>   	.fifo_size = SZ_4K,
> +	.formats = mt8173_formats,
> +	.num_formats = ARRAY_SIZE(mt8173_formats),
>   };
>   
>   static const struct mtk_disp_rdma_data mt8173_rdma_driver_data = {
>   	.fifo_size = SZ_8K,
> +	.formats = mt8173_formats,
> +	.num_formats = ARRAY_SIZE(mt8173_formats),
>   };
>   
>   static const struct mtk_disp_rdma_data mt8183_rdma_driver_data = {
>   	.fifo_size = 5 * SZ_1K,
> +	.formats = mt8173_formats,
> +	.num_formats = ARRAY_SIZE(mt8173_formats),
>   };
>   
>   static const struct mtk_disp_rdma_data mt8195_rdma_driver_data = {
>   	.fifo_size = 1920,
> +	.formats = mt8173_formats,
> +	.num_formats = ARRAY_SIZE(mt8173_formats),
>   };
>   
>   static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 112615817dcb..2ba01c484228 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -856,7 +856,9 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
>   				BIT(pipe),
>   				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
>   							num_planes),
> -				mtk_ddp_comp_supported_rotations(comp));
> +				mtk_ddp_comp_supported_rotations(comp),
> +				mtk_ddp_comp_get_formats(comp),
> +				mtk_ddp_comp_get_num_formats(comp));
>   		if (ret)
>   			return ret;
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 6b6d5335c834..4a4c1928f83d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -359,6 +359,8 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
>   	.layer_config = mtk_ovl_layer_config,
>   	.bgclr_in_on = mtk_ovl_bgclr_in_on,
>   	.bgclr_in_off = mtk_ovl_bgclr_in_off,
> +	.get_formats = mtk_ovl_get_formats,
> +	.get_num_formats = mtk_ovl_get_num_formats,
>   };
>   
>   static const struct mtk_ddp_comp_funcs ddp_postmask = {
> @@ -381,6 +383,8 @@ static const struct mtk_ddp_comp_funcs ddp_rdma = {
>   	.disable_vblank = mtk_rdma_disable_vblank,
>   	.layer_nr = mtk_rdma_layer_nr,
>   	.layer_config = mtk_rdma_layer_config,
> +	.get_formats = mtk_rdma_get_formats,
> +	.get_num_formats = mtk_rdma_get_num_formats,
>   };
>   
>   static const struct mtk_ddp_comp_funcs ddp_ufoe = {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 2d0052c23dcb..7f2e638cfdc2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -71,6 +71,8 @@ struct mtk_ddp_comp_funcs {
>   	void (*bgclr_in_off)(struct device *dev);
>   	void (*ctm_set)(struct device *dev,
>   			struct drm_crtc_state *state);
> +	const u32 *(*get_formats)(struct device *dev);
> +	size_t (*get_num_formats)(struct device *dev);
>   };
>   
>   struct mtk_ddp_comp {
> @@ -203,6 +205,24 @@ static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
>   		comp->funcs->ctm_set(comp->dev, state);
>   }
>   
> +static inline
> +const u32 *mtk_ddp_comp_get_formats(struct mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->get_formats)
> +		return comp->funcs->get_formats(comp->dev);
> +
> +	return NULL;
> +}
> +
> +static inline
> +size_t mtk_ddp_comp_get_num_formats(struct mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->get_num_formats)
> +		return comp->funcs->get_num_formats(comp->dev);
> +
> +	return 0;
> +}
> +
>   int mtk_ddp_comp_get_id(struct device_node *node,
>   			enum mtk_ddp_comp_type comp_type);
>   unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index d54fbf34b000..31f9420aff6f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -19,20 +19,6 @@
>   #include "mtk_drm_gem.h"
>   #include "mtk_drm_plane.h"
>   
> -static const u32 formats[] = {
> -	DRM_FORMAT_XRGB8888,
> -	DRM_FORMAT_ARGB8888,
> -	DRM_FORMAT_BGRX8888,
> -	DRM_FORMAT_BGRA8888,
> -	DRM_FORMAT_ABGR8888,
> -	DRM_FORMAT_XBGR8888,
> -	DRM_FORMAT_RGB888,
> -	DRM_FORMAT_BGR888,
> -	DRM_FORMAT_RGB565,
> -	DRM_FORMAT_UYVY,
> -	DRM_FORMAT_YUYV,
> -};
> -
>   static const u64 modifiers[] = {
>   	DRM_FORMAT_MOD_LINEAR,
>   	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> @@ -315,13 +301,19 @@ static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
>   
>   int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>   		   unsigned long possible_crtcs, enum drm_plane_type type,
> -		   unsigned int supported_rotations)
> +		   unsigned int supported_rotations, const u32 *formats,
> +		   size_t num_formats)

Why can't we use ARRAY_SIZE(formats) here like we did before?

Regards,
Matthias

>   {
>   	int err;
>   
> +	if (!formats || !num_formats) {
> +		DRM_ERROR("no formats for plane\n");
> +		return -EINVAL;
> +	}
> +
>   	err = drm_universal_plane_init(dev, plane, possible_crtcs,
>   				       &mtk_plane_funcs, formats,
> -				       ARRAY_SIZE(formats), modifiers, type, NULL);
> +				       num_formats, modifiers, type, NULL);
>   	if (err) {
>   		DRM_ERROR("failed to initialize plane\n");
>   		return err;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> index 8f39011cdbfc..99aff7da0831 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -48,6 +48,7 @@ to_mtk_plane_state(struct drm_plane_state *state)
>   
>   int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>   		   unsigned long possible_crtcs, enum drm_plane_type type,
> -		   unsigned int supported_rotations);
> +		   unsigned int supported_rotations, const u32 *formats,
> +		   size_t num_formats);
>   
>   #endif
