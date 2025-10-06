Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A097FBBECF8
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 19:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C958810E0FF;
	Mon,  6 Oct 2025 17:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jOjIoHDI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C85D10E433
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 17:28:15 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-32eb8144fecso1186935a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 10:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759771695; x=1760376495; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8GDKfnwebfg6cavOTCKB56yDBm/Zhzbdw0iMvsXnYag=;
 b=jOjIoHDIhdyGC7slFe8fjB7nHVB0uluKq4KLO0m/dMTS1/XUsETazwYmQf5bwfKUsX
 FgOSBNDUM3UK7V6udst4Wxz7nDjkKnIGUXa9gYeBBWyS67zY4X2uvTR8OsEl62LIx9MI
 6Jz/7Nn5pinZU1vHZ0T0XoQduylqz+YyxBoFFrQ9HrdwF8KGz+jYgTi9T0/stt7HKxYG
 6IZvGMOHdC+FIVqdk4coTYcJsQ6I3g/yUHmbxzA7kkICDkN8kCWNgf8GBT5AAeuDpe9b
 868e3NHx3q/dT5deMtwmt8Gp3BZKzhUOimdlFW0hZ5frDUyPpmXQM3SvoEzhd/EmCzUl
 IT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759771695; x=1760376495;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8GDKfnwebfg6cavOTCKB56yDBm/Zhzbdw0iMvsXnYag=;
 b=JY0MgU7iWKMGgKrZ/cbVt6NT0XRxs6FnTsjVl8xxaQfu0U9MCo/VQVHApYQGPPDcGs
 tSj0GDzax9FiLYPBmLkCENp+/r+Tz/I+XcV0ivi0s9VeubRluhylxGv+9meg8nW9ASCF
 Vmr7VipLJR7T4/R6lrt47u5RgAjEMtoXEZXE1uvUwTc6idciRzSN84vE9oMtuK+es/ek
 J9PUKwz9QaIAnrCtgwCkhomBT4x6Lmhb+sK/D1v1CjPdDBAFgEn6Pc6RGlDqJ1tpMhlp
 PzoK6xQBYJuAMZDMbADPyudtSqBUvTVsEzXJh/k3p7ApPOzM/aPEx4OQP1noygw1MQ9p
 CcvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDYFK83DVE3MZa6ht5KrHRv7mc+JVY5N7NNKJPy8w5/+2Zbjm4SDGT0YE/0xplVNHPa0RLj6qcNbs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHA0KM2UGUilnteRxA3JlInq5YrDvJTwbOEpROU2cuES5u2u/Z
 fIpuWhh2yQZVwk9ecaKRs8heUZCqlFkU9+/Y9dyYQffp6CPFVThvPbEYvKHEU5EX0/6pI8yt9+o
 shEds45wkAxC0jNHky2MzTtTNqVNKUkNG2A==
X-Gm-Gg: ASbGncuq5PrwAFZUxF+UKqInmjK6ajSHmdtAwveg4ivrorFMQmboaPY4+YmZaMHQ9bj
 0PaSYgsoI8BsvY5L9OrrAG68JXzOlE4fYh+jM0Hybt9G6jPvdsYfECUdibONfJAXaTSNJuo8vsb
 PRXBC1j2M+KcK9wEtO9kK/2xswzZJbovr0oj+rIpSKmLJ4t86fsu4w/s0o/ru2PT4Wro+lmkqWR
 qyi2dXmldj7BeHa/Fjo21T48PCaESs=
X-Google-Smtp-Source: AGHT+IGvPeQrk5YFtH2khflLvQDg/9vgHofkKMZDxex/a1mvimIKIjHK1zrwCIBICFwSDWRCp0BHVAyUVlLdtQ8SYl4=
X-Received: by 2002:a17:90b:1b0d:b0:32b:aed4:aa1a with SMTP id
 98e67ed59e1d1-339c27a2515mr7922326a91.4.1759771694946; Mon, 06 Oct 2025
 10:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251002210044.1726731-2-ardb+git@google.com>
In-Reply-To: <20251002210044.1726731-2-ardb+git@google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Oct 2025 13:28:03 -0400
X-Gm-Features: AS18NWD7-N8KS167TRBLTuJkfaeYqaGjNM9efec5tOE9vCI2VuPTAvMNzqdKU9w
Message-ID: <CADnq5_NUJDfctoHf7-vTcM9ACV6fKnKxXDbYYuaGBmgzU9=a-g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix unsafe uses of kernel mode FPU
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
 broonie@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Austin Zheng <austin.zheng@amd.com>, 
 Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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

Applied.  Thanks!

On Thu, Oct 2, 2025 at 5:11=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com>=
 wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The point of isolating code that uses kernel mode FPU in separate
> compilation units is to ensure that even implicit uses of, e.g., SIMD
> registers for spilling occur only in a context where this is permitted,
> i.e., from inside a kernel_fpu_begin/end block.
>
> This is important on arm64, which uses -mgeneral-regs-only to build all
> kernel code, with the exception of such compilation units where FP or
> SIMD registers are expected to be used. Given that the compiler may
> invent uses of FP/SIMD anywhere in such a unit, none of its code may be
> accessible from outside a kernel_fpu_begin/end block.
>
> This means that all callers into such compilation units must use the
> DC_FP start/end macros, which must not occur there themselves. For
> robustness, all functions with external linkage that reside there should
> call dc_assert_fp_enabled() to assert that the FPU context was set up
> correctly.
>
> Fix this for the DCN35, DCN351 and DCN36 implementations.
>
> Cc: Austin Zheng <austin.zheng@amd.com>
> Cc: Jun Lei <jun.lei@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c    |  4 ++++
>  .../drm/amd/display/dc/dml/dcn35/dcn35_fpu.c    |  6 ++++--
>  .../drm/amd/display/dc/dml/dcn351/dcn351_fpu.c  |  4 ++--
>  .../display/dc/resource/dcn35/dcn35_resource.c  | 16 +++++++++++++++-
>  .../dc/resource/dcn351/dcn351_resource.c        | 17 ++++++++++++++++-
>  .../display/dc/resource/dcn36/dcn36_resource.c  | 16 +++++++++++++++-
>  6 files changed, 56 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drive=
rs/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> index 17a21bcbde17..1a28061bb9ff 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> @@ -808,6 +808,8 @@ void dcn316_update_bw_bounding_box(struct dc *dc, str=
uct clk_bw_params *bw_param
>
>  int dcn_get_max_non_odm_pix_rate_100hz(struct _vcs_dpi_soc_bounding_box_=
st *soc)
>  {
> +       dc_assert_fp_enabled();
> +
>         return soc->clock_limits[0].dispclk_mhz * 10000.0 / (1.0 + soc->d=
cn_downspread_percent / 100.0);
>  }
>
> @@ -815,6 +817,8 @@ int dcn_get_approx_det_segs_required_for_pstate(
>                 struct _vcs_dpi_soc_bounding_box_st *soc,
>                 int pix_clk_100hz, int bpp, int seg_size_kb)
>  {
> +       dc_assert_fp_enabled();
> +
>         /* Roughly calculate required crb to hide latency. In practice th=
ere is slightly
>          * more buffer available for latency hiding
>          */
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drive=
rs/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> index 5d73efa2f0c9..15a1d77dfe36 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> @@ -445,6 +445,8 @@ int dcn35_populate_dml_pipes_from_context_fpu(struct =
dc *dc,
>         bool upscaled =3D false;
>         const unsigned int max_allowed_vblank_nom =3D 1023;
>
> +       dc_assert_fp_enabled();
> +
>         dcn31_populate_dml_pipes_from_context(dc, context, pipes,
>                                               validate_mode);
>
> @@ -498,9 +500,7 @@ int dcn35_populate_dml_pipes_from_context_fpu(struct =
dc *dc,
>
>                 pipes[pipe_cnt].pipe.src.unbounded_req_mode =3D false;
>
> -               DC_FP_START();
>                 dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
> -               DC_FP_END();
>
>                 pipes[pipe_cnt].pipe.dest.vfront_porch =3D timing->v_fron=
t_porch;
>                 pipes[pipe_cnt].pipe.src.dcc_rate =3D 3;
> @@ -581,6 +581,8 @@ void dcn35_decide_zstate_support(struct dc *dc, struc=
t dc_state *context)
>         unsigned int i, plane_count =3D 0;
>         DC_LOGGER_INIT(dc->ctx->logger);
>
> +       dc_assert_fp_enabled();
> +
>         for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
>                 if (context->res_ctx.pipe_ctx[i].plane_state)
>                         plane_count++;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c b/dri=
vers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
> index 6f516af82956..e5cfe73f640a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
> @@ -478,6 +478,8 @@ int dcn351_populate_dml_pipes_from_context_fpu(struct=
 dc *dc,
>         bool upscaled =3D false;
>         const unsigned int max_allowed_vblank_nom =3D 1023;
>
> +       dc_assert_fp_enabled();
> +
>         dcn31_populate_dml_pipes_from_context(dc, context, pipes,
>                                               validate_mode);
>
> @@ -531,9 +533,7 @@ int dcn351_populate_dml_pipes_from_context_fpu(struct=
 dc *dc,
>
>                 pipes[pipe_cnt].pipe.src.unbounded_req_mode =3D false;
>
> -               DC_FP_START();
>                 dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
> -               DC_FP_END();
>
>                 pipes[pipe_cnt].pipe.dest.vfront_porch =3D timing->v_fron=
t_porch;
>                 pipes[pipe_cnt].pipe.src.dcc_rate =3D 3;
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> index 8475c6eec547..32678b66c410 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> @@ -1760,6 +1760,20 @@ enum dc_status dcn35_patch_unknown_plane_state(str=
uct dc_plane_state *plane_stat
>  }
>
>
> +static int populate_dml_pipes_from_context_fpu(struct dc *dc,
> +                                              struct dc_state *context,
> +                                              display_e2e_pipe_params_st=
 *pipes,
> +                                              enum dc_validate_mode vali=
date_mode)
> +{
> +       int ret;
> +
> +       DC_FP_START();
> +       ret =3D dcn35_populate_dml_pipes_from_context_fpu(dc, context, pi=
pes, validate_mode);
> +       DC_FP_END();
> +
> +       return ret;
> +}
> +
>  static struct resource_funcs dcn35_res_pool_funcs =3D {
>         .destroy =3D dcn35_destroy_resource_pool,
>         .link_enc_create =3D dcn35_link_encoder_create,
> @@ -1770,7 +1784,7 @@ static struct resource_funcs dcn35_res_pool_funcs =
=3D {
>         .validate_bandwidth =3D dcn35_validate_bandwidth,
>         .calculate_wm_and_dlg =3D NULL,
>         .update_soc_for_wm_a =3D dcn31_update_soc_for_wm_a,
> -       .populate_dml_pipes =3D dcn35_populate_dml_pipes_from_context_fpu=
,
> +       .populate_dml_pipes =3D populate_dml_pipes_from_context_fpu,
>         .acquire_free_pipe_as_secondary_dpp_pipe =3D dcn20_acquire_free_p=
ipe_for_layer,
>         .release_pipe =3D dcn20_release_pipe,
>         .add_stream_to_ctx =3D dcn30_add_stream_to_ctx,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> index 0971c0f74186..677cee27589c 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> @@ -1732,6 +1732,21 @@ static enum dc_status dcn351_validate_bandwidth(st=
ruct dc *dc,
>         return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
>  }
>
> +static int populate_dml_pipes_from_context_fpu(struct dc *dc,
> +                                              struct dc_state *context,
> +                                              display_e2e_pipe_params_st=
 *pipes,
> +                                              enum dc_validate_mode vali=
date_mode)
> +{
> +       int ret;
> +
> +       DC_FP_START();
> +       ret =3D dcn351_populate_dml_pipes_from_context_fpu(dc, context, p=
ipes, validate_mode);
> +       DC_FP_END();
> +
> +       return ret;
> +
> +}
> +
>  static struct resource_funcs dcn351_res_pool_funcs =3D {
>         .destroy =3D dcn351_destroy_resource_pool,
>         .link_enc_create =3D dcn35_link_encoder_create,
> @@ -1742,7 +1757,7 @@ static struct resource_funcs dcn351_res_pool_funcs =
=3D {
>         .validate_bandwidth =3D dcn351_validate_bandwidth,
>         .calculate_wm_and_dlg =3D NULL,
>         .update_soc_for_wm_a =3D dcn31_update_soc_for_wm_a,
> -       .populate_dml_pipes =3D dcn351_populate_dml_pipes_from_context_fp=
u,
> +       .populate_dml_pipes =3D populate_dml_pipes_from_context_fpu,
>         .acquire_free_pipe_as_secondary_dpp_pipe =3D dcn20_acquire_free_p=
ipe_for_layer,
>         .release_pipe =3D dcn20_release_pipe,
>         .add_stream_to_ctx =3D dcn30_add_stream_to_ctx,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> index 8bae7fcedc22..d81540515e5c 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> @@ -1734,6 +1734,20 @@ static enum dc_status dcn35_validate_bandwidth(str=
uct dc *dc,
>  }
>
>
> +static int populate_dml_pipes_from_context_fpu(struct dc *dc,
> +                                              struct dc_state *context,
> +                                              display_e2e_pipe_params_st=
 *pipes,
> +                                              enum dc_validate_mode vali=
date_mode)
> +{
> +       int ret;
> +
> +       DC_FP_START();
> +       ret =3D dcn35_populate_dml_pipes_from_context_fpu(dc, context, pi=
pes, validate_mode);
> +       DC_FP_END();
> +
> +       return ret;
> +}
> +
>  static struct resource_funcs dcn36_res_pool_funcs =3D {
>         .destroy =3D dcn36_destroy_resource_pool,
>         .link_enc_create =3D dcn35_link_encoder_create,
> @@ -1744,7 +1758,7 @@ static struct resource_funcs dcn36_res_pool_funcs =
=3D {
>         .validate_bandwidth =3D dcn35_validate_bandwidth,
>         .calculate_wm_and_dlg =3D NULL,
>         .update_soc_for_wm_a =3D dcn31_update_soc_for_wm_a,
> -       .populate_dml_pipes =3D dcn35_populate_dml_pipes_from_context_fpu=
,
> +       .populate_dml_pipes =3D populate_dml_pipes_from_context_fpu,
>         .acquire_free_pipe_as_secondary_dpp_pipe =3D dcn20_acquire_free_p=
ipe_for_layer,
>         .release_pipe =3D dcn20_release_pipe,
>         .add_stream_to_ctx =3D dcn30_add_stream_to_ctx,
> --
> 2.51.0.618.g983fd99d29-goog
>
