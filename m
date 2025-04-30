Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB85AA5096
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 17:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D0110E2ED;
	Wed, 30 Apr 2025 15:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CvQkXnD6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECC310E2ED;
 Wed, 30 Apr 2025 15:42:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4F94F6842A;
 Wed, 30 Apr 2025 15:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBD8C4CEE7;
 Wed, 30 Apr 2025 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746027716;
 bh=wvXwtYYiGxiI48kMlFqI73B5EWv7xUXFBIxXkrTt+Bs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CvQkXnD6RRGzklG5EJL3MIu49bvDA2Vje5jq31Zjyv2Nscn6EYlldH9tuao2IjrML
 30afHneVRi57pHYoNLnfpYjhkW+6iyni/VCnNmF0bLvzCKxoD7P7TxdnLzmx3ge3c1
 7WJTUtpAsKUl9HOPPon78HV8gjsHURM10LYvOyhKXo6IVV8LT17RGpHUaWZpA2LcVw
 yJfadKUxfK8xiA+UbbkkA98320JxxNblIeSxw/HnCC3+0io8rJaIcRtdhr13ldlzZs
 9FKO+0ClU3Z+u2qmzU1g2y5vXwOZ3MX0tDU7NtpV3vFmhkera/NMv7fAYSfL8SPUv8
 7ZsdRDuSXAXIg==
Date: Wed, 30 Apr 2025 17:41:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, David Airlie <airlied@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 3/4] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <20250430174147.05b330a9@foz.lan>
In-Reply-To: <aAvYkchT7RISfxsX@fjasle.eu>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
 <158b962ed7cd104f7bbfe69f499ec1cc378864db.1745453655.git.mchehab+huawei@kernel.org>
 <aAvYkchT7RISfxsX@fjasle.eu>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

Em Fri, 25 Apr 2025 20:46:41 +0200
Nicolas Schier <nicolas@fjasle.eu> escreveu:

> On Thu, Apr 24, 2025 at 08:16:23AM +0800 Mauro Carvalho Chehab wrote:
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
> > Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
> Did someone check if we could add
> 
>   sys.dont_write_bytecode = True
> 
> to the script itself instead of cluttering PYTHONDONTWRITEBYTECODE
> everywhere [1]?

Nice to know that we can set it at the script level. Yet, this is is
meant to be a temporary solution, as IMO the best is to set
PYTHONCACHEPREFIX to match the directory on O=, when it is used.

Thanks,
Mauro
