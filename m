Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C55086DD7F7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 12:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AF910E1DF;
	Tue, 11 Apr 2023 10:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A79710E1DF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 10:32:07 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f04eb5d1a7so4429125e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 03:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681209125; x=1683801125;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWlYQX4Y1ZrzJyCNGQSUMnvOvpF/Z/nFIdYNxxNfrEg=;
 b=czHW7oszK57m41YR1u+rD3WPMSqPt6wloedBSlnzaMzPEUQ/AHMXNTewQNCzs/8uUD
 IFEphUmtf6E4QUbYANlkCNzJe1Mknn9tNbRgPUXAABh8MhWaBbw1CR71cEdupmHjjTAh
 elfhAUeAnv6GIjWOC7PEKocqH2pcKofnzo9K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681209125; x=1683801125;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UWlYQX4Y1ZrzJyCNGQSUMnvOvpF/Z/nFIdYNxxNfrEg=;
 b=jayEUToOKKNnFvoAmaW4EVNPDXnww3Fi1uGBMPd19++8MbsEUsOP8HiW04l5e0Hvj9
 5RSbjHzqsSTOwutn7rDZlYyj3Y8goF8cYJpVi6DQodAgC89sR0CAaUmQJzVL9K/K1CB0
 kA5raf+8ENzg23E7uQvtMM0NpW8VtE0vJC4Gnv55m4+ON7oRX4smMn4rYaMhhb/hhMWk
 v3u2KOFroBCkDgu5QFl7ZNkL/voBUR+izFEU079ZSZWsqfhprn6UhxMt6BTJShm/BGBx
 3XY9x7CZ/6oxXIjqXecQJo/a5xz4lgtNh62bvuBBwG56RxXdCwK4sQRSjFFN/ovdcyRd
 hfuw==
X-Gm-Message-State: AAQBX9cQq1Uaohf1eY8dULAAdoEXSyW19qu9perQO7C1+xkJcbu9akhT
 vduUaRcqPWzDFoh59UALoP5dCw==
X-Google-Smtp-Source: AKy350YHW26EoAnUgqXxjoecjfwc/bqx2pfSiH62+M+X8xHeutLKJ3Eqi5SeePtTr8IKBvV/huRCow==
X-Received: by 2002:a5d:50c5:0:b0:2f0:244c:2780 with SMTP id
 f5-20020a5d50c5000000b002f0244c2780mr4057657wrt.7.1681209125018; 
 Tue, 11 Apr 2023 03:32:05 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 r10-20020adfe68a000000b002c7b229b1basm14182353wrm.15.2023.04.11.03.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 03:32:04 -0700 (PDT)
Date: Tue, 11 Apr 2023 12:32:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH v3 1/2] drm/mediatek: Add mdp_rdma get format function
Message-ID: <ZDU3IiewmLW1pDyn@phenom.ffwll.local>
Mail-Followup-To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 singo.chang@mediatek.com, shawn.sung@mediatek.com
References: <20230330032614.18837-1-nancy.lin@mediatek.com>
 <20230330032614.18837-2-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330032614.18837-2-nancy.lin@mediatek.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 shawn.sung@mediatek.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 11:26:13AM +0800, Nancy.Lin wrote:
> Add mdp_rdma get_format and get_num_formats function.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

The mtk get_formats stuff seems like a lot of midlayering for not much
reasons? Is that really needed?

Just a drive-by questions I had while merging the pr.
-Daniel

> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h |  3 +++
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 24 ++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 0d28b2e2069c..17b169530beb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -152,4 +152,7 @@ void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>  void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>  void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
>  			 struct cmdq_pkt *cmdq_pkt);
> +const u32 *mtk_mdp_rdma_get_formats(struct device *dev);
> +size_t mtk_mdp_rdma_get_num_formats(struct device *dev);
> +
>  #endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> index eecfa98ff52e..e06db6e56b5f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> @@ -62,6 +62,20 @@
>  #define RDMA_CSC_FULL709_TO_RGB			5
>  #define RDMA_CSC_BT601_TO_RGB			6
>  
> +static const u32 formats[] = {
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
>  enum rdma_format {
>  	RDMA_INPUT_FORMAT_RGB565 = 0,
>  	RDMA_INPUT_FORMAT_RGB888 = 1,
> @@ -219,6 +233,16 @@ void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
>  			   MDP_RDMA_MF_CLIP_SIZE, FLD_MF_CLIP_H);
>  }
>  
> +const u32 *mtk_mdp_rdma_get_formats(struct device *dev)
> +{
> +	return formats;
> +}
> +
> +size_t mtk_mdp_rdma_get_num_formats(struct device *dev)
> +{
> +	return ARRAY_SIZE(formats);
> +}
> +
>  int mtk_mdp_rdma_clk_enable(struct device *dev)
>  {
>  	struct mtk_mdp_rdma *rdma = dev_get_drvdata(dev);
> -- 
> 2.18.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
