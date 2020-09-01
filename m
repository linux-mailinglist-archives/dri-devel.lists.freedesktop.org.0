Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90424259029
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 16:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0D26E069;
	Tue,  1 Sep 2020 14:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C4F6E069;
 Tue,  1 Sep 2020 14:19:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s13so1337257wmh.4;
 Tue, 01 Sep 2020 07:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d0qADbe6lms6ja4jpLh/7o17Sin0XkGvPQGFqKKb+qg=;
 b=as6ZhId9BGoiIsUyZNdl9MSpaccNfWAqHVVOh4EZLW3JAc7umkdnIUkQYJW9Y/O7O6
 V/3ukFkjQ1fQ1J4BmR9M3TZVjFuHNa7tAvFQy/qtRvWhU5kqhcjh5wGmooW0riApIaAC
 qdU8ki+7vWhPKZn2Q/o+8neu2WcjW+svESa4ASqDpoR4edxM8444vT0U3pWovFpXRhDR
 XDZ062GHZLCaaxuJWsVUogdrjcyQqVDllx7IoAzq2iXEbz5xDISPSFoZpAddlGpJfHwT
 1g22zEyYs0IK+9XPqgqhxPXLzNySLPlLzaOI12aM2dwwTU98/CpSdK8jqxCgW/JFIYXW
 xrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d0qADbe6lms6ja4jpLh/7o17Sin0XkGvPQGFqKKb+qg=;
 b=g3ND4ckhnCICVkP8qsqKUWL5mI92W60UiKeq2uu4gyR1zEpVfDBXHE3YFpPTIF41iQ
 Xe8eGtVPJh59x+UMJ9BHGhsyPeq5uJseAwhV8p38CiAeYryaUyLo6i9oNy5zMKwLj8/p
 Fsfag7OUjtrcn2rFDP04+h0K0YsbQWPC2zbiEGvVeZG1nZj/GZM4ifDjSkhafhKVtoTU
 ANLURaSs6Y5dKBYbZE78mKzsjRGeRBI4dfVKNI8TNKMF9E/3ZdsGZ254vnClw2GQBnM6
 Lxp7I1nPIPdT3HCtjN05AdHhlsQNVrqU9H+90EhSoiCQ1XhGmQsYmlrYfQmCHJ+TCzHE
 qxcg==
X-Gm-Message-State: AOAM533GdZ5ftjJ84W23YbWTGZ2DnPUM6kcZ+6ubsCEVJvx73je7pPsa
 svHMP5xY1+TDG9/nP0DeIlefo+Yye5mHe6EMDWVvlMW5
X-Google-Smtp-Source: ABdhPJx3A8LQc1AKi5DhvdsaNfy/S9210zyQvGHZaEZytNnb0nVwDTHCrkHOYp694kkRcwuI/Tuh7/aRO9coNr/vsSw=
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr2075647wmj.79.1598969971757; 
 Tue, 01 Sep 2020 07:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200901063227.6057-1-kai.heng.feng@canonical.com>
In-Reply-To: <20200901063227.6057-1-kai.heng.feng@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Sep 2020 10:19:20 -0400
Message-ID: <CADnq5_MXs-=BpMrYVudhHPjTpgs1XUE=GEujpp5AeYy5vWS=YA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Reset ASIC if suspend is not managed by
 platform firmware
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

On Tue, Sep 1, 2020 at 3:32 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> Suspend with s2idle or by the following steps cause screen frozen:
>  # echo devices > /sys/power/pm_test
>  # echo freeze > /sys/power/mem
>
> [  289.625461] [drm:uvd_v1_0_ib_test [radeon]] *ERROR* radeon: fence wait timed out.
> [  289.625494] [drm:radeon_ib_ring_tests [radeon]] *ERROR* radeon: failed testing IB on ring 5 (-110).
>
> The issue doesn't happen on traditional S3, probably because firmware or
> hardware provides extra power management.
>
> Inspired by Daniel Drake's patch [1] on amdgpu, using a similar approach
> can fix the issue.

It doesn't actually fix the issue.  The device is never powered down
so you are using more power than you would if you did not suspend in
the first place.  The reset just works around the fact that the device
is never powered down.

Alex

>
> [1] https://patchwork.freedesktop.org/patch/335839/
>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/gpu/drm/radeon/radeon_device.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 266e3cbbd09b..df823b9ad79f 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -33,6 +33,7 @@
>  #include <linux/slab.h>
>  #include <linux/vga_switcheroo.h>
>  #include <linux/vgaarb.h>
> +#include <linux/suspend.h>
>
>  #include <drm/drm_cache.h>
>  #include <drm/drm_crtc_helper.h>
> @@ -1643,6 +1644,8 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
>                 rdev->asic->asic_reset(rdev, true);
>                 pci_restore_state(dev->pdev);
>         } else if (suspend) {
> +               if (pm_suspend_no_platform())
> +                       rdev->asic->asic_reset(rdev, true);
>                 /* Shut down the device */
>                 pci_disable_device(dev->pdev);
>                 pci_set_power_state(dev->pdev, PCI_D3hot);
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
