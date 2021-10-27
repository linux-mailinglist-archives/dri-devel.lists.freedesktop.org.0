Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8330143C952
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 14:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3D089B66;
	Wed, 27 Oct 2021 12:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F2889A9F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 12:12:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="253694645"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="253694645"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 05:12:50 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="537504651"
Received: from aeremina-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.254.123])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 05:12:47 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAKMK7uFWFVC0be2foiP8+2=vrqyh1e4mqkuk+2xY+fgSWAExyQ@mail.gmail.com>
References: <20210122115918.63b56fa1@canb.auug.org.au>
 <CAKMK7uEuJa1J66mo5dS+QRPy9NOENTx95SZ4rU2MeVRTWj7Kcw@mail.gmail.com>
 <20210122182946.6beb10b7@canb.auug.org.au>
 <CAKMK7uFWFVC0be2foiP8+2=vrqyh1e4mqkuk+2xY+fgSWAExyQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm tree
To: "Nikula, Jani" <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163533676481.68716.4009950051571709814@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 27 Oct 2021 15:12:44 +0300
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

(+ Tvrtko who was recently added as a drm/i915 co-maintainer)

Quoting Daniel Vetter (2021-01-22 10:40:48)
> On Fri, Jan 22, 2021 at 8:29 AM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > Hi Daniel,
> >
> > On Fri, 22 Jan 2021 08:17:58 +0100 Daniel Vetter <daniel@ffwll.ch> wrot=
e:
> > >
> > > Hm that has been in drm-intel-gt-next for a few days, is that tree not
> > > in linux-next?
> >
> > It is not.

Hi Stephen,

We should be now good to go and add drm-intel-gt-next to linux-next.

The branch would be as follows:

drm-intel-gt-next	git://anongit.freedesktop.org/drm-intel	for-linux-next-gt

Notice the "-gt" and the end of the for-linux-next branch name. This should=
 eliminate
the gap we have been having. The change to add it to the DIM tool is here:

https://gitlab.freedesktop.org/drm/maintainer-tools/-/commit/7b5c2c29cdbc05=
4e8c8fce38f095c56290fc4833

So once all developers have updated their tooling (for which they will
get an automatic nag message) we should be all up-to-date for future
merge windows.

Regards, Joonas

> Adding -intel maintainers to get that sorted.
> -Daniel
>=20
> > These are the drm branches currently in linux-next:
>=20
> Oh for ordering maybe put drm-misc ahead of the other subtrees, -misc
> is where nowadays a lot of refactorings and core changes land.
> Probably doesn't matter in practice.
> -Daniel
>=20
> > drm-fixes       git://git.freedesktop.org/git/drm/drm.git       drm-fix=
es
> > amdgpu-fixes    git://people.freedesktop.org/~agd5f/linux       drm-fix=
es
> > drm-intel-fixes git://anongit.freedesktop.org/drm-intel         for-lin=
ux-next-fixes
> > drm-misc-fixes  git://anongit.freedesktop.org/drm/drm-misc      for-lin=
ux-next-fixes
> > drm             git://git.freedesktop.org/git/drm/drm.git       drm-next
> > amdgpu          https://gitlab.freedesktop.org/agd5f/linux      drm-next
> > drm-intel       git://anongit.freedesktop.org/drm-intel         for-lin=
ux-next
> > drm-tegra       git://anongit.freedesktop.org/tegra/linux.git   drm/teg=
ra/for-next
> > drm-misc        git://anongit.freedesktop.org/drm/drm-misc      for-lin=
ux-next
> > drm-msm         https://gitlab.freedesktop.org/drm/msm.git      msm-next
> > imx-drm         https://git.pengutronix.de/git/pza/linux        imx-drm=
/next
> > etnaviv         https://git.pengutronix.de/git/lst/linux        etnaviv=
/next
> >
> > --
> > Cheers,
> > Stephen Rothwell
>=20
>=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
