Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F060A8B59D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 11:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E6E10E8B4;
	Wed, 16 Apr 2025 09:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J5eYNU70";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F5210E8B4;
 Wed, 16 Apr 2025 09:38:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4F3164A253;
 Wed, 16 Apr 2025 09:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B442C4CEED;
 Wed, 16 Apr 2025 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744796317;
 bh=+ZCWbE1PR1VWajVp5YhiYDBJVfRXd0HwklhLy77IOWI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J5eYNU70oLJ0F1Q9S/3mFsHhNQ/7mz9Cowdbh+vkRpjA/X57MT+RQ8apm9iZz+2r/
 NgeC6JlaQHH26sf3mfYC0lsJKDR8CmG1iwguO7pVLVs+q3ML81C70/y9tON46gHKKR
 g3vj31zi6pfp2nWRDrFExRd1pBxQ4bGzDpp4QPb0P93SxWlIp4sHfyMzV57QKDxk3O
 DQ8QKj74wOvwEYvbb7hNbbm/bd4/Q+vPEtZg2RtA9nG7ghOPWpXVjIIVCOOCn6/PsY
 fYG1LajUfhqaX2GKX3E2OJdSgAwWZz7sa/V43RPpfxaVOU82iLmPNx9k09o+vJ7gFD
 1csmdSufPcBRQ==
Date: Wed, 16 Apr 2025 17:38:11 +0800
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
Message-ID: <20250416173811.71c3c345@sal.lan>
In-Reply-To: <20250416172901.60104103@sal.lan>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
 <87tt6opks7.fsf@intel.com> <20250416171917.0985c0eb@sal.lan>
 <20250416172901.60104103@sal.lan>
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

Em Wed, 16 Apr 2025 17:29:01 +0800
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Wed, 16 Apr 2025 17:19:17 +0800
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
> > Em Wed, 16 Apr 2025 11:34:16 +0300
> > Jani Nikula <jani.nikula@linux.intel.com> escreveu:
> > 
> > > On Wed, 16 Apr 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > > > As reported by Andy, kernel-doc.py is creating a __pycache__
> > > > directory at build time.
> > > >
> > > > Disable creation of __pycache__ for the libraries used by
> > > > kernel-doc.py, when excecuted via the build system or via
> > > > scripts/find-unused-docs.sh.
> > > >
> > > > Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > > Closes: https://lore.kernel.org/linux-doc/Z_zYXAJcTD-c3xTe@black.fi.intel.com/
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/Makefile      | 2 +-
> > > >  drivers/gpu/drm/i915/Makefile | 2 +-
> > > >  include/drm/Makefile          | 2 +-
> > > >  scripts/Makefile.build        | 2 +-
> > > >  scripts/find-unused-docs.sh   | 2 +-
> > > >  5 files changed, 5 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > > index ed54a546bbe2..d21d0cd2c752 100644
> > > > --- a/drivers/gpu/drm/Makefile
> > > > +++ b/drivers/gpu/drm/Makefile
> > > > @@ -236,7 +236,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
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

Answering myself: it doesn't.

Heh, trying to quickly write a patch before calling it a day is
usually not a good idea ;-)

I'll send a fix tomorrow.

Regards,
Mauro
