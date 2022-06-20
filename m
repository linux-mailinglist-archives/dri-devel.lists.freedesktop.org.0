Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0215526B7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 23:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F2B10F587;
	Mon, 20 Jun 2022 21:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E254810F575;
 Mon, 20 Jun 2022 21:51:15 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id i7so3615916ybe.11;
 Mon, 20 Jun 2022 14:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sUvSwY7fzkVvwkrJKau7P6Rtg0GEC3gaUzaRsvmBnVI=;
 b=ILUNrsu30NJIhDF1k7PJ3fvzXNJjzVHn7WoYFV3QIt5tEZAkik7gdDlgA7jTvZw5PU
 g2KS7DjGnvWIIgS0/e8lSDN1qMGxnCRxa+IsALItHSOTETC+JQZBfL4qpBxn5zDs2kJf
 gD6TtteXLLJK0ErUX4hLvrdVsvv9El7ksayYn2ZBMgccOek2n9KjZep7fxg+7PIar15S
 xAqe/kJQz+D0JedUWW6j3XYvWV8oTZdPuBDNM4pqFxMtUvDVT7Rd5JQyF6Ubl0xH8m9I
 fN94COv/02T2Z1jvNYfuiAW5oeFmGylJwuCyj8npvRTj8mrf2Lmr5OOzTHE99/WY9Op1
 g0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sUvSwY7fzkVvwkrJKau7P6Rtg0GEC3gaUzaRsvmBnVI=;
 b=0gOzkDFn0hBuhR2Gwm6Obrph430GhfnWPpDyWjszlBosJzQcJTINtp2m1LsBhZaftd
 FDKC28L98tt/1jBrt126AKPlW7Dwe4mw4ve7ECX1DDxCGUZX1/P6UXvG0POcBWH3fFSL
 LC7oMiNzE0sChWcVAROj5QL4C8yAWv0gBqmcaZQHWPst+DNbOROLGbwQi+BNb0+TqV18
 FbOb3BQMHIapPsTrNC+h4ttzyCFpZKRRDHxFyehiF0T/Nd71eYJoBF41UcN8FBapgET7
 BD4txvAWI0B9quclkZ7JexprghMk7JpmogAOyb961uBDtU2hRypg0qc2oiFrCo2aJ+2w
 MLug==
X-Gm-Message-State: AJIora9xmSC5+OyEjY2PJIh73zg3T4laEcPO3S/7efWvodSg7HoUWqpC
 Mv8HMJvZjnIYwF/J8GRpndZNsiASRRHIJbSBzm4=
X-Google-Smtp-Source: AGRyM1vtgCibZy9fCgbgd93DLlxRXDq3WtG+VZ0EA4KPY+3ccO8ACUOHJh39qzL6F238zM0/jPwcQzXovUj5xj9/JyY=
X-Received: by 2002:a25:7497:0:b0:668:fc45:30c5 with SMTP id
 p145-20020a257497000000b00668fc4530c5mr9858802ybc.373.1655761875075; Mon, 20
 Jun 2022 14:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220618232737.2036722-1-linux@roeck-us.net>
In-Reply-To: <20220618232737.2036722-1-linux@roeck-us.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Jun 2022 17:51:04 -0400
Message-ID: <CADnq5_N1p53Orbjxfxd7Cwos0p8OVz1TbRm0rFaUnxQJwah61g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add missing hard-float compile flags for
 PPC64 builds
To: Guenter Roeck <linux@roeck-us.net>, Melissa Wen <mwen@igalia.com>, 
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Dhillon,
 Jasdeep" <Jasdeep.Dhillon@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Michael Ellerman <mpe@ellerman.id.au>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 18, 2022 at 7:27 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> ppc:allmodconfig builds fail with the following error.
>
> powerpc64-linux-ld:
>         drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
>                 uses hard float,
>         drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
>                 uses soft float
> powerpc64-linux-ld:
>         failed to merge target specific data of file
>         drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
> powerpc64-linux-ld:
>         drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
>                 uses hard float,
>         drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
>                 uses soft float
> powerpc64-linux-ld:
>         failed to merge target specific data of
>         file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
> powerpc64-linux-ld:
>         drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
>                 uses hard float,
>         drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
>                 uses soft float
> powerpc64-linux-ld:
>         failed to merge target specific data of file
>         drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
>
> The problem was introduced with commit 41b7a347bf14 ("powerpc: Book3S
> 64-bit outline-only KASAN support") which adds support for KASAN. This
> commit in turn enables DRM_AMD_DC_DCN because KCOV_INSTRUMENT_ALL and
> KCOV_ENABLE_COMPARISONS are no longer enabled. As result, new files are
> compiled which lack the selection of hard-float.
>
> Fixes: 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only KASAN support")
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn31/Makefile  | 4 ++++
>  drivers/gpu/drm/amd/display/dc/dcn315/Makefile | 4 ++++
>  drivers/gpu/drm/amd/display/dc/dcn316/Makefile | 4 ++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> index ec041e3cda30..74be02114ae4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> @@ -15,6 +15,10 @@ DCN31 = dcn31_resource.o dcn31_hubbub.o dcn31_hwseq.o dcn31_init.o dcn31_hubp.o
>         dcn31_apg.o dcn31_hpo_dp_stream_encoder.o dcn31_hpo_dp_link_encoder.o \
>         dcn31_afmt.o dcn31_vpg.o
>
> +ifdef CONFIG_PPC64
> +CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o := -mhard-float -maltivec
> +endif

This stuff was all moved as part of the FP rework in:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=26f4712aedbdf4b9f5e3888a50a2a4b130ee4a9b
@Siqueira, Rodrigo
, @Melissa Wen, @Dhillon, Jasdeep  can you take a look to understand
why this is necessary?  If we add back the PPC flags, I think we need
to add back the x86 ones as well.

Alex

> +
>  AMD_DAL_DCN31 = $(addprefix $(AMDDALPATH)/dc/dcn31/,$(DCN31))
>
>  AMD_DISPLAY_FILES += $(AMD_DAL_DCN31)
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> index 59381d24800b..1395c1ced8c5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> @@ -25,6 +25,10 @@
>
>  DCN315 = dcn315_resource.o
>
> +ifdef CONFIG_PPC64
> +CFLAGS_$(AMDDALPATH)/dc/dcn315/dcn315_resource.o := -mhard-float -maltivec
> +endif
> +
>  AMD_DAL_DCN315 = $(addprefix $(AMDDALPATH)/dc/dcn315/,$(DCN315))
>
>  AMD_DISPLAY_FILES += $(AMD_DAL_DCN315)
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> index 819d44a9439b..c3d2dd78f1e2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> @@ -25,6 +25,10 @@
>
>  DCN316 = dcn316_resource.o
>
> +ifdef CONFIG_PPC64
> +CFLAGS_$(AMDDALPATH)/dc/dcn316/dcn316_resource.o := -mhard-float -maltivec
> +endif
> +
>  AMD_DAL_DCN316 = $(addprefix $(AMDDALPATH)/dc/dcn316/,$(DCN316))
>
>  AMD_DISPLAY_FILES += $(AMD_DAL_DCN316)
> --
> 2.35.1
>
