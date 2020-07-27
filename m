Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3723B22EA37
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 12:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC8789D5F;
	Mon, 27 Jul 2020 10:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060A589D5F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 10:42:54 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l2so3804350wrc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 03:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vfnKwpFfCT3eWsghXm9EStQYxti5fK7/DgM2tXjtlVg=;
 b=dlIwVtD3XxSZnuBzqqHdDsKqcjh4mUOqktt3t3pbblrZHwfv2919SHLSQDWg4RswvQ
 z+tMm86cda/zTKTi0F/OXbTssDosb+yTqwAjP5K2Cqi968S/AxALbv0OuTOGQOIEoxGP
 6r9AwoYkIGN1ljR1c0iPmPOnI4pxrfzYUUwFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vfnKwpFfCT3eWsghXm9EStQYxti5fK7/DgM2tXjtlVg=;
 b=JgPTwOrS9cx57t5LR4pV0BXSJOMihAbwCMeASVEH1xldvC0uey1aG+A3shw3WYYyfV
 lSAEoeqzevGZo+VwMc8DBszh/I9S30UUn9U+OJrMntSPzXMqqaFrXBn12RubCHJ37Vsf
 NKYzJh8W6wc1jJthv1VU8FxdOZxzZi83ub0/wAcIpRcuttSwDr0x5UKfTmT8ZmoSM7tH
 YB61hySdhNoLnHRQScmhwC+SBsQHvwtHKbtypX4Pnw/wVjhNoJPJdaX4i+mXRu/oy4dw
 8cQWsn0H1vxc/agGUVBjzI6UU5pBzJoIYKVlZR0n6BmEHL+u9hc4GsMOKqAbZnzr/YfH
 Ya8g==
X-Gm-Message-State: AOAM532fUD3JEuRJ5a9HvwjAor9ovSMiV/TWF4MajdnoiUVr8iPNLkEz
 4xFWoKgudfec0QuYubcNm8Phlw==
X-Google-Smtp-Source: ABdhPJwJIpsv0g6kXOlNkZEILuNnvqOeq0JmGgC66zD+kmvF219s0cLX2Om8++MXIZEHUwR/nNSaaA==
X-Received: by 2002:a5d:48c8:: with SMTP id p8mr19308704wrs.84.1595846572669; 
 Mon, 27 Jul 2020 03:42:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h199sm17789081wme.42.2020.07.27.03.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 03:42:51 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:42:50 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 2/3] drm/ast: Store image size in HW cursor info
Message-ID: <20200727104250.GV6419@phenom.ffwll.local>
References: <20200727073707.21097-1-tzimmermann@suse.de>
 <20200727073707.21097-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727073707.21097-3-tzimmermann@suse.de>
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

On Mon, Jul 27, 2020 at 09:37:06AM +0200, Thomas Zimmermann wrote:
> Store the image size as part of the HW cursor info, so that the
> cursor show function doesn't require the information from the
> caller. No functional changes.

Uh just pass the state structure and done? All these "store random stuff
in private structures" (they're not even atomic state structures, it's the
driver private thing even!) is very non-atomic. And I see zero reasons why
you have to do this, the cursor stays around.
-Daniel

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 4961eb60f145 ("drm/ast: Enable atomic modesetting")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>
> Cc: <stable@vger.kernel.org> # v5.6+
> ---
>  drivers/gpu/drm/ast/ast_cursor.c | 13 +++++++++++--
>  drivers/gpu/drm/ast/ast_drv.h    |  7 +++++--
>  drivers/gpu/drm/ast/ast_mode.c   |  8 +-------
>  3 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index acf0d23514e8..8642a0ce9da6 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -87,6 +87,8 @@ int ast_cursor_init(struct ast_private *ast)
>  
>  		ast->cursor.gbo[i] = gbo;
>  		ast->cursor.vaddr[i] = vaddr;
> +		ast->cursor.size[i].width = 0;
> +		ast->cursor.size[i].height = 0;
>  	}
>  
>  	return drmm_add_action_or_reset(dev, ast_cursor_release, NULL);
> @@ -194,6 +196,9 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
>  	/* do data transfer to cursor BO */
>  	update_cursor_image(dst, src, fb->width, fb->height);
>  
> +	ast->cursor.size[ast->cursor.next_index].width = fb->width;
> +	ast->cursor.size[ast->cursor.next_index].height = fb->height;
> +
>  	drm_gem_vram_vunmap(gbo, src);
>  	drm_gem_vram_unpin(gbo);
>  
> @@ -249,14 +254,18 @@ static void ast_cursor_set_location(struct ast_private *ast, u16 x, u16 y,
>  	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc7, y1);
>  }
>  
> -void ast_cursor_show(struct ast_private *ast, int x, int y,
> -		     unsigned int offset_x, unsigned int offset_y)
> +void ast_cursor_show(struct ast_private *ast, int x, int y)
>  {
> +	unsigned int offset_x, offset_y;
>  	u8 x_offset, y_offset;
>  	u8 __iomem *dst, __iomem *sig;
>  	u8 jreg;
>  
>  	dst = ast->cursor.vaddr[ast->cursor.next_index];
> +	offset_x = AST_MAX_HWC_WIDTH -
> +		   ast->cursor.size[ast->cursor.next_index].width;
> +	offset_y = AST_MAX_HWC_HEIGHT -
> +		   ast->cursor.size[ast->cursor.next_index].height;
>  
>  	sig = dst + AST_HWC_SIZE;
>  	writel(x, sig + AST_HWC_SIGNATURE_X);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index e3a264ac7ee2..57414b429db3 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -116,6 +116,10 @@ struct ast_private {
>  	struct {
>  		struct drm_gem_vram_object *gbo[AST_DEFAULT_HWC_NUM];
>  		void __iomem *vaddr[AST_DEFAULT_HWC_NUM];
> +		struct {
> +			unsigned int width;
> +			unsigned int height;
> +		} size[AST_DEFAULT_HWC_NUM];
>  		unsigned int next_index;
>  	} cursor;
>  
> @@ -311,8 +315,7 @@ void ast_release_firmware(struct drm_device *dev);
>  int ast_cursor_init(struct ast_private *ast);
>  int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb);
>  void ast_cursor_page_flip(struct ast_private *ast);
> -void ast_cursor_show(struct ast_private *ast, int x, int y,
> -		     unsigned int offset_x, unsigned int offset_y);
> +void ast_cursor_show(struct ast_private *ast, int x, int y);
>  void ast_cursor_hide(struct ast_private *ast);
>  
>  #endif
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 3680a000b812..5b2b39c93033 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -671,20 +671,14 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>  				      struct drm_plane_state *old_state)
>  {
>  	struct drm_plane_state *state = plane->state;
> -	struct drm_framebuffer *fb = state->fb;
>  	struct ast_private *ast = plane->dev->dev_private;
> -	unsigned int offset_x, offset_y;
> -
> -	offset_x = AST_MAX_HWC_WIDTH - fb->width;
> -	offset_y = AST_MAX_HWC_WIDTH - fb->height;
>  
>  	if (state->fb != old_state->fb) {
>  		/* A new cursor image was installed. */
>  		ast_cursor_page_flip(ast);
>  	}
>  
> -	ast_cursor_show(ast, state->crtc_x, state->crtc_y,
> -			offset_x, offset_y);
> +	ast_cursor_show(ast, state->crtc_x, state->crtc_y);
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
