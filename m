Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BAEA8263B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 15:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F404210E8AD;
	Wed,  9 Apr 2025 13:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ajF4DT0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438CD10E8AD
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 13:25:41 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-548409cd2a8so8134137e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744205139; x=1744809939; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CCPfq870lo6I3VwBZegYGwOMPFDFieit2DF9RetxgIQ=;
 b=ajF4DT0aCdwb6lufOddoxE7MyzIgvKU5wFzExb/M8V/boKkfBUHFBTXYc+J+vsrDeG
 Rsd+K2Op30RG1cFhaqfHs+cNUZewsi23UEIWUUneL+eiYGYbE1TjdeRrFNgKkex9RNOh
 mGUA36wnECDnjIweaSsRHMKfPIZ1paWJV5uSE5mLae8Do4Rx9QTCutbpnvqwypVpPGI1
 mMaLLp5ZlaI4z/Ob7mE5J9Xtkz9v1ubgrMkqcSM4PY66R4JUKjTrVTKp/twKJyp3i3hz
 uzpSGvDn853dvkBZrsgw0AvdBEz+FmfhL3fXyOyKfopMifiroKyrdw8gJsMG0b7EWsRL
 qvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744205139; x=1744809939;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCPfq870lo6I3VwBZegYGwOMPFDFieit2DF9RetxgIQ=;
 b=XnEfdbJdyr7py1+k7zpXiGk9SzIfzE991Ga+mehSFFhPgobhc9FnhHveMPBKZMcVLZ
 U9DNZpBAPJnvrys2s7fRiy6uKI4Sq0P3kwTxPdqt8zqUVAHJygaVmjMFtG62lsG7gkIA
 XvF8buibQ+dwzocCpdW3SwhIQfDnXRwTKGSFqDxDko5sym8lMxg6VA144tNkabguP6T7
 XbTSMZua/T6gEGTBJy5WJFoy6y8wKhH15y7kQoMQTgJj6j/oUR2Saza3cQETR3pqMoL9
 8sLkgVvLU5p7/hAz8omeXOVuQ30cyEv4OeQooJ52bHLGaCcTMILh8t4ROS3npL2gFowG
 waLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZf9bzdoVZG9yu+bREnL3eLtvwlCzLm3ZgKTuX1MlzkS1l2u297GNi6CsQ6UjTTJcGK6EtG9n4VNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUaoxrLb/8HWLsGo6AC1V+ed58cuEqVu8o5CN2tAehyAxLJnLK
 E0M7v/5bzC8btFYPjHwp+6w++G+PvgvtCGoxukRLz/y0CexXuqsN
X-Gm-Gg: ASbGncuYUy039nckigd3rbSPobBSfrSdjrV3FkXQutNvywZpY6aaet9hfSHY3m2pXXy
 tjLhj5aPIYk2mozNHI4gJk2vZQqRl7QPYTe++WNL1NQgZrduXFEYZNtEeZN00K6h5jIxQ/fRENP
 x7AWVg/TjitIHXK7I0rweyUWoqB+TZhxYWjkSS4hrTy9pb71b4aIiKCN+UHWyL5/CgPuDreCefp
 SCg6VgVvtf3qlgod1AKTQ0bNXMU3wu9pNg1zw2wpVljLxHV1mLAiU6UTHlNEftnUZmOW9bzoe8V
 zIEHp3sIVda936zo7BaM4QQpXKPYF8bGP2eQRGdI7najGZ+NgxxUYoxdxWIeZ81+wcVLZLUcJmT
 0SHg0I5X6lNwQ
X-Google-Smtp-Source: AGHT+IGolglO8KHWHfYhPUPwqYH4QluVvVji4FU7LlGDKueiKzOe0iuK04Akv8MJU97gcutn8Zezgw==
X-Received: by 2002:a05:6512:1095:b0:549:8537:79d6 with SMTP id
 2adb3069b0e04-54c44576943mr746530e87.48.1744205139035; 
 Wed, 09 Apr 2025 06:25:39 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c455e9272sm136782e87.92.2025.04.09.06.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 06:25:38 -0700 (PDT)
Date: Wed, 9 Apr 2025 15:25:36 +0200
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
Message-ID: <Z_Z1UOan6Qu5d3VM@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
 <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2ofPkAe93cfrZ/9C"
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


--2ofPkAe93cfrZ/9C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,

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
>=20
> and then in your probe callback, you can get the correct format list for
> the device matched. Something like the following for example:
>=20
> static int st7571_probe(struct i2c_client *client) {
>        const uint32_t *formats =3D device_get_match_data(client->dev);
>        ...
>=20
>        ret =3D drm_universal_plane_init(..., formats, ...);
>        ...
> };
>=20
> Likely you will need to define more stuff to be specific for each entry, =
maybe
> you will need different primary plane update handlers too. Similar to how=
 I had =20
> to do it the ssd130x driver to support all the Solomon OLED controller fa=
milies:
>=20
> https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/solomon/ssd=
130x.c#L1439

Thanks, that sounds like a good idea.

I've now experimenting with XRGB8888, and, well, it works. I guess.
The thresholds levels in the all conversion steps for  XRGB8888 -> 8 bit gr=
ayscale -> monochrome
makes my penguin look a bit boring.

But I guess that is expected.

Please compare
https://www.marcusfolkesson.se/xrgb8888.png
and
https://www.marcusfolkesson.se/c1.png

> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>=20

Best regards,
Marcus Folkesson

--2ofPkAe93cfrZ/9C
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmf2dUsACgkQiIBOb1ld
UjJ2FQ/9F0UFdn828HNufX71J48BfU7Ae27co8Y+CWw0T9eVXhT5v+xn9bTNdQ9d
0559ifYcUFI95AZKaDSQCH2JXngYVD7ym/lcIT63LNZEGPiJyqT201mQEjyxHVWI
88FXsZX4pAMHf7egL1YD9VkksybmvSRzlOY+a6y6GxvFfkPbCAJWroRdhk97J/d/
/rYgr1XVBCA3q1CfeX4MXONhdNkQTyeoPnv+/N5zmLY8pYRjLYF97/AsN6jHh+7Y
oE9Cai1jbz1ThDq3l8ngXNMtMag/xjXbJIBWB7krmVzgFyiWJUlVgmEN2xxk3jrI
muNlGIbcQEPKASwh4F7SC5FYwymG63e78qXsrJ5JUmzbYx8M0xMztYABSC0OGzLe
Vzx6whPv0VGPgKULgrI8LrZqiW4Zl3B76CZfff3oBdvq+zHPXRrvsEVXnXRfw2t8
x1raGSc0ln14kHr1LzYoMTyJ4ao3RWPG/ZuSbBQbxrJuFqpDPKUJ4Zt+M5GKDfQQ
9HqylDeIDXS92l9tV7Ei8xdBthzhjYggDyoWKJ35Luq5YG/PICC3/PqJRTa3W+OG
uubjtV9HGLIxDf/cj7tdVXSGAAhDy8uzTJTzsfdLS8EWwUw6ZXgrQ3JU2FWx+o+z
UQGfvTeQwqeOemY52P/B+xj9/hvZLgxDqZzgudAiK95h5a4fmHM=
=xpde
-----END PGP SIGNATURE-----

--2ofPkAe93cfrZ/9C--
