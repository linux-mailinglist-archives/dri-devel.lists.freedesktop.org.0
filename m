Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6315A97E32
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 07:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A872F10E1D4;
	Wed, 23 Apr 2025 05:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fDfLQOqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7505910E1D4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 05:41:11 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54298ec925bso8758901e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 22:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745386869; x=1745991669; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DR1efZenm2P7g4aFt/2B/58uRm9sc+D/LgJ45nCb2q4=;
 b=fDfLQOqNKJNynNZp5xLClACGO9GsL3MHiRVJj5+HlyIZRR4N/3boZpAONG3JirHs5q
 vTnxeEhxswffeCsz8reQSczWwzzWJwv8D2EO7tT7UEAPoVyQ1Wzc2xIaL+ZLVXM+ILta
 3GFA/jG/w1cdYm7SfKzwvrxbDImlYyiBYKohQoqQ7TurhPUF0KZKHymQiiB2m7IUxZD5
 TgoLtFz3RedK0eOwFFWJLT00VyCqIP/a+L0T92ACmYHqL3zl1JhZLS01zZU1tnihwZvH
 AViRlcfhUHzljwIRzLAR7qKXLwNiLwgYrRlAaKjgXm9MrAkGA+S0t9UjYox1RrQ71cFD
 qVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745386869; x=1745991669;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DR1efZenm2P7g4aFt/2B/58uRm9sc+D/LgJ45nCb2q4=;
 b=CIjnQEiXo7ub1FqToLOPIQipSQjbDmZ27YnUEWkmLuFByqsabzqpWKQOMMuMHH/5Ct
 pTsLHWfnVrsKHDAMAW6/9OGfaI2FK+G6SFbjhxzTbh5SD+fvCbu+12wyj2QQiiD9IFVb
 Hlj1OCKYmLJgG7lnDuDN09pvVteKwCeoowY/OFLuilfSPnwoxytNplolRWPeaTV5RIjE
 s5WkodGHyPMzWfccL8fxCzLvuNgNTAeyNKOFDYzE5EZSkbWUKJypvINpj+vQrpNIb7qs
 jlwegmtPVUaVjdlnJd5CLqDagRTEIK/L1u+CM6bhofjDLRP79OCgV3XacJ66Rak99432
 fleg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEMbT9Yl0zbbckmIiq5zajz1CJwQhLnMw/SqrPPJCPwADCvWwRZ5itb1wUaIAldtAWwY0rNX5Zr2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1tibp5sU7UGWPv/SB+QgfVfKGRraaovWTdREfFWP/fSiRrD1P
 KGbvJqIR27a0JU+VlUqinALjsnLy8u4vnDZXzpQS8PqT392rZLzi
X-Gm-Gg: ASbGnctzmUqPO62kjcdEd8bnnsu4wJtT4LCcXz5jCfvi5YsD4IZghLvJxgyAze7hM2y
 fo5l0pF3kPaHr0HY++9l7cf+gwEOlxF3ehrVX//gWSJVzJKlj9siqLeUx6H6pCL3dsvbuGt7Kfg
 5+IaIkC3hBqcYiNeSXYoUBx068KlX87KHyZUvymBk72RHbhchci8kGpF0YHkESQWkK4YxFfEgN4
 VhApw04lVBOZk+vTDHrnO5om8smJhb7pRUhlrkCWTX2OnJbU03mRbpak3peoi6fdmp06L8ysewJ
 +A6SlsYPiksN+F0wRYF6vw+v16GlT7Iofif6fw09P96dRKuCCEx7RDkkasKtnbeBsxuq5IXPvP3
 2Dw==
X-Google-Smtp-Source: AGHT+IHQHfQNMReW4DBewS6Oyk/+hyQARniOvNCBPWBnCxlka5W1mb3oSEgjNK+uMq63AFolkjntOQ==
X-Received: by 2002:a05:6512:2206:b0:545:48c:6352 with SMTP id
 2adb3069b0e04-54d6e658dadmr4907975e87.43.1745386869149; 
 Tue, 22 Apr 2025 22:41:09 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e54144esm1388050e87.93.2025.04.22.22.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 22:41:08 -0700 (PDT)
Date: Wed, 23 Apr 2025 07:41:06 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v4 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <aAh9ckXlJcXyB3BA@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
 <20250415-st7571-v4-2-8b5c9be8bae7@gmail.com>
 <871ptjbxr8.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vlQ/Rf3bjfEdQ8vd"
Content-Disposition: inline
In-Reply-To: <871ptjbxr8.fsf@minerva.mail-host-address-is-not-set>
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


--vlQ/Rf3bjfEdQ8vd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,

On Wed, Apr 23, 2025 at 01:08:11AM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> Hello Marcus,
>=20
> > Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> > The controller has a SPI, I2C and 8bit parallel interface, this
> > driver is for the I2C interface only.
> >
> > Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
>=20
> [...]
>=20
> > +#define ST7571_SET_COLUMN_LSB(c)		(0x00 | ((c) & 0xf))
> > +#define ST7571_SET_COLUMN_MSB(c)		(0x10 | ((c) >> 4))
> > +#define ST7571_SET_COM0_LSB(x)			((x) & 0x7f)
> > +#define ST7571_SET_COM0_MSB			(0x44)
> > +#define ST7571_SET_COM_SCAN_DIR(d)		(0xc0 | (((d) << 3) & 0x8))
>=20
> You could also use the GENMASK() and FIELD_PREP() macros for these, e.g:
>=20
> #define ST7571_SET_COLUMN_LSB(c)		(0x00 | FIELD_PREP(GENMASK(3, 0), (c)))
> #define ST7571_SET_COLUMN_MSB(c)		(0x10 | FIELD_PREP(GENMASK(3, 0), (c) >=
> 4))
> #define ST7571_SET_COM0_LSB(x)			(FIELD_PREP(GENMASK(6, 0), (x)))
> #define ST7571_SET_COM0_MSB			(0x44)
> #define ST7571_SET_COM_SCAN_DIR(d)		(0xc0 | FIELD_PREP(GENMASK(3, 3), (d)=
))

That looks better, I will change to use those macros.
>=20
> [...]
>=20
> Maybe a comment here that this function only exists due regmap expecting
> both a .write and .read handler even for devices that are write only, e.g:

Sure

>=20
> /* The st7571 driver does not read registers but regmap expects a .read */
> > +static int st7571_regmap_read(void *context, const void *reg_buf,
> > +			       size_t reg_size, void *val_buf, size_t val_size)
> > +{
> > +	return -EOPNOTSUPP;
> > +}
> > +
>=20
> [...]
>=20
> > +static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb,=
 struct drm_rect *rect)
> > +{
>=20
> [...]
>=20
> > +	for (int y =3D rect->y1; y < rect->y2; y +=3D ST7571_PAGE_HEIGHT) {
> > +		for (int x =3D x1; x < x2; x++)
> > +			row[x] =3D st7571_transform_xy(st7571->hwbuf, x, y);
> > +
> > +		st7571_set_position(st7571, rect->x1, y);
> > +
> > +		/* TODO: Investige why we can't write multiple bytes at once */
> > +		for (int x =3D x1; x < x2; x++) {
> > +			regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
> > +
> > +			/* Write monochrome formats twice */
>=20
> Why this is needed ?

If the display is 4bit grayscale it still expect each pixel to be
written as two bits. The mapping is as follows:
0 0 =3D> White
0 1 =3D> Light gray
1 0 =3D> Dark gray
1 1 =3D> Black

So here I write the data twice to get a black&white image for monochrome
formats.
This is not tested though, I only have a monochrome display to test
with.

I will extend the comment to explain this.

>=20
> > +			if (format =3D=3D DRM_FORMAT_R1 || format =3D=3D DRM_FORMAT_XRGB888=
8)
> > +				regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
>=20
> The driver looks great to me now, thanks a lot for taking my comments int=
o account!

Thanks!

>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>=20

Best regards,
Marcus Folkesson

--vlQ/Rf3bjfEdQ8vd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmgIfWsACgkQiIBOb1ld
UjJrOBAAsndlQ6aC/cblkWzinnmx1bnC6BYv17GBy0hFpsliau7s7sIDAYLiGqgu
U4qqJSrH3Gre8GMEnLVcPpomtng37c/JzZyl3+a+rt07kfaV1Fiq5u8gUi/aV6pm
n7tD0ILy5rTecfYNzdsux062TzkQhu2KhuQPwgx+9oox5op1sY+EwF0Edm89xVZJ
ajYOmmAernVvLSBLhRkwSLFaAWpyDVJ07tpWgkeYqRezaRum8PpzAobIhnVcQEOP
vGtqZrTS7IO59u+J3q3W9l8i9ne+QrWI/6gPwKkNB8BrMz2mm8KEUaLkERW9dLNO
yLumUxkSRzRsimDyfooL9eMqDUaHsUuhN1PEgZfrQhdYGdSgUrhgvKXqODWF/aAx
BPCZxB43ctXXqt15CC9f74u/KzD7lsAvgf6WAasxYnmwkpdhjHnX03vJEkVSvnMb
Rf9UyrLFuMGadiObsikIqPGWlkUM3l90S+zVNBFhTmuYB72lReyFsK8x8PsB99kg
84PIEhg607jKSoKh02Q5QdIFzhhOErTntBR7qnQSLfaDTf+4lsIurzDzmt7XH4fM
phxBpj9WSPJkIt7X4A9QpYnc6olkQ+iCCunywkpFPYJZg7uJmx4HkxI9jCTGXgWJ
rkY2AbyZwykY4UX2N9i3R4R1rrsvsxi2n+JB7TsucVzsZiB3nNU=
=Olpq
-----END PGP SIGNATURE-----

--vlQ/Rf3bjfEdQ8vd--
