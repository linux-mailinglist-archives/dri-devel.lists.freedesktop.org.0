Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA359482A4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 21:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BD4892EA;
	Mon,  5 Aug 2024 19:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A/PHeBDp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AA5892EA;
 Mon,  5 Aug 2024 19:52:31 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-70eae5896bcso9422623b3a.2; 
 Mon, 05 Aug 2024 12:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722887551; x=1723492351; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0HlAePfdGUtDDXh2mo5MYu8Z88Te8t6lOKxNdEz/0mg=;
 b=A/PHeBDpLkTGn2JShR7Fg/GOO0KK62b9nJxK0m5YjA+rYPxoIAJyNbX1r9HVrdnKGx
 nJKdhxGn+kcAZiuF50ZPtkeK5Kcc2Kd4X8iTb5NwUsb8OkIOzjZqZNetmu9ckB8F/4qG
 AONePgWkffIDRmZnv0k/IY16SEO5yp63Lur/MgmYOuUZoq2DUUjEh4oTPuq/lgL1fTU6
 8x3nx2A9nLxHCR+Uhwr3Hy6a2LzWt0lIYWrWC+6ID3ASMGvrs54hd0fSt4o3jkyals1C
 DkfMKZOHYbJTvbmhM+GyE3nuEWJjcVNwrSTBzaB28NfHqEWjTtJpJl44fj9fSEMz9KWl
 L/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722887551; x=1723492351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0HlAePfdGUtDDXh2mo5MYu8Z88Te8t6lOKxNdEz/0mg=;
 b=gOrL3QqrAcSt4B67akGvfig0/d6VK+M5C9t0di+Rl1Ffd4hjg/YrRYcd3ILTmcn/E6
 EVapyzQAOImJBlDDGhd/DCmETGKo3i6twiw7mnMZX7InzRjGrg+Dba+DcRMyOEtGx3oy
 47pSyRsSlkMG9eYC5M2kDRIzxmXzmpAG4ddKkv5gGHYVJRp1JOXMveDLOH0CQ0Ntx/2g
 bQ2PCfybP+rEZTA7h2Yv+OgTWupYVK4hwQOlRk8hTzP9WrhrXDW57+tXIYwTnGo33X0Z
 MguWxbwmMY4/55rESQWrgk39rG6Vr0gBnOdpzkIp8RYNehZvUGvRDr5Co0qSxjnaRtwR
 9tOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ8evO+JNdFMctTtfSoiY7pwQGgeytx9USbDPZ4E8Q2cQCHSWZsKzNak8a9oa+SlvB0rsPbwDy5nfHjbldhiqjuV7P/Vt8KcXJkinxs5/NF4is+BZAxLmizcuk2FGkIOJiOryG3sZx6Gz5FgULzA==
X-Gm-Message-State: AOJu0YzXPvh1uhYnZz6jywsvYV9VwUmfmjjXlEw/7fYUwb4gBNu+tZDX
 sPT+Z1S5w+pOzbyPvl7rbCf4/5Jijc7o8DoOpYmMqVDQX+RUw5ZnLpPIYOyTwGbNnEYcPKG74xi
 LMnLyG/OHJPRFG6Qg/nw5tTJVppk=
X-Google-Smtp-Source: AGHT+IHD6mP8SxzNmBFzhhHmk0yrW6460OtmeCKxd9zkNwGyWG7aj7cAJ++vLvTXwtV9xxS0vkvdBsafUOrPg1LHZz4=
X-Received: by 2002:a05:6a00:a93:b0:70b:a46:7db3 with SMTP id
 d2e1a72fcca58-7106d02ba17mr15666583b3a.19.1722887550766; Mon, 05 Aug 2024
 12:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240802114252.449452-1-colin.i.king@gmail.com>
In-Reply-To: <20240802114252.449452-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Aug 2024 15:52:18 -0400
Message-ID: <CADnq5_Ouob7zaqF1uTwL70QnWegEpvi0kkJY42yULPfCoW5d_Q@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: remove extraneous ;
 after statements
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Aug 2, 2024 at 8:00=E2=80=AFAM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> There are a several statements with two following semicolons, replace
> these with just one semicolon.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  .../drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c  | 2 +-
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c        | 2 +-
>  .../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c    | 4 ++--
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c              | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_=
helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_help=
er.c
> index 65776602648d..9956974c4527 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.=
c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.=
c
> @@ -1040,7 +1040,7 @@ void dml21_copy_clocks_to_dc_state(struct dml2_cont=
ext *in_ctx, struct dc_state
>  void dml21_extract_legacy_watermark_set(const struct dc *in_dc, struct d=
cn_watermarks *watermark, enum dml2_dchub_watermark_reg_set_index reg_set_i=
dx, struct dml2_context *in_ctx)
>  {
>         struct dml2_core_internal_display_mode_lib *mode_lib =3D &in_ctx-=
>v21.dml_init.dml2_instance->core_instance.clean_me_up.mode_lib;
> -       double refclk_freq_in_mhz =3D (in_ctx->v21.display_config.overrid=
es.hw.dlg_ref_clk_mhz > 0) ? (double)in_ctx->v21.display_config.overrides.h=
w.dlg_ref_clk_mhz : mode_lib->soc.dchub_refclk_mhz;;
> +       double refclk_freq_in_mhz =3D (in_ctx->v21.display_config.overrid=
es.hw.dlg_ref_clk_mhz > 0) ? (double)in_ctx->v21.display_config.overrides.h=
w.dlg_ref_clk_mhz : mode_lib->soc.dchub_refclk_mhz;
>
>         if (reg_set_idx >=3D DML2_DCHUB_WATERMARK_SET_NUM) {
>                 /* invalid register set index */
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2=
_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_cor=
e/dml2_core_dcn4_calcs.c
> index 13f2c80bad4c..54197d18ab19 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> @@ -7218,7 +7218,7 @@ static bool dml_core_mode_support(struct dml2_core_=
calcs_mode_support_ex *in_out
>  #if defined(DV_BUILD)
>                 // Assume a memory config setting of 3 in 420 mode or get=
 a new ip parameter that reflects the programming.
>                 if (mode_lib->ms.BytePerPixelC[k] !=3D 0.0 && display_cfg=
->plane_descriptors[k].pixel_format !=3D dml2_rgbe_alpha) {
> -                       lb_buffer_size_bits_luma =3D 34620 * 57;;
> +                       lb_buffer_size_bits_luma =3D 34620 * 57;
>                         lb_buffer_size_bits_chroma =3D 13560 * 57;
>                 }
>  #endif
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2=
_core_shared.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dm=
l2_core_shared.c
> index c54c29711a65..8f3c1c0b1cc1 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_s=
hared.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_s=
hared.c
> @@ -6464,8 +6464,8 @@ static void CalculateSwathAndDETConfiguration(struc=
t dml2_core_internal_scratch
>                         p->SwathHeightC[k] =3D l->MaximumSwathHeightC[k] =
/ 2;
>                         l->RoundedUpSwathSizeBytesY[k] =3D p->full_swath_=
bytes_l[k] / 2;
>                         l->RoundedUpSwathSizeBytesC[k] =3D p->full_swath_=
bytes_c[k] / 2;
> -                       p->request_size_bytes_luma[k] =3D ((p->BytePerPix=
Y[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_descri=
ptors[k].composition.rotation_angle)) ? 128 : 64;;
> -                       p->request_size_bytes_chroma[k] =3D ((p->BytePerP=
ixC[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_desc=
riptors[k].composition.rotation_angle)) ? 128 : 64;;
> +                       p->request_size_bytes_luma[k] =3D ((p->BytePerPix=
Y[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_descri=
ptors[k].composition.rotation_angle)) ? 128 : 64;
> +                       p->request_size_bytes_chroma[k] =3D ((p->BytePerP=
ixC[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_desc=
riptors[k].composition.rotation_angle)) ? 128 : 64;
>                 }
>
>                 if (p->SwathHeightC[k] =3D=3D 0)
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c b/drivers/g=
pu/drm/amd/display/dc/dml2/dml2_utils.c
> index 7655501e75d4..9e8ff3a9718e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
> @@ -421,7 +421,7 @@ unsigned int dml2_calc_max_scaled_time(
>
>  void dml2_extract_writeback_wm(struct dc_state *context, struct display_=
mode_lib_st *dml_core_ctx)
>  {
> -       int i, j =3D 0;;
> +       int i, j =3D 0;
>         struct mcif_arb_params *wb_arb_params =3D NULL;
>         struct dcn_bw_writeback *bw_writeback =3D NULL;
>         enum mmhubbub_wbif_mode wbif_mode =3D PACKED_444_FP16; /*for now*=
/
> --
> 2.39.2
>
