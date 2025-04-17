Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D47A91416
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 08:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5204310E00C;
	Thu, 17 Apr 2025 06:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i1X0TxiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1144B10E00C;
 Thu, 17 Apr 2025 06:32:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A608568430;
 Thu, 17 Apr 2025 06:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3796AC4CEE4;
 Thu, 17 Apr 2025 06:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744871535;
 bh=ynTXwFihEEN4bWQSiOjx5PziQ0jr0xeEIjU1wRMCN5s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i1X0TxiQOZSCNkdxdA84ZA0me1j+dxbHbsBHgMZp5Be5+ygw6IfsQbY/N2W4/VcBx
 dr3KbLsUdqif2zDHKAFKmH0y3i5/88KAw30eAVb9fUYsmaIkCTfl6GBIkF6E9OAASQ
 WpFagCAj69cBVVoN2EjPstIrVOEhHz8io9ETBiGIpbPGi0cvjbqAN5stIvibK0z8az
 87dl5WDaXXlE5wDQImRmf/Ma9g4wPoOYBBgLuWAI4CpJizOin1q2upAlpeHfIivRWv
 VI+Uh3FaHhdZXNaNT2E8z2k9YVc1dMc5G6HztFRXQfajDSlYn6D1z+8uuaZsWXw9C2
 GBe9TWNwNhY8Q==
Date: Thu, 17 Apr 2025 14:31:52 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, David Airlie
 <airlied@gmail.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <20250417143152.24371d26@sal.lan>
In-Reply-To: <Z_96BpMMOzcotJqI@smile.fi.intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
 <87tt6opks7.fsf@intel.com> <20250416171917.0985c0eb@sal.lan>
 <20250416172901.60104103@sal.lan>
 <Z_96BpMMOzcotJqI@smile.fi.intel.com>
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

Em Wed, 16 Apr 2025 12:36:06 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> escreveu:

> On Wed, Apr 16, 2025 at 05:29:01PM +0800, Mauro Carvalho Chehab wrote:
> > Em Wed, 16 Apr 2025 17:19:17 +0800
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:  
> > > Em Wed, 16 Apr 2025 11:34:16 +0300
> > > Jani Nikula <jani.nikula@linux.intel.com> escreveu:  
> > > > On Wed, 16 Apr 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:  
> 
> ...
> 
> > > > >  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> > > > >        cmd_hdrtest = \
> > > > >  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> > > > > -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> > > > > +		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \    
> > > > 
> > > > KERNELDOC is not set here.  
> > >   
> > > > 
> > > > /bin/sh: 1: -none: not found  
> > > 
> > > Weird. This is set on Documentation/Makefile:
> > > 
> > > 	$ grep KERNELDOC Documentation/Makefile 
> > > 	KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> > > 	...
> > > 
> > > drivers/gpu/drm/Makefile should be able to see this variable there...  
> > 
> > I suspect that the building system tries to confine variables to
> > sub-directories, so maybe one solution would be to move it to the
> > main makefile.
> > 
> > could you please check if this patch solves the issue?
> > 
> > [PATCH] Makefile: move KERNELDOC macro to the main Makefile
> > 
> > As kernel-doc script is used not only on Documentation, but
> > also on scripts and drivers/drm Makefiles, move it to the
> > main makefile, as otherwise sub-makefiles may not have it.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > 
> > diff --git a/Documentation/Makefile b/Documentation/Makefile
> > index c022b97c487e..7a2069e87dbd 100644
> > --- a/Documentation/Makefile
> > +++ b/Documentation/Makefile
> > @@ -60,7 +60,6 @@ endif #HAVE_LATEXMK
> >  # Internal variables.
> >  PAPEROPT_a4     = -D latex_paper_size=a4
> >  PAPEROPT_letter = -D latex_paper_size=letter
> > -KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> >  KERNELDOC_CONF  = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)  
> 
> In this case the _CONF makes sense to move together as they are coupled
> semantically.

In a matter of fact, it doesn't...

> >  ALLSPHINXOPTS   =  $(KERNELDOC_CONF) $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)

This is just part of ALLSPHINXOPTS, where it places two definitions
to be used by the Sphinx kerneldoc extension. I need to double-check
it, but I suspect that this is not even used there anymore. If it is
still used, it can be cleaned up after we remove the Perl version.

So, I prefer to keep this (perhaps with a different name) at the
documentation makefile.

Regards,
Mauro
