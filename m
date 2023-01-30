Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2306808D0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 10:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD5F10E18B;
	Mon, 30 Jan 2023 09:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB97110E18B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 09:24:23 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::231])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id CFA7EC5623
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 09:15:51 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 05786100018;
 Mon, 30 Jan 2023 09:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675070147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6BWT3DtZUD21Vj0byUAWzym0jsiIgka9xlCtmwIUodA=;
 b=kXsHWFroYaLbogha0t2iQo6Q//M18cxcE83JL2mmZ63MDHnyoF3WU2vgK31UlI8a09IMZj
 b8IPW4bLcJAGzzL6gTNxJTpNq9W5A3z6q1Em9MtwjWvuZBFLwIqUOMoVqQQulvvtDK1uaW
 XSrmq2rREt9vQIPsfSFbeTT8DJExzdaNHks+YnR32kr7J2cPrKy/n53WkF4QZJqntd4CX4
 jy5ilzT/UQoZOvzO+FMXEN/UHM4zc0Do9UFSGo57RuGUJW8wbbaterpt91Q7EBS4UQMadn
 r+0t78oghDm0jBUXwOewt5Fe85MnW/cUVa3lYTkVUAwpkSLuNbPkRa3SnX7VEQ==
Date: Mon, 30 Jan 2023 10:15:44 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH RESEND] drm/logicvc: Drop obsolete dependency on
 COMPILE_TEST
Message-ID: <Y9eKwMoK4EyqfEMK@aptenodytes>
References: <20230127120135.293dfc60@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sl7/F0umg8bAHEwZ"
Content-Disposition: inline
In-Reply-To: <20230127120135.293dfc60@endymion.delvare>
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
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sl7/F0umg8bAHEwZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

On Fri 27 Jan 23, 12:01, Jean Delvare wrote:
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Sounds good to me!

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  drivers/gpu/drm/logicvc/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> --- linux-6.1.orig/drivers/gpu/drm/logicvc/Kconfig
> +++ linux-6.1/drivers/gpu/drm/logicvc/Kconfig
> @@ -1,7 +1,7 @@
>  config DRM_LOGICVC
>  	tristate "LogiCVC DRM"
>  	depends on DRM
> -	depends on OF || COMPILE_TEST
> +	depends on OF
>  	select DRM_KMS_HELPER
>  	select DRM_KMS_DMA_HELPER
>  	select DRM_GEM_DMA_HELPER
>=20
>=20
> --=20
> Jean Delvare
> SUSE L3 Support

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--sl7/F0umg8bAHEwZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmPXisAACgkQ3cLmz3+f
v9HiPAf9HrNj1WqpkW6wKvRTPQO2OnUSwVpdBEpu+Y1MO9LKHp3FWxAY5OwfE9xn
IQoGGaV9PIT2cQpzvU3CiogMa+X2m2qEU+z2AiGT7qWMyMRsJjdl3OwPx4eV9J36
g43GN8dP8NUeUq1q371/FeTLIzvnsqWGUXfUomP2lS7TL85agnAfuJOifPWcxSOe
V02r5ZYu/5og/MQHoPS79ChHS0w09lbATWAXYK8G6jSciPVmLnXBEbk2wjZD28mv
KLqx7sQVNu9xeoDsBb+r1D3xZz+kuNtTC2Z67IvmqUmpOtYdLRtp3IlMA1ffZlrq
DkMWvCpELUseXQKhkJKtXL8GIA0C+A==
=uzNH
-----END PGP SIGNATURE-----

--sl7/F0umg8bAHEwZ--
