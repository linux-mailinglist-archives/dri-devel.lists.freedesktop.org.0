Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E3313995B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 19:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9296E140;
	Mon, 13 Jan 2020 18:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2545B6E13F;
 Mon, 13 Jan 2020 18:53:49 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f129so10902453wmf.2;
 Mon, 13 Jan 2020 10:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SF/Wi85S5n1xdzO1hvPlQhKHblcAljCOJxr1B1/T1YA=;
 b=KryaEP5El2yN/C3mRCOXFYLzIzRtKtUEc486wD8o0szSXiawXpQuA7RHqsUDD1eqjm
 Z1s2WpAw3Xz3H6MFxnennH0KAVKciL2/ihQcu3C8/tckdd9O4PozRQNUugrmYIIYRZCr
 Aang5d30YTGaZx+io8Yrm+YO1bkPtsZcIhqTsetIk0ViQTidlRN1nXkfqIPnJVTXQKv4
 5z2SwgzpqiIUMyIf2ZT2Wk9ATTx9ja3bhem6kfLmSfKtHu5TTV5gTD0rVmpwKfZ5OUVH
 PeGJW2osDgr7THwAnp0gwEy9iUXw4CCxLKMpbOlTXggqK/1h6/GF9Tm0r0bg3ynaxlhn
 2sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SF/Wi85S5n1xdzO1hvPlQhKHblcAljCOJxr1B1/T1YA=;
 b=toE5YajCFT0ge+pzh3c7qk1GWvyK0h2iq7SKoA+KN32a61pV2HKiTekNRwrOUAL0XJ
 FP3QtBqQWNDUKC7G1xPRZ9d/DjZj4Gqon0edITrYT8NpWHLFbHX08iR4tnpHJFa/RzDQ
 haMhJJRQMOc4H4OTcsugXRC3XTdeW2/Gd+GMDuiqgh1TVtKxxL5D1YfWUupjkGwVWPyw
 4nKI9W/IF++TRBIYoIuK0mtZFSNyqtihqRb59Br0WY2huEGmZu1Uycwof2sdWDgSHoqN
 nTHQk2oEOZfQnV+V2bZTxrnwzJfX7oDtQEefizl1Q7HR6qY7TaSuEVsWN5UMYcqPJ7qW
 2Kew==
X-Gm-Message-State: APjAAAWgpzS1r7z5BouYKy+JJc3tdfKklqBozGa49kktPs0iq4O7DWhB
 a/94ILAFTuLzlj5tQlJF2A3gvzZb+w0I8DRhIXc=
X-Google-Smtp-Source: APXvYqx1XH8YMhTCUnSr3geQn5IAdILwqDMFJDTIJxRsowMopv7y+dLJJYNqZhoNSkDuYuz6w3vNKIFhNgGkEITVdc4=
X-Received: by 2002:a1c:6404:: with SMTP id y4mr22030245wmb.143.1578941627774; 
 Mon, 13 Jan 2020 10:53:47 -0800 (PST)
MIME-Version: 1.0
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-6-tzimmermann@suse.de>
In-Reply-To: <20200110092127.27847-6-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Jan 2020 13:53:36 -0500
Message-ID: <CADnq5_NWuue-Y38vrU3mxawW6S0My5EvpgjWT2WFHm8ohwS2mQ@mail.gmail.com>
Subject: Re: [PATCH 05/23] drm/radeon: Convert to struct
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

On Fri, Jan 10, 2020 at 4:22 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The callback struct drm_driver.get_scanout_position() is deprecated in
> favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
> radeon over.
>

I'd prefer to just change the signature of
radeon_get_crtc_scanoutpos() to match the new API.

Alex

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/radeon/atombios_crtc.c      |  1 +
>  drivers/gpu/drm/radeon/radeon_display.c     | 13 +++++++++++++
>  drivers/gpu/drm/radeon/radeon_drv.c         | 11 -----------
>  drivers/gpu/drm/radeon/radeon_legacy_crtc.c |  3 ++-
>  drivers/gpu/drm/radeon/radeon_mode.h        |  6 ++++++
>  5 files changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
> index da2c9e295408..447d74b78f19 100644
> --- a/drivers/gpu/drm/radeon/atombios_crtc.c
> +++ b/drivers/gpu/drm/radeon/atombios_crtc.c
> @@ -2232,6 +2232,7 @@ static const struct drm_crtc_helper_funcs atombios_helper_funcs = {
>         .prepare = atombios_crtc_prepare,
>         .commit = atombios_crtc_commit,
>         .disable = atombios_crtc_disable,
> +       .get_scanout_position = radeon_get_crtc_scanout_position,
>  };
>
>  void radeon_atombios_init_crtc(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 962575e27cde..7187158b9963 100644
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
> index fd470d6bf3f4..06c4c527d376 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -881,6 +881,12 @@ extern int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
>                                       ktime_t *stime, ktime_t *etime,
>                                       const struct drm_display_mode *mode);
>
> +extern bool radeon_get_crtc_scanout_position(struct drm_crtc *crtc,
> +                                            bool in_vblank_irq, int *vpos,
> +                                            int *hpos, ktime_t *stime,
> +                                            ktime_t *etime,
> +                                            const struct drm_display_mode *mode);
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
