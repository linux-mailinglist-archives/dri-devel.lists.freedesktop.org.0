Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ACC43A99E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 03:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987566E1B4;
	Tue, 26 Oct 2021 01:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB286E1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 01:11:57 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id r15so13583465qkp.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 18:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=10z83rn1dQLyIYsIkVAoxSDw4ZTZcNGKVFgCWqQpaRI=;
 b=O7FUpJ+Lf4ouk0CQSS6+rtrpb05h/csYBf6gBMi8eubWIEhWnUqA2KK+OMs0E5hnyP
 OJ75tTKAku67GQiKymEqwhHgdANicgK7TGgeRl0hNPvfBSPr2wbtOTHyeXdQlcI+6gYw
 RS5iVhKU1qq6NGWT+SlV4cuWiasAzrbr4gvXoXT1fYxzFZ3buCfJ+9gjYFyOAE/wmY16
 yPZS3+kP60A/CO28QONPKM/1WT2ZuOADXMEBrHoBMepZamFHQu0kEXfYu/qTcDtEnRqW
 +ia5+lP0mHkpRKx5xZvkTm2zIoMbSXw6Ny6QPbtIeV3Sfbj4SWJ1XP/M2BEKSKpPBm5N
 aqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=10z83rn1dQLyIYsIkVAoxSDw4ZTZcNGKVFgCWqQpaRI=;
 b=sbVFA9sB2XjzwuRXTvSL+yls+659W8Z5dQzbanabUgIFSZByT1tw12Aj3Eb2oBBsDk
 CYsEd4ccvYyd7t/Kon0WD3HXAsWOA3PXy1nBNV4mSF5So3njYDZgQKQ0b0lE4IRrnQ+v
 Sf8uXgyvdVjn9Boy1ZXbSXBEF9vEyIvaYp1zmdvwmxhG9Z7hMz5rnRItimnY0xnZtJVL
 RVxUWEIselQzD+j3Sgj8VnHnXqtUcSXueqpK88O/m1lB5GW9GBwoGJUoQ7x/YDsJoKgU
 gVWuXzHnrSj1Uc3fdiVPc0eMiHeXDTX7JFhT0NU2mftmnUTYJVKr7zD4OMyCC598PWVo
 QjWw==
X-Gm-Message-State: AOAM5324beUEaqZhrBqpdAgkWneUKFXUI3ax11yASKsY5XU5TnPgvZ0j
 djfTwPBCjCP5i9njf+nkumV9lw==
X-Google-Smtp-Source: ABdhPJx3AyIQMi7nUKZ0qGI6PBHImbS56SPUe1LBpNs8MI9iz9C3YGwpEtgyc8Trb9/CIxVjLfPTOw==
X-Received: by 2002:a05:620a:f0b:: with SMTP id
 v11mr16051354qkl.429.1635210716577; 
 Mon, 25 Oct 2021 18:11:56 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id 14sm10381079qtp.97.2021.10.25.18.11.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Oct 2021 18:11:56 -0700 (PDT)
Date: Mon, 25 Oct 2021 21:11:54 -0400
From: Sean Paul <sean@poorly.run>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: linux-mediatek@lists.infradead.org, seanpaul@chromium.org,
 Mark Yacoub <markyacoub@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mediatek: Set Rotation default value to 1.
Message-ID: <20211026011154.GE2515@art_vandelay>
References: <20211022165409.178281-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022165409.178281-1-markyacoub@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Fri, Oct 22, 2021 at 12:54:02PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> The Rotation prob is a bitmask value. It must always have a valid value.

nit: s/prob/prop/

> A default NO rotation is equal to 1 not 0.
> 
> [How]
> 1. At the reset hook, call __drm_atomic_helper_plane_reset which is
> called at the initialization of the plane and sets the default value of
> all planes to DRM_MODE_ROTATE_0 which is equal to 1.
> 2. At the ovl layer check, do no overwrite the state->rotation value 0
> if DRM_MODE_ROTATE_0 is set. We should not change the value that the
> userspace has set, especially if it's an unsupported value.

nit: I would probably split these into 2 patches since they're related but
different

Sean

> 
> Tested on Jacuzzi(MTK).
> Fixes IGT@kms_properties@plane-properties-{legacy,atomic} and
> IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 20 +++++++-------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  5 ++---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  3 ++-
>  4 files changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 86c3068894b11..2fc566964f68e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -64,7 +64,7 @@ void mtk_ovl_config(struct device *dev, unsigned int w,
>  		    unsigned int h, unsigned int vrefresh,
>  		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>  int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
> -			struct mtk_plane_state *mtk_state);
> +			const struct mtk_plane_state *mtk_state);
>  void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>  			  struct mtk_plane_state *state,
>  			  struct cmdq_pkt *cmdq_pkt);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index ea5760f856ec6..13999564304bc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -190,19 +190,15 @@ unsigned int mtk_ovl_supported_rotations(struct device *dev)
>  }
>  
>  int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
> -			struct mtk_plane_state *mtk_state)
> +			const struct mtk_plane_state *mtk_state)
>  {
> -	struct drm_plane_state *state = &mtk_state->base;
> -	unsigned int rotation = 0;
> +	const struct drm_plane_state *state = &mtk_state->base;
> +	unsigned int rotation = drm_rotation_simplify(
> +		state->rotation,
> +		DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y);
>  
> -	rotation = drm_rotation_simplify(state->rotation,
> -					 DRM_MODE_ROTATE_0 |
> -					 DRM_MODE_REFLECT_X |
> -					 DRM_MODE_REFLECT_Y);
> -	rotation &= ~DRM_MODE_ROTATE_0;
> -
> -	/* We can only do reflection, not rotation */
> -	if ((rotation & DRM_MODE_ROTATE_MASK) != 0)
> +	/* We can only do reflection, not non-zero rotation */
> +	if (((rotation & ~DRM_MODE_ROTATE_0) & DRM_MODE_ROTATE_MASK) != 0)
>  		return -EINVAL;
>  
>  	/*
> @@ -212,8 +208,6 @@ int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
>  	if (state->fb->format->is_yuv && rotation != 0)
>  		return -EINVAL;
>  
> -	state->rotation = rotation;
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 1b582262b682b..530bdd031933f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -53,9 +53,8 @@ struct mtk_ddp_comp_funcs {
>  	void (*disable_vblank)(struct device *dev);
>  	unsigned int (*supported_rotations)(struct device *dev);
>  	unsigned int (*layer_nr)(struct device *dev);
> -	int (*layer_check)(struct device *dev,
> -			   unsigned int idx,
> -			   struct mtk_plane_state *state);
> +	int (*layer_check)(struct device *dev, unsigned int idx,
> +			   const struct mtk_plane_state *state);
>  	void (*layer_config)(struct device *dev, unsigned int idx,
>  			     struct mtk_plane_state *state,
>  			     struct cmdq_pkt *cmdq_pkt);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index e6dcb34d30522..accd26481b9fb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -44,9 +44,10 @@ static void mtk_plane_reset(struct drm_plane *plane)
>  		state = kzalloc(sizeof(*state), GFP_KERNEL);
>  		if (!state)
>  			return;
> -		plane->state = &state->base;
>  	}
>  
> +	__drm_atomic_helper_plane_reset(plane, &state->base);
> +
>  	state->base.plane = plane;
>  	state->pending.format = DRM_FORMAT_RGB565;
>  }
> -- 
> 2.33.0.1079.g6e70778dc9-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
