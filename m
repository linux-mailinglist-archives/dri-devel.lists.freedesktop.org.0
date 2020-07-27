Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25E22EA4C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 12:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F7D89824;
	Mon, 27 Jul 2020 10:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8909289824
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 10:46:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k8so3938745wma.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 03:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jEXz4XHYIboeUYM649x1ewNgKPhYYWsfFCIkAjX0d70=;
 b=lShWZxM3LDqR2O1xn0+a7LGDoh7eK+PDPO63q57eAiebNglZPUbhlfd29jUyhO4vTT
 Re6keLI9fN1FdvOSulAYMA2yMPyU7y3M84OoSdSOF2HggzKFJegEpiycUH8vWhLcE9Oj
 qCLxYw8+CBCBV9BLOHdbmqZ6w3fMSKw7JSN0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jEXz4XHYIboeUYM649x1ewNgKPhYYWsfFCIkAjX0d70=;
 b=aVtuwa2yCFnKDnua4gHWMu5zNWjBUT/xuzTB731yQPC6DSYKoMFjbGs8zjdwiwmQmv
 g1G3/UZy9ug8j26drTnsl/UGym4Xgc4C828qv/KtqR4ESbVvNmlOcW+scq3aDZRHQwNo
 +7DBOTyixzadtG72IgatwheMSXOJRzQMVaxDikXixHsi437+ElIQBAo7+fe0nP9mWLxL
 4PQohdUm4OZQZ7Lkc33CFL3DtcafEEd0+qozq/mXszUUidcoPu6amXT/LvgaU0mwAsBu
 4xK2J7S5mplQtunfu0HCAZcKspWBqWER2EgF1F+g958QbaLi4UGJKxIR1Tyr1gwcpX/H
 vlqA==
X-Gm-Message-State: AOAM533ZvP5IS5axPX1K0pqrVvhxK3l3jYI5onNE0S1qfN661cAnPu0u
 5+/WrugaRuFpXOHzr9mBMNEVww==
X-Google-Smtp-Source: ABdhPJwkEgX6Rpv2WvYFmrujAQBDVT6alrcLllmhBgp57MUMLwy6O+9ie28bbQUOBfipbi6PW40dQg==
X-Received: by 2002:a05:600c:25cc:: with SMTP id
 12mr3608461wml.120.1595846813826; 
 Mon, 27 Jul 2020 03:46:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o2sm11791068wrj.21.2020.07.27.03.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 03:46:53 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:46:51 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 3/3] drm/ast: Disable cursor while switching display modes
Message-ID: <20200727104651.GW6419@phenom.ffwll.local>
References: <20200727073707.21097-1-tzimmermann@suse.de>
 <20200727073707.21097-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727073707.21097-4-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 stable@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 27, 2020 at 09:37:07AM +0200, Thomas Zimmermann wrote:
> The ast's HW cursor requires the primary plane and CRTC to display
> at a correct mode and format. This is not the case while switching
> display modes, which can lead to the screen turing permanently dark.
> 
> As a workaround, the ast driver now disables active HW cursors while
> the mode switch takes place. It also synchronizes with the vertical
> refresh to give HW cursor and primary plane some time to catch up on
> each other.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 4961eb60f145 ("drm/ast: Enable atomic modesetting")

Since you already do modeset when changing primary plane I think the much
cleaner solution is to use drm_atomic_helper_disable_planes_on_crtc() and
drm_atomic_helper_commit_planes() with flags =
DRM_PLANE_COMMIT_ACTIVE_ONLY or so, with corresponding changes in
atomic_commit_tail. Much cleaner instead of hand-rolling this all in
callbacks.

Note that with atomic helpers it is _very_ much encouraged to throw the
helper structure into the wind and write your own stuff, this thing is
intentionally very modular. This is to avoid incomprehensible drivers that
are forced to hack around the helper midlayer in their callbacks like the
below very much looks like.
-Daniel

> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>
> Cc: <stable@vger.kernel.org> # v5.6+
> ---
>  drivers/gpu/drm/ast/ast_drv.h  |  2 ++
>  drivers/gpu/drm/ast/ast_mode.c | 53 +++++++++++++++++++++++++++++++++-
>  2 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 57414b429db3..564670b5d2ee 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -162,6 +162,8 @@ void ast_driver_unload(struct drm_device *dev);
>  
>  #define AST_IO_MM_OFFSET		(0x380)
>  
> +#define AST_IO_VGAIR1_VREFRESH		BIT(3)
> +
>  #define __ast_read(x) \
>  static inline u##x ast_read##x(struct ast_private *ast, u32 reg) { \
>  u##x val = 0;\
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 5b2b39c93033..e18365bbc08c 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -514,6 +514,17 @@ static void ast_set_start_address_crt1(struct ast_private *ast,
>  
>  }
>  
> +static void ast_wait_for_vretrace(struct ast_private *ast)
> +{
> +	unsigned long timeout = jiffies + HZ;
> +	u8 vgair1;
> +
> +	do {
> +		vgair1 = ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ);
> +	} while (!(vgair1 & AST_IO_VGAIR1_VREFRESH) &&
> +		 time_before(jiffies, timeout));
> +}
> +
>  /*
>   * Primary plane
>   */
> @@ -666,6 +677,14 @@ static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
>  	return 0;
>  }
>  
> +static bool ast_disable_cursor_during_modeset(struct drm_plane *cursor_plane)
> +{
> +	const struct drm_plane_state *cursor_state = cursor_plane->state;
> +
> +	return cursor_state && cursor_state->visible && cursor_state->crtc &&
> +	       drm_atomic_crtc_needs_modeset(cursor_state->crtc->state);
> +}
> +
>  static void
>  ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>  				      struct drm_plane_state *old_state)
> @@ -678,7 +697,12 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>  		ast_cursor_page_flip(ast);
>  	}
>  
> -	ast_cursor_show(ast, state->crtc_x, state->crtc_y);
> +	/*
> +	 * For modesets, delay show() until end of atomic_flush(). See the
> +	 * atomic_begin() helper for more information.
> +	 */
> +	if (!ast_disable_cursor_during_modeset(plane))
> +		ast_cursor_show(ast, state->crtc_x, state->crtc_y);
>  }
>  
>  static void
> @@ -764,6 +788,22 @@ static void ast_crtc_helper_atomic_begin(struct drm_crtc *crtc,
>  	struct ast_private *ast = to_ast_private(crtc->dev);
>  
>  	ast_open_key(ast);
> +
> +	/*
> +	 * HW cursors require the underlying primary plane and CRTC to
> +	 * display a valid mode and image. This is not the case during
> +	 * full modeset operations. So we temporarily disable any active
> +	 * HW cursor and re-enable it at the end of the atomic_flush()
> +	 * helper. The busy waiting allows the code to sync with the
> +	 * vertical refresh.
> +	 *
> +	 * We only do this during *full* modesets. It does not affect
> +	 * simple pageflips on the planes.
> +	 */
> +	if (ast_disable_cursor_during_modeset(&ast->cursor_plane)) {
> +		ast_cursor_hide(ast);
> +		ast_wait_for_vretrace(ast);
> +	}
>  }
>  
>  static void ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
> @@ -771,6 +811,7 @@ static void ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>  {
>  	struct drm_device *dev = crtc->dev;
>  	struct ast_private *ast = to_ast_private(dev);
> +	struct drm_plane_state *cursor_state = ast->cursor_plane.state;
>  	struct ast_crtc_state *ast_state;
>  	const struct drm_format_info *format;
>  	struct ast_vbios_mode_info *vbios_mode_info;
> @@ -799,6 +840,16 @@ static void ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>  	ast_set_dclk_reg(ast, adjusted_mode, vbios_mode_info);
>  	ast_set_crtthd_reg(ast);
>  	ast_set_sync_reg(ast, adjusted_mode, vbios_mode_info);
> +
> +	/*
> +	 * Re-enabling the HW cursor; if any. See the atomic_begin() helper
> +	 * for more information.
> +	 */
> +	if (ast_disable_cursor_during_modeset(&ast->cursor_plane)) {
> +		ast_wait_for_vretrace(ast);
> +		ast_cursor_show(ast, cursor_state->crtc_x,
> +				cursor_state->crtc_y);
> +	}
>  }
>  
>  static void
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
