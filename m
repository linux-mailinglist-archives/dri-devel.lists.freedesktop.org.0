Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9DE39ACE2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 23:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA276E5D4;
	Thu,  3 Jun 2021 21:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343496E5D3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 21:29:08 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id s14so5010727pfd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 14:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2Yeh/FjvoGmDvMVI3FhndKEAnDxbRTGa5PVumREo+/U=;
 b=CxbhIwPtH10NEUgChjJXFAa/Kma9UcNFh/9cCYSjXEjz+Z+xBYH79qxj2tLoiCcBxh
 VTKyd/9ozWk/aUphLEgt+/m2POjsNqpzx8S1J6xAdQ+By8aUx6MwBbH6+6TPDadxXfwG
 hGJGk1CkZzfssRK7krjAHRRCm2Ehd0Gncf8rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2Yeh/FjvoGmDvMVI3FhndKEAnDxbRTGa5PVumREo+/U=;
 b=cF/61aCUSpiLTOd8lz8eP2CUTR5Tpx6tDvBPv9WYAw3ZX4nJWEq1ZeS2O9vA4iEpDP
 clexWJDVfdTX++psw0nh9PsqkkT7qeCRIzEOaeRd38HRICAD/MGxfDnqee1+jdcambJc
 9C29LKgySAdOcE12kYmy596KrMsFdxBWFgYvZQGEIWrNgr1ZrchGY3Wk0A5UGJKjB1f1
 o6WEjOW3yB648NXDTF0JsZHKxvFg/Cwal35gNErmiNItgX32X84OitQ6CJ8tx3Gw3kut
 SxHxEzIK0cbNwhj2kFFOD+E8skARCOqzFw/hdZtfBFglqBg+mJnHR3CrAMkkSe9fOg/j
 g45Q==
X-Gm-Message-State: AOAM532GIPpWUYX19e0VxdHk8GvR0YHbxL0INsTTx7htEeFFQoA3jqxP
 wzSZ1hnOPvBz5WBSuPmRtEvY5Q==
X-Google-Smtp-Source: ABdhPJyAQKUVj6xeGTKI/EB0Y3dsmWB0IM9MSfak1uIoG3Yp+fIAM1Il/NoO3cJ2xnooyk2IosedYA==
X-Received: by 2002:a63:be45:: with SMTP id g5mr1386784pgo.311.1622755747756; 
 Thu, 03 Jun 2021 14:29:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u73sm22479pfc.169.2021.06.03.14.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:29:07 -0700 (PDT)
Date: Thu, 3 Jun 2021 14:29:05 -0700
From: Kees Cook <keescook@chromium.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/pl111: depend on CONFIG_VEXPRESS_CONFIG
Message-ID: <202106031422.FD9E3C5755@keescook>
References: <20210602215252.695994-1-keescook@chromium.org>
 <20210602215252.695994-4-keescook@chromium.org>
 <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
 <CAKMK7uFBQk+KA0fPdjkB9=7By2a9V5i=u84ufO+n3dmjayq+vw@mail.gmail.com>
 <202106031357.BE2A09DA8F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106031357.BE2A09DA8F@keescook>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 kernel test robot <lkp@intel.com>, Emma Anholt <emma@anholt.net>,
 Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>, freedreno <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 02:19:52PM -0700, Kees Cook wrote:
> On Thu, Jun 03, 2021 at 09:19:42PM +0200, Daniel Vetter wrote:
> > On Thu, Jun 3, 2021 at 8:43 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Wed, Jun 2, 2021 at 4:53 PM Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > Avoid randconfig build failures by requiring VEXPRESS_CONFIG:
> > > >
> > > > aarch64-linux-gnu-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_vexpress_clcd_init':
> > > > pl111_versatile.c:(.text+0x220): undefined reference to `devm_regmap_init_vexpress_config'
> > >
> > > pl111_vexpress_clcd_init() starts with:
> > >
> > > if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
> > >                 return -ENODEV;
> > >
> > > Isn't that supposed to be enough to avoid an undefined reference?
> 
> Ah! I missed that when reading the code. I see the problem now. It's
> because of:
> 
> CONFIG_VEXPRESS_CONFIG=m
> CONFIG_DRM_PL111=y
> 
> I think the right fix is:
> 
> diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> index 80f6748055e3..662fc38f92ba 100644
> --- a/drivers/gpu/drm/pl111/Kconfig
> +++ b/drivers/gpu/drm/pl111/Kconfig
> @@ -3,6 +3,7 @@ config DRM_PL111
>  	tristate "DRM Support for PL111 CLCD Controller"
>  	depends on DRM
>  	depends on ARM || ARM64 || COMPILE_TEST
> +	depends on VEXPRESS_CONFIG=y || VEXPRESS_CONFIG=DRM

Oops, no, I had this backwairds:

	depends on !VEXPRESS_CONFIG || VEXPRESS_CONFIG=DRM

_that_ lets me build with:

# CONFIG_VEXPRESS_CONFIG is not set
CONFIG_DRM_PL111=y

CONFIG_VEXPRESS_CONFIG=y
CONFIG_DRM_PL111=y

CONFIG_VEXPRESS_CONFIG=m
CONFIG_DRM_PL111=m

CONFIG_VEXPRESS_CONFIG=y
CONFIG_DRM_PL111=m

and disallows:

CONFIG_VEXPRESS_CONFIG=m
CONFIG_DRM_PL111=y

(this will force CONFIG_DRM_PL111=m)

-Kees

>  	depends on COMMON_CLK
>  	select DRM_KMS_HELPER
>  	select DRM_KMS_CMA_HELPER
> 
> I will go check the defconfigs Rob mentioned...
> 
> > > Making the whole file depend on VEXPRESS_CONFIG is not right either.
> > > Not all platforms need it.
> > 
> > It needs a compile-time status inline then for the functions we're
> > using in pl111.
> 
> FYI, this is the config I was working from, which was throwing link errors:
> https://lore.kernel.org/lkml/202105300926.fX0MYySp-lkp@intel.com/
> 
> > -Daniel
> > 
> > >
> > > >
> > > > Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/pl111/Kconfig | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> > > > index 80f6748055e3..c5210a5bef1b 100644
> > > > --- a/drivers/gpu/drm/pl111/Kconfig
> > > > +++ b/drivers/gpu/drm/pl111/Kconfig
> > > > @@ -2,7 +2,7 @@
> > > >  config DRM_PL111
> > > >         tristate "DRM Support for PL111 CLCD Controller"
> > > >         depends on DRM
> > > > -       depends on ARM || ARM64 || COMPILE_TEST
> > > > +       depends on VEXPRESS_CONFIG
> > > >         depends on COMMON_CLK
> > > >         select DRM_KMS_HELPER
> > > >         select DRM_KMS_CMA_HELPER
> > > > --
> > > > 2.25.1
> > > >
> > 
> > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Kees Cook

-- 
Kees Cook
