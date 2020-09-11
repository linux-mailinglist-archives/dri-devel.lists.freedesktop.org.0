Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F686265BFC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 10:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA85F6E36F;
	Fri, 11 Sep 2020 08:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53166E36F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 08:52:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k18so3977948wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 01:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DcyXccZXPMFr/R1Dg78dx/KSBRnYn09RJu2+V0ubbXg=;
 b=dzJ2NMGkInvplVwqRDvGMynfG8jGTEdMGUZtlkmhM9/bIyp891VKaSDr25cJ3QVdUW
 YfFEeGCUGpznwPhoASy6j0afbovDil9LoKWpH9T2TcAHVugz4nTjsx/7pDTBAIH/MNLq
 9EwX0zE12byfE1CQAAJ9zTSvBYA9INA4E+XzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DcyXccZXPMFr/R1Dg78dx/KSBRnYn09RJu2+V0ubbXg=;
 b=Z0Ah/ypLryKej9D6jrDT7T7INUsXtNXBw4H5mzo9aQvtTe0cfFY2fri4Rdq7ie5AuZ
 m3zXUl9ejkfaZNio7RaVxfzxpHeLa+AlvOD+f6wkFvj22nh12yCDcr8Gofvp5Yi78CUI
 llUmE3hLSsq+KrCkQFkiYNEqU3uwIsrngh5oObptn3UVToBLloxTlP3jw2ezCcsJHM2T
 kNg6Mo+qU9BRShFOZica8rnBfKJRy7+l15Zo4SN3PMRxhsGVAdtfWnL/zctOEz46wnvR
 /omhKbi5vfrqfU3SJnAtaRztW3UICWpYslNxgw2x+SUQFolZJe4IXg1321FSLLVMKCPp
 CNZA==
X-Gm-Message-State: AOAM532FWFMhxaYgFYmd2aCmISYllyJ7YsKWaxU5T4fgHeRg9wCP326y
 QLKAMQlZ3xRXN/2QlMKPAIqlfw==
X-Google-Smtp-Source: ABdhPJy1dkrPMWJGHEeEg/FOUU3kuFvnPOBoFL+g4fDXWiATatzyPOz45xLmSMdtK0AxULCxkysMyQ==
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr1197349wmc.112.1599814348498; 
 Fri, 11 Sep 2020 01:52:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u66sm9004232wme.1.2020.09.11.01.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 01:52:27 -0700 (PDT)
Date: Fri, 11 Sep 2020 10:52:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [RFC PATCH 2/3] drm/atomic-helper: add REQUIRE_MATCHING_FB flag
Message-ID: <20200911085226.GP438822@phenom.ffwll.local>
References: <20200910092425.1016976-1-stefan@agner.ch>
 <20200910092425.1016976-2-stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910092425.1016976-2-stefan@agner.ch>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: marex@denx.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 11:24:24AM +0200, Stefan Agner wrote:
> Add flag which checks that the framebuffer size matches the plane size
> exactly. This is useful for display controller which can't handle
> framebuffers other than the plane/CRTC size.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c               | 7 +++++++
>  drivers/gpu/drm/selftests/test-drm_plane_helper.c | 9 +++++++++
>  include/drm/drm_atomic_helper.h                   | 1 +
>  3 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 755572a37f3f..8bc7f8c2e566 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -802,6 +802,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  	int hscale, vscale;
>  	bool can_position = flags & DRM_PLANE_CAN_POSITION;
>  	bool can_update_disabled = flags & DRM_PLANE_CAN_UPDATE_DISABLED;
> +	bool require_matching_fb = flags & DRM_PLANE_REQUIRE_MATCHING_FB;
>  
>  	WARN_ON(plane_state->crtc && plane_state->crtc != crtc_state->crtc);
>  
> @@ -860,6 +861,12 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  		return -EINVAL;
>  	}
>  
> +	if (require_matching_fb && (drm_rect_width(src) != fb->width ||
> +	    drm_rect_height(src) != fb->height)) {
> +		DRM_DEBUG_KMS("Framebuffer size must match plane size.\n");
> +		return -EINVAL;
> +	}

I think you also want to check that the x,y src are at (0, 0).

Plus needs kerneldoc.

But aside from the details, I like.

> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);
> diff --git a/drivers/gpu/drm/selftests/test-drm_plane_helper.c b/drivers/gpu/drm/selftests/test-drm_plane_helper.c
> index 01e95b2d572f..2c81bbef830e 100644
> --- a/drivers/gpu/drm/selftests/test-drm_plane_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_plane_helper.c
> @@ -139,6 +139,15 @@ int igt_check_plane_state(void *ignored)
>  	FAIL_ON(!check_src_eq(&plane_state, 0, 0, 1023 << 16, 767 << 16));
>  	FAIL_ON(!check_crtc_eq(&plane_state, 0, 0, 1023, 767));
>  
> +	/* Check whether requiring same size framebuffer works correctly. */
> +	set_src(&plane_state, 0, 0, 1024 << 16, 768 << 16);
> +	set_crtc(&plane_state, 0, 0, 1024, 768);
> +	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  DRM_PLANE_REQUIRE_MATCHING_FB);
> +	FAIL(!ret, "Should not be able to use different size framebuffer with REQUIRE_MATCHING_FB\n");

I think also needs a negative test with src_x/y != 0, plus maybe one that
succeeds.

Cheers, Daniel
> +
>  	/* Simple scaling tests. */
>  	set_src(&plane_state, 0, 0, 512 << 16, 384 << 16);
>  	set_crtc(&plane_state, 0, 0, 1024, 768);
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index bb9957b4f91b..244b730e84d3 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -43,6 +43,7 @@ int drm_atomic_helper_check_modeset(struct drm_device *dev,
>  
>  #define DRM_PLANE_CAN_POSITION				BIT(0)
>  #define DRM_PLANE_CAN_UPDATE_DISABLED			BIT(1)
> +#define DRM_PLANE_REQUIRE_MATCHING_FB			BIT(2)
>  
>  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  					const struct drm_crtc_state *crtc_state,
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
