Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC79C1958E8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 15:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C606EA3D;
	Fri, 27 Mar 2020 14:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389906EA3D;
 Fri, 27 Mar 2020 14:25:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t7so11577846wrw.12;
 Fri, 27 Mar 2020 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=peP7S2GwPuZ1IKo8FYOZ1jeo4ELir9xxjxU6GqZTgX4=;
 b=StriVB/9TjnZWqc9kH0lHNwEqOCxpb0m9aQdojCVw1TQU0oy/QZmPbaIfR9bNuuDue
 7QSZAxlsnLBkfPYxxgTtuTR7SG4++YVzHqCtUdty6s6uiOdYYad77k+0Xw9ASLhjFAAm
 ay5WyECrlMw2Zm2a/hdNBiz8O01W0fYEyoGhfJ8zJLc35IS25jRq/W8EnoIxlLXuIgiW
 V1SW9UcztB62fpCyNNq7iXdVJh4K+Zc68m3LvFEQECRHDZzeIjsZiGDE2NW0a6PXcRRq
 OCYALWXPpOprqJaK8D3HOoOH8pGbJ6wveEo4cTPqYtePW5d1v4IWdsTgpPwJCfJidDUl
 5JTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=peP7S2GwPuZ1IKo8FYOZ1jeo4ELir9xxjxU6GqZTgX4=;
 b=fgtSv/mi8xhmUmgS7TVdk/n8+rJCLkJ1RJUzWIuGJWB+x+PT9wlgOpJh1O9HBfptxC
 qV8G1EoHWZ9qmvGSDbKpLkKXYjLQgZCJsVW+qjT/MteEvnkrMReetEvAtM+lufld0CeO
 OXvRqfDHmqaSb4IloPc1LGwEohZZMlsRQHR+7347tqBsZO/3mWkPkh3dxCm5oBXQdmSL
 MrY9KDyKrWfN9Qem8bxwm2bonsNm6ET7IuD5IPevSqv9BMj1yVn7ag5lbqGiilWSq05U
 6GgIuQakNoWfL5LwuuuwIwvRK0cIrENsuv1TIcWEdX+FIR0rMIy8h5U3ZCUXh0FlPdv1
 Mlpw==
X-Gm-Message-State: ANhLgQ0fUR9OkWwOJNbnTkG5BSQFKdfxDQ4RUCKZnyXlWQyZzYXAOKq8
 vmZUKcpEVfju8Iy179Jl9RVmRaxLWkAzKBBcSrhnyA==
X-Google-Smtp-Source: ADFU+vsXiZ0/Ce9a1O/msDlNwkE/7qgqmUo4B7/lmX8Z7cLom/fYyI4rkhFAI0E0S/gHRNqEyYdwzjZyyssYophWnCs=
X-Received: by 2002:a05:6000:111:: with SMTP id
 o17mr15146245wrx.111.1585319127768; 
 Fri, 27 Mar 2020 07:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
 <20200326211005.13301-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200326211005.13301-7-wsa+renesas@sang-engineering.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 27 Mar 2020 10:25:16 -0400
Message-ID: <CADnq5_P07b-A-VawLTgiTMSdifxMbWS5kgQV_+0Bw2x_DQHATQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/radeon: convert to use i2c_new_client_device()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 5:35 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Move away from the deprecated API.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

patches 1,6, are:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/radeon/radeon_atombios.c | 4 ++--
>  drivers/gpu/drm/radeon/radeon_combios.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
> index 848ef68d9086..5d2591725189 100644
> --- a/drivers/gpu/drm/radeon/radeon_atombios.c
> +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
> @@ -2111,7 +2111,7 @@ static int radeon_atombios_parse_power_table_1_3(struct radeon_device *rdev)
>                                                                     ucOverdriveThermalController];
>                         info.addr = power_info->info.ucOverdriveControllerAddress >> 1;
>                         strlcpy(info.type, name, sizeof(info.type));
> -                       i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> +                       i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
>                 }
>         }
>         num_modes = power_info->info.ucNumOfPowerModeEntries;
> @@ -2351,7 +2351,7 @@ static void radeon_atombios_add_pplib_thermal_controller(struct radeon_device *r
>                                 const char *name = pp_lib_thermal_controller_names[controller->ucType];
>                                 info.addr = controller->ucI2cAddress >> 1;
>                                 strlcpy(info.type, name, sizeof(info.type));
> -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
>                         }
>                 } else {
>                         DRM_INFO("Unknown thermal controller type %d at 0x%02x %s fan control\n",
> diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
> index c3e49c973812..d3c04df7e75d 100644
> --- a/drivers/gpu/drm/radeon/radeon_combios.c
> +++ b/drivers/gpu/drm/radeon/radeon_combios.c
> @@ -2704,7 +2704,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
>                                 const char *name = thermal_controller_names[thermal_controller];
>                                 info.addr = i2c_addr >> 1;
>                                 strlcpy(info.type, name, sizeof(info.type));
> -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
>                         }
>                 }
>         } else {
> @@ -2721,7 +2721,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
>                                 const char *name = "f75375";
>                                 info.addr = 0x28;
>                                 strlcpy(info.type, name, sizeof(info.type));
> -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
>                                 DRM_INFO("Possible %s thermal controller at 0x%02x\n",
>                                          name, info.addr);
>                         }
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
