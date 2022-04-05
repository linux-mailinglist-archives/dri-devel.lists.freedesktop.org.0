Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8F54F345A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259A510E910;
	Tue,  5 Apr 2022 13:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5F410E910;
 Tue,  5 Apr 2022 13:31:37 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id i7so13387634oie.7;
 Tue, 05 Apr 2022 06:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vY5pnIVo4eMwYUxCKVBQEcU9CNBIJau33Z1kUJk3f8U=;
 b=VdhCFVGbEdIrzpupJeCw1NzlfY9wBZdFbfbu3+kCDlUcGNISJCGsIeFFPkTdhWjBkQ
 s9RALUSZlw0T+ZJvFL2+msfIfzw1M0MESEqQx4dlsGTasUr3o/Cxa19UraCYeZ6tvM1x
 8bSJL+gbPhdLenoHRcRbtBJzeLYFyItmiKRXRiRM+i/41cA2GQ7lB7QqlXk9Orgmiw+6
 B/yn9JNws7VgAS+Xhms0qw+nBpr9sohLiO4wvBv5iIk5owVAE/HKS4AEbKhGtIW8RbBb
 kNwAactyDqV75U4EV0+sRTXB61O1jZEDTGawj407qg51C9pemT+Bz4DUkbuA32zdrLX/
 3Huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vY5pnIVo4eMwYUxCKVBQEcU9CNBIJau33Z1kUJk3f8U=;
 b=NEvsiPkDBGowQR4rEEo93dxHHiAAt7kzFiDraO1byWAnh4FbnjHc22FZ26RrjSd/rO
 vuqHC0fGdi5GWP0aPQqcEtT+K3EPhHmwSnUlaqhCirYBVqMMej1R6YIJm5JPOIATyC7W
 ytvxztE5MIVHy+uZZDx4x6CBDYD3dTUYd5ROcwyBGCIT7k086/twKFEdIoWclU6Paw95
 c9SsBaYtrF2z/pvaXHuinLJg5Dzkr6ZsT/FncP8g0V98yartTR6prePaD/Zn5zgn5u3E
 VyeQcH/YyMuSwIlnZpFunxn2XF1Lp8GjmAcw8IyWNH/S7o6M9bBtx+aTffqSmSuQ+oFx
 OgUQ==
X-Gm-Message-State: AOAM533v/NuDtaFVpel+JPuqvJccD1IdbRJrNuqCaLZ31Qo+HrMfNEUI
 XpwwlY+yyIgOPIp5QfilraxHFvzjCtj8xBcYgkE=
X-Google-Smtp-Source: ABdhPJyFbNu/RPLyemQp74RS6faMAniKPthkodVRC0uqD0x7oqTVVtSD+Fij1L/x/Yt0nf8dqyrhF1YF7584hdpzzp4=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr1319256oic.200.1649165496142; Tue, 05
 Apr 2022 06:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220404225710.972071-1-trix@redhat.com>
 <65f33162-74ff-f205-aea9-3ed84dfddde1@amd.com>
In-Reply-To: <65f33162-74ff-f205-aea9-3ed84dfddde1@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Apr 2022 09:31:24 -0400
Message-ID: <CADnq5_PfddyoVibWBXrhTgJ5K=2FHBuhbWN1FFV-TMCTgqnW_A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/radeon: change si_default_state table from global
 to static
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Tom Rix <trix@redhat.com>,
 xinhui pan <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Apr 5, 2022 at 2:04 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 05.04.22 um 00:57 schrieb Tom Rix:
> > Smatch reports these issues
> > si_blit_shaders.c:31:11: warning: symbol 'si_default_state'
> >    was not declared. Should it be static?
> > si_blit_shaders.c:253:11: warning: symbol 'si_default_size'
> >    was not declared. Should it be static?
> >
> > Both symbols are only used in si.c.  Single file symbols
> > should be static.  So move the definition of
> > si_default_state and si_default_size to si_blit_shader.h
> > and change their storage-class-specifier to static.
> >
> > Remove unneeded si_blit_shader.c
> >
> > Signed-off-by: Tom Rix <trix@redhat.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> > v2: move definitions to header
> >
> >   drivers/gpu/drm/radeon/Makefile          |   2 +-
> >   drivers/gpu/drm/radeon/si_blit_shaders.c | 253 ----------------------=
-
> >   drivers/gpu/drm/radeon/si_blit_shaders.h | 223 +++++++++++++++++++-
> >   3 files changed, 222 insertions(+), 256 deletions(-)
> >   delete mode 100644 drivers/gpu/drm/radeon/si_blit_shaders.c
> >
> > diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/M=
akefile
> > index 11c97edde54d..664381f4eb07 100644
> > --- a/drivers/gpu/drm/radeon/Makefile
> > +++ b/drivers/gpu/drm/radeon/Makefile
> > @@ -44,7 +44,7 @@ radeon-y +=3D radeon_device.o radeon_asic.o radeon_km=
s.o \
> >       evergreen.o evergreen_cs.o evergreen_blit_shaders.o \
> >       evergreen_hdmi.o radeon_trace_points.o ni.o cayman_blit_shaders.o=
 \
> >       atombios_encoders.o radeon_semaphore.o radeon_sa.o atombios_i2c.o=
 si.o \
> > -     si_blit_shaders.o radeon_prime.o cik.o cik_blit_shaders.o \
> > +     radeon_prime.o cik.o cik_blit_shaders.o \
> >       r600_dpm.o rs780_dpm.o rv6xx_dpm.o rv770_dpm.o rv730_dpm.o rv740_=
dpm.o \
> >       rv770_smc.o cypress_dpm.o btc_dpm.o sumo_dpm.o sumo_smc.o trinity=
_dpm.o \
> >       trinity_smc.o ni_dpm.o si_smc.o si_dpm.o kv_smc.o kv_dpm.o ci_smc=
.o \
> > diff --git a/drivers/gpu/drm/radeon/si_blit_shaders.c b/drivers/gpu/drm=
/radeon/si_blit_shaders.c
> > deleted file mode 100644
> > index ec415e7dfa4b..000000000000
> > --- a/drivers/gpu/drm/radeon/si_blit_shaders.c
> > +++ /dev/null
> > @@ -1,253 +0,0 @@
> > -/*
> > - * Copyright 2011 Advanced Micro Devices, Inc.
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions=
:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * THE COPYRIGHT HOLDER(S) AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAI=
M, DAMAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR OTHER
> > - * DEALINGS IN THE SOFTWARE.
> > - *
> > - * Authors:
> > - *     Alex Deucher <alexander.deucher@amd.com>
> > - */
> > -
> > -#include <linux/types.h>
> > -#include <linux/bug.h>
> > -#include <linux/kernel.h>
> > -
> > -const u32 si_default_state[] =3D
> > -{
> > -     0xc0066900,
> > -     0x00000000,
> > -     0x00000060, /* DB_RENDER_CONTROL */
> > -     0x00000000, /* DB_COUNT_CONTROL */
> > -     0x00000000, /* DB_DEPTH_VIEW */
> > -     0x0000002a, /* DB_RENDER_OVERRIDE */
> > -     0x00000000, /* DB_RENDER_OVERRIDE2 */
> > -     0x00000000, /* DB_HTILE_DATA_BASE */
> > -
> > -     0xc0046900,
> > -     0x00000008,
> > -     0x00000000, /* DB_DEPTH_BOUNDS_MIN */
> > -     0x00000000, /* DB_DEPTH_BOUNDS_MAX */
> > -     0x00000000, /* DB_STENCIL_CLEAR */
> > -     0x00000000, /* DB_DEPTH_CLEAR */
> > -
> > -     0xc0036900,
> > -     0x0000000f,
> > -     0x00000000, /* DB_DEPTH_INFO */
> > -     0x00000000, /* DB_Z_INFO */
> > -     0x00000000, /* DB_STENCIL_INFO */
> > -
> > -     0xc0016900,
> > -     0x00000080,
> > -     0x00000000, /* PA_SC_WINDOW_OFFSET */
> > -
> > -     0xc00d6900,
> > -     0x00000083,
> > -     0x0000ffff, /* PA_SC_CLIPRECT_RULE */
> > -     0x00000000, /* PA_SC_CLIPRECT_0_TL */
> > -     0x20002000, /* PA_SC_CLIPRECT_0_BR */
> > -     0x00000000,
> > -     0x20002000,
> > -     0x00000000,
> > -     0x20002000,
> > -     0x00000000,
> > -     0x20002000,
> > -     0xaaaaaaaa, /* PA_SC_EDGERULE */
> > -     0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
> > -     0x0000000f, /* CB_TARGET_MASK */
> > -     0x0000000f, /* CB_SHADER_MASK */
> > -
> > -     0xc0226900,
> > -     0x00000094,
> > -     0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
> > -     0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x80000000,
> > -     0x20002000,
> > -     0x00000000, /* PA_SC_VPORT_ZMIN_0 */
> > -     0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
> > -
> > -     0xc0026900,
> > -     0x000000d9,
> > -     0x00000000, /* CP_RINGID */
> > -     0x00000000, /* CP_VMID */
> > -
> > -     0xc0046900,
> > -     0x00000100,
> > -     0xffffffff, /* VGT_MAX_VTX_INDX */
> > -     0x00000000, /* VGT_MIN_VTX_INDX */
> > -     0x00000000, /* VGT_INDX_OFFSET */
> > -     0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
> > -
> > -     0xc0046900,
> > -     0x00000105,
> > -     0x00000000, /* CB_BLEND_RED */
> > -     0x00000000, /* CB_BLEND_GREEN */
> > -     0x00000000, /* CB_BLEND_BLUE */
> > -     0x00000000, /* CB_BLEND_ALPHA */
> > -
> > -     0xc0016900,
> > -     0x000001e0,
> > -     0x00000000, /* CB_BLEND0_CONTROL */
> > -
> > -     0xc00e6900,
> > -     0x00000200,
> > -     0x00000000, /* DB_DEPTH_CONTROL */
> > -     0x00000000, /* DB_EQAA */
> > -     0x00cc0010, /* CB_COLOR_CONTROL */
> > -     0x00000210, /* DB_SHADER_CONTROL */
> > -     0x00010000, /* PA_CL_CLIP_CNTL */
> > -     0x00000004, /* PA_SU_SC_MODE_CNTL */
> > -     0x00000100, /* PA_CL_VTE_CNTL */
> > -     0x00000000, /* PA_CL_VS_OUT_CNTL */
> > -     0x00000000, /* PA_CL_NANINF_CNTL */
> > -     0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
> > -     0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
> > -     0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
> > -     0x00000000, /*  */
> > -     0x00000000, /*  */
> > -
> > -     0xc0116900,
> > -     0x00000280,
> > -     0x00000000, /* PA_SU_POINT_SIZE */
> > -     0x00000000, /* PA_SU_POINT_MINMAX */
> > -     0x00000008, /* PA_SU_LINE_CNTL */
> > -     0x00000000, /* PA_SC_LINE_STIPPLE */
> > -     0x00000000, /* VGT_OUTPUT_PATH_CNTL */
> > -     0x00000000, /* VGT_HOS_CNTL */
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000, /* VGT_GS_MODE */
> > -
> > -     0xc0026900,
> > -     0x00000292,
> > -     0x00000000, /* PA_SC_MODE_CNTL_0 */
> > -     0x00000000, /* PA_SC_MODE_CNTL_1 */
> > -
> > -     0xc0016900,
> > -     0x000002a1,
> > -     0x00000000, /* VGT_PRIMITIVEID_EN */
> > -
> > -     0xc0016900,
> > -     0x000002a5,
> > -     0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
> > -
> > -     0xc0026900,
> > -     0x000002a8,
> > -     0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
> > -     0x00000000,
> > -
> > -     0xc0026900,
> > -     0x000002ad,
> > -     0x00000000, /* VGT_REUSE_OFF */
> > -     0x00000000,
> > -
> > -     0xc0016900,
> > -     0x000002d5,
> > -     0x00000000, /* VGT_SHADER_STAGES_EN */
> > -
> > -     0xc0016900,
> > -     0x000002dc,
> > -     0x0000aa00, /* DB_ALPHA_TO_MASK */
> > -
> > -     0xc0066900,
> > -     0x000002de,
> > -     0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -
> > -     0xc0026900,
> > -     0x000002e5,
> > -     0x00000000, /* VGT_STRMOUT_CONFIG */
> > -     0x00000000,
> > -
> > -     0xc01b6900,
> > -     0x000002f5,
> > -     0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
> > -     0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
> > -     0x00000000, /* PA_SC_LINE_CNTL */
> > -     0x00000000, /* PA_SC_AA_CONFIG */
> > -     0x00000005, /* PA_SU_VTX_CNTL */
> > -     0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
> > -     0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
> > -     0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
> > -     0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
> > -     0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0x00000000,
> > -     0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
> > -     0xffffffff,
> > -
> > -     0xc0026900,
> > -     0x00000316,
> > -     0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
> > -     0x00000010, /*  */
> > -};
> > -
> > -const u32 si_default_size =3D ARRAY_SIZE(si_default_state);
> > diff --git a/drivers/gpu/drm/radeon/si_blit_shaders.h b/drivers/gpu/drm=
/radeon/si_blit_shaders.h
> > index c739e51e3961..829a2b6228b7 100644
> > --- a/drivers/gpu/drm/radeon/si_blit_shaders.h
> > +++ b/drivers/gpu/drm/radeon/si_blit_shaders.h
> > @@ -25,8 +25,227 @@
> >   #ifndef SI_BLIT_SHADERS_H
> >   #define SI_BLIT_SHADERS_H
> >
> > -extern const u32 si_default_state[];
> > +static const u32 si_default_state[] =3D {
> > +     0xc0066900,
> > +     0x00000000,
> > +     0x00000060, /* DB_RENDER_CONTROL */
> > +     0x00000000, /* DB_COUNT_CONTROL */
> > +     0x00000000, /* DB_DEPTH_VIEW */
> > +     0x0000002a, /* DB_RENDER_OVERRIDE */
> > +     0x00000000, /* DB_RENDER_OVERRIDE2 */
> > +     0x00000000, /* DB_HTILE_DATA_BASE */
> >
> > -extern const u32 si_default_size;
> > +     0xc0046900,
> > +     0x00000008,
> > +     0x00000000, /* DB_DEPTH_BOUNDS_MIN */
> > +     0x00000000, /* DB_DEPTH_BOUNDS_MAX */
> > +     0x00000000, /* DB_STENCIL_CLEAR */
> > +     0x00000000, /* DB_DEPTH_CLEAR */
> > +
> > +     0xc0036900,
> > +     0x0000000f,
> > +     0x00000000, /* DB_DEPTH_INFO */
> > +     0x00000000, /* DB_Z_INFO */
> > +     0x00000000, /* DB_STENCIL_INFO */
> > +
> > +     0xc0016900,
> > +     0x00000080,
> > +     0x00000000, /* PA_SC_WINDOW_OFFSET */
> > +
> > +     0xc00d6900,
> > +     0x00000083,
> > +     0x0000ffff, /* PA_SC_CLIPRECT_RULE */
> > +     0x00000000, /* PA_SC_CLIPRECT_0_TL */
> > +     0x20002000, /* PA_SC_CLIPRECT_0_BR */
> > +     0x00000000,
> > +     0x20002000,
> > +     0x00000000,
> > +     0x20002000,
> > +     0x00000000,
> > +     0x20002000,
> > +     0xaaaaaaaa, /* PA_SC_EDGERULE */
> > +     0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
> > +     0x0000000f, /* CB_TARGET_MASK */
> > +     0x0000000f, /* CB_SHADER_MASK */
> > +
> > +     0xc0226900,
> > +     0x00000094,
> > +     0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
> > +     0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x80000000,
> > +     0x20002000,
> > +     0x00000000, /* PA_SC_VPORT_ZMIN_0 */
> > +     0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
> > +
> > +     0xc0026900,
> > +     0x000000d9,
> > +     0x00000000, /* CP_RINGID */
> > +     0x00000000, /* CP_VMID */
> > +
> > +     0xc0046900,
> > +     0x00000100,
> > +     0xffffffff, /* VGT_MAX_VTX_INDX */
> > +     0x00000000, /* VGT_MIN_VTX_INDX */
> > +     0x00000000, /* VGT_INDX_OFFSET */
> > +     0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
> > +
> > +     0xc0046900,
> > +     0x00000105,
> > +     0x00000000, /* CB_BLEND_RED */
> > +     0x00000000, /* CB_BLEND_GREEN */
> > +     0x00000000, /* CB_BLEND_BLUE */
> > +     0x00000000, /* CB_BLEND_ALPHA */
> > +
> > +     0xc0016900,
> > +     0x000001e0,
> > +     0x00000000, /* CB_BLEND0_CONTROL */
> > +
> > +     0xc00e6900,
> > +     0x00000200,
> > +     0x00000000, /* DB_DEPTH_CONTROL */
> > +     0x00000000, /* DB_EQAA */
> > +     0x00cc0010, /* CB_COLOR_CONTROL */
> > +     0x00000210, /* DB_SHADER_CONTROL */
> > +     0x00010000, /* PA_CL_CLIP_CNTL */
> > +     0x00000004, /* PA_SU_SC_MODE_CNTL */
> > +     0x00000100, /* PA_CL_VTE_CNTL */
> > +     0x00000000, /* PA_CL_VS_OUT_CNTL */
> > +     0x00000000, /* PA_CL_NANINF_CNTL */
> > +     0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
> > +     0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
> > +     0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
> > +     0x00000000, /*  */
> > +     0x00000000, /*  */
> > +
> > +     0xc0116900,
> > +     0x00000280,
> > +     0x00000000, /* PA_SU_POINT_SIZE */
> > +     0x00000000, /* PA_SU_POINT_MINMAX */
> > +     0x00000008, /* PA_SU_LINE_CNTL */
> > +     0x00000000, /* PA_SC_LINE_STIPPLE */
> > +     0x00000000, /* VGT_OUTPUT_PATH_CNTL */
> > +     0x00000000, /* VGT_HOS_CNTL */
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000, /* VGT_GS_MODE */
> > +
> > +     0xc0026900,
> > +     0x00000292,
> > +     0x00000000, /* PA_SC_MODE_CNTL_0 */
> > +     0x00000000, /* PA_SC_MODE_CNTL_1 */
> > +
> > +     0xc0016900,
> > +     0x000002a1,
> > +     0x00000000, /* VGT_PRIMITIVEID_EN */
> > +
> > +     0xc0016900,
> > +     0x000002a5,
> > +     0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
> > +
> > +     0xc0026900,
> > +     0x000002a8,
> > +     0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
> > +     0x00000000,
> > +
> > +     0xc0026900,
> > +     0x000002ad,
> > +     0x00000000, /* VGT_REUSE_OFF */
> > +     0x00000000,
> > +
> > +     0xc0016900,
> > +     0x000002d5,
> > +     0x00000000, /* VGT_SHADER_STAGES_EN */
> > +
> > +     0xc0016900,
> > +     0x000002dc,
> > +     0x0000aa00, /* DB_ALPHA_TO_MASK */
> > +
> > +     0xc0066900,
> > +     0x000002de,
> > +     0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +
> > +     0xc0026900,
> > +     0x000002e5,
> > +     0x00000000, /* VGT_STRMOUT_CONFIG */
> > +     0x00000000,
> > +
> > +     0xc01b6900,
> > +     0x000002f5,
> > +     0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
> > +     0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
> > +     0x00000000, /* PA_SC_LINE_CNTL */
> > +     0x00000000, /* PA_SC_AA_CONFIG */
> > +     0x00000005, /* PA_SU_VTX_CNTL */
> > +     0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
> > +     0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
> > +     0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
> > +     0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
> > +     0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0x00000000,
> > +     0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
> > +     0xffffffff,
> > +
> > +     0xc0026900,
> > +     0x00000316,
> > +     0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
> > +     0x00000010, /*  */
> > +};
> > +
> > +static const u32 si_default_size =3D ARRAY_SIZE(si_default_state);
> >
> >   #endif
>
