Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70180A13D82
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 16:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8897A10E9AB;
	Thu, 16 Jan 2025 15:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fc9Y8Fmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E5910E9A7;
 Thu, 16 Jan 2025 15:18:13 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2ee9b1a2116so225471a91.3; 
 Thu, 16 Jan 2025 07:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737040693; x=1737645493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJm0r90NwoqgwUPhDVQmEXd7HO7a18pIi0V5sfq4N7Y=;
 b=fc9Y8FmiLkpjw1PHwlZeMR/IcfG3GyHUQ7y/lnIYiWcT6KO/UI+I2mQX6yyy2Z+9KJ
 HcPwZsAQItHhp/VPeoTbXUcONqrwGZ1ocJmrT079g7miM92zhogNcKgulu0I3kYpmglU
 g0SoJjtQw20Yyg1kCqnTrxTsCdJ6FEwZYLkSrijnjJ2ueaDuJZGC13YzaG2VxPs1cShz
 nGkNihrNA/hlp6HutPA2gOpzIublUP24iyrR93JTIFiVxEpVyiPmiE+qm6GynvKA2Z1S
 hPR9J4IDZ7Ck0uiRzIrP2hLf+0/Aw2hoF4dJtKh8jhoX8/VzeQ7tbC/1EKbqau7jPEV4
 vN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737040693; x=1737645493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zJm0r90NwoqgwUPhDVQmEXd7HO7a18pIi0V5sfq4N7Y=;
 b=imnZOboQf4/4PnUeskBpZsUReTgdid3AHbqb8c5wEahVnHiA/zfgrrrUsodTRORLE9
 vZ2AmE/1GvNvrth1wa/Wq7FQgq6j6w9ktVihU4Zec3r5WD8mYbDKTzdcSlb0ySTwvOIO
 oIz2XR7mOJDIjLDpPPOAFRTpRncxZI6xJu8ak/utQqhvbI80FKtHmyjW61p6R+rDoFlQ
 oDIbc3ZESKhrgrGrsXgRPqcQw7DltYlbiZpnk2v/88LE6QBpMruIObJ+uaj8XFPkUccQ
 71ta40UsQe8MwIGlYdIB+H2SYJf6BP4/zoly/GDfLrzVKJAEU2+kFvB2/VCfzdrS5AZb
 2SlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA40w/EUK75Y8xwQ9PNia0mjZ5seUUCtP2ZkD8Vs8VFyn2cr1MUghLH+Ly/n5kXqvKZkRxvNH5bvti@lists.freedesktop.org,
 AJvYcCWLVhK+BSP9I9h9f6s1+P5GNqYYOJHQKGtmmS9+3NI/5xWlswSJvH66yk8gd5MyvwZXXJBeqzTt@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyv4sfvCt264jYQlSIIXX+U8TcVCUWIFg7zhPSHsVlYnNhZUnvv
 v0LXCtIfXny31m/GlxQuMHTviNjWEGw1qr4CAhDdH4MaivshoJ3oWRHsVe4Td5TIVVTqx+PyGWn
 pLSZYwfKO7/194biYd3buNwOU+5w=
X-Gm-Gg: ASbGncvGmXzzSu09iPwvzVtOAMmVQzVXwSunV50NJb+tBpWJEpOWl62DF7Syb+E+CTh
 hkz6egohuYsDZn441TQbCpdElgLqz0ilse8i8bg==
X-Google-Smtp-Source: AGHT+IHeljAcJviN6u9sbzSiGScxHYRkryL9ZA2HNxuad5Avq/5ytEMDjPcHxwrtZcq6xpXdzfrSsti0hwMkG3em5sQ=
X-Received: by 2002:a17:90b:2808:b0:2ea:bb3a:8f09 with SMTP id
 98e67ed59e1d1-2f548db69e5mr17476719a91.0.1737040692693; Thu, 16 Jan 2025
 07:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20250109053504.2998728-1-tzungbi@kernel.org>
 <20250116144049.GA1810277@ax162>
In-Reply-To: <20250116144049.GA1810277@ax162>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Jan 2025 10:18:01 -0500
X-Gm-Features: AbW1kvZkSaymwon3Pq9eKEJtpfIVCKqNoRHYFPKs1E90g7MwCjklpIvJPlWoY6k
Message-ID: <CADnq5_MkWwW2B_8jgJJVbj+7pqyePc3cQznwPvwpHUwT2J40nA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: mark static functions noinline_for_stack
To: Nathan Chancellor <nathan@kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, chaitanya.dhere@amd.com,
 jun.lei@amd.com, 
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, ndesaulniers@google.com, morbo@google.com, 
 justinstitt@google.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev
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

On Thu, Jan 16, 2025 at 9:47=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Tzung-Bi,
>
> First of all, thanks for the patch!
>
> On Thu, Jan 09, 2025 at 05:35:04AM +0000, Tzung-Bi Shih wrote:
> > When compiling allmodconfig (CONFIG_WERROR=3Dy) with clang-19, see the
> > following errors:
> >
> > .../display/dc/dml2/display_mode_core.c:6268:13: warning: stack frame s=
ize (3128) exceeds limit (3072) in 'dml_prefetch_check' [-Wframe-larger-tha=
n]
> > .../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:7236:13:=
 warning: stack frame size (3256) exceeds limit (3072) in 'dml_core_mode_su=
pport' [-Wframe-larger-than]
> >
> > Mark static functions called by dml_prefetch_check() and
> > dml_core_mode_support() noinline_for_stack to avoid them become huge
> > functions and thus exceed the frame size limit.
>
> So I fixed these particular instances by hiding them when certain
> sanitizers are enabled:
>
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/e4479aecf6581af81bc09=
08575447878d2a07e01
>
> However, there are still reports of the regular 2048 limit being hit
> with certain configurations such as LTO (the issue number is somewhat
> funny given the situation):
>
> https://github.com/ClangBuiltLinux/linux/issues/2048
>
> So I think it would be a good idea for the AMD folks to consider
> applying this patch as well.

Sure.  Applied.  Thanks.

Alex

>
> > A way to reproduce:
> > $ git checkout next-20250107
> > $ mkdir build_dir
> > $ export PATH=3D/tmp/llvm-19.1.6-x86_64/bin:$PATH
> > $ make LLVM=3D1 O=3Dbuild_dir allmodconfig
> > $ make LLVM=3D1 O=3Dbuild_dir drivers/gpu/drm/ -j
> >
> > The way how it chose static functions to mark:
> > [0] Unset CONFIG_WERROR in build_dir/.config.
> > To get display_mode_core.o without errors.
> >
> > [1] Get a function list called by dml_prefetch_check().
> > $ sed -n '6268,6711p' drivers/gpu/drm/amd/display/dc/dml2/display_mode_=
core.c \
> >   | sed -n -r 's/.*\W(\w+)\(.*/\1/p' | sort -u >/tmp/syms
> >
> > [2] Get the non-inline function list.
> > Objdump won't show the symbols if they are inline functions.
> >
> > $ make LLVM=3D1 O=3Dbuild_dir drivers/gpu/drm/ -j
> > $ objdump -d build_dir/.../display_mode_core.o | \
> >   ./scripts/checkstack.pl x86_64 0 | \
> >   grep -f /tmp/syms | cut -d' ' -f2- >/tmp/orig
> >
> > [3] Get the full function list.
> > Append "-fno-inline" to `CFLAGS_.../display_mode_core.o` in
> > drivers/gpu/drm/amd/display/dc/dml2/Makefile.
> >
> > $ make LLVM=3D1 O=3Dbuild_dir drivers/gpu/drm/ -j
> > $ objdump -d build_dir/.../display_mode_core.o | \
> >   ./scripts/checkstack.pl x86_64 0 | \
> >   grep -f /tmp/syms | cut -d' ' -f2- >/tmp/noinline
> >
> > [4] Get the inline function list.
> > If a symbol only in /tmp/noinline but not in /tmp/orig, it is a good
> > candidate to mark noinline.
> >
> > $ diff /tmp/orig /tmp/noinline
> >
> > Chosen functions and their stack sizes:
> > CalculateBandwidthAvailableForImmediateFlip [display_mode_core.o]:144
> > CalculateExtraLatency [display_mode_core.o]:176
> > CalculateTWait [display_mode_core.o]:64
> > CalculateVActiveBandwithSupport [display_mode_core.o]:112
> > set_calculate_prefetch_schedule_params [display_mode_core.o]:48
> >
> > CheckGlobalPrefetchAdmissibility [dml2_core_dcn4_calcs.o]:544
> > calculate_bandwidth_available [dml2_core_dcn4_calcs.o]:320
> > calculate_vactive_det_fill_latency [dml2_core_dcn4_calcs.o]:272
> > CalculateDCFCLKDeepSleep [dml2_core_dcn4_calcs.o]:208
> > CalculateODMMode [dml2_core_dcn4_calcs.o]:208
> > CalculateOutputLink [dml2_core_dcn4_calcs.o]:176
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> >  .../gpu/drm/amd/display/dc/dml2/display_mode_core.c  | 12 ++++++------
> >  .../dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c  | 12 ++++++------
> >  2 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/=
drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> > index 35bc917631ae..84a2de9a76d4 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> > @@ -1736,7 +1736,7 @@ static void CalculateBytePerPixelAndBlockSizes(
> >  #endif
> >  } // CalculateBytePerPixelAndBlockSizes
> >
> > -static dml_float_t CalculateTWait(
> > +static noinline_for_stack dml_float_t CalculateTWait(
> >               dml_uint_t PrefetchMode,
> >               enum dml_use_mall_for_pstate_change_mode UseMALLForPState=
Change,
> >               dml_bool_t SynchronizeDRRDisplaysForUCLKPStateChangeFinal=
,
> > @@ -4458,7 +4458,7 @@ static void CalculateSwathWidth(
> >       }
> >  } // CalculateSwathWidth
> >
> > -static  dml_float_t CalculateExtraLatency(
> > +static noinline_for_stack dml_float_t CalculateExtraLatency(
> >               dml_uint_t RoundTripPingLatencyCycles,
> >               dml_uint_t ReorderingBytes,
> >               dml_float_t DCFCLK,
> > @@ -5915,7 +5915,7 @@ static dml_uint_t DSCDelayRequirement(
> >       return DSCDelayRequirement_val;
> >  }
> >
> > -static dml_bool_t CalculateVActiveBandwithSupport(dml_uint_t NumberOfA=
ctiveSurfaces,
> > +static noinline_for_stack dml_bool_t CalculateVActiveBandwithSupport(d=
ml_uint_t NumberOfActiveSurfaces,
> >                                                                        =
       dml_float_t ReturnBW,
> >                                                                        =
       dml_bool_t NotUrgentLatencyHiding[],
> >                                                                        =
       dml_float_t ReadBandwidthLuma[],
> > @@ -6019,7 +6019,7 @@ static void CalculatePrefetchBandwithSupport(
> >  #endif
> >  }
> >
> > -static dml_float_t CalculateBandwidthAvailableForImmediateFlip(
> > +static noinline_for_stack dml_float_t CalculateBandwidthAvailableForIm=
mediateFlip(
> >                                                                        =
                               dml_uint_t NumberOfActiveSurfaces,
> >                                                                        =
                               dml_float_t ReturnBW,
> >                                                                        =
                               dml_float_t ReadBandwidthLuma[],
> > @@ -6213,7 +6213,7 @@ static dml_uint_t CalculateMaxVStartup(
> >       return max_vstartup_lines;
> >  }
> >
> > -static void set_calculate_prefetch_schedule_params(struct display_mode=
_lib_st *mode_lib,
> > +static noinline_for_stack void set_calculate_prefetch_schedule_params(=
struct display_mode_lib_st *mode_lib,
> >                                                  struct CalculatePrefet=
chSchedule_params_st *CalculatePrefetchSchedule_params,
> >                                                  dml_uint_t j,
> >                                                  dml_uint_t k)
> > @@ -6265,7 +6265,7 @@ static void set_calculate_prefetch_schedule_param=
s(struct display_mode_lib_st *m
> >                               CalculatePrefetchSchedule_params->Tno_bw =
=3D &mode_lib->ms.Tno_bw[k];
> >  }
> >
> > -static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
> > +static noinline_for_stack void dml_prefetch_check(struct display_mode_=
lib_st *mode_lib)
> >  {
> >       struct dml_core_mode_support_locals_st *s =3D &mode_lib->scratch.=
dml_core_mode_support_locals;
> >       struct CalculatePrefetchSchedule_params_st *CalculatePrefetchSche=
dule_params =3D &mode_lib->scratch.CalculatePrefetchSchedule_params;
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dm=
l2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_c=
ore/dml2_core_dcn4_calcs.c
> > index b9ec243cf9ba..7fffca67ca9d 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core=
_dcn4_calcs.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core=
_dcn4_calcs.c
> > @@ -2778,7 +2778,7 @@ static double dml_get_return_bandwidth_available(
> >       return return_bw_mbps;
> >  }
> >
> > -static void calculate_bandwidth_available(
> > +static noinline_for_stack void calculate_bandwidth_available(
> >       double avg_bandwidth_available_min[dml2_core_internal_soc_state_m=
ax],
> >       double avg_bandwidth_available[dml2_core_internal_soc_state_max][=
dml2_core_internal_bw_max],
> >       double urg_bandwidth_available_min[dml2_core_internal_soc_state_m=
ax], // min between SDP and DRAM
> > @@ -3531,7 +3531,7 @@ static void CalculateUrgentBurstFactor(
> >
> >  }
> >
> > -static void CalculateDCFCLKDeepSleep(
> > +static noinline_for_stack void CalculateDCFCLKDeepSleep(
> >       const struct dml2_display_cfg *display_cfg,
> >       unsigned int NumberOfActiveSurfaces,
> >       unsigned int BytePerPixelY[],
> > @@ -4076,7 +4076,7 @@ static bool ValidateODMMode(enum dml2_odm_mode OD=
MMode,
> >       return true;
> >  }
> >
> > -static void CalculateODMMode(
> > +static noinline_for_stack void CalculateODMMode(
> >       unsigned int MaximumPixelsPerLinePerDSCUnit,
> >       unsigned int HActive,
> >       enum dml2_output_format_class OutFormat,
> > @@ -4173,7 +4173,7 @@ static void CalculateODMMode(
> >  #endif
> >  }
> >
> > -static void CalculateOutputLink(
> > +static noinline_for_stack void CalculateOutputLink(
> >       struct dml2_core_internal_scratch *s,
> >       double PHYCLK,
> >       double PHYCLKD18,
> > @@ -5928,7 +5928,7 @@ static double calculate_impacted_Tsw(unsigned int=
 exclude_plane_idx, unsigned in
> >  }
> >
> >  // a global check against the aggregate effect of the per plane prefet=
ch schedule
> > -static bool CheckGlobalPrefetchAdmissibility(struct dml2_core_internal=
_scratch *scratch,
> > +static noinline_for_stack bool CheckGlobalPrefetchAdmissibility(struct=
 dml2_core_internal_scratch *scratch,
> >                                                                        =
                struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_par=
ams *p)
> >  {
> >       struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_locals *s=
 =3D &scratch->CheckGlobalPrefetchAdmissibility_locals;
> > @@ -6941,7 +6941,7 @@ static void calculate_bytes_to_fetch_required_to_=
hide_latency(
> >       }
> >  }
> >
> > -static void calculate_vactive_det_fill_latency(
> > +static noinline_for_stack void calculate_vactive_det_fill_latency(
> >               const struct dml2_display_cfg *display_cfg,
> >               unsigned int num_active_planes,
> >               unsigned int bytes_required_l[],
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
