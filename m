Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B573E89F2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 07:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482E989EF7;
	Wed, 11 Aug 2021 05:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA7F89CAA;
 Wed, 11 Aug 2021 05:56:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="300649408"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="300649408"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 22:56:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="516413329"
Received: from mtiebout-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.238])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 22:56:33 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YRIcTTsEF0Kg7F8K@phenom.ffwll.local>
References: <20210715141854.1ad4a956@canb.auug.org.au>
 <162823181614.15830.10618174106053255881@jlahtine-mobl.ger.corp.intel.com>
 <YRE2RwQ6XlUqbgmn@phenom.ffwll.local>
 <20210809161939.GS1556418@mdroper-desk1.amr.corp.intel.com>
 <YRIcTTsEF0Kg7F8K@phenom.ffwll.local>
To: Daniel Vetter <daniel@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] linux-next: Signed-off-by missing for commit in the
 drm-intel tree
Cc: DRI <dri-devel@lists.freedesktop.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Dave Airlie <airlied@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <162866138994.4210.10598129488916811422@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 11 Aug 2021 08:56:29 +0300
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

+ Dave as FYI

Quoting Daniel Vetter (2021-08-10 09:27:25)
> On Mon, Aug 09, 2021 at 09:19:39AM -0700, Matt Roper wrote:
> > On Mon, Aug 09, 2021 at 04:05:59PM +0200, Daniel Vetter wrote:
> > > On Fri, Aug 06, 2021 at 09:36:56AM +0300, Joonas Lahtinen wrote:
> > > > Hi Matt,
> > > >=20
> > > > Always use the dim tooling when applying patches, it will do the ri=
ght
> > > > thing with regards to adding the S-o-b.
> > >=20
> > > fd.o server rejects any pushes that haven't been done by dim, so how =
did
> > > this get through?
> >=20
> > I definitely used dim for all of these patches, but I'm not sure how I
> > lost my s-o-b on this one.  Maybe when I edited the commit message after
> > 'dim extract-tags' I accidentally deleted an extra line when I removed
> > the extract-tags marker?  It's the only patch where the line is missing,
> > so it's almost certainly human error on my part rather than something
> > dim did wrong.
>=20
> Yeah that's an expected failure model, and dim is supposed to catch that
> by rechecking for sobs when you push. See dim_push_branch ->
> checkpatch_commit_push_range in dim. So you can hand-edit stuff however
> you want, dim /should/ catch it when pushing. That it didn't is kinda
> confusing and I'd like to know why that slipped through.
>=20
> > > Matt, can you pls figure out and type up the patch to
> > > plug that hole?
> >=20
> > Are you referring to a patch for dim here?  The i915 patch has already
> > landed, so we can't change its commit message now.
>=20
> Yeah dim, not drm-intel, that can't be fixed anymore because it's all
> baked in.
> -Daniel
>=20
> >=20
> >=20
> > Matt
> >=20
> > >=20
> > > Thanks, Daniel
> > >=20
> > > >=20
> > > > Regards, Joonas
> > > >=20
> > > > Quoting Stephen Rothwell (2021-07-15 07:18:54)
> > > > > Hi all,
> > > > >=20
> > > > > Commit
> > > > >=20
> > > > >   db47fe727e1f ("drm/i915/step: s/<platform>_revid_tbl/<platform>=
_revids")
> > > > >=20
> > > > > is missing a Signed-off-by from its committer.
> > > > >=20
> > > > > --=20
> > > > > Cheers,
> > > > > Stephen Rothwell
> > >=20
> > > --=20
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >=20
> > --=20
> > Matt Roper
> > Graphics Software Engineer
> > VTT-OSGC Platform Enablement
> > Intel Corporation
> > (916) 356-2795
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
