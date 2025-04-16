Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173ECA90F1B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 01:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5857110E9DE;
	Wed, 16 Apr 2025 23:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QPWyAUv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B9210E9DC;
 Wed, 16 Apr 2025 23:03:41 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ff6b9a7f91so12293a91.3; 
 Wed, 16 Apr 2025 16:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744844621; x=1745449421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Ostym3POn+tDwNxEX6WFaI9UEXuL1OpvkJqy+12mMU=;
 b=QPWyAUv6eChZo6paN6cU1uxGjhyFWkuekaEkVZg5dyp8bhx9SsX/Eaj1lxKEP6AMWQ
 UpzUyyAn/oJP+/n8YTW7KiBP1eEwe/hGiOc898ennyOvqwLd79pmiB4Jk2ATZnzPfl/G
 tvJcYD+KHNb2sMbraYghQQymHkLk93QBLhya70f36XwmoniXbMBJwN/3Q9TYXsRPWmxZ
 Vgyw58Ud/yyRUvRG3QuYDFtUfamgHccnJ2IMp3tDkyQKBLaN8jN9TUY1VrDkv4OX3glp
 SKMB+2pKGhVzsBG7UY6IbLRSt3GRHpHadoIUCwD5Sd8bTQVn2GPDhwUn6AyhdgvBjfT0
 NXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744844621; x=1745449421;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Ostym3POn+tDwNxEX6WFaI9UEXuL1OpvkJqy+12mMU=;
 b=DAZAwmW8SyLfxZQVCySQWz8Tlo9txI/qvsVGK8N7zPnPKAyUaDx185ttlTZVIW18PC
 ygDUyUyEm0H27yeliULeaOcP7BoqOtovDQpL9SMGDR9IKWLoBbBScfvjSdNzKaMdjnc7
 qD1qOmSNCmgdZEokvtUAexgkFbxVsij599oN4oCw4fGRQd9ffFJ6/yZp4iUbKc3c0whZ
 cC/SNEAuyN4CF92upJQP6988PSWFuPJHATt5soX+xFpX5fzlms7jSGdM7T/oBwVFK287
 AQCyNhzr5H+Gv7FpnQLPL20VADree/c/2CmdrgoA49fERZBBsFVewspadMgMdymAOOxH
 /9hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5LWr9H6OAh33S2nN0Q/rOcsacsSmaGNpHIcRjLKvF1A97+SFZvkVPVfxIvhTjx/ng62mFbmGJ@lists.freedesktop.org,
 AJvYcCWAMPfuyshCJ+mZ62rlxBizSYVUopE/aJK6EiGJZ11pJdZZbMU+dLV/7lEB7i9HjHXAEfXek8QRbUQk@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+cB2r7jEA11/zZxjE6nn0zg4dbJHk1Dq5ysvnsnRxMT9qBMnW
 +f0kHP3ERPCHfvj3+NZugEmM46cHyXz9wR/8/3zN9aKsr/w6lg6Eqp5XrRN8tEIuA5i5e6swbSY
 eELsaGNoFf9gt3at/J6mQm1s+EvI=
X-Gm-Gg: ASbGnct5tfduzDW930Jx57IlzRtPnCO/HkEJiYv5TlaTpQHA16euedSXNI/SN+BqPHi
 DNmmG+1ULFWOxnyZhgyp+IhxglYBV7mz2WxGW1telTZZ2MsCAepyeoyeibrI7PTIk5FO7eSv+Cs
 ZAS277ga1tIeYinm8TOHYVVQ==
X-Google-Smtp-Source: AGHT+IGOa4ocvRVCkDGhjbMq5SnR6XGbXrF8fWNqy1Gcvl7Bod2DV/rnRUCjS0bbLl2ieDH4Z8PBfpXOigf0ACktqxw=
X-Received: by 2002:a17:90b:4d10:b0:301:ba2b:3bc6 with SMTP id
 98e67ed59e1d1-3086eff2e34mr352727a91.7.1744844620624; Wed, 16 Apr 2025
 16:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250415100813.3071-1-vulab@iscas.ac.cn>
In-Reply-To: <20250415100813.3071-1-vulab@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Apr 2025 19:03:28 -0400
X-Gm-Features: ATxdqUEd4OqKI8joWPatylhXv_zR-usWlc3-Ve2lxUTvKTVa6YjnRqrkdZVOOlE
Message-ID: <CADnq5_NiW9EmhEDCC1R=g7Q+DjjRxQGmQv6rLPk_9RZo3O=pfw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/pm/powerplay/smumgr/fiji_smumgr: Add error
 check in fiji_populate_smc_boot_level()
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

On Tue, Apr 15, 2025 at 6:23=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> The return value of fiji_populate_smc_boot_level() is needs to be checked=
.
> An error handling is also needed to phm_find_boot_level() to reset the
> boot level when the function fails. A proper implementation can be found
> in tonga_populate_smc_boot_level().
>
> Fixes: dcaf3483ae46 ("drm/amd/pm/powerplay/smumgr/fiji_smumgr: Remove unu=
sed variable 'result'")
> Cc: stable@vger.kernel.org # v5.11+

I don't know that this is a fix per se so I don't think stable is appropria=
te.

This is probably ok, but TBH, I don't really remember how the pptables
were set up on these old chips and whether changing the current
behavior would actually fix or break anything.  I'd be more inclined
to just leave the logic as is lest something break.


> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> v2: Fix error code.
>
>  .../drm/amd/pm/powerplay/smumgr/fiji_smumgr.c | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> index 5e43ad2b2956..78ba22f249b2 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> @@ -1600,19 +1600,30 @@ static int fiji_populate_smc_uvd_level(struct pp_=
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
> +       if (result !=3D 0) {
> +               table->GraphicsBootLevel =3D 0;
> +               pr_err("VBIOS did not find boot engine clock value in dep=
endency table. Using Graphics DPM level 0!\n");
> +               result =3D 0;
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
