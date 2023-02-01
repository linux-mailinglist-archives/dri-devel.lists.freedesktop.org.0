Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2362685C33
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 01:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCBD10E3AC;
	Wed,  1 Feb 2023 00:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA1D10E3AC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 00:34:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A26073200931;
 Tue, 31 Jan 2023 19:34:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 31 Jan 2023 19:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1675211645; x=
 1675298045; bh=VbXTSA0QzF9tLPKgtOMYcD9KnGwpZB2FihgPfFL95Vw=; b=p
 vH60197H4xkbVHK4sVbQOJH3mgDdGcXT/4aGf3JGlMAGfUSJUgGNxQj6reuz215U
 FGWnX7EoNrRt4pTFct/Q/SsC1r0L97nPwfFbAtr+fU/K18b07K5uEBdd9LsKb7Mm
 rQZ/GYDVSvl/oXwIuXdGiwkh3apT6H9Oy4ixNkBSTxy9soxbTyfGBAGuddWWzj6A
 J6G6uMf0UIL07+zPoy05Uvl/L+kV1JPnlR6dAYt2flNWfa42Er/F/rspc/L2j+7f
 UdfTrhMA7Zp1/+1PyRN04tUyeLO1m7syMAbvvSto3Qzm3G30Lmp/7RHzwsOGkG0p
 MgVDLQn+Xoc8LcTpYZFMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675211645; x=
 1675298045; bh=VbXTSA0QzF9tLPKgtOMYcD9KnGwpZB2FihgPfFL95Vw=; b=I
 Q5429Ukvuxio1q3yo0D9B6j/Mfk4mRnyiJFdDRxMW37oqvmI0Tx8bEdadnl4ofvJ
 oYlpuNyNQ1ojO61QrwctxfhYQn6fkWM100flXEWMJn00ZDQj/fSI1jskHPGNNil1
 cIVDO5cMW2s7yyC+D4vrYNiHPb61w0HxQ6Wzp2vp9VDIc09DGU9MWG+j9nSd//dx
 xy2JePVtkBf3VpOidU0OBfDYCCvonzMoob5ZboJXw/2xZUvzVtJGWPdM/naQbnaZ
 A/nIhqdQazi7uZcOTVwZdLY3oOX1wpYHhjOSIqwKJZW0VW/SKFpPXp8D5QiLOOD9
 tWL/kszJrJUQUh2Izrh1A==
X-ME-Sender: <xms:fbPZY1YLTd-wfgBPJd__Y6jzIWOaEyWt8j9OvNFBFcmx8xSGPAzTDA>
 <xme:fbPZY8YzO5tzZ1PLrM-lhimFtu4zaYRXq7XgWXnWH4byX9P1Kgebxg3zlDwlgJPxt
 cKh0fLcLAB-33vORe4>
X-ME-Received: <xmr:fbPZY39Hoa6bOg-YtkaY2LZOq_KnkagYFW_7thIYgzoieCvN2XbX1DdRFQqRUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefhedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpedfmgdf
 ofgrrgiiucfoohhmsggrshgrfigrlhgrucdlggfofigrrhgvmddfuceomhgrrgiimhesfh
 grshhtmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhgedvvdfguedtteeh
 ffejlefhgfdufeduueejvdevheevuefhtefhtdejffenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrggriihmsehfrghsthhmrghilhdrtgho
 mh
X-ME-Proxy: <xmx:fbPZYzr33pB5QXrVedf_bImSsZ1kJzb-jn6h0f0Ls1dw106lVdFDRA>
 <xmx:fbPZYwokyXL5V_hgRup6eqRDBaJGC_TXyvZkiKkTmOkHnWPACZSQ0A>
 <xmx:fbPZY5TwI_xNEB--H7FnnibAZWOijGsqnu9LAcRM5Y6H7ozL5YiA2g>
 <xmx:fbPZY7VUGmrRO5rNAhObFievPjEBQX1dChUNujQDHQjIUP3BechYLQ>
Feedback-ID: i1b1946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Jan 2023 19:34:03 -0500 (EST)
Message-ID: <c31fa9cf-cf05-f380-749b-9beb491c5ef3@fastmail.com>
Date: Tue, 31 Jan 2023 16:33:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/8] drm/vmwgfx: Simplify fb pinning
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230131033542.953249-1-zack@kde.org>
 <20230131033542.953249-5-zack@kde.org>
From: "\"Maaz Mombasawala (VMware)" <maazm@fastmail.com>
In-Reply-To: <20230131033542.953249-5-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/30/23 19:35, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> Only the legacy display unit requires pinning of the fb memory in vram.
> Both the screen objects and screen targets can present from any buffer.
> That makes the pinning abstraction pointless. Simplify all of the code
> and move it to the legacy display unit, the only place that needs it.
> 
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c  |  8 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h  |  4 --
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 66 -----------------------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h |  4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c | 57 +++++++++++++++++++++----
>  5 files changed, 54 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index b6dc0baef350..c6dc733f6d45 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -73,10 +73,10 @@ static bool bo_is_vmw(struct ttm_buffer_object *bo)
>   * Return: Zero on success, Negative error code on failure. In particular
>   * -ERESTARTSYS if interrupted by a signal
>   */
> -int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
> -			    struct vmw_bo *buf,
> -			    struct ttm_placement *placement,
> -			    bool interruptible)
> +static int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
> +				   struct vmw_bo *buf,
> +				   struct ttm_placement *placement,
> +				   bool interruptible)
>  {
>  	struct ttm_operation_ctx ctx = {interruptible, false };
>  	struct ttm_buffer_object *bo = &buf->base;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> index 03ef4059c0d2..e2dadd68a16d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> @@ -82,10 +82,6 @@ int vmw_bo_init(struct vmw_private *dev_priv,
>  int vmw_bo_unref_ioctl(struct drm_device *dev, void *data,
>  		       struct drm_file *file_priv);
>  
> -int vmw_bo_pin_in_placement(struct vmw_private *vmw_priv,
> -			    struct vmw_bo *bo,
> -			    struct ttm_placement *placement,
> -			    bool interruptible);
>  int vmw_bo_pin_in_vram(struct vmw_private *dev_priv,
>  		       struct vmw_bo *buf,
>  		       bool interruptible);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index ad41396c0a5d..6780391c57ea 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -1487,69 +1487,6 @@ static const struct drm_framebuffer_funcs vmw_framebuffer_bo_funcs = {
>  	.dirty = vmw_framebuffer_bo_dirty_ext,
>  };
>  
> -/*
> - * Pin the bofer in a location suitable for access by the
> - * display system.
> - */
> -static int vmw_framebuffer_pin(struct vmw_framebuffer *vfb)
> -{
> -	struct vmw_private *dev_priv = vmw_priv(vfb->base.dev);
> -	struct vmw_bo *buf;
> -	struct ttm_placement *placement;
> -	int ret;
> -
> -	buf = vfb->bo ?  vmw_framebuffer_to_vfbd(&vfb->base)->buffer :
> -		vmw_framebuffer_to_vfbs(&vfb->base)->surface->res.backup;
> -
> -	if (!buf)
> -		return 0;
> -
> -	switch (dev_priv->active_display_unit) {
> -	case vmw_du_legacy:
> -		vmw_overlay_pause_all(dev_priv);
> -		ret = vmw_bo_pin_in_start_of_vram(dev_priv, buf, false);
> -		vmw_overlay_resume_all(dev_priv);
> -		break;
> -	case vmw_du_screen_object:
> -	case vmw_du_screen_target:
> -		if (vfb->bo) {
> -			if (dev_priv->capabilities & SVGA_CAP_3D) {
> -				/*
> -				 * Use surface DMA to get content to
> -				 * sreen target surface.
> -				 */
> -				placement = &vmw_vram_gmr_placement;
> -			} else {
> -				/* Use CPU blit. */
> -				placement = &vmw_sys_placement;
> -			}
> -		} else {
> -			/* Use surface / image update */
> -			placement = &vmw_mob_placement;
> -		}
> -
> -		return vmw_bo_pin_in_placement(dev_priv, buf, placement, false);
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	return ret;
> -}
> -
> -static int vmw_framebuffer_unpin(struct vmw_framebuffer *vfb)
> -{
> -	struct vmw_private *dev_priv = vmw_priv(vfb->base.dev);
> -	struct vmw_bo *buf;
> -
> -	buf = vfb->bo ?  vmw_framebuffer_to_vfbd(&vfb->base)->buffer :
> -		vmw_framebuffer_to_vfbs(&vfb->base)->surface->res.backup;
> -
> -	if (WARN_ON(!buf))
> -		return 0;
> -
> -	return vmw_bo_unpin(dev_priv, buf, false);
> -}
> -
>  /**
>   * vmw_create_bo_proxy - create a proxy surface for the buffer object
>   *
> @@ -1766,9 +1703,6 @@ vmw_kms_new_framebuffer(struct vmw_private *dev_priv,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> -	vfb->pin = vmw_framebuffer_pin;
> -	vfb->unpin = vmw_framebuffer_unpin;
> -
>  	return vfb;
>  }
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> index 2d097ba20ad8..7a97e53e8e51 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /**************************************************************************
>   *
> - * Copyright 2009-2022 VMware, Inc., Palo Alto, CA., USA
> + * Copyright 2009-2023 VMware, Inc., Palo Alto, CA., USA
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a
>   * copy of this software and associated documentation files (the
> @@ -217,8 +217,6 @@ struct vmw_kms_dirty {
>   */
>  struct vmw_framebuffer {
>  	struct drm_framebuffer base;
> -	int (*pin)(struct vmw_framebuffer *fb);
> -	int (*unpin)(struct vmw_framebuffer *fb);
>  	bool bo;
>  	uint32_t user_handle;
>  };
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> index a56e5d0ca3c6..b77fe0bc18a7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0 OR MIT
>  /**************************************************************************
>   *
> - * Copyright 2009-2022 VMware, Inc., Palo Alto, CA., USA
> + * Copyright 2009-2023 VMware, Inc., Palo Alto, CA., USA
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a
>   * copy of this software and associated documentation files (the
> @@ -25,11 +25,13 @@
>   *
>   **************************************************************************/
>  
> +#include "vmwgfx_bo.h"
> +#include "vmwgfx_kms.h"
> +
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fourcc.h>
>  
> -#include "vmwgfx_kms.h"
>  
>  #define vmw_crtc_to_ldu(x) \
>  	container_of(x, struct vmw_legacy_display_unit, base.crtc)
> @@ -134,6 +136,47 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
>  	return 0;
>  }
>  
> +/*
> + * Pin the buffer in a location suitable for access by the
> + * display system.
> + */
> +static int vmw_ldu_fb_pin(struct vmw_framebuffer *vfb)
> +{
> +	struct vmw_private *dev_priv = vmw_priv(vfb->base.dev);
> +	struct vmw_bo *buf;
> +	int ret;
> +
> +	buf = vfb->bo ?  vmw_framebuffer_to_vfbd(&vfb->base)->buffer :
> +		vmw_framebuffer_to_vfbs(&vfb->base)->surface->res.backup;
> +
> +	if (!buf)
> +		return 0;
> +	WARN_ON(dev_priv->active_display_unit != vmw_du_legacy);
> +
> +	if (dev_priv->active_display_unit == vmw_du_legacy) {
> +		vmw_overlay_pause_all(dev_priv);
> +		ret = vmw_bo_pin_in_start_of_vram(dev_priv, buf, false);
> +		vmw_overlay_resume_all(dev_priv);
> +	} else
> +		ret = -EINVAL;
> +
> +	return ret;
> +}
> +
> +static int vmw_ldu_fb_unpin(struct vmw_framebuffer *vfb)
> +{
> +	struct vmw_private *dev_priv = vmw_priv(vfb->base.dev);
> +	struct vmw_bo *buf;
> +
> +	buf = vfb->bo ?  vmw_framebuffer_to_vfbd(&vfb->base)->buffer :
> +		vmw_framebuffer_to_vfbs(&vfb->base)->surface->res.backup;
> +
> +	if (WARN_ON(!buf))
> +		return 0;
> +
> +	return vmw_bo_unpin(dev_priv, buf, false);
> +}
> +
>  static int vmw_ldu_del_active(struct vmw_private *vmw_priv,
>  			      struct vmw_legacy_display_unit *ldu)
>  {
> @@ -145,8 +188,7 @@ static int vmw_ldu_del_active(struct vmw_private *vmw_priv,
>  	list_del_init(&ldu->active);
>  	if (--(ld->num_active) == 0) {
>  		BUG_ON(!ld->fb);
> -		if (ld->fb->unpin)
> -			ld->fb->unpin(ld->fb);
> +		WARN_ON(vmw_ldu_fb_unpin(ld->fb));
>  		ld->fb = NULL;
>  	}
>  
> @@ -163,11 +205,10 @@ static int vmw_ldu_add_active(struct vmw_private *vmw_priv,
>  
>  	BUG_ON(!ld->num_active && ld->fb);
>  	if (vfb != ld->fb) {
> -		if (ld->fb && ld->fb->unpin)
> -			ld->fb->unpin(ld->fb);
> +		if (ld->fb)
> +			WARN_ON(vmw_ldu_fb_unpin(ld->fb));
>  		vmw_svga_enable(vmw_priv);
> -		if (vfb->pin)
> -			vfb->pin(vfb);
> +		WARN_ON(vmw_ldu_fb_pin(vfb));
>  		ld->fb = vfb;
>  	}
>  

LGTM!

Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
-- 
Maaz Mombasawala (VMware) <maazm@fastmail.com>

