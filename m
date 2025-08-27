Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62808B38AAA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 22:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D6B10E8A4;
	Wed, 27 Aug 2025 20:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IQ38aJJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84E610E7C3;
 Wed, 27 Aug 2025 20:10:01 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b4716f9a467so47923a12.0; 
 Wed, 27 Aug 2025 13:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756325401; x=1756930201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYBM2f9U9GiBgSYToiFj9L4h5b6Q18XZmcp2l28ZRas=;
 b=IQ38aJJ5YaxlRvHYUl6lEPBniOBzcfaE8e/BuMypD8vCZ2LYq7U6MHcNSFbC4iEIKo
 /nx4xU3P2sNCh+xX/RMfxCi706sfjZEUjSBW+MgHGug0I+JkmQOYNeofr+qqRX1G++1E
 yDwWeDiMWgwpVGNHBuvtOYoEEfSUkHWDkwRpBdfmwT9/tYUNbWi4++ZshzET7qrrI09B
 Ft/7pV+QGVFWXqidZg8X5Tc20/kJxvt8DxcbeG2mHUdrLmOmGK1AJM3/V/GCPaKivLAv
 mDor0KXQIfKLCS/gkCiBGjeN54AmpwOZneAyZ8as+HmnJ6CEEIPSxpkuOh0hmbwRGbcQ
 u6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756325401; x=1756930201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EYBM2f9U9GiBgSYToiFj9L4h5b6Q18XZmcp2l28ZRas=;
 b=k48XiQ/AyCCbj37CuhPUpZnBHU1NAFMkHJTKBIMIrYCID0cFRbrq1GowvgwybAvBUT
 Gx4c2x/fF1znY6eIqsCmfZdxDIiaVOm13ab3CX8vUuxhpIEAdxZR6U9TSFlxw/6a/5K4
 rBxvd7tgbA9FTSRnEOkiE+pjJuUPwsxfEmf8QKY72l6SzpoAmKCBBdQziThOYgk00rq3
 RUixzELtjt0RiJJWdzF3h2jUh5C9DqIO0bzkUv6q1VxD+stb51sK84uKg8CPo5eGdRSg
 kVw8pEO2wzx2QrOtjAPsr04xt/NC5ZxiT6ZJaH+tuMnjjmUgMdOGVHQ6MsDfN2Xd0WDO
 WaEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZhMrWcjyxwxa4EpcoLxq3Wrmo/r8JEJaeqRB+nZ1061Gat1p0nj6/coQYLg//k5AO6c8RdxbF1j/t@lists.freedesktop.org,
 AJvYcCX5N7g9CzeQxGWHAI5Budy2Giu9ukr1b5xhrItsuAFgBxpEIbtE3wUgesFOJCXF0NR5ZNe4OW+K@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpio5APxHAow8JruSHYklSyQIoVWsYAHs6sqlPhlcmbx2Mj8AL
 e77pdFpeBVa/TfWmeQ+ZGeD2cu2zFMUaKBA0TuF3xyxLoriBELWvXw/s1gaD+ogcu1b0aQAVFAE
 5aVWDFHt1RgqECQb+tqTttiEsa1LJjls=
X-Gm-Gg: ASbGnctiv/5HaqI7kPmol0sznDMZ9qNBO6EDp2V9Rv9c5iEdBckaUixrzLpfTl5Wecc
 ftNLTgZ5GWoe8e+yQmyoPdzdWfoPFFAZr0wKaMuljgP8TIEdPClO0YBhIy2Z4dv7EVMjMqQu5Sg
 rU3Yvig7vSZRVzrS6vNi/zWgSdK+GjNwPrqfhB+EXe1fp3jN6sFjv2rSRm59M99+1GGA+nbJQCo
 3xHJQqq0H9Bb2QICTr+RkgHukuS
X-Google-Smtp-Source: AGHT+IEbq+6lkDTjWK76f7In5xwzdV49QDHRr25J+ov8rWTj6aOsscw+ZBST+cRz6IeuVdfxSzqD1Xggs25YE32c8QU=
X-Received: by 2002:a17:90b:3885:b0:327:76b9:3c74 with SMTP id
 98e67ed59e1d1-32776b93dc0mr2078732a91.4.1756325400952; Wed, 27 Aug 2025
 13:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250816142312.393795-1-rongqianfeng@vivo.com>
In-Reply-To: <20250816142312.393795-1-rongqianfeng@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 27 Aug 2025 16:09:48 -0400
X-Gm-Features: Ac12FXx-crJiXTcyPkTkIAvouGV7PEEydKhDClAWENY5AgHKQR8NdfQzNNvxSH4
Message-ID: <CADnq5_OCNrW8jtbfchsZcZAbVt5AOZaLuBOPCHGePxvpU_T0aA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: use max() to improve code
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Austin Zheng <austin.zheng@amd.com>, 
 Jun Lei <jun.lei@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>, 
 Ivan Lipski <ivan.lipski@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, 
 Clayton King <clayton.king@amd.com>, Sung Lee <Sung.Lee@amd.com>,
 Alex Hung <alex.hung@amd.com>, 
 Samson Tam <Samson.Tam@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 Karthi Kandasamy <karthi.kandasamy@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Rafal Ostrowski <rostrows@amd.com>, amd-gfx@lists.freedesktop.org, 
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

Applied.  Thanks!

Alex

On Sat, Aug 16, 2025 at 10:49=E2=80=AFAM Qianfeng Rong <rongqianfeng@vivo.c=
om> wrote:
>
> Use max() to reduce the code and improve readability.
>
> No functional changes.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  .../gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   | 7 ++-----
>  .../gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c | 6 +-----
>  .../amd/display/dc/dml2/dml21/dml21_translation_helper.c   | 6 +-----
>  3 files changed, 4 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c=
 b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> index 084994c650c4..8376e2b0e73d 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> @@ -1047,11 +1047,8 @@ static void dcn32_get_memclk_states_from_smu(struc=
t clk_mgr *clk_mgr_base)
>                         &num_entries_per_clk->num_fclk_levels);
>         clk_mgr_base->bw_params->dc_mode_limit.fclk_mhz =3D dcn30_smu_get=
_dc_mode_max_dpm_freq(clk_mgr, PPCLK_FCLK);
>
> -       if (num_entries_per_clk->num_memclk_levels >=3D num_entries_per_c=
lk->num_fclk_levels) {
> -               num_levels =3D num_entries_per_clk->num_memclk_levels;
> -       } else {
> -               num_levels =3D num_entries_per_clk->num_fclk_levels;
> -       }
> +       num_levels =3D max(num_entries_per_clk->num_memclk_levels, num_en=
tries_per_clk->num_fclk_levels);
> +
>         clk_mgr_base->bw_params->max_memclk_mhz =3D
>                         clk_mgr_base->bw_params->clk_table.entries[num_en=
tries_per_clk->num_memclk_levels - 1].memclk_mhz;
>         clk_mgr_base->bw_params->clk_table.num_entries =3D num_levels ? n=
um_levels : 1;
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr=
.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
> index b59703467128..47ff4c965d76 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
> @@ -1404,11 +1404,7 @@ static void dcn401_get_memclk_states_from_smu(stru=
ct clk_mgr *clk_mgr_base)
>                         clk_mgr_base->bw_params->clk_table.entries[num_en=
tries_per_clk->num_fclk_levels - 1].fclk_mhz)
>                 clk_mgr_base->bw_params->dc_mode_limit.fclk_mhz =3D 0;
>
> -       if (num_entries_per_clk->num_memclk_levels >=3D num_entries_per_c=
lk->num_fclk_levels) {
> -               num_levels =3D num_entries_per_clk->num_memclk_levels;
> -       } else {
> -               num_levels =3D num_entries_per_clk->num_fclk_levels;
> -       }
> +       num_levels =3D max(num_entries_per_clk->num_memclk_levels, num_en=
tries_per_clk->num_fclk_levels);
>
>         clk_mgr_base->bw_params->clk_table.num_entries =3D num_levels ? n=
um_levels : 1;
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_=
helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_help=
er.c
> index a06217a9eef6..21cc30f9b8a8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.=
c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.=
c
> @@ -463,11 +463,7 @@ static void populate_dml21_timing_config_from_stream=
_state(struct dml2_timing_cf
>                                 (stream->timing.h_total * (long long)calc=
_max_hardware_v_total(stream)));
>         }
>
> -       if (stream->timing.min_refresh_in_uhz > min_hardware_refresh_in_u=
hz) {
> -               timing->drr_config.min_refresh_uhz =3D stream->timing.min=
_refresh_in_uhz;
> -       } else {
> -               timing->drr_config.min_refresh_uhz =3D min_hardware_refre=
sh_in_uhz;
> -       }
> +       timing->drr_config.min_refresh_uhz =3D max(stream->timing.min_ref=
resh_in_uhz, min_hardware_refresh_in_uhz);
>
>         if (dml_ctx->config.callbacks.get_max_flickerless_instant_vtotal_=
increase &&
>                         stream->ctx->dc->config.enable_fpo_flicker_detect=
ion =3D=3D 1)
> --
> 2.34.1
>
