Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7119284B833
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 15:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB261126B7;
	Tue,  6 Feb 2024 14:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZLdgQ+ET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240C710EC6D;
 Tue,  6 Feb 2024 14:44:53 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-2196dd318feso1818678fac.2; 
 Tue, 06 Feb 2024 06:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707230692; x=1707835492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+20KhE5CzGghzyw+yh5TsIxVW9/ObxNGsBkKGzjlNGA=;
 b=ZLdgQ+ETP0DazhO/Ouap7iOYbYSDodbMfgLhvE2D1xDUeJJ1EZtGHUBmVf3aSsHS4G
 BnsJE38f9uEShW3jsFF4n0f2Ggy8ztxCaLRvvvLV0VYlVzQbVhkmshp2CYT7w+1xkdxn
 QCei658AOdiIkyAt2vn/I8RIybrcf8fqNd/gOkmq0UpetIp27dtXeg3Qm6YZAPCCDb5n
 hIAIu5N8xW57ksUS5YW57rGAR/fAChqcyshyDvwjTkO+c7nikLRM/8i9tOV37SO7npg2
 +9XbLw+8n2ID7e4Mja4g6Bcp0pK5qyTWqeFQmL1Rd+iD0wY4WAZ1gJn1L3PYlgU4+85m
 /6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707230692; x=1707835492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+20KhE5CzGghzyw+yh5TsIxVW9/ObxNGsBkKGzjlNGA=;
 b=gcx5rBbT5ckWkXGCW3pD3Imr7eHyUK2f85YeveRgaFIA78zzBFFobaPWTyVxv7zPC5
 5rxp3NKqryktYQYWCT4tdEWaiLLEfIdJ7rBr43nUp7J/qnuuxkjEjJxq9ueyo4zK3zPn
 ldiQMLkLPZFgI/qYY1d+dX6BTv66KtNaLEcvnb9JWzYxbhBAqBFQOfZhHI6wCrZgI0mo
 DritsYERwI62Vc/bHq074beXVXSXAhqDcbb2QZuJdC9aE62NeW7LT1VAV27DpBnnBxY0
 BKVyLD8mnzUgsNCZUa1mAPq/u1I7kDSLSdWIzY/0baxAtT/uF9AsA22T9WzEThIi/ufJ
 bs7Q==
X-Gm-Message-State: AOJu0Yw3eLqZcIQHxSH5GkZ33CYDWxNqH5CxOFL/JyRSl8VF25YK6g9K
 ISdAf5/GvNu2ZKoB1h5Aql7zk1CEyM7X9xxA2895n+JBeq97UZbGnOUCRIQugqfLNAMYFZ8yElr
 Xi49GyxaFqbu/OEVvNyxuF0Hk+SY=
X-Google-Smtp-Source: AGHT+IF0WZWM6Ib5EqucHZaEu5uV8FtMlbuTK8HqLl2KoroGz2pfdLgomL1X+7K8CnT8yIn7ZCEgAcp+W+dbQdJdLrU=
X-Received: by 2002:a05:6870:638c:b0:219:3d70:97b9 with SMTP id
 t12-20020a056870638c00b002193d7097b9mr3072489oap.37.1707230692108; Tue, 06
 Feb 2024 06:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20240205-amdgpu-raise-flt-for-dml-vba-files-v1-1-9bc8c8b98fb4@kernel.org>
In-Reply-To: <20240205-amdgpu-raise-flt-for-dml-vba-files-v1-1-9bc8c8b98fb4@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Feb 2024 09:44:40 -0500
Message-ID: <CADnq5_OZq2s2wcLcMccMuk2Vrk2dzYu9uQdfM3hbzciB_AWbMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Increase frame-larger-than for all
 display_mode_vba files
To: Nathan Chancellor <nathan@kernel.org>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 morbo@google.com, justinstitt@google.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, stable@vger.kernel.org
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

Applied.  Thanks!

On Mon, Feb 5, 2024 at 5:08=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> After a recent change in LLVM, allmodconfig (which has CONFIG_KCSAN=3Dy
> and CONFIG_WERROR=3Dy enabled) has a few new instances of
> -Wframe-larger-than for the mode support and system configuration
> functions:
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: error: stack frame size (2144) exceeds limit (2048) in 'dml20v2=
_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>    3393 | void dml20v2_ModeSupportAndSystemConfigurationFull(struct displ=
ay_mode_lib *mode_lib)
>         |      ^
>   1 error generated.
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3520:6: error: stack frame size (2192) exceeds limit (2048) in 'dml21_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>    3520 | void dml21_ModeSupportAndSystemConfigurationFull(struct display=
_mode_lib *mode_lib)
>         |      ^
>   1 error generated.
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: error: stack frame size (2128) exceeds limit (2048) in 'dml20_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>    3286 | void dml20_ModeSupportAndSystemConfigurationFull(struct display=
_mode_lib *mode_lib)
>         |      ^
>   1 error generated.
>
> Without the sanitizers enabled, there are no warnings.
>
> This was the catalyst for commit 6740ec97bcdb ("drm/amd/display:
> Increase frame warning limit with KASAN or KCSAN in dml2") and that same
> change was made to dml in commit 5b750b22530f ("drm/amd/display:
> Increase frame warning limit with KASAN or KCSAN in dml") but the
> frame_warn_flag variable was not applied to all files. Do so now to
> clear up the warnings and make all these files consistent.
>
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issue/1990
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/dr=
m/amd/display/dc/dml/Makefile
> index 6042a5a6a44f..59ade76ffb18 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -72,11 +72,11 @@ CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o :=3D $=
(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_vba.o :=3D $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn10/dcn10_fpu.o :=3D $(dml_ccflags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/dcn20_fpu.o :=3D $(dml_ccflags)
> -CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o :=3D $(dml_ccfla=
gs)
> +CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o :=3D $(dml_ccfla=
gs) $(frame_warn_flag)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o :=3D $(dml_cc=
flags)
> -CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o :=3D $(dml_ccf=
lags)
> +CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o :=3D $(dml_ccf=
lags) $(frame_warn_flag)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o :=3D $(dml_=
ccflags)
> -CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o :=3D $(dml_ccfla=
gs)
> +CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o :=3D $(dml_ccfla=
gs) $(frame_warn_flag)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o :=3D $(dml_cc=
flags)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o :=3D $(dml_ccfla=
gs) $(frame_warn_flag)
>  CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o :=3D $(dml_cc=
flags)
>
> ---
> base-commit: 6813cdca4ab94a238f8eb0cef3d3f3fcbdfb0ee0
> change-id: 20240205-amdgpu-raise-flt-for-dml-vba-files-ee5b5a9c5e43
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
