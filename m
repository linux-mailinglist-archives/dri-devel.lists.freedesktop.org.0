Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7D650E691
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 19:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6A010EEDC;
	Mon, 25 Apr 2022 17:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22F710EEDC;
 Mon, 25 Apr 2022 17:09:23 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id e189so17803974oia.8;
 Mon, 25 Apr 2022 10:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=agiOT3wgJVFMYbdcsV7LK5VqExZdpD5q9nayOeJ35eA=;
 b=VAebXaFOiZefPVeEJulXLboE4EXNx/LIkWpC4z5tKUZ2CLqgGi38dTuUCScRuI32V2
 j/FYDEb4KhO0AuD047R0JH6gB1brdYygv+VXihVRqibeFgHfimd2hQnOzRCN4ftAYRsV
 m9oHFEpV2b6iaFw6/4tWTbDu8e2CcTkZBuQyKwGqnE1U+bDty/jy5sQNc0HqI9yZX6aT
 +xOfSGXkLWOCF3zBIP1LtP/ov7kktYnQImTiaMQEuEo/gVUKH04JVX9xP7oo4gbA90oX
 z5S4cMl4zCsMkJkhpTvjBtuDmNdJld1qxfGxaJEQCQk2w/O1bhQv3VMvSiXbplDyZsxk
 TLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=agiOT3wgJVFMYbdcsV7LK5VqExZdpD5q9nayOeJ35eA=;
 b=kBKMnradrEDHdFpWG/SjglouSeSAcHL5sB1gBVEAaOL0SePJN20PwMNRLWk05VKCXz
 ikYz+1ZSiJ8B1i0Idf6EutukMel//R+D6Tf6WPUKqFRFSFlIJ1jDtj0DH3y2IiDxqoRo
 h2Og+oV4FPxv1oC+nPzYyCYNTnqh0CMNJwxBaBR3/spuNHKU+zyCtnF4yxJye6VnXEeF
 axopqngKvztoWKhmDkEONmQqrIbRKiCs3mdOl8EbDjP7WjXX2q2tJpnlhtbhWgks7eZl
 1U2eVWfqKszxRpFRXQbv0t3GkwxgnSNuzSlK0XcQeRp59PDM/yP9daSwcqhVIxFjo+VS
 h/IA==
X-Gm-Message-State: AOAM531uu8kKGWROMXfHlf3QbF4UyHslPzGzV/Lg+pEQyb/7g+AuQOeD
 kEjH63o4UzCyJF1AAcQeuEcgMe7/CJ3cMST0SJU=
X-Google-Smtp-Source: ABdhPJyh4YRobOipXYcDa/VrMVz3jxMkRXTzoE9kqY/Y7+AyFpamU4DF5P1gRRYsmYAY+VlPGLrDMDWIYSDbthWo7EI=
X-Received: by 2002:aca:3d88:0:b0:321:141:ce0b with SMTP id
 k130-20020aca3d88000000b003210141ce0bmr12346839oia.200.1650906563242; Mon, 25
 Apr 2022 10:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220423134402.3726385-1-trix@redhat.com>
In-Reply-To: <20220423134402.3726385-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Apr 2022 13:09:11 -0400
Message-ID: <CADnq5_OPPF41=FHGEvWLmMjuKAGAF1pf9MrMnFmZq8OpbW-oCA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: change cik_default_state table from global to
 static
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

On Sat, Apr 23, 2022 at 9:44 AM Tom Rix <trix@redhat.com> wrote:
>
> Sparse reports these issues
> cik_blit_shaders.c:31:11: warning: symbol 'cik_default_state' was not declared. Should it be static?
> cik_blit_shaders.c:246:11: warning: symbol 'cik_default_size' was not declared. Should it be static?
>
> cik_default_state and cik_default_size are only used in cik.c. Single file symbols
> should be static. So move their definitions to cik_blit_shaders.h and change their
> storage-class-specifier to static.
>
> Remove unneeded cik_blit_shader.c
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/Makefile           |   2 +-
>  drivers/gpu/drm/radeon/cik_blit_shaders.c | 246 ----------------------
>  drivers/gpu/drm/radeon/cik_blit_shaders.h | 219 ++++++++++++++++++-
>  3 files changed, 218 insertions(+), 249 deletions(-)
>  delete mode 100644 drivers/gpu/drm/radeon/cik_blit_shaders.c
>
> diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
> index 1045d2c46a76..ea5380e24c3c 100644
> --- a/drivers/gpu/drm/radeon/Makefile
> +++ b/drivers/gpu/drm/radeon/Makefile
> @@ -44,7 +44,7 @@ radeon-y += radeon_device.o radeon_asic.o radeon_kms.o \
>         evergreen.o evergreen_cs.o \
>         evergreen_hdmi.o radeon_trace_points.o ni.o \
>         atombios_encoders.o radeon_semaphore.o radeon_sa.o atombios_i2c.o si.o \
> -       radeon_prime.o cik.o cik_blit_shaders.o \
> +       radeon_prime.o cik.o \
>         r600_dpm.o rs780_dpm.o rv6xx_dpm.o rv770_dpm.o rv730_dpm.o rv740_dpm.o \
>         rv770_smc.o cypress_dpm.o btc_dpm.o sumo_dpm.o sumo_smc.o trinity_dpm.o \
>         trinity_smc.o ni_dpm.o si_smc.o si_dpm.o kv_smc.o kv_dpm.o ci_smc.o \
> diff --git a/drivers/gpu/drm/radeon/cik_blit_shaders.c b/drivers/gpu/drm/radeon/cik_blit_shaders.c
> deleted file mode 100644
> index ff1311806e91..000000000000
> --- a/drivers/gpu/drm/radeon/cik_blit_shaders.c
> +++ /dev/null
> @@ -1,246 +0,0 @@
> -/*
> - * Copyright 2012 Advanced Micro Devices, Inc.
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
> -#include <linux/types.h>
> -#include <linux/bug.h>
> -#include <linux/kernel.h>
> -
> -const u32 cik_default_state[] =
> -{
> -       0xc0066900,
> -       0x00000000,
> -       0x00000060, /* DB_RENDER_CONTROL */
> -       0x00000000, /* DB_COUNT_CONTROL */
> -       0x00000000, /* DB_DEPTH_VIEW */
> -       0x0000002a, /* DB_RENDER_OVERRIDE */
> -       0x00000000, /* DB_RENDER_OVERRIDE2 */
> -       0x00000000, /* DB_HTILE_DATA_BASE */
> -
> -       0xc0046900,
> -       0x00000008,
> -       0x00000000, /* DB_DEPTH_BOUNDS_MIN */
> -       0x00000000, /* DB_DEPTH_BOUNDS_MAX */
> -       0x00000000, /* DB_STENCIL_CLEAR */
> -       0x00000000, /* DB_DEPTH_CLEAR */
> -
> -       0xc0036900,
> -       0x0000000f,
> -       0x00000000, /* DB_DEPTH_INFO */
> -       0x00000000, /* DB_Z_INFO */
> -       0x00000000, /* DB_STENCIL_INFO */
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
> -       0xc0046900,
> -       0x00000100,
> -       0xffffffff, /* VGT_MAX_VTX_INDX */
> -       0x00000000, /* VGT_MIN_VTX_INDX */
> -       0x00000000, /* VGT_INDX_OFFSET */
> -       0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
> -
> -       0xc0046900,
> -       0x00000105,
> -       0x00000000, /* CB_BLEND_RED */
> -       0x00000000, /* CB_BLEND_GREEN */
> -       0x00000000, /* CB_BLEND_BLUE */
> -       0x00000000, /* CB_BLEND_ALPHA */
> -
> -       0xc0016900,
> -       0x000001e0,
> -       0x00000000, /* CB_BLEND0_CONTROL */
> -
> -       0xc00c6900,
> -       0x00000200,
> -       0x00000000, /* DB_DEPTH_CONTROL */
> -       0x00000000, /* DB_EQAA */
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
> -
> -       0xc0116900,
> -       0x00000280,
> -       0x00000000, /* PA_SU_POINT_SIZE */
> -       0x00000000, /* PA_SU_POINT_MINMAX */
> -       0x00000008, /* PA_SU_LINE_CNTL */
> -       0x00000000, /* PA_SC_LINE_STIPPLE */
> -       0x00000000, /* VGT_OUTPUT_PATH_CNTL */
> -       0x00000000, /* VGT_HOS_CNTL */
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000, /* VGT_GS_MODE */
> -
> -       0xc0026900,
> -       0x00000292,
> -       0x00000000, /* PA_SC_MODE_CNTL_0 */
> -       0x00000000, /* PA_SC_MODE_CNTL_1 */
> -
> -       0xc0016900,
> -       0x000002a1,
> -       0x00000000, /* VGT_PRIMITIVEID_EN */
> -
> -       0xc0016900,
> -       0x000002a5,
> -       0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
> -
> -       0xc0026900,
> -       0x000002a8,
> -       0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
> -       0x00000000,
> -
> -       0xc0026900,
> -       0x000002ad,
> -       0x00000000, /* VGT_REUSE_OFF */
> -       0x00000000,
> -
> -       0xc0016900,
> -       0x000002d5,
> -       0x00000000, /* VGT_SHADER_STAGES_EN */
> -
> -       0xc0016900,
> -       0x000002dc,
> -       0x0000aa00, /* DB_ALPHA_TO_MASK */
> -
> -       0xc0066900,
> -       0x000002de,
> -       0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -
> -       0xc0026900,
> -       0x000002e5,
> -       0x00000000, /* VGT_STRMOUT_CONFIG */
> -       0x00000000,
> -
> -       0xc01b6900,
> -       0x000002f5,
> -       0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
> -       0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
> -       0x00000000, /* PA_SC_LINE_CNTL */
> -       0x00000000, /* PA_SC_AA_CONFIG */
> -       0x00000005, /* PA_SU_VTX_CNTL */
> -       0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
> -       0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
> -       0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
> -       0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
> -       0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0x00000000,
> -       0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
> -       0xffffffff,
> -
> -       0xc0026900,
> -       0x00000316,
> -       0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
> -       0x00000010, /*  */
> -};
> -
> -const u32 cik_default_size = ARRAY_SIZE(cik_default_state);
> diff --git a/drivers/gpu/drm/radeon/cik_blit_shaders.h b/drivers/gpu/drm/radeon/cik_blit_shaders.h
> index dfe7314f9ff4..d2a2e2316814 100644
> --- a/drivers/gpu/drm/radeon/cik_blit_shaders.h
> +++ b/drivers/gpu/drm/radeon/cik_blit_shaders.h
> @@ -20,13 +20,228 @@
>   * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>   * DEALINGS IN THE SOFTWARE.
>   *
> + * Authors:
> + *     Alex Deucher <alexander.deucher@amd.com>
>   */
>
>  #ifndef CIK_BLIT_SHADERS_H
>  #define CIK_BLIT_SHADERS_H
>
> -extern const u32 cik_default_state[];
> +static const u32 cik_default_state[] =
> +{
> +       0xc0066900,
> +       0x00000000,
> +       0x00000060, /* DB_RENDER_CONTROL */
> +       0x00000000, /* DB_COUNT_CONTROL */
> +       0x00000000, /* DB_DEPTH_VIEW */
> +       0x0000002a, /* DB_RENDER_OVERRIDE */
> +       0x00000000, /* DB_RENDER_OVERRIDE2 */
> +       0x00000000, /* DB_HTILE_DATA_BASE */
>
> -extern const u32 cik_default_size;
> +       0xc0046900,
> +       0x00000008,
> +       0x00000000, /* DB_DEPTH_BOUNDS_MIN */
> +       0x00000000, /* DB_DEPTH_BOUNDS_MAX */
> +       0x00000000, /* DB_STENCIL_CLEAR */
> +       0x00000000, /* DB_DEPTH_CLEAR */
> +
> +       0xc0036900,
> +       0x0000000f,
> +       0x00000000, /* DB_DEPTH_INFO */
> +       0x00000000, /* DB_Z_INFO */
> +       0x00000000, /* DB_STENCIL_INFO */
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
> +       0xc0046900,
> +       0x00000100,
> +       0xffffffff, /* VGT_MAX_VTX_INDX */
> +       0x00000000, /* VGT_MIN_VTX_INDX */
> +       0x00000000, /* VGT_INDX_OFFSET */
> +       0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
> +
> +       0xc0046900,
> +       0x00000105,
> +       0x00000000, /* CB_BLEND_RED */
> +       0x00000000, /* CB_BLEND_GREEN */
> +       0x00000000, /* CB_BLEND_BLUE */
> +       0x00000000, /* CB_BLEND_ALPHA */
> +
> +       0xc0016900,
> +       0x000001e0,
> +       0x00000000, /* CB_BLEND0_CONTROL */
> +
> +       0xc00c6900,
> +       0x00000200,
> +       0x00000000, /* DB_DEPTH_CONTROL */
> +       0x00000000, /* DB_EQAA */
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
> +
> +       0xc0116900,
> +       0x00000280,
> +       0x00000000, /* PA_SU_POINT_SIZE */
> +       0x00000000, /* PA_SU_POINT_MINMAX */
> +       0x00000008, /* PA_SU_LINE_CNTL */
> +       0x00000000, /* PA_SC_LINE_STIPPLE */
> +       0x00000000, /* VGT_OUTPUT_PATH_CNTL */
> +       0x00000000, /* VGT_HOS_CNTL */
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000, /* VGT_GS_MODE */
> +
> +       0xc0026900,
> +       0x00000292,
> +       0x00000000, /* PA_SC_MODE_CNTL_0 */
> +       0x00000000, /* PA_SC_MODE_CNTL_1 */
> +
> +       0xc0016900,
> +       0x000002a1,
> +       0x00000000, /* VGT_PRIMITIVEID_EN */
> +
> +       0xc0016900,
> +       0x000002a5,
> +       0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
> +
> +       0xc0026900,
> +       0x000002a8,
> +       0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
> +       0x00000000,
> +
> +       0xc0026900,
> +       0x000002ad,
> +       0x00000000, /* VGT_REUSE_OFF */
> +       0x00000000,
> +
> +       0xc0016900,
> +       0x000002d5,
> +       0x00000000, /* VGT_SHADER_STAGES_EN */
> +
> +       0xc0016900,
> +       0x000002dc,
> +       0x0000aa00, /* DB_ALPHA_TO_MASK */
> +
> +       0xc0066900,
> +       0x000002de,
> +       0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +
> +       0xc0026900,
> +       0x000002e5,
> +       0x00000000, /* VGT_STRMOUT_CONFIG */
> +       0x00000000,
> +
> +       0xc01b6900,
> +       0x000002f5,
> +       0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
> +       0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
> +       0x00000000, /* PA_SC_LINE_CNTL */
> +       0x00000000, /* PA_SC_AA_CONFIG */
> +       0x00000005, /* PA_SU_VTX_CNTL */
> +       0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
> +       0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
> +       0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
> +       0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
> +       0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0x00000000,
> +       0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
> +       0xffffffff,
> +
> +       0xc0026900,
> +       0x00000316,
> +       0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
> +       0x00000010, /*  */
> +};
> +
> +static const u32 cik_default_size = ARRAY_SIZE(cik_default_state);
>
>  #endif
> --
> 2.27.0
>
