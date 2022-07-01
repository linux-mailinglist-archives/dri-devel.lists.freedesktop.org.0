Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 398CA5627ED
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 03:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5138C10E053;
	Fri,  1 Jul 2022 01:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAD610E00E;
 Fri,  1 Jul 2022 01:00:46 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id r1so877817plo.10;
 Thu, 30 Jun 2022 18:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V0zM+5bGzrkuoT/FKu7bEUEOWBFCnfKhcSbWomk53qM=;
 b=admCY/5SeVAW7JF20wM5exEz/XP8A8JZMf56qXi/BvZ/2TzamG0oewPdsY/dof8rZt
 QtBTb80R8GTBeghWwTMNXB1kZ/9L4C/U3ie+lv4Nmc730oSOBoFsLTgET87olma0YXDl
 bgUJ5ybAaruQbmdtzc9cfmvtAZKXR3LCKVBpbZe+F3gmflagoSjDTC1FmEZg6Iicm2IP
 6t9iUJCBMnEL9qPZ2Ke3p0wLZTdFHwYfgbfN0BX/e7mdw2V9E7VTPYOTSZRlD6O8+fpq
 m0se6R/bavZys/jzlg+i246xcW99nqDeM+NeqVrqekQpJ4kRwff9J8W/s5IYeiGXKyFS
 F7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=V0zM+5bGzrkuoT/FKu7bEUEOWBFCnfKhcSbWomk53qM=;
 b=vfSrsfB9Ux3K3440HGV8s9ifGnmyZ8rwoavnIn3KozMrHCj1vVpnUmFwV9VRvwOkxJ
 UGGbXYEqCixsO80mfMXK6FZshGE+xhC2PqqF0nWP3lGALD2H79vmd7MjAgi+Sa9cC0ro
 o0XgbgB7LUVO6pZyDItdu6ZDPRh3UUpwruCJMOGmwnYvhI2E/8esY7AtHIiGA+OvzTpx
 wWF5OQQN0SuayJCUoQNX4UrzEyrO4Nhi1UzB34tsGv0c1K56mZ3P7aj22TUc6yjiZ2i5
 bb6WVipLbZivrBIz6v7pyphmgyfVhDNIS7s65nCni7UQvZTjQspvMyBUsvNSY8iouGGk
 WymA==
X-Gm-Message-State: AJIora8VquqrPY8HFI1z2spX/hmWP1/zPE99111qfL3ruhwR8GPx6Y/Z
 yjTJVQg6KoFjNRmQVFzy0t6jCSwqSOg=
X-Google-Smtp-Source: AGRyM1uO7TZZ/gV2+Eab2pQbAFkv30F/jNtzZp3FwVfoJmAfJx+ZClZ40J+Pl2oaBeYCOh5B8AqXeA==
X-Received: by 2002:a17:902:d1cd:b0:169:f061:7341 with SMTP id
 g13-20020a170902d1cd00b00169f0617341mr18532874plb.16.1656637245831; 
 Thu, 30 Jun 2022 18:00:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a1709029a9400b0015e8d4eb231sm14131141plp.123.2022.06.30.18.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 18:00:43 -0700 (PDT)
Date: Thu, 30 Jun 2022 18:00:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH] drm/amd/display: Add missing hard-float compile flags
 for PPC64 builds
Message-ID: <20220701010042.GH3104033@roeck-us.net>
References: <20220618232737.2036722-1-linux@roeck-us.net>
 <584fc348-7a60-26a2-af61-9edc4f4830e4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <584fc348-7a60-26a2-af61-9edc4f4830e4@amd.com>
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 05:01:01PM -0400, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 2022-06-18 19:27, Guenter Roeck wrote:
> > ppc:allmodconfig builds fail with the following error.
> > 
> > powerpc64-linux-ld:
> > 	drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> > 		uses hard float,
> > 	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
> > 		uses soft float
> > powerpc64-linux-ld:
> > 	failed to merge target specific data of file
> > 	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
> > powerpc64-linux-ld:
> > 	drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> > 		uses hard float,
> > 	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
> > 		uses soft float
> > powerpc64-linux-ld:
> > 	failed to merge target specific data of
> > 	file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
> > powerpc64-linux-ld:
> > 	drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> > 		uses hard float,
> > 	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
> > 		uses soft float
> > powerpc64-linux-ld:
> > 	failed to merge target specific data of file
> > 	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
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
> >   	dcn31_apg.o dcn31_hpo_dp_stream_encoder.o dcn31_hpo_dp_link_encoder.o \
> >   	dcn31_afmt.o dcn31_vpg.o
> > +ifdef CONFIG_PPC64
> > +CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o := -mhard-float -maltivec
> > +endif
> > +
> >   AMD_DAL_DCN31 = $(addprefix $(AMDDALPATH)/dc/dcn31/,$(DCN31))
> >   AMD_DISPLAY_FILES += $(AMD_DAL_DCN31)
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> > index 59381d24800b..1395c1ced8c5 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
> > @@ -25,6 +25,10 @@
> >   DCN315 = dcn315_resource.o
> > +ifdef CONFIG_PPC64
> > +CFLAGS_$(AMDDALPATH)/dc/dcn315/dcn315_resource.o := -mhard-float -maltivec
> > +endif
> > +
> >   AMD_DAL_DCN315 = $(addprefix $(AMDDALPATH)/dc/dcn315/,$(DCN315))
> >   AMD_DISPLAY_FILES += $(AMD_DAL_DCN315)
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> > index 819d44a9439b..c3d2dd78f1e2 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
> > @@ -25,6 +25,10 @@
> >   DCN316 = dcn316_resource.o
> > +ifdef CONFIG_PPC64
> > +CFLAGS_$(AMDDALPATH)/dc/dcn316/dcn316_resource.o := -mhard-float -maltivec
> > +endif
> > +
> >   AMD_DAL_DCN316 = $(addprefix $(AMDDALPATH)/dc/dcn316/,$(DCN316))
> >   AMD_DISPLAY_FILES += $(AMD_DAL_DCN316)
> 
> Hi,
> 
> I don't want to re-introduce those FPU flags for DCN31/DCN314/DCN316 since
> we fully isolate FPU operations for those ASICs inside the DML folder.

FWIW, I don't think that matters from a linking perspective since the hard-float
and the soft-float objects are linked together, and the linker bails out on
that because the ABIs are not compatible. You only get a warning on that unless
you build with -Werror, which is the case for allmodconfig builds.

Guenter
