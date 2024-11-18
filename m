Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E902D9D1463
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 16:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C01B10E4F8;
	Mon, 18 Nov 2024 15:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gM7kPcJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C04B10E4F8;
 Mon, 18 Nov 2024 15:24:21 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2ea4c418488so188887a91.3; 
 Mon, 18 Nov 2024 07:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731943461; x=1732548261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wOmE849PicQbT+9oulDHKGKYeyAbaS3Bbanvj+3n7oI=;
 b=gM7kPcJ66r2k7037opFKpUlwXfB840Lpeok5YS345vYPvbzEm+rCxWbzHM/wOYp1E1
 lO94IfK7oRBlaT3duo4jbQcytzk2rOaSdn1qT9dNML8+F/phsJQLh1aEBHbpt+H/0Egw
 PZ8GZxZ/GcZilf5dY8fSGPd8ldHbOZqA1IWWb/B/NLD1g1gvJmzM83LRhvw0g/BaNksO
 1IekaFKBIvTcvcGH92eR92hRMcYKYIaZ6W0EetU146i1U9mNQTUm94tV46PTPN9KPwFb
 tvx983Pnlh6V9ANTGSPZmPKMf4hEEVpQE5eBc7zrgMd1khDjomaIvR5BNpjiugAgDhkU
 sUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731943461; x=1732548261;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wOmE849PicQbT+9oulDHKGKYeyAbaS3Bbanvj+3n7oI=;
 b=b+hZipyz8+gb+eNWw/MF5ydsVNn69ITFkW6scOy31/o+6kWZ3nyfkfB/5TvatQxhfi
 eMImCC6Yh5Bc6Te9qQ3Me80DkK9gkuDNXe5vkd7wE6bmRq/um/ou1lBMaOq1r3SCaouq
 6swMYeal1+K+Hz0B8YB4zJifO/R8EyQOL8hzIQ/bO2WgtZ7oKE38MOwCO+MiiuMhukqV
 O7nwq98nvCU/T4Lr82e9uIb78FDuDAXb9hqFeL+V/RpkfpPGlW5J7eQx9RNpMKZisRZy
 WhbhNbmjjUYEttipzdzRav4aG7FENetQ1HfIeaM/ef+dKXIQgsOU9F8KL9g69+myUxI8
 C7NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeD5ELgZHOAqd+PuokbO9SQFR4opNgqNNbF/q8Zmj5bZAHG+0uJ8qnsLfH9+RLAKZ4wQ3ogardpKpt@lists.freedesktop.org,
 AJvYcCW8IBS93FBZLVm6IBnmsMHcaaIU/ZWvBvpd1Qlm/wuhEddmvqGJWBdrwpGR3Bf8tJdnQeFUi7MV@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7oMRscR7Ddy30q4KV+nF02tN9ob8KXoGS8L8+OSco6EmyVZW0
 W1h6F6no5BV4SRlWVaKkRYraBwNYL1cwYc6wXHsVQgAoV0B2qOhQQPDW2nDEXH6ngH+oDk6nduk
 6ewec6abchYcKqmlURwMOZc6+/oQ=
X-Gm-Gg: ASbGncsIEAnAurtaRaAuphgkLoemSOSD03QtwMApSmsPqYyNzy2cznDmbfnjO6ARZt7
 ow+uoML1TvRcwEF58iKzTfgPv2DMtsGs=
X-Google-Smtp-Source: AGHT+IGqkDe0U0RfeZTLC7FtrNU1Pq8hO4FwRDeXxvt1ZmPB9/iOrzwF4uX04xGxPULE6KSfLFV1yHJRJEFG/sV5/PM=
X-Received: by 2002:a17:90b:33cc:b0:2ea:956b:deab with SMTP id
 98e67ed59e1d1-2ea956c1e18mr914769a91.4.1731943460945; Mon, 18 Nov 2024
 07:24:20 -0800 (PST)
MIME-Version: 1.0
References: <20241115150225.2812054-1-chenhuacai@loongson.cn>
In-Reply-To: <20241115150225.2812054-1-chenhuacai@loongson.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Nov 2024 10:24:09 -0500
Message-ID: <CADnq5_PiizZmsQ6NW6rY=sLzUGKWTk_VmMiBoKk353H2KVO2mw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Allow building DC with clang on LoongArch
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: David Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui.Pan@amd.com, Huacai Chen <chenhuacai@kernel.org>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Rui Wang <wangrui@loongson.cn>
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

Applied.  Thanks.

Alex

On Fri, Nov 15, 2024 at 8:19=E2=80=AFPM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> Clang on LoongArch (18+) appears to be unaffected by the bug causing
> excessive stack usage in calculate_bandwidth(). But when building DC_FP
> support the stack frame size can be as large as 2816 bytes, which causes
> the FRAME_WARN build warnings. So on LoongArch we allow building DC with
> clang, but disable DC_FP by default.
>
> The help message is also updated.
>
> Tested-by: Rui Wang <wangrui@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/gpu/drm/amd/display/Kconfig | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/di=
splay/Kconfig
> index df17e79c45c7..11e3f2f3b174 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -7,20 +7,21 @@ menu "Display Engine Configuration"
>  config DRM_AMD_DC
>         bool "AMD DC - Enable new display engine"
>         default y
> -       depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 ||=
 X86_64
> +       depends on BROKEN || !CC_IS_CLANG || ARM64 || LOONGARCH || RISCV =
|| SPARC64 || X86_64
>         select SND_HDA_COMPONENT if SND_HDA_CORE
>         # !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1=
752
> -       select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && !(CC_IS_CL=
ANG && (ARM64 || RISCV))
> +       select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && !(CC_IS_CL=
ANG && (ARM64 || LOONGARCH || RISCV))
>         help
>           Choose this option if you want to use the new display engine
>           support for AMDGPU. This adds required support for Vega and
>           Raven ASICs.
>
> -         calculate_bandwidth() is presently broken on all !(X86_64 || SP=
ARC64 || ARM64)
> -         architectures built with Clang (all released versions), whereby=
 the stack
> -         frame gets blown up to well over 5k.  This would cause an immed=
iate kernel
> -         panic on most architectures.  We'll revert this when the follow=
ing bug report
> -         has been resolved: https://github.com/llvm/llvm-project/issues/=
41896.
> +         calculate_bandwidth() is presently broken on all !(X86_64 || SP=
ARC64 ||
> +         ARM64 || LOONGARCH || RISCV) architectures built with Clang (al=
l released
> +         versions), whereby the stack frame gets blown up to well over 5=
k.  This
> +         would cause an immediate kernel panic on most architectures.  W=
e'll revert
> +         this when the following bug report has been resolved:
> +         https://github.com/llvm/llvm-project/issues/41896.
>
>  config DRM_AMD_DC_FP
>         def_bool n
> --
> 2.43.5
>
