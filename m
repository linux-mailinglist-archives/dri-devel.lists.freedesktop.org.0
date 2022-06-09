Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C35E45456C3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 23:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC5910F04A;
	Thu,  9 Jun 2022 21:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3FD10F04A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 21:54:31 +0000 (UTC)
Received: from mercury (unknown [185.209.196.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: sre)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A48C66601748;
 Thu,  9 Jun 2022 22:54:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654811668;
 bh=zRnnTVAUt6ijLqkuBYdiwMP+tQeqKTi8wydvWnAWPFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AjczFZkiUn5uFju4EXRrWY2etJeZ9fW6Kd8pPeo1hz7/176YlCq3oswDjPa/9y7za
 Nw3tfkG7MdNxqVs7A4yBmRHBSRMxja+u/AX48zRpIjQPLxagBfiXvKEICUEbRA61zX
 V7DFVHsCIaS9HUc3NqI9J4q53JJawR9Rf3cdg6m8HriSJJiQc6DHasLbvPOHQcIdAG
 Ts1wjnIdiBJ0EYYpnrqiryRLHGNMxTc0f+OpyDxhW6HTDRR7ZC36u1XEH58eqaz5lk
 2qnRB8ebqbPU4+YLFqGRT0QCD0RWNZSPZfiEow3f/HHSlcFgMsnAIeywM9dBKanv5T
 w/k0DZFQWQIgQ==
Received: by mercury (Postfix, from userid 1000)
 id 344A310605B9; Thu,  9 Jun 2022 23:54:26 +0200 (CEST)
Date: Thu, 9 Jun 2022 23:54:26 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 3/3] drm/panel: sony-acx565akm: Use backlight helpers
Message-ID: <20220609215426.l3kvsedw4ktr6ciz@mercury.elektranox.org>
References: <20220607182026.1121992-1-steve@sk2.org>
 <20220607182026.1121992-4-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gdbos575pto4xdp7"
Content-Disposition: inline
In-Reply-To: <20220607182026.1121992-4-steve@sk2.org>
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


--gdbos575pto4xdp7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 07, 2022 at 08:20:26PM +0200, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
>=20
> Instead of manually checking the power state in struct
> backlight_properties, use backlight_is_blank().
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/panel/panel-sony-acx565akm.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/d=
rm/panel/panel-sony-acx565akm.c
> index 0d7541a33f87..a6bc8c8cf6c8 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> @@ -298,13 +298,7 @@ static void acx565akm_set_brightness(struct acx565ak=
m_panel *lcd, int level)
>  static int acx565akm_bl_update_status_locked(struct backlight_device *de=
v)
>  {
>  	struct acx565akm_panel *lcd =3D dev_get_drvdata(&dev->dev);
> -	int level;
> -
> -	if (dev->props.fb_blank =3D=3D FB_BLANK_UNBLANK &&
> -	    dev->props.power =3D=3D FB_BLANK_UNBLANK)
> -		level =3D dev->props.brightness;
> -	else
> -		level =3D 0;
> +	int level =3D backlight_get_brightness(dev);
> =20
>  	acx565akm_set_brightness(lcd, level);
> =20
> @@ -330,8 +324,7 @@ static int acx565akm_bl_get_intensity(struct backligh=
t_device *dev)
> =20
>  	mutex_lock(&lcd->mutex);
> =20
> -	if (dev->props.fb_blank =3D=3D FB_BLANK_UNBLANK &&
> -	    dev->props.power =3D=3D FB_BLANK_UNBLANK)
> +	if (!backlight_is_blank(dev))
>  		intensity =3D acx565akm_get_actual_brightness(lcd);
>  	else
>  		intensity =3D 0;
> --=20
> 2.30.2
>=20

--gdbos575pto4xdp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmKibBEACgkQ2O7X88g7
+pq1+w//Yf9t5Jovb1ap56Lhbnh4EilGAtqgQte2isRx/3tVzsr4k7T/GsbresDO
TnfuYCf5cJZoMhr45W0QAWlnAiMsZmj/IDuG67iPjJa2slFOZgpa76N3uPVnc5Rk
TAmMfM8jYYO9fQgkmIWGA+gtla2lhH9i2Pj49zO6m393Z9N8lccAETLZ1VvVovY0
vO410/ARa76BMHqGTZrVvDDfXAm7B3D+mwUcnjiVki+nGJsU87c0VhGT6Xxvuskx
j7AutkGCn4tr0gzGPlu7ZECZKylt0Md9ixbCJ4rV1m8soactr2LmzZ01jxc7yYl4
hbMRtR8GDLF0iSYpQDE6SI2w8uvo18oZsM8snNgLy+56DdLW5/9PtEgPBJ50Jnus
zXRhGjTUFtcSm6Yxv8gj4M15A+bEZTGssaouYzYWYJctgtxxxCxrCySa28YUG5Og
ULTpUov3CwHxls2M7Z0n9kiI1c8wQva5ZaqeDgioF/AygFBT78wc9ggKEepJEykE
elRquxTY5EQxBV1upP8qmvguJ4OY51EAz0e52jlhRRB7kccg1BqnMVJRD+G4Il+9
o0BhSe2rGDrqXb5PYFORUSE4cUY9H8PwrQjoz7Q5DfRg6O8qeYKZrSs22CegnksJ
M/jp7mcIsH5fKCKtCFmyygBS0ku12BHGcI66a1Y8lNA4LAz0byA=
=vw5I
-----END PGP SIGNATURE-----

--gdbos575pto4xdp7--
