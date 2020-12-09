Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B342E2D37E7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 01:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B1E6E0D4;
	Wed,  9 Dec 2020 00:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1F56E0D4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 00:42:26 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a12so150080wrv.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 16:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Nsb/Wg9UpFAZ7Jm/nzZfro+2Ntvaqt95xxlPjhSib98=;
 b=dgwUTRq84Qg7LOS/5ed33qBqfsMw60pFgtFIpkj6oSY9NfapP61FaIu2UMYG5As5+Q
 M4QG892XgWg/AcSGfWtyXRonlkc1u5s/IyaNO8Ezc8r5BBqRTMktCh+HBjsRfQMmWO7w
 qHj8+yQiX2hcMRTp1MUKpyNtC5i15CWbA9Org=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nsb/Wg9UpFAZ7Jm/nzZfro+2Ntvaqt95xxlPjhSib98=;
 b=hkQxCXcZ3PvOP2V+4Ohd0eKrVY85fFiMQdjsNHLVMwIfuGmXC22wmWfce1S1bqLfra
 LtHzSqc4082GOkDyCBrDH9naW6cUN54hS+WjK9hN7GNnTiG6QodXNH7V/RNQKnDXtgul
 fgHgP4UbBvwoRYgKdGs3+6HT6cY0FaKNP0dLlUO0N1eztsg83cBlc5uVS2o5Hf34wORa
 d8VDZZHC5/rFLsGL9cr9JPRXBlFK7TDSIKgDbUbA9gam2uOYvui0fTo5lEaRDNB6VcbX
 BzhMPt2g/az/OwiUDcqcQ4DtLPVVx4OvmUWFBoN/LSKiaCmGITGDxcVDT+xqcC2jx4e1
 G+eg==
X-Gm-Message-State: AOAM530OobWshbL/7PQrOVuAAURBqJzloz4C7R6OH3xeAyKYU/MKbCKo
 F+02KHY5ClrmyFRU8dMd1HfS4Q==
X-Google-Smtp-Source: ABdhPJwZeWmpPYFThdFppy35AmZnWUptUUEN6/5+GuMb3OfVfu0rfx8qSWV32ICvMc2qj+wY+e+Yvw==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr720830wru.404.1607474545655; 
 Tue, 08 Dec 2020 16:42:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d8sm955708wrp.44.2020.12.08.16.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 16:42:24 -0800 (PST)
Date: Wed, 9 Dec 2020 01:42:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: rework description of primary and cursor planes
Message-ID: <20201209004223.GL401619@phenom.ffwll.local>
References: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 06, 2020 at 04:34:15PM +0000, Simon Ser wrote:
> The previous wording could be understood by user-space evelopers as "a
> primary/cursor plane is only compatible with a single CRTC" [1].
> 
> Reword the planes description to make it clear the DRM-internal
> drm_crtc.primary and drm_crtc.cursor planes are for legacy uAPI.
> 
> [1]: https://github.com/swaywm/wlroots/pull/2333#discussion_r456788057
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  drivers/gpu/drm/drm_crtc.c  |  3 +++
>  drivers/gpu/drm/drm_plane.c | 16 +++++++++-------
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 74090fc3aa55..c71b134d663a 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -256,6 +256,9 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
>   * planes). For really simple hardware which has only 1 plane look at
>   * drm_simple_display_pipe_init() instead.
>   *
> + * The @primary and @cursor planes are only relevant for legacy uAPI, see
> + * &drm_crtc.primary and &drm_crtc.cursor.
> + *
>   * Returns:
>   * Zero on success, error code on failure.
>   */
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index e6231947f987..7a5697bc9e04 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -49,14 +49,16 @@
>   * &struct drm_plane (possibly as part of a larger structure) and registers it
>   * with a call to drm_universal_plane_init().
>   *
> - * Cursor and overlay planes are optional. All drivers should provide one
> - * primary plane per CRTC to avoid surprising userspace too much. See enum
> - * drm_plane_type for a more in-depth discussion of these special uapi-relevant
> - * plane types. Special planes are associated with their CRTC by calling
> - * drm_crtc_init_with_planes().
> - *
>   * The type of a plane is exposed in the immutable "type" enumeration property,
> - * which has one of the following values: "Overlay", "Primary", "Cursor".
> + * which has one of the following values: "Overlay", "Primary", "Cursor" (see
> + * enum drm_plane_type). A plane can be compatible with multiple CRTCs, see
> + * &drm_plane.possible_crtcs.
> + *
> + * Legacy uAPI doesn't expose the primary and cursor planes directly. DRM core
> + * relies on the driver to set the primary and optionally the cursor plane used
> + * for legacy IOCTLs. This is done by calling drm_crtc_init_with_planes(). All
> + * drivers should provide one primary plane per CRTC to avoid surprising legacy
> + * userspace too much.
>   */

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think maybe a follow up patch should document how userspace should
figure out how to line up the primary planes with the right crtcs (if it
wishes to know that information, it's not super useful aside from probably
good choice for a fullscreen fallback plane). See my reply on the old
thread.

And that patch should also add the code to drm_mode_config_validate() to
validate the possible_crtc masks for these. Something like

	num_primary = 0; num_cursor = 0;

	for_each_plane(plane) {
		if (plane->type == primary) {
			WARN_ON(!(plane->possible_crtcs & BIT(num_primary)));
			num_primary++;
		}

		/* same for cursor */
	}

	WARN_ON(num_primary != dev->mode_config.num_crtcs);
}

Cheers, Daniel

>  
>  static unsigned int drm_num_planes(struct drm_device *dev)
> -- 
> 2.29.2
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
