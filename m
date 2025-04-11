Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9918A853DE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 08:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D61D10EADC;
	Fri, 11 Apr 2025 06:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iM+f4QmS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32B910EADC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 06:03:35 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30db3f3c907so15279721fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744351413; x=1744956213; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KogIvuVDAt2X129qWiT+1rCQQg1lNr3mi/gTxLDY/rc=;
 b=iM+f4QmSxi2mI453DYc/Uwo4RDA9FGfazyADst7zhq0qk0pu0iQd8STVL7s8RRbEDz
 uacFnTC/8WVvje0avg79Uwf5MnSdKJcQGIGgI5zt0JBcrlNBwg2XrKNPOb1rvKcOxS44
 s1y0KZqBjZhfroNUzuAqVkHSBHxkE6tZjlxG35aC8WywXa+mRwUjGiA0nJsP18BX6JhN
 nSeq8ZcJKFLxSYW6Ti4mDHvcIa4A0AxRh5A64Su8MnOy5/8ZtKmj7pQFOBoGTo42IoHG
 F4I11zIL7vbXwqNwcd1UQVLTPKLUyXSsl+NXZQozWheaWQUEW3WlKnPAYAwaBcI6zHnM
 A2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744351413; x=1744956213;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KogIvuVDAt2X129qWiT+1rCQQg1lNr3mi/gTxLDY/rc=;
 b=aec7B7vW3BEPqe271heMB1nyqG9Y4ExcnNTubIfPt9qqU25PMuYIwl0bdnhzbwp03q
 Pk2Kq1mPYu1UD9kyRoPGWyHrx2CpmgOca4TMP/CoR6nx1p2wZYVQDJY1Aa3OS4W/w6kF
 BMaAr+JFzf5fUzrOYXwvXlvoelalq8jjAPxs2rw3k8mVrAitM9DS9+/v3ZPXpLfyvSs0
 0/n+Q8q2uqbo6a82dmjG70NsDEU0hFTWrl+nDajDPtBwifdquqg81w535GsPcfRURtJq
 My+N3Dvp0UlfDmBkookCzf4SoWbvIaJzPvK5mYWyhJqAQpyXt5P0QdC8x2PNP0a2TG+W
 mwSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUNkX5jfrFR9McdqIoiKq82MxYXDdxwX3uCEzA5xYTl41nSy5Ij0B6aGgqbaRzzFSaz7kTNk3yPxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXv9twfIC99ZmyvMiDAUPJDepvN508kKwuPPrDFIq7Gpj1a/b+
 FaRP1+zNBNYRvKnL6jZwxu2YZFGOM3J8KMaMVIHJKqjv/Y7HfGIy
X-Gm-Gg: ASbGncsUAaoypSAdymP69fbYf12nwwhSskkDwjQW56BUZilbq8s0V0V3UDUkEaTt0Vx
 4wIFFWbeKQvzAuwKbj+56AbPImYdqzsS5rwq33cE58Dsihg4My4+v5fZKAezvmRZ24aeVc7VN6+
 7SybBye8h8hMJYW4bo9RVtotsMAsfsalh6BwY4KrzJ67mRzLIvdmByXdreBOYEitBAdzWFAg1yh
 rf39pXVo/awOwR10HYWqE7usgNkz6rIMhyQAvfV81D0pnqOTSRfdMLyweORoJf6NfRuYAvXyQR9
 1eIoXF/ymGmQLh3quCguPwuMKF8O5Zln/eSVA0LBEGz6x6pRykybfZyYhMtO/ELq+HBPFuZJTxO
 44/T+J/O/E2Wn
X-Google-Smtp-Source: AGHT+IELeqhKYDoyLZxkTlWhRxGJfiYCFeb68UsWHeuWkSgfqQgVXqQSvk+wW24gS0mK2grv/JSIzQ==
X-Received: by 2002:a05:651c:12cb:b0:30d:e104:b592 with SMTP id
 38308e7fff4ca-31049aaf9bfmr4987611fa.38.1744351412983; 
 Thu, 10 Apr 2025 23:03:32 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f465d4ee8sm7221121fa.77.2025.04.10.23.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 23:03:32 -0700 (PDT)
Date: Fri, 11 Apr 2025 08:03:30 +0200
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
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <Z_iwspuiYAhARS6Y@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
 <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0+MSCrb+186FMFuN"
Content-Disposition: inline
In-Reply-To: <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
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


--0+MSCrb+186FMFuN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Apr 09, 2025 at 11:43:54AM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> Hello Marcus,
>=20
> [...]
>=20
> >>=20
> >> That's a god question, I don't really know...
> >>=20
> >> But fbdev does support XRGB8888, which may be another good reason to a=
dd
> >> it and make it the default format. Yes, it will cause an unnecessary p=
ixel
> >> format conversion but the I2C transport is so slow anyways that comput=
e is
> >> not the bottleneck when using these small displays.
> >
> > Hrm, I now realised that I have another issue.
> > Not all LCDs that will be attached to the ST7571 controller will be
> > grayscale.
> > The display I've attached to the ST7571 is a monochrome LCD for example.
> >
>=20
> Oh, that's very interesting. This means that vendors are using a more cap=
able IC
> (i.e: ST7571) for display controllers + LCD panels board designs, even wh=
ere they
> could had used a less capable one (i.e: ST7765). That is, using an IC tha=
t supports
> 2-bit grayscale when they could just used one that only supported monochr=
ome pixels.
>=20
> From a quick search, I found for example this one from SinoCrystal:
>=20
> https://displaysino.com/product_details/SC128128012-V01.html
>=20
> > Maybe the right way to do it is to only support XRGB8888 and specify=20
> > if the display is monochrome or grayscale in the device tree.
> >
> > Or do you have any good suggestions?
> >
>=20
> I don't know the proper way to handle this, but what I would do is to inc=
lude
> the actual boards as entries in the OF device ID table instead of just th=
e ICs.
>=20
> And then for each entry you can specify what formats are supported, e.g:
>=20
> static const uint32_t monochrome_formats[] =3D {
> 	DRM_FORMAT_XRGB8888,
>         DRM_FORMAT_R1
> };
>=20
> static const uint32_t grayscale_formats[] =3D {
> 	DRM_FORMAT_XRGB8888,
>         DRM_FORMAT_R1
>         DRM_FORMAT_R2
> };
>=20
> static const struct of_device_id st7571_of_match[] =3D {
> 	/* monochrome displays */
> 	{
> 		.compatible =3D "sinocrystal,sc128128012-v01",
> 		.data =3D monochrome_formats,
> 	},
> ...
>         /* grayscale displays */
> 	{
> 		.compatible =3D "foo,bar",
> 		.data =3D grayscale_formats,
> 	},
> };

A comment for v4:

I think I will go for a property in the device tree. I've implemented
board entries as above, but I'm not satisfied for two reasons:

1. All other properties like display size and resolution are already
   specified in the device tree. If I add entries for specific boards,
   these properties will be somehow redundant and not as generic.

2. I could not find a ST7571 with a grayscale display as a off-the-shelf
   product.
>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat

Best regards,
Marcus Folkesson

--0+MSCrb+186FMFuN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmf4sK0ACgkQiIBOb1ld
UjLmqA/7BCl7lJDEoPPt2ZzQgG3ygaeetBdM4UsZDpleS6b7DyZuy84RJQrCFfZU
FNyRITissD9f11CEVEFcVu7RpwvckDXy5Wc0yJYBj7fLe6e/YCHHP4+9/5oMyqSj
S5ULhE+/Ai5mt10PMoJ2i8Ht9lO76i+Y+tjsa76fQ3if6hPuBCgR/MFPRv3iZZ2i
HsfPWeQpQ2ehV9Zip9zcSWGN1cKSFLqZrQvbmHXwNt4G2rkpENpGXFQO6GFm0BMT
dosgtS44DV6bmnWugz0Rkjvv5EGIX5ESN/HVlRWjWUTv3yyYWN0YXXxGZ/huqdwz
ly3k1LR/l5EZF0Be46kmHNURIez2AKYKDH86391ew77Q/06HqG0Unkm5vL37V/6Q
/e6OYLvM01TnYW7351Z7KhCi/9MlM4NXMrS9Q9meNI3rDWcaZ/Q9KXdVU10ugOcF
+XfwzYDilqU9KlZIfLoEylrt5Yspam/VYT6G4YfVQBREhF7SvFlhvvDaq6ptRvrm
5oI8a0g7SZPIyxIhwC3tDdJjo53HivUfnD91w6n5NBk0jbr5EnWoXcS+2E7rrvcM
dwwzjqHoFT075Z94v018+dW6mT412twlxz0gJ6Vuyrngul8s6UWMX3XYqEF4rZOa
hbUJKUG9XNybnsUSaqL9p/np+PFNZ+o/urAyky/ALRyIa+WeuGU=
=pS5B
-----END PGP SIGNATURE-----

--0+MSCrb+186FMFuN--
