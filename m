Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F90D43AECA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 11:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC526E413;
	Tue, 26 Oct 2021 09:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CFF6E413;
 Tue, 26 Oct 2021 09:16:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="217030882"
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="217030882"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 02:15:59 -0700
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="537002362"
Received: from scelesti-mobl.amr.corp.intel.com (HELO localhost)
 ([10.249.254.162])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 02:15:56 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211025171321.GA9338@jons-linux-dev-box>
References: <20211020192147.8048-1-matthew.brost@intel.com>
 <a2d6a96b3f360991511e6e4969de83cea2f5a97a.camel@linux.intel.com>
 <163516458029.3804.14322548249266136569@jlahtine-mobl.ger.corp.intel.com>
 <20211025171321.GA9338@jons-linux-dev-box>
Subject: Re: [PATCH] drm/i915/guc: Fix recursive lock in GuC submission
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
To: Matthew Brost <matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163523975442.6968.9660235537397634312@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Tue, 26 Oct 2021 12:15:54 +0300
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

Quoting Matthew Brost (2021-10-25 20:13:22)
> On Mon, Oct 25, 2021 at 03:23:00PM +0300, Joonas Lahtinen wrote:
> > Quoting Thomas Hellstr=C3=B6m (2021-10-21 08:39:48)
> > > On Wed, 2021-10-20 at 12:21 -0700, Matthew Brost wrote:
> >=20
> > <SNIP>
> >=20
> > > > Fixes: 1a52faed31311 ("drm/i915/guc: Take engine PM when a context =
is
> > > > pinned with GuC submission")
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: stable@vger.kernel.org
> >=20
> > This Cc: stable annotation is unnecessary.
> >=20
> > Please always use "dim fixes 1a52faed31311" for helping to decide which
> > Cc's are needed. In this case stable is not needed. If it was, there
> > would be an indication of kernel version. In this case this is fine to
> > be picked up by in drm-intel-next-fixes PR.
> >=20
> > Let's pay attention to the right Fixes: annotation while submitting and
> > reviewing patches.
> >=20
>=20
> Will do. Working on getting push rights. Is there any documentation with
> all the rules when pushing as it seems like there are a lot of rules.

Yes, we have the documentation here:

https://drm.pages.freedesktop.org/maintainer-tools/committer-guidelines.html

And more specifically this topic:

https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-intel.html=
#labeling-fixes-before-pushing

I could even recommend to at least do a cursory read through the wider
documentation about how the different trees interact:

https://drm.pages.freedesktop.org/maintainer-tools/index.html

Makes it easier to understand how the tags are used.

Regards, Joonas

>=20
> Matt=20
>=20
> > Regards, Joonas
