Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D14324C70
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 10:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F43B6E141;
	Thu, 25 Feb 2021 09:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32C66E141
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 09:09:54 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id a13so5460658oid.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 01:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=biZ1wBWo+IyHAiu9LCZLsexjAROPaLNmbZ+cAEUO6bg=;
 b=ifW3yy/23dQuYLO8GrEzHZNy7uFEGWCbiAK1sGoswLbb8RLVtlEHGWKcd9yqFk4f6y
 oQQBbNPbaNGR1c48U4cHfLDBJ8/LtMqwQA4LY8ewcnRv00BLxoN1rhkeAn3JiVwRM0Pn
 yeJucFLFo/pyLGhD7qqePuo4jDgg1sj/ApMoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=biZ1wBWo+IyHAiu9LCZLsexjAROPaLNmbZ+cAEUO6bg=;
 b=ZYn4QU1e1cXDhokzWvtJ7sZoFPDug3GZ5QowyjAlXQk14orrFb8lVUoXric0BpjMfh
 Tw328DSXpQMdy4Gq/va5nx6QFD1J/GWAWaoHJyX+rrx8mI/lUv4gT48bC1KxVzCCHrMP
 oSqhszIi9gKlCmhs/k+4uFNDR+MX3JYgYm8RpAvUmb1P8vpCXO3NfJEB2CnSJg/1lDu7
 f84C56vMb29idK/87ULioctxpd9sKF2nn9hl4NmcBbOPcvAuUJwWR7aYG2xttlCQPfpg
 P6d/zin1LV0bhuZAJmCYjz49Gu12SlzHArG9bIqESILYIBCqDhKJ3GG37u1vOJV82lDk
 Flng==
X-Gm-Message-State: AOAM532fq2br75Xegbjkx6yEMa9uSSfc8y9dTKf+iCcAbT8SbTbXuSwO
 2ZKV/zUws46bpMOSr+uRSR0d/jVgVAFT/fO7aQqAlQ==
X-Google-Smtp-Source: ABdhPJwUdrB44gX2fDhU+Z9N/Jx4DWmJSOJ1GwoULyRjmRmUEsEkyCJ+xhSVfA2mO36NkZSx34vpPdfpaV3tCBpwj1Y=
X-Received: by 2002:a05:6808:4c9:: with SMTP id
 a9mr1261173oie.101.1614244193790; 
 Thu, 25 Feb 2021 01:09:53 -0800 (PST)
MIME-Version: 1.0
References: <20210224105509.yzdimgbu2jwe3auf@adolin>
In-Reply-To: <20210224105509.yzdimgbu2jwe3auf@adolin>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 25 Feb 2021 10:09:42 +0100
Message-ID: <CAKMK7uFwdHaaGs8BPSAah1Vp5pJWTzxoruLgOWxQu1aDAyCKLQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/vkms: Add support for virtual hardware mode
To: Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Zack Rusin <zackr@vmware.com>
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
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 24, 2021 at 11:55 AM Sumera Priyadarsini
<sylphrenadin@gmail.com> wrote:
>
> Add a virtual hardware or vblank-less mode as a module to enable
> VKMS to emulate virtual graphic drivers. This mode can be enabled
> by setting enable_virtual_hw=1 at the time of loading VKMS.
>
> A new function vkms_crtc_composer() has been added to bypass the
> vblank mode and is called directly in the atomic hook in
> vkms_atomic_begin(). However, some crc captures still use vblanks
> which causes the crc-based igt tests to crash. Currently, I am unsure
> about how to approach one-shot implementation of crc reads so I am
> still working on that.

Gerd, Zack: For virtual hw like virtio-gpu or vmwgfx that does
one-shot upload and damage tracking, what do you think is the best way
to capture crc for validation? Assuming that's even on the plans
anywhere ...

Ideally it'd be a crc that the host side captures, so that we really
have end-to-end validation, including the damage uploads and all that.

For vkms we're going for now with one-shot crc generation after each
atomic flip (or DIRTYFB ioctl call). Will need a pile of igt changes,
but seems like the most fitting model.
Other option would be that we'd wire up something on the kernel side
that generates a crc on-demand every time igt reads a new crc value
(maybe with some rate limiting). But that's not really how virtual hw
works when everything is pushed explicitly to the host side.

Thoughts?

> This patch has been tested with the igt tests, kms_writeback, kms_atomic,
> kms_lease, kms_flip, kms_pipe_get_crc and preserves results except for
> subtests related to crc reads and skips tests that rely on vertical
> blanking. This patch must be tested after incorporating the
> igt-tests patch: https://lists.freedesktop.org/archives/igt-dev/2021-February/029355.html .
>
> The patch is based on Rodrigo Siqueira's
> patch(https://patchwork.freedesktop.org/patch/316851/?series=48469&rev=3)
> and the ensuing review.
>
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>

I think the logic in the patch looks good, some comments below about polishing.
-Daniel

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 46 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_crtc.c     | 17 ++++++++--
>  drivers/gpu/drm/vkms/vkms_drv.c      | 18 ++++++++---
>  drivers/gpu/drm/vkms/vkms_drv.h      |  2 ++
>  4 files changed, 75 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 66c6842d70db..7a8aaf5c5555 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -247,6 +247,52 @@ void vkms_composer_worker(struct work_struct *work)
>                 drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
>  }
>
> +void vkms_crtc_composer(struct vkms_crtc_state *crtc_state)
> +{
> +       struct drm_crtc *crtc = crtc_state->base.crtc;
> +       struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> +       struct vkms_composer *primary_composer = NULL;
> +       struct vkms_composer *cursor_composer = NULL;
> +       void *vaddr_out = NULL;
> +       u32 crc32 = 0;
> +       int ret;
> +       bool wb_pending;
> +
> +       wb_pending = crtc_state->wb_pending;
> +
> +       if (crtc_state->num_active_planes >= 1)
> +               primary_composer = crtc_state->active_planes[0]->composer;
> +
> +       if (crtc_state->num_active_planes == 2)
> +               cursor_composer = crtc_state->active_planes[1]->composer;
> +
> +       if (!primary_composer)
> +               return;
> +
> +       if (wb_pending)
> +               vaddr_out = crtc_state->active_writeback;
> +
> +       ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
> +       if (ret) {
> +               if (ret == -EINVAL && !wb_pending)
> +                       kfree(vaddr_out);
> +               return;
> +       }
> +
> +       crc32 = compute_crc(vaddr_out, primary_composer);
> +
> +       if (wb_pending) {
> +               drm_writeback_signal_completion(&out->wb_connector, 0);
> +               spin_lock_irq(&out->composer_lock);
> +               crtc_state->wb_pending = false;
> +               spin_unlock_irq(&out->composer_lock);
> +       } else {
> +               kfree(vaddr_out);
> +       }
> +
> +       drm_crtc_add_crc_entry(crtc, true, 0, &crc32);
> +}

This duplicates code that we also have vkms_composer_worker(). It
would be good to if we can share this code (either by
composer_worker() call this function you add here, or by having a
composer_common function which does all the common parts.

I also realized that we have a problem now with the kzalloc in
compose_planes, that would need to be fixed up somehow. But can be
done in a follow up patch, and it's a bit tricky to explain exactly
why, but short summary is: We're not allowed to allocate memory from
the crtc commit functions, only from crtc_check callback.

Also since this is run while you hold a spinlock the kernel should
complain into dmesg. At least if the basic debug stuff is all enabled,
CONFIG_DEBUG_ATOMIC_SLEEP is the Kconfig option you need. Would be
good to check that.

> +
>  static const char * const pipe_crc_sources[] = {"auto"};
>
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 6164349cdf11..38de791a4882 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -224,13 +224,19 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
>  static void vkms_crtc_atomic_enable(struct drm_crtc *crtc,
>                                     struct drm_atomic_state *state)
>  {
> -       drm_crtc_vblank_on(crtc);
> +       struct vkms_device *vkmsdev = drm_device_to_vkms_device(crtc->dev);
> +
> +       if (!vkmsdev->config->virtual_hw)
> +               drm_crtc_vblank_on(crtc);
>  }
>
>  static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
>                                      struct drm_atomic_state *state)
>  {
> -       drm_crtc_vblank_off(crtc);
> +       struct vkms_device *vkmsdev = drm_device_to_vkms_device(crtc->dev);
> +
> +       if (!vkmsdev->config->virtual_hw)
> +               drm_crtc_vblank_off(crtc);
>  }
>
>  static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
> @@ -248,8 +254,13 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>                                    struct drm_atomic_state *state)
>  {
>         struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
> +       struct vkms_crtc_state *vkms_state = to_vkms_crtc_state(crtc->state);
> +       struct vkms_device *vkmsdev = drm_device_to_vkms_device(crtc->dev);
> +
> +       if (vkmsdev->config->virtual_hw)
> +               vkms_crtc_composer(vkms_state);

We're holding vkms_output->lock spinlock while doing this fairly
expensive computation, that's not good. And this spinlock was only
there to protect against concurrent access from the vblank hrtimer, so
we don't really need this I think, and can make it conditional on
!virtual_hw too.

At that point all our crtc functions have conditions for virtual hw
(except atomic_check), so I think it'd be cleaner to duplicate the
functions into vkms_vblank_crtc_* and vkms_virtual_crtc, with two
struct drm_crtc_helper_funcs and we do the if once when we set up the
crtc in vkms_crtc_init.

>
> -       if (crtc->state->event) {
> +       if (crtc->state->event && !vkmsdev->config->virtual_hw) {
>                 spin_lock(&crtc->dev->event_lock);
>
>                 if (drm_crtc_vblank_get(crtc) != 0)
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 2173b82606f6..945c4495d62a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -44,6 +44,11 @@ static bool enable_writeback = true;
>  module_param_named(enable_writeback, enable_writeback, bool, 0444);
>  MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector support");
>
> +static bool enable_virtual_hw = false;
> +module_param_named(enable_virtual_hw, enable_virtual_hw, bool, 0444);
> +MODULE_PARM_DESC(enable_virtual_hw, "Enable/Disable virtual hardware mode(virtual \
> +hardware mode disables vblank interrupts)");
> +
>  DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>
>  static void vkms_release(struct drm_device *dev)
> @@ -159,12 +164,14 @@ static int vkms_create(struct vkms_config *config)
>                 goto out_devres;
>         }
>
> -       vkms_device->drm.irq_enabled = true;
> +       vkms_device->drm.irq_enabled = !vkms_device->config->virtual_hw;
>
> -       ret = drm_vblank_init(&vkms_device->drm, 1);
> -       if (ret) {
> -               DRM_ERROR("Failed to vblank\n");
> -               goto out_devres;
> +       if (!vkms_device->config->virtual_hw) {
> +               ret = drm_vblank_init(&vkms_device->drm, 1);
> +               if (ret) {
> +                       DRM_ERROR("Failed to vblank\n");
> +                       goto out_devres;
> +               }
>         }
>
>         ret = vkms_modeset_init(vkms_device);
> @@ -198,6 +205,7 @@ static int __init vkms_init(void)
>
>         config->cursor = enable_cursor;
>         config->writeback = enable_writeback;
> +       config->virtual_hw = enable_virtual_hw;
>
>         return vkms_create(config);
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 35540c7c4416..d4a45518639c 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -85,6 +85,7 @@ struct vkms_device;
>  struct vkms_config {
>         bool writeback;
>         bool cursor;
> +       bool virtual_hw;
>         /* only set when instantiated */
>         struct vkms_device *dev;
>  };
> @@ -127,6 +128,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
>  /* Composer Support */
>  void vkms_composer_worker(struct work_struct *work);
>  void vkms_set_composer(struct vkms_output *out, bool enabled);
> +void vkms_crtc_composer(struct vkms_crtc_state *crtc_state);
>
>  /* Writeback */
>  int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> --
> 2.25.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
