Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99C96F8854
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 20:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A5F10E64C;
	Fri,  5 May 2023 18:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5A810E64C;
 Fri,  5 May 2023 18:01:07 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-38e975c853cso710959b6e.2; 
 Fri, 05 May 2023 11:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683309666; x=1685901666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B00icdVAYt2ktgWKMQFDcw/OogjubZz86h13RrHqmL0=;
 b=Ea//3QOLV0mngS7dZjEuWCHuDNxEI7jBz5YnwWUqOmswHnSaoehY4lenq25dhAr763
 VvkSc2TIDO7w1pjTVvQ2ZoQ/8HgLhuVgB6EU7D8bIsbefCH1kQH+YNuJlcRVenbhYW1y
 T6Q87ur9RjsfFbAd5NpdIIcZmnSuWZ29Jgv5XFy6mauwQr8+HmmJGnqokJSwFbryV3Nx
 1cxjMFzJTukEXerm+g9c1u7jCYS7aK/lPWPO0lUswRe41PLQVSrmVZmmDHc/uwniE8ze
 aULLBU68cJGnkL9iatPvtAxz70N277+ZVc5G5sasMH0cxcMGLRz2BNP6Dn6iwBax85W1
 ZXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683309666; x=1685901666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B00icdVAYt2ktgWKMQFDcw/OogjubZz86h13RrHqmL0=;
 b=d7dXO6x5dZEdQpEnAv2eOMhM3n3MCYwmF+VLq6IRnJ9I6Ncc+D1iD8Zv+33Ol2skhG
 ppeyagWPNtigAufrc98buVzo64RHDlUq3/k6IsLx6Ht8swVH7xzKqFFQlR/5FISLD+h3
 WXsrhtA6gVd7Jr1jEAaydl3zR07gPg07+ANqjlYlWzoDNnhy4q9b84rWwzlgOROXj5Mg
 8rLjahxP59sk7XgdFH+iax0Iwn8zfPabTuaSWkjkYPHnEXYs9Y6jwP7Tlh2PXPIw+Qt4
 bigeODF7a9nz11MW2gp0tr9W3ACrdRKEFvlcNab10/kONnfARuTZHpewnnMBMYrJtAPk
 3hFA==
X-Gm-Message-State: AC+VfDwqfraV4+VoYxm7ajMVHJeuzrk1p+1I0lQXLfaL7Qr33H/xrVPL
 /YRN40wbqMu99vc4zdl/WRIE1tVXA4wKycbzssA=
X-Google-Smtp-Source: ACHHUZ6PGLpH/SgDECA5rCxYbHeePShHavOMM/3ESqW+myDSg61xkAze6Z0xdX0bnA6HxT2YpIBn0BNjH2LiTxe/SX8=
X-Received: by 2002:a05:6808:652:b0:38c:6d8:b78e with SMTP id
 z18-20020a056808065200b0038c06d8b78emr972996oih.40.1683309665895; Fri, 05 May
 2023 11:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230505113233.3813801-1-chenhuacai@loongson.cn>
 <c4146636-2321-b271-b480-b8693169c119@amd.com>
 <70129238-a589-1d70-a7f2-50a35b4ee897@xen0n.name>
In-Reply-To: <70129238-a589-1d70-a7f2-50a35b4ee897@xen0n.name>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 May 2023 14:00:54 -0400
Message-ID: <CADnq5_N+G5M6OkT-exM_Bot7OXPopVax5hyLERoTRb70ns8v0w@mail.gmail.com>
Subject: Re: [PATCH V2] drm/amdgpu/display: Enable DC_FP for LoongArch
To: WANG Xuerui <kernel@xen0n.name>
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
 dri-devel@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 amd-gfx@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 5, 2023 at 1:57=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wrot=
e:
>
> Hi,
>
> On 5/5/23 21:39, Hamza Mahfooz wrote:
> >
> > Hey Huacai,
> >
> > On 5/5/23 07:32, Huacai Chen wrote:
> >> Now LoongArch provides kernel_fpu_begin() and kernel_fpu_end() in comm=
it
> >> 2b3bd32ea3a22ea2d ("LoongArch: Provide kernel fpu functions"), so we c=
an
> >> enable DC_FP for DCN devices.
> >
> > Have you had the chance to test how well this is working on actual
> > hardware, or was it only compile tested? If it was only compile tested,
> > it would be great if you could run some tests. Please see the following
> > for more details:
> > https://lore.kernel.org/amd-gfx/8eb69dfb-ae35-dbf2-3f82-e8cc00e5389a@am=
d.com/
> >
> >
> Thanks for the helpful link!
>
> I did test an earlier version of this patch along with the
> arch/loongarch kernel FPU bits before that patch got upstreamed, with a
> RX 6400 (BEIGE_GOBY) on a Loongson 3A5000 + LS7A1000 system (by far the
> most popular combination for LoongArch desktops). Things like Plasma
> Wayland session or glmark2 work just fine, although I didn't go for the
> more complete testing as detailed in the mail you linked to. I'll try
> going through that procedure in the next 1~2 days when I have time & get
> physical access to that box.
>
> On a side note, I had to modprobe amdgpu with runpm=3D0, otherwise my
> dmesg gets flooded with PSP getting resumed every 8~10 seconds or so. I
> currently have none of the connectors plugged in. I didn't notice any
> similar reports on the Internet so I don't know if it's due to platform
> quirks or not.

That might just be part of the normal suspend/resume process.  If it
happens at regular intervals, it sounds like something is waking the
GPU at a regular interval.  We should probably remove that message to
avoid it being too chatty, but you may want to check what is waking it
so much as doing so sort of negates the value of runtime power
management.

Alex

>
> >>
> >> Signed-off-by: WANG Xuerui <kernel@xen0n.name>
> >> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> >> ---
> >> V2: Update commit message to add the commit which provides kernel fpu
> >>      functions.
> >>
> >>   drivers/gpu/drm/amd/display/Kconfig            | 2 +-
> >>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 6 ++++--
> >>   drivers/gpu/drm/amd/display/dc/dml/Makefile    | 5 +++++
> >>   3 files changed, 10 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/Kconfig
> >> b/drivers/gpu/drm/amd/display/Kconfig
> >> index 2d8e55e29637..49df073962d5 100644
> >> --- a/drivers/gpu/drm/amd/display/Kconfig
> >> +++ b/drivers/gpu/drm/amd/display/Kconfig
> >> @@ -8,7 +8,7 @@ config DRM_AMD_DC
> >>       depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
> >>       select SND_HDA_COMPONENT if SND_HDA_CORE
> >>       # !CC_IS_CLANG:
> >> https://github.com/ClangBuiltLinux/linux/issues/1752
> >> -    select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 &&
> >> KERNEL_MODE_NEON && !CC_IS_CLANG))
> >> +    select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC)
> >> || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> >>       help
> >>         Choose this option if you want to use the new display engine
> >>         support for AMDGPU. This adds required support for Vega and
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> >> b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> >> index 1743ca0a3641..86f4c0e04654 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> >> @@ -33,6 +33,8 @@
> >>   #include <asm/cputable.h>
> >>   #elif defined(CONFIG_ARM64)
> >>   #include <asm/neon.h>
> >> +#elif defined(CONFIG_LOONGARCH)
> >> +#include <asm/fpu.h>
> >>   #endif
> >>     /**
> >> @@ -88,7 +90,7 @@ void dc_fpu_begin(const char *function_name, const
> >> int line)
> >>       *pcpu +=3D 1;
> >>         if (*pcpu =3D=3D 1) {
> >> -#if defined(CONFIG_X86)
> >> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
> >>           kernel_fpu_begin();
> This is going to conflict with commit b1bcdd409d2d ("drm/amd/display:
> Disable migration to ensure consistency of per-CPU variable"), which is
> present in next-20230505. Resolution is trivial though.
> >>   #elif defined(CONFIG_PPC64)
> >>           if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> >> @@ -127,7 +129,7 @@ void dc_fpu_end(const char *function_name, const
> >> int line)
> >>       pcpu =3D get_cpu_ptr(&fpu_recursion_depth);
> >>       *pcpu -=3D 1;
> >>       if (*pcpu <=3D 0) {
> >> -#if defined(CONFIG_X86)
> >> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
> >>           kernel_fpu_end();
> >>   #elif defined(CONFIG_PPC64)
> >>           if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> >> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> >> b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> >> index 01db035589c5..542962a93e8f 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> >> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> >> @@ -38,6 +38,11 @@ ifdef CONFIG_ARM64
> >>   dml_rcflags :=3D -mgeneral-regs-only
> >>   endif
> >>   +ifdef CONFIG_LOONGARCH
> >> +dml_ccflags :=3D -mfpu=3D64
> >> +dml_rcflags :=3D -msoft-float
> >> +endif
> >> +
> >>   ifdef CONFIG_CC_IS_GCC
> >>   ifneq ($(call gcc-min-version, 70100),y)
> >>   IS_OLD_GCC =3D 1
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
