Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E471FC743
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0216EAA6;
	Wed, 17 Jun 2020 07:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBF96E8D6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 14:41:24 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 624471C0BD2; Tue, 16 Jun 2020 16:41:22 +0200 (CEST)
Date: Tue, 16 Jun 2020 16:41:22 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [RFC PATCH 0/4] DirectX on Linux
Message-ID: <20200616144122.GA18447@duo.ucw.cz>
References: <20200519163234.226513-1-sashal@kernel.org>
 <55c57049-1869-7421-aa0f-3ce0b6a133cf@suse.de>
 <20200616105112.GC1718@bug> <20200616132819.GP1931@sasha-vm>
MIME-Version: 1.0
In-Reply-To: <20200616132819.GP1931@sasha-vm>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: linux-hyperv@vger.kernel.org, sthemmin@microsoft.com,
 tvrtko.ursulin@intel.com, gregkh@linuxfoundation.org, haiyangz@microsoft.com,
 spronovo@microsoft.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linux-fbdev@vger.kernel.org, wei.liu@kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, iourit@microsoft.com,
 alexander.deucher@amd.com, kys@microsoft.com, Hawking.Zhang@amd.com
Content-Type: multipart/mixed; boundary="===============0537755470=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0537755470==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-06-16 09:28:19, Sasha Levin wrote:
> On Tue, Jun 16, 2020 at 12:51:13PM +0200, Pavel Machek wrote:
> > Hi!
> >=20
> > > > The driver creates the /dev/dxg device, which can be opened by user=
 mode
> > > > application and handles their ioctls. The IOCTL interface to the dr=
iver
> > > > is defined in dxgkmthk.h (Dxgkrnl Graphics Port Driver ioctl
> > > > definitions). The interface matches the D3DKMT interface on Windows.
> > > > Ioctls are implemented in ioctl.c.
> > >=20
> > > Echoing what others said, you're not making a DRM driver. The driver =
should live outside
> > > of the DRM code.
> > >=20
> >=20
> > Actually, this sounds to me like "this should not be merged into linux =
kernel". I mean,
> > we already have DRM API on Linux. We don't want another one, do we?
>=20
> This driver doesn't have any display functionality.

Graphics cards without displays connected are quite common. I may be
wrong, but I believe we normally handle them using DRM...

> > And at the very least... this misses API docs for /dev/dxg. Code can't =
really
> > be reviewed without that.
>=20
> The docs live here: https://docs.microsoft.com/en-us/windows-hardware/dri=
vers/ddi/d3dkmthk/

I don't see "/dev/dxg" being metioned there. Plus, kernel API
documentation should really go to Documentation, and be suitably
licensed.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXujaEgAKCRAw5/Bqldv6
8q/JAKCQjRPnkrFqnsMWU0xDN/FHE1enzwCeMHA4YAkm0yQfrg+8eKiMWa/ARU8=
=bHer
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--

--===============0537755470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0537755470==--
