Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ECE9B4B99
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 15:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4926E10E66B;
	Tue, 29 Oct 2024 14:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EP1Gg2yZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B99810E66B;
 Tue, 29 Oct 2024 14:00:10 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-71e710c5d0dso174280b3a.0; 
 Tue, 29 Oct 2024 07:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730210409; x=1730815209; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eRzQWzkzVI0fNiNgdZexP1F+fhwsUnCCzVqowPLugVQ=;
 b=EP1Gg2yZ682yVduMNb6CwnINDwy73HX+ZTV9biJdLliVFmXIDR76k8V0f5UbYEj8BY
 6JaMFO1x+h4S21WAPODjcYbav5tB5kytoNlqDiNuGe+6M37rhNFi7ZnJdwhANARZtvfP
 FpOGxwtYIPaETgVAYKwH/3wTx9/1hCB8h1CP9QCag9pBdRswuaFBu8pXIgcWx990+Pso
 2UXxPCDXy0trkO+if/yYMmsFpLNUVTINKkGoz2v4r/8Qi31cZ+TdQMMOoLSZkzJEQ03c
 84mXRntEZtr1nnfOlNEHI3xslGP8hQhv4yW/KBDGHHUGdh50PA2P0nipxPdtP6/6RBOI
 okTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730210409; x=1730815209;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRzQWzkzVI0fNiNgdZexP1F+fhwsUnCCzVqowPLugVQ=;
 b=gj5/NnxJOGxaetctcD/l6c/hGMpaLOYu20H95fwTdfiVwHS8iVug9gWaWCf+WRukqL
 JEj7/M6ntQZbBZI5M5AoYEU/4WqAekPj3gkVx68BN1etw7hBAJlR6UsgtIarxRsadiwl
 CfBcbEAj0xIRf10IywnIa2tUd8RiXBeRH4u4dLHhl9QoSzC5FmINfDTGWkMq8egQHJA+
 VyRmsl7hQZUG7qz7GawEGkEeW4KYc0QZaYOJhdvkJCkMzt4FNSnvF3RDAAmmbXd3bXTC
 q+lgdHMGoscfZjQ8IWHjeW3nY179OPzbViAob2a28s8fcKM1+ohjxpMDFXaL7sm3PirV
 Fvlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhYn2nK0XYS1t0IySawqf2XzcBvuUp7vz620SL3rRdwbgiSv2sbjT0QRQNkSc9r+GoIMWT7aXf@lists.freedesktop.org,
 AJvYcCXmDH+vcU72Xlmay4fwdsSo+zSJZo3EspeUTbi+AJS8Z+mF5ALdw+e0tYXAAlBKJtXDS8JU+0zu1aRk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjGNSYybAigvWp1szn0yFK8QFmKaGnJYoLAHmX2wl6MkMJ3qjS
 vh6IQf3NYvk/xp6jGvt9a8zcN0hiBXHtfVwTLVONRVz4ZziGzeG35Az6kBknyeM+YGHIi3nuIdY
 8TLEfjtTvT29Ry1rqgV5kpsNgexFPlw==
X-Google-Smtp-Source: AGHT+IF8EmYCCix2LYg3DJ33AP+Pal3sY4n0LMPNaS6LipuMpYMeomJ/gVgbaq7VmOk1rqHkC33kd8GQb9HNTWZ+GSk=
X-Received: by 2002:a05:6a00:4613:b0:71e:5132:da7b with SMTP id
 d2e1a72fcca58-72063004c28mr7327479b3a.3.1730210407492; Tue, 29 Oct 2024
 07:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241010205154.278023-1-linux@treblig.org>
In-Reply-To: <20241010205154.278023-1-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Oct 2024 09:59:56 -0400
Message-ID: <CADnq5_PP7zZ3-=4UmOc+eKyywo0oJKZw6BGV5+YbmFPnB0p7Mw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove last parts of timing_trace
To: linux@treblig.org
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
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

Applied.  Thanks!

Alex

On Thu, Oct 10, 2024 at 4:52=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> Commit c2c2ce1e9623 ("drm/amd/display: Optimize passive update planes.")
> removed the last caller of context_timing_trace.
> Remove it.
>
> With that gone, no one is now looking at the 'timing_trace' flag, remove
> it and all the places that set it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  .../gpu/drm/amd/display/dc/core/dc_debug.c    | 42 -------------------
>  drivers/gpu/drm/amd/display/dc/dc.h           |  1 -
>  .../dc/resource/dcn10/dcn10_resource.c        |  2 -
>  .../dc/resource/dcn20/dcn20_resource.c        |  1 -
>  .../dc/resource/dcn201/dcn201_resource.c      |  1 -
>  .../dc/resource/dcn21/dcn21_resource.c        |  1 -
>  .../dc/resource/dcn30/dcn30_resource.c        |  1 -
>  .../dc/resource/dcn301/dcn301_resource.c      |  1 -
>  .../dc/resource/dcn302/dcn302_resource.c      |  1 -
>  .../dc/resource/dcn303/dcn303_resource.c      |  1 -
>  .../dc/resource/dcn31/dcn31_resource.c        |  1 -
>  .../dc/resource/dcn314/dcn314_resource.c      |  1 -
>  .../dc/resource/dcn315/dcn315_resource.c      |  1 -
>  .../dc/resource/dcn316/dcn316_resource.c      |  1 -
>  .../dc/resource/dcn32/dcn32_resource.c        |  1 -
>  .../dc/resource/dcn321/dcn321_resource.c      |  1 -
>  .../dc/resource/dcn35/dcn35_resource.c        |  1 -
>  .../dc/resource/dcn351/dcn351_resource.c      |  1 -
>  .../dc/resource/dcn401/dcn401_resource.c      |  1 -
>  .../amd/display/include/logger_interface.h    |  4 --
>  20 files changed, 65 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c b/drivers/gpu=
/drm/amd/display/dc/core/dc_debug.c
> index 801cdbc8117d..0bb25c537243 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
> @@ -46,11 +46,6 @@
>                         DC_LOG_IF_TRACE(__VA_ARGS__); \
>  } while (0)
>
> -#define TIMING_TRACE(...) do {\
> -       if (dc->debug.timing_trace) \
> -               DC_LOG_SYNC(__VA_ARGS__); \
> -} while (0)
> -
>  #define CLOCK_TRACE(...) do {\
>         if (dc->debug.clock_trace) \
>                 DC_LOG_BANDWIDTH_CALCS(__VA_ARGS__); \
> @@ -306,43 +301,6 @@ void post_surface_trace(struct dc *dc)
>
>  }
>
> -void context_timing_trace(
> -               struct dc *dc,
> -               struct resource_context *res_ctx)
> -{
> -       int i;
> -       int h_pos[MAX_PIPES] =3D {0}, v_pos[MAX_PIPES] =3D {0};
> -       struct crtc_position position;
> -       unsigned int underlay_idx =3D dc->res_pool->underlay_pipe_index;
> -       DC_LOGGER_INIT(dc->ctx->logger);
> -
> -
> -       for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
> -               struct pipe_ctx *pipe_ctx =3D &res_ctx->pipe_ctx[i];
> -               /* get_position() returns CRTC vertical/horizontal counte=
r
> -                * hence not applicable for underlay pipe
> -                */
> -               if (pipe_ctx->stream =3D=3D NULL || pipe_ctx->pipe_idx =
=3D=3D underlay_idx)
> -                       continue;
> -
> -               pipe_ctx->stream_res.tg->funcs->get_position(pipe_ctx->st=
ream_res.tg, &position);
> -               h_pos[i] =3D position.horizontal_count;
> -               v_pos[i] =3D position.vertical_count;
> -       }
> -       for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
> -               struct pipe_ctx *pipe_ctx =3D &res_ctx->pipe_ctx[i];
> -
> -               if (pipe_ctx->stream =3D=3D NULL || pipe_ctx->pipe_idx =
=3D=3D underlay_idx)
> -                       continue;
> -
> -               TIMING_TRACE("OTG_%d   H_tot:%d  V_tot:%d   H_pos:%d  V_p=
os:%d\n",
> -                               pipe_ctx->stream_res.tg->inst,
> -                               pipe_ctx->stream->timing.h_total,
> -                               pipe_ctx->stream->timing.v_total,
> -                               h_pos[i], v_pos[i]);
> -       }
> -}
> -
>  void context_clock_trace(
>                 struct dc *dc,
>                 struct dc_state *context)
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/di=
splay/dc/dc.h
> index 3992ad73165b..eb00ee73a8f2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -862,7 +862,6 @@ struct dc_debug_options {
>         bool sanity_checks;
>         bool max_disp_clk;
>         bool surface_trace;
> -       bool timing_trace;
>         bool clock_trace;
>         bool validation_trace;
>         bool bandwidth_calcs_trace;
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
> index 563c5eec83ff..0098b3e72e85 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
> @@ -533,7 +533,6 @@ static const struct dc_debug_options debug_defaults_d=
rv =3D {
>                 .sanity_checks =3D true,
>                 .disable_dmcu =3D false,
>                 .force_abm_enable =3D false,
> -               .timing_trace =3D false,
>                 .clock_trace =3D true,
>
>                 /* raven smu dones't allow 0 disp clk,
> @@ -563,7 +562,6 @@ static const struct dc_debug_options debug_defaults_d=
rv =3D {
>  static const struct dc_debug_options debug_defaults_diags =3D {
>                 .disable_dmcu =3D false,
>                 .force_abm_enable =3D false,
> -               .timing_trace =3D true,
>                 .clock_trace =3D true,
>                 .disable_stutter =3D true,
>                 .disable_pplib_clock_request =3D true,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
> index eea2b3b307cd..46c38fd9288d 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
> @@ -706,7 +706,6 @@ static const struct resource_caps res_cap_nv14 =3D {
>  static const struct dc_debug_options debug_defaults_drv =3D {
>                 .disable_dmcu =3D false,
>                 .force_abm_enable =3D false,
> -               .timing_trace =3D false,
>                 .clock_trace =3D true,
>                 .disable_pplib_clock_request =3D true,
>                 .pipe_split_policy =3D MPC_SPLIT_AVOID_MULT_DISP,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c
> index fc54483b9104..5b87dfea62e4 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c
> @@ -600,7 +600,6 @@ static const struct dc_plane_cap plane_cap =3D {
>  static const struct dc_debug_options debug_defaults_drv =3D {
>                 .disable_dmcu =3D true,
>                 .force_abm_enable =3D false,
> -               .timing_trace =3D false,
>                 .clock_trace =3D true,
>                 .disable_pplib_clock_request =3D true,
>                 .pipe_split_policy =3D MPC_SPLIT_DYNAMIC,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
> index 347e6aaea582..135671d12c45 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
> @@ -610,7 +610,6 @@ static const struct dc_plane_cap plane_cap =3D {
>  static const struct dc_debug_options debug_defaults_drv =3D {
>                 .disable_dmcu =3D false,
>                 .force_abm_enable =3D false,
> -               .timing_trace =3D false,
>                 .clock_trace =3D true,
>                 .disable_pplib_clock_request =3D true,
>                 .min_disp_clk_khz =3D 100000,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
> index 5040a4c6ed18..28c4ad289e54 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
> @@ -711,7 +711,6 @@ static const struct dc_plane_cap plane_cap =3D {
>  static const struct dc_debug_options debug_defaults_drv =3D {
>         .disable_dmcu =3D true, //No DMCU on DCN30
>         .force_abm_enable =3D false,
> -       .timing_trace =3D false,
>         .clock_trace =3D true,
>         .disable_pplib_clock_request =3D true,
>         .pipe_split_policy =3D MPC_SPLIT_DYNAMIC,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
> index 7d04739c3ba1..b82a0559531a 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
> @@ -682,7 +682,6 @@ static const struct dc_plane_cap plane_cap =3D {
>  static const struct dc_debug_options debug_defaults_drv =3D {
>         .disable_dmcu =3D true,
>         .force_abm_enable =3D false,
> -       .timing_trace =3D false,
>         .clock_trace =3D true,
>         .disable_dpp_power_gate =3D false,
>         .disable_hubp_power_gate =3D false,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c
> index 5791b5cc2875..f272665aa6a8 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c
> @@ -81,7 +81,6 @@
>  static const struct dc_debug_options debug_defaults_drv =3D {
>                 .disable_dmcu =3D true,
>                 .force_abm_enable =3D false,
> -               .timing_trace =3D false,
>                 .clock_trace =3D true,
>                 .disable_pplib_clock_request =3D true,
>                 .pipe_split_policy =3D MPC_SPLIT_DYNAMIC,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c
> index 63f0f882c861..ee9bc725a30e 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c
> @@ -82,7 +82,6 @@
>  static const struct dc_debug_options debug_defaults_drv =3D {
>                 .disable_dmcu =3D true,
>                 .force_abm_enable =3D false,
> -               .timing_trace =3D false,
>                 .clock_trace =3D true,
>                 .disable_pplib_clock_request =3D true,
>                 .pipe_split_policy =3D MPC_SPLIT_AVOID,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
> index ac8cb20e2e3b..95213c7160c6 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
> @@ -858,7 +858,6 @@ static const struct dc_plane_cap plane_cap =3D {
>  static const struct dc_debug_options debug_defaults_drv =3D {
>         .disable_dmcu =3D true,
>         .force_abm_enable =3D false,
> -       .timing_trace =3D false,
>         .clock_trace =3D true,
>         .disable_pplib_clock_request =3D false,
>         .pipe_split_policy =3D MPC_SPLIT_DYNAMIC,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
> index 169924d0a839..44c52fcfc87d 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
> @@ -876,7 +876,6 @@ static const struct dc_debug_options debug_defaults_d=
rv =3D {
>         .replay_skip_crtc_disabled =3D true,
>         .disable_dmcu =3D true,
>         .force_abm_enable =3D false,
> -       .timing_trace =3D false,
>         .clock_trace =3D true,
>         .disable_dpp_power_gate =3D false,
>         .disable_hubp_power_gate =3D false,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
> index 3f4b9dba4112..432af4fabdb2 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
> @@ -858,7 +858,6 @@ static const struct dc_debug_options debug_defaults_d=
rv =3D {
>         .disable_z10 =3D true, /*hw not support it*/
>         .disable_dmcu =3D true,
>         .force_abm_enable =3D false,
> -       .timing_trace =3D false,
>         .clock_trace =3D true,
>         .disable_pplib_clock_request =3D false,
>         .pipe_split_policy =3D MPC_SPLIT_DYNAMIC,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
> index 5fd52c5fcee4..295065b1f206 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
> @@ -853,7 +853,6 @@ static const struct dc_debug_options debug_defaults_d=
rv =3D {
>         .disable_z10 =3D true, /*hw not support it*/
>         .disable_dmcu =3D true,
>         .force_abm_enable =3D false,
> -       .timing_trace =3D false,
>         .clock_trace =3D true,
>         .disable_pplib_clock_request =3D false,
>         .pipe_split_policy =3D MPC_SPLIT_DYNAMIC,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> index a124ad9bd108..01cc6b76cd0e 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> @@ -689,7 +689,6 @@ static const struct dc_plane_cap plane_cap =3D {
>  static const struct dc_debug_options debug_defaults_drv =3D {
>         .disable_dmcu =3D true,
>         .force_abm_enable =3D false,
> -       .timing_trace =3D false,
>         .clock_trace =3D true,
>         .disable_pplib_clock_request =3D false,
>         .pipe_split_policy =3D MPC_SPLIT_AVOID, // Due to CRB, no need to=
 MPC split anymore
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
> index 827a94f84f10..9da8e4579f91 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
> @@ -686,7 +686,6 @@ static const struct dc_plane_cap plane_cap =3D {
>  static const struct dc_debug_options debug_defaults_drv =3D {
>         .disable_dmcu =3D true,
>         .force_abm_enable =3D false,
> -       .timing_trace =3D false,
>         .clock_trace =3D true,
>         .disable_pplib_clock_request =3D false,
>         .pipe_split_policy =3D MPC_SPLIT_AVOID,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> index 893a9d9ee870..5a275883c144 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> @@ -712,7 +712,6 @@ static const struct dc_plane_cap plane_cap =3D {
>  static const struct dc_debug_options debug_defaults_drv =3D {
>         .disable_dmcu =3D true,
>         .force_abm_enable =3D false,
> -       .timing_trace =3D false,
>         .clock_trace =3D true,
>         .disable_pplib_clock_request =3D false,
>         .pipe_split_policy =3D MPC_SPLIT_AVOID,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> index 70abd32ce2ad..51070b09a831 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> @@ -692,7 +692,6 @@ static const struct dc_plane_cap plane_cap =3D {
>  static const struct dc_debug_options debug_defaults_drv =3D {
>         .disable_dmcu =3D true,
>         .force_abm_enable =3D false,
> -       .timing_trace =3D false,
>         .clock_trace =3D true,
>         .disable_pplib_clock_request =3D false,
>         .pipe_split_policy =3D MPC_SPLIT_AVOID,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> index 9d56fbdcd06a..cfc1b77f5460 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> @@ -685,7 +685,6 @@ static const struct dc_plane_cap plane_cap =3D {
>  static const struct dc_debug_options debug_defaults_drv =3D {
>         .disable_dmcu =3D true,
>         .force_abm_enable =3D false,
> -       .timing_trace =3D false,
>         .clock_trace =3D true,
>         .disable_pplib_clock_request =3D false,
>         .pipe_split_policy =3D MPC_SPLIT_AVOID,
> diff --git a/drivers/gpu/drm/amd/display/include/logger_interface.h b/dri=
vers/gpu/drm/amd/display/include/logger_interface.h
> index 02c23b04d34b..058f882d5bdd 100644
> --- a/drivers/gpu/drm/amd/display/include/logger_interface.h
> +++ b/drivers/gpu/drm/amd/display/include/logger_interface.h
> @@ -52,10 +52,6 @@ void update_surface_trace(
>
>  void post_surface_trace(struct dc *dc);
>
> -void context_timing_trace(
> -               struct dc *dc,
> -               struct resource_context *res_ctx);
> -
>  void context_clock_trace(
>                 struct dc *dc,
>                 struct dc_state *context);
> --
> 2.47.0
>
