Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E811944913
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44A010E8EB;
	Thu,  1 Aug 2024 10:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g6wyAhVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060EF10E8EB
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:09:16 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42812945633so45238485e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 03:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722506954; x=1723111754;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P6OMtUrQn4UZTjmQjF4bUCRTsCT8RkFp+l8NrubderE=;
 b=g6wyAhVvcuTM5ylqO2Yy3gsarOG+gmtG3Hcv9RXNgDhdRyRIwS7TtN909ncZt8F+t8
 8ru/Snc8jcxem2q3EECx8fyL/AhGTFkUz2pIpT0XJNEbho6nZnGQ2fnZLLS2zTjQZvOi
 hKleWrq+Au9JJcJ3E/PUKZ/vP0jphnlqpo1HrgcMh36d0/Fvsi+TPLtWkl/8UOPqfu1T
 hFxwXzcjT/PozIFRzA45p51/Tm4NgfKeHQUrU1pE6EIV9duHSOc38uMlmtoZULkusYfh
 OqJQ5Fj/BIsBy/rc4J/cZyNgaBoiJS7n/ARJRozqGTZcb7J/6Jh2/3krtydCl+OFBQNq
 T0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722506954; x=1723111754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P6OMtUrQn4UZTjmQjF4bUCRTsCT8RkFp+l8NrubderE=;
 b=a4T2s/B2m8BT95sp3V9/NIZ+hncExrgeBeMZbuk6aA3x/c+Bsy7M8GkQmprzkkMOFs
 8ayPDl/K1xQB+FxgDD8UUqLOzGpC2li3DK2Qab5wELJLJjPSf43AX/LAQ0w1kIBk2xfq
 q1zzbq7vJxkfvfLultyexO6dEsG5GUo74po8UwozBxx1bcMLQZdK6ULzkpciVtg1a32o
 l0VcYH6+uiyFzV+t9f8XX5tg7TgmWHwUQbp9Y11PngvsdJ9deRoflfO116BxP1wI+aWm
 F10y36D1OcndZEh/O/QXxOCm7TF4TLxsKMJF49AGzVUAYXuVv9b1PP3eOsclGAs/Rq+O
 g+5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7nJtqJcNKjFJU2CuZUoQSO7raBwF0Sgs4JZC+cwbO4COMEsoXZRWlZSovvv6I/RgLffmFBUFA6Xrxds7ef7oXuo9t5j/NwGQ+Dm8UgR48
X-Gm-Message-State: AOJu0YxGlSy6CQvg0a2F9haPjG3q867GQbZryEx/vzki+Rfq4wIXrp7O
 0S7SG0uGaOMrx0uRkIMTBPR8hQotWMQXCIlhLTpSWRl4f1Uv9fN1JbztIAJhc9I=
X-Google-Smtp-Source: AGHT+IFD9Huqf9ehqE/yx/c33T4hC67DXyZNzDd7aRkxvgUynfl/kCK9JGFNCBCC68t+y1XFHOnwRg==
X-Received: by 2002:a05:600c:354e:b0:426:5b3a:96c with SMTP id
 5b1f17b1804b1-428b4ad2353mr15186275e9.28.1722506954102; 
 Thu, 01 Aug 2024 03:09:14 -0700 (PDT)
Received: from localhost ([193.196.194.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b867146fdsm6868598f8f.101.2024.08.01.03.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 03:09:13 -0700 (PDT)
Date: Thu, 1 Aug 2024 12:09:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Kepplinger-Novakovic Martin <Martin.Kepplinger-Novakovic@ginzinger.com>
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>, 
 "lee@kernel.org" <lee@kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] backlight: pwm_bl: print errno for probe errors
Message-ID: <3ghsuulqhfqvktfqbo7hfewpgu2nbyxahjxmoqfkvpceepmqih@axneh72aegog>
References: <20240801091255.1410027-1-martin.kepplinger-novakovic@ginzinger.com>
 <fjke5js43aqxdxmoau2l275a26o52sq7hyjgzwxnnsrptqlcvs@mohkvblfqkhg>
 <00f4f77151de3c3a4964fe697a7d1841c670284b.camel@ginzinger.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7rid6e4qsgbmshkc"
Content-Disposition: inline
In-Reply-To: <00f4f77151de3c3a4964fe697a7d1841c670284b.camel@ginzinger.com>
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


--7rid6e4qsgbmshkc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Martin,

On Thu, Aug 01, 2024 at 09:52:01AM +0000, Kepplinger-Novakovic Martin wrote:
> Am Donnerstag, dem 01.08.2024 um 11:26 +0200 schrieb Uwe Kleine-K=C3=B6ni=
g:
> > On Thu, Aug 01, 2024 at 11:12:55AM +0200, Martin Kepplinger-Novakovi=C4=
=87
> > wrote:
> > > diff --git a/drivers/video/backlight/pwm_bl.c
> > > b/drivers/video/backlight/pwm_bl.c
> > > index f1005bd0c41e3..cc7e7af71891f 100644
> > > --- a/drivers/video/backlight/pwm_bl.c
> > > +++ b/drivers/video/backlight/pwm_bl.c
> > > @@ -502,7 +502,8 @@ static int pwm_backlight_probe(struct
> > > platform_device *pdev)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 GPIOD_ASIS);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(pb->enable=
_gpio)) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D dev_err_probe(&pdev->dev, PTR_ERR(pb-
> > > >enable_gpio),
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "failed to =
acquire enable
> > > GPIO\n");
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "failed to =
acquire enable GPIO:
> > > %ld\n",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(pb-=
>enable_gpio));
> >=20
> > AFAIK dev_err_probe already emits the error code passed as 2nd
> > parameter. So I wonder about this patch's benefit.
> >=20
>=20
> It does. Other messages only take the deferred_probe_reason without the
> error code. It's actually fine if users properly enable debugging after
> seeing an error and then this change is not needed :)

I'm unsure what you intend to say here. Do you agree that this patch
doesn't need to be applied as it doesn't add any information to the
emitted messages? Or do you think there is a value because "users don't
need to enable debugging" then. In the latter case I don't see where
users would see "failed to acquire enable GPIO" before, but not the
value of the error code.

Best regards
Uwe

--7rid6e4qsgbmshkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmarXsUACgkQj4D7WH0S
/k6l9Af/QvYMJbj5q+H1Wto4fcvjCBdCY5CVt+pMDOClbcj6r7dlMGxySz03mxdf
z8RSJeTXzShCNn8MTn07U90Xeip39HaubUQsNgxcRwPhUlnyvEu3Vyv4+hsFayIF
4CZpVXbG/yX3/xP7oj5cMeb3J7neOMn2Dq2wFSxcnum8jcEM95jEzIhnnw6C2LvH
u529HfA6RNKM/M/aUm4RYHjx+VcpRIUuiYXqmWm7x1kAXwxfMe2PRpG/u2gUOopW
THrzdZDFP/MJ8bjSl0dylfe1AmFBJMedleJhSDNiXLT+PMIXZp+PQGCtdJBV99R+
YUoAqBv0roilGt6tJ/qRNdZx+f8c0Q==
=VOJH
-----END PGP SIGNATURE-----

--7rid6e4qsgbmshkc--
