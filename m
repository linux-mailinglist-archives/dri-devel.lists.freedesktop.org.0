Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D4623E992
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 10:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326AA6E984;
	Fri,  7 Aug 2020 08:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D066E984
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 08:50:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 9so1028327wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 01:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+ajo3Agh5LzG3TcbRL2j+y1ct7sYgtC8zV5iCwfimf0=;
 b=iNO6BeUNckOWzZBI9/KUJhb4ky0RjH+Cb+1a6azIk55PwBqOphP8WL8L91GJNaj7UJ
 wbI6NjLL2dQaUWLT+q17PEErUjEezNRtfL8iiyHEeDHlPfArXP4b25vfOjlXqvYDiVsF
 xUVpp313zBA1Zu6vy0bD/z5rnNJF/X4jys5yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+ajo3Agh5LzG3TcbRL2j+y1ct7sYgtC8zV5iCwfimf0=;
 b=QDbVIUAQivmxOJpMt2ysN0szSCB7LT+ioF0bdYlOO/Z+Hn/AZPJOuTF1oPlL9I1AK2
 zHEtq9R1WNitApCWQAPpX8SHa449a+Q2gey1OS9MZvfRd9abNdL0ek8TJLVBTp5DoYpM
 vEtp53D1yVdsXakaFIrA+ANROrD9qax8lm0BK1Zp84h5ANx3cq5o6mHoxpcFn94UvrnQ
 A2ZLAOdHr9rAX3vVBl9c+t6Dm+qiSedE4BJAr6WrLy6QOWn6FDr3OOyC2WZBPvq6nQ32
 vQ4Z76t3v00mF75onVcXlJU6fMDLXHmj7OM0zPAg/EDuZTswpASr6icV8+2OeJdK4Y/V
 9tmg==
X-Gm-Message-State: AOAM5323F1Ahtd0s57Z0FreiAFbHjliawMtKssndsGdB6AGo0dj4DCgg
 TiqxIYJCaMLf/lmjJU+xamOEUA==
X-Google-Smtp-Source: ABdhPJy5Qrzh5aLCkKWJJHYeFvpfSBRmJ0QvsKfEsfQpsl6z8RQptq34hv6+duY4Yw84RlRw9xMtzA==
X-Received: by 2002:a1c:998c:: with SMTP id b134mr10655516wme.59.1596790203186; 
 Fri, 07 Aug 2020 01:50:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x6sm7373629wmx.28.2020.08.07.01.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:50:02 -0700 (PDT)
Date: Fri, 7 Aug 2020 10:50:00 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH v1 4/4] drm/ast: Disable planes while switching display
 modes
Message-ID: <20200807085000.GO6419@phenom.ffwll.local>
References: <20200805105428.2590-1-tzimmermann@suse.de>
 <20200805105428.2590-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805105428.2590-5-tzimmermann@suse.de>
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

On Wed, Aug 05, 2020 at 12:54:28PM +0200, Thomas Zimmermann wrote:
> The ast HW cursor requires the primary plane and CRTC to display at
> a valid mode and format. This is not the case while switching
> display modes, which can lead to the screen turing permanently dark.
> 
> As a workaround, the ast driver now disables active planes while the
> mode or format switch takes place. It also synchronizes with the vertical
> refresh to give CRTC and planes some time to catch up on each other.
> The active planes planes (primary or cursor) will be re-enabled by
> each plane's atomic_update() function.
> 
> v2:
> 	* move the logic into the commit-tail function
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
>  drivers/gpu/drm/ast/ast_drv.h  |  2 +
>  drivers/gpu/drm/ast/ast_mode.c | 68 ++++++++++++++++++++++++++++++++--
>  2 files changed, 66 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index c1af6b725933..467049ca8430 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -177,6 +177,8 @@ struct ast_private *ast_device_create(struct drm_driver *drv,
>  
>  #define AST_IO_MM_OFFSET		(0x380)
>  
> +#define AST_IO_VGAIR1_VREFRESH		BIT(3)
> +
>  #define __ast_read(x) \
>  static inline u##x ast_read##x(struct ast_private *ast, u32 reg) { \
>  u##x val = 0;\
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index ae5cb0a333f7..a379d51f3543 100644
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
> @@ -1043,23 +1054,72 @@ static int ast_connector_init(struct drm_device *dev)
>   * Mode config
>   */
>  
> +static bool
> +ast_crtc_needs_planes_disabled(struct drm_crtc_state *old_crtc_state,
> +			       struct drm_crtc_state *new_crtc_state)
> +{
> +	struct ast_crtc_state *old_ast_crtc_state, *new_ast_crtc_state;
> +
> +	if (drm_atomic_crtc_needs_modeset(new_crtc_state))
> +		return true;
> +
> +	old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
> +	new_ast_crtc_state = to_ast_crtc_state(new_crtc_state);
> +
> +	if (old_ast_crtc_state->format != new_ast_crtc_state->format)
> +		return true;
> +
> +	return false;
> +}
> +
>  static void
>  ast_mode_config_helper_commit_tail(struct drm_atomic_state *old_state)
>  {
>  	struct drm_device *dev = old_state->dev;
> +	struct ast_private *ast = to_ast_private(dev);
> +	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> +	struct drm_crtc *crtc;
> +	int i;
> +	bool wait_for_vretrace = false;
>  
>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>  
> -	drm_atomic_helper_commit_planes(dev, old_state, 0);
> +	/*
> +	 * HW cursors require the underlying primary plane and CRTC to
> +	 * display a valid mode and image. This is not the case during
> +	 * full modeset operations. So we temporarily disable any active
> +	 * plane, including the HW cursor. Each plane's atomic_update()
> +	 * helper will re-enable it if necessary.
> +	 *
> +	 * We only do this during *full* modesets. It does not affect
> +	 * simple pageflips on the planes.
> +	 */
> +	for_each_oldnew_crtc_in_state(old_state, crtc,
> +				      old_crtc_state,
> +				      new_crtc_state, i) {
> +		if (!ast_crtc_needs_planes_disabled(old_crtc_state,
> +						    new_crtc_state))
> +			continue;
> +		drm_atomic_helper_disable_planes_on_crtc(old_crtc_state,
> +							 false);
> +		wait_for_vretrace = true;
> +	}

Hm this still feels like you're fighting the framework more than using it.
Comment here, but it's kinda review comments on the entire series.

- ast_crtc_needs_planes_disabled feels a bit strange, the usual way to
  handle this kind of stuff is to set crtc_state->needs_modeset from your
  plane's atomic_check function. You might need your own atomic_check
  implementation for that, so that after the plane checks you run the
  modeset checks again.

- with that you can put your call here to disable all planes into the crtc
  ->atomic_disable callback. You can then also put the
  ast_wait_for_retrace in there, at the end.

> +
> +	/*
> +	 * Ensure that no scanout takes place before reprogramming mode
> +	 * and format registers.
> +	 */
> +	if (wait_for_vretrace)
> +		ast_wait_for_vretrace(ast);
> +
> +	drm_atomic_helper_commit_planes(dev, old_state,
> +					DRM_PLANE_COMMIT_ACTIVE_ONLY);

This order also feels a bit strange, especially with the first 2 patches
where you put the crtc modeset code into atomic_begin. It feels a bit like
if you do the plane commit _after_ modeset enables, then you could move
the crtc code into the crtc ->atomic_enable hook, and then let the plane
update stuff roll through all in commit_planes. Moving the modset code
into atomic_begin at least suggests you want modeset enables before plane
commit, and lots of drivers have that sequence in their commit_tail. It's
even a default implementation with drm_atomic_helper_commit_tail_rpm.

Sorry this is all dragging around so much, figuring out the best atomic
flow is occasionally a bit an endeavour :-/

Cheers, Daniel

>  
>  	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>  
>  	drm_atomic_helper_fake_vblank(old_state);
> -
>  	drm_atomic_helper_commit_hw_done(old_state);
> -
>  	drm_atomic_helper_wait_for_vblanks(dev, old_state);
> -
>  	drm_atomic_helper_cleanup_planes(dev, old_state);
>  }
>  
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
