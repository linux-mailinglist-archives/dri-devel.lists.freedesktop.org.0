Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 857F0541884
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 23:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9DE10FBB5;
	Tue,  7 Jun 2022 21:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 3.mo583.mail-out.ovh.net (3.mo583.mail-out.ovh.net
 [46.105.40.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5F010FBB5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 21:13:04 +0000 (UTC)
Received: from player734.ha.ovh.net (unknown [10.111.172.29])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 0340023F18
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 21:04:52 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 6B3F02B24C936;
 Tue,  7 Jun 2022 21:04:40 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001c84ff67f-96bd-453b-ab78-243ac733fd37,
 38FB55E0ED6224772C245AF554E1AE62085133ED) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Tue, 7 Jun 2022 23:04:38 +0200
From: Stephen Kitt <steve@sk2.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/bridge: parade-ps8622: Use backlight helper
Message-ID: <20220607230438.2fdbb3af@heffalump.sk2.org>
In-Reply-To: <20220607181022.1119546-1-steve@sk2.org>
References: <20220607181022.1119546-1-steve@sk2.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xlmM9B3iI4SZbsqiVRvNw=3";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 13651536371335333510
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgudehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtsehgtderreertddvnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeefffeghffgueeufeefjeeifeeifefgfefftefhtddugedvjeeulefhhfefgeejieenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejfeegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehkeef
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/xlmM9B3iI4SZbsqiVRvNw=3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  7 Jun 2022 20:10:22 +0200, Stephen Kitt <steve@sk2.org> wrote:
> backlight_properties.fb_blank is deprecated. The states it represents
> are handled by other properties; but instead of accessing those
> properties directly, drivers should use the helpers provided by
> backlight.h.

Apologies for the misleading boilerplate, this patch came about as a result
of cleaning up fb_blank usage but doesn't involve fb_blank itself.

> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/parade-ps8622.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c
> b/drivers/gpu/drm/bridge/parade-ps8622.c index 37b308850b4e..b5750e5f71d7
> 100644 --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> @@ -324,11 +324,7 @@ static int ps8622_send_config(struct ps8622_bridge
> *ps8622) static int ps8622_backlight_update(struct backlight_device *bl)
>  {
>  	struct ps8622_bridge *ps8622 =3D dev_get_drvdata(&bl->dev);
> -	int ret, brightness =3D bl->props.brightness;
> -
> -	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
> -	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> -		brightness =3D 0;
> +	int ret, brightness =3D backlight_get_brightness(bl);
> =20
>  	if (!ps8622->enabled)
>  		return -EINVAL;
>=20
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
> --=20
> 2.30.2
>=20

--Sig_/xlmM9B3iI4SZbsqiVRvNw=3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmKfvWYACgkQgNMC9Yht
g5zxmhAAifjtDEfMHufL81UukZEEcANF6q6pR1WE94nlb8cVE02nkdN5O6WnccTU
qzbvq1XdFXdY4pupuAlCbBi/4n5kylDOeSnASzZ76Sd9pcpUWhSCRCoCY9Cq7JaV
CtskknGD1MuIWEA65O1Gpdk4IguOkPoUI+Qa1hEuwr/lSNK64CPnoEx6ipBexTzF
3PwgycelFtoc7vaXs9lvP0FUfikGw8S3lWG2jxFeM4rU7nIJMts51VP09Jbr7tOp
usn/lJIcwquzs6tWMO3JVVAuj3E6NlHr342mc8+Z4M8q6s+UhX0QkeXXf+ePUVBJ
YY/V4i3+aK4lpIj9IZ19NJ406ml84BzeT1Uq5mQCBiT+5v/X3bJiaCu5MMi8n+0W
tM4Z5Y4SOJf5TM7OBr7Akd04JyO8KM3hZtNUWABuIT0iwsJ8M+l/sO/rYj0qTHKR
U6ELpEwNOlA4kcbEU/mZYXk1q2AIS2zwnjh94h6ySBztOWB8UHsl80ZawRU0b+6d
8U2uQtF9f+fUQANizro7vHuEAQgBolVCjfN0g0+GAGRcpkIM7BFnX8iKf3irtIUX
GaeXLueWeuvKGMysqAna18oQbmwcwnqfvCDlvVXFyiQCcTGSZDbKiVlbgQlCVEjy
6feJ08yhdd5C+DXyLIIVdZ+jQ3hQlrQ1gk/iUca8gQhrZaVXQNc=
=vkzR
-----END PGP SIGNATURE-----

--Sig_/xlmM9B3iI4SZbsqiVRvNw=3--
