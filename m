Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE024545379
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 19:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C414612B3F1;
	Thu,  9 Jun 2022 17:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 9.mo581.mail-out.ovh.net (9.mo581.mail-out.ovh.net
 [46.105.60.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31EB12B3E7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 17:53:06 +0000 (UTC)
Received: from player714.ha.ovh.net (unknown [10.109.138.54])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id C4273235EF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 17:45:31 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id CA8942B5D8553;
 Thu,  9 Jun 2022 17:45:18 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0019894c42d-17cc-460a-bd58-8972ad9d0d06,
 FB82ABC7E83112E23A0D9558C7043BAE976A9334) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Thu, 9 Jun 2022 19:45:11 +0200
From: Stephen Kitt <steve@sk2.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] fbdev: atmel_lcdfb: Rework backlight status updates
Message-ID: <20220609194511.4e0bc3e6@heffalump.sk2.org>
In-Reply-To: <YqIuUYUXzxeSgZ/o@ravnborg.org>
References: <20220608205623.2106113-1-steve@sk2.org>
 <20220609095412.fccofr2e2kpzhw4t@maple.lan>
 <YqIuUYUXzxeSgZ/o@ravnborg.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EP0pO67BNhj61Y43uRPbrz_";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 3583457929091712646
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddtledgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtsehgtderreertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeiheevvdeugeejffefteffvefhieegjeevhfekjeejvdelgfefkeehhfdufffhjeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejudegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehkedu
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Helge Deller <deller@gmx.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/EP0pO67BNhj61Y43uRPbrz_
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Sam, Daniel,

On Thu, 9 Jun 2022 19:30:57 +0200, Sam Ravnborg <sam@ravnborg.org> wrote:
> thanks for taking care of all these backlight simplifications - this
> really helps to make the code simpler and more readable.

You=E2=80=99re welcome! I noticed fb_blank was deprecated and near enough u=
nused, and
started digging...

> On Thu, Jun 09, 2022 at 10:54:12AM +0100, Daniel Thompson wrote:
> > On Wed, Jun 08, 2022 at 10:56:23PM +0200, Stephen Kitt wrote: =20
> > > Instead of checking the state of various backlight_properties fields
> > > against the memorised state in atmel_lcdfb_info.bl_power,
> > > atmel_bl_update_status() should retrieve the desired state using
> > > backlight_get_brightness (which takes into account the power state,
> > > blanking etc.). This means the explicit checks using props.fb_blank
> > > and props.power can be dropped.
> > >=20
> > > Then brightness can only be negative if the backlight is on but
> > > props.brightness is negative, so the test before reading the
> > > brightness value from the hardware can be simplified to
> > > (brightness < 0). =20
> >=20
> > props.brightness should always be in the interval 0..max_brightness.
> >=20
> > This is enforced by the main backlight code (and APIs to set the
> > brightness use unsigned values). Thus props.brightness could only be
> > negative is the driver explicitly sets a negative value as some kind of
> > placeholder (which this driver does not do).
> >=20
> > I don't think there is any need to keep this logic. =20
>=20
> Daniel is right - please drop the "if (brightness < 0)" logic.
> I have looked a bit on the datasheet in my attempt to do a drm version
> of this driver - something that I am yet to succeed and the backlight
> core avoid any negative values.

Thanks for the reviews!

I=E2=80=99ve prepared a v2 without the (brightness < 0) logic, I=E2=80=99m =
about to submit
it.

Regards,

Stephen

--Sig_/EP0pO67BNhj61Y43uRPbrz_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmKiMacACgkQgNMC9Yht
g5wQqA/+MORCtyNvu5ifk0jvdn5LxEz8JNduQREG75KZo5vuDLlEtsc+PmZtFJxL
uIDoVjfAwRpEkg0kw5JV7hIRg2XwkvioUC/7pTueOFQQyRvnS5gwP0NEQkPBvYyy
cQ5njUzoFibUOTWg1DDNwjuKk5x5KfCeVwTt2EVNnWQg3n+5v9c8DnZZAnNn39PU
ufwwmd9ZZ7NzEieSqtTqv1rd+YfBkQ9jE1Fk9cB143fWGMtQYbs0YXPCPsE7rclD
g+xN73lzFUDtQyHebSEiMwVu9n1OHuR9ZBXI87TjT/f7gNBFzlYzc7jDzg4RWLt7
We0YQs1pDQTFzYjgdMLrKoSNU35ZFuSge2RhZz0/Rm0cYY1CbSpLxIW2d3LDumNM
hFqRo5wIYPlZK5NW6HvTv1OeGFb7J7TI5r7zdbBtLXtnrHXK6TJ+OYp/wqldPKRx
tShQcSBb0mPXzCjhEFzM4Hovb9/JkBL0BLRlXztbsnoYPGRgebsaq9GisNEJiXjZ
ro/4Na1NzKfPijkWS9VXH9vpE5w3Xo7P7qJ43QnipRB00/Cfqup4IXPlAeoc2Z0O
r6WzrI8Ue4umFico2lazistZ1qNIgiDfRcQQRK/Brsui6U0J3WJNn+I6PS2yRiN4
TxoRbATKZXeUgX5rf4LMP/bOTxk62XRTfDfaL4qWmaJ6miTugxI=
=w0I1
-----END PGP SIGNATURE-----

--Sig_/EP0pO67BNhj61Y43uRPbrz_--
