Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3346F388993
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 10:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C201D6ECE0;
	Wed, 19 May 2021 08:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009596E19C;
 Wed, 19 May 2021 08:40:36 +0000 (UTC)
IronPort-SDR: aZYDvOuuBZHcspxgE/ve8EuwhN7l9eV6ckYK2i85czRwi8iRPtJ4KFh8nvFxsoShHheX/qFi+y
 Hloke28pWYvQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="197833152"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; 
 d="asc'?scan'208";a="197833152"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 01:40:36 -0700
IronPort-SDR: MrY+2h+hx37IZuK0QZzf3fgPh/EwjpJGvVRy80M9V3FlmN9mBTrade7HXKASObdfWqYjnWyHla
 YemORb5h6hSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; 
 d="asc'?scan'208";a="627534596"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 19 May 2021 01:40:33 -0700
Date: Wed, 19 May 2021 16:21:23 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm/i915/gvt: remove local storage of debugfs file
Message-ID: <20210519082123.GI4589@zhen-hp.sh.intel.com>
References: <20210518161705.3697143-1-gregkh@linuxfoundation.org>
 <YKPrRW+zBC8Wmjgz@kroah.com>
 <20210519080313.GH4589@zhen-hp.sh.intel.com>
 <YKTM1tQ7SMPnYgiV@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="q6mBvMCt6oafMx9a"
Content-Disposition: inline
In-Reply-To: <YKTM1tQ7SMPnYgiV@kroah.com>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--q6mBvMCt6oafMx9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.05.19 10:31:18 +0200, Greg Kroah-Hartman wrote:
> On Wed, May 19, 2021 at 04:03:13PM +0800, Zhenyu Wang wrote:
> > On 2021.05.18 18:28:53 +0200, Greg Kroah-Hartman wrote:
> > > On Tue, May 18, 2021 at 06:17:05PM +0200, Greg Kroah-Hartman wrote:
> > > > There is no need to keep the dentry around for the debugfs kvmgt ca=
che
> > > > file, as we can just look it up when we want to remove it later on.
> > > > Simplify the structure by removing the dentry and relying on debugfs
> > > > to find the dentry to remove when we want to.
> > > >=20
> > > > By doing this change, we remove the last in-kernel user that was st=
oring
> > > > the result of debugfs_create_long(), so that api can be cleaned up.
> > > >=20
> > > > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > > Cc: Zhi Wang <zhi.a.wang@intel.com>
> > > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: intel-gvt-dev@lists.freedesktop.org
> > > > Cc: intel-gfx@lists.freedesktop.org
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > ---
> > > >  drivers/gpu/drm/i915/gvt/kvmgt.c | 11 +++++------
> > > >  1 file changed, 5 insertions(+), 6 deletions(-)
> > >=20
> > > Note, I can take this through my debugfs tree if wanted, that way I c=
an
> > > clean up the debugfs_create_long() api at the same time.  Otherwise i=
t's
> > > fine, I can wait until next -rc1 for that to happen.
> > >=20
> >=20
> > It's fine with me to go through debugfs tree. Just double check that re=
cent
> > kvmgt change would not cause conflict with this as well.
>=20
> How can I check that?  I'll be glad to take this through my tree, we can
> handle the merge issues later for 5.14-rc1 :)
>=20

Current kvmgt change in merge queue is just https://patchwork.freedesktop.o=
rg/patch/433536/?series=3D89995&rev=3D2
It applies fine with debugfs change.


--q6mBvMCt6oafMx9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYKTKfgAKCRCxBBozTXgY
J2A8AJ47qrLT92YbMGpq+0Oh7RBcZmKNaQCghT4HV9a6e0VBuuJd0a9WrealPM0=
=OD41
-----END PGP SIGNATURE-----

--q6mBvMCt6oafMx9a--
