Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E50613A2E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 16:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C696810E285;
	Mon, 31 Oct 2022 15:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501D910E27F;
 Mon, 31 Oct 2022 15:36:21 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id r187so13135198oia.8;
 Mon, 31 Oct 2022 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NZ9svVcqEpoCn/DRJRtqGJnzFfLnvgvZgnnPVTMjw9w=;
 b=LppIxaq+KxX4U647wlKAZCyxF03zXuJNg1ni4I2k2e8rpayHjUK+wZ3YxWl7pUcOvk
 xBa8PBokMuuYaZ9DTovzP1y4UV4vLCS0vAUffMLEXZdMHCbrpkPjv0LrcsNEpO3cHpyH
 AGXvBWE7uM0TDg26hKlpAqEJBAitI77xH1AZWH7LY/OqIA7qwoQ4o+0mgiKpYvoyWFVh
 /SJKdO3bSfLJzt4gGGrXTLIfJg10qqe023mBgY2uA5I1bTHcOT4pak8bG6wM7dnUNqFw
 Q4iWYA4zrS4zdDGOCzMMlM+px0g8tgN6ge7Vw6d7+4VRPmKDkvRL0d2WFiZD9IoWG3ag
 I16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NZ9svVcqEpoCn/DRJRtqGJnzFfLnvgvZgnnPVTMjw9w=;
 b=Y2nT4i+SnRWAFVWpNXpVGlkyMrvJG14MRVHuGlAI9thabdU+/wP7WhnEPd+B19Sv4m
 JYa4OBg3jsCBcNe3PpZ2B7u0cWWgdVXvaIYRd6cCDgHOnGFD4zAfbpCMlF6sJKUWoXhY
 dpcBgwNrSbdCNXYzeLaRHZ3ldFkgYOHK2wS28NPiyQfaKFbZBByKGYrB9ZEKl7hm99+w
 JvOsnN7qvU5JSu+NaQPdY2tZNIj6nsRzlFFYCFyzjCrUBkSBMgXxrW/1aGkVXR7+iEor
 daHllfgyPC2SNJMJMrMlD+5ru6kvEMVKyv2Q45yloHx13QL3llfFihe9l/+nMXC9YFG6
 qqNA==
X-Gm-Message-State: ACrzQf0ACDq5Che2psn8YbkUQO607zr750xn24sFh/K8+zbBtJVEN1Xn
 Wj/XJYz6YlNEBnwF6s61VvFAZEJvUM5FvXBK1Q4=
X-Google-Smtp-Source: AMsMyM7B0fndfG6nvizJp5E8j9Eh9Le4tnJvOWEdVadHUUjC2xmpwJzBNVXw9O/HZO/DkEoWrnPYXbaklDdIYB7rCT4=
X-Received: by 2002:a05:6808:998:b0:359:c7f3:1ef8 with SMTP id
 a24-20020a056808099800b00359c7f31ef8mr11258816oic.46.1667230580537; Mon, 31
 Oct 2022 08:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <Y117XNaSP6/8bH+3@moc6.cz>
In-Reply-To: <Y117XNaSP6/8bH+3@moc6.cz>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 31 Oct 2022 11:36:09 -0400
Message-ID: <CADnq5_Muegi+dvmrg5U=Cau_oeXQFjv_h2Pdn_j9AG0mRgE4=g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: add parameter backlight_min
To: Filip Moc <dev@moc6.cz>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 30, 2022 at 5:26 AM Filip Moc <dev@moc6.cz> wrote:
>
> There are some devices on which amdgpu won't allow user to set brightness
> to sufficiently low values even though the hardware would support it just
> fine.
>
> This usually happens in two cases when either configuration of brightness
> levels via ACPI/ATIF is not available and amdgpu falls back to defaults
> (currently 12 for minimum level) which may be too high for some devices or
> even the configuration via ATIF is available but the minimum brightness
> level provided by the manufacturer is set to unreasonably high value.
>
> In either case user can use this new module parameter to adjust the
> minimum allowed backlight brightness level.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=203439
> Signed-off-by: Filip Moc <dev@moc6.cz>

Does your system require an override and if so, what is it?  It would
be good to add a quirk for your system as well so that other users of
the same system wouldn't need to manually figure out an apply the
settings.

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  3 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 15 +++++++++++++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
>  3 files changed, 33 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 0e6ddf05c23c..c5445402c49d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -200,6 +200,9 @@ extern uint amdgpu_dc_debug_mask;
>  extern uint amdgpu_dc_visual_confirm;
>  extern uint amdgpu_dm_abm_level;
>  extern int amdgpu_backlight;
> +#ifdef CONFIG_DRM_AMD_DC
> +extern int amdgpu_backlight_override_min[];
> +#endif
>  extern struct amdgpu_mgpu_info mgpu_info;
>  extern int amdgpu_ras_enable;
>  extern uint amdgpu_ras_mask;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 16f6a313335e..f2fb549ac52f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -43,6 +43,7 @@
>  #include "amdgpu_irq.h"
>  #include "amdgpu_dma_buf.h"
>  #include "amdgpu_sched.h"
> +#include "amdgpu_dm.h"
>  #include "amdgpu_fdinfo.h"
>  #include "amdgpu_amdkfd.h"
>
> @@ -853,6 +854,20 @@ int amdgpu_backlight = -1;
>  MODULE_PARM_DESC(backlight, "Backlight control (0 = pwm, 1 = aux, -1 auto (default))");
>  module_param_named(backlight, amdgpu_backlight, bint, 0444);
>
> +/**
> + * DOC: backlight_min (array of int)
> + * Override minimum allowed backlight brightness signal (per display).
> + * Must be less than the maximum brightness signal.
> + * Negative value means no override.
> + *
> + * Defaults to all -1 (no override on any display).
> + */
> +#ifdef CONFIG_DRM_AMD_DC
> +int amdgpu_backlight_override_min[AMDGPU_DM_MAX_NUM_EDP] = {[0 ... (AMDGPU_DM_MAX_NUM_EDP-1)] = -1};
> +MODULE_PARM_DESC(backlight_min, "Override minimum backlight brightness signal (0..max-1, -1 = no override (default))");
> +module_param_array_named(backlight_min, amdgpu_backlight_override_min, int, NULL, 0444);
> +#endif
> +
>  /**
>   * DOC: tmz (int)
>   * Trusted Memory Zone (TMZ) is a method to protect data being written
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index eb4ce7216104..e2c36ba93d05 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3911,6 +3911,21 @@ static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm,
>         dm->backlight_caps[bl_idx].min_input_signal = AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
>         dm->backlight_caps[bl_idx].max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
>  #endif
> +
> +       if (amdgpu_backlight_override_min[bl_idx] >= 0) {
> +               if (amdgpu_backlight_override_min[bl_idx] < dm->backlight_caps[bl_idx].max_input_signal) {
> +                       DRM_INFO("amdgpu: backlight[%i]: overriding minimum brightness from %i to %i\n",
> +                                 bl_idx,
> +                                 dm->backlight_caps[bl_idx].min_input_signal,
> +                                 amdgpu_backlight_override_min[bl_idx]);
> +                       dm->backlight_caps[bl_idx].min_input_signal = amdgpu_backlight_override_min[bl_idx];
> +               } else {
> +                       DRM_ERROR("amdgpu: backlight[%i]: minimum brightness override (%i) is not below maximum (%i)\n",
> +                                 bl_idx,
> +                                 amdgpu_backlight_override_min[bl_idx],
> +                                 dm->backlight_caps[bl_idx].max_input_signal);
> +               }
> +       }
>  }
>
>  static int get_brightness_range(const struct amdgpu_dm_backlight_caps *caps,
>
> base-commit: d8c03bfe146fd5e081a252cd34f3f12ca0255357
> --
> 2.30.2
>
