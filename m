Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1FC573E5E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 22:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB6A99EDC;
	Wed, 13 Jul 2022 20:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E13A99E9C;
 Wed, 13 Jul 2022 20:57:21 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id l23so21974476ejr.5;
 Wed, 13 Jul 2022 13:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HZ0I7rnRXF+zKo0Waz+59mR5IWLr5zhMjzNRsbDc0Ws=;
 b=kbNLt4GGJ0sc1EmhUvJ/nBDhM7MzpppeLTEiVqt1Mi8RStPTVFb7yar8xhsEm7N2ar
 16n8lgc0/OFEDLkstvqYUHdsacAqFDKMt1lpHbs3SELgH70FmMmtn3h1aiAkU2nxkkGz
 MlQ3zM2K+C2761yoiOt/pxnaT9Ii7THH8RKQNczpF4KXcD4inezFwm97AfLCS1GYixEv
 dxLcv86wRnYaQYaunEL+C/boLRFZsYDrC1snpyCW6uVJH+Yb/4f4mcMiJ7Vl3rY0J/3c
 znK1kKRdiQ0tYR3oqMShaiL4zx2Qzp9vbRhHMi2kQ3KUm/+0ExteICtQrCghfPX8G5V4
 zFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HZ0I7rnRXF+zKo0Waz+59mR5IWLr5zhMjzNRsbDc0Ws=;
 b=x3aAVS6rgl71KWkXp+LoJNxLo2o3erLtVH2S7zAXoAJjBRL8RPksQAzAIiy7n+r8+O
 FSA41hpjRFD6p6U2rSLyzUjYecCqj8E5uxtyG7wooUESemxikuC42yrKKheKA5aV2nX/
 MIwu9x39T5oT2SjeYpzIdzifjcv2zlsVMyhOleD+z8Br5b7Ho20qMVh0AK8VoLMNtWko
 ZNcCjB5GN4aIPAH06x1JiLBROQha1l8ARhcyKPd4FvjXZuB6C62eyb/awJyFY30IQe/o
 wIuUHPratmEkTa381AAYkjP0hjYHOK1P1oibcsBo8EmRtt8CbscXuU1Z+ME08ciUeOkV
 qfUA==
X-Gm-Message-State: AJIora+irkR7hYProEYv0wqQJH/2+8swacksq8R9BK3XYNd+s8KCbnA8
 1B/SJ8r6LzUa/dUFMolZGgwfjJSni7HUwiyZPkQ=
X-Google-Smtp-Source: AGRyM1uPyc6+oUjj8sxdsfwRjpKkRBg+PEmXlXc4IkoxS0NXVrY2lloMcRZqBmqBBO/sNEK20eTJvLXeCNhIaSa3NOM=
X-Received: by 2002:a17:907:2702:b0:72b:307b:98e6 with SMTP id
 w2-20020a170907270200b0072b307b98e6mr5315152ejk.658.1657745839832; Wed, 13
 Jul 2022 13:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220618232737.2036722-1-linux@roeck-us.net>
 <584fc348-7a60-26a2-af61-9edc4f4830e4@amd.com>
In-Reply-To: <584fc348-7a60-26a2-af61-9edc4f4830e4@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Jul 2022 16:57:07 -0400
Message-ID: <CADnq5_NkVWqcxwLMBeskqpcSEYCEjUAK0hqvA_PAo7ACHKL2cA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add missing hard-float compile flags for
 PPC64 builds
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
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
 Guenter Roeck <linux@roeck-us.net>, Daniel Axtens <dja@axtens.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 5:01 PM Rodrigo Siqueira Jordao
<Rodrigo.Siqueira@amd.com> wrote:
>
>
>
> On 2022-06-18 19:27, Guenter Roeck wrote:
> > ppc:allmodconfig builds fail with the following error.
> >
> > powerpc64-linux-ld:
> >       drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> >               uses hard float,
> >       drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
> >               uses soft float
> > powerpc64-linux-ld:
> >       failed to merge target specific data of file
> >       drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
> > powerpc64-linux-ld:
> >       drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> >               uses hard float,
> >       drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
> >               uses soft float
> > powerpc64-linux-ld:
> >       failed to merge target specific data of
> >       file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
> > powerpc64-linux-ld:
> >       drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> >               uses hard float,
> >       drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
> >               uses soft float
> > powerpc64-linux-ld:
> >       failed to merge target specific data of file
> >       drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
> >
> > The problem was introduced with commit 41b7a347bf14 ("powerpc: Book3S
> > 64-bit outline-only KASAN support") which adds support for KASAN. This
> > commit in turn enables DRM_AMD_DC_DCN because KCOV_INSTRUMENT_ALL and
> > KCOV_ENABLE_COMPARISONS are no longer enabled. As result, new files are
> > compiled which lack the selection of hard-float.
> >
> > Fixes: 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only KASAN support")
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Daniel Axtens <dja@axtens.net>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >   drivers/gpu/drm/amd/display/dc/dcn31/Makefile  | 4 ++++
> >   drivers/gpu/drm/amd/display/dc/dcn315/Makefile | 4 ++++
> >   drivers/gpu/drm/amd/display/dc/dcn316/Makefile | 4 ++++
> >   3 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> > index ec041e3cda30..74be02114ae4 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> > @@ -15,6 +15,10 @@ DCN31 = dcn31_resource.o dcn31_hubbub.o dcn31_hwseq.o dcn31_init.o dcn31_hubp.o
> >       dcn31_apg.o dcn31_hpo_dp_stream_encoder.o dcn31_hpo_dp_link_encoder.o \
> >       dcn31_afmt.o dcn31_vpg.o
> >
> > +ifdef CONFIG_PPC64
> > +CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o := -mhard-float -maltivec
> > +endif
> > +
> >   AMD_DAL_DCN31 = $(addprefix $(AMDDALPATH)/dc/dcn31/,$(DCN31))
> >
> >   AMD_DISPLAY_FILES += $(AMD_DAL_DCN31)
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> > index 59381d24800b..1395c1ced8c5 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> > @@ -25,6 +25,10 @@
> >
> >   DCN315 = dcn315_resource.o
> >
> > +ifdef CONFIG_PPC64
> > +CFLAGS_$(AMDDALPATH)/dc/dcn315/dcn315_resource.o := -mhard-float -maltivec
> > +endif
> > +
> >   AMD_DAL_DCN315 = $(addprefix $(AMDDALPATH)/dc/dcn315/,$(DCN315))
> >
> >   AMD_DISPLAY_FILES += $(AMD_DAL_DCN315)
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> > index 819d44a9439b..c3d2dd78f1e2 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> > @@ -25,6 +25,10 @@
> >
> >   DCN316 = dcn316_resource.o
> >
> > +ifdef CONFIG_PPC64
> > +CFLAGS_$(AMDDALPATH)/dc/dcn316/dcn316_resource.o := -mhard-float -maltivec
> > +endif
> > +
> >   AMD_DAL_DCN316 = $(addprefix $(AMDDALPATH)/dc/dcn316/,$(DCN316))
> >
> >   AMD_DISPLAY_FILES += $(AMD_DAL_DCN316)
>
> Hi,
>
> I don't want to re-introduce those FPU flags for DCN31/DCN314/DCN316
> since we fully isolate FPU operations for those ASICs inside the DML

I don't understand why we don't need to add the hard-float flags back
on the other DCN blocks.  Did we miss something in the DML cleanup for
DCN 3.1.x?  Anyway, at this point, the patch is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>
We can sort the rest out for 5.20.

Alex

> folder. Notice that we have the PPC64 in the DML Makefile:
>
> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/dc/dml/Makefile
>
> Could you share what you see without your patch in the
> amd-staging-drm-next? Also:
> * Are you using cross-compilation? If so, could you share your setup?
> * Which GCC/Clang version are you using?
>
> Thanks
> Siqueira
>
