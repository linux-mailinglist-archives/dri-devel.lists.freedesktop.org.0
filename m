Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C39322A60
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 13:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0816E993;
	Tue, 23 Feb 2021 12:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED0C6E993
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 12:16:53 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id t11so34189622ejx.6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 04:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cqQv/FCUyu7YH4xROIuLLUari7AkZaPGls/wJJN/7Qk=;
 b=bXvdrhCt3MbJ0CWFrpsM8H8d7yPIvyrGsHRORw/H9t6dlUgfm7rrG4Whhn3EBFZpqA
 vATxuAZoV23NJaW3g/R8jJR0khRIIzkqNZHYkXk8HQ4i57YUuukN4+Ay81AbBFzgfxd6
 dgYIBzkpPG+OJhwQswck2ZfnecZnz6r09nmWMLnZbUQUICcnn4rGYQTP70qI7mzuE4P7
 j0vRXwBhsaHyIU5+wI354AyHEIOr5fkSkY+FuEXRfrD2fxJv926ECT3g0y7c+0cMRC0s
 SnvLVD5uKHk/vbzi9yDNXGeNJ+H8zNM3z14JZLWV7Itnrnnr95Mtf/5lDk4MpJeXmMNk
 6pSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cqQv/FCUyu7YH4xROIuLLUari7AkZaPGls/wJJN/7Qk=;
 b=rT+WQnqerM/p+diWj2yiLp0oRgZ2G76hMF7XFs9Hu6F0EemTBEWXURDZjyvl8S53oS
 WvUHuZM4OI4cNWbzr1vheK7ytmVFrtn9j05Nvio7RLXTBWaZwyQ1kUCsa65/X+4tyTwA
 fIe0ZbQ3FOFuXM+LISFZDfD0/DcrpE0ZEyR9Uo7tHR6dxiB8kq7eh2Xd95Z8jo3uwYPx
 4P1qGKQgg1RsZXw46ppAnhNf2KREyzB+fntmQEInamBHltqr/waX6OWxAGcetxecqmzI
 tg/OmBxmmh4IqxjrYHV7kylbmTXAkvxxBZD7Ogti51j94fPH4+oFMSStLJCpNc4RZ/4W
 AuiQ==
X-Gm-Message-State: AOAM532LlIn9RIjgGsV9faK3tLK4+qiqUj9q5qiusi/SIHHijglIJNvy
 pG/cBo47qBpUlXi2ApDoalw=
X-Google-Smtp-Source: ABdhPJwjeYjNW8mvoDky2jvF7rFrB0LVbaavRSfrKIuiXkHZyXl7JSd0D7xQLkgtuMDHTxPWIFJNyw==
X-Received: by 2002:a17:906:719:: with SMTP id
 y25mr25209819ejb.180.1614082611721; 
 Tue, 23 Feb 2021 04:16:51 -0800 (PST)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id c9sm10626667edt.6.2021.02.23.04.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 04:16:51 -0800 (PST)
Date: Tue, 23 Feb 2021 09:16:44 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 3/3] drm/vkms: add overlay support
Message-ID: <20210223121644.tqe5ypdvne2sgpml@smtp.gmail.com>
References: <20210220144212.oqmnjxuwvevke5bn@smtp.gmail.com>
 <YDPfQH4BrKbEieze@phenom.ffwll.local>
 <20210223102125.iwps4h6yg3khc4aa@smtp.gmail.com>
 <CAKMK7uGNX4SxkeuM4qwhSCM08oCPP57=r_4xzkw8mecWbE8Wgw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGNX4SxkeuM4qwhSCM08oCPP57=r_4xzkw8mecWbE8Wgw@mail.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/23, Daniel Vetter wrote:
> On Tue, Feb 23, 2021 at 11:21 AM Melissa Wen <melissa.srw@gmail.com> wrote:
> >
> > On 02/22, Daniel Vetter wrote:
> > > On Sat, Feb 20, 2021 at 11:42:12AM -0300, Melissa Wen wrote:
> > > > Add support to overlay plane, in addition to primary and cursor
> > > > planes. In this approach, the plane composition still requires an
> > > > active primary plane and planes are composed associatively in the
> > > > order: (primary <- overlay) <- cursor
> > > >
> > > > It enables to run the following IGT tests successfully:
> > > > - kms_plane_cursor:
> > > >   - pipe-A-[overlay, primary, viewport]-size-[64, 128, 256]
> > > > - kms_atomic:
> > > >   - plane-overlay-legacy
> > > > and preserves the successful execution of kms_cursor_crc,
> > > > kms_writeback and kms_flip
> > > >
> > > > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++----------
> > > >  drivers/gpu/drm/vkms/vkms_drv.c      |  5 +++++
> > > >  drivers/gpu/drm/vkms/vkms_drv.h      |  1 +
> > > >  drivers/gpu/drm/vkms/vkms_output.c   | 17 +++++++++++++++--
> > > >  drivers/gpu/drm/vkms/vkms_plane.c    | 20 +++++++++++++++-----
> > > >  5 files changed, 53 insertions(+), 17 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > > > index be8f1d33c645..2116da9b5a43 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > > > @@ -144,11 +144,12 @@ static void compose_planes(struct vkms_composer *primary_composer,
> > > >
> > > >  static int composite(void **vaddr_out,
> > > >                  struct vkms_composer *primary_composer,
> > > > -                struct vkms_composer *cursor_composer)
> > > > +                struct vkms_crtc_state *crtc_state)
> > > >  {
> > > >     struct drm_framebuffer *fb = &primary_composer->fb;
> > > >     struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
> > > >     struct drm_gem_shmem_object *shmem_obj = to_drm_gem_shmem_obj(gem_obj);
> > > > +   int i;
> > > >
> > > >     if (!*vaddr_out) {
> > > >             *vaddr_out = kzalloc(shmem_obj->base.size, GFP_KERNEL);
> > > > @@ -163,8 +164,14 @@ static int composite(void **vaddr_out,
> > > >
> > > >     memcpy(*vaddr_out, shmem_obj->vaddr, shmem_obj->base.size);
> > > >
> > > > -   if (cursor_composer)
> > > > -           compose_planes(primary_composer, cursor_composer, *vaddr_out);
> > > > +   /* If there are other planes besides primary, we consider the active
> > > > +    * planes should be in z-order and compose them associatively:
> > > > +    * ((primary <- overlay) <- cursor)
> > > > +    */
> > > > +   for (i = 1; i < crtc_state->num_active_planes; i++)
> > > > +           compose_planes(primary_composer,
> > > > +                          crtc_state->active_planes[i]->composer,
> > > > +                          *vaddr_out);
> > > >
> > > >     return 0;
> > > >  }
> > > > @@ -186,7 +193,7 @@ void vkms_composer_worker(struct work_struct *work)
> > > >     struct drm_crtc *crtc = crtc_state->base.crtc;
> > > >     struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> > > >     struct vkms_composer *primary_composer = NULL;
> > > > -   struct vkms_composer *cursor_composer = NULL;
> > > > +   struct vkms_plane_state *act_plane = NULL;
> > > >     bool crc_pending, wb_pending;
> > > >     void *vaddr_out = NULL;
> > > >     u32 crc32 = 0;
> > > > @@ -210,11 +217,11 @@ void vkms_composer_worker(struct work_struct *work)
> > > >     if (!crc_pending)
> > > >             return;
> > > >
> > > > -   if (crtc_state->num_active_planes >= 1)
> > > > -           primary_composer = crtc_state->active_planes[0]->composer;
> > > > -
> > > > -   if (crtc_state->num_active_planes == 2)
> > > > -           cursor_composer = crtc_state->active_planes[1]->composer;
> > > > +   if (crtc_state->num_active_planes >= 1) {
> > > > +           act_plane = crtc_state->active_planes[0];
> > > > +           if (act_plane->base.plane->type == DRM_PLANE_TYPE_PRIMARY)
> > > > +                   primary_composer = act_plane->composer;
> > > > +   }
> > > >
> > > >     if (!primary_composer)
> > > >             return;
> > > > @@ -222,7 +229,7 @@ void vkms_composer_worker(struct work_struct *work)
> > > >     if (wb_pending)
> > > >             vaddr_out = crtc_state->active_writeback;
> > > >
> > > > -   ret = composite(&vaddr_out, primary_composer, cursor_composer);
> > > > +   ret = composite(&vaddr_out, primary_composer, crtc_state);
> > > >     if (ret) {
> > > >             if (ret == -EINVAL && !wb_pending)
> > > >                     kfree(vaddr_out);
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > index 2173b82606f6..027ffe759440 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > @@ -44,6 +44,10 @@ static bool enable_writeback = true;
> > > >  module_param_named(enable_writeback, enable_writeback, bool, 0444);
> > > >  MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector support");
> > > >
> > > > +static bool enable_overlay;
> > > > +module_param_named(enable_overlay, enable_overlay, bool, 0444);
> > > > +MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
> > > > +
> > > >  DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
> > > >
> > > >  static void vkms_release(struct drm_device *dev)
> > > > @@ -198,6 +202,7 @@ static int __init vkms_init(void)
> > > >
> > > >     config->cursor = enable_cursor;
> > > >     config->writeback = enable_writeback;
> > > > +   config->overlay = enable_overlay;
> > > >
> > > >     return vkms_create(config);
> > > >  }
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > > > index 9ad5ad8b7737..784219da8df0 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > > > @@ -85,6 +85,7 @@ struct vkms_device;
> > > >  struct vkms_config {
> > > >     bool writeback;
> > > >     bool cursor;
> > > > +   bool overlay;
> > > >     /* only set when instantiated */
> > > >     struct vkms_device *dev;
> > > >  };
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > > > index 05d3bb45e6c1..c60d0f2e7a37 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > > > @@ -39,7 +39,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > > >     struct drm_connector *connector = &output->connector;
> > > >     struct drm_encoder *encoder = &output->encoder;
> > > >     struct drm_crtc *crtc = &output->crtc;
> > > > -   struct drm_plane *primary, *cursor = NULL;
> > > > +   struct drm_plane *primary, *cursor = NULL, *overlay = NULL;
> > > >     int ret;
> > > >     int writeback;
> > > >
> > > > @@ -51,6 +51,16 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > > >     if (ret)
> > > >             goto err_crtc;
> > > >
> > > > +   if (vkmsdev->config->overlay) {
> > > > +           overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> > > > +           if (IS_ERR(overlay)) {
> > > > +                   ret = PTR_ERR(overlay);
> > > > +                   goto err_overlay;
> > > > +           }
> > > > +           if (overlay && !overlay->possible_crtcs)
> > > > +                   overlay->possible_crtcs = drm_crtc_mask(crtc);
> > > > +   }
> > > > +
> > > >     if (vkmsdev->config->cursor) {
> > > >             cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> > > >             if (IS_ERR(cursor)) {
> > > > @@ -58,7 +68,6 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > > >                     goto err_cursor;
> > > >             }
> > > >     }
> > > > -
> > > >     crtc->cursor = cursor;
> > > >     if (cursor && !cursor->possible_crtcs)
> > > >             cursor->possible_crtcs = drm_crtc_mask(crtc);
> > > > @@ -108,6 +117,10 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > > >     if (vkmsdev->config->cursor)
> > > >             drm_plane_cleanup(cursor);
> > > >
> > > > +err_overlay:
> > > > +   if (vkmsdev->config->overlay)
> > > > +           drm_plane_cleanup(overlay);
> > >
> > > Using drmm_universal_plane_init would be nice so we can ditch a bunch of
> > > this cleanup code, but can be done later. Same for crtc.
> >
> > Hmm.. I'll check it. Just to be sure, would it be drmm_universal_plane_alloc?
> 
> Yes.
> 
> > > > +
> > > >  err_crtc:
> > > >     drm_plane_cleanup(primary);
> > > >
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > > > index 0824327cc860..8e7bb84bc894 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > > @@ -19,6 +19,11 @@ static const u32 vkms_cursor_formats[] = {
> > > >     DRM_FORMAT_ARGB8888,
> > > >  };
> > > >
> > > > +static const u32 vkms_overlay_formats[] = {
> > > > +   DRM_FORMAT_ARGB8888,
> > > > +   DRM_FORMAT_XRGB8888,
> > >
> > > Does the blend function correctly work for XRGB, i.e. ignore the alpha
> > > channel? Maybe even split that functionality out into a separate patch
> > > (and then also add it for the cursor plane, so we keep one unified format
> > > list for non-primary planes) so it sticks out more.
> > >
> > Initially, I was also reusing the cursor formart, because ARGB makes
> > more sense to me. But I checked that IGT considers a XRGB overlay, that
> > is why I included both. I verified in tests using XRGB that the color is
> > received as a full-opaque RGB: [FF-RR-GG-BB] and the alpha_blending
> > function composes these two types correctly. If this is the regular
> > behavior for XRGB, I think I can unify cursor and overlay formats in the
> > previous patch that generalize some cursor variables for reusing.
> 
> Maybe I'm just not seeing it, but current blend code always uses alpha
> values, and I'm not seeing you change this. So how does this work? Are
> we just lucky and the alpha value for XRGB in igt tests is 0xff, so
> not transparent, and it all works out? For XRGB blending we must
> completely ignore dst colors, and just write src colors as the
> resulting color.

tbh, I didn't think it was luck, I thought 0xff was normal. But looking
at how the test works from that perspective, the opaque overlay may have
come from that: the test asks for a XRGB format and colors using
cairo_set_source_rgb and from cairo docs: "Sets the source pattern
within cr to an opaque color".

so, yes, I'll also include an approach for this in the next version.

Thanks again,

Melissa

> -Daniel
> 
> >
> > >
> > > > +};
> > > > +
> > > >  static struct drm_plane_state *
> > > >  vkms_plane_duplicate_state(struct drm_plane *plane)
> > > >  {
> > > > @@ -127,7 +132,7 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
> > > >     if (IS_ERR(crtc_state))
> > > >             return PTR_ERR(crtc_state);
> > > >
> > > > -   if (plane->type == DRM_PLANE_TYPE_CURSOR)
> > > > +   if (plane->type != DRM_PLANE_TYPE_PRIMARY)
> > > >             can_position = true;
> > > >
> > > >     ret = drm_atomic_helper_check_plane_state(state, crtc_state,
> > > > @@ -195,14 +200,19 @@ struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> > > >     int ret, nformats;
> > > >
> > > >     plane = kzalloc(sizeof(*plane), GFP_KERNEL);
> > > > -   if (!plane)
> > > > -           return ERR_PTR(-ENOMEM);
> > > >
> > > > -   if (type == DRM_PLANE_TYPE_CURSOR) {
> > > > +   switch (type) {
> > > > +   case DRM_PLANE_TYPE_CURSOR:
> > > >             formats = vkms_cursor_formats;
> > > >             nformats = ARRAY_SIZE(vkms_cursor_formats);
> > > >             funcs = &vkms_primary_helper_funcs;
> > > > -   } else {
> > > > +           break;
> > > > +   case DRM_PLANE_TYPE_OVERLAY:
> > > > +           formats = vkms_overlay_formats;
> > > > +           nformats = ARRAY_SIZE(vkms_overlay_formats);
> > > > +           funcs = &vkms_primary_helper_funcs;
> > > > +           break;
> > > > +   default:
> > > >             formats = vkms_formats;
> > > >             nformats = ARRAY_SIZE(vkms_formats);
> > > >             funcs = &vkms_primary_helper_funcs;
> > >
> > > Tbf my brain is somewhat toast today, but aside from the few questions I
> > > think this looks like a solid approach.
> >
> > Thanks for review. I'll address the improvements you pointed out here
> > and send a new version.
> >
> > Melissa
> >
> > >
> > > Cheers, Daniel
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
