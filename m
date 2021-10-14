Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A158C42E4D2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 01:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA346ECA5;
	Thu, 14 Oct 2021 23:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2021C6ECA5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 23:43:09 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id ay35so7031077qkb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 16:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J7Isl4QOCcY0eFas2cTgbyTZfPWz2wwFdAIcWRYre7Y=;
 b=PjuIacqaroe9e7akOnjznTZzvaYEQs53UCr321AtQruM5hAZBg92Qj8kesAnbb7Muy
 qMyCuA6zzoG9BjWGJkG3AUzx167f73QL6aeUPu/LReks/1mIUnrk5z/B5qDTtrMszNiU
 YKvlgeUM3yXHj7PZ+FF3LnyQOfymhIhwnyq/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J7Isl4QOCcY0eFas2cTgbyTZfPWz2wwFdAIcWRYre7Y=;
 b=X4wEv2HMsuEmOssfRBWjAfiJfzNc/ZT0eY8U5tygDveaA6hF362IU8L58pAO7YQxqz
 voofUTYfwya25e5ZI7t1uEAEIo1FzAgeVUCAfxLW+WdWkG0zL92khZoTz45rJz9CZIBW
 Y40fhBs2uBX8O7eWN56hZnCUhxMQsLc1aqdau/4fkyUVds8gZcSWf6krC4Y5YAH3yiqY
 sNdUauMa+NQCO5tsdmsD/sW/SYdLKSXhLMZwWs1LEai7WBxBYHvwmmgjK9WhufIl9SYs
 vU3LDVgNyhAeomzAULkNR8Fy+1qRdlslILtwmDC8VVwdHsSzgpiWL/jQCyYyLF0aRzx6
 4B0A==
X-Gm-Message-State: AOAM531gmRmc3IYwwN7f1jIOqhdduEJ0x4GDHc/PAaavA/0V+Etc59Dz
 oMyppE0EzOEEPyfVyZTXkmB6gs6GoSGBTfih
X-Google-Smtp-Source: ABdhPJxzEObB22y/d0PWtdgOhp8URvPVxwatA007LQsShKThRqCe+zti3v1sPSPo7Tjc2jbkkZhhBg==
X-Received: by 2002:a37:b7c2:: with SMTP id h185mr7691665qkf.311.1634254987938; 
 Thu, 14 Oct 2021 16:43:07 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id g1sm1894906qkd.89.2021.10.14.16.43.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 16:43:06 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id h2so18372286ybi.13
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 16:43:06 -0700 (PDT)
X-Received: by 2002:a25:4251:: with SMTP id p78mr9457761yba.47.1634254985831; 
 Thu, 14 Oct 2021 16:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210929194012.3433306-1-markyacoub@chromium.org>
 <20211013181228.1578201-1-markyacoub@chromium.org>
 <20211013181228.1578201-2-markyacoub@chromium.org>
In-Reply-To: <20211013181228.1578201-2-markyacoub@chromium.org>
From: Sean Paul <seanpaul@chromium.org>
Date: Thu, 14 Oct 2021 19:42:29 -0400
X-Gmail-Original-Message-ID: <CAOw6vb+AaG2B1zRfLW54TDjinuirXAT+v2AvXeWmVjYNyJJXMQ@mail.gmail.com>
Message-ID: <CAOw6vb+AaG2B1zRfLW54TDjinuirXAT+v2AvXeWmVjYNyJJXMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] amd/amdgpu_dm: Verify Gamma and Degamma LUT sizes
 using DRM Core check
To: Mark Yacoub <markyacoub@chromium.org>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, harry.wentland@amd.com, 
 Mark Yacoub <markyacoub@google.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 13, 2021 at 2:12 PM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> From: Mark Yacoub <markyacoub@google.com>
>
> [Why]
> drm_atomic_helper_check_crtc now verifies both legacy and non-legacy LUT
> sizes. There is no need to check it within amdgpu_dm_atomic_check.
>
> [How]
> Remove the local call to verify LUT sizes and use DRM Core function
> instead.
>
> Tested on ChromeOS Zork.
>
> v1:
> Remove amdgpu_dm_verify_lut_sizes everywhere.
>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 -
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 35 -------------------
>  3 files changed, 4 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index f74663b6b046e..47f8de1cfc3a5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10244,6 +10244,10 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>                 }
>         }
>  #endif
> +       ret = drm_atomic_helper_check_crtcs(state);
> +       if (ret)
> +               return ret;
> +
>         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
>                 dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
>
> @@ -10253,10 +10257,6 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>                         dm_old_crtc_state->dsc_force_changed == false)
>                         continue;
>
> -               ret = amdgpu_dm_verify_lut_sizes(new_crtc_state);
> -               if (ret)
> -                       goto fail;
> -
>                 if (!new_crtc_state->enable)
>                         continue;
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index fcb9c4a629c32..22730e5542092 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -617,7 +617,6 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
>  #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
>
>  void amdgpu_dm_init_color_mod(void);
> -int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
>  int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
>  int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>                                       struct dc_plane_state *dc_plane_state);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index a022e5bb30a5c..319f8a8a89835 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -284,37 +284,6 @@ static int __set_input_tf(struct dc_transfer_func *func,
>         return res ? 0 : -ENOMEM;
>  }
>
> -/**
> - * Verifies that the Degamma and Gamma LUTs attached to the |crtc_state| are of
> - * the expected size.
> - * Returns 0 on success.
> - */
> -int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
> -{
> -       const struct drm_color_lut *lut = NULL;
> -       uint32_t size = 0;
> -
> -       lut = __extract_blob_lut(crtc_state->degamma_lut, &size);
> -       if (lut && size != MAX_COLOR_LUT_ENTRIES) {
> -               DRM_DEBUG_DRIVER(
> -                       "Invalid Degamma LUT size. Should be %u but got %u.\n",
> -                       MAX_COLOR_LUT_ENTRIES, size);
> -               return -EINVAL;
> -       }
> -
> -       lut = __extract_blob_lut(crtc_state->gamma_lut, &size);
> -       if (lut && size != MAX_COLOR_LUT_ENTRIES &&
> -           size != MAX_COLOR_LEGACY_LUT_ENTRIES) {
> -               DRM_DEBUG_DRIVER(
> -                       "Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
> -                       MAX_COLOR_LUT_ENTRIES, MAX_COLOR_LEGACY_LUT_ENTRIES,
> -                       size);
> -               return -EINVAL;
> -       }
> -
> -       return 0;
> -}
> -
>  /**
>   * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
>   * @crtc: amdgpu_dm crtc state
> @@ -348,10 +317,6 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>         bool is_legacy;
>         int r;
>
> -       r = amdgpu_dm_verify_lut_sizes(&crtc->base);
> -       if (r)
> -               return r;
> -
>         degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
>         regamma_lut = __extract_blob_lut(crtc->base.gamma_lut, &regamma_size);
>
> --
> 2.33.0.882.g93a45727a2-goog
>
