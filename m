Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 925BB36F0CA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 22:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8F46F4A4;
	Thu, 29 Apr 2021 20:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED8D6F4A4;
 Thu, 29 Apr 2021 20:06:47 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso48417361otm.4; 
 Thu, 29 Apr 2021 13:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zpBPDRcCRB4YxTEvwemy+iKlTGhooWps70WY0dARJHk=;
 b=uv5WKOSb0n9+PSbwiZF9C7R5OItIFXVmQzEgvQPbML11er6OCcLvYx9Iy7kvH6+2DR
 IFGHm+BC0SdAJW26T0arODEv3n/DoMpnCOPFTBVJ3ZjWRy+oexH6W6szK3dZpctkquFM
 CoZtrpCrO3UFDlAPdFGd9iidNr2sTmWmoJuzh3Q/cOeVk4FKabrpO6Qty7eIKlfR6gUD
 kg1jefsCRnqoG6vRE5x2DOfd0A4NFRMuN+enDyl1Bz/1BTxGGMbIrD2v+dw5I6GHZpfb
 tvsNTbH0lqmTXHf1+urJ4PDMiS0ZZSviLOIbEYkHWFO/e2AJFn44atiX1P/bbccQB7tc
 CuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zpBPDRcCRB4YxTEvwemy+iKlTGhooWps70WY0dARJHk=;
 b=lj34Jrq7zncdo/MyWhbTvtxMzQTwcrj7UtWrzbX1OlREc194JdBSD8HWq/WsEZUXia
 yddJXQwAgmq/sZPNKu9KjKpxB24Qn1oxe3hCneUGkmHbPniix1kCt80Cr9SYhGE3+g75
 eUHpoDdkwyUDpRpjktk75NpZLO/nQ8Cd8B6vsRaVHavFtMp/k5byiTBqwK4rgCHW/pZC
 r5RbAgo69UNSCnTgYmhO/QRk0ApOCJ9NTRC/5nFM51voa5sb5sjN0CMIaV8ikKd8WND6
 hXzmXzY5FmrreI9yI1wMyGEdNycI2pvSnHX0yGGjeNK16trwLvKA7p9+OQgcYuPkEExf
 29EQ==
X-Gm-Message-State: AOAM531pePWl/cDCMwlJJycHgni2UzoU99vUZqOhAZ8QrsyTYGWd8scj
 Vauyv1n5iD1qKUYkVYldVRY/duoAEmf39ARV70o=
X-Google-Smtp-Source: ABdhPJwfjLb/OyZmfEzUeN61AK09kq3wPPmkA4+QKlDFRCyea1X6NeJdVv16cVWd6Rr6GcOWNVG2u4zC+8amG+95JXs=
X-Received: by 2002:a9d:63d1:: with SMTP id e17mr635034otl.311.1619726806738; 
 Thu, 29 Apr 2021 13:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210429133941.531730-1-kai.heng.feng@canonical.com>
In-Reply-To: <20210429133941.531730-1-kai.heng.feng@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Apr 2021 16:06:35 -0400
Message-ID: <CADnq5_MGhFTUOafo_Prjxgek7ufP-9uo59a+_R0=DKZBQayX0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/dpm: Disable sclk switching when two 4K 60Hz
 monitors are connected
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 9:40 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> Screen flickers rapidly when two 4K 60Hz monitors are connected to an
> Oland card. This issue doesn't happen when one monitor is 4K 60Hz
> (pixelclock 594MHz) and another one is 4K 30Hz (pixelclock 297MHz).
>
> The issue is gone after setting "power_dpm_force_performance_level" to
> "high". Following the lead, we found that the issue only occurs when
> sclk is too low.
>
> So resolve the issue by disabling sclk switching when there are two
> monitors that requires high pixelclock (> 297MHz).
>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
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
> index 9186095518047..be6fa3257d1bc 100644
> --- a/drivers/gpu/drm/radeon/si_dpm.c
> +++ b/drivers/gpu/drm/radeon/si_dpm.c
> @@ -2995,6 +2995,9 @@ static void si_apply_state_adjust_rules(struct radeon_device *rdev,
>             ni_dpm_vblank_too_short(rdev))
>                 disable_mclk_switching = true;
>
> +       if (rdev->pm.dpm.high_pixelclock_count > 1)
> +               disable_sclk_switching = true;
> +

I would suggest limiting this to just Oland.

Alex


>         if (rps->vclk || rps->dclk) {
>                 disable_mclk_switching = true;
>                 disable_sclk_switching = true;
> --
> 2.30.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
