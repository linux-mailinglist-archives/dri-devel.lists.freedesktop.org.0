Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67814A44AF6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D672B10E7A6;
	Tue, 25 Feb 2025 18:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ug8gdA5C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051ED10E7A6;
 Tue, 25 Feb 2025 18:56:18 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2fd02536660so994207a91.2; 
 Tue, 25 Feb 2025 10:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740509778; x=1741114578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LJYpUID6W4I5EJhScurw/AX4q422xg2nTEM2WBLhuA=;
 b=Ug8gdA5CzfAmTVTwdu7Jklz9K/kPYQdx5uv4YUVmj61r0LXM9z1nfiSwhuIuhoSYvl
 fEM2Cx5gy+wGMaM6hlqF1ghvl9VhS+QQUZwl4o4Xt7tIstFHAdmJmfCqIG+gAQAuqEUl
 9FbIk4vgKtRiD5cH+gE1yQImeOIAYRG5TiXXyv92M4P8ACi+ycbdrFN41QK5Y97ND5ql
 Hc2Lsy3IitOrTwf2k5468RdtDr6R7erKFvIlk77nSktNSdwEqZWZlYK09LquezV+c/X9
 aTDhuADnozWGAUORgFoTyAXaaWYOeTPhraI6ivmVovUzVdts3jQIiK0Wd/iB+NJIhFFW
 ZjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740509778; x=1741114578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LJYpUID6W4I5EJhScurw/AX4q422xg2nTEM2WBLhuA=;
 b=H6uVFabIU0OYGh0zFPLHTuk31ruARwsGLRCv2yDP8GhR0ib2HjA+KnbuETVVPvKofa
 tg+rkibthAyRyYSD6xC9D5hDmSgD0k4snVD2dk10KjgxxFmZEQE1H6sd4vXAWbaMV0zT
 JeJR+OgX66CyxyMR3KKqMXPyDb/AJV37T9GCNq1CRBCSna95s3uG9gNxl4p3LbJ4W9Vc
 pn3zc2VlfV473tVd8q9AP1OJa7UmqHIkKV1aigYbxTUrhTAC9TgGLbt1IcqHI3ev7jAM
 zQSIdkvn73S0Svx2dXIJrPHM5WQ0bMKRcivDqETGTSsc8fun9Mwz82HXvyDXapQs+Xlw
 ++Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYlcNqveXWPIr2dJoG00b/2gHchab2/tW6dFpJwGjZGWQOEWkqEBywUThl+iW9+Zr4kJRJGQLJ@lists.freedesktop.org,
 AJvYcCXvMF9eI8fwZPrDsePhmPxOnd3GdKmET091252OXKHrmH7frnB8Po4BVwasaCzTfMu2DvJpURNPjmhv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvTazTX9/5w9DC6AmKl5dz881hKrPFsjd/t4dfunp1cFG8yg/2
 y9FzINOo4ZYhelheKllIMaL+BpYjbrKDZPaP7QY4q2+0lQBEnNR6HkIV9WiR8teQfjP5T7FsSxZ
 ZL/xzYHhWwjRxbfS01ev3pMcmy7o=
X-Gm-Gg: ASbGncv61P1DloEDVCWujMZLI96x/+qviU2h83eguFl+l0MnZDbnp6B0QuUDn30A2Qd
 AwFAJYPKUPEG1bjCw8sLdfNPs2kM1U69YMgSSED0yRJeHAhlNDPDn3I4fv3fs/aEJmPAu2FyiLv
 1tSUxf4iA=
X-Google-Smtp-Source: AGHT+IGkDAct65mknFExr5qSoeMevF/bWfU3G2E8vI3pXH1PsZu7yjosujAuCh+2s6GdpE0tBa1Vyokcv8UkFO7+ROg=
X-Received: by 2002:a17:90b:3e8d:b0:2fa:2011:c85d with SMTP id
 98e67ed59e1d1-2fce7b4f29fmr10629837a91.7.1740509778436; Tue, 25 Feb 2025
 10:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20250224014942.193407-1-linux@treblig.org>
In-Reply-To: <20250224014942.193407-1-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Feb 2025 13:56:04 -0500
X-Gm-Features: AWEUYZkV-VKShpz06myyPBFccE18IuxpHMzvBHAaolC_sSnG3Qgfe_3AzTFlGo4
Message-ID: <CADnq5_MPXqCucYhh1kSCQVOm0QXT00+Bax9G=S9+vRJ2QLB6Sg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove unused optc3_fpu_set_vrr_m_const
To: linux@treblig.org
Cc: alexander.deucher@amd.com, chaitanya.dhere@amd.com, jun.lei@amd.com, 
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
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

On Mon, Feb 24, 2025 at 8:43=E2=80=AFAM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> The last use of optc3_fpu_set_vrr_m_const() was removed in 2022's
> commit 64f991590ff4 ("drm/amd/display: Fix a compilation failure on Power=
PC
> caused by FPU code")
> which removed the only caller (with a similar) name.
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.c  | 76 -------------------
>  .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.h  |  3 -
>  2 files changed, 79 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c b/drive=
rs/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
> index aac0a0ae2966..88789987bdbc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
> @@ -178,82 +178,6 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_0_soc =3D {
>  };
>
>
> -void optc3_fpu_set_vrr_m_const(struct timing_generator *optc,
> -               double vtotal_avg)
> -{
> -       struct optc *optc1 =3D DCN10TG_FROM_TG(optc);
> -       double vtotal_min, vtotal_max;
> -       double ratio, modulo, phase;
> -       uint32_t vblank_start;
> -       uint32_t v_total_mask_value =3D 0;
> -
> -       dc_assert_fp_enabled();
> -
> -       /* Compute VTOTAL_MIN and VTOTAL_MAX, so that
> -        * VOTAL_MAX - VTOTAL_MIN =3D 1
> -        */
> -       v_total_mask_value =3D 16;
> -       vtotal_min =3D dcn_bw_floor(vtotal_avg);
> -       vtotal_max =3D dcn_bw_ceil(vtotal_avg);
> -
> -       /* Check that bottom VBLANK is at least 2 lines tall when running=
 with
> -        * VTOTAL_MIN. Note that VTOTAL registers are defined as 'total n=
umber
> -        * of lines in a frame - 1'.
> -        */
> -       REG_GET(OTG_V_BLANK_START_END, OTG_V_BLANK_START,
> -               &vblank_start);
> -       ASSERT(vtotal_min >=3D vblank_start + 1);
> -
> -       /* Special case where the average frame rate can be achieved
> -        * without using the DTO
> -        */
> -       if (vtotal_min =3D=3D vtotal_max) {
> -               REG_SET(OTG_V_TOTAL, 0, OTG_V_TOTAL, (uint32_t)vtotal_min=
);
> -
> -               optc->funcs->set_vtotal_min_max(optc, 0, 0);
> -               REG_SET(OTG_M_CONST_DTO0, 0, OTG_M_CONST_DTO_PHASE, 0);
> -               REG_SET(OTG_M_CONST_DTO1, 0, OTG_M_CONST_DTO_MODULO, 0);
> -               REG_UPDATE_3(OTG_V_TOTAL_CONTROL,
> -                       OTG_V_TOTAL_MIN_SEL, 0,
> -                       OTG_V_TOTAL_MAX_SEL, 0,
> -                       OTG_SET_V_TOTAL_MIN_MASK_EN, 0);
> -               return;
> -       }
> -
> -       ratio =3D vtotal_max - vtotal_avg;
> -       modulo =3D 65536.0 * 65536.0 - 1.0; /* 2^32 - 1 */
> -       phase =3D ratio * modulo;
> -
> -       /* Special cases where the DTO phase gets rounded to 0 or
> -        * to DTO modulo
> -        */
> -       if (phase <=3D 0 || phase >=3D modulo) {
> -               REG_SET(OTG_V_TOTAL, 0, OTG_V_TOTAL,
> -                       phase <=3D 0 ?
> -                               (uint32_t)vtotal_max : (uint32_t)vtotal_m=
in);
> -               REG_SET(OTG_V_TOTAL_MIN, 0, OTG_V_TOTAL_MIN, 0);
> -               REG_SET(OTG_V_TOTAL_MAX, 0, OTG_V_TOTAL_MAX, 0);
> -               REG_SET(OTG_M_CONST_DTO0, 0, OTG_M_CONST_DTO_PHASE, 0);
> -               REG_SET(OTG_M_CONST_DTO1, 0, OTG_M_CONST_DTO_MODULO, 0);
> -               REG_UPDATE_3(OTG_V_TOTAL_CONTROL,
> -                       OTG_V_TOTAL_MIN_SEL, 0,
> -                       OTG_V_TOTAL_MAX_SEL, 0,
> -                       OTG_SET_V_TOTAL_MIN_MASK_EN, 0);
> -               return;
> -       }
> -       REG_UPDATE_6(OTG_V_TOTAL_CONTROL,
> -               OTG_V_TOTAL_MIN_SEL, 1,
> -               OTG_V_TOTAL_MAX_SEL, 1,
> -               OTG_SET_V_TOTAL_MIN_MASK_EN, 1,
> -               OTG_SET_V_TOTAL_MIN_MASK, v_total_mask_value,
> -               OTG_VTOTAL_MID_REPLACING_MIN_EN, 0,
> -               OTG_VTOTAL_MID_REPLACING_MAX_EN, 0);
> -       REG_SET(OTG_V_TOTAL, 0, OTG_V_TOTAL, (uint32_t)vtotal_min);
> -       optc->funcs->set_vtotal_min_max(optc, vtotal_min, vtotal_max);
> -       REG_SET(OTG_M_CONST_DTO0, 0, OTG_M_CONST_DTO_PHASE, (uint32_t)pha=
se);
> -       REG_SET(OTG_M_CONST_DTO1, 0, OTG_M_CONST_DTO_MODULO, (uint32_t)mo=
dulo);
> -}
> -
>  void dcn30_fpu_populate_dml_writeback_from_context(
>                 struct dc *dc, struct resource_context *res_ctx, display_=
e2e_pipe_params_st *pipes)
>  {
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h b/drive=
rs/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
> index cab864095ce7..e3b6ad6a8784 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
> @@ -29,9 +29,6 @@
>  #include "core_types.h"
>  #include "dcn20/dcn20_optc.h"
>
> -void optc3_fpu_set_vrr_m_const(struct timing_generator *optc,
> -               double vtotal_avg);
> -
>  void dcn30_fpu_populate_dml_writeback_from_context(
>                 struct dc *dc, struct resource_context *res_ctx, display_=
e2e_pipe_params_st *pipes);
>
> --
> 2.48.1
>
