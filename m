Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7526585E91E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 21:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A128310E7FE;
	Wed, 21 Feb 2024 20:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VcScS07K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07F910E7EE;
 Wed, 21 Feb 2024 20:36:59 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2997cb49711so2312754a91.3; 
 Wed, 21 Feb 2024 12:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708547819; x=1709152619; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rQ5jlB/7OugG4YJ+JQZGcT1vIZqS71g98oRfifDuw08=;
 b=VcScS07Ki6e+JSW0bLF/V8l/PELSzErgNLJCTYKYPRkaEqBxWjPgeOLL3fel9nmHj2
 wV5InkI+niZ2TbSA/dJMgeo+hsXcrjFI0o/00sxxNTMqqX16Oe5G//Aeqx+jpZHpYAzk
 wOMVg+BkHXWPibTDn5HhvDXjvyYmVhyOUksyy3pRO1vMotoGx6cbkYb+76Lkw7k76ggu
 mt5+m67lYe4C2iHsS3QrUg8goM5LsBLQnFmEAA5oMe0ln8YJdtmfbEl3jNEfx2h1GWGG
 Ij+k4plobo34c8uly02kYSYFrWZiiJRJA7Yo47RsjAe1QyzpT1H7q+r9/ZcmS0vbgtcr
 CWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708547819; x=1709152619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQ5jlB/7OugG4YJ+JQZGcT1vIZqS71g98oRfifDuw08=;
 b=kRyPLjayAWDAHAC8UCVEYVzU0EsNwJXDr+55enmQux1o3TqMHN7Bk7Bp+BRiV/aIIY
 YBHrKNpNNZWcRGj8gyFD6CaqnBUeHQe0NxRLFKPtQcyUj21VoFsXrWMChZufVOehWyqd
 iB1U9l7h4bXM/LGU6fY/AZ5Mphh9Rke0VhdgMYxLf8StOCJLRxCTFpvJwmJV1YFwQFpe
 X/mUJvkP57eNi4rLzy/JxRVyeGG8hhes0OM/t34SmBCPhARlvyN5LucQla/RO7jrv1VG
 VCPxl3P5eAS2UjvQeNqvk2WnkPOwrLwz7zMmU4R0ctRg+WgdyCo99ouAvuaAEnrkb2G1
 IfBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKnegtb36gIRHoe0HEHpAyonICIMA+YMGoAnXYzejVTMfHGT4If2tF0fa6CEIcu/s9iOpY7dpBlCxZpHMolkkPzBKZk/tdHQH8xg5yA03LD56YuRa4eSzSfzcJ+tCOITOZRlOJcRFQelUD8XscyA==
X-Gm-Message-State: AOJu0YzoZr9iOQ3y/HFmfuvyPSfyzSxqw8qE6SK10afXGmrl8Xbig17x
 GNWwHFLHP6UMXa2gUcb8A/IGPol+DBZ7CzN4OFnJDs2y8KGo0PDc7Inhz6Blrdnf/JHmssxfouu
 gwVkf9X4UyNS5+zuscEJJUXX1/kM=
X-Google-Smtp-Source: AGHT+IG0aPJfS19j8oMCBDDJs6yvlAJDNPW10d6IR0FxubMS2dyBGCMEnOsS1crSB5pfSXv8+BOuFDeT4t8tKKeXNxI=
X-Received: by 2002:a17:90a:bd8e:b0:299:39a2:3592 with SMTP id
 z14-20020a17090abd8e00b0029939a23592mr12461172pjr.44.1708547819111; Wed, 21
 Feb 2024 12:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20240221192812.23038-1-jppaulo11@usp.br>
In-Reply-To: <20240221192812.23038-1-jppaulo11@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Feb 2024 15:36:47 -0500
Message-ID: <CADnq5_NyjsHsgN1f9G=E7ZM6Z9AhEX1cX5k51W+bZMBx1S1tqQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add prefix to functions inside
 dnc10_cm_common.h
To: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Wed, Feb 21, 2024 at 2:31=E2=80=AFPM Joao Paulo Pereira da Silva
<jppaulo11@usp.br> wrote:
>
> While debugging with ftrace, it's useful to create filters to search
> within the codebase. However, since some function names lack prefixes,
> creating a good filter may become more difficult.
>
> Because of this, add prefix to functions declared inside the header
> dcn10/dcn10_cm_common.h to facilitate creating good filters for the
> functions declared inside the file.
>

I think in this case, these functions are not dcn10 specific, they are
common to all DCN families, hence, the lack of a dcn10 prefix, they
just happen to date back to the original dcn10 code.  Might be better
to split them out into a separate file rather than renaming them.

Alex

> Signed-off-by: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
> ---
>  .../drm/amd/display/dc/dcn10/dcn10_cm_common.c | 12 ++++++------
>  .../drm/amd/display/dc/dcn10/dcn10_cm_common.h |  8 ++++----
>  .../drm/amd/display/dc/dcn10/dcn10_dpp_cm.c    | 18 +++++++++---------
>  .../drm/amd/display/dc/dcn20/dcn20_dpp_cm.c    |  8 ++++----
>  .../gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |  8 ++++----
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |  2 +-
>  .../drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |  4 ++--
>  .../drm/amd/display/dc/dcn30/dcn30_dwb_cm.c    |  6 +++---
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |  8 ++++----
>  .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  2 +-
>  .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  6 +++---
>  .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  2 +-
>  .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  2 +-
>  13 files changed, 43 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c b/dri=
vers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
> index 3538973bd0c6..3878b78faf89 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
> @@ -38,7 +38,7 @@
>  #define FN(reg_name, field_name) \
>         reg->shifts.field_name, reg->masks.field_name
>
> -void cm_helper_program_color_matrices(
> +void dcn10_cm_common_helper_program_color_matrices(
>                 struct dc_context *ctx,
>                 const uint16_t *regval,
>                 const struct color_matrices_reg *reg)
> @@ -62,7 +62,7 @@ void cm_helper_program_color_matrices(
>
>  }
>
> -void cm_helper_program_xfer_func(
> +void dcn10_cm_common_helper_program_xfer_func(
>                 struct dc_context *ctx,
>                 const struct pwl_params *params,
>                 const struct xfer_func_reg *reg)
> @@ -125,7 +125,7 @@ void cm_helper_program_xfer_func(
>
>
>
> -bool cm_helper_convert_to_custom_float(
> +bool dcn10_cm_common_helper_convert_to_custom_float(
>                 struct pwl_result_data *rgb_resulted,
>                 struct curve_points3 *corner_points,
>                 uint32_t hw_points_num,
> @@ -311,7 +311,7 @@ bool cm_helper_convert_to_custom_float(
>  #define DC_LOGGER \
>                 ctx->logger
>
> -bool cm_helper_translate_curve_to_hw_format(struct dc_context *ctx,
> +bool dcn10_cm_common_helper_translate_curve_to_hw_format(struct dc_conte=
xt *ctx,
>                                 const struct dc_transfer_func *output_tf,
>                                 struct pwl_params *lut_params, bool fixpo=
int)
>  {
> @@ -507,7 +507,7 @@ bool cm_helper_translate_curve_to_hw_format(struct dc=
_context *ctx,
>                 ++rgb;
>                 ++i;
>         }
> -       cm_helper_convert_to_custom_float(rgb_resulted,
> +       dcn10_cm_common_helper_convert_to_custom_float(rgb_resulted,
>                                                 lut_params->corner_points=
,
>                                                 hw_points, fixpoint);
>
> @@ -653,7 +653,7 @@ bool cm_helper_translate_curve_to_degamma_hw_format(
>                 ++rgb;
>                 ++i;
>         }
> -       cm_helper_convert_to_custom_float(rgb_resulted,
> +       dcn10_cm_common_helper_convert_to_custom_float(rgb_resulted,
>                                                 lut_params->corner_points=
,
>                                                 hw_points, false);
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h b/dri=
vers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h
> index 0a68b63d6126..0622dbdbe84b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h
> @@ -89,23 +89,23 @@ struct color_matrices_reg{
>         uint32_t csc_c33_c34;
>  };
>
> -void cm_helper_program_color_matrices(
> +void dcn10_cm_common_helper_program_color_matrices(
>                 struct dc_context *ctx,
>                 const uint16_t *regval,
>                 const struct color_matrices_reg *reg);
>
> -void cm_helper_program_xfer_func(
> +void dcn10_cm_common_helper_program_xfer_func(
>                 struct dc_context *ctx,
>                 const struct pwl_params *params,
>                 const struct xfer_func_reg *reg);
>
> -bool cm_helper_convert_to_custom_float(
> +bool dcn10_cm_common_helper_convert_to_custom_float(
>                 struct pwl_result_data *rgb_resulted,
>                 struct curve_points3 *corner_points,
>                 uint32_t hw_points_num,
>                 bool fixpoint);
>
> -bool cm_helper_translate_curve_to_hw_format(
> +bool dcn10_cm_common_helper_translate_curve_to_hw_format(
>                 struct dc_context *ctx,
>                 const struct dc_transfer_func *output_tf,
>                 struct pwl_params *lut_params, bool fixpoint);
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c b/driver=
s/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
> index 904c2d278998..b5cd5f17bc63 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
> @@ -125,7 +125,7 @@ static void program_gamut_remap(
>                 gam_regs.csc_c11_c12 =3D REG(CM_GAMUT_REMAP_C11_C12);
>                 gam_regs.csc_c33_c34 =3D REG(CM_GAMUT_REMAP_C33_C34);
>
> -               cm_helper_program_color_matrices(
> +               dcn10_cm_common_helper_program_color_matrices(
>                                 dpp->base.ctx,
>                                 regval,
>                                 &gam_regs);
> @@ -135,7 +135,7 @@ static void program_gamut_remap(
>                 gam_regs.csc_c11_c12 =3D REG(CM_COMA_C11_C12);
>                 gam_regs.csc_c33_c34 =3D REG(CM_COMA_C33_C34);
>
> -               cm_helper_program_color_matrices(
> +               dcn10_cm_common_helper_program_color_matrices(
>                                 dpp->base.ctx,
>                                 regval,
>                                 &gam_regs);
> @@ -145,7 +145,7 @@ static void program_gamut_remap(
>                 gam_regs.csc_c11_c12 =3D REG(CM_COMB_C11_C12);
>                 gam_regs.csc_c33_c34 =3D REG(CM_COMB_C33_C34);
>
> -               cm_helper_program_color_matrices(
> +               dcn10_cm_common_helper_program_color_matrices(
>                                 dpp->base.ctx,
>                                 regval,
>                                 &gam_regs);
> @@ -227,7 +227,7 @@ static void dpp1_cm_program_color_matrix(
>
>         }
>
> -       cm_helper_program_color_matrices(
> +       dcn10_cm_common_helper_program_color_matrices(
>                         dpp->base.ctx,
>                         regval,
>                         &gam_regs);
> @@ -385,7 +385,7 @@ void dpp1_cm_program_regamma_luta_settings(
>         gam_regs.region_start =3D REG(CM_RGAM_RAMA_REGION_0_1);
>         gam_regs.region_end =3D REG(CM_RGAM_RAMA_REGION_32_33);
>
> -       cm_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
> +       dcn10_cm_common_helper_program_xfer_func(dpp->base.ctx, params, &=
gam_regs);
>
>  }
>
> @@ -414,7 +414,7 @@ void dpp1_cm_program_regamma_lutb_settings(
>         gam_regs.region_start =3D REG(CM_RGAM_RAMB_REGION_0_1);
>         gam_regs.region_end =3D REG(CM_RGAM_RAMB_REGION_32_33);
>
> -       cm_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
> +       dcn10_cm_common_helper_program_xfer_func(dpp->base.ctx, params, &=
gam_regs);
>  }
>
>  void dpp1_program_input_csc(
> @@ -483,7 +483,7 @@ void dpp1_program_input_csc(
>
>         }
>
> -       cm_helper_program_color_matrices(
> +       dcn10_cm_common_helper_program_color_matrices(
>                         dpp->base.ctx,
>                         regval,
>                         &gam_regs);
> @@ -539,7 +539,7 @@ void dpp1_program_degamma_lutb_settings(
>         gam_regs.region_end =3D REG(CM_DGAM_RAMB_REGION_14_15);
>
>
> -       cm_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
> +       dcn10_cm_common_helper_program_xfer_func(dpp->base.ctx, params, &=
gam_regs);
>  }
>
>  /*program de gamma RAM A*/
> @@ -567,7 +567,7 @@ void dpp1_program_degamma_luta_settings(
>         gam_regs.region_start =3D REG(CM_DGAM_RAMA_REGION_0_1);
>         gam_regs.region_end =3D REG(CM_DGAM_RAMA_REGION_14_15);
>
> -       cm_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
> +       dcn10_cm_common_helper_program_xfer_func(dpp->base.ctx, params, &=
gam_regs);
>  }
>
>  void dpp1_power_on_degamma_lut(
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c b/driver=
s/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c
> index 598caa508d43..254eb6a5844f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c
> @@ -199,7 +199,7 @@ static void program_gamut_remap(
>                 gam_regs.csc_c33_c34 =3D REG(CM_GAMUT_REMAP_B_C33_C34);
>         }
>
> -       cm_helper_program_color_matrices(
> +       dcn10_cm_common_helper_program_color_matrices(
>                                 dpp->base.ctx,
>                                 regval,
>                                 &gam_regs);
> @@ -298,7 +298,7 @@ void dpp2_program_input_csc(
>
>         }
>
> -       cm_helper_program_color_matrices(
> +       dcn10_cm_common_helper_program_color_matrices(
>                         dpp->base.ctx,
>                         regval,
>                         &icsc_regs);
> @@ -407,7 +407,7 @@ static void dpp20_program_blnd_luta_settings(
>         gam_regs.region_start =3D REG(CM_BLNDGAM_RAMA_REGION_0_1);
>         gam_regs.region_end =3D REG(CM_BLNDGAM_RAMA_REGION_32_33);
>
> -       cm_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
> +       dcn10_cm_common_helper_program_xfer_func(dpp->base.ctx, params, &=
gam_regs);
>  }
>
>  /*program blnd lut RAM B*/
> @@ -435,7 +435,7 @@ static void dpp20_program_blnd_lutb_settings(
>         gam_regs.region_start =3D REG(CM_BLNDGAM_RAMB_REGION_0_1);
>         gam_regs.region_end =3D REG(CM_BLNDGAM_RAMB_REGION_32_33);
>
> -       cm_helper_program_xfer_func(dpp->base.ctx, params, &gam_regs);
> +       dcn10_cm_common_helper_program_xfer_func(dpp->base.ctx, params, &=
gam_regs);
>  }
>
>  static enum dc_lut_mode dpp20_get_blndgam_current(struct dpp *dpp_base)
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c b/drivers/g=
pu/drm/amd/display/dc/dcn20/dcn20_mpc.c
> index 5da6e44f284a..e697bf79d14d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
> @@ -174,7 +174,7 @@ void mpc2_set_output_csc(
>                 ocsc_regs.csc_c33_c34 =3D REG(CSC_C33_C34_B[opp_id]);
>         }
>
> -       cm_helper_program_color_matrices(
> +       dcn10_cm_common_helper_program_color_matrices(
>                         mpc20->base.ctx,
>                         regval,
>                         &ocsc_regs);
> @@ -233,7 +233,7 @@ void mpc2_set_ocsc_default(
>                 ocsc_regs.csc_c33_c34 =3D REG(CSC_C33_C34_B[opp_id]);
>         }
>
> -       cm_helper_program_color_matrices(
> +       dcn10_cm_common_helper_program_color_matrices(
>                         mpc20->base.ctx,
>                         regval,
>                         &ocsc_regs);
> @@ -342,7 +342,7 @@ static void mpc2_program_lutb(struct mpc *mpc, int mp=
cc_id,
>         gam_regs.region_start =3D REG(MPCC_OGAM_RAMB_REGION_0_1[mpcc_id])=
;
>         gam_regs.region_end =3D REG(MPCC_OGAM_RAMB_REGION_32_33[mpcc_id])=
;
>
> -       cm_helper_program_xfer_func(mpc20->base.ctx, params, &gam_regs);
> +       dcn10_cm_common_helper_program_xfer_func(mpc20->base.ctx, params,=
 &gam_regs);
>
>  }
>
> @@ -369,7 +369,7 @@ static void mpc2_program_luta(struct mpc *mpc, int mp=
cc_id,
>         gam_regs.region_start =3D REG(MPCC_OGAM_RAMA_REGION_0_1[mpcc_id])=
;
>         gam_regs.region_end =3D REG(MPCC_OGAM_RAMA_REGION_32_33[mpcc_id])=
;
>
> -       cm_helper_program_xfer_func(mpc20->base.ctx, params, &gam_regs);
> +       dcn10_cm_common_helper_program_xfer_func(mpc20->base.ctx, params,=
 &gam_regs);
>
>  }
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/g=
pu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> index 11f7746f3a65..4026e2034818 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> @@ -114,7 +114,7 @@ void dpp3_program_post_csc(
>
>         }
>
> -       cm_helper_program_color_matrices(
> +       dcn10_cm_common_helper_program_color_matrices(
>                         dpp->base.ctx,
>                         regval,
>                         &gam_regs);
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c b/driver=
s/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
> index e43f77c11c00..d19b0f47a6b0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
> @@ -351,7 +351,7 @@ static void program_gamut_remap(
>                 gam_regs.csc_c11_c12 =3D REG(CM_GAMUT_REMAP_C11_C12);
>                 gam_regs.csc_c33_c34 =3D REG(CM_GAMUT_REMAP_C33_C34);
>
> -               cm_helper_program_color_matrices(
> +               dcn10_cm_common_helper_program_color_matrices(
>                                 dpp->base.ctx,
>                                 regval,
>                                 &gam_regs);
> @@ -361,7 +361,7 @@ static void program_gamut_remap(
>                 gam_regs.csc_c11_c12 =3D REG(CM_GAMUT_REMAP_B_C11_C12);
>                 gam_regs.csc_c33_c34 =3D REG(CM_GAMUT_REMAP_B_C33_C34);
>
> -               cm_helper_program_color_matrices(
> +               dcn10_cm_common_helper_program_color_matrices(
>                                 dpp->base.ctx,
>                                 regval,
>                                 &gam_regs);
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c b/driver=
s/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c
> index 03a50c32fcfe..560d31c96fe0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c
> @@ -283,7 +283,7 @@ bool dwb3_ogam_set_input_transfer_func(
>         dwb_ogam_lut =3D kzalloc(sizeof(*dwb_ogam_lut), GFP_KERNEL);
>
>         if (dwb_ogam_lut) {
> -               cm_helper_translate_curve_to_hw_format(dwbc->ctx,
> +               dcn10_cm_common_helper_translate_curve_to_hw_format(dwbc-=
>ctx,
>                         in_transfer_func_dwb_ogam,
>                         dwb_ogam_lut, false);
>
> @@ -325,7 +325,7 @@ static void dwb3_program_gamut_remap(
>                 gam_regs.csc_c11_c12 =3D REG(DWB_GAMUT_REMAPA_C11_C12);
>                 gam_regs.csc_c33_c34 =3D REG(DWB_GAMUT_REMAPA_C33_C34);
>
> -               cm_helper_program_color_matrices(
> +               dcn10_cm_common_helper_program_color_matrices(
>                                 dwbc30->base.ctx,
>                                 regval,
>                                 &gam_regs);
> @@ -334,7 +334,7 @@ static void dwb3_program_gamut_remap(
>                 gam_regs.csc_c11_c12 =3D REG(DWB_GAMUT_REMAPB_C11_C12);
>                 gam_regs.csc_c33_c34 =3D REG(DWB_GAMUT_REMAPB_C33_C34);
>
> -               cm_helper_program_color_matrices(
> +               dcn10_cm_common_helper_program_color_matrices(
>                                 dwbc30->base.ctx,
>                                 regval,
>                                 &gam_regs);
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/g=
pu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> index d1500b223858..37a1550e56d8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> @@ -1073,7 +1073,7 @@ static void program_gamut_remap(
>                 gam_regs.csc_c11_c12 =3D REG(MPC_GAMUT_REMAP_C11_C12_A[mp=
cc_id]);
>                 gam_regs.csc_c33_c34 =3D REG(MPC_GAMUT_REMAP_C33_C34_A[mp=
cc_id]);
>
> -               cm_helper_program_color_matrices(
> +               dcn10_cm_common_helper_program_color_matrices(
>                                 mpc30->base.ctx,
>                                 regval,
>                                 &gam_regs);
> @@ -1083,7 +1083,7 @@ static void program_gamut_remap(
>                 gam_regs.csc_c11_c12 =3D REG(MPC_GAMUT_REMAP_C11_C12_B[mp=
cc_id]);
>                 gam_regs.csc_c33_c34 =3D REG(MPC_GAMUT_REMAP_C33_C34_B[mp=
cc_id]);
>
> -               cm_helper_program_color_matrices(
> +               dcn10_cm_common_helper_program_color_matrices(
>                                 mpc30->base.ctx,
>                                 regval,
>                                 &gam_regs);
> @@ -1247,7 +1247,7 @@ void mpc3_set_output_csc(
>                 ocsc_regs.csc_c11_c12 =3D REG(CSC_C11_C12_B[opp_id]);
>                 ocsc_regs.csc_c33_c34 =3D REG(CSC_C33_C34_B[opp_id]);
>         }
> -       cm_helper_program_color_matrices(
> +       dcn10_cm_common_helper_program_color_matrices(
>                         mpc30->base.ctx,
>                         regval,
>                         &ocsc_regs);
> @@ -1291,7 +1291,7 @@ void mpc3_set_ocsc_default(
>                 ocsc_regs.csc_c33_c34 =3D REG(CSC_C33_C34_B[opp_id]);
>         }
>
> -       cm_helper_program_color_matrices(
> +       dcn10_cm_common_helper_program_color_matrices(
>                         mpc30->base.ctx,
>                         regval,
>                         &ocsc_regs);
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/dr=
ivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> index 6dd479e8a348..942e6cc5b23c 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> @@ -1853,7 +1853,7 @@ bool dcn10_set_output_transfer_func(struct dc *dc, =
struct pipe_ctx *pipe_ctx,
>         /* dcn10_translate_regamma_to_hw_format takes 750us, only do it w=
hen full
>          * update.
>          */
> -       else if (cm_helper_translate_curve_to_hw_format(dc->ctx,
> +       else if (dcn10_cm_common_helper_translate_curve_to_hw_format(dc->=
ctx,
>                         stream->out_transfer_func,
>                         &dpp->regamma_params, false)) {
>                 dpp->funcs->dpp_program_regamma_pwl(
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/dr=
ivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> index 4853ecac53f9..d01f2434d7be 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> @@ -921,7 +921,7 @@ bool dcn20_set_output_transfer_func(struct dc *dc, st=
ruct pipe_ctx *pipe_ctx,
>                         params =3D &stream->out_transfer_func->pwl;
>                 else if (pipe_ctx->stream->out_transfer_func->type =3D=3D
>                         TF_TYPE_DISTRIBUTED_POINTS &&
> -                       cm_helper_translate_curve_to_hw_format(dc->ctx,
> +                       dcn10_cm_common_helper_translate_curve_to_hw_form=
at(dc->ctx,
>                         stream->out_transfer_func,
>                         &mpc->blender_params, false))
>                         params =3D &mpc->blender_params;
> @@ -950,7 +950,7 @@ bool dcn20_set_blend_lut(
>                 if (plane_state->blend_tf->type =3D=3D TF_TYPE_HWPWL)
>                         blend_lut =3D &plane_state->blend_tf->pwl;
>                 else if (plane_state->blend_tf->type =3D=3D TF_TYPE_DISTR=
IBUTED_POINTS) {
> -                       cm_helper_translate_curve_to_hw_format(plane_stat=
e->ctx,
> +                       dcn10_cm_common_helper_translate_curve_to_hw_form=
at(plane_state->ctx,
>                                         plane_state->blend_tf,
>                                         &dpp_base->regamma_params, false)=
;
>                         blend_lut =3D &dpp_base->regamma_params;
> @@ -972,7 +972,7 @@ bool dcn20_set_shaper_3dlut(
>                 if (plane_state->in_shaper_func->type =3D=3D TF_TYPE_HWPW=
L)
>                         shaper_lut =3D &plane_state->in_shaper_func->pwl;
>                 else if (plane_state->in_shaper_func->type =3D=3D TF_TYPE=
_DISTRIBUTED_POINTS) {
> -                       cm_helper_translate_curve_to_hw_format(plane_stat=
e->ctx,
> +                       dcn10_cm_common_helper_translate_curve_to_hw_form=
at(plane_state->ctx,
>                                         plane_state->in_shaper_func,
>                                         &dpp_base->shaper_params, true);
>                         shaper_lut =3D &dpp_base->shaper_params;
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c b/dr=
ivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
> index c34c13e1e0a4..4f31af5bdff6 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
> @@ -106,7 +106,7 @@ static bool dcn30_set_mpc_shaper_3dlut(struct pipe_ct=
x *pipe_ctx,
>                 if (stream->func_shaper->type =3D=3D TF_TYPE_HWPWL) {
>                         shaper_lut =3D &stream->func_shaper->pwl;
>                 } else if (stream->func_shaper->type =3D=3D TF_TYPE_DISTR=
IBUTED_POINTS) {
> -                       cm_helper_translate_curve_to_hw_format(stream->ct=
x, stream->func_shaper,
> +                       dcn10_cm_common_helper_translate_curve_to_hw_form=
at(stream->ctx, stream->func_shaper,
>                                                                &dpp_base-=
>shaper_params, true);
>                         shaper_lut =3D &dpp_base->shaper_params;
>                 }
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/dr=
ivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> index 6c9299c7683d..06ca6b8a2dc7 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> @@ -446,7 +446,7 @@ bool dcn32_set_mpc_shaper_3dlut(
>                 if (stream->func_shaper->type =3D=3D TF_TYPE_HWPWL)
>                         shaper_lut =3D &stream->func_shaper->pwl;
>                 else if (stream->func_shaper->type =3D=3D TF_TYPE_DISTRIB=
UTED_POINTS) {
> -                       cm_helper_translate_curve_to_hw_format(stream->ct=
x,
> +                       dcn10_cm_common_helper_translate_curve_to_hw_form=
at(stream->ctx,
>                                         stream->func_shaper,
>                                         &dpp_base->shaper_params, true);
>                         shaper_lut =3D &dpp_base->shaper_params;
> --
> 2.43.0
>
