Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5351C3D3BD1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 16:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C45089228;
	Fri, 23 Jul 2021 14:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8DF6FB27;
 Fri, 23 Jul 2021 14:33:37 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id t128so2058845oig.1;
 Fri, 23 Jul 2021 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KImp+7hEvzeEGZUoOiELXBIpvy+pZt5XKVv2J/TzAUE=;
 b=eTaUtNLl2k7NP5cSkzPQrAcaM14gObyQZSSdwzkgm3wqIl1NjG8/imIWA1wd/Rfcn6
 yZdbQbSkS/xuSAh0WgKYaLCcjNnM3S7gg6rsE8/rVMQrkkrSVj+RsXl50U4Pl6Ta7prd
 nVmnAxqp70XOU4yMswZWMfWOy91kEfOG3W2T3wWa8U2o+J2U3wKayinEw+xvvXq2uxIK
 jrC+ZDdTmuFJ15trMNOqEmwAZtvS4OacU1KhzwmQVLx4cszXBcxzZDZCozOYirddtTDp
 3kYGwVpRusYTfFgHkBWXoh8MqJDG2vQBVLsWpLVbMfAoDv7vAtxJphSWkCm7fj29Mb0Y
 Bsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KImp+7hEvzeEGZUoOiELXBIpvy+pZt5XKVv2J/TzAUE=;
 b=gzQx4wHxDhwT+IjhxP9pcGdV1vtp/nP43Sc61W8og8f1AW1A00Ya0Ya4qAntLiYROJ
 fgquyd9kc/UxnMfnV7ainLZP7juU5crK+UIPvNEuBk6IYlsxToe9BbE6ws4rmdGKTuoZ
 CQ3jVHUb1KPvFUZvaF1fymSMgJmgPkBdnZmByrWXGwsSdanXVLI+LEEycE4o6ssRFKAu
 9OG7H4GLkPLlXOOw9PVMSBA2ZI9SzS/8SzGvdy5rXP1idAsA7S/4gQnGmWJ/PmSo4Zyy
 EJIswafFMLby7jqg7YJW0adiLap6XXF22F0qIBOPURhqkGE5rJo+DPFIxAZE4QWhnOSl
 0VsA==
X-Gm-Message-State: AOAM532GcRvTKKe+9zTGwuBGlnn8fRreVl2JODy2n7qNMQcpZhNIITEN
 yY4bcGgNO8kOFQaGMwya6w2Y220RVnAVc3NW1N8=
X-Google-Smtp-Source: ABdhPJyCXKhjoPyLfh+hvJD/IEKxskjSEQM5kzGHG4XmBXakJ1/FvQfWFWCxT6YyShHXXjAremvMH3lVUAvbENQHWH0=
X-Received: by 2002:a05:6808:1390:: with SMTP id
 c16mr3197715oiw.123.1627050816991; 
 Fri, 23 Jul 2021 07:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210721170705.4201-1-Ryan.Taylor@amd.com>
 <20210721170705.4201-4-Ryan.Taylor@amd.com>
In-Reply-To: <20210721170705.4201-4-Ryan.Taylor@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Jul 2021 10:33:26 -0400
Message-ID: <CADnq5_PejZBML=rjvnyi1s-cbe0vxnRt0sNxu_V9FR1cHrmsFA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: replace dce_virtual with amdgpu_vkms (v3)
To: Ryan Taylor <Ryan.Taylor@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel test robot <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Siqueira, Rodrigo" <rodrigo.siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 1:07 PM Ryan Taylor <Ryan.Taylor@amd.com> wrote:
>
> Move dce_virtual into amdgpu_vkms and update all references to
> dce_virtual with amdgpu_vkms.
>
> v2: Removed more references to dce_virtual.
>
> v3: Restored display modes from previous implementation.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Alex Deucher <Alexander.Deucher@amd.com>
> Signed-off-by: Ryan Taylor <Ryan.Taylor@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile      |   3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 234 ++++++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |   5 +-
>  drivers/gpu/drm/amd/amdgpu/cik.c         |  10 +-
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c | 223 ---------------------
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.h |  30 ---
>  drivers/gpu/drm/amd/amdgpu/nv.c          |  20 +-
>  drivers/gpu/drm/amd/amdgpu/si.c          |   8 +-
>  drivers/gpu/drm/amd/amdgpu/soc15.c       |  10 +-
>  drivers/gpu/drm/amd/amdgpu/vi.c          |  14 +-
>  10 files changed, 264 insertions(+), 293 deletions(-)
>  delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.c
>  delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 30cbcd5ce1cc..0d814c957461 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -120,8 +120,7 @@ amdgpu-y += \
>  amdgpu-y += \
>         dce_v10_0.o \
>         dce_v11_0.o \
> -       amdgpu_vkms.o \
> -       dce_virtual.o
> +       amdgpu_vkms.o
>
>  # add GFX block
>  amdgpu-y += \
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> index d5c1f1c58f5f..538d41e6666a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -5,6 +5,15 @@
>  #include <drm/drm_vblank.h>
>
>  #include "amdgpu.h"
> +#ifdef CONFIG_DRM_AMDGPU_SI
> +#include "dce_v6_0.h"
> +#endif
> +#ifdef CONFIG_DRM_AMDGPU_CIK
> +#include "dce_v8_0.h"
> +#endif
> +#include "dce_v10_0.h"
> +#include "dce_v11_0.h"
> +#include "ivsrcid/ivsrcid_vislands30.h"
>  #include "amdgpu_vkms.h"
>  #include "amdgpu_display.h"
>
> @@ -180,12 +189,45 @@ static const struct drm_connector_funcs amdgpu_vkms_connector_funcs = {
>
>  static int amdgpu_vkms_conn_get_modes(struct drm_connector *connector)
>  {
> -       int count;
> +       struct drm_device *dev = connector->dev;
> +       struct drm_display_mode *mode = NULL;
> +       unsigned i;
> +       static const struct mode_size {
> +               int w;
> +               int h;
> +       } common_modes[] = {
> +               { 640,  480},
> +               { 720,  480},
> +               { 800,  600},
> +               { 848,  480},
> +               {1024,  768},
> +               {1152,  768},
> +               {1280,  720},
> +               {1280,  800},
> +               {1280,  854},
> +               {1280,  960},
> +               {1280, 1024},
> +               {1440,  900},
> +               {1400, 1050},
> +               {1680, 1050},
> +               {1600, 1200},
> +               {1920, 1080},
> +               {1920, 1200},
> +               {2560, 1440},
> +               {4096, 3112},
> +               {3656, 2664},
> +               {3840, 2160},
> +               {4096, 2160},
> +       };
> +
> +       for (i = 0; i < ARRAY_SIZE(common_modes); i++) {
> +               mode = drm_cvt_mode(dev, common_modes[i].w, common_modes[i].h, 60, false, false, false);
> +               drm_mode_probed_add(connector, mode);
> +       }
>
> -       count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
>         drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
>
> -       return count;
> +       return ARRAY_SIZE(common_modes);
>  }
>
>  static const struct drm_connector_helper_funcs amdgpu_vkms_conn_helper_funcs = {
> @@ -409,3 +451,189 @@ int amdgpu_vkms_output_init(struct drm_device *dev,
>
>         return ret;
>  }
> +
> +const struct drm_mode_config_funcs amdgpu_vkms_mode_funcs = {
> +       .fb_create = amdgpu_display_user_framebuffer_create,
> +       .atomic_check = drm_atomic_helper_check,
> +       .atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static int amdgpu_vkms_sw_init(void *handle)
> +{
> +       int r, i;
> +       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> +
> +       adev_to_drm(adev)->max_vblank_count = 0;
> +
> +       adev_to_drm(adev)->mode_config.funcs = &amdgpu_vkms_mode_funcs;
> +
> +       adev_to_drm(adev)->mode_config.max_width = XRES_MAX;
> +       adev_to_drm(adev)->mode_config.max_height = YRES_MAX;
> +
> +       adev_to_drm(adev)->mode_config.preferred_depth = 24;
> +       adev_to_drm(adev)->mode_config.prefer_shadow = 1;
> +
> +       adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
> +
> +       r = amdgpu_display_modeset_create_props(adev);
> +       if (r)
> +               return r;
> +
> +       adev->amdgpu_vkms_output = kzalloc(sizeof(struct amdgpu_vkms_output) * adev->mode_info.num_crtc, GFP_KERNEL);
> +
> +       /* allocate crtcs, encoders, connectors */
> +       for (i = 0; i < adev->mode_info.num_crtc; i++) {
> +               r = amdgpu_vkms_output_init(adev_to_drm(adev), &adev->amdgpu_vkms_output[i], i);
> +               if (r)
> +                       return r;
> +       }
> +
> +       drm_kms_helper_poll_init(adev_to_drm(adev));
> +
> +       adev->mode_info.mode_config_initialized = true;
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_sw_fini(void *handle)
> +{
> +       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> +       int i = 0;
> +
> +       for (i = 0; i < adev->mode_info.num_crtc; i++)
> +               if (adev->mode_info.crtcs[i])
> +                       hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_timer);
> +
> +       kfree(adev->mode_info.bios_hardcoded_edid);
> +       kfree(adev->amdgpu_vkms_output);
> +
> +       drm_kms_helper_poll_fini(adev_to_drm(adev));
> +
> +       adev->mode_info.mode_config_initialized = false;
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_hw_init(void *handle)
> +{
> +       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> +
> +       switch (adev->asic_type) {
> +#ifdef CONFIG_DRM_AMDGPU_SI
> +       case CHIP_TAHITI:
> +       case CHIP_PITCAIRN:
> +       case CHIP_VERDE:
> +       case CHIP_OLAND:
> +               dce_v6_0_disable_dce(adev);
> +               break;
> +#endif
> +#ifdef CONFIG_DRM_AMDGPU_CIK
> +       case CHIP_BONAIRE:
> +       case CHIP_HAWAII:
> +       case CHIP_KAVERI:
> +       case CHIP_KABINI:
> +       case CHIP_MULLINS:
> +               dce_v8_0_disable_dce(adev);
> +               break;
> +#endif
> +       case CHIP_FIJI:
> +       case CHIP_TONGA:
> +               dce_v10_0_disable_dce(adev);
> +               break;
> +       case CHIP_CARRIZO:
> +       case CHIP_STONEY:
> +       case CHIP_POLARIS10:
> +       case CHIP_POLARIS11:
> +       case CHIP_VEGAM:
> +               dce_v11_0_disable_dce(adev);
> +               break;
> +       case CHIP_TOPAZ:
> +#ifdef CONFIG_DRM_AMDGPU_SI
> +       case CHIP_HAINAN:
> +#endif
> +               /* no DCE */
> +               break;
> +       default:
> +               break;
> +       }
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_hw_fini(void *handle)
> +{
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_suspend(void *handle)
> +{
> +       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> +       int r;
> +
> +       r = drm_mode_config_helper_suspend(adev_to_drm(adev));
> +       if (r)
> +               return r;
> +       return amdgpu_vkms_hw_fini(handle);
> +}
> +
> +static int amdgpu_vkms_resume(void *handle)
> +{
> +       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> +       int r;
> +
> +       r = amdgpu_vkms_hw_init(handle);
> +       if (r)
> +               return r;
> +       return drm_mode_config_helper_resume(adev_to_drm(adev));
> +}
> +
> +static bool amdgpu_vkms_is_idle(void *handle)
> +{
> +       return true;
> +}
> +
> +static int amdgpu_vkms_wait_for_idle(void *handle)
> +{
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_soft_reset(void *handle)
> +{
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_set_clockgating_state(void *handle,
> +                                         enum amd_clockgating_state state)
> +{
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_set_powergating_state(void *handle,
> +                                         enum amd_powergating_state state)
> +{
> +       return 0;
> +}
> +
> +static const struct amd_ip_funcs amdgpu_vkms_ip_funcs = {
> +       .name = "amdgpu_vkms",
> +       .early_init = NULL,
> +       .late_init = NULL,
> +       .sw_init = amdgpu_vkms_sw_init,
> +       .sw_fini = amdgpu_vkms_sw_fini,
> +       .hw_init = amdgpu_vkms_hw_init,
> +       .hw_fini = amdgpu_vkms_hw_fini,
> +       .suspend = amdgpu_vkms_suspend,
> +       .resume = amdgpu_vkms_resume,
> +       .is_idle = amdgpu_vkms_is_idle,
> +       .wait_for_idle = amdgpu_vkms_wait_for_idle,
> +       .soft_reset = amdgpu_vkms_soft_reset,
> +       .set_clockgating_state = amdgpu_vkms_set_clockgating_state,
> +       .set_powergating_state = amdgpu_vkms_set_powergating_state,
> +};
> +
> +const struct amdgpu_ip_block_version amdgpu_vkms_ip_block =
> +{
> +       .type = AMD_IP_BLOCK_TYPE_DCE,
> +       .major = 1,
> +       .minor = 0,
> +       .rev = 0,
> +       .funcs = &amdgpu_vkms_ip_funcs,
> +};
> +
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> index 5dab51fbecf3..97f1b79c0724 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> @@ -4,7 +4,7 @@
>  #define _AMDGPU_VKMS_H_
>
>  #define XRES_DEF  1024
> -#define YRES_DEF   764
> +#define YRES_DEF   768

Squash this fix into the original patch that added this macro.


>
>  #define XRES_MAX  16384
>  #define YRES_MAX  16384
> @@ -23,7 +23,4 @@ struct amdgpu_vkms_output {
>         struct drm_pending_vblank_event *event;
>  };
>
> -int amdgpu_vkms_output_init(struct drm_device *dev,
> -                           struct amdgpu_vkms_output *output, int index);
> -
>  #endif /* _AMDGPU_VKMS_H_ */
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
> index c0fcc41ee574..54f28c075f21 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik.c
> @@ -70,7 +70,7 @@
>
>  #include "amdgpu_dm.h"
>  #include "amdgpu_amdkfd.h"
> -#include "dce_virtual.h"
> +#include "amdgpu_vkms.h"
>
>  static const struct amdgpu_video_codec_info cik_video_codecs_encode_array[] =
>  {
> @@ -2259,7 +2259,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &cik_sdma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2277,7 +2277,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &cik_sdma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2295,7 +2295,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &cik_sdma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &kv_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2315,7 +2315,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &cik_sdma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &kv_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> deleted file mode 100644
> index 18369b47eac7..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> +++ /dev/null
> @@ -1,223 +0,0 @@
> -/*
> - * Copyright 2014 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be included in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#include <drm/drm_atomic_helper.h>
> -
> -#include "amdgpu.h"
> -#ifdef CONFIG_DRM_AMDGPU_SI
> -#include "dce_v6_0.h"
> -#endif
> -#ifdef CONFIG_DRM_AMDGPU_CIK
> -#include "dce_v8_0.h"
> -#endif
> -#include "dce_v10_0.h"
> -#include "dce_v11_0.h"
> -#include "dce_virtual.h"
> -#include "ivsrcid/ivsrcid_vislands30.h"
> -#include "amdgpu_display.h"
> -#include "amdgpu_vkms.h"
> -
> -const struct drm_mode_config_funcs dce_virtual_mode_funcs = {
> -       .fb_create = amdgpu_display_user_framebuffer_create,
> -       .atomic_check = drm_atomic_helper_check,
> -       .atomic_commit = drm_atomic_helper_commit,
> -};
> -
> -static int dce_virtual_sw_init(void *handle)
> -{
> -       int r, i;
> -       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -
> -       adev_to_drm(adev)->max_vblank_count = 0;
> -
> -       adev_to_drm(adev)->mode_config.funcs = &dce_virtual_mode_funcs;
> -
> -       adev_to_drm(adev)->mode_config.max_width = XRES_MAX;
> -       adev_to_drm(adev)->mode_config.max_height = YRES_MAX;
> -
> -       adev_to_drm(adev)->mode_config.preferred_depth = 24;
> -       adev_to_drm(adev)->mode_config.prefer_shadow = 1;
> -
> -       adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
> -
> -       r = amdgpu_display_modeset_create_props(adev);
> -       if (r)
> -               return r;
> -
> -       adev->amdgpu_vkms_output = kzalloc(sizeof(struct amdgpu_vkms_output) * adev->mode_info.num_crtc, GFP_KERNEL);
> -
> -       /* allocate crtcs, encoders, connectors */
> -       for (i = 0; i < adev->mode_info.num_crtc; i++) {
> -               r = amdgpu_vkms_output_init(adev_to_drm(adev), &adev->amdgpu_vkms_output[i], i);
> -               if (r)
> -                       return r;
> -       }
> -
> -       drm_kms_helper_poll_init(adev_to_drm(adev));
> -
> -       adev->mode_info.mode_config_initialized = true;
> -       return 0;
> -}
> -
> -static int dce_virtual_sw_fini(void *handle)
> -{
> -       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -       int i = 0;
> -
> -       for (i = 0; i < adev->mode_info.num_crtc; i++)
> -               if (adev->mode_info.crtcs[i])
> -                       hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_timer);
> -
> -       kfree(adev->mode_info.bios_hardcoded_edid);
> -       kfree(adev->amdgpu_vkms_output);
> -
> -       drm_kms_helper_poll_fini(adev_to_drm(adev));
> -
> -       adev->mode_info.mode_config_initialized = false;
> -       return 0;
> -}
> -
> -static int dce_virtual_hw_init(void *handle)
> -{
> -       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -
> -       switch (adev->asic_type) {
> -#ifdef CONFIG_DRM_AMDGPU_SI
> -       case CHIP_TAHITI:
> -       case CHIP_PITCAIRN:
> -       case CHIP_VERDE:
> -       case CHIP_OLAND:
> -               dce_v6_0_disable_dce(adev);
> -               break;
> -#endif
> -#ifdef CONFIG_DRM_AMDGPU_CIK
> -       case CHIP_BONAIRE:
> -       case CHIP_HAWAII:
> -       case CHIP_KAVERI:
> -       case CHIP_KABINI:
> -       case CHIP_MULLINS:
> -               dce_v8_0_disable_dce(adev);
> -               break;
> -#endif
> -       case CHIP_FIJI:
> -       case CHIP_TONGA:
> -               dce_v10_0_disable_dce(adev);
> -               break;
> -       case CHIP_CARRIZO:
> -       case CHIP_STONEY:
> -       case CHIP_POLARIS10:
> -       case CHIP_POLARIS11:
> -       case CHIP_VEGAM:
> -               dce_v11_0_disable_dce(adev);
> -               break;
> -       case CHIP_TOPAZ:
> -#ifdef CONFIG_DRM_AMDGPU_SI
> -       case CHIP_HAINAN:
> -#endif
> -               /* no DCE */
> -               break;
> -       default:
> -               break;
> -       }
> -       return 0;
> -}
> -
> -static int dce_virtual_hw_fini(void *handle)
> -{
> -       return 0;
> -}
> -
> -static int dce_virtual_suspend(void *handle)
> -{
> -       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -       int r;
> -
> -       r = drm_mode_config_helper_suspend(adev_to_drm(adev));
> -       if (r)
> -               return r;
> -       return dce_virtual_hw_fini(handle);
> -}
> -
> -static int dce_virtual_resume(void *handle)
> -{
> -       struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -       int r;
> -
> -       r = dce_virtual_hw_init(handle);
> -       if (r)
> -               return r;
> -       return drm_mode_config_helper_resume(adev_to_drm(adev));
> -}
> -
> -static bool dce_virtual_is_idle(void *handle)
> -{
> -       return true;
> -}
> -
> -static int dce_virtual_wait_for_idle(void *handle)
> -{
> -       return 0;
> -}
> -
> -static int dce_virtual_soft_reset(void *handle)
> -{
> -       return 0;
> -}
> -
> -static int dce_virtual_set_clockgating_state(void *handle,
> -                                         enum amd_clockgating_state state)
> -{
> -       return 0;
> -}
> -
> -static int dce_virtual_set_powergating_state(void *handle,
> -                                         enum amd_powergating_state state)
> -{
> -       return 0;
> -}
> -
> -static const struct amd_ip_funcs dce_virtual_ip_funcs = {
> -       .name = "dce_virtual",
> -       .early_init = NULL,
> -       .late_init = NULL,
> -       .sw_init = dce_virtual_sw_init,
> -       .sw_fini = dce_virtual_sw_fini,
> -       .hw_init = dce_virtual_hw_init,
> -       .hw_fini = dce_virtual_hw_fini,
> -       .suspend = dce_virtual_suspend,
> -       .resume = dce_virtual_resume,
> -       .is_idle = dce_virtual_is_idle,
> -       .wait_for_idle = dce_virtual_wait_for_idle,
> -       .soft_reset = dce_virtual_soft_reset,
> -       .set_clockgating_state = dce_virtual_set_clockgating_state,
> -       .set_powergating_state = dce_virtual_set_powergating_state,
> -};
> -
> -const struct amdgpu_ip_block_version dce_virtual_ip_block =
> -{
> -       .type = AMD_IP_BLOCK_TYPE_DCE,
> -       .major = 1,
> -       .minor = 0,
> -       .rev = 0,
> -       .funcs = &dce_virtual_ip_funcs,
> -};
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.h b/drivers/gpu/drm/amd/amdgpu/dce_virtual.h
> deleted file mode 100644
> index ed422012c8c6..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.h
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -/*
> - * Copyright 2014 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be included in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#ifndef __DCE_VIRTUAL_H__
> -#define __DCE_VIRTUAL_H__
> -
> -extern const struct amdgpu_ip_block_version dce_virtual_ip_block;
> -
> -#endif
> -
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
> index 436fb13e32f0..696ecc1ccb28 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -58,7 +58,7 @@
>  #include "jpeg_v2_0.h"
>  #include "vcn_v3_0.h"
>  #include "jpeg_v3_0.h"
> -#include "dce_virtual.h"
> +#include "amdgpu_vkms.h"
>  #include "mes_v10_1.h"
>  #include "mxgpu_nv.h"
>  #include "smuio_v11_0.h"
> @@ -721,7 +721,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                     !amdgpu_sriov_vf(adev))
>                         amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -749,7 +749,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                 if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP)
>                         amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -779,7 +779,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                     is_support_sw_smu(adev))
>                         amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -802,7 +802,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                     is_support_sw_smu(adev))
>                         amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -823,7 +823,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                         amdgpu_device_ip_block_add(adev, &psp_v11_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -843,7 +843,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                     is_support_sw_smu(adev))
>                         amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                  else if (amdgpu_device_has_dc_support(adev))
>                          amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -865,7 +865,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &gfx_v10_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &sdma_v5_2_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -883,11 +883,11 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                         amdgpu_device_ip_block_add(adev, &psp_v13_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &smu_v13_0_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>                 amdgpu_device_ip_block_add(adev, &gfx_v10_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &sdma_v5_2_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
> index 7cbc2bb03bc6..e6d2f74a7976 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si.c
> @@ -44,7 +44,7 @@
>  #include "dce_v6_0.h"
>  #include "si.h"
>  #include "uvd_v3_1.h"
> -#include "dce_virtual.h"
> +#include "amdgpu_vkms.h"
>  #include "gca/gfx_6_0_d.h"
>  #include "oss/oss_1_0_d.h"
>  #include "oss/oss_1_0_sh_mask.h"
> @@ -2759,7 +2759,7 @@ int si_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &si_dma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &si_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC) && defined(CONFIG_DRM_AMD_DC_SI)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2777,7 +2777,7 @@ int si_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &si_dma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &si_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC) && defined(CONFIG_DRM_AMD_DC_SI)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2795,7 +2795,7 @@ int si_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &si_dma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &si_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>                 break;
>         default:
>                 BUG();
> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
> index a5e085e570f7..f7b56a746c15 100644
> --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
> +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
> @@ -74,7 +74,7 @@
>  #include "smuio_v9_0.h"
>  #include "smuio_v11_0.h"
>  #include "smuio_v13_0.h"
> -#include "dce_virtual.h"
> +#include "amdgpu_vkms.h"
>  #include "mxgpu_ai.h"
>  #include "amdgpu_ras.h"
>  #include "amdgpu_xgmi.h"
> @@ -843,7 +843,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
>                         amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 }
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -863,7 +863,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v4_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -885,7 +885,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
>                 }
>
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>                 amdgpu_device_ip_block_add(adev, &gfx_v9_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &sdma_v4_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
> @@ -909,7 +909,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &gfx_v9_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &sdma_v4_0_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                  else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
> index 3d21c0799037..fe9a7cc8d9eb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -77,7 +77,7 @@
>  #if defined(CONFIG_DRM_AMD_ACP)
>  #include "amdgpu_acp.h"
>  #endif
> -#include "dce_virtual.h"
> +#include "amdgpu_vkms.h"
>  #include "mxgpu_vi.h"
>  #include "amdgpu_dm.h"
>
> @@ -2102,7 +2102,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v2_4_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>                 break;
>         case CHIP_FIJI:
>                 amdgpu_device_ip_block_add(adev, &vi_common_ip_block);
> @@ -2112,7 +2112,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v3_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2132,7 +2132,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v3_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2155,7 +2155,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v3_1_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2173,7 +2173,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v3_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2194,7 +2194,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v3_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> --
> 2.32.0
>
