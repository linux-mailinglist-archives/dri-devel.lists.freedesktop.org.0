Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 586D23D20E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 18:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2090A88FCF;
	Tue, 11 Jun 2019 16:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B9988FCF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 16:19:24 +0000 (UTC)
Received: from earth.universe (host-091-097-064-220.ewe-ip-backbone.de
 [91.97.64.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B04E20645;
 Tue, 11 Jun 2019 16:19:24 +0000 (UTC)
Received: by earth.universe (Postfix, from userid 1000)
 id C28F63C0C77; Tue, 11 Jun 2019 18:19:21 +0200 (CEST)
Date: Tue, 11 Jun 2019 18:19:21 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [GIT PULL] omapdrm changes for 5.3
Message-ID: <20190611161921.5uoib4vr5gckkdpx@earth.universe>
References: <a709f57d-6909-8550-3932-d84e0b5bc3ef@ti.com>
 <20190611113051.GB2458@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190611113051.GB2458@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560269964;
 bh=r+fIcjIaX1SGeaDdCNeyP9mXBVDRX28LuuP3dfoB11s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UVwIh/RHqEXnkN8kQpH25jjKg3iilHuCYZB6fyfSYGTWAdSdH+j8rb8IS1T4qmU6D
 Dx9XdsYL/EuIGN6A0A5CR6toI+M9n9HJywXZi50Jxq7xpODQwgQKIX+J1QZANatJJ9
 69digkofw4sKK+suEt6apyE2hL1oaecktr/8OuoQ=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1793874875=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1793874875==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kbcm2mketzknvoah"
Content-Disposition: inline


--kbcm2mketzknvoah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, Jun 11, 2019 at 01:30:51PM +0200, Daniel Vetter wrote:
> On Tue, Jun 11, 2019 at 11:05:40AM +0300, Tomi Valkeinen wrote:
> > Hi Dave,
> >=20
> > Please pull omapdrm changes for 5.3.
> >=20
> >  Tomi
> >=20
> > The following changes since commit 396f9acaffd87e44b8b02bc60f06dc949b83=
2b7e:
> >=20
> >   Merge branch 'drm-next-5.3' of git://people.freedesktop.org/~agd5f/li=
nux into drm-next (2019-06-06 14:28:26 +1000)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git tags/om=
apdrm-5.3
> >=20
> > for you to fetch changes up to 1bb418bffdd6f95a41e8e59be63933bc84fde13c:
> >=20
> >   drm/omap: add support for manually updated displays (2019-06-10 17:04=
:15 +0300)
> >=20
> > ----------------------------------------------------------------
> > omapdrm changes for 5.3
> >=20
> > - Add support for DSI command mode displays
>=20
> Thanks, pulled.

Finally :)

> > ----------------------------------------------------------------
> > Emil Velikov (1):
> >       drm/omap: remove open-coded drm_invalid_op()
> >=20
> > Kefeng Wang (1):
> >       drm/omap: Use dev_get_drvdata()
> >=20
> > Sebastian Reichel (4):
> >       drm/omap: use DRM_DEBUG_DRIVER instead of CORE
> >       drm/omap: don't check dispc timings for DSI
> >       drm/omap: add framedone interrupt support
> >       drm/omap: add support for manually updated displays
>=20
> This seems to reinvent drm_atomic_helper_dirty(), I've cc'ed you on a doc
> patch. Also the fbdev dirty stuff seems to be missing here, you might want
> to look at Noralf's generic fbdev stuff to take care of all of this for
> you.

Thanks, I already noticed the patch series adding this, but did not
yet find enough time to check the details. The omapdrm patches
predate this work. The plan was to get the above work merged first,
so that it's easier to catch regressions and unblock community work
on Droid 4.

My plan was to first convert the DSI part from omapdrm to use
mipi_dsi_device and drm_panel API and then look at drm_atomic_helper_dirtyfb
afterwards.

-- Sebastian

--kbcm2mketzknvoah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlz/1IIACgkQ2O7X88g7
+poLpg//YJh7rD0IYixr1tYp8es7dTLq77DyFBruihboRiwrMZ4pnOEJpLF1uo4o
iMH2f10K+KAUykOvlVR42NtECcWMaY3O8tJPd5BWsipYC9jQSePcI/toHSDRwIU3
yGsUe/0wcce/DraYL8x6LXBLxlk/clhrMXuPGyOf7S9ff70X1ujCbroi3btV/uML
mhyEjnc4lUDKBn579GwZDaf7mp+0K41SQF88wlJu3OJeyHb8haG+EPgjOTT9LH/p
mjE98h7BYQ3b0bvamgO+HRwZgtVrabmib3vCGCIJpZszz6L4euZd7WIU4XZkRa/D
YzDwsvnr1zJvjafZdxRkpOIOEYA/eW466MsagxATYr178PW89elBfPfpptTIrlKb
zm0VURyHMLwU9y1bYKtXI6CesaeZbSVdu/xseL8oy+LVwL4zukuQLlxjS2x6Rl9Z
DpvM6a3iAIGetrnIEX6+TuOzeD54pFBe1Gw8+U0r1lra63CldOWXrjRrmhPG9kkQ
BvGU9g/KGXct/d+g66s5sEDrG6AaziqpZpkVczCmhyyvNrX0l38+c774Kjbe+JRA
UIP8aJm9lxvKJ3FH6XKjB/SUlPQ5CKm2NxashhIkbTWOlUFBmquqqpQYiF0amD4r
FqqxNtKjiJ+Ga6rCDCclrcbBspb2SbgLk9fPMYfa9hHP81wqtd0=
=u83S
-----END PGP SIGNATURE-----

--kbcm2mketzknvoah--

--===============1793874875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1793874875==--
