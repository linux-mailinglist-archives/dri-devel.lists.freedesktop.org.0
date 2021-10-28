Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F9A43DD8E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 11:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA53B6E939;
	Thu, 28 Oct 2021 09:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FDA6E939
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 09:16:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230312133"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="230312133"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 02:16:54 -0700
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="487056454"
Received: from djustese-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.254.12])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 02:16:51 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211028075155.02825f86@canb.auug.org.au>
References: <20210122115918.63b56fa1@canb.auug.org.au>
 <CAKMK7uEuJa1J66mo5dS+QRPy9NOENTx95SZ4rU2MeVRTWj7Kcw@mail.gmail.com>
 <20210122182946.6beb10b7@canb.auug.org.au>
 <CAKMK7uFWFVC0be2foiP8+2=vrqyh1e4mqkuk+2xY+fgSWAExyQ@mail.gmail.com>
 <163533676481.68716.4009950051571709814@jlahtine-mobl.ger.corp.intel.com>
 <20211028075155.02825f86@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the drm tree
Cc: "Nikula, Jani" <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163541260904.5162.14679444275127334752@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 28 Oct 2021 12:16:49 +0300
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

Quoting Stephen Rothwell (2021-10-27 23:51:55)
> Hi Joonas,
>=20
> On Wed, 27 Oct 2021 15:12:44 +0300 Joonas Lahtinen <joonas.lahtinen@linux=
.intel.com> wrote:
> >
> > We should be now good to go and add drm-intel-gt-next to linux-next.
> >=20
> > The branch would be as follows:
> >=20
> > drm-intel-gt-next     git://anongit.freedesktop.org/drm-intel for-linux=
-next-gt
> >=20
> > Notice the "-gt" and the end of the for-linux-next branch name. This sh=
ould eliminate
> > the gap we have been having.
>=20
> I have added it to linux-next from today.

Thanks!

> I called it just
> "drm-intel-gt" for consistency with the other drm trees in linux-next.

We use the drm-intel-gt-next as the branch name in repo and DIM tolling, so=
 if
we are after consistenty consistency, using the full name probably makes
sense. drm-intel-gt-next for name keeps open the option for separating
the drm-intel-gt-fixes too, if we decide to do so in the future.

> Currently I just have you listed as a contact, is there anyone else (or
> a list) that I should add?

Please do add Tvrtko (Cc'd). I guess it might make sense adding Jani and
Rodrigo too, as backups. Similarly Tvrtko could be added to the other
drm-intel-* trees. Doesn't hurt to have more eyes especially if some
folks are on a vacation.

Regards, Joonas

> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window.=20
>=20
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and=20
>      * destined for the current or next Linux merge window.
>=20
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
>=20
> --=20
> Cheers,
> Stephen Rothwell=20
> sfr@canb.auug.org.au
>=20
> --=20
> Cheers,
> Stephen Rothwell
