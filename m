Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7E39AF449
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 23:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E05910E3B5;
	Thu, 24 Oct 2024 21:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="o97BU/go";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219DE10E3B5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 21:08:10 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4315abed18aso13897105e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 14:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729804088; x=1730408888;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JXzfJ7cqlnASO1zqkCXSkoonsDfJDkVTL0G0jDOPo4U=;
 b=o97BU/goTT2Bv/rhvkyd14Z2DpQopfJgzNRYENuIuRznpdJAKmPA8y1PqdnqWmJ94/
 nGnJfUYF8VkM0D518gImro8Bz4WVfP6Xlq/0RTzaRzSEplwaOideURW9xcU3sjvHILAT
 hbtQE16PA1nh+cXLCoRYS4JT18tcmuihYBqaBKvXWa6nODvCLuSJaaJJyFg1Rz/CwYea
 hBO5J/KS4Io2k79FKk0jG8h61AXSVZSvGGwEsoV0UmJZMzmhzdXBOUTDqhQs5XinHrQ5
 pjMmQ/d9m4fLi3UzvGY6ZrCys8Ogh3vaMB0kQHXZp4JB2uCKvjh3ke2W+kBTmuWB/c3M
 Z5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729804088; x=1730408888;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXzfJ7cqlnASO1zqkCXSkoonsDfJDkVTL0G0jDOPo4U=;
 b=mfQIEExObMl0ROF6p/Q/t67cC9mqJ1jtAWHo+Wjq14rauvUJqEvJ3ZFdqW8mBYir8R
 IwG1mYmJuLw0zklGKe4Pe7lZUtrzLaIbGFboOcw/fLS+iFHkXbOGCf7abxuvEjpNsdkg
 5sngtNV3Q9jXGva5vWiF8LLnHyKEURS/rnMz0nBGEOOCq1A+DhOojnW8po41c5UZAEWK
 3oDMvUVXdr7Qx4MACgA5i7TTaVNars4rgwOJGu4X6PGB0IjPhUXS81VjQtZtDi8WmtZ8
 Ck/jVYh6zc4MKSpbMKzD+/damH6/e+Sh8PZc8xsus2WCP0elyyW7SLYjL96xZID2cTfO
 q0vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL4sa2wvhTFtq+7eLhUJCJawohYdK5yNY8WjuwqxYDLABr7y4lygHqfynbv+IOBmrsVZ8KFEvfl/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKx7iqvfLDVjqMMVDr0mr0cr58km1eliTe2PJJkP4OdEWhRE3k
 flzOys4FgDI5qJDdYAiAMYENRT2Dthbp2S4Df1T63LE8V2TKea9aR5ohweNRlBs=
X-Google-Smtp-Source: AGHT+IFPD1/8m7Hsha9KdxajU1P1rbyaitEfowedegYL3ikz3BOnud7i8xwSlMTzFILBgSYBentRcg==
X-Received: by 2002:a05:600c:4e8e:b0:426:64a2:5362 with SMTP id
 5b1f17b1804b1-431841fd6b6mr59065025e9.8.1729804088119; 
 Thu, 24 Oct 2024 14:08:08 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:b203:5494:7e5a:8c7b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b56facasm28351265e9.33.2024.10.24.14.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 14:08:07 -0700 (PDT)
Date: Thu, 24 Oct 2024 23:08:05 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alex Lanzano <lanzano.alex@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/sharp-memory: Fix some checks in
 sharp_memory_probe()
Message-ID: <hojly7qagyszxbgonzqmuuxucdfqwovrjyiktdxpibku6yodum@n7algnce2tts>
References: <0d307349-c141-49ee-8b34-67caf5f8b638@stanley.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3hjnzdxx2pfoo4ij"
Content-Disposition: inline
In-Reply-To: <0d307349-c141-49ee-8b34-67caf5f8b638@stanley.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3hjnzdxx2pfoo4ij
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH next] drm/sharp-memory: Fix some checks in
 sharp_memory_probe()
MIME-Version: 1.0

On Wed, Oct 23, 2024 at 11:30:31AM +0300, Dan Carpenter wrote:
> The devm_drm_dev_alloc() function returns error pointers, it never
> returns NULL.  Change that check to IS_ERR().
>=20
> The devm_gpiod_get_optional() function returns a mix of error pointers
> if there is an error, or NULL if there is no GPIO assigned.  Add a check
> for error pointers.
>=20
> Fixes: b8f9f21716fe ("drm/tiny: Add driver for Sharp Memory LCD")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/tiny/sharp-memory.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/s=
harp-memory.c
> index 2d2315bd6aef..1bcdd79166a4 100644
> --- a/drivers/gpu/drm/tiny/sharp-memory.c
> +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> @@ -543,8 +543,8 @@ static int sharp_memory_probe(struct spi_device *spi)
> =20
>  	smd =3D devm_drm_dev_alloc(dev, &sharp_memory_drm_driver,
>  				 struct sharp_memory_device, drm);
> -	if (!smd)
> -		return -ENOMEM;
> +	if (IS_ERR(smd))
> +		return PTR_ERR(smd);
> =20
>  	spi_set_drvdata(spi, smd);
> =20
> @@ -555,6 +555,8 @@ static int sharp_memory_probe(struct spi_device *spi)
>  		return dev_err_probe(dev, ret, "Failed to initialize drm config\n");
> =20
>  	smd->enable_gpio =3D devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_H=
IGH);
> +	if (IS_ERR(smd->enable_gpio))
> +		return PTR_ERR(smd->enable_gpio);
>  	if (!smd->enable_gpio)
>  		dev_warn(dev, "Enable gpio not defined\n");

Use dev_err_probe() instead of plain returns?

Best regards
Uwe

--3hjnzdxx2pfoo4ij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcatzIACgkQj4D7WH0S
/k7sjQf9HxKcouACQt7j/TiWaHv1n9Dw59KVCBvbJ3GvxCTuBeRG+1KI9cKTeumE
Rm91JB1wya0l0o1QaaYbTq80gBNLIQ+tyVtdhtDh4jJ4gIvtjx6UavyWogj7UQvf
prverPw2PSS6EMPpeqbJhRFPSsi9Hq6ihXSrm13E5OADjQL3hAof/rDGhCLvf+PH
9tyFiOFdoQW7WuZHgQ2I+XWj6U/kSPquAA/D6Uf6PlYDEAyUvPcRvC4dMD7GpZ2K
Y3OxXMcnTSopDGovPgTpiFR9RySYF1+3A5kqz2EFqnytZVZ7+GmsWctY4ZB8F67i
bL1/7QVqC49NKvRGbl/jE5DHw0/cDA==
=dMac
-----END PGP SIGNATURE-----

--3hjnzdxx2pfoo4ij--
