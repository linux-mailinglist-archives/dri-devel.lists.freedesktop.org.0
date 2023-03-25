Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B686C90A6
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 21:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF26C10E1FD;
	Sat, 25 Mar 2023 20:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4070010E1FD
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Mar 2023 20:16:26 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 6BD481C0AB2; Sat, 25 Mar 2023 21:16:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1679775383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xqv+LYcfzddHbULRn10F7Da1YwCj3m98d7oAQjoYGQo=;
 b=B5AZEG43iNeUPKu79Eo0CyI08wIXEWhIqsBeBT8D/Izq7a3qF/JxexeD1HGPBp23uIqfM5
 pFwP/gCaqs2IO5IaSXoynKbGcwvjOF4N+5gRT3lwqd4gMW1TmShm+H1r4PI9pdqQHJOKyy
 FJFPY7MuiYNHvvUBmRScLVNbDrSz7Zs=
Date: Sat, 25 Mar 2023 21:16:22 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH] drm/display: Add missing OLED Vesa brightnesses
 definitions
Message-ID: <ZB9Wltd9jiI7ktse@duo.ucw.cz>
References: <20230322160513.1438881-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="vZOsuThjzQLN1+xx"
Content-Disposition: inline
In-Reply-To: <20230322160513.1438881-1-Rodrigo.Siqueira@amd.com>
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
Cc: Felipe Clark <felipe.clark@amd.com>,
 Iswara Negulendran <iswara.nagulendran@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Anthony Koo <anthony.koo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vZOsuThjzQLN1+xx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2023-03-22 10:05:13, Rodrigo Siqueira wrote:
> Cc: Anthony Koo <anthony.koo@amd.com>
> Cc: Iswara Negulendran <iswara.nagulendran@amd.com>
> Cc: Felipe Clark <felipe.clark@amd.com>
> Cc: Harry Wentland <Harry.Wentland@amd.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Some changelog would be useful.


> +++ b/include/drm/display/drm_dp.h
> @@ -977,6 +977,8 @@
>  # define DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP		(1 << 5)
>  # define DP_EDP_DYNAMIC_BACKLIGHT_CAP			(1 << 6)
>  # define DP_EDP_VBLANK_BACKLIGHT_UPDATE_CAP		(1 << 7)
> +#define DP_EDP_OLED_VESA_BRIGHTNESS_ON      0x80
> +# define DP_EDP_OLED_VESA_CAP				(1 << 4)
> =20

Are you fixing a compile problem? Otherwise this should go in with the
user...

BR,
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--vZOsuThjzQLN1+xx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZB9WlgAKCRAw5/Bqldv6
8hNeAJ9Z6iHpiX7M02eWAO5DogqxZDen0gCffJw9G0L8fNgcM6poGr+ycBvtTFw=
=pb8n
-----END PGP SIGNATURE-----

--vZOsuThjzQLN1+xx--
