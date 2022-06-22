Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4947553F81
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 02:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EC8112DB2;
	Wed, 22 Jun 2022 00:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D43112DAF;
 Wed, 22 Jun 2022 00:26:23 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id d129so14592777pgc.9;
 Tue, 21 Jun 2022 17:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HyU/ygfmhVGS6xWpbOKn6OEJd/jV8t0D8U8VB3gM6Kc=;
 b=mu03dInaeeI1tZbMR/CyJpnvw/YpqTdifEfhYjta2Ux2P8SHkCgTnUvgBBaXS9beN/
 jEtnM402ZNaDRKyZASY9xm3pAJDsGbb2jSN9UBCMKejyU4khd4diNZGlhzLol0FAN/2W
 qJscIAx0Rdb9l/yG8FsrhSSHyHN1fXSn0ZnG1o1SenOHwHOruWN6KHa+/e77SdHx9xGs
 eN97reRP+LVbK2hp5Hkm5jIAdjT7qn1HYpWBcUS1iHLQywz86vCq4sdR28d+Xg6Al6xK
 tcVbVNfE3v57Tbmv/2NXtnyMAh/CIeStnv/Tig3OoiNguQjwRAq/cHna06ZLOIXpLcFU
 2JJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=HyU/ygfmhVGS6xWpbOKn6OEJd/jV8t0D8U8VB3gM6Kc=;
 b=fV70oXSKROorFX88zpjv4YtF96IHPZLVNn2YAc7RqgzjlT+MCYIthhVIX9QKHux1si
 ARnSwm6Gf23fYusjRgAHC5mpBC0U3BN/RZeTRjz9wiEZuI/fvJRxn8efgGj9ah0MtXG3
 tWkEppP030i2OZdJQHEkVRyS8QmCTm5GHQhPI/yYhKVd50DrnLWZQWD+cBZSlC61pI2d
 lWr/9uc6P0r8+f635BiCmshNxhMS3FrBqv2PPtE4IxTIiLdd5RPj5pS4eBd7evMg22j9
 IPu9EbgOMgtYlO9j99/oxmtLDpnnidc8DT16mcewYuj3uTbfU0Tfl2eryC0ZSCQAuL55
 /rSQ==
X-Gm-Message-State: AJIora9wvpn4XKdLcijcO0joIBKBB3vyzyTX723Fjsn4vExpTd9S5/wM
 rAf3EAAdQ+gH07OXxwmhbZI=
X-Google-Smtp-Source: AGRyM1vzMGSpH7ukgiGn6qy8/xQjQhGjh5W38HhIBxIummnj04mvjrykHH7ZnKq8goM7KGK1USKZ+g==
X-Received: by 2002:a65:6e04:0:b0:40d:26eb:8225 with SMTP id
 bd4-20020a656e04000000b0040d26eb8225mr562426pgb.138.1655857583046; 
 Tue, 21 Jun 2022 17:26:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a626d06000000b0051c09cdd71fsm11870070pfc.72.2022.06.21.17.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 17:26:20 -0700 (PDT)
Date: Tue, 21 Jun 2022 17:26:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add missing hard-float compile flags
 for PPC64 builds
Message-ID: <20220622002619.GA3475450@roeck-us.net>
References: <20220618232737.2036722-1-linux@roeck-us.net>
 <CADnq5_N1p53Orbjxfxd7Cwos0p8OVz1TbRm0rFaUnxQJwah61g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_N1p53Orbjxfxd7Cwos0p8OVz1TbRm0rFaUnxQJwah61g@mail.gmail.com>
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
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "Dhillon,
 Jasdeep" <Jasdeep.Dhillon@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 20, 2022 at 05:51:04PM -0400, Alex Deucher wrote:
> On Sat, Jun 18, 2022 at 7:27 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > ppc:allmodconfig builds fail with the following error.
> >
> > powerpc64-linux-ld:
> >         drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> >                 uses hard float,
> >         drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
> >                 uses soft float
> > powerpc64-linux-ld:
> >         failed to merge target specific data of file
> >         drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
> > powerpc64-linux-ld:
> >         drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> >                 uses hard float,
> >         drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
> >                 uses soft float
> > powerpc64-linux-ld:
> >         failed to merge target specific data of
> >         file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
> > powerpc64-linux-ld:
> >         drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> >                 uses hard float,
> >         drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
> >                 uses soft float
> > powerpc64-linux-ld:
> >         failed to merge target specific data of file
> >         drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
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
> >  drivers/gpu/drm/amd/display/dc/dcn31/Makefile  | 4 ++++
> >  drivers/gpu/drm/amd/display/dc/dcn315/Makefile | 4 ++++
> >  drivers/gpu/drm/amd/display/dc/dcn316/Makefile | 4 ++++
> >  3 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> > index ec041e3cda30..74be02114ae4 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> > @@ -15,6 +15,10 @@ DCN31 = dcn31_resource.o dcn31_hubbub.o dcn31_hwseq.o dcn31_init.o dcn31_hubp.o
> >         dcn31_apg.o dcn31_hpo_dp_stream_encoder.o dcn31_hpo_dp_link_encoder.o \
> >         dcn31_afmt.o dcn31_vpg.o
> >
> > +ifdef CONFIG_PPC64
> > +CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o := -mhard-float -maltivec
> > +endif
> 
> This stuff was all moved as part of the FP rework in:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=26f4712aedbdf4b9f5e3888a50a2a4b130ee4a9b
> @Siqueira, Rodrigo
> , @Melissa Wen, @Dhillon, Jasdeep  can you take a look to understand
> why this is necessary?  If we add back the PPC flags, I think we need
> to add back the x86 ones as well.
> 

For my part I have no idea. All I can see is that powerpc:allmodconfig
builds fail with the above errors. I have not seen any build errors with
other architectures.

Guenter

> Alex
> 
> > +
> >  AMD_DAL_DCN31 = $(addprefix $(AMDDALPATH)/dc/dcn31/,$(DCN31))
> >
> >  AMD_DISPLAY_FILES += $(AMD_DAL_DCN31)
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> > index 59381d24800b..1395c1ced8c5 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> > @@ -25,6 +25,10 @@
> >
> >  DCN315 = dcn315_resource.o
> >
> > +ifdef CONFIG_PPC64
> > +CFLAGS_$(AMDDALPATH)/dc/dcn315/dcn315_resource.o := -mhard-float -maltivec
> > +endif
> > +
> >  AMD_DAL_DCN315 = $(addprefix $(AMDDALPATH)/dc/dcn315/,$(DCN315))
> >
> >  AMD_DISPLAY_FILES += $(AMD_DAL_DCN315)
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> > index 819d44a9439b..c3d2dd78f1e2 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> > @@ -25,6 +25,10 @@
> >
> >  DCN316 = dcn316_resource.o
> >
> > +ifdef CONFIG_PPC64
> > +CFLAGS_$(AMDDALPATH)/dc/dcn316/dcn316_resource.o := -mhard-float -maltivec
> > +endif
> > +
> >  AMD_DAL_DCN316 = $(addprefix $(AMDDALPATH)/dc/dcn316/,$(DCN316))
> >
> >  AMD_DISPLAY_FILES += $(AMD_DAL_DCN316)
> > --
> > 2.35.1
> >
