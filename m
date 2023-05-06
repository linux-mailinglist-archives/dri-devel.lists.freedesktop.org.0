Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7376F90FD
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 11:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D6110E220;
	Sat,  6 May 2023 09:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9C810E21E;
 Sat,  6 May 2023 09:44:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D734B617DA;
 Sat,  6 May 2023 09:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48BE8C433EF;
 Sat,  6 May 2023 09:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683366251;
 bh=s0+RfNWr+TLp1ad23c3839ZRXIqxy+rpgj2HhTOrNlg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hM42AUku2J94Dz5WzmbfH0DMoirBiFdeFb0CbzWmfXp/sIBM+aC+7mPJJoR7T3/+/
 /0iske3I904oqAzHPi3eRCuW1/6E+q40459KwNFXaC0hXptj3MDTNZoQJ1/ZMnW8iz
 8trSD73Yfh6OUcDslY414qxh86UMJv0SyBofOBzLwEcMEfbhG/AZYavbxaNOBFMvnv
 H+abpLFQn2VpzWsIxQBjBJeDALnrKua3jLUdQQNdOgTvQXGOj7d/69+zTCo8MDIJB/
 rD0tRcLTQ1aSpFgiQZqhXji968VktZGpLoL/WNtxlcy+ObcYCV+ZyN09L5Up12A+PN
 mL1l9zg43K+Sw==
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso474795766b.0; 
 Sat, 06 May 2023 02:44:11 -0700 (PDT)
X-Gm-Message-State: AC+VfDydk4zYNPeo4jWUNvlHI5XynoLNsrdblxdY8z9QxKbVjrLbmwoq
 JR0oZQkSuNMxV7ih/QPhL6alVGoPPetOBSxeInM=
X-Google-Smtp-Source: ACHHUZ54iFv1HU2+WzijOjEnOykbKbagnNFBG2BYdzsg+mJ+vVUD1cIPC/thMIqtKN3t2phtiXNjr1CCPwDXGRrLEDE=
X-Received: by 2002:a17:907:3686:b0:94f:2852:1d2b with SMTP id
 bi6-20020a170907368600b0094f28521d2bmr2879598ejc.72.1683366249473; Sat, 06
 May 2023 02:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230505113233.3813801-1-chenhuacai@loongson.cn>
 <c4146636-2321-b271-b480-b8693169c119@amd.com>
In-Reply-To: <c4146636-2321-b271-b480-b8693169c119@amd.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 6 May 2023 17:43:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5jna_XN_b6yj7WrfcX-jMqXmg9wM_8TFPisXgqYyRH8Q@mail.gmail.com>
Message-ID: <CAAhV-H5jna_XN_b6yj7WrfcX-jMqXmg9wM_8TFPisXgqYyRH8Q@mail.gmail.com>
Subject: Re: [PATCH V2] drm/amdgpu/display: Enable DC_FP for LoongArch
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
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
Cc: Pan@freedesktop.org, David Airlie <airlied@linux.ie>,
 Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, WANG Xuerui <kernel@xen0n.name>,
 Xuefeng Li <lixuefeng@loongson.cn>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hamza,

On Fri, May 5, 2023 at 9:37=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.com=
> wrote:
>
>
> Hey Huacai,
>
> On 5/5/23 07:32, Huacai Chen wrote:
> > Now LoongArch provides kernel_fpu_begin() and kernel_fpu_end() in commi=
t
> > 2b3bd32ea3a22ea2d ("LoongArch: Provide kernel fpu functions"), so we ca=
n
> > enable DC_FP for DCN devices.
>
> Have you had the chance to test how well this is working on actual
> hardware, or was it only compile tested? If it was only compile tested,
> it would be great if you could run some tests. Please see the following
> for more details:
> https://lore.kernel.org/amd-gfx/8eb69dfb-ae35-dbf2-3f82-e8cc00e5389a@amd.=
com/
I have tested hotplug, resolution changing and kms_flip in IGT, all of
them works fine.

Huacai
>
> >
> > Signed-off-by: WANG Xuerui <kernel@xen0n.name>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> > V2: Update commit message to add the commit which provides kernel fpu
> >      functions.
> >
> >   drivers/gpu/drm/amd/display/Kconfig            | 2 +-
> >   drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 6 ++++--
> >   drivers/gpu/drm/amd/display/dc/dml/Makefile    | 5 +++++
> >   3 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/=
display/Kconfig
> > index 2d8e55e29637..49df073962d5 100644
> > --- a/drivers/gpu/drm/amd/display/Kconfig
> > +++ b/drivers/gpu/drm/amd/display/Kconfig
> > @@ -8,7 +8,7 @@ config DRM_AMD_DC
> >       depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
> >       select SND_HDA_COMPONENT if SND_HDA_CORE
> >       # !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1=
752
> > -     select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && K=
ERNEL_MODE_NEON && !CC_IS_CLANG))
> > +     select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) |=
| (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> >       help
> >         Choose this option if you want to use the new display engine
> >         support for AMDGPU. This adds required support for Vega and
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/g=
pu/drm/amd/display/amdgpu_dm/dc_fpu.c
> > index 1743ca0a3641..86f4c0e04654 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> > @@ -33,6 +33,8 @@
> >   #include <asm/cputable.h>
> >   #elif defined(CONFIG_ARM64)
> >   #include <asm/neon.h>
> > +#elif defined(CONFIG_LOONGARCH)
> > +#include <asm/fpu.h>
> >   #endif
> >
> >   /**
> > @@ -88,7 +90,7 @@ void dc_fpu_begin(const char *function_name, const in=
t line)
> >       *pcpu +=3D 1;
> >
> >       if (*pcpu =3D=3D 1) {
> > -#if defined(CONFIG_X86)
> > +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
> >               kernel_fpu_begin();
> >   #elif defined(CONFIG_PPC64)
> >               if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> > @@ -127,7 +129,7 @@ void dc_fpu_end(const char *function_name, const in=
t line)
> >       pcpu =3D get_cpu_ptr(&fpu_recursion_depth);
> >       *pcpu -=3D 1;
> >       if (*pcpu <=3D 0) {
> > -#if defined(CONFIG_X86)
> > +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
> >               kernel_fpu_end();
> >   #elif defined(CONFIG_PPC64)
> >               if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/=
drm/amd/display/dc/dml/Makefile
> > index 01db035589c5..542962a93e8f 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> > @@ -38,6 +38,11 @@ ifdef CONFIG_ARM64
> >   dml_rcflags :=3D -mgeneral-regs-only
> >   endif
> >
> > +ifdef CONFIG_LOONGARCH
> > +dml_ccflags :=3D -mfpu=3D64
> > +dml_rcflags :=3D -msoft-float
> > +endif
> > +
> >   ifdef CONFIG_CC_IS_GCC
> >   ifneq ($(call gcc-min-version, 70100),y)
> >   IS_OLD_GCC =3D 1
> --
> Hamza
>
