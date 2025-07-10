Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09787AFFF98
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 12:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435C110E211;
	Thu, 10 Jul 2025 10:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H4ubQMnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F5E10E211
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:48:02 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5562838ce68so745808e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 03:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752144480; x=1752749280; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EeyQd3+FwTnYSdw2VCo0s+mkigMBSF97ai9NjTs6fao=;
 b=H4ubQMnVwGreSlhIp9QZ8MyNSfZWG6aqrGRsYAQJS0g8gE646Jo3+OB92CJ+bC814a
 YD+fGM0GfyT1A7hkDkFwOBPp4c/pizUj+ChY5ojDYhRtq7+qjXWPnBBQmQl6StSwfTf6
 lWhgUm+mdGQa7gvc1x3T91hp7tnGdDPRHCgsm8t58dHldYmes4qxzFPOBXQiFC80xwjP
 YUBSsl+DyqgJhAGGlL0YzK8JJxA7mUEYjKKugM9pZS9+Vza2a2vfOfQ2lYgjNNkSvap2
 qU7S1Zs9nlmtHbM5SzURA0hwIn/GpEuC0EkSxspYSp5M3bz24IzjPJUV+XuyaoGQyWeg
 FDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752144480; x=1752749280;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EeyQd3+FwTnYSdw2VCo0s+mkigMBSF97ai9NjTs6fao=;
 b=QOaPx4OdaZknRxqFXJOLBzPSQe2yVQTyf2e1KaU5UtVoMZXVNW3Ed/5yl5yO5LyPTD
 9TiAnBbJXjXOD+YKcNxPEQWf8gtIOM5GCtciNv0j/uv9ud6th6lEjVYkdjuC7NUsOHRU
 68q2xnkZxiIe5ZxwrMT2D+RobqdTiuQWIklXkJX1i4ArA5d5m6Y+C2Ygyh9eB6TSyNOC
 SCuxY1XQIG7qSjFvIzApwAJetA1Wrdrki6q95qomqRlYRpahX2QtRqotkJbKxlrY3RwW
 pH2MGfUPR8LqOi06UvMfXAuIdKWEgiulD1K3VpDD99jMUvRqUOq2LvW9WIPL9yMrqxKU
 nnzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4KIdmCZ0LtzSp0/G8fNgPGMCNH6UlHR6Wygew+/erPlIYbR+cvCx38QOesUIaBJ5C+Z9v2eVVc3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxqb8CEccVFTHAulCQZytkyOVWDWbBEaieOewWeUH4sKR+aEu0C
 RPwCL9Qyyfdv8xGjD5t4wXvzUHeG04qKQPu9Vj4gKB4t9wlpDFx9WAKK
X-Gm-Gg: ASbGnctReMdh7awjqq1HQ98ocg+7adHMEAoTRR+8S7IC6ncwMAKWe1Q+bQKHmGW7HeG
 Bi4cukGUE2CowKVB/Pe0r1wwQ8V1DY8jFvdVX8vLt3UiLoMCmliujk8x1lGRV9fwAng9wUU+5EB
 ikFQQtIk1nsaYGIhBuZcU4OdYIMLZ9JbaOApB9e514a4YEJaj0SdTQ0o9gdGNOKieM9l5BisKUz
 VQaqg/b+lS7kn6DpthX26lY6ePRGl1c7yFVQ0VT7RlNv66577pngwYXc/tiqdXsgoY0qTnG9VSB
 oSzWZxYogi78jnRCBilSq0Jn2YA4yOR/KpUvpEUwRPp+Ike5eDwynr9rwdo16T6/fDEFxBi/GN8
 Mf/XXn6IbnEJS0L4WO7fC5YA=
X-Google-Smtp-Source: AGHT+IEOTgz8Yn/OZ6h83EwkwJBqrgRuTKQeHj+q8D1ovN7NKHb6DiFoTh/pZu7ebVo1ZfMvzg5Ceg==
X-Received: by 2002:a05:6512:3c8a:b0:553:202e:a41c with SMTP id
 2adb3069b0e04-559000c439fmr1097729e87.28.1752144480144; 
 Thu, 10 Jul 2025 03:48:00 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b74335sm329631e87.215.2025.07.10.03.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 03:47:59 -0700 (PDT)
Date: Thu, 10 Jul 2025 12:47:57 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, ipedrosa@redhat.com,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/sitronix/st7571-i2c: Make the reset GPIO to be
 optional
Message-ID: <aG-aXTgycE4JEJEZ@gmail.com>
References: <20250710102453.101078-1-javierm@redhat.com>
 <20250710102453.101078-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eOMp4AYn7twABwbo"
Content-Disposition: inline
In-Reply-To: <20250710102453.101078-3-javierm@redhat.com>
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


--eOMp4AYn7twABwbo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 12:24:34PM +0200, Javier Martinez Canillas wrote:
> Some Sitronix LCD controllers (such as the ST7567) don't have a reset pin,
> so lets relax this in the driver and make the reset GPIO to be optional.
>=20
> The devm_gpiod_get_optional() helper is similar to devm_gpiod_get(), but
> returns NULL when there isn't a reset-gpios property defined in a DT node.
>=20
> The DT binding schema for "sitronix,st7571" that require a reset GPIO will
> enforce the "reset-gpios" to be present, due being a required DT property.
> But in the driver itself the property can be made optional if not defined.
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>=20
>  drivers/gpu/drm/sitronix/st7571-i2c.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitr=
onix/st7571-i2c.c
> index eec846892962..73e8db25f895 100644
> --- a/drivers/gpu/drm/sitronix/st7571-i2c.c
> +++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
> @@ -802,15 +802,19 @@ static int st7571_parse_dt(struct st7571_device *st=
7571)
>  	st7571->nlines =3D dt.vactive.typ;
>  	st7571->ncols =3D dt.hactive.typ;
> =20
> -	st7571->reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	st7571->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(st7571->reset))
> -		return PTR_ERR(st7571->reset);
> +		return dev_err_probe(dev, PTR_ERR(st7571->reset),
> +				     "Failed to get reset gpio\n");

devm_gpiod_get_optional() returns -ENOENT when the GPIO is not found,
and that is no error we want to propagage upwards.

Maybe something like this instead:
if (IS_ERR(st7571->reset) && IS_ERR(st7571->reset) !=3D -ENOENT)


Best regards,
Marcus Folkesson

--eOMp4AYn7twABwbo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmhvmlgACgkQiIBOb1ld
UjIYehAAqdDofl1NZfrXplyMLlYvsv0zY6FKIOjlOzV6Hi/GizuR2JTKqffK+3fn
OEdmpbkMYj+nWOJBQj9t9uolWGa7A1G3K408CmIXU9vKhbS/EBIbL88CwS3aZUja
Rg/CW9Mc1RE6CDKaixSQwubaKoiz3RPqC/QwyJY4eZ1gpxKKplRLfAc62bO1WfcZ
4rOH68fNHH0bO7J3q5gdZtgv/OxtBwhHhVJ6ntCpqTSBr7z3iw+fZsy/z0gilTQy
M9V/Cq4ilBxMPgu3rLFl/ebC/SGF0S8cIEkiP6UAhY+BWrLIN+JNqASvj1dYnGsn
Q5odrBX3wI8OwvROzoPfLP4/FmJreYFU40mNZa9+JqrfG1HGc2IBEkRoCZjUVPDg
/JAS7UGc8S+NQI/C7Q/U5x5IgCgASisDvzSusApuCrp5XRHPQ3TvEDvzU4zUsAue
p5E66zBveFCMj1agTCBY4M2btwnenfoal881HJGLYp2gtmMBNrWc3PmWwQ31g/cW
BQMfxtARCAe6VE+wywAQchXRHJeNejJYicAyu8FxacmCR7pMaonzPFUlPyGlUpJi
5mklgy2FKz8V5M4PQ3Mh8eGyq4JQNTn7Tym6OKY2FTLEwm2uDV2Qx5HtbgRCLJD7
hUR0Lji4qzMfuJv59Jmzr9C5ufkw1A9DAwbE696PD5E20BTcShk=
=wIuD
-----END PGP SIGNATURE-----

--eOMp4AYn7twABwbo--
