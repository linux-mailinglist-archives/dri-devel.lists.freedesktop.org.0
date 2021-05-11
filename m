Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F10379DD7
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 05:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BA86E9A9;
	Tue, 11 May 2021 03:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A256E9A8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 03:33:06 +0000 (UTC)
Received: from mail-lj1-f198.google.com ([209.85.208.198])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <kai.heng.feng@canonical.com>) id 1lgJ8p-0006CT-NV
 for dri-devel@lists.freedesktop.org; Tue, 11 May 2021 03:33:05 +0000
Received: by mail-lj1-f198.google.com with SMTP id
 u6-20020a2ea1660000b02900d692882addso10262588ljl.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 20:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qpZ1o8BZbVj97ScJ5uIe5Iz8N7aLUvfNU9S9Nz3IzwM=;
 b=ueCuY7nlJMAdjG7PJWE6yfjETlbSQed33s1axOelQQgjb4P8SXx0XGmSbPyZtB8BFZ
 w1BRWKiZyh2dJvFA/Du0NWsYGGi6+A6zaSLtCIUOJ3hSm9fvuh6/RShhRI4ybeHctkbr
 s79D61mjwbx84dMvD+9bi8gOwFsLYzMqT4Hrg4jHUkiD2NT3zMN3heAyGrJQ+5zDg9UB
 27LoEay70Pu5MfYIGmZzRyxv4hB0vJCzU3MlEvrsA2sysUXGRDbLf9tWWGq+M2mFulrH
 TNB1zyLmrbLMZATJqIqrqB5zXlH+kn9IVSOeqyVnbV/urqYu4Z0b4W4AYzsNLx59EKrC
 cMdQ==
X-Gm-Message-State: AOAM533Dx+xzZShHloaYB9gCGlp1ogjDC1KhnwqJBW/ILoUBKA1rAqef
 4C5Rpf31rsmrUC56qFCHYXRo17yz+kBZZX780skgUQL27Up+YNlroEYUNJCzDd609IpEu295GdZ
 0Eh2nNLcxW0q6LzAiIUYTdMi4v74FSva2eCjH9bWLri20RTjLnZxHCasFJ1P/hA==
X-Received: by 2002:a05:6512:3b93:: with SMTP id
 g19mr19441659lfv.548.1620703983109; 
 Mon, 10 May 2021 20:33:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ3I3h7WqnNP7SEfWG7sKaQkaYZUkTMSdI76PL8q58FqDBzKUFS9tR8ZJAqHuO5+E46Kf0NlHlj83wxal64HY=
X-Received: by 2002:a05:6512:3b93:: with SMTP id
 g19mr19441646lfv.548.1620703982869; 
 Mon, 10 May 2021 20:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210430045656.577395-1-kai.heng.feng@canonical.com>
In-Reply-To: <20210430045656.577395-1-kai.heng.feng@canonical.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 11 May 2021 11:32:50 +0800
Message-ID: <CAAd53p4fLYXB0z7OQOmAS_BkACARTrrfRf+QwWd3MYQhk5oFTw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/radeon/dpm: Disable sclk switching on Oland when
 two 4K 60Hz monitors are connected
To: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 12:57 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> Screen flickers rapidly when two 4K 60Hz monitors are in use. This issue
> doesn't happen when one monitor is 4K 60Hz (pixelclock 594MHz) and
> another one is 4K 30Hz (pixelclock 297MHz).
>
> The issue is gone after setting "power_dpm_force_performance_level" to
> "high". Following the indication, we found that the issue occurs when
> sclk is too low.
>
> So resolve the issue by disabling sclk switching when there are two
> monitors requires high pixelclock (> 297MHz).
>
> v2:
>  - Only apply the fix to Oland.
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

A gentle ping...

> ---
>  drivers/gpu/drm/radeon/radeon.h    | 1 +
>  drivers/gpu/drm/radeon/radeon_pm.c | 8 ++++++++
>  drivers/gpu/drm/radeon/si_dpm.c    | 3 +++
>  3 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index 42281fce552e6..56ed5634cebef 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -1549,6 +1549,7 @@ struct radeon_dpm {
>         void                    *priv;
>         u32                     new_active_crtcs;
>         int                     new_active_crtc_count;
> +       int                     high_pixelclock_count;
>         u32                     current_active_crtcs;
>         int                     current_active_crtc_count;
>         bool single_display;
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
> index 0c1950f4e146f..3861c0b98fcf3 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -1767,6 +1767,7 @@ static void radeon_pm_compute_clocks_dpm(struct radeon_device *rdev)
>         struct drm_device *ddev = rdev->ddev;
>         struct drm_crtc *crtc;
>         struct radeon_crtc *radeon_crtc;
> +       struct radeon_connector *radeon_connector;
>
>         if (!rdev->pm.dpm_enabled)
>                 return;
> @@ -1776,6 +1777,7 @@ static void radeon_pm_compute_clocks_dpm(struct radeon_device *rdev)
>         /* update active crtc counts */
>         rdev->pm.dpm.new_active_crtcs = 0;
>         rdev->pm.dpm.new_active_crtc_count = 0;
> +       rdev->pm.dpm.high_pixelclock_count = 0;
>         if (rdev->num_crtc && rdev->mode_info.mode_config_initialized) {
>                 list_for_each_entry(crtc,
>                                     &ddev->mode_config.crtc_list, head) {
> @@ -1783,6 +1785,12 @@ static void radeon_pm_compute_clocks_dpm(struct radeon_device *rdev)
>                         if (crtc->enabled) {
>                                 rdev->pm.dpm.new_active_crtcs |= (1 << radeon_crtc->crtc_id);
>                                 rdev->pm.dpm.new_active_crtc_count++;
> +                               if (!radeon_crtc->connector)
> +                                       continue;
> +
> +                               radeon_connector = to_radeon_connector(radeon_crtc->connector);
> +                               if (radeon_connector->pixelclock_for_modeset > 297000)
> +                                       rdev->pm.dpm.high_pixelclock_count++;
>                         }
>                 }
>         }
> diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
> index 9186095518047..3cc2b96a7f368 100644
> --- a/drivers/gpu/drm/radeon/si_dpm.c
> +++ b/drivers/gpu/drm/radeon/si_dpm.c
> @@ -2979,6 +2979,9 @@ static void si_apply_state_adjust_rules(struct radeon_device *rdev,
>                     (rdev->pdev->device == 0x6605)) {
>                         max_sclk = 75000;
>                 }
> +
> +               if (rdev->pm.dpm.high_pixelclock_count > 1)
> +                       disable_sclk_switching = true;
>         }
>
>         if (rps->vce_active) {
> --
> 2.30.2
>
