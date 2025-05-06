Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C847AAC8FB
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4C210E6D8;
	Tue,  6 May 2025 15:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BWex706O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1033F10E6CB;
 Tue,  6 May 2025 15:01:11 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-30a8c177f39so79732a91.3; 
 Tue, 06 May 2025 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746543670; x=1747148470; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5mOdQp0wsCHU79iCTDRAUvjMOiTe90lfOsmNG4A4mz4=;
 b=BWex706Oy3YeDa9ZuP6lfTm9Oo2UiuyVRFh3S5zGJnS6VTJz1ekIyfXdq0PniFktLA
 VYJ/ot4VO7or9mQyZTbAm6NP1ZQO+4I2j1YmyStDEjy+yzOj0yYhSiuEHosE3pFSkmkx
 Xq85WWaFiRmB8P1H/q5N/Idu1nl2PNfyFqVoizkuz7I6HJpSd8wz+jXllVheGqKYSDGz
 Mvn5Hzpk7H9E2o9wkgeiWQ4DC/+nQ9DJfUt1VA5VY29xEKf4Z2s55+m6QwUIoHjRuoTt
 O2m+BBhcc6f8PrB2kIo/IgU+k/0rfcfiHGQz6acA4GOLWkDR+lwAPejXDwmtXbtXaRq4
 xdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746543670; x=1747148470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5mOdQp0wsCHU79iCTDRAUvjMOiTe90lfOsmNG4A4mz4=;
 b=o/V2koIs3Hzd6BChCS7UE8gdxv4u+MwNXLJK1a20PjIhw4ncT/2J9rQhcCPZafprLD
 Leoe23XUIG4jeGWr+YLiWsQCVwYW7O4rSHV0dHaUGSVeInYlGy64U6Ve2o0rpcvYL8sc
 SxIp0JYEkLbDrRYTZk+94AQJEzbdcKxdhQQSY6dIB4GAYXkl1tTSSc8E0jP1ToIcNCBj
 MbsA4CPeJCf/XsB5zRSGBCdJ3b5bt4Fx0hTcZ+8jsxHVEB4MEeRXB1qHcmW+erLqGNd4
 Bu5449a/Pkl8hKeh8O/lb76ZkfRTOPKGHlAtckFwzU/eW4b7rgmiKQm9M9JlgkRJW9H/
 Np1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7pZwvHneEt+9cXYH3JJO//XMMp2CBKeQt710PLqdRGRdzFB2m6TEhXR41XTuWpRmPDWQZzHUm/6V3@lists.freedesktop.org,
 AJvYcCX+ixNurl3f16nEam9UtpFjGpc9dk47e5UndPUVWd4D8m2o0h5t8Bx46PfdAaBqAXJLfSgCWLsj@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/HABAVYOHG3mDDiwWXyif+Q9G4BqgIPKIL3bmwPIoPln3tBO8
 BMTMOFeXh6s3lSidQSqvqVaC7TZsOyVltWeW8fT7kPwO9sN3pRhe523ThdWjGiZnCYLPJKMO4FR
 byUmjUxODDHpLqKJb0wWX+6j/yo0=
X-Gm-Gg: ASbGncvpSJrfT4Y9KFbaM5ZfqkFlBUyP8BK0JgdR2VrCxoHdxxV++GSJc1H0PlwtwP8
 rg8K2s8MGtna1xNHliYbF3lt0HpV9h3+h1NeGTAwt9qfU944P1Yfe3Nw3GUwBpLMDv/0my0WgUO
 HnTWjutrRjq/xfK/Gt0ESQvA==
X-Google-Smtp-Source: AGHT+IFVzRQ9UHQ5cn2Pxm1YIqwU9Dn3xpyopqomdm4pOWuYp9SjbtmmdN+nT7CoJWYPnkxPUGfHaPfCYdcX8LUAgv0=
X-Received: by 2002:a17:90b:3006:b0:30a:80bc:ad5 with SMTP id
 98e67ed59e1d1-30a80bc0ba4mr1160943a91.3.1746543670240; Tue, 06 May 2025
 08:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250505231320.2695319-1-sashal@kernel.org>
 <20250505231320.2695319-90-sashal@kernel.org>
In-Reply-To: <20250505231320.2695319-90-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 May 2025 11:00:58 -0400
X-Gm-Features: ATxdqUGnQpDdB6_AHelJ7NBXUmErUFKTDHQ2k01aYe9xnBMqKDQqW4AzW3PlTMY
Message-ID: <CADnq5_NhYbp2SMivbG2pvB8oZNie5LBxS_ME5nMofX-2syQHrw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.15 090/153] drm/amd/display: fix dcn4x init
 failed
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Charlene Liu <Charlene.Liu@amd.com>, Alvin Lee <alvin.lee2@amd.com>, 
 Zaeem Mohamed <zaeem.mohamed@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 hamzamahfooz@linux.microsoft.com, Daniel.Sa@amd.com, alex.hung@amd.com, 
 rostrows@amd.com, Wayne.Lin@amd.com, Syed.Hassan@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Mon, May 5, 2025 at 7:16=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> From: Charlene Liu <Charlene.Liu@amd.com>
>
> [ Upstream commit 23ef388a84c72b0614a6c10f866ffeac7e807719 ]
>
> [why]
> failed due to cmdtable not created.
> switch atombios cmdtable as default.
>
> Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
> Signed-off-by: Charlene Liu <Charlene.Liu@amd.com>
> Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
> Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Support for DCN 4 was added in 6.11 I think so there is no need to
backport DCN 4.x fixes to kernels older than 6.11.

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/bios/command_table2.c     | 9 ---------
>  .../gpu/drm/amd/display/dc/bios/command_table_helper2.c  | 3 +--
>  2 files changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c b/drive=
rs/gpu/drm/amd/display/dc/bios/command_table2.c
> index f1f672a997d7d..d822cc948bdf2 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
> @@ -103,7 +103,6 @@ static void init_dig_encoder_control(struct bios_pars=
er *bp)
>                 bp->cmd_tbl.dig_encoder_control =3D encoder_control_digx_=
v1_5;
>                 break;
>         default:
> -               dm_output_to_console("Don't have dig_encoder_control for =
v%d\n", version);
>                 bp->cmd_tbl.dig_encoder_control =3D encoder_control_fallb=
ack;
>                 break;
>         }
> @@ -241,7 +240,6 @@ static void init_transmitter_control(struct bios_pars=
er *bp)
>                 bp->cmd_tbl.transmitter_control =3D transmitter_control_v=
1_7;
>                 break;
>         default:
> -               dm_output_to_console("Don't have transmitter_control for =
v%d\n", crev);
>                 bp->cmd_tbl.transmitter_control =3D transmitter_control_f=
allback;
>                 break;
>         }
> @@ -409,8 +407,6 @@ static void init_set_pixel_clock(struct bios_parser *=
bp)
>                 bp->cmd_tbl.set_pixel_clock =3D set_pixel_clock_v7;
>                 break;
>         default:
> -               dm_output_to_console("Don't have set_pixel_clock for v%d\=
n",
> -                        BIOS_CMD_TABLE_PARA_REVISION(setpixelclock));
>                 bp->cmd_tbl.set_pixel_clock =3D set_pixel_clock_fallback;
>                 break;
>         }
> @@ -557,7 +553,6 @@ static void init_set_crtc_timing(struct bios_parser *=
bp)
>                         set_crtc_using_dtd_timing_v3;
>                 break;
>         default:
> -               dm_output_to_console("Don't have set_crtc_timing for v%d\=
n", dtd_version);
>                 bp->cmd_tbl.set_crtc_timing =3D NULL;
>                 break;
>         }
> @@ -674,8 +669,6 @@ static void init_enable_crtc(struct bios_parser *bp)
>                 bp->cmd_tbl.enable_crtc =3D enable_crtc_v1;
>                 break;
>         default:
> -               dm_output_to_console("Don't have enable_crtc for v%d\n",
> -                        BIOS_CMD_TABLE_PARA_REVISION(enablecrtc));
>                 bp->cmd_tbl.enable_crtc =3D NULL;
>                 break;
>         }
> @@ -869,8 +862,6 @@ static void init_set_dce_clock(struct bios_parser *bp=
)
>                 bp->cmd_tbl.set_dce_clock =3D set_dce_clock_v2_1;
>                 break;
>         default:
> -               dm_output_to_console("Don't have set_dce_clock for v%d\n"=
,
> -                        BIOS_CMD_TABLE_PARA_REVISION(setdceclock));
>                 bp->cmd_tbl.set_dce_clock =3D NULL;
>                 break;
>         }
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c =
b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
> index cb3fd44cb1edf..e0231660f69da 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
> @@ -79,8 +79,7 @@ bool dal_bios_parser_init_cmd_tbl_helper2(
>                 return true;
>  #endif
>         default:
> -               /* Unsupported DCE */
> -               BREAK_TO_DEBUGGER();
> +               *h =3D dal_cmd_tbl_helper_dce112_get_table2();
>                 return false;
>         }
>  }
> --
> 2.39.5
>
