Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2809979014E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 19:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFE410E066;
	Fri,  1 Sep 2023 17:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26CD10E066
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1693588800; x=1694193600; i=j.neuschaefer@gmx.net;
 bh=ndEoFRJfDS9SCk3baTyeGk8tFTWpI9NpWJxPLC86/A4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=GphXPdnxQGN0zGSfiU5k22UwJdXDCMTLz1mjzzbHlHl3fHT5qnkB5+O9O8csD2BSDphzN/0
 NfFugNWTjhzI1Ih+XToJujAku08gGPTGGg8aXrsB08PPCS0C1yTqNOZ+a7uyJoyhhclsYWrRq
 O9atkYxJmKOsd2WLC1kGjbboIltQCLLl/YGe3TE8kLE53dxzsBbvFy8rI+dRpe9EmNouoa0vB
 GzP25oFTHpuIqwlnYuCUtImSHF86bZx6KyxXs5rO4XZXIoxZVAtdl6RwpmIhX5CeI1DhxITM+
 weSMWPvLzaio2bPuRYIXHMmom481HJ3aN498ssg3Wk8OHxNUHBxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.154.222.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWzjt-1q9sV70xZJ-00XMOR; Fri, 01
 Sep 2023 19:20:00 +0200
Date: Fri, 1 Sep 2023 19:19:56 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev: Update fbdev source file paths
Message-ID: <ZPIdPOFbhLCpODIJ@probook>
References: <20230829200253.1473891-1-j.neuschaefer@gmx.net>
 <d9a02d20-8b59-cbdd-d054-eac14f9771d2@suse.de>
 <ZPA26xdbTRdfuveS@probook> <ZPBUdJwZzvYYrNei@phenom.ffwll.local>
 <d0646771-d426-45c6-e189-517b1e6e6248@gmx.de>
 <b8a04a40-a8ad-16ef-fdde-e56acb6845ca@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="S0SJhlmv8RAfrKFu"
Content-Disposition: inline
In-Reply-To: <b8a04a40-a8ad-16ef-fdde-e56acb6845ca@gmx.de>
X-Provags-ID: V03:K1:2pZbCDNpIV3lYRKKD61SN6RHG6Iz4I+1MyrjhbZzrJFD1bAFayO
 Uj6AIBX/6j3ven3LBcVbkQhbRJ2758JxVIu+lEsWImKVMl4f+loJsx5WIhxZ078PscHammZ
 1a9GYC9FvxMIxyCgXuf0lnGBy1ajnRNtImvbBdLZzuLjq9QUxZzeI7lu4BEa3FLmrGdrQNT
 P/2G4VqG4ZTPZsDApSjoA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AbjHmf8c+1s=;m5T7KIgPfsxRuqwzjqQU8bfuxP3
 dqndZht2UDVYf/zrril8XGnsx0+O3zEhrXIxNL6+9sdxm6T2sPLkY+e5OTmd2tj/wvKHbKRjI
 Oum7LmUlrkz+Rvm3lTys0p1x/qO5YEcBik3bgv2MfV468wggL1Cadvuv8WG8HEAxEqa+CnFXq
 RPy3Dtv/C0ZZQq0IYD3xEu5wPTI3RbZMKeCU9WynXg4dlMwOVyYXXWoYHD6FUZ6TybTBaKyHd
 Ta9olmyc/lQOdal6k+zMWMw88QoKphzcOEBPw3aMHcXLNrR+aFM3Ch7kxOAhR6FX0KoogFPok
 xO60tDy2CGQt/gmNvMtYnlqw52Bqv1v/k8bl16KDPP3ImcsIAYHG6XaGhSTAINIgVjGmULuym
 BXmnhKaunQCOKLYheLg4ijY9DSSJHq5QyBht2ZhIHEfACcfouOxVeCGmOrNmox8ZGSnpghwHu
 jNlwd18tmnRpgC/LGcBH1bjqPQFKxsZLF3ZdsEqTolxL/zczP1qJAfyqZxUI0ArZCkKBmWhPL
 UPuLteBQoTVs+tK4s4QvsmY7IH8rMZJWU2sSeoRDzM2DPP4mYiX1uhCuqkdWPE8i4bGEVMthZ
 /VOvmiFIbyIRZiCaGr89u0+VFRC9iS14hs6WnniMOlyGoa9A6XKQdg63ZboTR46pmzxJq4Lph
 KXT0Eat6ocmvRAk0gfJKmhcTLH8r6N+F6s+dBb2rIzUMhjZ7o2C1MbuhwQXPqqmikrXJulkzo
 rLtxMc4oOmMG7wldzLFfB6vSN+HfRd5s86X2/CecLCLbDOAHFm2+uhCAFPCVG5LPME1QXCB3R
 gcvb2RV0OpSR8zY6zB6E8TQAdSPmh3cDWsLemauGdr2PP5SREcfMU/CG+gsTYO4V5J68PM0wP
 NauVmndkcP+M25ICaF3L8lsoN43dR57O9sZAtL+0FkFci7a3t8a6XviGdcXlyro9xF2rTf+yj
 dgkl6w==
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--S0SJhlmv8RAfrKFu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 11:49:47PM +0200, Helge Deller wrote:
> On 8/31/23 11:02, Helge Deller wrote:
> > On 8/31/23 10:51, Daniel Vetter wrote:
> > > On Thu, Aug 31, 2023 at 08:44:59AM +0200, Jonathan Neusch=C3=A4fer wr=
ote:
> > > > On Wed, Aug 30, 2023 at 09:10:26AM +0200, Thomas Zimmermann wrote:
> > > > > Hi
> > > > >=20
> > > > > Am 29.08.23 um 22:02 schrieb Jonathan Neusch=C3=A4fer:
> > > > > > The files fbmem.c, fb_defio.c, fbsysfs.c, fbmon.c, modedb.c, and
> > > > > > fbcmap.c were moved to drivers/video/fbdev, and subsequently to
> > > > > > drivers/video/fbdev/core, in the commits listed below.
> > > > > >=20
> > > > > > Reported by kalekale in #kernel (Libera IRC).
> > > > > >=20
> > > > > > Fixes: f7018c213502 ("video: move fbdev to drivers/video/fbdev")
> > > > > > Fixes: 19757fc8432a ("fbdev: move fbdev core files to separate =
directory")
> > > > > > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > > > >=20
> > > > > IMHO these comments might just be removed.
> > > >=20
> > > > I think it's nice to have some sort of visual separation between gr=
oups
> > > > of functions in fb.h, which these comments provide at the moment.
> > > > Therefore I'm currently leaning towards my patch as it is, but I'm
> > > > willing to have my mind changed and do a v2 which just removes the
> > > > comments.
> > >=20
> > > Just the filename without the full path maybe?
> >=20
> > Yes, I'd prefer that as well.
>=20
> I've manually changed it and applied the patch to the fbdev git tree.

Thanks, everyone!

Jonathan

--S0SJhlmv8RAfrKFu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmTyHRwACgkQCDBEmo7z
X9uvdA//YmdduRn9/SYErFaEN2UFGbboxV7N7YFTOx8/SNIX9lfrHqRGrgux0O7X
FnmS+vetc6nWG/1GWn5y9NlZyMjl73JLcYpoWggLbFv+oNFMplEKSF2Q6E1f/lFl
U5M8weWOIeF4UXciwvZCf13A9+zcm/0J2iCRjbm38Strvg0m1irRW4bvx1S9J5QT
gYTpCx9ooJAln9Bb4zJcm6mpuFBJGYMkyf1zG9cP1MdciGeafmEYcWhXWCrVsyPi
vcz8/V/YJ+8Oa1ERaoFCQM0VWXtTPjkLaib/6tiImW257jS/FYcIlQZxIWfL9ARR
MLFm7IXtyzKy9kRpZTmjYZP9N4bq9NN/Mzn8NCFr/tmwPoLXwSCtgGetFVtAzB4B
U/Wadkx5EewVzT1+Z2v+67QrsiW4uAPHfQ8AYU1cM1n23nfKrkQqlRcxVuGnsHGR
7ztSq+BIUbBryDkseGCSoxMVe0YU5kwFKMZrDUBXy8FEsIRpZBy4U2Noc/vtixow
OpAa4BlIW/G6K4cPJYJgrnBt50v6NwaagLOWT9OVGZLThRz7YCwi5kG0VoTPozFB
4yje+8WkpQnvRuKbYrAUGkojrg34ZxJ7DeppJkkRfgxcUZexJaZDsMELNBKDaeOI
YqbpKTJAFQzbdL9H9cmUR3VJHntvGznO+sGTI90ffK6owMFlQ4I=
=811W
-----END PGP SIGNATURE-----

--S0SJhlmv8RAfrKFu--
