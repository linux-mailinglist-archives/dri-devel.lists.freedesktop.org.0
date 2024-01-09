Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772C882A881
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 08:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CFD10E7F6;
	Thu, 11 Jan 2024 07:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A4710E7D7;
 Thu, 11 Jan 2024 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704959053; x=1736495053;
 h=message-id:subject:from:to:cc:in-reply-to:references:
 content-transfer-encoding:mime-version:date;
 bh=DNNc4gN4VMyhwDSa/v/eGAro1L557ukFzFUhkHBLr44=;
 b=GD7QSRUHgV9oC9S+7jkgJZyXhkJH+oQ2P4MluoFdjfAhYDpG0CSCZ56A
 GqJs3CMBvRyM/FCYzMmQj4o+23Yv6wlpGBWxNglyx0tO5dqMZUcxjKYEL
 bg5gqDXCX5rFsRBch9UgWVnJ6Tvay0h25ZrHZ5aG0hRwnUDBE6ywzzC9U
 nQpV3X1QFmqu4guldQhKF/tniyIMvmdE9xOlqMZtr3Q+4oa9PGktNNs4W
 TSCQ4YBfja+zuQmvHwXpsx3QCJ6s5OW1e1zxcn+6MiA5Cdb2jJxwj5bxF
 vaIxce+/L+1MODgo/FfMibhU7xlCZwx0WQp7XbLll4dae3ZZ7umG7NG+R g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5853255"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="5853255"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 23:44:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="775524881"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="775524881"
Received: from dhermamx-mobl1.amr.corp.intel.com (HELO [10.249.254.19])
 ([10.249.254.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 23:44:10 -0800
Message-ID: <2e425df9eb24118cefbdee6f81f08e92bce6aada.camel@linux.intel.com>
Subject: Re: [PATCH] nightly.conf: Add the xe repo to drm-tip
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
In-Reply-To: <6dkiwe24dlanapcudkrbionkbc2lycqqghify6rkh2oux663w4@o4ekhar7flzm>
References: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
 <ZYsb09nsERQFDCQl@intel.com>
 <9541c844440e8b0fc5686e19850a04c7a55745ba.camel@linux.intel.com>
 <ktdr7l23leikip3hsmbxr2iirmz5zat7wck2ib6lbijl3uybtu@4iqn3adhfzyv>
 <ZZxzn1zdye92n5C-@intel.com>
 <6dkiwe24dlanapcudkrbionkbc2lycqqghify6rkh2oux663w4@o4ekhar7flzm>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Date: Tue, 09 Jan 2024 14:46:03 +0100
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2024-01-08 at 16:22 -0600, Lucas De Marchi wrote:
> On Mon, Jan 08, 2024 at 05:13:51PM -0500, Rodrigo Vivi wrote:
> > On Wed, Jan 03, 2024 at 11:59:16PM -0600, Lucas De Marchi wrote:
> > > On Wed, Jan 03, 2024 at 02:50:57PM +0100, Thomas Hellstr=C3=B6m wrote=
:
> > > > On Tue, 2023-12-26 at 13:30 -0500, Rodrigo Vivi wrote:
> > > > > On Fri, Dec 22, 2023 at 12:36:39PM +0100, Thomas Hellstr=C3=B6m
> > > > > wrote:
> > > > > > Add the xe repo to drm-tip and the dim tools.
> > > > > > For now use the sha1 of the first drm-xe-next pull request
> > > > > > for drm-
> > > > > > tip,
> > > > > > since that branch tip is currently adapted for our CI
> > > > > > testing.
> > > > > >=20
> > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > Cc: Oded Gabbay <ogabbay@kernel.org>
> > > > > > Cc: daniel.vetter@ffwll.ch
> > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > Cc: dim-tools@lists.freedesktop.org
> > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > Cc: intel-gfx@lists.freedesktop.org
> > > > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > > > <thomas.hellstrom@linux.intel.com>
> > > > > > ---
> > > > > > =C2=A0nightly.conf | 7 +++++++
> > > > > > =C2=A01 file changed, 7 insertions(+)
> > > > > >=20
> > > > > > diff --git a/nightly.conf b/nightly.conf
> > > > > > index 24126b61b797..accd3ff2cc39 100644
> > > > > > --- a/nightly.conf
> > > > > > +++ b/nightly.conf
> > > > > > @@ -24,6 +24,10 @@ git://anongit.freedesktop.org/drm-tip
> > > > > > =C2=A0https://anongit.freedesktop.org/git/drm/drm-tip
> > > > > > =C2=A0https://anongit.freedesktop.org/git/drm/drm-tip.git
> > > > > > =C2=A0"
> > > > > > +drm_tip_repos[drm-xe]=3D"
> > > > > > +ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
> > > > > > +https://gitlab.freedesktop.org/drm/xe/kernel.git
> > > > > > +"
> > > > > > =C2=A0drm_tip_repos[drm-intel]=3D"
> > > > > > =C2=A0ssh://git.freedesktop.org/git/drm/drm-intel
> > > > > > =C2=A0ssh://git.freedesktop.org/git/drm-intel
> > > > > > @@ -65,14 +69,17 @@ drm_tip_config=3D(
> > > > > > =C2=A0	"drm			drm-fixes"
> > > > > > =C2=A0	"drm-misc		drm-misc-fixes"
> > > > > > =C2=A0	"drm-intel		drm-intel-fixes"
> > > > > > +	"drm-xe			drm-xe-fixes"
> > > > > > =C2=A0
> > > > > > =C2=A0	"drm			drm-next"
> > > > > > =C2=A0	"drm-misc		drm-misc-next-fixes"
> > > > > > =C2=A0	"drm-intel		drm-intel-next-fixes"
> > > > > > +	"drm-xe			drm-xe-next-fixes"
> > > > > > =C2=A0
> > > > > > =C2=A0	"drm-misc		drm-misc-next"
> > > > > > =C2=A0	"drm-intel		drm-intel-next"
> > > > > > =C2=A0	"drm-intel		drm-intel-gt-next"
> > > > > > +	"drm-xe			drm-xe-next
> > > > > > b6e1b7081768"
> > > > >=20
> > > > > yeap, up to this commit nothing else should change, but
> > > > > then we will need an extra rebase of the rest on top of
> > > > > drm/drm-next.
> > > > >=20
> > > > > But then we need to decide where these following patches will
> > > > > live:
> > > > > 880277f31cc69 drm/xe/guc: define LNL FW
> > > > > 2cfc5ae1b8267 drm/xe/guc: define PVC FW
> > > > > 52383b58eb8cf mei/hdcp: Also enable for XE
> > > > > bea27d7369855 mei: gsc: add support for auxiliary device
> > > > > created by
> > > > > Xe driver
> > > > > fcb3410197f05 fault-inject: Include linux/types.h by default.
> > > > > 8ebd9cd71f8ac drm/xe: Add PVC's PCI device IDs
> > > > >=20
> > > > >=20
> > > > > Will it be the topic/core-for-CI?
> > > > > or topic/xe-extras?
> > > > > or what?
> > > >=20
> > > > This sounds to me like topic/core-for-CI? Or is there any
> > > > drawback with
> > > > that?
> > >=20
> > > I think some of them are not really a "for CI". It's more like
> > > the
> > > workflow we are adopting e.g. with guc/huc, not sending it to
> > > linux-firmware
> > > until we are confident on what version we will start officially
> > > supporting.
> >=20
> > yeap, I kind of agree here, but at the same time it is our way to
> > run
> > our CI with the firmware blobs that we need while not final, and
> > also
> > this was already used for i915's MTL firmware.
>=20
> ok
>=20
> >=20
> > >=20
> > > This one can't go to topic/core-for-CI neither:
> > > 	fcb3410197f05 fault-inject: Include linux/types.h by
> > > default.
> > >=20
> > > what it would do would be that we would not see the build error
> > > anymore,
> > > but everyone else would (and it's not a CI-only configuration).
> > > Unless it's merged to another branch, we shouldn't merge it.
> >=20
> > yeap. it is sad that we were ignored there. let's just drop this
> > then.
> > our driver is workarounding this bug anyway already.
>=20
> agreed, let's drop it.
>=20
> >=20
> >=20
> > >=20
> > > "52383b58eb8cf mei/hdcp: Also enable for XE" could be material
> > > for
> > > topic/core-for-CI and=C2=A0 "8ebd9cd71f8ac drm/xe: Add PVC's PCI
> > > device IDs"
> > > could either be on that branch or another xe-specific one.
> >=20
> > yeap. For the MEI we probably need to ping Greg on the original
> > submission and ask his ack so we can put that in the final drm-xe-
> > next
> > for good and not even include in a topic branch.
> >=20
> > for the PVC IDs, the topic branch could be okay as well. But if we
> > end up with an exclusive branch for xe, then it is better there.
>=20
> fair enough... I'm ok starting with topic/core-for-CI and if it ever
> becomes a problem, to create a xe-specific topic branch.

Actually looking at the documented rules for core-for-CI, I think we
should create a topic branch drm-xe/xe-for-CI or something similar that
hold the patches that touch the xe driver. core-for-CI is meant for
changes outside of drm and when rebased should be rooted in a linux
upstream release or -rc. I figure we'd want xe-for-CI to be rooted in
drm-xe-next assuming we may want to change the code these patches touch
and quickly rebase xe-for-CI accordingly?

/Thomas

>=20
> thanks
> Lucas De Marchi
>=20
> >=20
> > >=20
> > > >=20
> > > > >=20
> > > > > Anyway, for the inclusion like this, after our CI is ready:
> > > >=20
> > > > Could we merge this patch already at this point, considering it
> > > > will,
> > > > at least for now, only update drm-tip with our fixes?
> > >=20
> > > ack
> > >=20
> > > Lucas De Marchi
> > >=20
> > > >=20
> > > > Thanks,
> > > >=20
> > > > /Thomas
> > > >=20
> > > >=20
> > > > >=20
> > > > > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > >=20
> > > > > > =C2=A0
> > > > > > =C2=A0	"drm-intel		topic/core-for-CI"
> > > > > > =C2=A0	"drm-misc		topic/i915-ttm"
> > > > > > --
> > > > > > 2.42.0
> > > > > >=20
> > > >=20

