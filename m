Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228BB573ED4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 23:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6598F9B6B4;
	Wed, 13 Jul 2022 21:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5E39B35B;
 Wed, 13 Jul 2022 21:20:54 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id va17so53407ejb.0;
 Wed, 13 Jul 2022 14:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K1bJUmmTrVDRGEbygJ1lyIJ3nFniytzpL0oelw3tmno=;
 b=I3ZDdYVWtVBT1OSPDYC8/kySJQmls+2J13dZplXCWH7RblLr+tzs9e1lGC5+IPPSk/
 Ir6IQSFBTYlC1CGSh6H2OpjjjeOdrOljpSJMxdP1OpaCiRkCqJ7JX1dASIOpa++eFtlI
 0hxXI+asTIeVcEFUNKrLjcWtHHcQWju6Il2qbJKozpu3qon4Yujq3r0lfCzMRY+BzQHX
 bQoZp4ScntrtQyJZCzeupFeD0ziREeqH3Wb5ugKj2lxbH7Cg8zbM/KctdEbiNzsbthNI
 TgyIihJ9J8unW2/SsAtDrXT+kdrA62HK6SFcsYJQjmQlCFKoDWNH6L5oxGQPlN44A6cP
 d3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K1bJUmmTrVDRGEbygJ1lyIJ3nFniytzpL0oelw3tmno=;
 b=WZDEC+N+ZpP2fo4aEwzSk7kveUdH1PRe+Qo7p3NqIOYSHZMhXTzBoCONUTlCkVDv3j
 hK14HLVQ5Inuz/Cnywg4SXKzJAfYLKNz22f4xajofj6jcPu/Q/5LAYNUTTQhuj1MPlF1
 fqu5SrPvtFp+b+StcdEJPJjSHcp8nEncRGTvMcoZV9fn1E5tEDiWOBe8+dOEStNymQjg
 9uJOx+tXUigd3hUQHHU6O92H1b83KuDtPzH5/P0/n6GvKyuv4eA8TmYnaEC/I1I49my4
 76EVCdBbP4cH245sa+ZR2qjXsU4NKWxPT52aigyPb/JqACQgPDtBb32VXElKU5ecz2Z/
 +VYg==
X-Gm-Message-State: AJIora9TBUeZxGL6E9BLxi9v4V3PHXfvEsmuAANPyPEWzsQk6oM9ZJQY
 sQbVZsTwLvIx1MuLccOxCmps/gmZZn5yUUyKQPmuER+D
X-Google-Smtp-Source: AGRyM1toLknDPYbOmwvfivbwws5lJo4wsjZWXqnrNSdga/ddY5HDEUxX71H72568OXwwkujvZCF8Ign2JwsA/RuDpQg=
X-Received: by 2002:a17:906:5d0b:b0:726:a043:fcb4 with SMTP id
 g11-20020a1709065d0b00b00726a043fcb4mr5282475ejt.508.1657747252690; Wed, 13
 Jul 2022 14:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220618232737.2036722-1-linux@roeck-us.net>
 <584fc348-7a60-26a2-af61-9edc4f4830e4@amd.com>
 <CADnq5_NkVWqcxwLMBeskqpcSEYCEjUAK0hqvA_PAo7ACHKL2cA@mail.gmail.com>
 <6a026c9a-c4ee-deba-e028-4c0f478c1911@roeck-us.net>
In-Reply-To: <6a026c9a-c4ee-deba-e028-4c0f478c1911@roeck-us.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Jul 2022 17:20:40 -0400
Message-ID: <CADnq5_OrxMMkazXEPHeZXp_bV890=r21DRx2QsqLXUFj4t8aYg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add missing hard-float compile flags for
 PPC64 builds
To: Guenter Roeck <linux@roeck-us.net>
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
 Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 5:18 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/13/22 13:57, Alex Deucher wrote:
> > On Thu, Jun 30, 2022 at 5:01 PM Rodrigo Siqueira Jordao
> > <Rodrigo.Siqueira@amd.com> wrote:
> >>
> >>
> >>
> >> On 2022-06-18 19:27, Guenter Roeck wrote:
> >>> ppc:allmodconfig builds fail with the following error.
> >>>
> >>> powerpc64-linux-ld:
> >>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> >>>                uses hard float,
> >>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
> >>>                uses soft float
> >>> powerpc64-linux-ld:
> >>>        failed to merge target specific data of file
> >>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
> >>> powerpc64-linux-ld:
> >>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> >>>                uses hard float,
> >>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
> >>>                uses soft float
> >>> powerpc64-linux-ld:
> >>>        failed to merge target specific data of
> >>>        file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
> >>> powerpc64-linux-ld:
> >>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> >>>                uses hard float,
> >>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
> >>>                uses soft float
> >>> powerpc64-linux-ld:
> >>>        failed to merge target specific data of file
> >>>        drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
> >>>
> >>> The problem was introduced with commit 41b7a347bf14 ("powerpc: Book3S
> >>> 64-bit outline-only KASAN support") which adds support for KASAN. This
> >>> commit in turn enables DRM_AMD_DC_DCN because KCOV_INSTRUMENT_ALL and
> >>> KCOV_ENABLE_COMPARISONS are no longer enabled. As result, new files are
> >>> compiled which lack the selection of hard-float.
> >>>
> >>> Fixes: 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only KASAN support")
> >>> Cc: Michael Ellerman <mpe@ellerman.id.au>
> >>> Cc: Daniel Axtens <dja@axtens.net>
> >>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >>> ---
> >>>    drivers/gpu/drm/amd/display/dc/dcn31/Makefile  | 4 ++++
> >>>    drivers/gpu/drm/amd/display/dc/dcn315/Makefile | 4 ++++
> >>>    drivers/gpu/drm/amd/display/dc/dcn316/Makefile | 4 ++++
> >>>    3 files changed, 12 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> >>> index ec041e3cda30..74be02114ae4 100644
> >>> --- a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> >>> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> >>> @@ -15,6 +15,10 @@ DCN31 = dcn31_resource.o dcn31_hubbub.o dcn31_hwseq.o dcn31_init.o dcn31_hubp.o
> >>>        dcn31_apg.o dcn31_hpo_dp_stream_encoder.o dcn31_hpo_dp_link_encoder.o \
> >>>        dcn31_afmt.o dcn31_vpg.o
> >>>
> >>> +ifdef CONFIG_PPC64
> >>> +CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o := -mhard-float -maltivec
> >>> +endif
> >>> +
> >>>    AMD_DAL_DCN31 = $(addprefix $(AMDDALPATH)/dc/dcn31/,$(DCN31))
> >>>
> >>>    AMD_DISPLAY_FILES += $(AMD_DAL_DCN31)
> >>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> >>> index 59381d24800b..1395c1ced8c5 100644
> >>> --- a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> >>> +++ b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> >>> @@ -25,6 +25,10 @@
> >>>
> >>>    DCN315 = dcn315_resource.o
> >>>
> >>> +ifdef CONFIG_PPC64
> >>> +CFLAGS_$(AMDDALPATH)/dc/dcn315/dcn315_resource.o := -mhard-float -maltivec
> >>> +endif
> >>> +
> >>>    AMD_DAL_DCN315 = $(addprefix $(AMDDALPATH)/dc/dcn315/,$(DCN315))
> >>>
> >>>    AMD_DISPLAY_FILES += $(AMD_DAL_DCN315)
> >>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> >>> index 819d44a9439b..c3d2dd78f1e2 100644
> >>> --- a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> >>> +++ b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> >>> @@ -25,6 +25,10 @@
> >>>
> >>>    DCN316 = dcn316_resource.o
> >>>
> >>> +ifdef CONFIG_PPC64
> >>> +CFLAGS_$(AMDDALPATH)/dc/dcn316/dcn316_resource.o := -mhard-float -maltivec
> >>> +endif
> >>> +
> >>>    AMD_DAL_DCN316 = $(addprefix $(AMDDALPATH)/dc/dcn316/,$(DCN316))
> >>>
> >>>    AMD_DISPLAY_FILES += $(AMD_DAL_DCN316)
> >>
> >> Hi,
> >>
> >> I don't want to re-introduce those FPU flags for DCN31/DCN314/DCN316
> >> since we fully isolate FPU operations for those ASICs inside the DML
> >
> > I don't understand why we don't need to add the hard-float flags back
> > on the other DCN blocks.  Did we miss something in the DML cleanup for
> > DCN 3.1.x?  Anyway, at this point, the patch is:
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > We can sort the rest out for 5.20.
> >
>
> The problem is not the FPU operations, but the fact that soft-float
> and hard-float compiled code is linked together. The soft-float and
> hard-float ABIs on powerpc are not compatible, so one ends up with
> an object file which is partially soft-float and partially hard-float
> compiled and thus uses different ABIs. That can only create chaos,
> so the linker complains about it.

I get that, I just don't see why only DCN 3.1.x files have this
problem.  The DCN 2.x files should as well.

Alex
