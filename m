Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E3554F4E4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 12:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B0810FE0B;
	Fri, 17 Jun 2022 10:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB2810F56D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:08:45 +0000 (UTC)
Received: from mercury (dyndsl-095-033-171-130.ewe-ip-backbone.de
 [95.33.171.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: sre)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 73BFB660179A;
 Fri, 17 Jun 2022 11:08:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655460524;
 bh=MhsAOhB4QkXuwHstp4nO0ailRsQJvH3siehK4nQ2VZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dt4LyTZp8kwBJ8EpbQB2z9TEFviyHw4I99vgQA5lpdNvvWr+UaOl0UKPpT8Tu5eBA
 caQFZNHBGEvuu4nr69xyawVhuk6NB8ni5X7uhiByj4Mw4TDrN1lT1Fz8NH8btSxACl
 3FjF111coQKuDBJoMFc2r3yo6XKhBW6b+kQ+awXoWMoXSZFMCPuOgfAhD3OmkDlf0b
 6gbLUViv+Y4SNuZrTd/EK3csPCqCNdsrQOWx0mUyVy/Boc4PnOaTjTNcVC16ZFwESK
 HeFvlsgpdPmwe6DJBPzkLaJ3txWC/wFtD6ctoPukbcc5F0IQjHXiYGFzN6jW/Ghfyh
 Nz/ftnwHyQ6pQ==
Received: by mercury (Postfix, from userid 1000)
 id C524A106031F; Fri, 17 Jun 2022 12:08:41 +0200 (CEST)
Date: Fri, 17 Jun 2022 12:08:41 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH v2 3/3] drm/panel: sony-acx565akm: Use backlight helpers
Message-ID: <20220617100841.dk2txmttdi5iccvi@mercury.elektranox.org>
References: <20220616172316.1355133-4-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ru3t7sry2gd7yant"
Content-Disposition: inline
In-Reply-To: <20220616172316.1355133-4-steve@sk2.org>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ru3t7sry2gd7yant
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 16, 2022 at 07:23:15PM +0200, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
>=20
> Instead of manually checking the power state in struct
> backlight_properties, use backlight_is_blank().
>=20
> While we're at it, drop .fb_blank from the initialisation function; it
> is deprecated, and this helps make progress towards enabling its
> removal. This change makes no functional difference since
> FB_BLANK_UNBLANK is the default value.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
> Changes since v1: removed the last remaining .fb_blank reference
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/panel/panel-sony-acx565akm.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/d=
rm/panel/panel-sony-acx565akm.c
> index 0d7541a33f87..3d6a286056a0 100644
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
> @@ -349,7 +342,6 @@ static const struct backlight_ops acx565akm_bl_ops =
=3D {
>  static int acx565akm_backlight_init(struct acx565akm_panel *lcd)
>  {
>  	struct backlight_properties props =3D {
> -		.fb_blank =3D FB_BLANK_UNBLANK,
>  		.power =3D FB_BLANK_UNBLANK,
>  		.type =3D BACKLIGHT_RAW,
>  	};
> --=20
> 2.30.2
>=20

--ru3t7sry2gd7yant
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmKsUqkACgkQ2O7X88g7
+pqc+A/7BVnwVuT6BtOozU/v/rUvX3HVWDAmcgAFoy8eLJG+aD8Ho21zL+HdBT0H
Ug5OBy3J2gUHbqrMlIt1gIQ9duluzuMe7VxGpMt4rFRsCrLdOkLz8rhPNIhFyX+i
qaOzioDfSK9Hyfk7bH2ygAyZpVuNvXTAcuXUSV3YlwJ1tv4FEaDVGMUMDuHmDxHS
LGgChyCdDj+0QPzThBKLD/Wx/dmlLrXwEvkdVUaTAnrBksLjq4GR53DXSm5M8Wa9
i9MpewaMWFFm2JgXGllmstfnR1mXKHksigiDqC8ii3aO3RMaxSJjhJelqLMR3mkq
LslPk5LafrfhzcJRuBxBow5XBjBUBzC3sVeGO9946MbsZiKsNvZUdsTEtvm4gup8
Xv1LP5m6nSgIqQ8cdamQrDXH8UYbzVFGnyTBvSnsD3KEbqpGy3uP3hQwhKoLxl/o
Wp/EfC7bb7xWdjXUqo5TCD1IRauFMddOk1rNTjwN3pgmIbc0tMyhEV68dUzmsbWm
gIxFkD+/PI+e2JmTKpZcJJ5Sc2gMKuSXhaDE9ulBHeG/bGfd8fCiBQL482kaV8kq
bRjX3SakhNpkYrygLIPtMKnZaB+K6hzo512tHfN4tkHsghW9R0aIL32X6W7oZRxn
SVKcoC6+PTYrGcbEPI7GCfpyB7AdHdhQhZetHD6N9Ywxm+dnq1s=
=CH6t
-----END PGP SIGNATURE-----

--ru3t7sry2gd7yant--
