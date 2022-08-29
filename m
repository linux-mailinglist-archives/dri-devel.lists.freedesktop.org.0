Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DA35A4E76
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCD110F299;
	Mon, 29 Aug 2022 13:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C10D10F28C;
 Mon, 29 Aug 2022 13:48:02 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id r124so10358147oig.11;
 Mon, 29 Aug 2022 06:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=boJNilqu5rkLXIrZXtZ+13kCjg+IVe8CBRV4aqjI3IQ=;
 b=kMzNApZWAepG8844yhdKAszbolxRMCr4T+NZX6qZyk4HXX5WGa/xOKJMkyeaYeyGIV
 gGPctdEYzEMmPH/0QF4SQjImmks2NCtrJJG5iRCh800OcIulJhnhJJvHLT6iPJC99Nsi
 4H+N+bZRUg1CWo0PPv4Pl2cjlCxqRxc/r/xp4KB0afY0jL0P1bPvNbODbM2AJCCHArz3
 4pyjCGQvX/e/9UPbCK80eF/+dqAmalmZRjQqfIw7F41sHKKheEyu2E24Bs7hVSDOBUYs
 Fz1KUf8zkHrmHVMTsouCKyTk2BctKRG6UqIYDagyLyA/GUlzp4Ujyf9WbbgErxSwfPB0
 uM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=boJNilqu5rkLXIrZXtZ+13kCjg+IVe8CBRV4aqjI3IQ=;
 b=kpZrkR4zlRu4wUhQuh2/mORSN6RjbaNy3UH+Awn6CZjffcVCVgf0VfykzYIeZPet3+
 uU2WXrb9hWSKgDpqe1/trQyvtr9aTqcooCbr/ipgaOi9IeSNQCDlogP/aGEaE0rpVp4T
 grYK7538Ez+DAm+bWEOSCt90oPvK9M0GfbcccZAfFeg1+XYcfMsqmw7YRJpe5sSC/BKk
 PF6xdpY6JaLLmerXC8ZAjSi+yU0Y/BjKuvez9V11PzAztpvgZYDClYMyCjBsCe8AXuqh
 fXWokf5bsPNTwpuIgLxUztk+2WEQy8UoTfAkdhi9NkUUenD/42h66E3iXs3e1tC8ap50
 KDuA==
X-Gm-Message-State: ACgBeo3gBqoyX5Za9bX7YShw5OcsosHfKkkz0gCRnn/bmABVCpJ2DqgD
 PTFmncf5FRDHNHr9V/ZPCsKF7Nw7k0KX/XFkNdk=
X-Google-Smtp-Source: AA6agR5ZkGCAzYchqafGj2oNqKZbHuDk+qOgihZvR2eaNfjMBopqDWWFPHuoApwE0QzrDc6rJ3T3cUdTjfbQ4dJyqLM=
X-Received: by 2002:a05:6808:138e:b0:345:13d1:fd66 with SMTP id
 c14-20020a056808138e00b0034513d1fd66mr7375330oiw.96.1661780881704; Mon, 29
 Aug 2022 06:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220829123654.4333-1-nizhen@uniontech.com>
In-Reply-To: <20220829123654.4333-1-nizhen@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Aug 2022 09:47:50 -0400
Message-ID: <CADnq5_P9b3QbO_u4y+isN07WiErPKQRB1O1wvmhXMbV52PeV6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: Add modeset module parameter support
To: Zhen Ni <nizhen@uniontech.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 evan.quan@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 29, 2022 at 9:43 AM Zhen Ni <nizhen@uniontech.com> wrote:
>
> Nomodeset kernel parameter is for all graphics cards. Amdgpu cannot
> be set separately in some scenarios, such as hybrid graphics(i + a).
> Add modeset module parameter for amdgpu to set kernel mode separately.
>
> Signed-off-by: Zhen Ni <nizhen@uniontech.com>

amdgpu didn't support this option since it never supported the legacy
drm mode that other older drivers did.  If you just want the option to
keep the driver from loading, you can already do this by blacklisting
the driver.  E.g.,
modprobe.blacklist=amdgpu

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 429fcdf28836..856a70370e3c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -107,6 +107,7 @@
>  #define KMS_DRIVER_MINOR       48
>  #define KMS_DRIVER_PATCHLEVEL  0
>
> +int amdgpu_modeset = -1;
>  int amdgpu_vram_limit;
>  int amdgpu_vis_vram_limit;
>  int amdgpu_gart_size = -1; /* auto */
> @@ -199,6 +200,13 @@ struct amdgpu_watchdog_timer amdgpu_watchdog_timer = {
>         .period = 0x0, /* default to 0x0 (timeout disable) */
>  };
>
> +/**
> + * DOC: modeset (int)
> + * Disable/Enable kernel modesetting (1 = enable, 0 = disable, -1 = auto (default)).
> + */
> +MODULE_PARM_DESC(modeset, "Disable/Enable kernel modesetting");
> +module_param_named(modeset, amdgpu_modeset, int, 0400);
> +
>  /**
>   * DOC: vramlimit (int)
>   * Restrict the total amount of VRAM in MiB for testing.  The default is 0 (Use full VRAM).
> @@ -2753,7 +2761,10 @@ static int __init amdgpu_init(void)
>  {
>         int r;
>
> -       if (drm_firmware_drivers_only())
> +       if (drm_firmware_drivers_only() && amdgpu_modeset == -1)
> +               amdgpu_modeset = 0;
> +
> +       if (amdgpu_modeset == 0)
>                 return -EINVAL;
>
>         r = amdgpu_sync_init();
> --
> 2.20.1
>
