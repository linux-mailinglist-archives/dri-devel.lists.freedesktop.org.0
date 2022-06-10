Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57135546CE2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 21:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4261123B2;
	Fri, 10 Jun 2022 19:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 3.mo583.mail-out.ovh.net (3.mo583.mail-out.ovh.net
 [46.105.40.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD2B112416
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 19:03:07 +0000 (UTC)
Received: from player760.ha.ovh.net (unknown [10.111.208.129])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id D85D0251E4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 17:47:36 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id 4E6CB2B728F28;
 Fri, 10 Jun 2022 17:47:27 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00515216049-9e93-4894-aa40-e1df9efa6a35,
 3EA6D779A65D7DCBA15D92F127CD72011C01B2E3) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Fri, 10 Jun 2022 19:47:20 +0200
From: Stephen Kitt <steve@sk2.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 2/3] drm/panel: panel-dsi-cm: Use backlight helpers
Message-ID: <20220610194720.485cf7be@heffalump.sk2.org>
In-Reply-To: <20220609215236.ojxw6l2vkf652hgu@mercury.elektranox.org>
References: <20220607182026.1121992-1-steve@sk2.org>
 <20220607182026.1121992-3-steve@sk2.org>
 <20220609215236.ojxw6l2vkf652hgu@mercury.elektranox.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fiv/6RAB4w3meaj/_BS+ruP";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 9491336218715915910
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtsehgtderreertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeiheevvdeugeejffefteffvefhieegjeevhfekjeejvdelgfefkeehhfdufffhjeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejiedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehkeef
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Fiv/6RAB4w3meaj/_BS+ruP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Thu, 9 Jun 2022 23:52:36 +0200, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
> On Tue, Jun 07, 2022 at 08:20:25PM +0200, Stephen Kitt wrote:
> > diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c
> > b/drivers/gpu/drm/panel/panel-dsi-cm.c index b58cb064975f..aa36dc6cedd3
> > 100644 --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> > +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> > @@ -86,16 +86,10 @@ static void dsicm_bl_power(struct panel_drv_data
> > *ddata, bool enable) return;
> > =20
> >  	if (enable) {
> > -		backlight->props.fb_blank =3D FB_BLANK_UNBLANK;
> > -		backlight->props.state =3D ~(BL_CORE_FBBLANK |
> > BL_CORE_SUSPENDED);
> > -		backlight->props.power =3D FB_BLANK_UNBLANK;
> > +		backlight_enable(backlight);
> >  	} else {
> > -		backlight->props.fb_blank =3D FB_BLANK_NORMAL;
> > -		backlight->props.power =3D FB_BLANK_POWERDOWN;
> > -		backlight->props.state |=3D BL_CORE_FBBLANK |
> > BL_CORE_SUSPENDED;
> > +		backlight_disable(backlight);
> >  	} =20
>=20
> The brackets can be removed now. Otherwise:

>=20
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thanks, I=E2=80=99ll wait a little more to see if there are any other revie=
ws of the
patches and then push a v2 with that fix.

Regards,

Stephen

--Sig_/Fiv/6RAB4w3meaj/_BS+ruP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmKjg6gACgkQgNMC9Yht
g5zfSw//WI01jNuYSP0lMjDjiVPi3dZknMK/1vgV6zHCgisK5W9RahwyjRdg9hWW
veSzZA4xLOVHS1WpSEcsQWSRCTAoi22tZ/IhGVFTW9hpWkKUzndtuebMzQ5LuEwq
gP/c6sU3O5qP2tjMyUwDs8zAEugZl6hlcZGtkYdZUk50gUsP2ajEJ2XjblIkikEn
JskElLBZSpvBS06TzHphA7DZZW1B/GjkucvmM6vOVklRtkxbCYck7E2PCM1uPe6x
8U7pacTwdvzdf0j255cSxb6xehc1wTDKCelVrp9VcXyI1PiZb6nzW4+xSE/JF+iZ
Kyrrw8Iuom5Zwr0SlPszmdk8HiKpj+DLRugmH0fHksHAxb09L77zSZZ3krUefXrF
2A7g0AAXxy7OEZtCJyLHPiSL3Q9EHQ3FtzLH+3xddratrbdzjnbq+kPA37GqfWTk
qNo0zrCK4o2E2GFAzZf08Hg6FT5o/4LnYPZikTfmOiOYyBR5FGW2nl2AyoH3WdZC
EfzICSO2fB0i3miIcpTOH+YRJU5G0Ih1acm8FK/1x8A/GSPG/wY0juQMS9Zzkq3Q
FlsH13MKT+fqlTDwf2wl8hF5ESklSJ90CTKITJTxZiWHLkKeKIZ2l8ll5o4qg4jt
O5Rj0KaoPq+pkrIwj0Y//PlpPOd8d/X4pYuct2ujiPXp7pkaHLM=
=9bxl
-----END PGP SIGNATURE-----

--Sig_/Fiv/6RAB4w3meaj/_BS+ruP--
