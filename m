Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6E3976F8E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 19:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3776810EBF6;
	Thu, 12 Sep 2024 17:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VqKNK36f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0A210EBF6;
 Thu, 12 Sep 2024 17:30:21 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-718e65590easo135809b3a.3; 
 Thu, 12 Sep 2024 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726162221; x=1726767021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5F3cwHqLIvvWEHInKjD1ssV8fBJH4qpK4XgV402VIkk=;
 b=VqKNK36fNyQk/UjKvnLBsPtFsI97cubzQq1VUh2nZ87a8iM0eoz6gxhV9HHqtlGk0v
 nenBvwIJgeFJoRCkIVRv4vECGTw7VU4ZGlk4lgc6fa2MtUUhoMCiTb4QbcvxP0SGMOaY
 G0roamVUvcmXM0Ooj0CG3E8qSj5Dbjk3ZP3Tx7T/tsLsbKF3kgPSj79HA+nu5YFMBQRA
 Z07qkvuoYpnkVAUivU5z1EgaUWrmcZN+qBbJcRhPggzBhyUE2oC8U87rcnlVg9YbkgGn
 Qf9YlJ91a9qI5+z4GuV2PM4O5CUHfvUN2/ThmcnJDoV2dgygwxsU/mP3iof9da6s7rge
 Z5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726162221; x=1726767021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5F3cwHqLIvvWEHInKjD1ssV8fBJH4qpK4XgV402VIkk=;
 b=MshgeSoVk1xNn8tPi/hiSFthVWbK2nl1MjIz+beQzKm3byqB0S30UsAb4NZ5YrVuLA
 H7IpjyatccPkycrYGuAnbEsYWdAuypI53x5jrcB3WhGFZOhcAFHDKB+Gt8e3cFCExqJr
 w8IrvIO8martkHKhSuMDvOXsakytA8MEa1IaBbO7JwyiJAdPvibJIi7OU+dUAPy5nSu8
 l+fDqqemNdQ/C2yl/27c9tRCG5pR5RQ8rsHK8JHCpE7KjyNItqgkrzBuEl/ZpTRhtnmz
 rdIzrL0CJThSoLBJvOFa6iJ4th1g5idpXH7RCLOF+lGqPWrvP8REBveH3wIdHs+qCXVQ
 FxFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSHt3xuUddODr4C3PMQ7SUhqr6Td6markKqUllaqEW25Ko3GYTeC6EvJp6m4iTid2MwXN7F6PF@lists.freedesktop.org,
 AJvYcCXJQH1QV1g3fBrTd3mZf2FybpKkxkU5ipaX2JWtZgz8KOmsYRNtC7myualRe891ifoOnuBnJ8dHOUl4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIdgYAc0IPBMIv5xqmjbhqkVLkZbATqZgjj5VWT9sJiBxOyNge
 vCwYDiqQFI9pJtKJiX+OiFwPFtHbwke/OdbA70ojPbTMAaRdp2Qbk8O0odm/RjESVS/n1KSHTKR
 VYjr8hTx80CYO6wzkf9tD9FrhKKk=
X-Google-Smtp-Source: AGHT+IGGiDi0tH8UV4EuWDX58S3nFgVRaPtWI9WGPWNW+X4EpxgPlMehAnglZMQ4o5KE9POyTj+ZtG1pR9gUlGwq5qE=
X-Received: by 2002:a05:6a00:3990:b0:718:e49f:137b with SMTP id
 d2e1a72fcca58-7192634966dmr2222197b3a.7.1726162221032; Thu, 12 Sep 2024
 10:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240912071209.47240-1-yanzhen@vivo.com>
In-Reply-To: <20240912071209.47240-1-yanzhen@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Sep 2024 13:30:09 -0400
Message-ID: <CADnq5_PNCJ2oGBN0x3CFQsY4Ufw3=_LLc1tHEWhaoMFHYtOvrw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/amd/display: fix typo in the comment
To: Yan Zhen <yanzhen@vivo.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, chaitanya.dhere@amd.com, jun.lei@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
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

On Thu, Sep 12, 2024 at 3:56=E2=80=AFAM Yan Zhen <yanzhen@vivo.com> wrote:
>
> Correctly spelled comments make it easier for the reader to understand
> the code.
>
> Replace 'maxium' with 'maximum' in the comment &
> replace 'diffculty' with 'difficulty' in the comment &
> replace 'suppluy' with 'supply' in the comment &
> replace 'Congiuration' with 'Configuration' in the comment &
> replace 'eanbled' with 'enabled' in the comment.
>
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c       | 2 +-
>  drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c | 6 +++---
>  drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c b/drivers/=
gpu/drm/amd/display/dc/basics/dce_calcs.c
> index e47e9db062f4..d70a3549e05a 100644
> --- a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
> @@ -569,7 +569,7 @@ static void calculate_bandwidth(
>                                 break;
>                         }
>                         data->lb_partitions[i] =3D bw_floor2(bw_div(data-=
>lb_size_per_component[i], data->lb_line_pitch), bw_int_to_fixed(1));
> -                       /*clamp the partitions to the maxium number suppo=
rted by the lb*/
> +                       /* clamp the partitions to the maximum number sup=
ported by the lb */
>                         if ((surface_type[i] !=3D bw_def_graphics || dcei=
p->graphics_lb_nodownscaling_multi_line_prefetching =3D=3D 1)) {
>                                 data->lb_partitions_max[i] =3D bw_int_to_=
fixed(10);
>                         }
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/dr=
ivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> index 547dfcc80fde..d851c081e376 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> @@ -8926,7 +8926,7 @@ void dml_core_mode_programming(struct display_mode_=
lib_st *mode_lib, const struc
>
>         // The prefetch scheduling should only be calculated once as per =
AllowForPStateChangeOrStutterInVBlank requirement
>         // If the AllowForPStateChangeOrStutterInVBlank requirement is no=
t strict (i.e. only try those power saving feature
> -       // if possible, then will try to program for the best power savin=
g features in order of diffculty (dram, fclk, stutter)
> +       // if possible, then will try to program for the best power savin=
g features in order of difficulty (dram, fclk, stutter)
>         s->iteration =3D 0;
>         s->MaxTotalRDBandwidth =3D 0;
>         s->AllPrefetchModeTested =3D false;
> @@ -9977,7 +9977,7 @@ void dml_core_get_row_heights(
>         dml_print("DML_DLG: %s: GPUVMMinPageSizeKBytes =3D %u\n", __func_=
_, GPUVMMinPageSizeKBytes);
>  #endif
>
> -       // just suppluy with enough parameters to calculate meta and dte
> +       // just supply with enough parameters to calculate meta and dte
>         CalculateVMAndRowBytes(
>                         0, // dml_bool_t ViewportStationary,
>                         1, // dml_bool_t DCCEnable,
> @@ -10110,7 +10110,7 @@ dml_bool_t dml_mode_support(
>  /// Note: In this function, it is assumed that DCFCLK, SOCCLK freq are t=
he state values, and mode_program will just use the DML calculated DPPCLK a=
nd DISPCLK
>  /// @param mode_lib mode_lib data struct that house all the input/output=
/bbox and calculation values.
>  /// @param state_idx Power state idx chosen
> -/// @param display_cfg Display Congiuration
> +/// @param display_cfg Display Configuration
>  /// @param call_standalone Calling mode_programming without calling mode=
 support.  Some of the "support" struct member will be pre-calculated befor=
e doing mode programming
>  /// TODO: Add clk_cfg input, could be useful for standalone mode
>  dml_bool_t dml_mode_programming(
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c b/dr=
ivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
> index 42c52284a868..355823530aa4 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
> @@ -455,7 +455,7 @@ bool dcn30_mmhubbub_warmup(
>         struct mcif_wb *mcif_wb;
>         struct mcif_warmup_params warmup_params =3D {0};
>         unsigned int  i, i_buf;
> -       /*make sure there is no active DWB eanbled */
> +       /* make sure there is no active DWB enabled */
>         for (i =3D 0; i < num_dwb; i++) {
>                 dwb =3D dc->res_pool->dwbc[wb_info[i].dwb_pipe_inst];
>                 if (dwb->dwb_is_efc_transition || dwb->dwb_is_drc) {
> --
> 2.34.1
>
