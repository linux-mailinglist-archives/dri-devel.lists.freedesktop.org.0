Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA5CC66DE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 08:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E95810E32F;
	Wed, 17 Dec 2025 07:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAJB9N+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAF410E32F;
 Wed, 17 Dec 2025 07:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765957936; x=1797493936;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=6EEx6wjGSM9/p8k0O03nggo+l2M+RSXW3PfeXkBT57M=;
 b=TAJB9N+8tR8FA8610f9+GzBQiILfwVteJhw/asgqe6f2IbDKj/oILTD1
 nsHHv9YuwLFLzYOH51zEEvQoBO64OF75dDVBFY/eYPj0NjD27UUMlJpav
 3u1kRjaJFkOIgRH+KnykuSF0rgnLcNPzw+5LY3403f0lZZKqlSiGp0P4x
 Xyep4HCtGt1NY+pG75z8hSzy9Yo83gZzjcigdNTSigs1A/env4cePDTiU
 hSrphM+Ymzk5n5dMU0OZNtY1YgDCrJnc2SWjZDyVuSr0LhMhjxAQ9wuzp
 +Ymlb+qEYuKuild4PoBOnnYR433h5PkrAzspfNTvSsFiXwZTZuz5XeyYX w==;
X-CSE-ConnectionGUID: xNJ9fvzKS6ugVJMG42cQJg==
X-CSE-MsgGUID: 3nHEiyJ2QDq1h8ODOKPWWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70467633"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="70467633"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 23:52:15 -0800
X-CSE-ConnectionGUID: FAip91TLSUS1AJSaBcImjw==
X-CSE-MsgGUID: SvSJtc+zTZGUIN2nMreMGw==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.148])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 23:52:13 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aUHRbTRd0NQ4GbXc@intel.com>
References: <20251216113512.153447-1-joonas.lahtinen@linux.intel.com>
 <aUHRbTRd0NQ4GbXc@intel.com>
Subject: Re: [PATCH] drm/i915: Mark dependency on CONFIG_X86_PAT
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Norbert Lange <nolange79@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?utf-8?b?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Date: Wed, 17 Dec 2025 09:52:10 +0200
Message-ID: <176595793039.8890.365691153363895249@jlahtine-mobl>
User-Agent: alot/0.12.dev7+g16b50e5f
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

Quoting Ville Syrj=C3=A4l=C3=A4 (2025-12-16 23:38:53)
> On Tue, Dec 16, 2025 at 01:35:12PM +0200, Joonas Lahtinen wrote:
> > Building the driver without CONFIG_X86_PAT would yield in reduced
> > platform/uAPI support and is not currently planned to be supported.
> >=20
> > Add a dependency in Kconfig to avoid issues with such build until
> > somebody steps up to fix and validate such builds.
>=20
> The driver works just fine w/o PAT on older GPUs at least.

Wouldn't this fall under the reduced platform support clause? Would you
like me to rephrase the above wording to be more clear?

The other option would be to identify all such platforms and only probe
driver for those at runtime if kernel was built with X86_PAT=3Dn.

Patches welcome :)

> Otherwise
> it wouldn't work at all on any P3 class CPU as the kernel completely
> disables PAT support on those even if the kernel is built with
> X86_PAT=3Dy.

That's interesting, thanks for sharing.

I guess that would be exactly to avoid having to support kernel
builds with X86_PAT=3Dn? At least the impact of limited functionality
is clearly limited to set of the older platforms which never had
the functionality to begin with even if we added new uAPI so that
shouldn't be a problem with diverging uAPI based on compile
time config.

Regards, Joonas

> You can also disable PAT on the command line with "nopat".
>=20
> >=20
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15410
> > Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Reported-by: Norbert Lange <nolange79@gmail.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/i915/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> > index 5e939004b6463..a19a233239056 100644
> > --- a/drivers/gpu/drm/i915/Kconfig
> > +++ b/drivers/gpu/drm/i915/Kconfig
> > @@ -2,7 +2,7 @@
> >  config DRM_I915
> >       tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
> >       depends on DRM
> > -     depends on X86 && PCI
> > +     depends on X86 && X86_PAT && PCI
> >       depends on !PREEMPT_RT
> >       select INTEL_GTT if X86
> >       select INTERVAL_TREE
> > --=20
> > 2.52.0
>=20
> --=20
> Ville Syrj=C3=83=C2=A4l=C3=83=C2=A4
> Intel
