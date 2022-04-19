Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23699507115
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7851310E9BD;
	Tue, 19 Apr 2022 14:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F94610EB0D;
 Tue, 19 Apr 2022 14:54:03 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e5c42b6e31so7791052fac.12; 
 Tue, 19 Apr 2022 07:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9YpPy+HWGVcibHbsbNElcFjT6HwgDsvXUD52AoePxts=;
 b=fXoOP7G1H0P/0qkMVORhP1n8wW6o2NES3/GY/aidIFAmSl2FSggOTtjcC8+AXLhs8T
 QIX2gO6IlztRXtakdNjE0BjUt8bzuAKtlazIAVsn7IiMB7Nl3ueTT3ZfGmKUxufWVovz
 30VC5yrjASSiRtA2/U/WnOSXMlqNUqOG3F09LbfK8EF/iTpNA0aN/7aDDzZFulVosGUw
 LM43+0p8kZEaB0Nw2xeY4HKmwTMGGVXwnkB8s4eW4XXTO32tmAD+R5JgFwKnNDTr0AFj
 h0r8UNNox923b+rqt2Btnl2pZSsW++Xp3+Rhd8ffcKYM89BGawUsoeJyPzQYP46Sx+n4
 fvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9YpPy+HWGVcibHbsbNElcFjT6HwgDsvXUD52AoePxts=;
 b=iIhIyqaLBU/PVwJ/F0Ij4JbthH6bueKfEAJR/cAuFaJssbK+M2sWQApgWPkaL6xbcR
 yO+nCcCA90Gm+l+6WUJYZTI0m+e/MYZj0XyvZIgLUutS375vjfM0zFXSRLXX/tVvmOEr
 xWHoRNVE9EJYODRKcCCy849KTdWrbpBlQgoCsakmhNwpT8SdtSEASKisJDlKuJNaQu+c
 Sp07wp9I6Hn3fC/JjYdNHLHDWJgXUSAHrQzOYKIcMqoTbn/4MwrRwOIHMlbZh46fwEbs
 fKs6CaZ1nDU1n/MST4CJyYABYlwxxHElX6BSz0xBkh6l9hrf/DWpUvGFP1oZBLd6liIV
 EkWQ==
X-Gm-Message-State: AOAM533N41F6Sd5jtVmSFyc/cgIVoZwkVIv1HEt8qP/lNA4ApaEm9Et8
 002LFTr239Ri024xGaOT/Mp8XwPC6EwrSjBlnpU=
X-Google-Smtp-Source: ABdhPJyhwzbyAvXQ2qE0B99Of9qSmA0Kw5J6IFhhQDk2I2FBKaUpZF1Ya5J1aVUjd/CYpbBSrx8ktYsBxdRXyXLft6k=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr8066706oaa.200.1650380042289; Tue, 19
 Apr 2022 07:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220416184736.2560013-1-trix@redhat.com>
In-Reply-To: <20220416184736.2560013-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 19 Apr 2022 10:53:50 -0400
Message-ID: <CADnq5_Oap6UCryeD4eaCL49Fm=DXp-fyzSPFkBH+5giqspK1RA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/kms: change evergreen_default_state table from
 global to static
To: Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sat, Apr 16, 2022 at 2:48 PM Tom Rix <trix@redhat.com> wrote:
>
> evergreen_default_state and evergreen_default_size are only
> used in evergreen.c.  Single file symbols should be static.
> So move their definitions to evergreen_blit_shaders.h
> and change their storage-class-specifier to static.
>
> Remove unneeded evergreen_blit_shader.c
>
> evergreen_ps/vs definitions were removed with
> commit 4f8629675800 ("drm/radeon/kms: remove r6xx+ blit copy routines")
> So their declarations in evergreen_blit_shader.h
> are not needed, so remove them.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/radeon/Makefile               |   2 +-
>  .../gpu/drm/radeon/evergreen_blit_shaders.c   | 303 ------------------
>  .../gpu/drm/radeon/evergreen_blit_shaders.h   | 278 +++++++++++++++-
>  3 files changed, 274 insertions(+), 309 deletions(-)
>  delete mode 100644 drivers/gpu/drm/radeon/evergreen_blit_shaders.c
>
> diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
> index 4deedaacd655..1045d2c46a76 100644
> --- a/drivers/gpu/drm/radeon/Makefile
> +++ b/drivers/gpu/drm/radeon/Makefile
> @@ -41,7 +41,7 @@ radeon-y += radeon_device.o radeon_asic.o radeon_kms.o \
>         rs400.o rs600.o rs690.o rv515.o r520.o r600.o rv770.o radeon_test.o \
>         r200.o radeon_legacy_tv.o r600_cs.o \
>         radeon_pm.o atombios_dp.o r600_hdmi.o dce3_1_afmt.o \
> -       evergreen.o evergreen_cs.o evergreen_blit_shaders.o \
> +       evergreen.o evergreen_cs.o \
>         evergreen_hdmi.o radeon_trace_points.o ni.o \
>         atombios_encoders.o radeon_semaphore.o radeon_sa.o atombios_i2c.o si.o \
>         radeon_prime.o cik.o cik_blit_shaders.o \
> diff --git a/drivers/gpu/drm/radeon/evergreen_blit_shaders.c b/drivers/gpu/drm/radeon/evergreen_blit_shaders.c
> deleted file mode 100644
> index 1a96ddb3e5ed..000000000000
> --- a/drivers/gpu/drm/radeon/evergreen_blit_shaders.c
> +++ /dev/null
> @@ -1,303 +0,0 @@
> -/*
> - * Copyright 2010 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the next
> - * paragraph) shall be included in all copies or substantial portions of the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> - * DEALINGS IN THE SOFTWARE.
> - *
> - * Authors:
> - *     Alex Deucher <alexander.deucher@amd.com>
> - */
> -
> -#include <linux/bug.h>
> -#include <linux/types.h>
> -#include <linux/kernel.h>
> -
> -/*
> - * evergreen cards need to use the 3D engine to blit data which requires
> - * quite a bit of hw state setup.  Rather than pull the whole 3D driver
> - * (which normally generates the 3D state) into the DRM, we opt to use
> - * statically generated state tables.  The register state and shaders
> - * were hand generated to support blitting functionality.  See the 3D
> - * driver or documentation for descriptions of the registers and
> - * shader instructions.
> - */
> -
> -const u32 evergreen_default_state[] =
> -{
> -       0xc0016900,
> -       0x0000023b,
> -       0x00000000, /* SQ_LDS_ALLOC_PS */
> -
> -       0xc0066900,
> -       0x00000240,
> -       0x00000000, /* SQ_ESGS_RING_ITEMSIZE */
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -
> -       0xc0046900,
> -       0x00000247,
> -       0x00000000, /* SQ_GS_VERT_ITEMSIZE */
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -
> -       0xc0026900,
> -       0x00000010,
> -       0x00000000, /* DB_Z_INFO */
> -       0x00000000, /* DB_STENCIL_INFO */
> -
> -       0xc0016900,
> -       0x00000200,
> -       0x00000000, /* DB_DEPTH_CONTROL */
> -
> -       0xc0066900,
> -       0x00000000,
> -       0x00000060, /* DB_RENDER_CONTROL */
> -       0x00000000, /* DB_COUNT_CONTROL */
> -       0x00000000, /* DB_DEPTH_VIEW */
> -       0x0000002a, /* DB_RENDER_OVERRIDE */
> -       0x00000000, /* DB_RENDER_OVERRIDE2 */
> -       0x00000000, /* DB_HTILE_DATA_BASE */
> -
> -       0xc0026900,
> -       0x0000000a,
> -       0x00000000, /* DB_STENCIL_CLEAR */
> -       0x00000000, /* DB_DEPTH_CLEAR */
> -
> -       0xc0016900,
> -       0x000002dc,
> -       0x0000aa00, /* DB_ALPHA_TO_MASK */
> -
> -       0xc0016900,
> -       0x00000080,
> -       0x00000000, /* PA_SC_WINDOW_OFFSET */
> -
> -       0xc00d6900,
> -       0x00000083,
> -       0x0000ffff, /* PA_SC_CLIPRECT_RULE */
> -       0x00000000, /* PA_SC_CLIPRECT_0_TL */
> -       0x20002000, /* PA_SC_CLIPRECT_0_BR */
> -       0x00000000,
> -       0x20002000,
> -       0x00000000,
> -       0x20002000,
> -       0x00000000,
> -       0x20002000,
> -       0xaaaaaaaa, /* PA_SC_EDGERULE */
> -       0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
> -       0x0000000f, /* CB_TARGET_MASK */
> -       0x0000000f, /* CB_SHADER_MASK */
> -
> -       0xc0226900,
> -       0x00000094,
> -       0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
> -       0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x80000000,
> -       0x20002000,
> -       0x00000000, /* PA_SC_VPORT_ZMIN_0 */
> -       0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
> -
> -       0xc0016900,
> -       0x000000d4,
> -       0x00000000, /* SX_MISC */
> -
> -       0xc0026900,
> -       0x00000292,
> -       0x00000000, /* PA_SC_MODE_CNTL_0 */
> -       0x00000000, /* PA_SC_MODE_CNTL_1 */
> -
> -       0xc0106900,
> -       0x00000300,
> -       0x00000000, /* PA_SC_LINE_CNTL */
> -       0x00000000, /* PA_SC_AA_CONFIG */
> -       0x00000005, /* PA_SU_VTX_CNTL */
> -       0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
> -       0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
> -       0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
> -       0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
> -       0x00000000, /* PA_SC_AA_SAMPLE_LOCS_0 */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /* PA_SC_AA_SAMPLE_LOCS_7 */
> -       0xffffffff, /* PA_SC_AA_MASK */
> -
> -       0xc00d6900,
> -       0x00000202,
> -       0x00cc0010, /* CB_COLOR_CONTROL */
> -       0x00000210, /* DB_SHADER_CONTROL */
> -       0x00010000, /* PA_CL_CLIP_CNTL */
> -       0x00000004, /* PA_SU_SC_MODE_CNTL */
> -       0x00000100, /* PA_CL_VTE_CNTL */
> -       0x00000000, /* PA_CL_VS_OUT_CNTL */
> -       0x00000000, /* PA_CL_NANINF_CNTL */
> -       0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
> -       0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
> -       0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /* SQ_DYN_GPR_RESOURCE_LIMIT_1 */
> -
> -       0xc0066900,
> -       0x000002de,
> -       0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -
> -       0xc0016900,
> -       0x00000229,
> -       0x00000000, /* SQ_PGM_START_FS */
> -
> -       0xc0016900,
> -       0x0000022a,
> -       0x00000000, /* SQ_PGM_RESOURCES_FS */
> -
> -       0xc0096900,
> -       0x00000100,
> -       0x00ffffff, /* VGT_MAX_VTX_INDX */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /* SX_ALPHA_TEST_CONTROL */
> -       0x00000000, /* CB_BLEND_RED */
> -       0x00000000, /* CB_BLEND_GREEN */
> -       0x00000000, /* CB_BLEND_BLUE */
> -       0x00000000, /* CB_BLEND_ALPHA */
> -
> -       0xc0026900,
> -       0x000002a8,
> -       0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
> -       0x00000000, /*  */
> -
> -       0xc0026900,
> -       0x000002ad,
> -       0x00000000, /* VGT_REUSE_OFF */
> -       0x00000000, /*  */
> -
> -       0xc0116900,
> -       0x00000280,
> -       0x00000000, /* PA_SU_POINT_SIZE */
> -       0x00000000, /* PA_SU_POINT_MINMAX */
> -       0x00000008, /* PA_SU_LINE_CNTL */
> -       0x00000000, /* PA_SC_LINE_STIPPLE */
> -       0x00000000, /* VGT_OUTPUT_PATH_CNTL */
> -       0x00000000, /* VGT_HOS_CNTL */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /* VGT_GS_MODE */
> -
> -       0xc0016900,
> -       0x000002a1,
> -       0x00000000, /* VGT_PRIMITIVEID_EN */
> -
> -       0xc0016900,
> -       0x000002a5,
> -       0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
> -
> -       0xc0016900,
> -       0x000002d5,
> -       0x00000000, /* VGT_SHADER_STAGES_EN */
> -
> -       0xc0026900,
> -       0x000002e5,
> -       0x00000000, /* VGT_STRMOUT_CONFIG */
> -       0x00000000, /*  */
> -
> -       0xc0016900,
> -       0x000001e0,
> -       0x00000000, /* CB_BLEND0_CONTROL */
> -
> -       0xc0016900,
> -       0x000001b1,
> -       0x00000000, /* SPI_VS_OUT_CONFIG */
> -
> -       0xc0016900,
> -       0x00000187,
> -       0x00000000, /* SPI_VS_OUT_ID_0 */
> -
> -       0xc0016900,
> -       0x00000191,
> -       0x00000100, /* SPI_PS_INPUT_CNTL_0 */
> -
> -       0xc00b6900,
> -       0x000001b3,
> -       0x20000001, /* SPI_PS_IN_CONTROL_0 */
> -       0x00000000, /* SPI_PS_IN_CONTROL_1 */
> -       0x00000000, /* SPI_INTERP_CONTROL_0 */
> -       0x00000000, /* SPI_INPUT_Z */
> -       0x00000000, /* SPI_FOG_CNTL */
> -       0x00100000, /* SPI_BARYC_CNTL */
> -       0x00000000, /* SPI_PS_IN_CONTROL_2 */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -       0x00000000, /*  */
> -
> -       0xc0026900,
> -       0x00000316,
> -       0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
> -       0x00000010, /*  */
> -};
> -
> -const u32 evergreen_default_size = ARRAY_SIZE(evergreen_default_state);
> diff --git a/drivers/gpu/drm/radeon/evergreen_blit_shaders.h b/drivers/gpu/drm/radeon/evergreen_blit_shaders.h
> index bb8d6c751595..4492524ee1df 100644
> --- a/drivers/gpu/drm/radeon/evergreen_blit_shaders.h
> +++ b/drivers/gpu/drm/radeon/evergreen_blit_shaders.h
> @@ -20,16 +20,284 @@
>   * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>   * DEALINGS IN THE SOFTWARE.
>   *
> + * Authors:
> + *     Alex Deucher <alexander.deucher@amd.com>
>   */
>
>  #ifndef EVERGREEN_BLIT_SHADERS_H
>  #define EVERGREEN_BLIT_SHADERS_H
>
> -extern const u32 evergreen_ps[];
> -extern const u32 evergreen_vs[];
> -extern const u32 evergreen_default_state[];
> +/*
> + * evergreen cards need to use the 3D engine to blit data which requires
> + * quite a bit of hw state setup.  Rather than pull the whole 3D driver
> + * (which normally generates the 3D state) into the DRM, we opt to use
> + * statically generated state tables.  The register state and shaders
> + * were hand generated to support blitting functionality.  See the 3D
> + * driver or documentation for descriptions of the registers and
> + * shader instructions.
> + */
> +
> +static const u32 evergreen_default_state[] = {
> +       0xc0016900,
> +       0x0000023b,
> +       0x00000000, /* SQ_LDS_ALLOC_PS */
> +
> +       0xc0066900,
> +       0x00000240,
> +       0x00000000, /* SQ_ESGS_RING_ITEMSIZE */
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +
> +       0xc0046900,
> +       0x00000247,
> +       0x00000000, /* SQ_GS_VERT_ITEMSIZE */
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +
> +       0xc0026900,
> +       0x00000010,
> +       0x00000000, /* DB_Z_INFO */
> +       0x00000000, /* DB_STENCIL_INFO */
> +
> +       0xc0016900,
> +       0x00000200,
> +       0x00000000, /* DB_DEPTH_CONTROL */
> +
> +       0xc0066900,
> +       0x00000000,
> +       0x00000060, /* DB_RENDER_CONTROL */
> +       0x00000000, /* DB_COUNT_CONTROL */
> +       0x00000000, /* DB_DEPTH_VIEW */
> +       0x0000002a, /* DB_RENDER_OVERRIDE */
> +       0x00000000, /* DB_RENDER_OVERRIDE2 */
> +       0x00000000, /* DB_HTILE_DATA_BASE */
> +
> +       0xc0026900,
> +       0x0000000a,
> +       0x00000000, /* DB_STENCIL_CLEAR */
> +       0x00000000, /* DB_DEPTH_CLEAR */
> +
> +       0xc0016900,
> +       0x000002dc,
> +       0x0000aa00, /* DB_ALPHA_TO_MASK */
> +
> +       0xc0016900,
> +       0x00000080,
> +       0x00000000, /* PA_SC_WINDOW_OFFSET */
> +
> +       0xc00d6900,
> +       0x00000083,
> +       0x0000ffff, /* PA_SC_CLIPRECT_RULE */
> +       0x00000000, /* PA_SC_CLIPRECT_0_TL */
> +       0x20002000, /* PA_SC_CLIPRECT_0_BR */
> +       0x00000000,
> +       0x20002000,
> +       0x00000000,
> +       0x20002000,
> +       0x00000000,
> +       0x20002000,
> +       0xaaaaaaaa, /* PA_SC_EDGERULE */
> +       0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
> +       0x0000000f, /* CB_TARGET_MASK */
> +       0x0000000f, /* CB_SHADER_MASK */
> +
> +       0xc0226900,
> +       0x00000094,
> +       0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
> +       0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x80000000,
> +       0x20002000,
> +       0x00000000, /* PA_SC_VPORT_ZMIN_0 */
> +       0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
> +
> +       0xc0016900,
> +       0x000000d4,
> +       0x00000000, /* SX_MISC */
> +
> +       0xc0026900,
> +       0x00000292,
> +       0x00000000, /* PA_SC_MODE_CNTL_0 */
> +       0x00000000, /* PA_SC_MODE_CNTL_1 */
> +
> +       0xc0106900,
> +       0x00000300,
> +       0x00000000, /* PA_SC_LINE_CNTL */
> +       0x00000000, /* PA_SC_AA_CONFIG */
> +       0x00000005, /* PA_SU_VTX_CNTL */
> +       0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
> +       0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
> +       0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
> +       0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
> +       0x00000000, /* PA_SC_AA_SAMPLE_LOCS_0 */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /* PA_SC_AA_SAMPLE_LOCS_7 */
> +       0xffffffff, /* PA_SC_AA_MASK */
> +
> +       0xc00d6900,
> +       0x00000202,
> +       0x00cc0010, /* CB_COLOR_CONTROL */
> +       0x00000210, /* DB_SHADER_CONTROL */
> +       0x00010000, /* PA_CL_CLIP_CNTL */
> +       0x00000004, /* PA_SU_SC_MODE_CNTL */
> +       0x00000100, /* PA_CL_VTE_CNTL */
> +       0x00000000, /* PA_CL_VS_OUT_CNTL */
> +       0x00000000, /* PA_CL_NANINF_CNTL */
> +       0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
> +       0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
> +       0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /* SQ_DYN_GPR_RESOURCE_LIMIT_1 */
> +
> +       0xc0066900,
> +       0x000002de,
> +       0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +
> +       0xc0016900,
> +       0x00000229,
> +       0x00000000, /* SQ_PGM_START_FS */
> +
> +       0xc0016900,
> +       0x0000022a,
> +       0x00000000, /* SQ_PGM_RESOURCES_FS */
> +
> +       0xc0096900,
> +       0x00000100,
> +       0x00ffffff, /* VGT_MAX_VTX_INDX */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /* SX_ALPHA_TEST_CONTROL */
> +       0x00000000, /* CB_BLEND_RED */
> +       0x00000000, /* CB_BLEND_GREEN */
> +       0x00000000, /* CB_BLEND_BLUE */
> +       0x00000000, /* CB_BLEND_ALPHA */
> +
> +       0xc0026900,
> +       0x000002a8,
> +       0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
> +       0x00000000, /*  */
> +
> +       0xc0026900,
> +       0x000002ad,
> +       0x00000000, /* VGT_REUSE_OFF */
> +       0x00000000, /*  */
> +
> +       0xc0116900,
> +       0x00000280,
> +       0x00000000, /* PA_SU_POINT_SIZE */
> +       0x00000000, /* PA_SU_POINT_MINMAX */
> +       0x00000008, /* PA_SU_LINE_CNTL */
> +       0x00000000, /* PA_SC_LINE_STIPPLE */
> +       0x00000000, /* VGT_OUTPUT_PATH_CNTL */
> +       0x00000000, /* VGT_HOS_CNTL */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /* VGT_GS_MODE */
> +
> +       0xc0016900,
> +       0x000002a1,
> +       0x00000000, /* VGT_PRIMITIVEID_EN */
> +
> +       0xc0016900,
> +       0x000002a5,
> +       0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
> +
> +       0xc0016900,
> +       0x000002d5,
> +       0x00000000, /* VGT_SHADER_STAGES_EN */
> +
> +       0xc0026900,
> +       0x000002e5,
> +       0x00000000, /* VGT_STRMOUT_CONFIG */
> +       0x00000000, /*  */
> +
> +       0xc0016900,
> +       0x000001e0,
> +       0x00000000, /* CB_BLEND0_CONTROL */
> +
> +       0xc0016900,
> +       0x000001b1,
> +       0x00000000, /* SPI_VS_OUT_CONFIG */
> +
> +       0xc0016900,
> +       0x00000187,
> +       0x00000000, /* SPI_VS_OUT_ID_0 */
> +
> +       0xc0016900,
> +       0x00000191,
> +       0x00000100, /* SPI_PS_INPUT_CNTL_0 */
> +
> +       0xc00b6900,
> +       0x000001b3,
> +       0x20000001, /* SPI_PS_IN_CONTROL_0 */
> +       0x00000000, /* SPI_PS_IN_CONTROL_1 */
> +       0x00000000, /* SPI_INTERP_CONTROL_0 */
> +       0x00000000, /* SPI_INPUT_Z */
> +       0x00000000, /* SPI_FOG_CNTL */
> +       0x00100000, /* SPI_BARYC_CNTL */
> +       0x00000000, /* SPI_PS_IN_CONTROL_2 */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +       0x00000000, /*  */
> +
> +       0xc0026900,
> +       0x00000316,
> +       0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
> +       0x00000010, /*  */
> +};
>
> -extern const u32 evergreen_ps_size, evergreen_vs_size;
> -extern const u32 evergreen_default_size;
> +static const u32 evergreen_default_size = ARRAY_SIZE(evergreen_default_state);
>
>  #endif
> --
> 2.27.0
>
