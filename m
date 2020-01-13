Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6B7139983
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 20:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E0F6E14C;
	Mon, 13 Jan 2020 19:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F38A6E139;
 Mon, 13 Jan 2020 19:01:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g17so9760410wro.2;
 Mon, 13 Jan 2020 11:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=txhlzjhtz2crzIWsW0US0XlO6E3afS+6WvmgblPj+ME=;
 b=cIDnciPyl7/fEXw5tnpLgZ5lOzZmAY+wCslzxyqKNiJNJdNdEE0F+3wR0spGp3tY0T
 LzmkQvJjRlEpMc34ZsuBQUsNHdFR17cMZ6mC8dU1Nl7+bbB50RxBGGDtuV9JDMPXHxQs
 ARuKN9zZgD9aXy9ldvKO6bjSEpsv5QPgqnobyejey4BhiBmIMTqOt8YJwoxKHEvsh0lE
 uBwUk9t/BMsYsTtBCdKWPbAw6lhjgVQOUoC0JiJcWHgMmdFd5vM/6JyHYLX8hzQQBJx2
 N8/nHtsHhBTYoKYCSkhWISyww7D+43AFI2jdJM5kUttfuMXCSEyzvknFNpBN0lOjpfAX
 Tqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=txhlzjhtz2crzIWsW0US0XlO6E3afS+6WvmgblPj+ME=;
 b=ApkIz47J5rRCUgZv962Bw+kJn+iFKRmoOFW2eJtOATpJmIcZDVsFAOE5kWrGnSIgdZ
 OsrzLYlwvO/GzR+gYfKtVpO+nvDCOSAM9cEg15pqajfsd4cLuhVdfyaLo2a8GoKTJcnl
 P/2WmUL7gPOJICHU6lsk7+wPJ9lwLzsbN26CJ5pZlbqr0Za1XvLjrwYXFz3UcCz6iIdS
 StU+v12zKFWxSXsx7mddzLldxYG/h/sk8wltmSURaji7ZFNcImy+A6QmQGmQ5IWwXA3h
 xzv4D5+IkdV1pJvUv7ysBW6b3rHcMYyPtFx9mona3TwTZswB1/7l6FKra/2K/AV0bF60
 bgWg==
X-Gm-Message-State: APjAAAXiSQQM8/rm9ADsg54/YFX19YuM2RJMfJFrV6YkqSY9DiBmWT3R
 Iv41OKOLuSZc8vOnVIWC7g86eMi3YovKpnwPEz0=
X-Google-Smtp-Source: APXvYqwwMECd9wW0HPP1j0PyV69hnbZ9WVApySLd3xpfZRVoEeeTMikdah645ea1lb7GkgO7tenI21NlPOe8MtzowAk=
X-Received: by 2002:a5d:6886:: with SMTP id h6mr20244881wru.154.1578942065812; 
 Mon, 13 Jan 2020 11:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-13-tzimmermann@suse.de>
In-Reply-To: <20200110092127.27847-13-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Jan 2020 14:00:53 -0500
Message-ID: <CADnq5_OkU+kwE5P8SoTNrmXK2BSfh0crDq=r9NQCEL3vAsoRFA@mail.gmail.com>
Subject: Re: [PATCH 12/23] drm/amdgpu: Convert to CRTC VBLANK callbacks
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
> VBLANK callbacks in struct drm_driver are deprecated in favor of
> their equivalents in struct drm_crtc_funcs. Convert amdgpu over.

I think I'd prefer to just update the signatures of the relevant
functions rather than wrapping them.

Alex

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  3 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  4 ----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 24 +++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  4 ++++
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  4 ++++
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  4 ++++
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  4 ++++
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  4 ++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 ++
>  9 files changed, 49 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 81a531b652aa..c1262ab588c9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1197,6 +1197,9 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
>  u32 amdgpu_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe);
>  int amdgpu_enable_vblank_kms(struct drm_device *dev, unsigned int pipe);
>  void amdgpu_disable_vblank_kms(struct drm_device *dev, unsigned int pipe);
> +u32 amdgpu_crtc_get_vblank_counter(struct drm_crtc *crtc);
> +int amdgpu_crtc_enable_vblank(struct drm_crtc *crtc);
> +void amdgpu_crtc_disable_vblank(struct drm_crtc *crtc);
>  long amdgpu_kms_compat_ioctl(struct file *filp, unsigned int cmd,
>                              unsigned long arg);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 0749285dd1c7..9baa1ddf8693 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1377,10 +1377,6 @@ static struct drm_driver kms_driver = {
>         .postclose = amdgpu_driver_postclose_kms,
>         .lastclose = amdgpu_driver_lastclose_kms,
>         .unload = amdgpu_driver_unload_kms,
> -       .get_vblank_counter = amdgpu_get_vblank_counter_kms,
> -       .enable_vblank = amdgpu_enable_vblank_kms,
> -       .disable_vblank = amdgpu_disable_vblank_kms,
> -       .get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
>         .irq_handler = amdgpu_irq_handler,
>         .ioctls = amdgpu_ioctls_kms,
>         .gem_free_object_unlocked = amdgpu_gem_object_free,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 60591dbc2097..efe4671fb032 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1174,6 +1174,14 @@ u32 amdgpu_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe)
>         return count;
>  }
>
> +u32 amdgpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
> +
> +       return amdgpu_get_vblank_counter_kms(dev, pipe);
> +}
> +
>  /**
>   * amdgpu_enable_vblank_kms - enable vblank interrupt
>   *
> @@ -1191,6 +1199,14 @@ int amdgpu_enable_vblank_kms(struct drm_device *dev, unsigned int pipe)
>         return amdgpu_irq_get(adev, &adev->crtc_irq, idx);
>  }
>
> +int amdgpu_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
> +
> +       return amdgpu_enable_vblank_kms(dev, pipe);
> +}
> +
>  /**
>   * amdgpu_disable_vblank_kms - disable vblank interrupt
>   *
> @@ -1207,6 +1223,14 @@ void amdgpu_disable_vblank_kms(struct drm_device *dev, unsigned int pipe)
>         amdgpu_irq_put(adev, &adev->crtc_irq, idx);
>  }
>
> +void amdgpu_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
> +
> +       amdgpu_disable_vblank_kms(dev, pipe);
> +}
> +
>  const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>         DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index bdc1e0f036d4..8e62f46f0bfd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -2494,6 +2494,10 @@ static const struct drm_crtc_funcs dce_v10_0_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_v10_0_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_crtc_get_vblank_counter,
> +       .enable_vblank = amdgpu_crtc_enable_vblank,
> +       .disable_vblank = amdgpu_crtc_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
>  };
>
>  static void dce_v10_0_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index 0319da5f7bf9..9e37e4a78403 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -2573,6 +2573,10 @@ static const struct drm_crtc_funcs dce_v11_0_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_v11_0_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_crtc_get_vblank_counter,
> +       .enable_vblank = amdgpu_crtc_enable_vblank,
> +       .disable_vblank = amdgpu_crtc_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
>  };
>
>  static void dce_v11_0_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index 78642c3b14fc..2d4c99d3b352 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -2388,6 +2388,10 @@ static const struct drm_crtc_funcs dce_v6_0_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_v6_0_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_crtc_get_vblank_counter,
> +       .enable_vblank = amdgpu_crtc_enable_vblank,
> +       .disable_vblank = amdgpu_crtc_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
>  };
>
>  static void dce_v6_0_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index 1e8d4975435a..cd51fd155349 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -2395,6 +2395,10 @@ static const struct drm_crtc_funcs dce_v8_0_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_v8_0_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_crtc_get_vblank_counter,
> +       .enable_vblank = amdgpu_crtc_enable_vblank,
> +       .disable_vblank = amdgpu_crtc_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
>  };
>
>  static void dce_v8_0_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> index 4b2f915aba47..53c260deb384 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> @@ -123,6 +123,10 @@ static const struct drm_crtc_funcs dce_virtual_crtc_funcs = {
>         .set_config = amdgpu_display_crtc_set_config,
>         .destroy = dce_virtual_crtc_destroy,
>         .page_flip_target = amdgpu_display_crtc_page_flip_target,
> +       .get_vblank_counter = amdgpu_crtc_get_vblank_counter,
> +       .enable_vblank = amdgpu_crtc_enable_vblank,
> +       .disable_vblank = amdgpu_crtc_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
>  };
>
>  static void dce_virtual_crtc_dpms(struct drm_crtc *crtc, int mode)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 39c5cf242c1b..0c51c4dd8c46 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4214,8 +4214,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>         .set_crc_source = amdgpu_dm_crtc_set_crc_source,
>         .verify_crc_source = amdgpu_dm_crtc_verify_crc_source,
>         .get_crc_sources = amdgpu_dm_crtc_get_crc_sources,
> +       .get_vblank_counter = amdgpu_crtc_get_vblank_counter,
>         .enable_vblank = dm_enable_vblank,
>         .disable_vblank = dm_disable_vblank,
> +       .get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
>  };
>
>  static enum drm_connector_status
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
