Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F099A88208
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7912B10E5C0;
	Mon, 14 Apr 2025 13:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HBHvUoCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39EE10E5C0;
 Mon, 14 Apr 2025 13:29:25 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-523f58d7322so248474e0c.1; 
 Mon, 14 Apr 2025 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744637365; x=1745242165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gIG3nYBZANIFgu52jyjhWW3N+y09Fbww46hgtWyndUw=;
 b=HBHvUoCspV6M1mjO6Y9vhWDoNsYGn1w/JdrNwedwuf7QCj49gAZskVvnLoDbbBiETx
 xQ1YmFchlFNIdA/GC+LxHAw8qBW/t3SAXkV6IPjdkJduZRGUznPiRB7VsdvsipWtxGF1
 o7AM7b2GLicIePW+E9bbuBASee7cIZX/iMHxjs98zlPLTfqLTF341nQlhwsvVVO+rDg0
 t4ImkrAsmuINrirY433A1hPyyaCbZzGUt43voUTR9vX0kGCp7FEnxxQ+Riyln6nXeryj
 CRqMQspaogDTtzXdoDY5Gu7QjlnekpiHlcoyGbNVCzEIA4AUC3Tnzw/3rbqUgwF1DTks
 Eojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744637365; x=1745242165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gIG3nYBZANIFgu52jyjhWW3N+y09Fbww46hgtWyndUw=;
 b=OI3U6AudSjPcIhY7jnZND0FmNxkYR/0L0i9PoQILy+bIghkR59fvW4C2l4YWF4lzC1
 Tvizbe1k/enqYGwl7ojUfuggbacZDUSPeS3r91tGuAt7o8vhqMQrCEBUOFO0TESubtQT
 Rb0rDZ+2UlEdvkK9LPnyV0lEEqp+ZUwl1GvtVDFyt3uVdC00EqIKcFqaRaiherflrr4G
 Gq9YWitX6Hjp0ZxG8GAu5Do7aDJI8Qu17gyftuwnI7L9n2wWFn+IOCDOV4UwB63LGVy9
 O7Don4oInBu+6CCbOeuiPMzwrijXX/JPTQ6i9apft5vrm7YX8ZsYwa2G4xim953ntIMu
 WeJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG1btBhwincOLZk1QHLcPK2UwTlfVNXYmyen5jY9kiokC2SgwKaedJPYxnXkOFK5ADG4SUN4YB@lists.freedesktop.org,
 AJvYcCWMbp5rTqqlykesDz9w0Xfox6AdDNxKUmJVpKncbpjlNpAEiJ+k8XGFBZt+VdNQReNvM56+JF7WWjen@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjIq2BAeef48YpWQnih0RQkxlD9qzIg/KD1SfiV1a1XVcpzaUk
 si3JXee3zWoCJ9nnaZztqpxLvEKOiA3nuMAvxh4vSgFvx0wSBnhhdg+3VHVQ0aDdi2reC12plDo
 Jte2X5tKLs0z7WYONBSXRW+s8SEY=
X-Gm-Gg: ASbGncsZ1JZbhJHSIzZxDHxx4jPwSCuE7sgJ8YKXHa1k4f33e4DviC/975Hga8lzwlK
 tpNDlw4kVNfYSZhtmZwHA23eAcXWma2VPk/ZzEDkcETMzVYbnV7o6AjhHFu7vOKM39ZoR9W5KZX
 8xnk5rCs+sGpXcjLfJMBE71I/uEfD+6M7v
X-Google-Smtp-Source: AGHT+IG6g+fPMqIcko5cV+T9c+jrMKIzJVLV4IR5A3Y/Uj+5/l+H4zy3gxbLj+sMLQriAlG/2Nxbv0zeR9OXLxHkxgE=
X-Received: by 2002:a05:6102:5e82:b0:4c3:52f:175b with SMTP id
 ada2fe7eead31-4c9e504ca1amr2508561137.6.1744637364455; Mon, 14 Apr 2025
 06:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250414063611.2100-1-vulab@iscas.ac.cn>
In-Reply-To: <20250414063611.2100-1-vulab@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Apr 2025 09:29:12 -0400
X-Gm-Features: ATxdqUG4Qb2Ft6FqGFxR47VXph-78DAr6grKjDU9soRx-alt8lzMAqt-V5Z6ysU
Message-ID: <CADnq5_N_-0cd69Zh3zJ0k6xEVs5N7XoJQjdZp+v_kUvqHoTVRA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/amd/pm/powerplay/smumgr/fiji_smumgr: Fix wrong
 return value of fiji_populate_smc_boot_level()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: kenneth.feng@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Apr 14, 2025 at 3:24=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> The return value of fiji_populate_smc_boot_level() is always 0, which
> represent the failure of the function. The result of phm_find_boot_level(=
)
> should be recored and return. An error handling is also needed to
> phm_find_boot_level() to reset the boot level when the function fails.
> A proper implementation can be found in tonga_populate_smc_boot_level().
>
> Fixes: dcaf3483ae46 ("drm/amd/pm/powerplay/smumgr/fiji_smumgr: Remove unu=
sed variable 'result'")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  .../drm/amd/pm/powerplay/smumgr/fiji_smumgr.c | 23 +++++++++++++------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> index 5e43ad2b2956..7d0cb3741b94 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> @@ -1600,19 +1600,28 @@ static int fiji_populate_smc_uvd_level(struct pp_=
hwmgr *hwmgr,
>  static int fiji_populate_smc_boot_level(struct pp_hwmgr *hwmgr,
>                 struct SMU73_Discrete_DpmTable *table)
>  {
> +       int result =3D 0;
>         struct smu7_hwmgr *data =3D (struct smu7_hwmgr *)(hwmgr->backend)=
;
>
>         table->GraphicsBootLevel =3D 0;
>         table->MemoryBootLevel =3D 0;
>
>         /* find boot level from dpm table */
> -       phm_find_boot_level(&(data->dpm_table.sclk_table),
> -                           data->vbios_boot_state.sclk_bootup_value,
> -                           (uint32_t *)&(table->GraphicsBootLevel));
> +       result =3D phm_find_boot_level(&(data->dpm_table.sclk_table),
> +                                    data->vbios_boot_state.sclk_bootup_v=
alue,
> +                                    (uint32_t *)&(table->GraphicsBootLev=
el));
> +       if (result) {
> +               table->GraphicsBootLevel =3D 0;
> +               return 0;

This will skip setting the voltages later below.

> +       }
>
> -       phm_find_boot_level(&(data->dpm_table.mclk_table),
> -                           data->vbios_boot_state.mclk_bootup_value,
> -                           (uint32_t *)&(table->MemoryBootLevel));
> +       result =3D phm_find_boot_level(&(data->dpm_table.mclk_table),
> +                                    data->vbios_boot_state.mclk_bootup_v=
alue,
> +                                    (uint32_t *)&(table->MemoryBootLevel=
));
> +       if (result) {
> +               table->MemoryBootLevel =3D 0;
> +               return 0;

Same here.

If you are intending to match the logic in
tonga_populate_smc_boot_level(), the existing code already does that
(minus the error message).  This change would break that.  Returning
early may break working devices.

Alex

> +       }
>
>         table->BootVddc  =3D data->vbios_boot_state.vddc_bootup_value *
>                         VOLTAGE_SCALE;
> @@ -1625,7 +1634,7 @@ static int fiji_populate_smc_boot_level(struct pp_h=
wmgr *hwmgr,
>         CONVERT_FROM_HOST_TO_SMC_US(table->BootVddci);
>         CONVERT_FROM_HOST_TO_SMC_US(table->BootMVdd);
>
> -       return 0;
> +       return result;
>  }
>
>  static int fiji_populate_smc_initailial_state(struct pp_hwmgr *hwmgr)
> --
> 2.42.0.windows.2
>
