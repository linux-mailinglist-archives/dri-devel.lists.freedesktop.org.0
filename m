Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 808AF380EE8
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 19:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40F86F3B5;
	Fri, 14 May 2021 17:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B1E6F3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 17:26:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ADD97B05D;
 Fri, 14 May 2021 17:26:29 +0000 (UTC)
Subject: Re: [PATCH] drm/ingenic: Fix pixclock rate for 24-bit serial panels
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210323144008.166248-1-paul@crapouillou.net>
 <6DP1TQ.W6B9JRRW1OY5@crapouillou.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a42b2e5d-49e7-a15b-5f5f-9eb858e8fdf6@suse.de>
Date: Fri, 14 May 2021 19:26:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <6DP1TQ.W6B9JRRW1OY5@crapouillou.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="G7VCp2Z0I1tFZjwjRdIoitLmgxDDw7plp"
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, od@zcrc.me, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--G7VCp2Z0I1tFZjwjRdIoitLmgxDDw7plp
Content-Type: multipart/mixed; boundary="OhnXwSyToQ4awsPKWuJhB0YdMEH22aaoz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-mips@vger.kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, od@zcrc.me, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <a42b2e5d-49e7-a15b-5f5f-9eb858e8fdf6@suse.de>
Subject: Re: [PATCH] drm/ingenic: Fix pixclock rate for 24-bit serial panels
References: <20210323144008.166248-1-paul@crapouillou.net>
 <6DP1TQ.W6B9JRRW1OY5@crapouillou.net>
In-Reply-To: <6DP1TQ.W6B9JRRW1OY5@crapouillou.net>

--OhnXwSyToQ4awsPKWuJhB0YdMEH22aaoz
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 13.05.21 um 14:29 schrieb Paul Cercueil:
> Hi,
>=20
> Almost two months later,
>=20
>=20
> Le mar., mars 23 2021 at 14:40:08 +0000, Paul Cercueil=20
> <paul@crapouillou.net> a =C3=A9crit :
>> When using a 24-bit panel on a 8-bit serial bus, the pixel clock
>> requested by the panel has to be multiplied by 3, since the subpixels
>> are shifted sequentially.
>>
>> The code (in ingenic_drm_encoder_atomic_check) already computed
>> crtc_state->adjusted_mode->crtc_clock accordingly, but clk_set_rate()
>> used crtc_state->adjusted_mode->clock instead.
>>
>> Fixes: 28ab7d35b6e0 ("drm/ingenic: Properly compute timings when using=20

>> a 3x8-bit panel")
>> Cc: stable@vger.kernel.org # v5.10
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>=20
> Can I get an ACK for my patch?

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>=20
> Thanks!
> -Paul
>=20
>> ---
>> =C2=A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> index d60e1eefc9d1..cba68bf52ec5 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> @@ -342,7 +342,7 @@ static void ingenic_drm_crtc_atomic_flush(struct=20
>> drm_crtc *crtc,
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (priv->update_clk_rate) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&priv->clk=
_mutex);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_set_rate(priv->pi=
x_clk,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 crtc_state->adjusted_mode.clock * 1000);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 crtc_state->adjusted_mode.crtc_clock * 1000);=

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->update_clk_rate=20
=3D false;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&priv->c=
lk_mutex);
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> --=20
>> 2.30.2
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--OhnXwSyToQ4awsPKWuJhB0YdMEH22aaoz--

--G7VCp2Z0I1tFZjwjRdIoitLmgxDDw7plp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCessQFAwAAAAAACgkQlh/E3EQov+Di
Gw/+PpBVTvAcF4ltDId9QyywkeJ/xdvRf41hqgazerZAWctCXWwOVIIAYn5lHcazl/dL4olLKNsO
F3eD7Si7RWmXe4+b2NqaweIesaDafGK4vdcS4mHS4JVHMkd1DhCxdwpy3uBbW5ZNXOv5TJldB3Jt
Ikm2sm6psm3h5D2li+j6ew6qcVxK+3Cp8uVvHp6RH4cEcOIwbWZp/B4H1P5tMDzq7lpvjGYUQH3H
MEwy8RYfX+igmRI9rdVXV/hEfBNOq1gLBmZQgGQR1EnRgL/rRTJ2AFci1NddETnMwuiOdpY6A0DS
XK+Iy+XtUozzkJ8TO2rjwo/NyQYB3tvpnJJ6kkxHpWaowztqqIjrOL5snrw+jhqu7+EwJikbrPm3
AXBEgwFz2/+Dk28We1onnRn6MIEC+0iy08yE+E67iCb0JXw+CiLadtqSVtzw9qNebMFn8vEjz2if
6vv6bCWk2ae4LKh5LENpWI07WvzOWnzuDn0jUFa6P1yyx2AMgKd9tot0/p6MxX3oD/LY/b9aIXSG
LzGFncU3gh/e2h+vUwzkb1coE2cgF+j5HIj0ot0qNJIAyoqUCN3GYBvcKr3nSUZwAv9J3aRmCtmY
uPetTQRJH4psx/+oI09jkt4/Wn/kxlLUoB7a/JJvyMWEC+9FkKhQntLEdJasGd6tVP1OySrrCQGv
+zo=
=JL3k
-----END PGP SIGNATURE-----

--G7VCp2Z0I1tFZjwjRdIoitLmgxDDw7plp--
