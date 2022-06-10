Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF9A546E79
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 22:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39F9113CE4;
	Fri, 10 Jun 2022 20:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1799 seconds by postgrey-1.36 at gabe;
 Fri, 10 Jun 2022 20:33:20 UTC
Received: from 2.mo583.mail-out.ovh.net (2.mo583.mail-out.ovh.net
 [178.33.109.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C17113CCA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 20:33:20 +0000 (UTC)
Received: from player770.ha.ovh.net (unknown [10.109.156.39])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 6626424567
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 19:56:14 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id BC5042B7B8404;
 Fri, 10 Jun 2022 19:56:07 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002ead98320-4cb9-4ad4-8b0a-e84dbc580c18,
 4E496447C43E4C7632BA90A0B7747719B130BEDF) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Fri, 10 Jun 2022 21:56:06 +0200
From: Stephen Kitt <steve@sk2.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/3] drm/panel: panel-dsi-cm: Use backlight helpers
Message-ID: <20220610215606.5c7a97b9@heffalump.sk2.org>
In-Reply-To: <20220610215236.0d5d47b7@heffalump.sk2.org>
References: <20220607182026.1121992-1-steve@sk2.org>
 <20220607182026.1121992-3-steve@sk2.org>
 <20220609215236.ojxw6l2vkf652hgu@mercury.elektranox.org>
 <20220610194720.485cf7be@heffalump.sk2.org>
 <YqObYPttYuRDikrO@ravnborg.org>
 <20220610215236.0d5d47b7@heffalump.sk2.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/80XS4+CdZ9JSPRbvT9=p+Py";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 11663760088923145862
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtsehgtderreertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeiheevvdeugeejffefteffvefhieegjeevhfekjeejvdelgfefkeehhfdufffhjeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejjedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehkeef
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/80XS4+CdZ9JSPRbvT9=p+Py
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Jun 2022 21:52:36 +0200, Stephen Kitt <steve@sk2.org> wrote:

> On Fri, 10 Jun 2022 21:28:32 +0200, Sam Ravnborg <sam@ravnborg.org> wrote:
> > Hi Stephen.
> > On Fri, Jun 10, 2022 at 07:47:20PM +0200, Stephen Kitt wrote: =20
> > > Hi Sebastian,
> > >=20
> > > On Thu, 9 Jun 2022 23:52:36 +0200, Sebastian Reichel
> > > <sebastian.reichel@collabora.com> wrote:   =20
> > > > On Tue, Jun 07, 2022 at 08:20:25PM +0200, Stephen Kitt wrote:   =20
> > > > > diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c
> > > > > b/drivers/gpu/drm/panel/panel-dsi-cm.c index
> > > > > b58cb064975f..aa36dc6cedd3 100644 ---
> > > > > a/drivers/gpu/drm/panel/panel-dsi-cm.c +++
> > > > > b/drivers/gpu/drm/panel/panel-dsi-cm.c @@ -86,16 +86,10 @@ static
> > > > > void dsicm_bl_power(struct panel_drv_data *ddata, bool enable)
> > > > > return;=20
> > > > >  	if (enable) {
> > > > > -		backlight->props.fb_blank =3D FB_BLANK_UNBLANK;
> > > > > -		backlight->props.state =3D ~(BL_CORE_FBBLANK |
> > > > > BL_CORE_SUSPENDED);
> > > > > -		backlight->props.power =3D FB_BLANK_UNBLANK;
> > > > > +		backlight_enable(backlight);
> > > > >  	} else {
> > > > > -		backlight->props.fb_blank =3D FB_BLANK_NORMAL;
> > > > > -		backlight->props.power =3D FB_BLANK_POWERDOWN;
> > > > > -		backlight->props.state |=3D BL_CORE_FBBLANK |
> > > > > BL_CORE_SUSPENDED;
> > > > > +		backlight_disable(backlight);
> > > > >  	}     =20
> > > >=20
> > > > The brackets can be removed now. Otherwise:   =20
> > >    =20
> > > >=20
> > > > Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>   =
=20
> > >=20
> > > Thanks, I=E2=80=99ll wait a little more to see if there are any other=
 reviews of
> > > the patches and then push a v2 with that fix.   =20
> > It would be very nice if you could kill all uses of FB_BLANK in the
> > drivers/gpu/drm/panel/* drivers, and post them as one series.
> > This is long overdue to introduce the backlight helpers.
> >=20
> > The three you posted is already a nice step forward, and there may be
> > more panel drivers I have missed. =20
>=20
> With this series on top of 5.19-rc1, the only remaining .fb_blank referen=
ce
> is in acx565akm_backlight_init() in panel-sony-acx565akm.c; I was planning
> on nuking that along with the other .fb_blank initialisers in a series
> removing .fb_blank entirely from backlight_properties. I=E2=80=99ll add i=
t as a
> fourth patch for drm/panel if that makes things easier!

That=E2=80=99s in drivers/gpu/drm/panel of course, there are a few others e=
lsewhere
(I=E2=80=99ve got patches in flight for most of them, I=E2=80=99ve got the =
rest ready for
submission).

> There will still be references to FB_BLANK constants since they=E2=80=99r=
e used for
> backlight_properties.power values. Would it make sense to rename those?

Just to make sure =E2=80=94 I=E2=80=99m cleaning up backlight_properties.fb=
_blank, not
fb_ops.fb_blank. I wasn=E2=80=99t planning on touching the latter...

Regards,

Stephen

--Sig_/80XS4+CdZ9JSPRbvT9=p+Py
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmKjodYACgkQgNMC9Yht
g5zgdg/+IdFMt3CSBicFd90HvGT0WoTKYAJFPFnHEWkMP5NNbOshaTX7eHnYfuB6
gDkYhXuGC6OZJ1N839HXyXWPkmL4iZX/+Ba1hCFqOx+2znIY+zRRlf19+EdvyuGU
jarSv7VZScgVjrFtpVtt1DRRlFqG86ppemyH3og1S+7gQ1gss7maNILXyRg/40lj
VhmluONX1E+pIW9Dh50iGKEd3Gn/Im4B0UwV383fLlOMgtOyjGJ5BfMKJ/E+A3vo
XedrZPJ3xFFSo9l5kNKnGChwXBkUfBKg74fc1q1QmpFVb/dTAVHWy0bL7bCpSoPs
s/XfpgIFEQqWdrKTB9yR2O67OLHL0AnMUDYJcIemBcyEmVL6WlEpKp1I7czEP8Fq
m79YxTTzO12Sath7Yh6ntGYBgMLBO57Vl+CSqDNpuXQAWD7u5HQLpHiYE8vaAfPG
D+WHSu4ZUVOrpAe8TonrzKgXTsHwZzR0JZ2EmSSJsyPmmSk+0Ro8PR64grw7n4Di
FUqVotIKtY7uDfXsRiTNhPlIpde1Sm4MDQPhITEcVdSRCXkTdsq3jZFhvKW8l8Wx
bQxICmVk1WQGubs++s8ArUxJhO4KnAzsB3yiv/obcMT4lgWKbUmUmyjSlYngLVnq
jaP+Hb4auLOEWvoWOReySy7ovgrkhhZ9zuqGvDYB3IToa2uoULs=
=HpMT
-----END PGP SIGNATURE-----

--Sig_/80XS4+CdZ9JSPRbvT9=p+Py--
