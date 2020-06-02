Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2B01EBB6C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 14:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C1D8989C;
	Tue,  2 Jun 2020 12:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07CD8989C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 12:18:01 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id r9so1165809ual.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 05:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WQd65JdrIuZXHebA6USGvqPn3CMVEk7jUwm6XZRDHjM=;
 b=u5UFb2x7dOFvmbn54KARGcHKlOYMT19j0xlf6X5jRYfQNkt6PgwFEMkhjduczOuKUQ
 3vo73JZvAtJ/lPsZx4DWk7FLqk1+pZ9cjldVGZ7HBkYwt6ClzgC2lFsd9ArRe0HxnTrA
 1DNlNYhpU3n39O+yz/VtXsguV4j8mR9x0bgUfAWhKUQnKmRyMcOFEgsiQJ0ny0AHT6qs
 vO95Nz3Ea1CaXvU9MtvuWiHyWkLScHhvP/MVxFys1t3669g3u4wxlikyfLv4hS2S3/3T
 wNeorMFFKl5nosHbJR5Iw5V6SZ+S+5+RzI95n+aiY76dy2crl5gvZ3aEUQviQJECWM1c
 36jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WQd65JdrIuZXHebA6USGvqPn3CMVEk7jUwm6XZRDHjM=;
 b=OYssTMGXPYmnV8yqdXO1ht1vg5y9RLhPrMWa43RqJwLv7Mw3Zx6M6DTgE1oEeld8Og
 bJn+W+7Ms2wS+9Dvv7SVd75ug2BnetUuxtYdEZoGAhfv84P0hxPB+637Z/gDVI3IjyAj
 frV8OAf789h48H0ofkrku3hEVGyiYy3DidZ1Q8Qee2IH8GuMoNQ4yuY1+WL5a2Qmyl+E
 9nYs4QSNlFfgnZfxj+TFuRQIjDYMepSxSs41c1d7bwuV4YEyf397BrKlOQWuYwbnbi7r
 XbWLepE2YB/buVibM/S78VIXOW2AqX9KYnm9j7r6DJmPNcxAnGzTFcwIKeU9y0Tj/SFg
 DaoA==
X-Gm-Message-State: AOAM533OhjNI4pR5QQcDC6rXkjgZkGbuha8Ms9Ef1f2erL1IKw261KxC
 kPIRlUPA6arPcVJydkLf/hWr9NpF75GrbmpnaUM=
X-Google-Smtp-Source: ABdhPJz2cJ7CEK2QU8d4MvwWTRwIYLa89bAXoHcs0pj+zLGRas+wTtW9xsAw0qFtf/blSc+unw0ABlJZ1RchbM6qsiU=
X-Received: by 2002:ab0:2758:: with SMTP id c24mr4351437uap.64.1591100280930; 
 Tue, 02 Jun 2020 05:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200511115524.22602-1-Rodrigo.Siqueira@amd.com>
 <20200511115524.22602-4-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20200511115524.22602-4-Rodrigo.Siqueira@amd.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jun 2020 13:14:43 +0100
Message-ID: <CACvgo538kFaXq3jkwHb1DHvgd95Ss6ZcYVwYRQ7CX53PkB411g@mail.gmail.com>
Subject: Re: [PATCH V4 3/3] drm/vkms: Add support for writeback
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Helen Koike <helen.koike@collabora.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 May 2020 at 12:55, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com> wrote:

>  # SPDX-License-Identifier: GPL-2.0-only
> -vkms-y := vkms_drv.o vkms_plane.o vkms_output.o vkms_crtc.o vkms_gem.o vkms_composer.o
> +vkms-y := \
> +       vkms_drv.o \
> +       vkms_plane.o \
> +       vkms_output.o \
> +       vkms_crtc.o \
> +       vkms_gem.o \
> +       vkms_composer.o \
> +       vkms_writeback.o
>
Nit: sort alphabetically


> @@ -191,9 +192,12 @@ void vkms_composer_worker(struct work_struct *work)
>         if (!primary_composer)
>                 return;
>
> +       if (wb_pending)
> +               vaddr_out = crtc_state->active_writeback;
> +
>         ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
Forgot to mention earlier - with the allocation happening in the
caller, compose_planes() can take void *vaddr_out.

>         if (ret) {
> -               if (ret == -EINVAL)
> +               if (ret == -EINVAL && !wb_pending)
>                         kfree(vaddr_out);
>                 return;
>         }
> @@ -206,6 +210,14 @@ void vkms_composer_worker(struct work_struct *work)
>         while (frame_start <= frame_end)
>                 drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
>
> +       if (wb_pending) {
> +               drm_writeback_signal_completion(&out->wb_connector, 0);
> +               spin_lock_irq(&out->composer_lock);
> +               crtc_state->wb_pending = false;
> +               spin_unlock_irq(&out->composer_lock);
> +               return;
> +       }
> +
Just like the free() move this above the drm_crtc_add_crc_entry()

if (wb_pending) {
  signal()
  ...
} else {
  free()
}

> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 1e8b2169d834..34dd74dc8eb0 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -39,6 +39,10 @@ bool enable_cursor = true;
>  module_param_named(enable_cursor, enable_cursor, bool, 0444);
>  MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
>
> +bool enable_writeback;
> +module_param_named(enable_writeback, enable_writeback, bool, 0444);
> +MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector");
> +
Why is this a module parameter? Let's always enable it and leave it to
userspace whether to use the wb or not.

>  static const struct file_operations vkms_driver_fops = {
>         .owner          = THIS_MODULE,
>         .open           = drm_open,
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index f4036bb0b9a8..35f0b71413c9 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -8,6 +8,7 @@
>  #include <drm/drm.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_writeback.h>
>
>  #define XRES_MIN    20
>  #define YRES_MIN    20
> @@ -19,6 +20,7 @@
>  #define YRES_MAX  8192
>
>  extern bool enable_cursor;
> +extern bool enable_writeback;
>
>  struct vkms_composer {
>         struct drm_framebuffer fb;
> @@ -52,9 +54,11 @@ struct vkms_crtc_state {
>         int num_active_planes;
>         /* stack of active planes for crc computation, should be in z order */
>         struct vkms_plane_state **active_planes;
> +       void *active_writeback;
>
>         /* below three are protected by vkms_output.composer_lock */
Nit: s/below three/the following four/

>         bool crc_pending;
> +       bool wb_pending;
>         u64 frame_start;
>         u64 frame_end;
>  };
> @@ -63,6 +67,7 @@ struct vkms_output {
>         struct drm_crtc crtc;
>         struct drm_encoder encoder;
>         struct drm_connector connector;
> +       struct drm_writeback_connector wb_connector;
>         struct hrtimer vblank_hrtimer;
>         ktime_t period_ns;
>         struct drm_pending_vblank_event *event;
> @@ -144,4 +149,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
>  /* Composer Support */
>  void vkms_composer_worker(struct work_struct *work);
>
> +/* Writeback */
> +int enable_writeback_connector(struct vkms_device *vkmsdev);

Don't forget appropriate name spacing - prefix the function with vkms.

> +
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 85afb77e97f0..19ffc67affec 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -80,6 +80,16 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>                 goto err_attach;
>         }
>
> +       if (enable_writeback) {
> +               ret = enable_writeback_connector(vkmsdev);

With wb connector always enabled, you can kill off the
vkms_output::composer_enabled all together. Plus the info/error
warnings (below) can go as well.

> +               if (!ret) {
> +                       output->composer_enabled = true;
> +                       DRM_INFO("Writeback connector enabled");
> +               } else {
> +                       DRM_ERROR("Failed to init writeback connector\n");
> +               }
> +       }
> +
>         drm_mode_config_reset(dev);
>
>         return 0;
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> new file mode 100644
> index 000000000000..868f0d15ca9f
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include "vkms_drv.h"
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_writeback.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +
Nit: sort includes alphabetically.

> +static const u32 vkms_wb_formats[] = {
> +       DRM_FORMAT_XRGB8888,
> +};
> +
> +static const struct drm_connector_funcs vkms_wb_connector_funcs = {
> +       .fill_modes = drm_helper_probe_single_connector_modes,
> +       .destroy = drm_connector_cleanup,
> +       .reset = drm_atomic_helper_connector_reset,
> +       .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
> +                                       struct drm_crtc_state *crtc_state,
> +                                       struct drm_connector_state *conn_state)
> +{
> +       struct drm_framebuffer *fb;
> +       const struct drm_display_mode *mode = &crtc_state->mode;
> +
> +       if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
Drop the fb check.

> +               return 0;
> +
> +       fb = conn_state->writeback_job->fb;
> +       if (fb->width != mode->hdisplay || fb->height != mode->vdisplay) {
> +               DRM_DEBUG_KMS("Invalid framebuffer size %ux%u\n",
> +                             fb->width, fb->height);
> +               return -EINVAL;
> +       }
> +
> +       if (fb->format->format != DRM_FORMAT_XRGB8888) {
Use the vkms_wb_formats[], regardless if it's one entry or not.

> +               struct drm_format_name_buf format_name;
> +
> +               DRM_DEBUG_KMS("Invalid pixel format %s\n",
> +                             drm_get_format_name(fb->format->format,
> +                                                 &format_name));
> +               return -EINVAL;
> +       }
> +
> +       return 0;

Thinking out loud:
This function should be a helper that drivers can reuse and build
upon. The format might be tricky.
It's already in drm_writeback_connector::pixel_formats_blob_ptr, while
the function takes drm_writeback::encoder as argument.

But that for another patch series.


> +static void vkms_wb_atomic_commit(struct drm_connector *conn,
> +                                 struct drm_connector_state *state)
> +{
> +       struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
> +       struct vkms_output *output = &vkmsdev->output;
> +       struct drm_writeback_connector *wb_conn = &output->wb_connector;
> +       struct drm_connector_state *conn_state = wb_conn->base.state;
> +       struct vkms_crtc_state *crtc_state = output->composer_state;
> +
> +       if (!conn_state)
> +               return;
> +
> +       if (!conn_state->writeback_job || !conn_state->writeback_job->fb) {
Drop the fb check.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
