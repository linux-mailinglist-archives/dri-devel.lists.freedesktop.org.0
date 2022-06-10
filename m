Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C364546C18
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 20:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A4310E502;
	Fri, 10 Jun 2022 18:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 600 seconds by postgrey-1.36 at gabe;
 Fri, 10 Jun 2022 18:03:16 UTC
Received: from 18.mo581.mail-out.ovh.net (18.mo581.mail-out.ovh.net
 [188.165.56.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D5510E502
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 18:03:16 +0000 (UTC)
Received: from player779.ha.ovh.net (unknown [10.111.172.1])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 1E6FF2387D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 17:44:35 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id 94DBC2B5CF843;
 Fri, 10 Jun 2022 17:44:23 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00152449f80-6e6f-48d1-97fa-f963f6478a11,
 4E496447C43E4C7632BA90A0B7747719B130BEDF) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Fri, 10 Jun 2022 19:44:15 +0200
From: Stephen Kitt <steve@sk2.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] fbdev: atmel_lcdfb: Rework backlight status updates
Message-ID: <20220610194415.05e1ee95@heffalump.sk2.org>
In-Reply-To: <20220610094955.cy53ujicaplr7aw7@ash.lan>
References: <20220608205623.2106113-1-steve@sk2.org>
 <20220609095412.fccofr2e2kpzhw4t@maple.lan>
 <YqIuUYUXzxeSgZ/o@ravnborg.org>
 <20220609194511.4e0bc3e6@heffalump.sk2.org>
 <20220610094955.cy53ujicaplr7aw7@ash.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lMq9K57Nv6KWvkGmMFl3QXs";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 9440389247221794438
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtsehgtderreertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeiheevvdeugeejffefteffvefhieegjeevhfekjeejvdelgfefkeehhfdufffhjeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejjeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehkedu
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
Cc: linux-fbdev@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Helge Deller <deller@gmx.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/lMq9K57Nv6KWvkGmMFl3QXs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Jun 2022 10:49:55 +0100, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
> On Thu, Jun 09, 2022 at 07:45:11PM +0200, Stephen Kitt wrote:
> > Hi Sam, Daniel,
> >
> > On Thu, 9 Jun 2022 19:30:57 +0200, Sam Ravnborg <sam@ravnborg.org> wrot=
e:
> > =20
> > > thanks for taking care of all these backlight simplifications - this
> > > really helps to make the code simpler and more readable. =20
> >
> > You=E2=80=99re welcome! I noticed fb_blank was deprecated and near enou=
gh unused,
> > and started digging... =20
>=20
> I saw Sam's comment and kinda wished I'd thought to say that... definitely
> good to see these things being tidied up.

Thanks! I saw the nice wrapper functions in backlight.h and couldn=E2=80=99=
t resist.

Regards,

Stephen

--Sig_/lMq9K57Nv6KWvkGmMFl3QXs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmKjgu8ACgkQgNMC9Yht
g5y6fw/+KKVsNBW5fG/NXRxcpGQDkisyqwSf/FEeQxqGP1kAtLFQHHt7vT5BKZvt
P/o0PaUun84je8XQfbRsdu4WvNqve0qPPVxl/aUZ35i64UJgNq3rJutIeDbmR2yl
UsMZisIh8ZafXKmXpA88u7h5Hcdm9OkbplcM5Jhom8Amc70nDSU5nYJhk/eCPgz0
5bgVGEedpfOVs2zXPv1NCz07g8xYzH2nx0i+TY5AkReY19QD/Wgabo5v555al41H
uS5bTEdNESCcmroU2Gs5chc6DoDiPMhJgFYmRJpXUCHHcx+298fxvaBJKPZNhA65
MnyknXePf7wh8IRwMZrm3DnWnUbG1J8wcsNnZEkZJda77hIzSDU+lKg9xgWuehki
etT0e6MKqGyn5aJRMqzhJRVr3a7AIHAYpHmtvbZ+u7Snw+7ubMgrsks8Gxkq5Put
4Px+0dQ3y+Cv/fMinzPqBfxIkjDBzs3A9TSkxVzHaSKFf3gCANL7g1FE4y9A2mdX
DoBsGtEEsvLFT1VukhHvziTXd6mZoCQ7m6Yt0e0xTQ6a/lxesl+cA1HaGXAdThG+
tCIFukMPzE6M6pRCS8YJtASaLjxKvMf3YhWgEKjJ4DjCgwu4+VSNnrpmii/jIrBI
IeDCgyM0jv4Q9o90s2sPxc9MiDCgQf1j0KV0aagRKXrhMtExJU0=
=cMaS
-----END PGP SIGNATURE-----

--Sig_/lMq9K57Nv6KWvkGmMFl3QXs--
