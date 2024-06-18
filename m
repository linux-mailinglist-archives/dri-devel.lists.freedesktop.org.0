Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D890DE70
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 23:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081CF10E7CD;
	Tue, 18 Jun 2024 21:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eRqtnJ6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E001B10E7CD;
 Tue, 18 Jun 2024 21:32:36 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-70436048c25so4617976b3a.0; 
 Tue, 18 Jun 2024 14:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718746356; x=1719351156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0F2GFRylmsUf8qCCMvo7ZfErHvVg5KnaNyTwWf+ackU=;
 b=eRqtnJ6ZHfBMpp1T4gAWe+a17Ku9H1wDY/LZr4E59NR0nLm9bWZg8ms4IiyBi44xvW
 nu98BxzwvuSWgISZvIl2kxqEdStlJnTc4x8bF9geHhXSJc2UFHHpXRpWbzFIKXqtdUr2
 t187Ec77IdORhteGgNT4hHKUT05EgdTWymmJVwUpwPBZxGQGrvy4Dg/s0fUzFsLyYJ6P
 VBAXMXLWqoZeMxogMNau4cFGJP7WE1rLrR4h9VJjQG55osydoluWHPidV9HSOeo87YvJ
 KqVCukM9StTh6QVJC2HVuAiLndLk2SilL1jvxPB2EkroOo0DGqxsari/gMSiGk23vbJI
 ZeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746356; x=1719351156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0F2GFRylmsUf8qCCMvo7ZfErHvVg5KnaNyTwWf+ackU=;
 b=wk5kYRdKIoioxBIlA0AlKWpzC65tV+4AdWo+hi1cVV7rDr2TwX7vFkVRdadGtS/r9j
 zWSZ0ej1mQ80hCzPLZDdK2oynZ4LmeahFz8NZQ4qEinkrG8tFS9zBsvldXN8qA7+dLkQ
 4Gu0BNQnkHatJCn7i7iy68Zu+D6KHBxnZesXFb5OEdewrzgzkTGoI7E1M3AnFYcrAm7l
 t7T37H5xXXq8VQS69nVslgAIU/NcGZ1kWe3lNAEmuUNwl7vKz7j36l6D8AHadDAdKsIA
 oCjmB73vyvln+lZqt6V7K1Cj9i26uam+493Py39Qu0eSxxz2Cgq7YDCwwqlYEF3ZQjJb
 3a4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbMBOkFmEYiIkBIFU8DEbf5CjWieC5Ye+x2SBJpx71DpTeb8GtVXz+YRBPNwQv4C/59NqYGOwPmIk6uh4g1WpxiLWvsDfnanWWyVz/ZVLtU511bYBREg6QcxYVSPJOiygGDzc0whokocUg9C/LGw==
X-Gm-Message-State: AOJu0YwjhVZL/nZ3gFmWFybgFrd0Tjf5bVch+fKJaQirQvKzFPW08hqG
 TbBVwjT+bG4vja0fvtfUsIpKXs1o4CaAxW8V3zeJYQaWkTFZ261LKRdpT7l+CX2Wrhjef1Zn1wZ
 PIZ0BK2AEg7SsaZpAq/ESwW8BIK4=
X-Google-Smtp-Source: AGHT+IFIYnRfv9OexIBisPO8GJODl0YW0GErnOlBNhmoJ+53el0v0LQ+XytbXr/0FiI9zYwRjX6PFplolAaJccvUk80=
X-Received: by 2002:a17:90b:344f:b0:2c2:faf7:67a0 with SMTP id
 98e67ed59e1d1-2c7b5c725a6mr924947a91.16.1718746356201; Tue, 18 Jun 2024
 14:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240614-amdgpu-disable-drm-amd-dc-fp-riscv-clang-v1-1-a6d40617dc9b@kernel.org>
 <58253c2e-25a2-48c6-bcd4-5bc3bbe03296@amd.com>
In-Reply-To: <58253c2e-25a2-48c6-bcd4-5bc3bbe03296@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 18 Jun 2024 17:32:24 -0400
Message-ID: <CADnq5_Ox_Ak9XedYNPchxMh-AKuLRG1_V8YqpiEB=ke8130B5A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Disable CONFIG_DRM_AMD_DC_FP for RISC-V
 with clang
To: Harry Wentland <harry.wentland@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Palmer Dabbelt <palmer@rivosinc.com>
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

On Tue, Jun 18, 2024 at 10:17=E2=80=AFAM Harry Wentland <harry.wentland@amd=
.com> wrote:
>
>
>
> On 2024-06-14 15:54, Nathan Chancellor wrote:
> > Commit 77acc6b55ae4 ("riscv: add support for kernel-mode FPU") and
> > commit a28e4b672f04 ("drm/amd/display: use ARCH_HAS_KERNEL_FPU_SUPPORT"=
)
> > enabled support for CONFIG_DRM_AMD_DC_FP with RISC-V. Unfortunately,
> > this exposed -Wframe-larger-than warnings (which become fatal with
> > CONFIG_WERROR=3Dy) when building ARCH=3Driscv allmodconfig with clang:
> >
> >   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_3=
2.c:58:13: error: stack frame size (2448) exceeds limit (2048) in 'DISPCLKD=
PPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' =
[-Werror,-Wframe-larger-than]
> >      58 | static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWat=
ermarksAndPerformanceCalculation(
> >         |             ^
> >   1 error generated.
> >
> > Many functions in this file use a large number of parameters, which mus=
t
> > be passed on the stack at a certain pointer due to register exhaustion,
> > which can cause high stack usage when inlining and issues with stack
> > slot analysis get involved. While the compiler can and should do better
> > (as GCC uses less than half the amount of stack space for the same
> > function), it is not as simple as a fix as adjusting the functions not
> > to take a large number of parameters.
> >
> > Unfortunately, modifying these files to avoid the problem is a difficul=
t
> > to justify approach because any revisions to the files in the kernel
> > tree never make it back to the original source (so copies of the code
> > for newer hardware revisions just reintroduce the issue) and the files
> > are hard to read/modify due to being "gcc-parsable HW gospel, coming
> > straight from HW engineers".
> >
> > Avoid building the problematic code for RISC-V by modifying the existin=
g
> > condition for arm64 that exists for the same reason. Factor out the
> > logical not to make the condition a little more readable naturally.
> >
> > Fixes: a28e4b672f04 ("drm/amd/display: use ARCH_HAS_KERNEL_FPU_SUPPORT"=
)
> > Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Closes: https://lore.kernel.org/20240530145741.7506-2-palmer@rivosinc.c=
om/
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  drivers/gpu/drm/amd/display/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/=
display/Kconfig
> > index 5fcd4f778dc3..47b8b49da8a7 100644
> > --- a/drivers/gpu/drm/amd/display/Kconfig
> > +++ b/drivers/gpu/drm/amd/display/Kconfig
> > @@ -8,7 +8,7 @@ config DRM_AMD_DC
> >       depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 ||=
 X86_64
> >       select SND_HDA_COMPONENT if SND_HDA_CORE
> >       # !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1=
752
> > -     select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && (!ARM64 ||=
 !CC_IS_CLANG)
> > +     select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && !(CC_IS_CL=
ANG && (ARM64 || RISCV))
>
> Thanks for also making the logic easier to parse.
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> >       help
> >         Choose this option if you want to use the new display engine
> >         support for AMDGPU. This adds required support for Vega and
> >
> > ---
> > base-commit: c6c4dd54012551cce5cde408b35468f2c62b0cce
> > change-id: 20240614-amdgpu-disable-drm-amd-dc-fp-riscv-clang-31c84f6b99=
0d
> >
> > Best regards,
>
