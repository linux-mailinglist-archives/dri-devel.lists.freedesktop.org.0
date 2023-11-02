Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494B17DF93F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 18:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4402210E97B;
	Thu,  2 Nov 2023 17:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C126210E978;
 Thu,  2 Nov 2023 17:57:24 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6ce353df504so634658a34.3; 
 Thu, 02 Nov 2023 10:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698947844; x=1699552644; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Zmxt6jWHSk0ufE+QEoUUpI6OvaXUdy9+PMpDjlbgbE=;
 b=PN7EBf1DOn3XHnJVxtKpZDgahXu5paNBrpJR38pdrm6xKxOk0CBKqxTDx9umgONFZG
 0iNuKGC4Cj9IVrblPnIAzN1FedS5Tss2lLZaOHRa78YWyZ7Tpyff62la+5rakskIz7CY
 LdAqzBOb0TAmuE+N5xHL7sc7mBEUKcawJnvZCW7nkr81dEX74d4529sl4qvd0AzzcAXp
 RFHOrX8bX+eNLJ2iP+4c41Ifvr75LenCeRKCUsJf2EsSKBTTxS6L4EJMviDLr1o70uxR
 ckuXV2hoX8a6CCMwzjTW28dZ5P8yTMlSYZeVgUsLLyV6FaORZIAs3h+M581QA+WQKLV0
 ztTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698947844; x=1699552644;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Zmxt6jWHSk0ufE+QEoUUpI6OvaXUdy9+PMpDjlbgbE=;
 b=LotG7PIn9nDT3Uh4gVJ3W1f4u5dgvyHbghPCFmsK7X+qmGpDxuaFjwyMWq+ewdede7
 JQW4QOI2DknFzpqRAnVHW6oTIAwXPc2zKpNhKe8SGQ20hvFYvYwozFUeXBc8zIKwhwVY
 ur31V/0uqNaFI2sfXzq75nl8k2DhRdqkC/L+FmnbZoIs9BZ5a7eyX2r/ZscYrNGg8Jvt
 Mv3NbdXB/0nG5/Z0SXgGhtJS3fL2BbqkVFIAcoMDNf9/jxul+De8KVrU7agQDV5OYVAr
 zqTNKEGpavUcJtI255CkKP1tL4Oc2DjPaKTEGQbWDb/2yJ8LRV8o6JlbssxXArIudcDH
 itBA==
X-Gm-Message-State: AOJu0YxG7PWYUJpBM1rWHRK31feCxpD2UPtAMHPGuhVhXRw+UGjYdQnk
 8Km3h9TCw/vFzYli/riza/PYJzHelJGAl/jg+Dw=
X-Google-Smtp-Source: AGHT+IEzDqhOut1KREmFrWLe+QG/NITaNhdTFcbHjufmkoxmoYPpZ7zZ11VJWIqQKnQGyX9v9BIiLWnuBQEeAkHRqzQ=
X-Received: by 2002:a05:6870:815:b0:1e9:9c39:a580 with SMTP id
 fw21-20020a056870081500b001e99c39a580mr22766888oab.7.1698947843923; Thu, 02
 Nov 2023 10:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-v2-1-b088a718131a@kernel.org>
In-Reply-To: <20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-v2-1-b088a718131a@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 2 Nov 2023 13:57:12 -0400
Message-ID: <CADnq5_O_V7mxRP4PWv8+M0GaHb42N00NoyQqN-GiX0HKSgaS+A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: Increase frame warning limit with
 KASAN or KCSAN in dml2
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: ndesaulniers@google.com, llvm@lists.linux.dev, sunpeng.li@amd.com,
 trix@redhat.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 2, 2023 at 1:41=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> When building ARCH=3Dx86_64 allmodconfig with clang, which will typically
> have sanitizers enabled, there is a warning about a large stack frame.
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6265:=
13: error: stack frame size (2520) exceeds limit (2048) in 'dml_prefetch_ch=
eck' [-Werror,-Wframe-larger-than]
>    6265 | static void dml_prefetch_check(struct display_mode_lib_st *mode=
_lib)
>         |             ^
>   1 error generated.
>
> Notably, GCC 13.2.0 does not do too much of a better job, as it is right
> at the current limit of 2048 (and others have reported being over with
> older GCC versions):
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In f=
unction 'dml_prefetch_check':
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6705:=
1: error: the frame size of 2048 bytes is larger than 1800 bytes [-Werror=
=3Dframe-larger-than=3D]
>    6705 | }
>         | ^
>
> In the past, these warnings have been avoided by reducing the number of
> parameters to various functions so that not as many arguments need to be
> passed on the stack. However, these patches take a good amount of effort
> to write despite being mechanical due to code structure and complexity
> and they are never carried forward to new generations of the code so
> that effort has to be expended every new hardware generation, which
> becomes harder to justify as time goes on.
>
> To avoid having a noticeable or lengthy breakage in all{mod,yes}config,
> which are easy testing targets that have -Werror enabled, increase the
> limit for configurations that have KASAN or KCSAN enabled by 50% so that
> cases of extremely poor code generation can still be caught while not
> breaking the majority of builds. CONFIG_KMSAN also causes high stack
> usage but the frame limit is already set to zero when it is enabled,
> which is accounted for by the check for CONFIG_FRAME_WARN=3D0 in the dml2
> Makefile.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> If there is another DRM pull before 6.7-rc1, it would be much
> appreciated if this could make that so that other trees are not
> potentially broken by this. If not, no worries, as it was my fault for
> not sending this sooner.

Applied.  Thanks!  Will send out a PR this week.

Alex


>
> Changes in v2:
> - Adjust workaround to check for either CONFIG_KASAN=3Dy or
>   CONFIG_KCSAN=3Dy, as the same problem has been reported with older
>   versions of GCC (Hamza, Alex)
> - Link to v1: https://lore.kernel.org/r/20231102-amdgpu-dml2-increase-fra=
me-size-warning-for-clang-v1-1-6eb157352931@kernel.org
> ---
>  drivers/gpu/drm/amd/display/dc/dml2/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/d=
rm/amd/display/dc/dml2/Makefile
> index 70ae5eba624e..acff3449b8d7 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> @@ -60,8 +60,12 @@ endif
>  endif
>
>  ifneq ($(CONFIG_FRAME_WARN),0)
> +ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> +frame_warn_flag :=3D -Wframe-larger-than=3D3072
> +else
>  frame_warn_flag :=3D -Wframe-larger-than=3D2048
>  endif
> +endif
>
>  CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o :=3D $(dml2_ccflags) $(=
frame_warn_flag)
>  CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_util.o :=3D $(dml2_ccflags)
>
> ---
> base-commit: 21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
> change-id: 20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-c93=
bd2d6a871
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
