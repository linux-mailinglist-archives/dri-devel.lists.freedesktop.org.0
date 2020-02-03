Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1E5151121
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 21:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2476ECF7;
	Mon,  3 Feb 2020 20:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A226ECF6;
 Mon,  3 Feb 2020 20:39:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a9so906670wmj.3;
 Mon, 03 Feb 2020 12:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mOB+jXb70psFwK6ilNyJvCjU6t2LYt+4h3WNAoOnGBQ=;
 b=oRxezjuqZkM1EZRn8OD6Aazas+pCiWl2XxZnL3WkFkHfKAX0y8nlbb7X5wixjp47Hz
 f0hlar9LplYIlfF7bRpfEST4n6OULQzG0vEOnZjvfmbzuk4REE0qOFBmFTySB6eFfkDv
 5XAyI2omeCL4fS7Au6HVxVGngPBiI9Yq4UyPdof5w70BhNN2fPyhegfB//s+zYh/XZhX
 +1zgb8oIX2RdlnQa46Q4QzdBQQE1zA9YqVUdVFNTbJkk3lcNh7fQovkchaQsQprzEqIB
 wCqcU9fvHjbnrCD8A+kk7KJ56HqeQjmw41+dhOQHErvOtoFXcV9ijhNdeq3mOpWPRqLB
 IL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mOB+jXb70psFwK6ilNyJvCjU6t2LYt+4h3WNAoOnGBQ=;
 b=V/veBa1UqHleNPdXRFrCa1R/nv9FHDRAVppNlKkskxvR34QmEU9Q7GUxLMbiB/h/VE
 1oskjFh5mzsCB10N268z77LSypvKocxHjzjR+73V78V+wIal1NUz7SdXENnfX3mv6pFz
 CCO7cyTMipQhQsTHoRrh9Hr4MDvo+YW/7eie5fuWjITDdCtiyYyoiWiLWmfh5glS/utM
 jYxzLa8xFzgGmw++NBhnWVdsUO54h9YJ6E7JvdSWV9Pa80XhFJem2ZI5in6wqVaZw86Q
 39U/MmE5fv3xRgHJkZj8zZAKCbCt3geYwaPWnN9wQfO8Vjg2zPOdWzZR5eZ6bW5cNzel
 3TZg==
X-Gm-Message-State: APjAAAXe5S2KHHk7aFak641NSWIf1gefhOcp6Sxj7Vrhib6r8HDSQmXo
 XuYGMvsjV7BQ/gxIySQnBiDNxZGMvxB7au615Mw=
X-Google-Smtp-Source: APXvYqxvTdOavw69tuuAGfm7oJ9JVYTNTSKrsIsXBFt/8TWLfz8KY2AQETn8wjig5LG4ek97Cl+wnCAPHFTSB+EGzRg=
X-Received: by 2002:a1c:f009:: with SMTP id a9mr806440wmb.73.1580762393328;
 Mon, 03 Feb 2020 12:39:53 -0800 (PST)
MIME-Version: 1.0
References: <20200123135943.24140-1-tzimmermann@suse.de>
 <20200123135943.24140-11-tzimmermann@suse.de>
In-Reply-To: <20200123135943.24140-11-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 3 Feb 2020 15:39:42 -0500
Message-ID: <CADnq5_M89Hmx-5n+sJgWvMAwcwtvtF31kfjEfui1hUukxaFrvg@mail.gmail.com>
Subject: Re: [PATCH v4 10/22] drm/radeon: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, Dave Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, alexandre.torgue@st.com,
 Thomas Hellstrom <thellstrom@vmware.com>, Sean Paul <sean@poorly.run>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, mcoquelin.stm32@gmail.com,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vincent Abriou <vincent.abriou@st.com>,
 rodrigosiqueiramelo@gmail.com, philippe.cornu@st.com, yannick.fertre@st.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 23, 2020 at 9:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The callback struct drm_driver.get_scanout_position() is deprecated in
> favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
> radeon over.
>
> v4:
>         * 80-character line fixes
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/radeon/atombios_crtc.c      |  1 +
>  drivers/gpu/drm/radeon/radeon_display.c     | 13 +++++++++++++
>  drivers/gpu/drm/radeon/radeon_drv.c         | 11 -----------
>  drivers/gpu/drm/radeon/radeon_legacy_crtc.c |  3 ++-
>  drivers/gpu/drm/radeon/radeon_mode.h        |  6 ++++++
>  5 files changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
> index be583695427a..91811757104c 100644
> --- a/drivers/gpu/drm/radeon/atombios_crtc.c
> +++ b/drivers/gpu/drm/radeon/atombios_crtc.c
> @@ -2231,6 +2231,7 @@ static const struct drm_crtc_helper_funcs atombios_helper_funcs = {
>         .prepare = atombios_crtc_prepare,
>         .commit = atombios_crtc_commit,
>         .disable = atombios_crtc_disable,
> +       .get_scanout_position = radeon_get_crtc_scanout_position,
>  };
>
>  void radeon_atombios_init_crtc(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 856526cb2caf..2f641f3b39e7 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1978,3 +1978,16 @@ int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
>
>         return ret;
>  }
> +
> +bool
> +radeon_get_crtc_scanout_position(struct drm_crtc *crtc,
> +                                bool in_vblank_irq, int *vpos, int *hpos,
> +                                ktime_t *stime, ktime_t *etime,
> +                                const struct drm_display_mode *mode)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
> +
> +       return radeon_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
> +                                         stime, etime, mode);
> +}
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index fd74e2611185..1f597f166bff 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -563,16 +563,6 @@ static const struct file_operations radeon_driver_kms_fops = {
>  #endif
>  };
>
> -static bool
> -radeon_get_crtc_scanout_position(struct drm_device *dev, unsigned int pipe,
> -                                bool in_vblank_irq, int *vpos, int *hpos,
> -                                ktime_t *stime, ktime_t *etime,
> -                                const struct drm_display_mode *mode)
> -{
> -       return radeon_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
> -                                         stime, etime, mode);
> -}
> -
>  static struct drm_driver kms_driver = {
>         .driver_features =
>             DRIVER_USE_AGP | DRIVER_GEM | DRIVER_RENDER,
> @@ -585,7 +575,6 @@ static struct drm_driver kms_driver = {
>         .enable_vblank = radeon_enable_vblank_kms,
>         .disable_vblank = radeon_disable_vblank_kms,
>         .get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
> -       .get_scanout_position = radeon_get_crtc_scanout_position,
>         .irq_preinstall = radeon_driver_irq_preinstall_kms,
>         .irq_postinstall = radeon_driver_irq_postinstall_kms,
>         .irq_uninstall = radeon_driver_irq_uninstall_kms,
> diff --git a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
> index a1985a552794..8817fd033cd0 100644
> --- a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
> +++ b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
> @@ -1111,7 +1111,8 @@ static const struct drm_crtc_helper_funcs legacy_helper_funcs = {
>         .mode_set_base_atomic = radeon_crtc_set_base_atomic,
>         .prepare = radeon_crtc_prepare,
>         .commit = radeon_crtc_commit,
> -       .disable = radeon_crtc_disable
> +       .disable = radeon_crtc_disable,
> +       .get_scanout_position = radeon_get_crtc_scanout_position,
>  };
>
>
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
> index fd470d6bf3f4..3a61530c1398 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -881,6 +881,12 @@ extern int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
>                                       ktime_t *stime, ktime_t *etime,
>                                       const struct drm_display_mode *mode);
>
> +extern bool
> +radeon_get_crtc_scanout_position(struct drm_crtc *crtc, bool in_vblank_irq,
> +                                int *vpos, int *hpos,
> +                                ktime_t *stime, ktime_t *etime,
> +                                const struct drm_display_mode *mode);
> +
>  extern bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev);
>  extern struct edid *
>  radeon_bios_get_hardcoded_edid(struct radeon_device *rdev);
> --
> 2.24.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
