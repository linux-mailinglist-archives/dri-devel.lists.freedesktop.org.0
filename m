Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E56FA8B518
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 11:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A5B10E049;
	Wed, 16 Apr 2025 09:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OO9fL/pU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5D810E049;
 Wed, 16 Apr 2025 09:19:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D46B15C5B33;
 Wed, 16 Apr 2025 09:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBCBC4CEE2;
 Wed, 16 Apr 2025 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744795182;
 bh=3IzjhMKt3C/Wjt/0qk13UqqN5hoOSs+vGT3liSo6GvI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OO9fL/pUj0PmyztYhGQC0YKRuzcSnYK7Sib01pp7086unFIPzfMyFuzjMb2obH+hi
 UQxdF68uNvzqphRvvWoINuTeGaEDd3r+bbpUu1w7jGHFZfsrr9pCgERW06XLl3yRtI
 /SgQv63ZEzkJhHmvjyMSCbg7n303VUdpR8uYC+QYN8cYgAFqHVX4aNIyVJtyjVcRzy
 sCNuqf+1/iJdwM9XSfUHW28hHni0EbOsr9ftDIfnh69oaVtKW6X1IibMY0M0T5Mg8+
 vzk2HfEL30Uh5b13Hn3rL/O6w69cXIif8xk8aPjJWffbo8YGONdguhc5An3RZuhfFI
 PfiW3qQQXsL2Q==
Date: Wed, 16 Apr 2025 17:19:17 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Andy Shevchenko <andriy.shevchenko@intel.com>, David
 Airlie <airlied@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <20250416171917.0985c0eb@sal.lan>
In-Reply-To: <87tt6opks7.fsf@intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
 <87tt6opks7.fsf@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Em Wed, 16 Apr 2025 11:34:16 +0300
Jani Nikula <jani.nikula@linux.intel.com> escreveu:

> On Wed, 16 Apr 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > As reported by Andy, kernel-doc.py is creating a __pycache__
> > directory at build time.
> >
> > Disable creation of __pycache__ for the libraries used by
> > kernel-doc.py, when excecuted via the build system or via
> > scripts/find-unused-docs.sh.
> >
> > Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Closes: https://lore.kernel.org/linux-doc/Z_zYXAJcTD-c3xTe@black.fi.intel.com/
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/gpu/drm/Makefile      | 2 +-
> >  drivers/gpu/drm/i915/Makefile | 2 +-
> >  include/drm/Makefile          | 2 +-
> >  scripts/Makefile.build        | 2 +-
> >  scripts/find-unused-docs.sh   | 2 +-
> >  5 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index ed54a546bbe2..d21d0cd2c752 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -236,7 +236,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
> >  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> >        cmd_hdrtest = \
> >  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> > -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> > +		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \  
> 
> KERNELDOC is not set here.

> 
> /bin/sh: 1: -none: not found

Weird. This is set on Documentation/Makefile:

	$ grep KERNELDOC Documentation/Makefile 
	KERNELDOC       = $(srctree)/scripts/kernel-doc.py
	...

drivers/gpu/drm/Makefile should be able to see this variable there...

> 
> >  		touch $@
> >  
> >  $(obj)/%.hdrtest: $(src)/%.h FORCE
> > diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> > index ed05b131ed3a..ab6b89a163e7 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -408,7 +408,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
> >  #
> >  # Enable locally for CONFIG_DRM_I915_WERROR=y. See also scripts/Makefile.build
> >  ifdef CONFIG_DRM_I915_WERROR
> > -    cmd_checkdoc = $(srctree)/scripts/kernel-doc -none -Werror $<
> > +    cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none -Werror $<
> >  endif
> >  
> >  # header test
> > diff --git a/include/drm/Makefile b/include/drm/Makefile
> > index a7bd15d2803e..1df6962556ef 100644
> > --- a/include/drm/Makefile
> > +++ b/include/drm/Makefile
> > @@ -11,7 +11,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
> >  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> >        cmd_hdrtest = \
> >  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> > -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> > +		PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> >  		touch $@
> >  
> >  $(obj)/%.hdrtest: $(src)/%.h FORCE
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 13dcd86e74ca..884dc86ce04e 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -83,7 +83,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
> >  endif
> >  
> >  ifneq ($(KBUILD_EXTRA_WARN),)
> > -  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $(KDOCFLAGS) \
> > +  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(KDOCFLAGS) \
> >          $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
> >          $<
> >  endif
> > diff --git a/scripts/find-unused-docs.sh b/scripts/find-unused-docs.sh
> > index ee6a50e33aba..d6d397fbf917 100755
> > --- a/scripts/find-unused-docs.sh
> > +++ b/scripts/find-unused-docs.sh
> > @@ -54,7 +54,7 @@ for file in `find $1 -name '*.c'`; do
> >  	if [[ ${FILES_INCLUDED[$file]+_} ]]; then
> >  	continue;
> >  	fi
> > -	str=$(scripts/kernel-doc -export "$file" 2>/dev/null)
> > +	str=$(PYTHONDONTWRITEBYTECODE=1 scripts/kernel-doc -export "$file" 2>/dev/null)
> >  	if [[ -n "$str" ]]; then
> >  	echo "$file"
> >  	fi  
> 
