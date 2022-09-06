Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E595AF44B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C0689444;
	Tue,  6 Sep 2022 19:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D309B10E740
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 19:15:34 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso8043467wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 12:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=UrvaVwLCI6di//Co0hVQdWdS6HKEu7isSPNeDNNFqsU=;
 b=acUpGx0XEIXWlHhNwwkTWmauhOuV/qFYKLB9OO+AnW6Ja6iaKjAx3EFlnXx/zwdhR3
 xRTC+ffPw0C5nll/xcIrx+NPU+xycAALP3c+eR3WMPThNBuhHwEXPVQg+46bAMJDoNzo
 tWyr+zGTn7HsynXWWmY/nEQUWuHo3bmhe2XUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UrvaVwLCI6di//Co0hVQdWdS6HKEu7isSPNeDNNFqsU=;
 b=HJTWwyq8JmtdjSCOKmCksOqJfgZPNtSEG2+ZoiZm5B0hrbvP368jYVQvm8Wi8YbfAY
 /sukcxAshRwtfIMbp4pGP9RqxrXoebgTuU028stgy8IN/yIIp3FZCqeTjVms7oOh29NZ
 xbxzLdNSkqFxHTdqEzQNDA2933X9dw4/moynFnfzl8+4qNnFkgvA5riy/0JONSPoDNhW
 L7C1VYYyAj4AJF16SgXGio3L+TgOZc0N8xdK/4lPyhmAwsH6Glk9bBNxaHRzUiZnZHyw
 mGhO95O2cYS64ZxMf3lGrQiMCYxG7OgbE4oMaJFcPcURbd+aursirkLzluJnqTyQJHOK
 OR0Q==
X-Gm-Message-State: ACgBeo392/w+y7cnN4FTWJe2i3npqVLUdT/mbf9RRgDtEGeo9choHYcE
 1GjMsxJTsDQsA2vPLcuQ4NYTLw==
X-Google-Smtp-Source: AA6agR7CRgZwY6lfFmpCGv0dI5+UVlvONpvprg8/W1YYt0E1/FLUPqqdwiyzQ0+Q0zxCuXUH0gm/Gw==
X-Received: by 2002:a05:600c:5106:b0:3a8:411c:7366 with SMTP id
 o6-20020a05600c510600b003a8411c7366mr14532834wms.204.1662491733305; 
 Tue, 06 Sep 2022 12:15:33 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 n2-20020a5d6b82000000b00228d52b935asm4531534wrx.71.2022.09.06.12.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:15:32 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:15:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/7] drm/plane-helper: Export individual helpers
Message-ID: <YxecUgr9GKe4CmPn@phenom.ffwll.local>
References: <20220720083058.15371-1-tzimmermann@suse.de>
 <20220720083058.15371-6-tzimmermann@suse.de>
 <YvUxQG5M1C6hc9Q2@phenom.ffwll.local>
 <558361a1-afa5-5c0f-9379-31b2883782d9@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <558361a1-afa5-5c0f-9379-31b2883782d9@suse.de>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: airlied@linux.ie, alison.wang@nxp.com, linux@armlinux.org.uk,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 11, 2022 at 08:32:19PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.08.22 um 18:41 schrieb Daniel Vetter:
> > On Wed, Jul 20, 2022 at 10:30:56AM +0200, Thomas Zimmermann wrote:
> > > Export the individual plane helpers that make up the plane functions and
> > > align the naming with other helpers. The plane helpers are for non-atomic
> > > modesetting and exporting them will simplify a later conversion of drivers
> > > to atomic modesetting.
> > > 
> > > With struct drm_plane_funcs removed from drm_plane_helper.h, also remove
> > > the include statements. It only needs linux/types.h for uint32_t and a
> > > number of forward declarations.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > So my commit message was maybe not super motivated, but I intentionally
> > hid these because atomic drivers where using them, which is all bad no
> > good. Now they're more exposed again, which sucks a bit. Exporting the
> > complete function table for legacy helpers (and the one open-coded one in
> > nouveau, not sure we could not move that back to drm_crtc_init) feels much
> > safer against abuse to me.
> > 
> > I'm not entirely clear why we're doing this, because the include untangle
> > could also have been achieved with a struct forward decl, which is what
> > we're usually doing. Can we walk this back please, or am I missing
> > something here?
> 
> I don't think you miss anything. It's just ugly to export the complete funcs
> table. If we roll that change back, let's add a comment that states the
> rational you wrote here.

So I'm way behind on everything, but maybe another option is to just check
in these functions that it's not an atomic modeset driver (i.e.
drm_drv_uses_atomic_modeset()). Or we just hope driver authors are smarter
now and there wont be fallout.

I'm also not clear on why exporting the entire vfunc table is a bad idea?

Either way I'd say up to you.
-Daniel

> 
> Best regards
> Thomas
> 
> > 
> > Cheers, Daniel
> > 
> > > ---
> > >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +-
> > >   drivers/gpu/drm/armada/armada_plane.c         |  2 +-
> > >   drivers/gpu/drm/drm_modeset_helper.c          |  8 ++-
> > >   drivers/gpu/drm/drm_plane_helper.c            | 70 ++++++++++++++-----
> > >   drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  8 ++-
> > >   drivers/gpu/drm/qxl/qxl_display.c             |  4 +-
> > >   drivers/gpu/drm/vboxvideo/vbox_mode.c         |  4 +-
> > >   include/drm/drm_plane_helper.h                | 22 ++++--
> > >   8 files changed, 88 insertions(+), 33 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > index 3e83fed540e8..1548f0a1b1c0 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > @@ -86,6 +86,7 @@
> > >   #include <drm/drm_vblank.h>
> > >   #include <drm/drm_audio_component.h>
> > >   #include <drm/drm_gem_atomic_helper.h>
> > > +#include <drm/drm_plane_helper.h>
> > >   #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
> > > @@ -7824,7 +7825,7 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
> > >   static const struct drm_plane_funcs dm_plane_funcs = {
> > >   	.update_plane	= drm_atomic_helper_update_plane,
> > >   	.disable_plane	= drm_atomic_helper_disable_plane,
> > > -	.destroy	= drm_primary_helper_destroy,
> > > +	.destroy	= drm_plane_helper_destroy,
> > >   	.reset = dm_drm_plane_reset,
> > >   	.atomic_duplicate_state = dm_drm_plane_duplicate_state,
> > >   	.atomic_destroy_state = dm_drm_plane_destroy_state,
> > > diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
> > > index 959d7f0a5108..cc47c032dbc1 100644
> > > --- a/drivers/gpu/drm/armada/armada_plane.c
> > > +++ b/drivers/gpu/drm/armada/armada_plane.c
> > > @@ -288,7 +288,7 @@ struct drm_plane_state *armada_plane_duplicate_state(struct drm_plane *plane)
> > >   static const struct drm_plane_funcs armada_primary_plane_funcs = {
> > >   	.update_plane	= drm_atomic_helper_update_plane,
> > >   	.disable_plane	= drm_atomic_helper_disable_plane,
> > > -	.destroy	= drm_primary_helper_destroy,
> > > +	.destroy	= drm_plane_helper_destroy,
> > >   	.reset		= armada_plane_reset,
> > >   	.atomic_duplicate_state = armada_plane_duplicate_state,
> > >   	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> > > diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> > > index 0f08319453b2..bd609a978848 100644
> > > --- a/drivers/gpu/drm/drm_modeset_helper.c
> > > +++ b/drivers/gpu/drm/drm_modeset_helper.c
> > > @@ -108,6 +108,12 @@ static const uint32_t safe_modeset_formats[] = {
> > >   	DRM_FORMAT_ARGB8888,
> > >   };
> > > +static const struct drm_plane_funcs primary_plane_funcs = {
> > > +	.update_plane = drm_plane_helper_update_primary,
> > > +	.disable_plane = drm_plane_helper_disable_primary,
> > > +	.destroy = drm_plane_helper_destroy,
> > > +};
> > > +
> > >   static struct drm_plane *create_primary_plane(struct drm_device *dev)
> > >   {
> > >   	struct drm_plane *primary;
> > > @@ -127,7 +133,7 @@ static struct drm_plane *create_primary_plane(struct drm_device *dev)
> > >   	/* possible_crtc's will be filled in later by crtc_init */
> > >   	ret = drm_universal_plane_init(dev, primary, 0,
> > > -				       &drm_primary_helper_funcs,
> > > +				       &primary_plane_funcs,
> > >   				       safe_modeset_formats,
> > >   				       ARRAY_SIZE(safe_modeset_formats),
> > >   				       NULL,
> > > diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> > > index bc08edd69030..c7785967f5bf 100644
> > > --- a/drivers/gpu/drm/drm_plane_helper.c
> > > +++ b/drivers/gpu/drm/drm_plane_helper.c
> > > @@ -145,13 +145,36 @@ static int drm_plane_helper_check_update(struct drm_plane *plane,
> > >   	return 0;
> > >   }
> > > -static int drm_primary_helper_update(struct drm_plane *plane, struct drm_crtc *crtc,
> > > -				     struct drm_framebuffer *fb,
> > > -				     int crtc_x, int crtc_y,
> > > -				     unsigned int crtc_w, unsigned int crtc_h,
> > > -				     uint32_t src_x, uint32_t src_y,
> > > -				     uint32_t src_w, uint32_t src_h,
> > > -				     struct drm_modeset_acquire_ctx *ctx)
> > > +/**
> > > + * drm_plane_helper_update_primary - Helper for updating primary planes
> > > + * @plane: plane to update
> > > + * @crtc: the plane's new CRTC
> > > + * @fb: the plane's new framebuffer
> > > + * @crtc_x: x coordinate within CRTC
> > > + * @crtc_y: y coordinate within CRTC
> > > + * @crtc_w: width coordinate within CRTC
> > > + * @crtc_h: height coordinate within CRTC
> > > + * @src_x: x coordinate within source
> > > + * @src_y: y coordinate within source
> > > + * @src_w: width coordinate within source
> > > + * @src_h: height coordinate within source
> > > + * @ctx: modeset locking context
> > > + *
> > > + * This helper validates the given parameters and updates the primary plane.
> > > + *
> > > + * This function is only useful for non-atomic modesetting. Don't use
> > > + * it in new drivers.
> > > + *
> > > + * Returns:
> > > + * Zero on success, or an errno code otherwise.
> > > + */
> > > +int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *crtc,
> > > +				    struct drm_framebuffer *fb,
> > > +				    int crtc_x, int crtc_y,
> > > +				    unsigned int crtc_w, unsigned int crtc_h,
> > > +				    uint32_t src_x, uint32_t src_y,
> > > +				    uint32_t src_w, uint32_t src_h,
> > > +				    struct drm_modeset_acquire_ctx *ctx)
> > >   {
> > >   	struct drm_mode_set set = {
> > >   		.crtc = crtc,
> > > @@ -218,31 +241,40 @@ static int drm_primary_helper_update(struct drm_plane *plane, struct drm_crtc *c
> > >   	kfree(connector_list);
> > >   	return ret;
> > >   }
> > > +EXPORT_SYMBOL(drm_plane_helper_update_primary);
> > > -static int drm_primary_helper_disable(struct drm_plane *plane,
> > > -				      struct drm_modeset_acquire_ctx *ctx)
> > > +/**
> > > + * drm_plane_helper_disable_primary - Helper for disabling primary planes
> > > + * @plane: plane to disable
> > > + * @ctx: modeset locking context
> > > + *
> > > + * This helper returns an error when trying to disable the primary
> > > + * plane.
> > > + *
> > > + * This function is only useful for non-atomic modesetting. Don't use
> > > + * it in new drivers.
> > > + *
> > > + * Returns:
> > > + * An errno code.
> > > + */
> > > +int drm_plane_helper_disable_primary(struct drm_plane *plane,
> > > +				     struct drm_modeset_acquire_ctx *ctx)
> > >   {
> > >   	return -EINVAL;
> > >   }
> > > +EXPORT_SYMBOL(drm_plane_helper_disable_primary);
> > >   /**
> > > - * drm_primary_helper_destroy() - Helper for primary plane destruction
> > > + * drm_plane_helper_destroy() - Helper for primary plane destruction
> > >    * @plane: plane to destroy
> > >    *
> > >    * Provides a default plane destroy handler for primary planes.  This handler
> > >    * is called during CRTC destruction.  We disable the primary plane, remove
> > >    * it from the DRM plane list, and deallocate the plane structure.
> > >    */
> > > -void drm_primary_helper_destroy(struct drm_plane *plane)
> > > +void drm_plane_helper_destroy(struct drm_plane *plane)
> > >   {
> > >   	drm_plane_cleanup(plane);
> > >   	kfree(plane);
> > >   }
> > > -EXPORT_SYMBOL(drm_primary_helper_destroy);
> > > -
> > > -const struct drm_plane_funcs drm_primary_helper_funcs = {
> > > -	.update_plane = drm_primary_helper_update,
> > > -	.disable_plane = drm_primary_helper_disable,
> > > -	.destroy = drm_primary_helper_destroy,
> > > -};
> > > -EXPORT_SYMBOL(drm_primary_helper_funcs);
> > > +EXPORT_SYMBOL(drm_plane_helper_destroy);
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> > > index f9e962fd94d0..660c4cbc0b3d 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> > > @@ -1275,6 +1275,12 @@ static const uint32_t modeset_formats[] = {
> > >           DRM_FORMAT_XRGB1555,
> > >   };
> > > +static const struct drm_plane_funcs nv04_primary_plane_funcs = {
> > > +	.update_plane = drm_plane_helper_update_primary,
> > > +	.disable_plane = drm_plane_helper_disable_primary,
> > > +	.destroy = drm_plane_helper_destroy,
> > > +};
> > > +
> > >   static struct drm_plane *
> > >   create_primary_plane(struct drm_device *dev)
> > >   {
> > > @@ -1289,7 +1295,7 @@ create_primary_plane(struct drm_device *dev)
> > >           /* possible_crtc's will be filled in later by crtc_init */
> > >           ret = drm_universal_plane_init(dev, primary, 0,
> > > -                                       &drm_primary_helper_funcs,
> > > +				       &nv04_primary_plane_funcs,
> > >                                          modeset_formats,
> > >                                          ARRAY_SIZE(modeset_formats), NULL,
> > >                                          DRM_PLANE_TYPE_PRIMARY, NULL);
> > > diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> > > index 2e8949863d6b..a152a7c6db21 100644
> > > --- a/drivers/gpu/drm/qxl/qxl_display.c
> > > +++ b/drivers/gpu/drm/qxl/qxl_display.c
> > > @@ -902,7 +902,7 @@ static const struct drm_plane_helper_funcs qxl_cursor_helper_funcs = {
> > >   static const struct drm_plane_funcs qxl_cursor_plane_funcs = {
> > >   	.update_plane	= drm_atomic_helper_update_plane,
> > >   	.disable_plane	= drm_atomic_helper_disable_plane,
> > > -	.destroy	= drm_primary_helper_destroy,
> > > +	.destroy	= drm_plane_helper_destroy,
> > >   	.reset		= drm_atomic_helper_plane_reset,
> > >   	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> > >   	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> > > @@ -924,7 +924,7 @@ static const struct drm_plane_helper_funcs primary_helper_funcs = {
> > >   static const struct drm_plane_funcs qxl_primary_plane_funcs = {
> > >   	.update_plane	= drm_atomic_helper_update_plane,
> > >   	.disable_plane	= drm_atomic_helper_disable_plane,
> > > -	.destroy	= drm_primary_helper_destroy,
> > > +	.destroy	= drm_plane_helper_destroy,
> > >   	.reset		= drm_atomic_helper_plane_reset,
> > >   	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> > >   	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> > > diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > index 604ebfbef314..341edd982cb3 100644
> > > --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > @@ -477,7 +477,7 @@ static const struct drm_plane_helper_funcs vbox_cursor_helper_funcs = {
> > >   static const struct drm_plane_funcs vbox_cursor_plane_funcs = {
> > >   	.update_plane	= drm_atomic_helper_update_plane,
> > >   	.disable_plane	= drm_atomic_helper_disable_plane,
> > > -	.destroy	= drm_primary_helper_destroy,
> > > +	.destroy	= drm_plane_helper_destroy,
> > >   	DRM_GEM_SHADOW_PLANE_FUNCS,
> > >   };
> > > @@ -496,7 +496,7 @@ static const struct drm_plane_helper_funcs vbox_primary_helper_funcs = {
> > >   static const struct drm_plane_funcs vbox_primary_plane_funcs = {
> > >   	.update_plane	= drm_atomic_helper_update_plane,
> > >   	.disable_plane	= drm_atomic_helper_disable_plane,
> > > -	.destroy	= drm_primary_helper_destroy,
> > > +	.destroy	= drm_plane_helper_destroy,
> > >   	.reset		= drm_atomic_helper_plane_reset,
> > >   	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> > >   	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> > > diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
> > > index ff85ef41cb33..1781fab24dd6 100644
> > > --- a/include/drm/drm_plane_helper.h
> > > +++ b/include/drm/drm_plane_helper.h
> > > @@ -24,12 +24,22 @@
> > >   #ifndef DRM_PLANE_HELPER_H
> > >   #define DRM_PLANE_HELPER_H
> > > -#include <drm/drm_rect.h>
> > > -#include <drm/drm_crtc.h>
> > > -#include <drm/drm_modeset_helper_vtables.h>
> > > -#include <drm/drm_modeset_helper.h>
> > > +#include <linux/types.h>
> > > -void drm_primary_helper_destroy(struct drm_plane *plane);
> > > -extern const struct drm_plane_funcs drm_primary_helper_funcs;
> > > +struct drm_crtc;
> > > +struct drm_framebuffer;
> > > +struct drm_modeset_acquire_ctx;
> > > +struct drm_plane;
> > > +
> > > +int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *crtc,
> > > +				    struct drm_framebuffer *fb,
> > > +				    int crtc_x, int crtc_y,
> > > +				    unsigned int crtc_w, unsigned int crtc_h,
> > > +				    uint32_t src_x, uint32_t src_y,
> > > +				    uint32_t src_w, uint32_t src_h,
> > > +				    struct drm_modeset_acquire_ctx *ctx);
> > > +int drm_plane_helper_disable_primary(struct drm_plane *plane,
> > > +				     struct drm_modeset_acquire_ctx *ctx);
> > > +void drm_plane_helper_destroy(struct drm_plane *plane);
> > >   #endif
> > > -- 
> > > 2.36.1
> > > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
