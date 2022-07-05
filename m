Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4583567272
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 17:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5C48D0F1;
	Tue,  5 Jul 2022 15:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9834C8D053;
 Tue,  5 Jul 2022 15:23:30 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id o25so22262581ejm.3;
 Tue, 05 Jul 2022 08:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ly1jZz5akE/c0HYsm9XqK6PUqioIjWfxQyei0YBT/CM=;
 b=KslsP71OtkjY/RUON8rZ4XWDQkNUzzPk0fC5My/KASx5nhO3fL4PbOkRJA6GfdMoKg
 5lmjkp4Z02Uoumrb+s4gV1ymIuASV5Wd+rtevMPwVsjKWGfN4UvjGGr8VN4S9VpNJBPP
 9NSl6dbXG8Z2LjbW3fJiBS0Of5tRirW9AZ5sc5G74vr5cTwq4DTnsytQAwLrhL04Vk2z
 +uX2pdLrZKHNJM5vwfVqRAUeObwN117pBfNl1u7Zq65nBghKgVP0GZDdmsHxDm2kgmcD
 5A5IMCK3+MHJldiEQBQSM/wPCjABJriTeKkTdZgShhKqeiASdTMJps38xkVLoKUF6h9Q
 Ov6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ly1jZz5akE/c0HYsm9XqK6PUqioIjWfxQyei0YBT/CM=;
 b=OY3HaSDR36HShKpQ6FJKJ5j1JEUMHc87Cc84Yi4sv2wN0VIgUlErCZtwrSZgAjGW8I
 CzXjfwqk8WYm+nUAn3x9EeQRHiuHSNap8R/727zRfLIkH8K/0yKQRfTFlyAeCw5b6+ok
 FN721jDJoabvK2hr02Jv9pEvqneRnZV6EbJqy5+zEaD4ODy+h2pRobevAsuCzSdgc8Ok
 +PCEUNiEWXTJIEeFQU6b2FsG5yEJriJmb5yIL2qr0/a1DihbuweBYUgv4IdBjZKHCLQ6
 TxP7/gT+jGgRthGDnhdsalRX6KYoSvZXOAZBWgpxw82GRZKHEfnY8U8I3mN3Yf3WNLI7
 qmXA==
X-Gm-Message-State: AJIora9Q0jWJnXxbRiiMzef9GgsIkaApXfMIAHR6yAXYWcWdXKntB6r5
 SRlr+ySy7Z1EfNLETz85ASGcIpZS35notKD/IcA=
X-Google-Smtp-Source: AGRyM1vNtvUgITUCrpn1uASVCZj8dDlEmqEj6qQftT/8d7ijGepwFN90JNaSqxtnjv98fM6KoPRBdsFZkzSSjywRPko=
X-Received: by 2002:a17:907:a40f:b0:726:a8f5:1031 with SMTP id
 sg15-20020a170907a40f00b00726a8f51031mr35064739ejc.185.1657034609068; Tue, 05
 Jul 2022 08:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220630201741.991501-1-mairacanal@riseup.net>
In-Reply-To: <20220630201741.991501-1-mairacanal@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Jul 2022 11:23:16 -0400
Message-ID: <CADnq5_O3gX_fpMN1Bzd3Av7Kfoc+EC0t_pcJLVipHeRgv32jcg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove duplicate code across dcn30 and
 dcn31
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
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
Cc: Leo Li <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jun 30, 2022 at 4:18 PM Ma=C3=ADra Canal <mairacanal@riseup.net> wr=
ote:
>
> The function CalculateBytePerPixelAnd256BBlockSizes was defined four
> times: on display_mode_vba_30.c, display_rq_dlg_calc_30.c,
> display_mode_vba_31.c and display_rq_dlg_calc_31.c. In order to avoid
> code duplication, the CalculateBytePerPixelAnd256BBlockSizes is defined
> on display_mode_vba_30.h and used across dcn30 and dcn31.
>
> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> ---
>  .../dc/dml/dcn30/display_mode_vba_30.c        |  21 +---
>  .../dc/dml/dcn30/display_mode_vba_30.h        |  11 ++
>  .../dc/dml/dcn30/display_rq_dlg_calc_30.c     |  93 +--------------
>  .../dc/dml/dcn31/display_mode_vba_31.c        | 106 +-----------------
>  .../dc/dml/dcn31/display_rq_dlg_calc_31.c     |  91 +--------------
>  5 files changed, 23 insertions(+), 299 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30=
.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> index fb4aa4c800bf..842eb94ebe04 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> @@ -712,18 +712,6 @@ static double CalculateUrgentLatency(
>                 double UrgentLatencyAdjustmentFabricClockReference,
>                 double FabricClockSingle);
>
> -static bool CalculateBytePerPixelAnd256BBlockSizes(
> -               enum source_format_class SourcePixelFormat,
> -               enum dm_swizzle_mode SurfaceTiling,
> -               unsigned int *BytePerPixelY,
> -               unsigned int *BytePerPixelC,
> -               double       *BytePerPixelDETY,
> -               double       *BytePerPixelDETC,
> -               unsigned int *BlockHeight256BytesY,
> -               unsigned int *BlockHeight256BytesC,
> -               unsigned int *BlockWidth256BytesY,
> -               unsigned int *BlockWidth256BytesC);
> -
>  void dml30_recalculate(struct display_mode_lib *mode_lib)
>  {
>         ModeSupportAndSystemConfiguration(mode_lib);
> @@ -2095,7 +2083,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchPar=
ametersWatermarksAndPerforman
>         DTRACE("   return_bus_bw      =3D %f", v->ReturnBW);
>
>         for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> -               CalculateBytePerPixelAnd256BBlockSizes(
> +               dml30_CalculateBytePerPixelAnd256BBlockSizes(
>                                 v->SourcePixelFormat[k],
>                                 v->SurfaceTiling[k],
>                                 &v->BytePerPixelY[k],
> @@ -3165,7 +3153,7 @@ static void DisplayPipeConfiguration(struct display=
_mode_lib *mode_lib)
>
>         for (k =3D 0; k < mode_lib->vba.NumberOfActivePlanes; ++k) {
>
> -               CalculateBytePerPixelAnd256BBlockSizes(
> +               dml30_CalculateBytePerPixelAnd256BBlockSizes(
>                                 mode_lib->vba.SourcePixelFormat[k],
>                                 mode_lib->vba.SurfaceTiling[k],
>                                 &BytePerPixY[k],
> @@ -3218,7 +3206,7 @@ static void DisplayPipeConfiguration(struct display=
_mode_lib *mode_lib)
>                         &dummysinglestring);
>  }
>
> -static bool CalculateBytePerPixelAnd256BBlockSizes(
> +void dml30_CalculateBytePerPixelAnd256BBlockSizes(
>                 enum source_format_class SourcePixelFormat,
>                 enum dm_swizzle_mode SurfaceTiling,
>                 unsigned int *BytePerPixelY,
> @@ -3305,7 +3293,6 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
>                 *BlockWidth256BytesY =3D 256U / *BytePerPixelY / *BlockHe=
ight256BytesY;
>                 *BlockWidth256BytesC =3D 256U / *BytePerPixelC / *BlockHe=
ight256BytesC;
>         }
> -       return true;
>  }
>
>  static double CalculateTWait(
> @@ -3709,7 +3696,7 @@ void dml30_ModeSupportAndSystemConfigurationFull(st=
ruct display_mode_lib *mode_l
>         /*Bandwidth Support Check*/
>
>         for (k =3D 0; k <=3D v->NumberOfActivePlanes - 1; k++) {
> -               CalculateBytePerPixelAnd256BBlockSizes(
> +               dml30_CalculateBytePerPixelAnd256BBlockSizes(
>                                 v->SourcePixelFormat[k],
>                                 v->SurfaceTiling[k],
>                                 &v->BytePerPixelY[k],
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30=
.h b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.h
> index 4e249eaabfdb..daaf0883b84d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.h
> @@ -39,5 +39,16 @@ double dml30_CalculateWriteBackDISPCLK(
>                 long   WritebackDestinationWidth,
>                 unsigned int HTotal,
>                 unsigned int WritebackLineBufferSize);
> +void dml30_CalculateBytePerPixelAnd256BBlockSizes(
> +               enum source_format_class SourcePixelFormat,
> +               enum dm_swizzle_mode SurfaceTiling,
> +               unsigned int *BytePerPixelY,
> +               unsigned int *BytePerPixelC,
> +               double       *BytePerPixelDETY,
> +               double       *BytePerPixelDETC,
> +               unsigned int *BlockHeight256BytesY,
> +               unsigned int *BlockHeight256BytesC,
> +               unsigned int *BlockWidth256BytesY,
> +               unsigned int *BlockWidth256BytesC);
>
>  #endif /* __DML30_DISPLAY_MODE_VBA_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc=
_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
> index 747167083dea..8179be1f34bb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
> @@ -29,6 +29,7 @@
>  #include "../display_mode_vba.h"
>  #include "../dml_inline_defs.h"
>  #include "display_rq_dlg_calc_30.h"
> +#include "display_mode_vba_30.h"
>
>  static bool is_dual_plane(enum source_format_class source_format)
>  {
> @@ -275,96 +276,6 @@ static void handle_det_buf_split(struct display_mode=
_lib *mode_lib,
>                 full_swath_bytes_packed_c);
>  }
>
> -static bool CalculateBytePerPixelAnd256BBlockSizes(
> -               enum source_format_class SourcePixelFormat,
> -               enum dm_swizzle_mode SurfaceTiling,
> -               unsigned int *BytePerPixelY,
> -               unsigned int *BytePerPixelC,
> -               double       *BytePerPixelDETY,
> -               double       *BytePerPixelDETC,
> -               unsigned int *BlockHeight256BytesY,
> -               unsigned int *BlockHeight256BytesC,
> -               unsigned int *BlockWidth256BytesY,
> -               unsigned int *BlockWidth256BytesC)
> -{
> -       if (SourcePixelFormat =3D=3D dm_444_64) {
> -               *BytePerPixelDETY =3D 8;
> -               *BytePerPixelDETC =3D 0;
> -               *BytePerPixelY =3D 8;
> -               *BytePerPixelC =3D 0;
> -       } else if (SourcePixelFormat =3D=3D dm_444_32 || SourcePixelForma=
t =3D=3D dm_rgbe) {
> -               *BytePerPixelDETY =3D 4;
> -               *BytePerPixelDETC =3D 0;
> -               *BytePerPixelY =3D 4;
> -               *BytePerPixelC =3D 0;
> -       } else if (SourcePixelFormat =3D=3D dm_444_16) {
> -               *BytePerPixelDETY =3D 2;
> -               *BytePerPixelDETC =3D 0;
> -               *BytePerPixelY =3D 2;
> -               *BytePerPixelC =3D 0;
> -       } else if (SourcePixelFormat =3D=3D dm_444_8) {
> -               *BytePerPixelDETY =3D 1;
> -               *BytePerPixelDETC =3D 0;
> -               *BytePerPixelY =3D 1;
> -               *BytePerPixelC =3D 0;
> -       } else if (SourcePixelFormat =3D=3D dm_rgbe_alpha) {
> -               *BytePerPixelDETY =3D 4;
> -               *BytePerPixelDETC =3D 1;
> -               *BytePerPixelY =3D 4;
> -               *BytePerPixelC =3D 1;
> -       } else if (SourcePixelFormat =3D=3D dm_420_8) {
> -               *BytePerPixelDETY =3D 1;
> -               *BytePerPixelDETC =3D 2;
> -               *BytePerPixelY =3D 1;
> -               *BytePerPixelC =3D 2;
> -       } else if (SourcePixelFormat =3D=3D dm_420_12) {
> -               *BytePerPixelDETY =3D 2;
> -               *BytePerPixelDETC =3D 4;
> -               *BytePerPixelY =3D 2;
> -               *BytePerPixelC =3D 4;
> -       } else {
> -               *BytePerPixelDETY =3D 4.0 / 3;
> -               *BytePerPixelDETC =3D 8.0 / 3;
> -               *BytePerPixelY =3D 2;
> -               *BytePerPixelC =3D 4;
> -       }
> -
> -       if ((SourcePixelFormat =3D=3D dm_444_64 || SourcePixelFormat =3D=
=3D dm_444_32
> -                       || SourcePixelFormat =3D=3D dm_444_16 || SourcePi=
xelFormat =3D=3D dm_444_8
> -                       || SourcePixelFormat =3D=3D dm_mono_16 || SourceP=
ixelFormat =3D=3D dm_mono_8
> -                       || SourcePixelFormat =3D=3D dm_rgbe)) {
> -               if (SurfaceTiling =3D=3D dm_sw_linear) {
> -                       *BlockHeight256BytesY =3D 1;
> -               } else if (SourcePixelFormat =3D=3D dm_444_64) {
> -                       *BlockHeight256BytesY =3D 4;
> -               } else if (SourcePixelFormat =3D=3D dm_444_8) {
> -                       *BlockHeight256BytesY =3D 16;
> -               } else {
> -                       *BlockHeight256BytesY =3D 8;
> -               }
> -               *BlockWidth256BytesY =3D 256U / *BytePerPixelY / *BlockHe=
ight256BytesY;
> -               *BlockHeight256BytesC =3D 0;
> -               *BlockWidth256BytesC =3D 0;
> -       } else {
> -               if (SurfaceTiling =3D=3D dm_sw_linear) {
> -                       *BlockHeight256BytesY =3D 1;
> -                       *BlockHeight256BytesC =3D 1;
> -               } else if (SourcePixelFormat =3D=3D dm_rgbe_alpha) {
> -                       *BlockHeight256BytesY =3D 8;
> -                       *BlockHeight256BytesC =3D 16;
> -               } else if (SourcePixelFormat =3D=3D dm_420_8) {
> -                       *BlockHeight256BytesY =3D 16;
> -                       *BlockHeight256BytesC =3D 8;
> -               } else {
> -                       *BlockHeight256BytesY =3D 8;
> -                       *BlockHeight256BytesC =3D 8;
> -               }
> -               *BlockWidth256BytesY =3D 256U / *BytePerPixelY / *BlockHe=
ight256BytesY;
> -               *BlockWidth256BytesC =3D 256U / *BytePerPixelC / *BlockHe=
ight256BytesC;
> -       }
> -       return true;
> -}
> -
>  static void get_meta_and_pte_attr(struct display_mode_lib *mode_lib,
>         display_data_rq_dlg_params_st *rq_dlg_param,
>         display_data_rq_misc_params_st *rq_misc_param,
> @@ -450,7 +361,7 @@ static void get_meta_and_pte_attr(struct display_mode=
_lib *mode_lib,
>         double byte_per_pixel_det_y =3D 0;
>         double byte_per_pixel_det_c =3D 0;
>
> -       CalculateBytePerPixelAnd256BBlockSizes((enum source_format_class)=
(source_format),
> +       dml30_CalculateBytePerPixelAnd256BBlockSizes((enum source_format_=
class)(source_format),
>                 (enum dm_swizzle_mode)(tiling),
>                 &bytes_per_element_y,
>                 &bytes_per_element_c,
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31=
.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> index 448fbbcdf88a..9957313da732 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> @@ -26,6 +26,7 @@
>  #include "dc.h"
>  #include "dc_link.h"
>  #include "../display_mode_lib.h"
> +#include "dml/dcn30/display_mode_vba_30.h"
>  #include "display_mode_vba_31.h"
>  #include "../dml_inline_defs.h"
>
> @@ -86,17 +87,6 @@ typedef struct {
>  #define BPP_INVALID 0
>  #define BPP_BLENDED_PIPE 0xffffffff
>
> -static bool CalculateBytePerPixelAnd256BBlockSizes(
> -               enum source_format_class SourcePixelFormat,
> -               enum dm_swizzle_mode SurfaceTiling,
> -               unsigned int *BytePerPixelY,
> -               unsigned int *BytePerPixelC,
> -               double *BytePerPixelDETY,
> -               double *BytePerPixelDETC,
> -               unsigned int *BlockHeight256BytesY,
> -               unsigned int *BlockHeight256BytesC,
> -               unsigned int *BlockWidth256BytesY,
> -               unsigned int *BlockWidth256BytesC);
>  static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib);
>  static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndP=
erformanceCalculation(struct display_mode_lib *mode_lib);
>  static unsigned int dscceComputeDelay(
> @@ -2220,7 +2210,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchPar=
ametersWatermarksAndPerforman
>         DTRACE("   return_bus_bw      =3D %f", v->ReturnBW);
>
>         for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> -               CalculateBytePerPixelAnd256BBlockSizes(
> +               dml30_CalculateBytePerPixelAnd256BBlockSizes(
>                                 v->SourcePixelFormat[k],
>                                 v->SurfaceTiling[k],
>                                 &v->BytePerPixelY[k],
> @@ -3415,7 +3405,7 @@ static void DisplayPipeConfiguration(struct display=
_mode_lib *mode_lib)
>
>         for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
>
> -               CalculateBytePerPixelAnd256BBlockSizes(
> +               dml30_CalculateBytePerPixelAnd256BBlockSizes(
>                                 v->SourcePixelFormat[k],
>                                 v->SurfaceTiling[k],
>                                 &BytePerPixY[k],
> @@ -3469,94 +3459,6 @@ static void DisplayPipeConfiguration(struct displa=
y_mode_lib *mode_lib)
>                         &dummysinglestring);
>  }
>
> -static bool CalculateBytePerPixelAnd256BBlockSizes(
> -               enum source_format_class SourcePixelFormat,
> -               enum dm_swizzle_mode SurfaceTiling,
> -               unsigned int *BytePerPixelY,
> -               unsigned int *BytePerPixelC,
> -               double *BytePerPixelDETY,
> -               double *BytePerPixelDETC,
> -               unsigned int *BlockHeight256BytesY,
> -               unsigned int *BlockHeight256BytesC,
> -               unsigned int *BlockWidth256BytesY,
> -               unsigned int *BlockWidth256BytesC)
> -{
> -       if (SourcePixelFormat =3D=3D dm_444_64) {
> -               *BytePerPixelDETY =3D 8;
> -               *BytePerPixelDETC =3D 0;
> -               *BytePerPixelY =3D 8;
> -               *BytePerPixelC =3D 0;
> -       } else if (SourcePixelFormat =3D=3D dm_444_32 || SourcePixelForma=
t =3D=3D dm_rgbe) {
> -               *BytePerPixelDETY =3D 4;
> -               *BytePerPixelDETC =3D 0;
> -               *BytePerPixelY =3D 4;
> -               *BytePerPixelC =3D 0;
> -       } else if (SourcePixelFormat =3D=3D dm_444_16) {
> -               *BytePerPixelDETY =3D 2;
> -               *BytePerPixelDETC =3D 0;
> -               *BytePerPixelY =3D 2;
> -               *BytePerPixelC =3D 0;
> -       } else if (SourcePixelFormat =3D=3D dm_444_8) {
> -               *BytePerPixelDETY =3D 1;
> -               *BytePerPixelDETC =3D 0;
> -               *BytePerPixelY =3D 1;
> -               *BytePerPixelC =3D 0;
> -       } else if (SourcePixelFormat =3D=3D dm_rgbe_alpha) {
> -               *BytePerPixelDETY =3D 4;
> -               *BytePerPixelDETC =3D 1;
> -               *BytePerPixelY =3D 4;
> -               *BytePerPixelC =3D 1;
> -       } else if (SourcePixelFormat =3D=3D dm_420_8) {
> -               *BytePerPixelDETY =3D 1;
> -               *BytePerPixelDETC =3D 2;
> -               *BytePerPixelY =3D 1;
> -               *BytePerPixelC =3D 2;
> -       } else if (SourcePixelFormat =3D=3D dm_420_12) {
> -               *BytePerPixelDETY =3D 2;
> -               *BytePerPixelDETC =3D 4;
> -               *BytePerPixelY =3D 2;
> -               *BytePerPixelC =3D 4;
> -       } else {
> -               *BytePerPixelDETY =3D 4.0 / 3;
> -               *BytePerPixelDETC =3D 8.0 / 3;
> -               *BytePerPixelY =3D 2;
> -               *BytePerPixelC =3D 4;
> -       }
> -
> -       if ((SourcePixelFormat =3D=3D dm_444_64 || SourcePixelFormat =3D=
=3D dm_444_32 || SourcePixelFormat =3D=3D dm_444_16 || SourcePixelFormat =
=3D=3D dm_444_8 || SourcePixelFormat =3D=3D dm_mono_16
> -                       || SourcePixelFormat =3D=3D dm_mono_8 || SourcePi=
xelFormat =3D=3D dm_rgbe)) {
> -               if (SurfaceTiling =3D=3D dm_sw_linear) {
> -                       *BlockHeight256BytesY =3D 1;
> -               } else if (SourcePixelFormat =3D=3D dm_444_64) {
> -                       *BlockHeight256BytesY =3D 4;
> -               } else if (SourcePixelFormat =3D=3D dm_444_8) {
> -                       *BlockHeight256BytesY =3D 16;
> -               } else {
> -                       *BlockHeight256BytesY =3D 8;
> -               }
> -               *BlockWidth256BytesY =3D 256U / *BytePerPixelY / *BlockHe=
ight256BytesY;
> -               *BlockHeight256BytesC =3D 0;
> -               *BlockWidth256BytesC =3D 0;
> -       } else {
> -               if (SurfaceTiling =3D=3D dm_sw_linear) {
> -                       *BlockHeight256BytesY =3D 1;
> -                       *BlockHeight256BytesC =3D 1;
> -               } else if (SourcePixelFormat =3D=3D dm_rgbe_alpha) {
> -                       *BlockHeight256BytesY =3D 8;
> -                       *BlockHeight256BytesC =3D 16;
> -               } else if (SourcePixelFormat =3D=3D dm_420_8) {
> -                       *BlockHeight256BytesY =3D 16;
> -                       *BlockHeight256BytesC =3D 8;
> -               } else {
> -                       *BlockHeight256BytesY =3D 8;
> -                       *BlockHeight256BytesC =3D 8;
> -               }
> -               *BlockWidth256BytesY =3D 256U / *BytePerPixelY / *BlockHe=
ight256BytesY;
> -               *BlockWidth256BytesC =3D 256U / *BytePerPixelC / *BlockHe=
ight256BytesC;
> -       }
> -       return true;
> -}
> -
>  static double CalculateTWait(unsigned int PrefetchMode, double DRAMClock=
ChangeLatency, double UrgentLatency, double SREnterPlusExitTime)
>  {
>         if (PrefetchMode =3D=3D 0) {
> @@ -4066,7 +3968,7 @@ void dml31_ModeSupportAndSystemConfigurationFull(st=
ruct display_mode_lib *mode_l
>         /*Bandwidth Support Check*/
>
>         for (k =3D 0; k < v->NumberOfActivePlanes; k++) {
> -               CalculateBytePerPixelAnd256BBlockSizes(
> +               dml30_CalculateBytePerPixelAnd256BBlockSizes(
>                                 v->SourcePixelFormat[k],
>                                 v->SurfaceTiling[k],
>                                 &v->BytePerPixelY[k],
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc=
_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> index dd570689c095..c94cf6e01e25 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> @@ -27,94 +27,7 @@
>  #include "../display_mode_vba.h"
>  #include "../dml_inline_defs.h"
>  #include "display_rq_dlg_calc_31.h"
> -
> -static bool CalculateBytePerPixelAnd256BBlockSizes(
> -               enum source_format_class SourcePixelFormat,
> -               enum dm_swizzle_mode SurfaceTiling,
> -               unsigned int *BytePerPixelY,
> -               unsigned int *BytePerPixelC,
> -               double *BytePerPixelDETY,
> -               double *BytePerPixelDETC,
> -               unsigned int *BlockHeight256BytesY,
> -               unsigned int *BlockHeight256BytesC,
> -               unsigned int *BlockWidth256BytesY,
> -               unsigned int *BlockWidth256BytesC)
> -{
> -       if (SourcePixelFormat =3D=3D dm_444_64) {
> -               *BytePerPixelDETY =3D 8;
> -               *BytePerPixelDETC =3D 0;
> -               *BytePerPixelY =3D 8;
> -               *BytePerPixelC =3D 0;
> -       } else if (SourcePixelFormat =3D=3D dm_444_32 || SourcePixelForma=
t =3D=3D dm_rgbe) {
> -               *BytePerPixelDETY =3D 4;
> -               *BytePerPixelDETC =3D 0;
> -               *BytePerPixelY =3D 4;
> -               *BytePerPixelC =3D 0;
> -       } else if (SourcePixelFormat =3D=3D dm_444_16) {
> -               *BytePerPixelDETY =3D 2;
> -               *BytePerPixelDETC =3D 0;
> -               *BytePerPixelY =3D 2;
> -               *BytePerPixelC =3D 0;
> -       } else if (SourcePixelFormat =3D=3D dm_444_8) {
> -               *BytePerPixelDETY =3D 1;
> -               *BytePerPixelDETC =3D 0;
> -               *BytePerPixelY =3D 1;
> -               *BytePerPixelC =3D 0;
> -       } else if (SourcePixelFormat =3D=3D dm_rgbe_alpha) {
> -               *BytePerPixelDETY =3D 4;
> -               *BytePerPixelDETC =3D 1;
> -               *BytePerPixelY =3D 4;
> -               *BytePerPixelC =3D 1;
> -       } else if (SourcePixelFormat =3D=3D dm_420_8) {
> -               *BytePerPixelDETY =3D 1;
> -               *BytePerPixelDETC =3D 2;
> -               *BytePerPixelY =3D 1;
> -               *BytePerPixelC =3D 2;
> -       } else if (SourcePixelFormat =3D=3D dm_420_12) {
> -               *BytePerPixelDETY =3D 2;
> -               *BytePerPixelDETC =3D 4;
> -               *BytePerPixelY =3D 2;
> -               *BytePerPixelC =3D 4;
> -       } else {
> -               *BytePerPixelDETY =3D 4.0 / 3;
> -               *BytePerPixelDETC =3D 8.0 / 3;
> -               *BytePerPixelY =3D 2;
> -               *BytePerPixelC =3D 4;
> -       }
> -
> -       if ((SourcePixelFormat =3D=3D dm_444_64 || SourcePixelFormat =3D=
=3D dm_444_32 || SourcePixelFormat =3D=3D dm_444_16 || SourcePixelFormat =
=3D=3D dm_444_8 || SourcePixelFormat =3D=3D dm_mono_16
> -                       || SourcePixelFormat =3D=3D dm_mono_8 || SourcePi=
xelFormat =3D=3D dm_rgbe)) {
> -               if (SurfaceTiling =3D=3D dm_sw_linear) {
> -                       *BlockHeight256BytesY =3D 1;
> -               } else if (SourcePixelFormat =3D=3D dm_444_64) {
> -                       *BlockHeight256BytesY =3D 4;
> -               } else if (SourcePixelFormat =3D=3D dm_444_8) {
> -                       *BlockHeight256BytesY =3D 16;
> -               } else {
> -                       *BlockHeight256BytesY =3D 8;
> -               }
> -               *BlockWidth256BytesY =3D 256U / *BytePerPixelY / *BlockHe=
ight256BytesY;
> -               *BlockHeight256BytesC =3D 0;
> -               *BlockWidth256BytesC =3D 0;
> -       } else {
> -               if (SurfaceTiling =3D=3D dm_sw_linear) {
> -                       *BlockHeight256BytesY =3D 1;
> -                       *BlockHeight256BytesC =3D 1;
> -               } else if (SourcePixelFormat =3D=3D dm_rgbe_alpha) {
> -                       *BlockHeight256BytesY =3D 8;
> -                       *BlockHeight256BytesC =3D 16;
> -               } else if (SourcePixelFormat =3D=3D dm_420_8) {
> -                       *BlockHeight256BytesY =3D 16;
> -                       *BlockHeight256BytesC =3D 8;
> -               } else {
> -                       *BlockHeight256BytesY =3D 8;
> -                       *BlockHeight256BytesC =3D 8;
> -               }
> -               *BlockWidth256BytesY =3D 256U / *BytePerPixelY / *BlockHe=
ight256BytesY;
> -               *BlockWidth256BytesC =3D 256U / *BytePerPixelC / *BlockHe=
ight256BytesC;
> -       }
> -       return true;
> -}
> +#include "dml/dcn30/display_mode_vba_30.h"
>
>  static bool is_dual_plane(enum source_format_class source_format)
>  {
> @@ -467,7 +380,7 @@ static void get_meta_and_pte_attr(
>         double byte_per_pixel_det_y;
>         double byte_per_pixel_det_c;
>
> -       CalculateBytePerPixelAnd256BBlockSizes(
> +       dml30_CalculateBytePerPixelAnd256BBlockSizes(
>                         (enum source_format_class) (source_format),
>                         (enum dm_swizzle_mode) (tiling),
>                         &bytes_per_element_y,
> --
> 2.36.1
>
