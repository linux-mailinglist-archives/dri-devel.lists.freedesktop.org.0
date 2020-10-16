Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ABB28FF97
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 09:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852366EA8A;
	Fri, 16 Oct 2020 07:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46C26EA8A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 07:58:57 +0000 (UTC)
Received: by mail-oo1-xc41.google.com with SMTP id z1so414291ooj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 00:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tewdnEIcomqLAQgtQAKYspeG6tEqRWNOiF+HBiFI6Mw=;
 b=FFaNReymf2ffNkSnTEVbkOnaIx1vEXlq8wNRzKBEazElPeTroXDCEmqDCAPUfIKycj
 OxrcMIt6c+Lz1DvOt7aY3XDjwKnKo1uTCPZekqMk7ut+qtE/9IkQ7y1mqmM29F24l4ji
 QxTprnsTs6IBE4z9SDWP3TIeDR74MpJY6ppd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tewdnEIcomqLAQgtQAKYspeG6tEqRWNOiF+HBiFI6Mw=;
 b=P6OjBmlEIgDALUBbBe9DxTVibTd60HcjcSXi+799w2Nr/B5Mbkd+cqCZN0FCcwZWhW
 +MPDPLeV9hFPs15pzQN6wryDdl7cwT7ImJ4p6ZeNNJ2sVv1YE9OwqzUqeD+RvIQTn58h
 vDFkSd1+KZBuHqdrMZhdP9Z+ySfYZKiCfyGCFMHhCbGqCrYmj/GnygcuR74FYZT4M/Dg
 dYvftl6dOuwtWFatP+O4tw9NrgCSSjDrS/E/lhAiNNwR1B0f+sanXDsaFq9IsxogswFk
 l43YmcPMimPpHnciGdKy8wDaupqPkuvmSaS2mCDvG49q7Cj2jWM1SORivv6atMctL/2/
 S1Nw==
X-Gm-Message-State: AOAM5330pnZUXfMYJJxteISzUZdqjxvELPwHRHfhv3xLoWHQiYKkezGo
 AYUlQCK5RbzdtQGAd2dGPC5L7GC9DTvtkcSWfS5UgA==
X-Google-Smtp-Source: ABdhPJz6Ft9W6rL1fJHK5X7LsgAjE53B988IvCK8SlazPBpx9AEGn+icfapdEkZNqutWDzmTDYAYP9jRjyDK/0x2GL8=
X-Received: by 2002:a4a:c011:: with SMTP id v17mr1755299oop.89.1602835137109; 
 Fri, 16 Oct 2020 00:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201016071254.2681-1-shawn.guo@linaro.org>
In-Reply-To: <20201016071254.2681-1-shawn.guo@linaro.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Oct 2020 09:58:46 +0200
Message-ID: <CAKMK7uHvDK6Cd2BBvUV-xtArD73gQVAp0ETBw=tLXrYUfOS-zw@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_vblank: use drm_warn_once() to warn undefined
 mode timing
To: Shawn Guo <shawn.guo@linaro.org>
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
Cc: Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 16, 2020 at 9:13 AM Shawn Guo <shawn.guo@linaro.org> wrote:
>
> Commit 5caa0feafcc6 ("drm/vblank: Lock down vblank->hwmode more") added
> WARN_ON_ONCE() for atomic drivers to warn the case that vsync is enabled
> before a mode has been set on CRTC.  This happens sometimes during the
> initial mode setting of a CRTC.  It also happens on Android running HWC2
> backed with drm_hwcomposer, where HWC2::SetVsyncEnabled could be called
> before the atomic mode setting on CRTC happens.
>
> In this case, there is nothing really bad to happen as kernel function
> returns as no-op.  So using WARN() version might be overkilled,
> considering some user space crash reporting services may treat kernel
> WARNINGS as crashes.  Let's drop WARN_ON_ONCE() and change drm_dbg_core()
> to drm_warn_once() for warning undefined mode timing.

This indicates a bug in your driver. Please fix it there, not by
shutting up the core code complaining about that. Either you're
getting vblank timestamps when the vblank isn't set up yet
(drm_crtc_vblank_on/off) or there's some other race going on in your
driver code resulting in this.
-Daniel

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/gpu/drm/drm_vblank.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index b18e1efbbae1..5f7c4a923e8a 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -717,9 +717,9 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>          * Happens during initial modesetting of a crtc.
>          */
>         if (mode->crtc_clock == 0) {
> -               drm_dbg_core(dev, "crtc %u: Noop due to uninitialized mode.\n",
> -                            pipe);
> -               drm_WARN_ON_ONCE(dev, drm_drv_uses_atomic_modeset(dev));
> +               drm_warn_once(dev, "crtc %u: Noop due to uninitialized mode.\n",
> +                             pipe);
> +
>                 return false;
>         }
>
> --
> 2.17.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
