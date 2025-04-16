Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A18A90F13
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 01:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECB310E9D9;
	Wed, 16 Apr 2025 23:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dje3MelL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D14110E13F;
 Wed, 16 Apr 2025 23:02:14 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-22409402574so301235ad.1; 
 Wed, 16 Apr 2025 16:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744844534; x=1745449334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NqTe+Ty3z3+ddmQAyRlIGIeZpUBjytRKMYY9HBbylrw=;
 b=dje3MelLfsEEiTJuFDgplTbnz+YsDsps5r3eeoCznZYDqkapqapCLtYl1MW9VQzxdJ
 yCIh1yhMGK4u7CQg0OLQtgFUK1QoynDmhxK4m5jD7lk6C/1kcjiQy4vGM/I3yTGcekom
 2A4uh9Y0yGF/AXVSzAKT/NVz7Z/GmnZa+vyypQ4PA7zxUhzkHY/YU1wjU6sVPMaxQ7FC
 3dgwInLrnQyDo/A/nI/bSxrOydEbNnOiQhLXVjRaGA1/69AqTpENi/JAnpaWb6Na93kL
 D9JDVGWgpQnFOMHMqM3RfH0UoMyyBRinW4R3T56rvoFjP3h4G4proJQJYE1m6ymWE18J
 01VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744844534; x=1745449334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NqTe+Ty3z3+ddmQAyRlIGIeZpUBjytRKMYY9HBbylrw=;
 b=GYhBZCfWrAYNlkjgHajOs8Y+ZjVyTxpvduLNQIPu17TfVYQOUiT4re39mf6NK80owt
 hwK8ULJqVLKnM6VUt0YNMopmuu4fHvTZTVP+fqOZRcWEYLWawslyKxY6DmK0B9asLhrm
 WuM9L7x3bYPjHfQwAd1oAwG3jQ2ZOz9q+HCMOQez3GRXU+vVBxGuawA6nvg7HRv8v6ob
 iO8g1f03oCeCMr7bbEzZ0CAKClAMfKdKVpZhpvL3v9LFuQZkNwn9EwIW6F7k9/eYqnlH
 uu6NJ/cniog3KzAXpfASVXJDgC+5KeBT+uKrh/ToLqhTCKlQmoml9QjNnTRg25eUhLyB
 hFtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTYVjSJzj5QF6DywmnrySI94UPLIG8eZjQWlcKDtqFLjqYrsudKHv/V7HGkloYIjMvuRai3NZUDVqW@lists.freedesktop.org,
 AJvYcCXFDdUFkh8iCZVA33tFMHMd6tvfhw2kJdrMtT7aPH/qC05U0FEutYK49LlrQ8OaLl+f7EiT1wEb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGXYaSFf9aVW4wQA9ou/ZOgR7tW9u/FrUQD0PmGeW4Zsc9TkWa
 VmVyF3qfrMsfoaGUL9a4PVlM5oGEHEJpVzUUzYIGZLJCwdFQTKZf8jtRwDoFHbiQ7JH3LsAUAii
 mEckYQnqhGKzri89wgoAf3WVT5D0=
X-Gm-Gg: ASbGncsNt9QUu5H666Iod65pdaS9U2Q9u5mpL9qN0AEWPWzwn1EqUrtk3AT6i46hWne
 2S4aujxuVvELLK/kr2f8QlOIpqX+AMkUJbpYwwnX9JvtVtHJqKwnwUn8yKOmoHGOf2TUnsrTb5c
 jW6SIMGNc0x45ocFY++d5wX78uPw6Mq3vc
X-Google-Smtp-Source: AGHT+IHaS1bY31CQcgrxhxR+ofsJjVnuVFQYhCiG9dkrzbmwmtfrPhBROuBFGksgadbGj5vQeORbSzp7QnfZYRRVwDc=
X-Received: by 2002:a17:902:d2cb:b0:22c:336f:cb5c with SMTP id
 d9443c01a7336-22c41200358mr5210055ad.6.1744844533623; Wed, 16 Apr 2025
 16:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250415115601.3238-1-vulab@iscas.ac.cn>
In-Reply-To: <20250415115601.3238-1-vulab@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Apr 2025 19:02:02 -0400
X-Gm-Features: ATxdqUE6UyN97V93fs49qKRwAvpsbbW-l0GWDGUMvi0e8zP-zEuL0dwIz0J5DKo
Message-ID: <CADnq5_N05vb5awWxfGzHJ4yBCE-89feKfmkOY96+6b38=R4Daw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/powerplay/smumgr/vegam_smumgr: Fix error
 handling in vegam_populate_smc_boot_level()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: kenneth.feng@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Tue, Apr 15, 2025 at 8:33=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> In vegam_populate_smc_boot_level(), the return value of
> phm_find_boot_level() is 0 or negative error code and the
> "if (result)" branch statement will never run into the true
> branch. Besides, this will skip setting the voltages later
> below. Returning early may break working devices.
>
> Add an error handling to phm_find_boot_level() to reset the
> boot level when the function fails. A proper implementation
> can be found in tonga_populate_smc_boot_level().
>
> Fixes: 4a1132782200 ("drm/amd/powerplay: return errno code to caller when=
 error occur")
> Cc: stable@vger.kernel.org # v5.6+

I don't know that this is a fix per se so I don't think stable is appropria=
te.

This is probably ok, but TBH, I don't really remember how the pptables
were set up on these old chips and whether changing the current
behavior would actually fix or break anything.  I'd be more inclined
to just leave the logic as is lest something break.

> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  .../drm/amd/pm/powerplay/smumgr/vegam_smumgr.c    | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c b/dri=
vers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> index 34c9f59b889a..c68dd12b858a 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> @@ -1374,15 +1374,20 @@ static int vegam_populate_smc_boot_level(struct p=
p_hwmgr *hwmgr,
>         result =3D phm_find_boot_level(&(data->dpm_table.sclk_table),
>                         data->vbios_boot_state.sclk_bootup_value,
>                         (uint32_t *)&(table->GraphicsBootLevel));
> -       if (result)
> -               return result;
> +       if (result !=3D 0) {
> +               table->GraphicsBootLevel =3D 0;
> +               pr_err("VBIOS did not find boot engine clock value in dep=
endency table. Using Graphics DPM level 0!\n");
> +               result =3D 0;
> +       }
>
>         result =3D phm_find_boot_level(&(data->dpm_table.mclk_table),
>                         data->vbios_boot_state.mclk_bootup_value,
>                         (uint32_t *)&(table->MemoryBootLevel));
> -
> -       if (result)
> -               return result;
> +       if (result !=3D 0) {
> +               table->MemoryBootLevel =3D 0;
> +               pr_err("VBIOS did not find boot engine clock value in dep=
endency table. Using Memory DPM level 0!\n");
> +               result =3D 0;
> +       }
>
>         table->BootVddc  =3D data->vbios_boot_state.vddc_bootup_value *
>                         VOLTAGE_SCALE;
> --
> 2.42.0.windows.2
>
