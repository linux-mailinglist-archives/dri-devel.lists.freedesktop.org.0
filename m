Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D041037AFFC
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 22:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B456E50C;
	Tue, 11 May 2021 20:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907436E0D2;
 Tue, 11 May 2021 20:13:01 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so8418922otg.2; 
 Tue, 11 May 2021 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2M7i3OM3TdmABjLPSIXD1SsZiaIt0flPM1PcqwkFM0E=;
 b=G+o2VLn5iC77L6jgX4A3gjrnUa/7lSk6dn3BJVzLYlnp66WKm+DQVEKYdI2vIZpSQD
 w45MOJtLvVStmHQ6SBGetYuXiR/6bnAcRFr5UVNSqajnf9W5E1IC4eOBODzDos+kaTDw
 4kuG0P6cB56+mzkG0a1Xt5ERhW7FW8sM/TM2dF8x4EahEjGw5S1fQKJc4Wm2bCLR2P+6
 dP+mWrkOvxuirk/I71UUwNSPZk09NLNg7FOnD6/1rab8rPc6Zjn7t94X+Nqe6V6lMsOQ
 WHbShZl8FEH2MrOWZHCivMU9ZQNCZ41UsqPYOnnLiT4zF+9cb5W9Xo4xbvDrfW4LuwUX
 iTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2M7i3OM3TdmABjLPSIXD1SsZiaIt0flPM1PcqwkFM0E=;
 b=h3x+UVU2XBhS/fw/NHzVgWwmXncPGuVOYmq4yEXkZSnD1AtNuxI28hhAkjz3qytiet
 rTIKrgmd/dQA94eID0zlJ0p77WaH/vs6bd9950wcMhmRE1s244uKgFmA/6b6Uhlj02Wf
 dh6jRgfwB6pY6CpxLaqcqJNMjSSiul0JUZE6PRxL8Y1yFO+BMPkbP5Rb4pyr9E9Tnm3L
 yPmUXuiNlWndD5XlB7G/L573VAf39+9/eJls6DrtMAEpGjUqJ+j6P3/e7DW09Ly1el93
 FT2msCo8m0ooshOtcCDaorig7McKLgyONnBmq803PQL8EhIo/qBjWXJSHyyUGJoKowPk
 YW9g==
X-Gm-Message-State: AOAM5314WZLM2Y3OTOTtIlTnQss06V1o2Ga1EokfrHMK8Tq+tJhpzeJ+
 Enf122UXvx19hruqtmDQrPs72gHrLTuMhTNDqSrJoHPw11s=
X-Google-Smtp-Source: ABdhPJwXPwvyfRjsMHTY09QJKdISxNGiHPrjAi1z0b0hOgpy/pkpSRj0Ad3aZhG6x0gkMazxZywXYzfkdlPcQTrKsr8=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr11846574otl.132.1620763980927; 
 Tue, 11 May 2021 13:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210430045656.577395-1-kai.heng.feng@canonical.com>
 <CAAd53p4fLYXB0z7OQOmAS_BkACARTrrfRf+QwWd3MYQhk5oFTw@mail.gmail.com>
In-Reply-To: <CAAd53p4fLYXB0z7OQOmAS_BkACARTrrfRf+QwWd3MYQhk5oFTw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 May 2021 16:12:49 -0400
Message-ID: <CADnq5_OVQv2K_30uWN7qwUsGVWD7bc7qAs-s_TL-m8NLCDSkOw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/radeon/dpm: Disable sclk switching on Oland when
 two 4K 60Hz monitors are connected
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 11:33 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On Fri, Apr 30, 2021 at 12:57 PM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
> >
> > Screen flickers rapidly when two 4K 60Hz monitors are in use. This issue
> > doesn't happen when one monitor is 4K 60Hz (pixelclock 594MHz) and
> > another one is 4K 30Hz (pixelclock 297MHz).
> >
> > The issue is gone after setting "power_dpm_force_performance_level" to
> > "high". Following the indication, we found that the issue occurs when
> > sclk is too low.
> >
> > So resolve the issue by disabling sclk switching when there are two
> > monitors requires high pixelclock (> 297MHz).
> >
> > v2:
> >  - Only apply the fix to Oland.
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>
> A gentle ping...

Applied.  Thanks for the reminder.

Alex


>
> > ---
> >  drivers/gpu/drm/radeon/radeon.h    | 1 +
> >  drivers/gpu/drm/radeon/radeon_pm.c | 8 ++++++++
> >  drivers/gpu/drm/radeon/si_dpm.c    | 3 +++
> >  3 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> > index 42281fce552e6..56ed5634cebef 100644
> > --- a/drivers/gpu/drm/radeon/radeon.h
> > +++ b/drivers/gpu/drm/radeon/radeon.h
> > @@ -1549,6 +1549,7 @@ struct radeon_dpm {
> >         void                    *priv;
> >         u32                     new_active_crtcs;
> >         int                     new_active_crtc_count;
> > +       int                     high_pixelclock_count;
> >         u32                     current_active_crtcs;
> >         int                     current_active_crtc_count;
> >         bool single_display;
> > diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
> > index 0c1950f4e146f..3861c0b98fcf3 100644
> > --- a/drivers/gpu/drm/radeon/radeon_pm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> > @@ -1767,6 +1767,7 @@ static void radeon_pm_compute_clocks_dpm(struct radeon_device *rdev)
> >         struct drm_device *ddev = rdev->ddev;
> >         struct drm_crtc *crtc;
> >         struct radeon_crtc *radeon_crtc;
> > +       struct radeon_connector *radeon_connector;
> >
> >         if (!rdev->pm.dpm_enabled)
> >                 return;
> > @@ -1776,6 +1777,7 @@ static void radeon_pm_compute_clocks_dpm(struct radeon_device *rdev)
> >         /* update active crtc counts */
> >         rdev->pm.dpm.new_active_crtcs = 0;
> >         rdev->pm.dpm.new_active_crtc_count = 0;
> > +       rdev->pm.dpm.high_pixelclock_count = 0;
> >         if (rdev->num_crtc && rdev->mode_info.mode_config_initialized) {
> >                 list_for_each_entry(crtc,
> >                                     &ddev->mode_config.crtc_list, head) {
> > @@ -1783,6 +1785,12 @@ static void radeon_pm_compute_clocks_dpm(struct radeon_device *rdev)
> >                         if (crtc->enabled) {
> >                                 rdev->pm.dpm.new_active_crtcs |= (1 << radeon_crtc->crtc_id);
> >                                 rdev->pm.dpm.new_active_crtc_count++;
> > +                               if (!radeon_crtc->connector)
> > +                                       continue;
> > +
> > +                               radeon_connector = to_radeon_connector(radeon_crtc->connector);
> > +                               if (radeon_connector->pixelclock_for_modeset > 297000)
> > +                                       rdev->pm.dpm.high_pixelclock_count++;
> >                         }
> >                 }
> >         }
> > diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
> > index 9186095518047..3cc2b96a7f368 100644
> > --- a/drivers/gpu/drm/radeon/si_dpm.c
> > +++ b/drivers/gpu/drm/radeon/si_dpm.c
> > @@ -2979,6 +2979,9 @@ static void si_apply_state_adjust_rules(struct radeon_device *rdev,
> >                     (rdev->pdev->device == 0x6605)) {
> >                         max_sclk = 75000;
> >                 }
> > +
> > +               if (rdev->pm.dpm.high_pixelclock_count > 1)
> > +                       disable_sclk_switching = true;
> >         }
> >
> >         if (rps->vce_active) {
> > --
> > 2.30.2
> >
