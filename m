Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD73B76A1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 18:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B4E6E8CC;
	Tue, 29 Jun 2021 16:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB0C89B67;
 Tue, 29 Jun 2021 16:47:32 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 o17-20020a9d76510000b02903eabfc221a9so23374996otl.0; 
 Tue, 29 Jun 2021 09:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MGTK4lyAMdeYSqK3dGA2v+GiJW5Wa7AmD5LZbDWF2LE=;
 b=Q5uzHCoi5dQJkGW36AFCtkNIiGQDKyQ8V5uKpN0wkzykiKyCVjL8Bfj6Be6Gd9x4of
 elyv0+DB7ZnuKpJ+B5GOZu/YGBUsJsEffcKOjJY9IPYVBeWoZpbgRZ3rKMzfneoyV1ma
 BwOXaIDLbQuoNjQCwvCjApiNxxLRZvfiBr8c51Ol5b0JYeyybQ51qJToFtDeqpW+WbEE
 BoGKH9snFUYSVFfqgeZtgLk5FU4N5trf8f+i3XDs0CpAnecKCLNObvinSLf7M2DNwDLz
 kMRnQLwMlGql1OlJu74MmrEra5Z9zp3Jp6xJoxEJielk5DM+vGenWf03inbdnQ2Afuvt
 tdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MGTK4lyAMdeYSqK3dGA2v+GiJW5Wa7AmD5LZbDWF2LE=;
 b=tiER84vC21LWv4NTpFBl3pcbUB3Ujctuk1gEzHyN7bdBE7md66r4ykPBUvmgTaeJTH
 mzWFBCcmIaCdc3mYL1Msj6f8GrIYvGt2cmNmQS0gnIt3DuhMwRxC0Py7Vtjn4w4jYMZO
 3ugXYXu+a1QSUTH0XjIdf6YiY7nAUvJ4COzSIiW+FCkCvdmKgxmg/PvNweHcHjET5WQn
 DJys0m18KPKvdEHUzc3ls6sHDO2TQtb+84IN0mSVi5czDkk4id8KzZakgogV5Cjk3vur
 NmCeH3qiawiKO2oCXZblYqZyJrAGAATbxgfO6Q00X1JuMVxDshvMmuwyeKpqF8sJRQ0M
 0ZfA==
X-Gm-Message-State: AOAM531OrK5xj52GXH8hRFr+vcp9n3/1tSwtl2tkyhDFJxpWXUOEpcxK
 7V/b/ZLdaQpe9emo6ddhd6tTAxLrJKqsNViF1Ds=
X-Google-Smtp-Source: ABdhPJwAtOPJLy7khY9BGMqPmkZQ3pEn+TYCMaJD8d1zpiZNz/ojO0rlC+Y7kq60yh5KEFZlyHLCiNDcEjkqteqw1/8=
X-Received: by 2002:a05:6830:33ef:: with SMTP id
 i15mr5256611otu.311.1624985252222; 
 Tue, 29 Jun 2021 09:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210629112647.1.I7813d8e7298aa1a1c6bee84e6fd44a82ca24805c@changeid>
 <9e21a922-38d2-3d03-4524-c122965f7db3@amd.com>
In-Reply-To: <9e21a922-38d2-3d03-4524-c122965f7db3@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Jun 2021 12:47:21 -0400
Message-ID: <CADnq5_PXwDe03e8zJ7O6Y0FXKsp0FngyRVQvaM=hN9UWE6TmTw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Respect CONFIG_FRAME_WARN=0 in dml
 Makefile
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Reka Norman <rekanorman@google.com>, David Airlie <airlied@linux.ie>,
 Daniel Kolesa <daniel@octaforge.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Huang Rui <ray.huang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Reka Norman <rekanorman@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>, Will Deacon <will@kernel.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Jun 29, 2021 at 11:10 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2021-06-28 9:27 p.m., Reka Norman wrote:
> > Setting CONFIG_FRAME_WARN=0 should disable 'stack frame larger than'
> > warnings. This is useful for example in KASAN builds. Make the dml
> > Makefile respect this config.
> >
> > Fixes the following build warnings with CONFIG_KASAN=y and
> > CONFIG_FRAME_WARN=0:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3642:6:
> > warning: stack frame size of 2216 bytes in function
> > 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=]
> > drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3957:6:
> > warning: stack frame size of 2568 bytes in function
> > 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=]
> >
> > Signed-off-by: Reka Norman <rekanorman@google.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >
> >  drivers/gpu/drm/amd/display/dc/dml/Makefile | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> > index d34024fd798a..45862167e6ce 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> > @@ -50,6 +50,10 @@ dml_ccflags += -msse2
> >  endif
> >  endif
> >
> > +ifneq ($(CONFIG_FRAME_WARN),0)
> > +frame_warn_flag := -Wframe-larger-than=2048
> > +endif
> > +
> >  CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
> >
> >  ifdef CONFIG_DRM_AMD_DC_DCN
> > @@ -60,9 +64,9 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_ccflags)
> >  CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_ccflags)
> >  CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_ccflags)
> >  CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o := $(dml_ccflags)
> > -CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) -Wframe-larger-than=2048
> > +CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) $(frame_warn_flag)
> >  CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_ccflags)
> > -CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) -Wframe-larger-than=2048
> > +CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) $(frame_warn_flag)
> >  CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_rq_dlg_calc_31.o := $(dml_ccflags)
> >  CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
> >  CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_rcflags)
> >
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
