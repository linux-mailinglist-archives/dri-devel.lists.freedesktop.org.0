Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D885A8B586
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 11:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C6F10E8B0;
	Wed, 16 Apr 2025 09:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCWjcyn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D90010E8B1;
 Wed, 16 Apr 2025 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744796175; x=1776332175;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SgispnRGiERs1+W7dul4dADQxU06rFDdSLdU3q+mB2I=;
 b=dCWjcyn8unZsayboNJCe+BoNpmDmrwMNroKUlsVLK1NY7UJKyLtIlVnE
 bFG0UugOSih2cnFl6P4Bo+3nB12lR766vQwtGWdNk3cSJuLvRrgITyKrH
 6gdCQcssJSnXIhDIWXJ0KT6Uo50uG3S07qevJdCPDW5itFrRPnCecRcLB
 rzd+V3WfKg2JGjUddNVeceoos5dvpREHJD+FpHbWtvfyAZB0j9USvzTbj
 scEosn5d3HmwnYKAyR4HsmSRF3neA8ucLPdorYMSLxloVATMaFlQYsGYr
 w4wjJBvbcRJly9vxnemXTyfyqYXrRhTlXwRiVeQ1obfyXArAhvMy1XGX6 Q==;
X-CSE-ConnectionGUID: 4rTGyhHnQfi8pTdKUCkReg==
X-CSE-MsgGUID: UlNlJ4bOS8qGb/isnZ+Lqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46496632"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="46496632"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 02:36:15 -0700
X-CSE-ConnectionGUID: mTkNxxr4Qca0mpnG0U7HTg==
X-CSE-MsgGUID: pmEeVo+zTE+6jbTbe8oO7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="130360013"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 02:36:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1u4zBe-0000000CoGG-4B1K; Wed, 16 Apr 2025 12:36:06 +0300
Date: Wed, 16 Apr 2025 12:36:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <Z_96BpMMOzcotJqI@smile.fi.intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
 <87tt6opks7.fsf@intel.com> <20250416171917.0985c0eb@sal.lan>
 <20250416172901.60104103@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416172901.60104103@sal.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Apr 16, 2025 at 05:29:01PM +0800, Mauro Carvalho Chehab wrote:
> Em Wed, 16 Apr 2025 17:19:17 +0800
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> > Em Wed, 16 Apr 2025 11:34:16 +0300
> > Jani Nikula <jani.nikula@linux.intel.com> escreveu:
> > > On Wed, 16 Apr 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

...

> > > >  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> > > >        cmd_hdrtest = \
> > > >  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> > > > -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> > > > +		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \  
> > > 
> > > KERNELDOC is not set here.
> > 
> > > 
> > > /bin/sh: 1: -none: not found
> > 
> > Weird. This is set on Documentation/Makefile:
> > 
> > 	$ grep KERNELDOC Documentation/Makefile 
> > 	KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> > 	...
> > 
> > drivers/gpu/drm/Makefile should be able to see this variable there...
> 
> I suspect that the building system tries to confine variables to
> sub-directories, so maybe one solution would be to move it to the
> main makefile.
> 
> could you please check if this patch solves the issue?
> 
> [PATCH] Makefile: move KERNELDOC macro to the main Makefile
> 
> As kernel-doc script is used not only on Documentation, but
> also on scripts and drivers/drm Makefiles, move it to the
> main makefile, as otherwise sub-makefiles may not have it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index c022b97c487e..7a2069e87dbd 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -60,7 +60,6 @@ endif #HAVE_LATEXMK
>  # Internal variables.
>  PAPEROPT_a4     = -D latex_paper_size=a4
>  PAPEROPT_letter = -D latex_paper_size=letter
> -KERNELDOC       = $(srctree)/scripts/kernel-doc.py
>  KERNELDOC_CONF  = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)

In this case the _CONF makes sense to move together as they are coupled
semantically.

>  ALLSPHINXOPTS   =  $(KERNELDOC_CONF) $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
>  ifneq ($(wildcard $(srctree)/.config),)
> diff --git a/Makefile b/Makefile
> index 38689a0c3605..c8e46f0c1f63 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -458,6 +458,8 @@ endif
>  HOSTRUSTC = rustc
>  HOSTPKG_CONFIG	= pkg-config
>  
> +KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> +
>  KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
>  			 -O2 -fomit-frame-pointer -std=gnu11
>  KBUILD_USERCFLAGS  := $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)

-- 
With Best Regards,
Andy Shevchenko


