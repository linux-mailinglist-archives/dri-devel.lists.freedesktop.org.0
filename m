Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBA2AAFC5C
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 16:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD5A10E3BC;
	Thu,  8 May 2025 14:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oj/rk4dd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8027C10E3A2;
 Thu,  8 May 2025 14:06:05 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-30ab2041731so103907a91.2; 
 Thu, 08 May 2025 07:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746713165; x=1747317965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gbQp/KRC0IVxT/kMtQ7giIE+KOgEDHeh2E2/AS8vuiU=;
 b=Oj/rk4ddNzUVP7JHTZrtkAMjUQx860ZYYAo5pUpgLwQw5Ku9t8w3vVWjWhFZBRYFkb
 aQMDPCK6siItU++1mwxsH4CWUwWDvJex++bt8LOc6u5M1Nn1A9tGXRRIRjsMMCMHpIIy
 sGPVA7HAZCyM3YVXHOiN5G1jNlunFytD21OaJU9bL8uS6ciS4rDrf6U73qQWTFtNo+JP
 V54GpPu7uOvu1p8rVBWOpqlhCSB0gX4QiHXZQbDAuEyEZMQPwiB/rIR8z2fUj+WOKbZl
 ZLGQ9Aqrxj7BPEh075SHsZelU6Dsn9OIXQSZpHhTG4egBA8CJYPOZdYfSV07dqT4A1s8
 r6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746713165; x=1747317965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gbQp/KRC0IVxT/kMtQ7giIE+KOgEDHeh2E2/AS8vuiU=;
 b=Dkp0RVkaGUGf31EDB+rr/SDjgTmPqMgIN6lUB6mwD6IOZY16qb2FUd0mPp9T0e0lGX
 R6jKg9ZiYiA3kSxkpM7KUogmXlKqNpURs18GPjaqbvvtBLE7GrFABEE8+tVZYmgxeVSA
 ngU3roEo3WqB2OP+Ca5xmBIVZ+zW0vVmWb/jPKepURBjQ4HYhtdJqeD9PWbCAOSDNG5i
 o49eG48t/o9SJ3E23IXQXMcnRLkqh1hWHjKyzBMpUswFvalnD49t/W2qgOPAqHZSWwMg
 8U2Yyvomeku/PU+4YUd8Vob19frLCQgRyw/Yd6qpgB/wrR5ZqVD7xLLUeBxlAOJqTiF6
 pQwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHDmjfNVx/KxjyTUEYZgdHbwR16vgOgANY1SgovnWXk022vGRSGU4QqRAGycYsmc6a38tvrVbcMHAB@lists.freedesktop.org,
 AJvYcCXc9XU4FSfNHCK/JwcerDRT41hE3awBoXXtt6r52mYSb2U5iyhxXMo1UeTJM0D98wEvuwPvxetK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJZLPBddAdvZ0Wvc5DWq+U5JkplWLWnVDfSSCjZGAthuo15Ym4
 Lok0ZaAOYxXdw4hCIQt5pnsrHLlcPy9BlCScgD5atLYumanB+ljOAzviGuShtunRUs1IuXJWlDY
 FZPE+Y5582m5jNlNJp4/zxJZt9qs=
X-Gm-Gg: ASbGnctppmdbtDCuqqDWCJWKjkAdfYh96/GUC+cgpLeBl8yQbo5mXmFGaFrSr3q7HGs
 lA7O6a5oHVaPT4M+ZWgk+hE17PooM1E9Ag7eu1ydc7HUcApShyS+//tuJXw12ryStTN47Ro05Ul
 6zMjdyi7SFoXIpn/Tfrv2/oQ==
X-Google-Smtp-Source: AGHT+IGnr+cgq2Nv3N9dRmyYwyiKtfSfrJghMTozRQm1mqT1rvXG/VKf59MwbXQ5c7kmHlluu/KqkKJwEor2ehAS/rk=
X-Received: by 2002:a17:90b:4b44:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-30aac08d4c1mr4431232a91.0.1746713164717; Thu, 08 May 2025
 07:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250507170145.102508-1-linux@treblig.org>
 <20250507170145.102508-4-linux@treblig.org>
In-Reply-To: <20250507170145.102508-4-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 May 2025 10:05:51 -0400
X-Gm-Features: ATxdqUGsmBFMkRdl1HtB8ik5UvnObs3HpdZj2YMdIn6cJ4Zxd8j9SvDJlce_bYk
Message-ID: <CADnq5_M85g5rKvQqLvFqvTW0Lr0FBADfLev6aL3irZ58ibYfaQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amd/pm: Remove remainder of mode2_reset_is_support
To: linux@treblig.org
Cc: alexander.deucher@amd.com, kenneth.feng@amd.com, christian.koenig@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Applied the series.

Thanks!

Alex

On Wed, May 7, 2025 at 1:13=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> The previous patch removed smu_mode2_reset_is_support()
> which was the only function to call through the mode2_reset_is_support()
> method pointer.
>
> Remove the remaining functions that were assigned to it
> and the pointer itself.
>
> See discussion at:
> https://lore.kernel.org/all/DM4PR12MB5165D85BD85BC8FC8BF7A3B48E88A@DM4PR1=
2MB5165.namprd12.prod.outlook.com/
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h           | 4 ----
>  drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 6 ------
>  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c      | 6 ------
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c    | 6 ------
>  4 files changed, 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/=
drm/amd/pm/swsmu/inc/amdgpu_smu.h
> index a5ba37f57650..eb0a97dde71c 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> @@ -1229,10 +1229,6 @@ struct pptable_funcs {
>          * @mode1_reset_is_support: Check if GPU supports mode1 reset.
>          */
>         bool (*mode1_reset_is_support)(struct smu_context *smu);
> -       /**
> -        * @mode2_reset_is_support: Check if GPU supports mode2 reset.
> -        */
> -       bool (*mode2_reset_is_support)(struct smu_context *smu);
>
>         /**
>          * @mode1_reset: Perform mode1 reset.
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/dr=
ivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> index 19a25fdc2f5b..115e3fa456bc 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> @@ -3089,11 +3089,6 @@ static int sienna_cichlid_stb_get_data_direct(stru=
ct smu_context *smu,
>         return 0;
>  }
>
> -static bool sienna_cichlid_is_mode2_reset_supported(struct smu_context *=
smu)
> -{
> -       return true;
> -}
> -
>  static int sienna_cichlid_mode2_reset(struct smu_context *smu)
>  {
>         int ret =3D 0, index;
> @@ -3229,7 +3224,6 @@ static const struct pptable_funcs sienna_cichlid_pp=
t_funcs =3D {
>         .get_default_config_table_settings =3D sienna_cichlid_get_default=
_config_table_settings,
>         .set_config_table =3D sienna_cichlid_set_config_table,
>         .get_unique_id =3D sienna_cichlid_get_unique_id,
> -       .mode2_reset_is_support =3D sienna_cichlid_is_mode2_reset_support=
ed,
>         .mode2_reset =3D sienna_cichlid_mode2_reset,
>  };
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index 83163d7c7f00..38fbe0ddc4e6 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -1976,11 +1976,6 @@ static bool aldebaran_is_mode1_reset_supported(str=
uct smu_context *smu)
>         return true;
>  }
>
> -static bool aldebaran_is_mode2_reset_supported(struct smu_context *smu)
> -{
> -       return true;
> -}
> -
>  static int aldebaran_set_mp1_state(struct smu_context *smu,
>                                    enum pp_mp1_state mp1_state)
>  {
> @@ -2086,7 +2081,6 @@ static const struct pptable_funcs aldebaran_ppt_fun=
cs =3D {
>         .set_pp_feature_mask =3D smu_cmn_set_pp_feature_mask,
>         .get_gpu_metrics =3D aldebaran_get_gpu_metrics,
>         .mode1_reset_is_support =3D aldebaran_is_mode1_reset_supported,
> -       .mode2_reset_is_support =3D aldebaran_is_mode2_reset_supported,
>         .smu_handle_passthrough_sbr =3D aldebaran_smu_handle_passthrough_=
sbr,
>         .mode1_reset =3D aldebaran_mode1_reset,
>         .set_mp1_state =3D aldebaran_set_mp1_state,
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> index c478b3be37af..c529859c83ab 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> @@ -2849,11 +2849,6 @@ static bool smu_v13_0_6_is_mode1_reset_supported(s=
truct smu_context *smu)
>         return true;
>  }
>
> -static bool smu_v13_0_6_is_mode2_reset_supported(struct smu_context *smu=
)
> -{
> -       return true;
> -}
> -
>  static int smu_v13_0_6_smu_send_hbm_bad_page_num(struct smu_context *smu=
,
>                                                  uint32_t size)
>  {
> @@ -3586,7 +3581,6 @@ static const struct pptable_funcs smu_v13_0_6_ppt_f=
uncs =3D {
>         .get_pm_metrics =3D smu_v13_0_6_get_pm_metrics,
>         .get_thermal_temperature_range =3D smu_v13_0_6_get_thermal_temper=
ature_range,
>         .mode1_reset_is_support =3D smu_v13_0_6_is_mode1_reset_supported,
> -       .mode2_reset_is_support =3D smu_v13_0_6_is_mode2_reset_supported,
>         .mode1_reset =3D smu_v13_0_6_mode1_reset,
>         .mode2_reset =3D smu_v13_0_6_mode2_reset,
>         .wait_for_event =3D smu_v13_0_wait_for_event,
> --
> 2.49.0
>
