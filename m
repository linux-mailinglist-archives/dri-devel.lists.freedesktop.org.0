Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2BB1AA48C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 15:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EAC6E95F;
	Wed, 15 Apr 2020 13:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638C26E95F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 13:38:02 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x4so17494436wmj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 06:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YmDZqgzwCc+hOVGexi2AyWXoOpA3FaRQv7djgmGzJ2Q=;
 b=r7DG+HfDR2f07OTLanCrptCJZhFuu7eOJRpbBSvo5SGFI+0Etxf2MnZPDEiZSjbtqq
 bOmZ6U5GrLo0HzB7rNf+LjGZDs/1wXsgDxuCMeceU9v8UHBSDmemgAlEARGQMO0G8mSV
 tcUj/Kn/HU/x2YDQYTkXVHag230ddJloC53a9KHD0mAt4pkijvboovgcfUpg8Wm3jFns
 kYivcpawG2HGuI85JnuyDNbZoMaeny1e1dZtTE+zuDuX6MtCjt8Fjhxta2u4Nji7WiLN
 RjCHH3So61iYOgspB66yGd/Hoe87g2zStwFTA6bEbnjnzIXHCEz9LLsMsYgyxPeQXXbD
 Of0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YmDZqgzwCc+hOVGexi2AyWXoOpA3FaRQv7djgmGzJ2Q=;
 b=kTFM9h4zLh8UTZViovemfDV3DUkDlBEOWMU0OHOBxv6CqkgG9jmad6xcUAecb0sGtX
 5byZJS8UDFHU589mAE9qRoKqPly1Ey53A0aTRVvO9v9sLaSR92GupwL0IckQOmzOjqnO
 g/f6aWIwQzmT2Uech/sSP2vO6iZ4LZyjvIesp2ZMDjBuBNt2SMhecW3EB8BY7RvRUIOJ
 YueqnXKoZxju4OE86GNyJ8WhSrXvAryVNxB+MloJSiu56IQIAQML9N4rcTchQGdfhCF1
 bT9d2LJKZMWmWdsVxIGuyzF3fH+eVTvEQxSEdBWJ6CK5q+IgJOQhCSSa9fy8CufPqwwj
 +29g==
X-Gm-Message-State: AGi0Puacao6hodw6MSWFp6eNSCcWzewoybaRTNsdQ//QHNMDcUvTCuZv
 Ar32DzziKyKqHQOSVRq3M/BskGSRGrww2xrBDrvraA==
X-Google-Smtp-Source: APiQypKE/VZ08E2XAveZNtkLPdHqDijPRN4SHWJAUvc0Zi8W5LxQoqQwhkdTsWctfZrPKqQ0hnIazj1DFETKzRaG/f0=
X-Received: by 2002:a1c:9d8c:: with SMTP id g134mr5459752wme.79.1586957881041; 
 Wed, 15 Apr 2020 06:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAGPDPzCSaiXdL6ocFtL1VoFtiQLHDE5YQhw-ikWkFVjpaW9GAg@mail.gmail.com>
In-Reply-To: <CAGPDPzCSaiXdL6ocFtL1VoFtiQLHDE5YQhw-ikWkFVjpaW9GAg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 Apr 2020 09:37:49 -0400
Message-ID: <CADnq5_MTLNJ8mh6nZyH14b+RQx1mXwG3hX_x5wco6oQo2d2pUw@mail.gmail.com>
Subject: Re: [PATCH 1/1] AMDGPU: Correctly initialize thermal controller for
 GPUs with Powerplay table v0 (e.g Hawaii)
To: Sandeep <sandy.8925@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 7:36 AM Sandeep <sandy.8925@gmail.com> wrote:
>
> Initialize thermal controller fields in the PowerPlay table for Hawaii
> GPUs, so that fan speeds are reported.

Missing your signed-off-by.

> ---
>  .../drm/amd/powerplay/hwmgr/processpptables.c | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
> b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
> index 77c14671866c..bb58cfab1033 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
> @@ -984,6 +984,34 @@ static int init_thermal_controller(
>   struct pp_hwmgr *hwmgr,
>   const ATOM_PPLIB_POWERPLAYTABLE *powerplay_table)
>  {
> + hwmgr->thermal_controller.ucType =
> + powerplay_table->sThermalController.ucType;
> + hwmgr->thermal_controller.ucI2cLine =
> + powerplay_table->sThermalController.ucI2cLine;
> + hwmgr->thermal_controller.ucI2cAddress =
> + powerplay_table->sThermalController.ucI2cAddress;
> +
> + hwmgr->thermal_controller.fanInfo.bNoFan =
> + (0 != (powerplay_table->sThermalController.ucFanParameters &
> + ATOM_PP_FANPARAMETERS_NOFAN));
> +
> + hwmgr->thermal_controller.fanInfo.ucTachometerPulsesPerRevolution =
> + powerplay_table->sThermalController.ucFanParameters &
> + ATOM_PP_FANPARAMETERS_TACHOMETER_PULSES_PER_REVOLUTION_MASK;
> +
> + hwmgr->thermal_controller.fanInfo.ulMinRPM
> + = powerplay_table->sThermalController.ucFanMinRPM * 100UL;
> + hwmgr->thermal_controller.fanInfo.ulMaxRPM
> + = powerplay_table->sThermalController.ucFanMaxRPM * 100UL;
> +
> + set_hw_cap(
> + hwmgr,
> + ATOM_PP_THERMALCONTROLLER_NONE != hwmgr->thermal_controller.ucType,
> + PHM_PlatformCaps_ThermalController
> +   );
> +
> + hwmgr->thermal_controller.use_hw_fan_control = 1;
> +

Please fix the indentation.

Alex

>   return 0;
>  }
>
> --
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
