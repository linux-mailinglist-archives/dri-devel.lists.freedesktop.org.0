Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C47546E97
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 22:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E93D113E79;
	Fri, 10 Jun 2022 20:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net
 [188.165.53.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AE1113E79
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 20:43:28 +0000 (UTC)
Received: from player696.ha.ovh.net (unknown [10.109.156.6])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 638B32202A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 20:43:26 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player696.ha.ovh.net (Postfix) with ESMTPSA id BB97B2147BC18;
 Fri, 10 Jun 2022 20:43:13 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004e6fa79bf-d8bb-4492-9659-0d8f13915340,
 3EA6D779A65D7DCBA15D92F127CD72011C01B2E3) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Fri, 10 Jun 2022 22:43:06 +0200
From: Stephen Kitt <steve@sk2.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] staging: ftbft: Use backlight helper
Message-ID: <20220610224306.325a6c91@heffalump.sk2.org>
In-Reply-To: <YqOoI6g6GVw0Z1s/@ravnborg.org>
References: <20220607185516.1129900-1-steve@sk2.org>
 <YqOoI6g6GVw0Z1s/@ravnborg.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P4JAIYCU.yYfgTXqhIkbYUV";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 12460897219021866630
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtsehgtderreertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeiheevvdeugeejffefteffvefhieegjeevhfekjeejvdelgfefkeehhfdufffhjeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrheileeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehiedt
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?UTF-8?B?VHI=?= =?UTF-8?B?w7hubmVz?= <noralf@tronnes.org>,
 Len Baker <len.baker@gmx.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/P4JAIYCU.yYfgTXqhIkbYUV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Fri, 10 Jun 2022 22:22:59 +0200, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Tue, Jun 07, 2022 at 08:55:16PM +0200, Stephen Kitt wrote:
> > backlight_properties.fb_blank is deprecated. The states it represents
> > are handled by other properties; but instead of accessing those
> > properties directly, drivers should use the helpers provided by
> > backlight.h.
> >=20
> > Instead of manually checking the power state in struct
> > backlight_properties, use backlight_is_blank().
> >=20
> > Signed-off-by: Stephen Kitt <steve@sk2.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: Len Baker <len.baker@gmx.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-fbdev@vger.kernel.org
> > Cc: linux-staging@lists.linux.dev
> > ---
> >  drivers/staging/fbtft/fb_ssd1351.c | 3 +--
> >  drivers/staging/fbtft/fbtft-core.c | 3 +--
> >  2 files changed, 2 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/staging/fbtft/fb_ssd1351.c
> > b/drivers/staging/fbtft/fb_ssd1351.c index 6fd549a424d5..b8d55aa8c5c7
> > 100644 --- a/drivers/staging/fbtft/fb_ssd1351.c
> > +++ b/drivers/staging/fbtft/fb_ssd1351.c
> > @@ -196,8 +196,7 @@ static int update_onboard_backlight(struct
> > backlight_device *bd) "%s: power=3D%d, fb_blank=3D%d\n",
> >  		      __func__, bd->props.power, bd->props.fb_blank); =20
> Could you try to kill this use of props.fb_blank too?      ^^^^^^
> A local variable should do the trick.

I have a pending patch changing this to show props.state instead, that way
the debug info shows all the backlight-relevant information from props. How
does that sound?

Regards,

Stephen

--Sig_/P4JAIYCU.yYfgTXqhIkbYUV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmKjrNoACgkQgNMC9Yht
g5xQdg/+Orvis6KeWgiLd8jL6lqXH9XOKSzUodRrAYjprDDP0ZJq0NCh7JbJW+q3
OYkz1CNJ4/vsMOFU7lYPEPDRZqX+VHj2XBR11YZWTzUVi1f+ivSw/kDd5jzGe5xs
opvDdvBTlUniPy3LAs84Z1unuX0P6JgTwvKX3oiBMgww1ym8b9B3Ha2nswe3yUI2
kjOUfz+Zv86RtoPF3R/LBPv4aP1UmVL3/Bgg1Qnb2llzb3L3JlUq6V5BtUuxj+CC
vie/Wsfgsx9KXPa+GZUCaxm1q9uVUV21zHvZ3mCA5gew9jLg5wEFHmySony+2n+C
wAd+0MY7tlL+YjfV9Ccgvvo39CHe0Wan10HpWWQNwfAQgdpTHmeI8cZ+Uho85sb2
QF3+Jz/mrnlSjHG4lqPLs0bXGb/rpVsDPbiivOWzamJGQyOx14VvrUrKyLUpLh4A
BcB88hAvQ9z4pz8o3rkzfqi70KbDjbBpxQrpCXcwmBICUpfsm0ufteHA/7lSNEwq
EXlDYFA66tyohK0IGuDUOf7wvDuuQjyqO8/Kc5+/xBDdlTPts3eDqmIaAF9ydTpZ
5+pgEJITNAcHm/ig5/Kjxkye4q6DAWKEX10FUBWmm6lpc90i3NuWHGDTpC7Ru3yl
C5F9TZVMLyarmt00UEPhkARbBJrzOXqHGXQDWyiNxGCg1OB+GTc=
=EB3v
-----END PGP SIGNATURE-----

--Sig_/P4JAIYCU.yYfgTXqhIkbYUV--
