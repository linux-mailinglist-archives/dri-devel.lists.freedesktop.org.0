Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A45BD2A2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 21:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680D46EAF1;
	Tue, 24 Sep 2019 19:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6716EAF1;
 Tue, 24 Sep 2019 19:29:08 +0000 (UTC)
Received: from bell.riseup.net (bell-pn.riseup.net [10.0.1.178])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (verified OK))
 by mx1.riseup.net (Postfix) with ESMTPS id 0D0901B91C2;
 Tue, 24 Sep 2019 12:29:08 -0700 (PDT)
X-Riseup-User-ID: 9B303D2645E7B7D16966C5D4D924D93BEE67E6BD21EE57D2BD3339EC23879DA9
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by bell.riseup.net (Postfix) with ESMTPSA id 70B5522528A;
 Tue, 24 Sep 2019 12:29:07 -0700 (PDT)
From: Francisco Jerez <currojerez@riseup.net>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/9] drm/i2c/sil164: use drm_debug_enabled() to check
 for debug categories
In-Reply-To: <f6f65ca7e27e949533e8cd1f43c61ecac73c658e.1569329774.git.jani.nikula@intel.com>
References: <cover.1569329774.git.jani.nikula@intel.com>
 <f6f65ca7e27e949533e8cd1f43c61ecac73c658e.1569329774.git.jani.nikula@intel.com>
Date: Tue, 24 Sep 2019 12:29:22 -0700
Message-ID: <875zlhwl0t.fsf@riseup.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=riseup.net; s=squak; 
 t=1569353348; bh=r+ypQCu5HAXnnweK0R8etsn44RguOiDdOTUwhNroSDI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YwNToPdo/KBdlWUry6EWBr6LLxzRrz69b1L5FOV7krCD9y+BO5x5dHj3Gva1BG7Lb
 8yhaeRa0wCA7KeFGywijVr3g4ZZrxoSivz6SWod0qzgHLoGMPlBZ6zHAa6JRH6aDdA
 AqGdMgV18oQR1NN3BDSgedGEkZn/ZI6LAKQQbdQ8=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2043814318=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2043814318==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jani Nikula <jani.nikula@intel.com> writes:

> Allow better abstraction of the drm_debug global variable in the
> future. No functional changes.
>
> Cc: Francisco Jerez <currojerez@riseup.net>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Francisco Jerez <currojerez@riseup.net>

> ---
>  drivers/gpu/drm/i2c/sil164_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/i2c/sil16=
4_drv.c
> index 8bcf0d199145..a839f78a4c8a 100644
> --- a/drivers/gpu/drm/i2c/sil164_drv.c
> +++ b/drivers/gpu/drm/i2c/sil164_drv.c
> @@ -44,7 +44,7 @@ struct sil164_priv {
>  	((struct sil164_priv *)to_encoder_slave(x)->slave_priv)
>=20=20
>  #define sil164_dbg(client, format, ...) do {				\
> -		if (drm_debug & DRM_UT_KMS)				\
> +		if (drm_debug_enabled(DRM_UT_KMS))			\
>  			dev_printk(KERN_DEBUG, &client->dev,		\
>  				   "%s: " format, __func__, ## __VA_ARGS__); \
>  	} while (0)
> --=20
> 2.20.1

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEAREIAB0WIQST8OekYz69PM20/4aDmTidfVK/WwUCXYpukgAKCRCDmTidfVK/
Wwk2AP9czE/Zy6605yld8+eJTJZXt9KmRG/kGEo7qD2X2BP+uAD+NVJk0nWVB3/+
GfvNGXqe3MXcs4OGswWjzLEYELln0D4=
=yQVN
-----END PGP SIGNATURE-----
--==-=-=--

--===============2043814318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2043814318==--
