Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4B5661928
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 21:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF5D10E002;
	Sun,  8 Jan 2023 20:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1799 seconds by postgrey-1.36 at gabe;
 Sun, 08 Jan 2023 20:14:07 UTC
Received: from 8.mo584.mail-out.ovh.net (8.mo584.mail-out.ovh.net
 [188.165.33.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE2610E002
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 20:14:07 +0000 (UTC)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.143.246])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 9DA5C23E8C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 19:36:42 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wl7j5 (unknown [10.109.138.190])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 18A311FED9;
 Sun,  8 Jan 2023 19:36:39 +0000 (UTC)
Received: from sk2.org ([37.59.142.106])
 by ghost-submission-6684bf9d7b-wl7j5 with ESMTPSA
 id Tf9QAUcbu2N19wAAid5/uw
 (envelope-from <steve@sk2.org>); Sun, 08 Jan 2023 19:36:39 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0064db9debf-ab59-4406-8e3b-2900436b4735,
 5128B599F7D401446F64D4771BE19AB2B9CD7A8B) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Sun, 8 Jan 2023 20:36:37 +0100
From: Stephen Kitt <steve@sk2.org>
To: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Subject: Re: [PATCH 11/15] powerpc: via-pmu-backlight: Introduce
 backlight_get_brightness()
Message-ID: <20230108203637.0eb346fb@heffalump.sk2.org>
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-11-1bd9bafb351f@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-11-1bd9bafb351f@ravnborg.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uukmOXDDn4g_OXGHTWj0dxU";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 1966384190180525702
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeggddufedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgesghdtreerredtvdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepfeffgefhgfeuueeffeejieefieefgfefffethfdtudegvdejueelhffhfeegjeeinecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshhtvghvvgesshhkvddrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-omap@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 Robin van der Gracht <robin@protonic.nl>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-staging@lists.linux.dev,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Jingoo Han <jingoohan1@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linux-fbdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 sam@ravnborg.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/uukmOXDDn4g_OXGHTWj0dxU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 07 Jan 2023 19:26:25 +0100, Sam Ravnborg via B4 Submission Endpoint
<devnull+sam.ravnborg.org@kernel.org> wrote:

> From: Sam Ravnborg <sam@ravnborg.org>
>=20
> Introduce backlight_get_brightness() to simplify logic
> and avoid direct access to backlight properties.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  drivers/macintosh/via-pmu-backlight.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/macintosh/via-pmu-backlight.c
> b/drivers/macintosh/via-pmu-backlight.c index 2194016122d2..c2d87e7fa85b
> 100644 --- a/drivers/macintosh/via-pmu-backlight.c
> +++ b/drivers/macintosh/via-pmu-backlight.c
> @@ -71,12 +71,7 @@ static int pmu_backlight_get_level_brightness(int leve=
l)
>  static int __pmu_backlight_update_status(struct backlight_device *bd)
>  {
>  	struct adb_request req;
> -	int level =3D bd->props.brightness;
> -
> -
> -	if (bd->props.power !=3D FB_BLANK_UNBLANK ||
> -	    bd->props.fb_blank !=3D FB_BLANK_UNBLANK)
> -		level =3D 0;
> +	int level =3D backlight_get_brightness(bd);
> =20
>  	if (level > 0) {
>  		int pmulevel =3D pmu_backlight_get_level_brightness(level);
>=20
> --=20
> 2.34.1

This one is already in 6.2-rc1, it went in via powerpc/next.

Regards,

Stephen

--Sig_/uukmOXDDn4g_OXGHTWj0dxU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmO7G0UACgkQgNMC9Yht
g5xMrQ/+PwvgQ0CHCn8HmbOrtCc6qRRFkBMOMZAVkGha3M3hYGioht4oHn4GrnMy
TjIR7v3/JOkUdOLbjB/64to5DRhpRA1ViZ5+rzli6mJQi4D/vcf83SUedofbYnjy
L/qOMiT/c73cpoldhKsOkvgATQSLfTQfddDthcS09XVmldfqgxqcEtSrnJ6cJ3QT
eguOeI9WR/MqVNXT8y+NYlQttBWVAk0xoZQJgQcFBt5pS41b8Eql9n7A7+Zn5cxs
fZLnmt9N2ul1oWFIc75dwcd803z/huqueMI/lnZ/ClSPuO2Cyvy75j9MOeWdOqBt
iFQFUSATbNJS+WqXZQ2Tgxdz2f84jqDheSB3znCijKJuRZT9Z8JyncQKElbaqayB
bTUIOcxFQUjQzSj01lRLrvV8R+xoZwSjJzL+DDev9FKbqXrS6lPVh2ZjGveJWvXy
5ERsDt/BScQ0LqR2e7UjXh3md0NGHBts8eQM+sLGSeHp6R8CyxP6et3GdGJrQdBF
BfDGcN/PbNufCzTxuVMEEYXkNDqxTtvz/V+rNJJS9KkeEYp8rp4kQIbC00TXDIDQ
ZekvV+TKZ4JkqEX+z44qRw+kI0mza8D9FUCx8mxh20WU1JVRtr1IGc8zyl8Y1wu1
0vLNwdTdxVfj8Z7NnIvcI8RxxcwZVT/XoIXauX9N3/iintzk5G8=
=ImCK
-----END PGP SIGNATURE-----

--Sig_/uukmOXDDn4g_OXGHTWj0dxU--
