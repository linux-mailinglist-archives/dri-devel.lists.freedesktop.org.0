Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E939F87C7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 23:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F391B10E2A7;
	Thu, 19 Dec 2024 22:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uibj8Wux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCED510E2A7;
 Thu, 19 Dec 2024 22:21:53 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2ef79243680so182666a91.2; 
 Thu, 19 Dec 2024 14:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734646913; x=1735251713; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NpyOh9PEmR1wonp/zJLSpYnuM8i7MAUQCFZJqCoYXXM=;
 b=Uibj8WuxP/CSG9h0AeqG+6D4AV1tS/CdtwR/c0WQJobllFmmrq+TpkmSy9QkFDY8RA
 e9eKcz4WkZeFOHTHr7KiLKd9YFM/ULlqUCHOk3QGlp3zGS/BGlKbPkLa9sQkL+L8NL0g
 n1DA30xAbLNy6nbK/v77huQw20hPdDyYUTYYC3CEPERhD21qQ7e2BVNIuJcDGtOsFaDr
 KtFEjzIyhJV06FBavRkwKGg8rg/CRuXcJSARAAtRjhemGANiJZoD9qkym0p9nhaAufEY
 bVIlWEOENg8ezktpPnfWhhUA5EYt0Ru+foNi0xbGaCoAj3TOY1oBPTwURAJS7H/JU1l8
 JKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734646913; x=1735251713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NpyOh9PEmR1wonp/zJLSpYnuM8i7MAUQCFZJqCoYXXM=;
 b=ai/l+7sdyj3YHv6VSXJ0UsQJBMkkSBiN0LKKAUTT8gIeqCmMXfsby57hL8ogNETI6p
 lGAxIRbtAw2wt4ShtuiSlLWCs4RWw8/rDjceUiPtq+x3YqUZE7KdJ4pH+mOixIaIED2h
 eFoACEuS5RN5pMtTfRuDKhqeh1EAzgrS36pU3vttLMNxnIdKEO04a4trivrmVsW+Nm9N
 Jxu3C5mQh61Xq53xItEl4Ly38l2hQiYPhxtjzOyYk0qTb3yG5LWmJNVGZ09bmemODWRo
 9JOM/mXim83Hpp8UgYgB+9doVOtDB9FwoZJC+AGy0PFEt4k8jVM6zXanU89Wo7Wvts4s
 KcBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW675Eh6uH1yyC7tPJixcp13SOz8gUa6K6Eml3AhELS5Yg+mKm927ksIgHl6pGvMpdeeDFeO+Jh@lists.freedesktop.org,
 AJvYcCWDACJGm+c8qsRNIJDYzVIDXH0w/4MK5D7cH9VOko5Jch+IAmPsjAoIhsnxyWAZArzrIjFsRF48XuXx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnqHw74I6/+dIjWhbZRaEnCQBMHPzp7x+jrwenXO0OluXiKNd9
 4VZtLuJObR+lR7aTjSIJHuwruk29f5tTIyVgl0HiXpV3RCU/Uxb5aWJ/IKiciP8trkAAE5ObHbM
 TS9tlg1N1nYDmaYGOvDqXQ43jHy0=
X-Gm-Gg: ASbGncuqoi8xOD94xrTgfSVHckMWKaP6CRw+D/geWkrRlLY+WMJMeiBWvwGVPBQuJPl
 bfgl5YqS3GADWNbcaAumCF4gvz+1dBlXxrT10UA==
X-Google-Smtp-Source: AGHT+IHk1/grqd1ADN6czf24WSJdap3R17icA82+hUB2wW2bK6YBJXVkJO05KC5cWNVn1MLq+HhTM0botvc7FLL8ToU=
X-Received: by 2002:a17:90b:3d47:b0:2ee:3fa7:ef23 with SMTP id
 98e67ed59e1d1-2f452efbf6fmr357914a91.8.1734646913184; Thu, 19 Dec 2024
 14:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20241219-amdgpu-fix-enum-float-conversion-again-again-v1-1-ef2c619724b1@kernel.org>
In-Reply-To: <20241219-amdgpu-fix-enum-float-conversion-again-again-v1-1-ef2c619724b1@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Dec 2024 17:21:41 -0500
Message-ID: <CADnq5_NKWH7UC_ow825aAtF1tZXJTVOwDWaqDR8_4Y6EmPXUiA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Disable -Wenum-float-conversion for
 dml2_dpmm_dcn4.c
To: Nathan Chancellor <nathan@kernel.org>
Cc: Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Austin Zheng <Austin.Zheng@amd.com>, 
 Dillon Varone <dillon.varone@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev
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

On Thu, Dec 19, 2024 at 12:23=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Commit be4e3509314a ("drm/amd/display: DML21 Reintegration For Various
> Fixes") blew away commit fdedd77b0eb3 ("drm/amd/display: Reapply
> 2fde4fdddc1f"), which itself was a reapplication for the same reason,
> which results in that compiler warning returning:
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_=
dpmm_dcn4.c:215:58: error: arithmetic between enumeration type 'enum dentis=
t_divider_range' and floating-point type 'double' [-Werror,-Wenum-float-con=
version]
>     215 |         divider =3D (unsigned int)(DFS_DIVIDER_RANGE_SCALE_FACT=
OR * (vco_freq_khz / clock_khz));
>         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Just disable the warning for the whole file via Makefile to avoid having
> to reapply the same fix every time the code syncs from wherever it is
> actually maintained.
>
> Fixes: be4e3509314a ("drm/amd/display: DML21 Reintegration For Various Fi=
xes")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> If you would prefer reapplying the local fix, feel free to do so, but I
> would like for it to be in the upstream source so it does not have to
> keep being applied.

I've reapplied the original fix and I've confirmed that the fix will
be pushed to the DML tree as well this time.

Thanks,

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dml2/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/d=
rm/amd/display/dc/dml2/Makefile
> index d9c27ebe12ee08d6330eb199cd8ca9c8489fa5b2..5c0f93644c5d43c8a0bc12713=
fc400712d8de50b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> @@ -78,7 +78,7 @@ CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_to=
p_soc15.o :=3D $(dml2_ccfla
>  CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o :=3D $=
(dml2_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o =
:=3D $(dml2_ccflags) $(frame_warn_flag)
>  CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o :=
=3D $(dml2_ccflags)
> -CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o :=3D $=
(dml2_ccflags)
> +CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o :=3D $=
(dml2_ccflags) $(call cc-disable-warning,enum-float-conversion)
>  CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.o :=
=3D $(dml2_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o :=3D $(d=
ml2_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.o :=3D =
$(dml2_ccflags)
>
> ---
> base-commit: 695c2c745e5dff201b75da8a1d237ce403600d04
> change-id: 20241219-amdgpu-fix-enum-float-conversion-again-again-cbfd9159=
f76d
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
