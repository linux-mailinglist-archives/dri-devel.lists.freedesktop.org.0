Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 260EB2DA2FC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 23:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4136E0C6;
	Mon, 14 Dec 2020 22:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7EB6E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 22:08:32 +0000 (UTC)
Date: Mon, 14 Dec 2020 23:08:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607983712;
 bh=DnVnbT8lZlEyU6YirvYqO3h/fnYxCDrxQBgLwXnsSMg=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=O7Ode8bDgy2vdRSwWlAU00JVP5NKG96ri07vPx1yaVarprjuYVcbWU5FiK4HpmD3v
 +P+LLgArF+VqmbKFtziPrlScOkw7i5Z/3CPOg9bMJRZny7mVD3DNhdZInpvfT3ynN2
 92AsDkXCRJPEewRA0pF3xeu6/GA25X5Ofeo//6EZz7E5xw6Wtpv/AX9iDwYLnkgmHk
 F+m87rJ+UFVTkT8sYStNRW5mFqMjuQhAKMqkkSc20TR3KLgShlJSJgGm18bknwjdg5
 pUVUi6W5A+lFcxOKLwCu5wADTVef+2WgOiHeYdmUDDCCYDhlEmUky2AVakr/cky8lo
 HQu94z6xiZoNw==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 27/29] drm/omap: dsi: remove ulps support
Message-ID: <20201214220830.kfsacwfoddhz3uve@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-28-tomi.valkeinen@ti.com>
 <20201214173923.2plaloeowhxddbwe@earth.universe>
 <0484822c-40e1-6738-aea8-c4a5d6609bb1@ti.com>
MIME-Version: 1.0
In-Reply-To: <0484822c-40e1-6738-aea8-c4a5d6609bb1@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============1355790029=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1355790029==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6zlztrkd5drxylgw"
Content-Disposition: inline


--6zlztrkd5drxylgw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 14, 2020 at 08:55:36PM +0200, Tomi Valkeinen wrote:
> On 14/12/2020 19:39, Sebastian Reichel wrote:
> > Hi,
> >=20
> > On Tue, Dec 08, 2020 at 02:28:53PM +0200, Tomi Valkeinen wrote:
> >> ULPS doesn't work, and I have been unable to get it to work. As ULPS
> >> is a minor power-saving feature which requires substantial amount of
> >> non-trivial code, and we have trouble just getting and
> >> keeping DSI working at all, remove ULPS support.
> >>
> >> When the DSI driver works reliably for command and video mode displays,
> >> someone interested can add it back.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> ---
> >=20
> > Is it really 'minor power-saving'? If I search for DSI and ULPS among
> > the first results is a TI datasheet for SN65DSI84, which claims device
> > active current in the more than 100mA range and ULPS current in the
> > less than 10mA range.
>=20
> I don't have any numbers, just my guesses. For videomode displays
> or command mode displays in active use, I don't think ULPS matters
> much. The link is mostly not in ULPS. And if the display is
> blanked, things are off, so again not in ULPS.
>=20
> It's only for command mode displays, when updated rarely, where I
> think ULPS matters. Which, of course, is probably not unusual use
> case if you have a cmdmode display. But whether OMAP DSI power
> savings matches SN65DSI84, I have no clue.

Right. FWIW I don't expect savings to be as big as this. The
comparision is not "active current", but "idle current" since
we do disable the clocks among other things. Considering the
amount of power-saving is pure guess-work I suggest to rephrase
the commit message to something like this:

ULPS is a niche power-saving optimization feature only
affecting enabled command mode panels showing a static
picture. It never worked with the omapdrm driver and I have
been unable to get it working. Keeping DSI command mode panels
working is hard enough without this, so remove ULPS support.

FWIW I'm fine with this being removed:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

> > Considering all known omapdrm DSI users are battery powered devices
> > caring for saving as much power as possible, it might be good to just
> > keep this until it is being fixed considering this is very close to
> > the end of the series anyways?
>=20
> I don't like to leave known to be broken code around, unless
> someone has plans to work on it. I wouldn't be surprised to see
> ULPS still broken two years from now =3D). It should be trivial to
> add the relevant bits back later.

Ack.

> But I can leave it here if you think it's better, presuming it
> doesn't have bigger conflicts with the 29/29 or break anything.
> However, I have only a few days left in TI, which is why I'm
> rushing here a bit (*). If I hit problems, I either have to drop
> the whole series, or push it in its current form.
>=20
>  Tomi
>=20
> (*) But I will fix possible issues caused by my push, of course.

Best of luck on whatever you do next!

-- Sebastian

--6zlztrkd5drxylgw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/X4lcACgkQ2O7X88g7
+ppwUw/8CTk2+eQyMnRHim94qle3yGvulEiR7w4FZZPLlbQJlC/7vBMYOG0XjIMm
WaMIKFEqdih994i/ySYXIVqh3Tg0lKS9pDkOb3Te0/xM4BN7bcC09LAozOBVyiMo
63QgQQMLl8oqZCcdVuCUuHpIU2KQdeEKi/8Jq0jLnx18dX8gL/tFNlxOlBzMlBKq
JUrwNxsU5iJ0IHCiJHPD673/0i+F+rZMv5IPEhYY/UMXHkckwnWwfnRnIdkpZdv4
pD14TBtTU4JComPPzmFiuOtcVELMQDTjDUQzShIyiD3QBl+VgPAstaB2/z232re0
2wmo77KO+hCaqYMGqfVsmwHXkkoNMP4jR+AJIw8X8f/27nk9dRUP5iD3Wi6ppBaU
Kw8C9K8axV7BO0ho4BaZPT0DM6Tk0POhXSIRe47N6I7Qha/AlQF6IQj2ms9sK/Ce
700Xsd9jA84LcBX0fhO8HX6YKCFEN+GDT3yxV2+pvKg+ipuRb/hTUOFkwu8im2v9
aqYhOniKXj1+9/d7pBipPRLXP7RxwcoAylAQKgi7OM0yaODEQcQbec05YPvpiqeT
yl3qj4rixZflFDkjw4Hpec8YJ4HIgRQgLOUCCu7AhoUWAMCwWLi2dq4l+FLUqG/w
P71x3YtxzMYSoqS0S1sqXncETdPA/b74XDPGDLK5YpiOqe727fA=
=wpwD
-----END PGP SIGNATURE-----

--6zlztrkd5drxylgw--

--===============1355790029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1355790029==--
