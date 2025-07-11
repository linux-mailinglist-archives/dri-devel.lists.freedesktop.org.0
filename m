Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8A5B025B5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 22:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081C710E3C8;
	Fri, 11 Jul 2025 20:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WyEGrK8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8393810E3C8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 20:23:56 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-553d52cb80dso2402442e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 13:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752265434; x=1752870234; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ViwvjvyYagYyuQkx2zZM7j6gLRmdMIVphmkzamnsrY0=;
 b=WyEGrK8KCKno89cUqrm4hzoWSaCPdu6b+2H+J2HFCPzoPe1KtF5/2td2q2IQkUIN2u
 T2SZUcZwhjFnKCqf+u2dziWlrbljpy9/8ENXuNJK3TfYTYmFTOqJRLhmGlKv/djZ9feU
 cqOH0OZIL2wSTe+iU1jT2nFN11RwAGTFPsKXmWXSpfo+ztsZlLCF1ZDP4JI/GmoCkZ2O
 vQMsSRzLi0SywiZSISIRrngFYl0aKvpB6uQuuQ4wyEyU9inNP6kkd637Ik8w8dmgPx+4
 h4slicL9PyhYOweO21AnQujq69AJUoI3p5PcAhrglAo090U/NFRxx1tjvkkVQJJ4aaCv
 jN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752265434; x=1752870234;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ViwvjvyYagYyuQkx2zZM7j6gLRmdMIVphmkzamnsrY0=;
 b=t0eqVjzh7dpYRBchSqr9p0iRBHNmTCqkcZRmBlxjG8T9ZIRxcXK0j+tRzd05Eg/qDZ
 YUaUxybyvgM67NPoDQEWCGoboYWHmucYR95c3f55kh1vivNanAUhzFleJeBqmHY+867R
 HXJH97CYAtmMHd7u0dT3EoPcGv3F2Wj2hYpIMbID5RFlzlpfM8WYyNVmQHz8qBc5/TjB
 zRjRvHGHJX06TPog4mtn9qaRR42WVbJH2KQIN2M63QXsb2SZ14HxGMYbAxEbP1Kz0H3i
 W/12ZJByh6qzLiorRj/hQL5CTwoNSuiUTSjG/+cmgNDMb83G2oOQn6dIDSBjE7R43dKm
 aQIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5ssie+xy6RPAQUNkDFRdyRxfbRyLenx6gOaoguZkIs8rPnkFbj6Sd20QGPUZ0WkPwc9vvg6Rlw+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9KRzROdSban7OYau3j0pSfH98ko8TwYDxjBW7qydSVk+iFF9c
 YH5llP8drnQnfPCXXpuMFNlRQVuiqNbNIPMZYugleSF2qC+dYDqLC/hm
X-Gm-Gg: ASbGncs8dOtkysVR8dRIXyTszdItdZOZB1gM43JMGkyrlKTEjIGnNjqCwX5ppfi6J8X
 QCUiKzjkro+uWCqtepEBnR4RWrvZtFgGlBPfOWJRs32N1kGDP1hjaSDJ72/5SyTt2LWNJUfuDxn
 Lg2m9VvV+gPP4MpRyRPSKdlBSVrFAzPu/cxOENLs7ltJTbpknHG/WvTTuvne7ykHDN1nFPNU7XS
 uOT7cIjvTedYormRQ9tzGfivT/QlINHEOf878f/zn1mUCIUhfTgOOgnO6/Aa1myCsZ/p84Ibq0l
 w32QKgzr5mMNaMLzoOK+Q0+kOE+djdU9lQ5f3xWe+5vmj/IyxQcwmHM5m6nGEFrgQWVnrj/gYcW
 GEsfR4VZM3jqhow2OTdBUT92v0gfkBg4fBEOCi+1X56/gynKFTuZJlsG3HcE=
X-Google-Smtp-Source: AGHT+IGaB1OCM3rtIXV7ppHvS88LK5V03isAcfNOp8Cj5FBP+Hv6v3Iuwn993DccTWudqcs3MbERdg==
X-Received: by 2002:a05:6512:a82:b0:554:f82f:180e with SMTP id
 2adb3069b0e04-55900715435mr2999523e87.16.1752265434144; 
 Fri, 11 Jul 2025 13:23:54 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c7e8d21sm1067771e87.55.2025.07.11.13.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 13:23:53 -0700 (PDT)
Date: Fri, 11 Jul 2025 22:23:51 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, ipedrosa@redhat.com,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/3] drm/sitronix/st7571-i2c: Add support for the ST7567
 Controller
Message-ID: <aHFy125scr-g6zn6@gmail.com>
References: <20250710102453.101078-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mnqlV2pEEsmlw367"
Content-Disposition: inline
In-Reply-To: <20250710102453.101078-1-javierm@redhat.com>
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


--mnqlV2pEEsmlw367
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,


On Thu, Jul 10, 2025 at 12:24:32PM +0200, Javier Martinez Canillas wrote:
> This patch-series adds support for the Sitronix ST7567 Controller, which =
is is a
> monochrome Dot Matrix LCD Controller that has SPI, I2C and parallel inter=
faces.
>=20
> The st7571-i2c driver only has support for I2C so displays using other tr=
ansport
> interfaces are currently not supported.
>=20
> The DRM_FORMAT_R1 pixel format and data commands are the same than what i=
s used
> by the ST7571 controller, so only is needed a different callback that imp=
lements
> the expected initialization sequence for the ST7567 chip.
>=20
> Patch #1 adds a Device Tree binding schema for the ST7567 Controller.
>=20
> Patch #2 makes the "reset-gpios" property in the driver to be optional si=
nce that
> isn't needed for the ST7567.
>=20
> Patch #3 finally extends the st7571-i2c driver to also support the ST7567=
 device.
>=20
>=20
> Javier Martinez Canillas (3):
>   dt-bindings: display: Add Sitronix ST7567 LCD Controller
>   drm/sitronix/st7571-i2c: Make the reset GPIO to be optional
>   drm/sitronix/st7571-i2c: Add support for the ST7567 Controller

For all patches in this series:

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

--mnqlV2pEEsmlw367
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmhxctMACgkQiIBOb1ld
UjJKiw/7BCY1zpUT6onONzoUceczUg9xRDcyC/vTr0sOmrf3NPi1qRtgkNo7USBU
3qdniqhj4crFiM6cd69rdGgks4zSIpujzdefzbtHfmdpECmYe/HVmR0X3CZ99wwY
o3L3ty50gBNP5C5Hy71vdXWhhmcEC/wpwfXUnVBb0Au9/M88mb6naABn0+EPV2SJ
67cThMer+LyXYK3dEFpv4D2TRWO/qRW3eaW/PPYMi/k3tPMroLjb6LmeQq5TTizy
UarbkU54Ev5a04+IJfBZV9EflZlKDVNWtyfFCS5HOC1if7lhXYwW3sa58CFWc51x
QFukJ9hJ2K6kXBLXsrfVtz9cuNGoLp0B9mjrsyBVfV007zG1XsgylRqYBf3JkLdT
YcSa4JKDqgI+Lgw0P5rPwm7rWtTYnoRh0umBnCo4mLxlY0vJA4ARh50gdLA1J+qt
R/X6riGUGUQSQRZHDqaQuE90JQ5aMRkWPuTOOnoR+58DuXvLmgf3dS907FRqBGoT
JmfFFxgzcZxoLlQk0sfGZyi7oQdqN74Zt1X5cmYYd5QmAQFuMY8wTIynmyG2jnXN
ctvX9Va5rRuJ2VbnyJ1ttK+ymMAS3L/9MBkaTgG20yEpiyevUS01yTvK8hGWa45k
hMKaKBOjGk7uv10rDzRGZpxt/xEq+F4jxerLj/YCMyI72wQoivA=
=/GlZ
-----END PGP SIGNATURE-----

--mnqlV2pEEsmlw367--
