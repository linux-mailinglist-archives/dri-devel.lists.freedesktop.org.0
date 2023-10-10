Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96507BF54B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 10:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CE510E0AD;
	Tue, 10 Oct 2023 08:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4282710E0AD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 08:09:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9DA3ECE1CA1;
 Tue, 10 Oct 2023 08:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EB9C433C7;
 Tue, 10 Oct 2023 08:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696925348;
 bh=T2srF/onBx05Gpt/VaiMPkdkQm67uQpgAINVTqE0Ql4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pEnM6CxIg1eEBqYLeYHy3WTMvSbnD7cAHg3n3nlRFci7Z5Jiw6PJqw2IdEsDqFdBi
 FUGbewtKVzxlP5JHtcNkhSHSUBom6whSVlMGgl2TaK0DpmbfIW9lT1LKnl0C9MX/n5
 iALTmIqc6fh0oiL3Iyt+62vvowuAiSlQxZ//a+cdWSyM4M0QVIz1B4jangwOIoyAuz
 OleEPfP13JwOlOz4w593yvMUBqXtcUmKR+sbelpMMfL4ynME7kdRv4MK1tFrtA9O1m
 m1cIdH8FXXlkJkLrLmA35S8rbRmYHB5ycGhgc0gxXj15Rg0eT8idx+oxGESRNbMXvr
 qZ9cNjaneP/gA==
Date: Tue, 10 Oct 2023 10:09:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 1/8] drm/solomon: Rename ssd130x driver to ssd13xx
Message-ID: <now7afxcqtkizrxy45t5lmit4kpwkoxkogbhgnflje2frspnas@dh65qao7fhfm>
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3gmg4hckvfvtpruf"
Content-Disposition: inline
In-Reply-To: <20231009183522.543918-2-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3gmg4hckvfvtpruf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 09, 2023 at 08:34:15PM +0200, Javier Martinez Canillas wrote:
> The driver only supports the SSD130x family of Solomon OLED controllers
> now, but will be extended to also support the SSD132x (4-bit grayscale)
> and SSD133x (16-bit RGB) controller families. Rename driver to ssd13xx.
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

I'm not sure it's worth it. I understand what you want to achieve, but
this will create conflicts, affect the configuration of everyone
enabling that driver, etc.

And we have plenty of drivers that don't match all the devices they
support anyway.

Plus ....

> @@ -11,10 +11,10 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> =20
> -#include "ssd130x.h"
> +#include "ssd13xx.h"
> =20
> -#define DRIVER_NAME	"ssd130x-i2c"
> -#define DRIVER_DESC	"DRM driver for Solomon SSD130x OLED displays (I2C)"
> +#define DRIVER_NAME	"ssd13xx-i2c"
> +#define DRIVER_DESC	"DRM driver for Solomon SSD13xx OLED displays (I2C)"
> =20
>  static const struct regmap_config ssd130x_i2c_regmap_config =3D {
>  	.reg_bits =3D 8,

=2E.. We now end up with a lot of inconsistencies where some things are
called ssd130x and others ssd13xx.

Maxime

--3gmg4hckvfvtpruf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSUGogAKCRDj7w1vZxhR
xXnXAP0SMMU/76dIYDGz89GWg6IprkzXspEQGha03f2KjIgPRgEAzS6K+GpTZxEJ
Xeaw+Ogt8VRYOVnXpxLGSHGcIksiqAA=
=/LF5
-----END PGP SIGNATURE-----

--3gmg4hckvfvtpruf--
