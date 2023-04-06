Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7632E6D9FB3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 20:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C1C8908B;
	Thu,  6 Apr 2023 18:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE2110E374
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 18:23:14 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-93abb185e13so20211366b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 11:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680805392; x=1683397392;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CIU9lIJEr0WTN9zB9FBoxSF7MW3xQgRZd86dK/mFhhE=;
 b=WD/oJ55qHJI2EAt4fspMK4ARG37aJl6AdIgz9cSKrdtwi8v/qI1E9Ws/dTovds2hd6
 D9S2bicCVcm4xvz8wnmE1mhOaMmI55+cfRYl52+BcnU9giEhYNJQvaKbLaSuS5CQywdx
 RVWvDkPHbt44ccPG2LM/KF7nQI4vB+sGbgNEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680805392; x=1683397392;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CIU9lIJEr0WTN9zB9FBoxSF7MW3xQgRZd86dK/mFhhE=;
 b=xQB1GDuz9kku43Iu36zRKsd8Gca1XgBDAY711yHB1CvhPTpCsh8l3CszyWfDQ3dU2C
 VBgHM2nomE1pfe7fEBRTS5VrdH56kS+6w8aIddnhcP1y6QJN0O0z0cZ38pYbgEtTRHHR
 dv6XK5ZBdCgHlv4fgL3ri9dccW1IoslD4RWu80eYWY5/9eK0Yp1nwtJAOYnDqBLqnOkj
 x6qKwia8/QTTjoDX1Shb1H+cn/q/gWX5rN2q3arpneU5QmwqHEmqfGYT8L0FhdqASOjM
 rlYcR4LgQSyUTtASIo4N8PgJwQaX0rFkE4MZwBPwuBQv/Ia7p94mgormanxZl1TolhMy
 6heQ==
X-Gm-Message-State: AAQBX9cdPbF5smZT7bNisNkWFpQs9sU18BM5o/mX1IAIEQKaXlNywvJM
 x1zXA5EJiZx9xB++LmLd0pARs0VpVxLfxOyqbu0=
X-Google-Smtp-Source: AKy350Zp/o+DaYTuHWzX5NS0AnxSfS2a+j4iMmzc0IQCA+9cwSpaBcO/GzJzfB5jgGrRi7UTLcZ7yQ==
X-Received: by 2002:a05:6402:4413:b0:502:1f7b:f0a6 with SMTP id
 y19-20020a056402441300b005021f7bf0a6mr590571eda.0.1680805392500; 
 Thu, 06 Apr 2023 11:23:12 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 q13-20020a50cc8d000000b004fbdfbb5acesm1025521edi.89.2023.04.06.11.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:23:12 -0700 (PDT)
Date: Thu, 6 Apr 2023 20:23:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/vkms: add module parameter to set background color
Message-ID: <ZC8ODj+1jXlf22zi@phenom.ffwll.local>
References: <20230406172002.124456-1-mcanal@igalia.com>
 <CAKMK7uETXGbd23KfvmCUz5BvmCHYdDFyZ0pbxzDBppViJe2JeQ@mail.gmail.com>
 <823a45d9-cb32-8592-98ce-8e81cad4e709@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <823a45d9-cb32-8592-98ce-8e81cad4e709@igalia.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 03:06:56PM -0300, Maíra Canal wrote:
> On 4/6/23 14:28, Daniel Vetter wrote:
> > On Thu, 6 Apr 2023 at 19:20, Maíra Canal <mcanal@igalia.com> wrote:
> > > 
> > > After commit 8ba1648567e2 ("drm: vkms: Refactor the plane composer to
> > > accept new formats") the composition is no longer performed on top of
> > > the primary plane, but instead on top of the CRTC, which means that
> > > now we have a background.
> > > 
> > > This opens to the possibility of coloring the background with a
> > > personalized color. Therefore, create a module parameter that takes a
> > > unsigned long number as an XRGB16161616 color and set the background
> > > color to it. That said, the composition will be performed on top of
> > > this background color. By default, the background color is black.
> > > 
> > > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> > > ---
> > > 
> > > This patch intends to add a background color property to vkms through
> > > a module parameter. Another option would be to implement this property
> > > by adding a new KMS property that would indicate the background color.
> > > It would be nice to hear other opinions on what would be the best
> > > approach.
> > 
> > These patches (and I think even igts for them) have been floating
> > around for years. The hang-up is the userspace. Turns out all
> > compositors want for background is black, thus far no one has figured
> > out a real use-case for anything else.
> > 
> > Maybe some time ...
> > 
> 
> But, would it be okay to add this feature as a vkms' module parameter?

Yeah I think that's ok.

> > > Moreover, I wrote some IGT tests to ensure that the functionality is
> > > working correctly [1]. The tests take the CRC of a colored primary
> > > plane, offset the primary plane out of the screen, and take the CRC
> > > of the colored background. The two CRC must be equal.
> > > 
> > > [1] https://gitlab.freedesktop.org/mairacanal/igt-gpu-tools/-/tree/vkms/background-color
> > 
> > I wonder whether it would be more useful to have this as a Kunit
> > validation test to very that the vkms composing code works correctly?
> > Still with the modparam and vkms_config to handle it all cleanly.
> 
> Not sure if this would fit as a unit test, as the vkms composing
> code basically outputs a CRC, which can be better verified by
> the userspace. The output_buffer and stage_buffer are internal
> variables, so it would be difficult to evaluate them with a KUnit
> test.
> 
> With the IGT test, we can assure that the background composition
> is being performed properly using the CRC in a negative test and
> also some positive tests.

I was just thinking of how you could keep the test, because igt is for
uapi in general. So doesn't fit all that well, validating internals is
more what kunit is supposed to do.
-Daniel

> 
> Best Regards,
> - Maíra Canal
> 
> > -Daniel
> > 
> > > 
> > > Best Regards,
> > > - Maíra Canal
> > > 
> > > ---
> > >   Documentation/gpu/vkms.rst           |  2 --
> > >   drivers/gpu/drm/vkms/vkms_composer.c | 20 ++++++++++++++------
> > >   drivers/gpu/drm/vkms/vkms_drv.c      |  6 ++++++
> > >   drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++++
> > >   4 files changed, 24 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > > index 49db221c0f52..dc01689d8c76 100644
> > > --- a/Documentation/gpu/vkms.rst
> > > +++ b/Documentation/gpu/vkms.rst
> > > @@ -121,8 +121,6 @@ There's lots of plane features we could add support for:
> > >   - ARGB format on primary plane: blend the primary plane into background with
> > >     translucent alpha.
> > > 
> > > -- Add background color KMS property[Good to get started].
> > > -
> > >   - Full alpha blending on all planes.
> > > 
> > >   - Rotation, scaling.
> > > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > > index 8e53fa80742b..07345faee98a 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > > @@ -79,7 +79,8 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
> > >    * from all planes, calculates the crc32 of the output from the former step,
> > >    * and, if necessary, convert and store the output to the writeback buffer.
> > >    */
> > > -static void blend(struct vkms_writeback_job *wb,
> > > +static void blend(struct vkms_device *vkms_dev,
> > > +                 struct vkms_writeback_job *wb,
> > >                    struct vkms_crtc_state *crtc_state,
> > >                    u32 *crc32, struct line_buffer *stage_buffer,
> > >                    struct line_buffer *output_buffer, size_t row_size)
> > > @@ -87,7 +88,12 @@ static void blend(struct vkms_writeback_job *wb,
> > >          struct vkms_plane_state **plane = crtc_state->active_planes;
> > >          u32 n_active_planes = crtc_state->num_active_planes;
> > > 
> > > -       const struct pixel_argb_u16 background_color = { .a = 0xffff };
> > > +       const struct pixel_argb_u16 background_color = {
> > > +               .a =  0xffff,
> > > +               .r = (*vkms_dev->config->background_color >> 32) & 0xffff,
> > > +               .g = (*vkms_dev->config->background_color >> 16) & 0xffff,
> > > +               .b = *vkms_dev->config->background_color & 0xffff,
> > > +       };
> > > 
> > >          size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
> > > 
> > > @@ -139,7 +145,8 @@ static int check_iosys_map(struct vkms_crtc_state *crtc_state)
> > >          return 0;
> > >   }
> > > 
> > > -static int compose_active_planes(struct vkms_writeback_job *active_wb,
> > > +static int compose_active_planes(struct vkms_device *vkms_dev,
> > > +                                struct vkms_writeback_job *active_wb,
> > >                                   struct vkms_crtc_state *crtc_state,
> > >                                   u32 *crc32)
> > >   {
> > > @@ -178,7 +185,7 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
> > >                  goto free_stage_buffer;
> > >          }
> > > 
> > > -       blend(active_wb, crtc_state, crc32, &stage_buffer,
> > > +       blend(vkms_dev, active_wb, crtc_state, crc32, &stage_buffer,
> > >                &output_buffer, line_width * pixel_size);
> > > 
> > >          kvfree(output_buffer.pixels);
> > > @@ -205,6 +212,7 @@ void vkms_composer_worker(struct work_struct *work)
> > >          struct drm_crtc *crtc = crtc_state->base.crtc;
> > >          struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
> > >          struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> > > +       struct vkms_device *vkms_dev = vkms_output_to_vkms_device(out);
> > >          bool crc_pending, wb_pending;
> > >          u64 frame_start, frame_end;
> > >          u32 crc32 = 0;
> > > @@ -228,9 +236,9 @@ void vkms_composer_worker(struct work_struct *work)
> > >                  return;
> > > 
> > >          if (wb_pending)
> > > -               ret = compose_active_planes(active_wb, crtc_state, &crc32);
> > > +               ret = compose_active_planes(vkms_dev, active_wb, crtc_state, &crc32);
> > >          else
> > > -               ret = compose_active_planes(NULL, crtc_state, &crc32);
> > > +               ret = compose_active_planes(vkms_dev, NULL, crtc_state, &crc32);
> > > 
> > >          if (ret)
> > >                  return;
> > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > index 6d3a2d57d992..a4938dcb8c3e 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > @@ -51,6 +51,10 @@ static bool enable_overlay;
> > >   module_param_named(enable_overlay, enable_overlay, bool, 0444);
> > >   MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
> > > 
> > > +static unsigned long background_color = 0x000000000000;
> > > +module_param_named(background_color, background_color, ulong, 0644);
> > > +MODULE_PARM_DESC(background_color, "Background color (0xRRRRGGGGBBBB)");
> > > +
> > >   DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
> > > 
> > >   static void vkms_release(struct drm_device *dev)
> > > @@ -99,6 +103,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
> > >          seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
> > >          seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
> > >          seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
> > > +       seq_printf(m, "background_color=0x%lx\n", *vkmsdev->config->background_color);
> > > 
> > >          return 0;
> > >   }
> > > @@ -226,6 +231,7 @@ static int __init vkms_init(void)
> > >          config->cursor = enable_cursor;
> > >          config->writeback = enable_writeback;
> > >          config->overlay = enable_overlay;
> > > +       config->background_color = &background_color;
> > > 
> > >          ret = vkms_create(config);
> > >          if (ret)
> > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > > index 4a248567efb2..4bc2e6a6d219 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > > @@ -113,6 +113,7 @@ struct vkms_config {
> > >          bool writeback;
> > >          bool cursor;
> > >          bool overlay;
> > > +       unsigned long *background_color;
> > >          /* only set when instantiated */
> > >          struct vkms_device *dev;
> > >   };
> > > @@ -127,6 +128,9 @@ struct vkms_device {
> > >   #define drm_crtc_to_vkms_output(target) \
> > >          container_of(target, struct vkms_output, crtc)
> > > 
> > > +#define vkms_output_to_vkms_device(target) \
> > > +       container_of(target, struct vkms_device, output)
> > > +
> > >   #define drm_device_to_vkms_device(target) \
> > >          container_of(target, struct vkms_device, drm)
> > > 
> > > --
> > > 2.39.2
> > > 
> > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
