Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712EC6D9EBA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 19:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E0A10E239;
	Thu,  6 Apr 2023 17:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FB910E239
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 17:28:23 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-17ab3a48158so43122379fac.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680802102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VmIgTfwmNj8ELHt6cOnaLANnoUv0hW88tRY0lALqejE=;
 b=lC4C0imnYJ7ILquul6gHk7yP2PcQS+NeArGms3w57d1INw36DZckwapIFLPjdEO9Ys
 CBXJ4SIhYJFZrj0Yp5xKX93nTobHZ0vk0rUuIqmFr+aEnP3H4IDn37uH/7hPvP6Ie8Dl
 rWAr/XGcSPG7Tpdgts0hh0a6osLDWJXUTOLKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680802102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VmIgTfwmNj8ELHt6cOnaLANnoUv0hW88tRY0lALqejE=;
 b=nJV9nJW/hpnEmUADga70k0lzUIMlblDNlBQvXTmXaOnmURVD1NhlPzVj/VxBSgz4Kj
 dLmkAC6ZZphKuhKrlve5bGIMIgsRZSChJk7I5JcX4KeLw6KIzq21cTfGXeMopZqU2YKF
 orGNIxS61FveywdLMEMo3q0y1OkamFzdQ0GLM1t5jpiSSQMiRCAD5OeeL1B92Glq3vab
 qqAIlVqb8NVQNuN6a14y53emWnKKd2PO1mqZ76wn3m5pWpVoM9gpsmGytdI6aN+GYljz
 UJ7DjQrLA2RHTrVPx/veiI8sIu97lqvGKV/TCLRI8UbLXfj417ubdHc1cXlsZz7165Og
 31jw==
X-Gm-Message-State: AAQBX9fdL7fQyVluRyAOK+9Br649nnTmvzivHt96JAjArRj7qyRzIr3H
 Y6gCsfhWN+bdDVSlTnrjlaE2DHj5M3AFc6KxrrdDPw==
X-Google-Smtp-Source: AKy350Y+dkbv8E7l/JrjKZoUBwy9YnqgxW0IzXX+1RF49eRrYSu/N+G2/4XhtFUIRYV2phWJwz91DS2d5u3q375nE5g=
X-Received: by 2002:a05:6870:1394:b0:17e:3fe:6711 with SMTP id
 20-20020a056870139400b0017e03fe6711mr3047407oas.2.1680802102373; Thu, 06 Apr
 2023 10:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230406172002.124456-1-mcanal@igalia.com>
In-Reply-To: <20230406172002.124456-1-mcanal@igalia.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 6 Apr 2023 19:28:10 +0200
Message-ID: <CAKMK7uETXGbd23KfvmCUz5BvmCHYdDFyZ0pbxzDBppViJe2JeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: add module parameter to set background color
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 6 Apr 2023 at 19:20, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> After commit 8ba1648567e2 ("drm: vkms: Refactor the plane composer to
> accept new formats") the composition is no longer performed on top of
> the primary plane, but instead on top of the CRTC, which means that
> now we have a background.
>
> This opens to the possibility of coloring the background with a
> personalized color. Therefore, create a module parameter that takes a
> unsigned long number as an XRGB16161616 color and set the background
> color to it. That said, the composition will be performed on top of
> this background color. By default, the background color is black.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>
> This patch intends to add a background color property to vkms through
> a module parameter. Another option would be to implement this property
> by adding a new KMS property that would indicate the background color.
> It would be nice to hear other opinions on what would be the best
> approach.

These patches (and I think even igts for them) have been floating
around for years. The hang-up is the userspace. Turns out all
compositors want for background is black, thus far no one has figured
out a real use-case for anything else.

Maybe some time ...

> Moreover, I wrote some IGT tests to ensure that the functionality is
> working correctly [1]. The tests take the CRC of a colored primary
> plane, offset the primary plane out of the screen, and take the CRC
> of the colored background. The two CRC must be equal.
>
> [1] https://gitlab.freedesktop.org/mairacanal/igt-gpu-tools/-/tree/vkms/b=
ackground-color

I wonder whether it would be more useful to have this as a Kunit
validation test to very that the vkms composing code works correctly?
Still with the modparam and vkms_config to handle it all cleanly.
-Daniel

>
> Best Regards,
> - Ma=C3=ADra Canal
>
> ---
>  Documentation/gpu/vkms.rst           |  2 --
>  drivers/gpu/drm/vkms/vkms_composer.c | 20 ++++++++++++++------
>  drivers/gpu/drm/vkms/vkms_drv.c      |  6 ++++++
>  drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++++
>  4 files changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 49db221c0f52..dc01689d8c76 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -121,8 +121,6 @@ There's lots of plane features we could add support f=
or:
>  - ARGB format on primary plane: blend the primary plane into background =
with
>    translucent alpha.
>
> -- Add background color KMS property[Good to get started].
> -
>  - Full alpha blending on all planes.
>
>  - Rotation, scaling.
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 8e53fa80742b..07345faee98a 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -79,7 +79,8 @@ static void fill_background(const struct pixel_argb_u16=
 *background_color,
>   * from all planes, calculates the crc32 of the output from the former s=
tep,
>   * and, if necessary, convert and store the output to the writeback buff=
er.
>   */
> -static void blend(struct vkms_writeback_job *wb,
> +static void blend(struct vkms_device *vkms_dev,
> +                 struct vkms_writeback_job *wb,
>                   struct vkms_crtc_state *crtc_state,
>                   u32 *crc32, struct line_buffer *stage_buffer,
>                   struct line_buffer *output_buffer, size_t row_size)
> @@ -87,7 +88,12 @@ static void blend(struct vkms_writeback_job *wb,
>         struct vkms_plane_state **plane =3D crtc_state->active_planes;
>         u32 n_active_planes =3D crtc_state->num_active_planes;
>
> -       const struct pixel_argb_u16 background_color =3D { .a =3D 0xffff =
};
> +       const struct pixel_argb_u16 background_color =3D {
> +               .a =3D  0xffff,
> +               .r =3D (*vkms_dev->config->background_color >> 32) & 0xff=
ff,
> +               .g =3D (*vkms_dev->config->background_color >> 16) & 0xff=
ff,
> +               .b =3D *vkms_dev->config->background_color & 0xffff,
> +       };
>
>         size_t crtc_y_limit =3D crtc_state->base.crtc->mode.vdisplay;
>
> @@ -139,7 +145,8 @@ static int check_iosys_map(struct vkms_crtc_state *cr=
tc_state)
>         return 0;
>  }
>
> -static int compose_active_planes(struct vkms_writeback_job *active_wb,
> +static int compose_active_planes(struct vkms_device *vkms_dev,
> +                                struct vkms_writeback_job *active_wb,
>                                  struct vkms_crtc_state *crtc_state,
>                                  u32 *crc32)
>  {
> @@ -178,7 +185,7 @@ static int compose_active_planes(struct vkms_writebac=
k_job *active_wb,
>                 goto free_stage_buffer;
>         }
>
> -       blend(active_wb, crtc_state, crc32, &stage_buffer,
> +       blend(vkms_dev, active_wb, crtc_state, crc32, &stage_buffer,
>               &output_buffer, line_width * pixel_size);
>
>         kvfree(output_buffer.pixels);
> @@ -205,6 +212,7 @@ void vkms_composer_worker(struct work_struct *work)
>         struct drm_crtc *crtc =3D crtc_state->base.crtc;
>         struct vkms_writeback_job *active_wb =3D crtc_state->active_write=
back;
>         struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
> +       struct vkms_device *vkms_dev =3D vkms_output_to_vkms_device(out);
>         bool crc_pending, wb_pending;
>         u64 frame_start, frame_end;
>         u32 crc32 =3D 0;
> @@ -228,9 +236,9 @@ void vkms_composer_worker(struct work_struct *work)
>                 return;
>
>         if (wb_pending)
> -               ret =3D compose_active_planes(active_wb, crtc_state, &crc=
32);
> +               ret =3D compose_active_planes(vkms_dev, active_wb, crtc_s=
tate, &crc32);
>         else
> -               ret =3D compose_active_planes(NULL, crtc_state, &crc32);
> +               ret =3D compose_active_planes(vkms_dev, NULL, crtc_state,=
 &crc32);
>
>         if (ret)
>                 return;
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 6d3a2d57d992..a4938dcb8c3e 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -51,6 +51,10 @@ static bool enable_overlay;
>  module_param_named(enable_overlay, enable_overlay, bool, 0444);
>  MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
>
> +static unsigned long background_color =3D 0x000000000000;
> +module_param_named(background_color, background_color, ulong, 0644);
> +MODULE_PARM_DESC(background_color, "Background color (0xRRRRGGGGBBBB)");
> +
>  DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>
>  static void vkms_release(struct drm_device *dev)
> @@ -99,6 +103,7 @@ static int vkms_config_show(struct seq_file *m, void *=
data)
>         seq_printf(m, "writeback=3D%d\n", vkmsdev->config->writeback);
>         seq_printf(m, "cursor=3D%d\n", vkmsdev->config->cursor);
>         seq_printf(m, "overlay=3D%d\n", vkmsdev->config->overlay);
> +       seq_printf(m, "background_color=3D0x%lx\n", *vkmsdev->config->bac=
kground_color);
>
>         return 0;
>  }
> @@ -226,6 +231,7 @@ static int __init vkms_init(void)
>         config->cursor =3D enable_cursor;
>         config->writeback =3D enable_writeback;
>         config->overlay =3D enable_overlay;
> +       config->background_color =3D &background_color;
>
>         ret =3D vkms_create(config);
>         if (ret)
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 4a248567efb2..4bc2e6a6d219 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -113,6 +113,7 @@ struct vkms_config {
>         bool writeback;
>         bool cursor;
>         bool overlay;
> +       unsigned long *background_color;
>         /* only set when instantiated */
>         struct vkms_device *dev;
>  };
> @@ -127,6 +128,9 @@ struct vkms_device {
>  #define drm_crtc_to_vkms_output(target) \
>         container_of(target, struct vkms_output, crtc)
>
> +#define vkms_output_to_vkms_device(target) \
> +       container_of(target, struct vkms_device, output)
> +
>  #define drm_device_to_vkms_device(target) \
>         container_of(target, struct vkms_device, drm)
>
> --
> 2.39.2
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
