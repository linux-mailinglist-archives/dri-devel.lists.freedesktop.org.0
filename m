Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8789F08A2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3B610E25C;
	Fri, 13 Dec 2024 09:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EKPV5Kl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D6610E25C;
 Fri, 13 Dec 2024 09:54:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BC621A42749;
 Fri, 13 Dec 2024 09:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC14BC4CED0;
 Fri, 13 Dec 2024 09:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1734083692;
 bh=9LZsjKsAc+6Iw2gaSCtWv/WFflDF2N7LtecKL0C01YE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EKPV5Kl8PeEjeUaffnb+abgznjDmgAQB0zNqMG75eG4RyUVRQsAMTPl/i6DgI2pRq
 G1zZUosNRsXPj029rHS84k7bqvDgwhl4YPCyR0tY7Nw++c9zb3AQfTXb3sB8V4MFh+
 zl21+tkI5Sk3saft0AVpoyTC8sZMaJo+UL4agwrs=
Date: Fri, 13 Dec 2024 10:54:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ed Maste <emaste@freebsd.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, chris.p.wilson@intel.com,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] drm/i915: Update license on selftest lists to MIT
Message-ID: <2024121302-porridge-justice-2b21@gregkh>
References: <20241208151727.71695-1-emaste@FreeBSD.org>
 <Z1jMZNgMssHyAzg2@intel.com>
 <2024121153-shawl-spearman-8e5f@gregkh>
 <CAPyFy2Aj4kKB7=dG+V32GCvGF1d+ekcyx5zamxjbr6rwLs24jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPyFy2Aj4kKB7=dG+V32GCvGF1d+ekcyx5zamxjbr6rwLs24jQ@mail.gmail.com>
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

On Thu, Dec 12, 2024 at 10:10:54AM -0500, Ed Maste wrote:
> On Wed, 11 Dec 2024 at 02:25, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Dec 10, 2024 at 06:19:00PM -0500, Rodrigo Vivi wrote:
> > > On Sun, Dec 08, 2024 at 03:17:27PM +0000, Ed Maste wrote:
> > > > These two files (i915_live_selftests.h, i915_mock_selftests.h) were
> > > > introduced in commit 953c7f82eb89 ("drm/i915: Provide a hook for
> > > > selftests") and are effectively just a list of selftests.
> > > >
> > > > The selftest implementation itself is largely in i915_selftest.c, and
> > > > uses a MIT license.  Graphics drivers are shared with other operating
> > > > systems and have long used a permissive license (or dual license) to
> > > > facilitate this.
> > > >
> > > > The two selftest list files carried no license when introduced in
> > > > 953c7f82eb89, presumably as they were considered trivial.  Notably the
> > > > general selftest header i915_selftest.h (which does have non-trivial
> > > > content) also has an MIT license.
> > > >
> > > > The GPL-2.0 SPDX tag in these two files came from b24413180f56, where
> > > > Greg Kroah-Hartman added the tag to all files that had no license.  This
> > > > makes sense in general, but it is clear from the context of the original
> > > > selftest commit here that these files are a trivial part of an otherwise
> > > > MIT-licensed patch to a MIT-licensed component, and should have an MIT
> > > > license.
> >
> > No, that is not clear, by default, anything without a license gets the
> > GPL2 license as that is the license of the entire body of code.
> 
> I mean the intent is clear from looking at the original patch in 953c7f82eb89:
> - drivers/gpu/drm/i915 is generally MIT licensed
> - 953c7f82eb89 added these two trivial files with no license text
> - that patch also added nontrivial new files with an MIT license
> 
> The same sort of issue affected drm/radeon, fixed in b7019ac550eb:
> 
>     drm/radeon: fix incorrrect SPDX-License-Identifiers
> 
>     radeon is MIT.  This were incorrectly changed in
>     commit b24413180f56 ("License cleanup: add SPDX GPL-2.0 license
> identifier to files with no license")
>     and
>     commit d198b34f3855 (".gitignore: add SPDX License Identifier")
>     and:
>     commit ec8f24b7faaf ("treewide: Add SPDX license identifier -
> Makefile/Kconfig")
> 
>     Fixes: d198b34f3855 (".gitignore: add SPDX License Identifier")
>     Fixes: ec8f24b7faaf ("treewide: Add SPDX license identifier -
> Makefile/Kconfig")
>     Fixes: b24413180f56 ("License cleanup: add SPDX GPL-2.0 license
> identifier to files with no license")
>     Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2053
>     Reviewed-by: Christian König <christian.koenig@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> 
> and drm/noveau, fixed in b7019ac550eb:
> 
>     drm/nouveau: fix bogus GPL-2 license header
> 
>     The bulk SPDX addition made all these files into GPL-2.0 licensed files.
>     However the remainder of the project is MIT-licensed, these files
>     (primarily header files) were simply missing the boiler plate and got
>     caught up in the global update.
> 
>     Fixes: b24413180f5 (License cleanup: add SPDX GPL-2.0 license
> identifier to files with no license)
>     Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
>     Acked-by: Emil Velikov <emil.l.velikov@gmail.com>
>     Acked-by: Karol Herbst <kherbst@redhat.com>
>     Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> 
> > > Chris, do you confirm your intention of MIT and not GPL for these files?
> > >
> > > Cc: Greg KH <gregkh@linuxfoundation.org>
> > >
> > > Greg, is this acceptable?
> >
> > You need to get a signed-off-by from everyone who has touched these
> > files, which is not what you have done here :(
> 
> Most of the contributions to these files were done by 13 Intel
> employees. Presumably a signed-off-by from someone at Intel is
> sufficient for all of them? I've CC'd other contributors to these two
> files for a signed-off-by.

Yes, if you get a signed-off-by from a lawyer at Intel, that should
cover their contributions, but you also need it for the other
contributors as well.

Good luck!

greg k-h
