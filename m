Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A312F9866D6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 21:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A5910E2F6;
	Wed, 25 Sep 2024 19:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QihYFgvS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A2A10E2F6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 19:26:46 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42cb5b3c57eso1177695e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 12:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727292404; x=1727897204; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wavNrkur48GeN+h9wVwnw640hllK1gsxWZL2GdQHIt4=;
 b=QihYFgvSKMpbZ1ph/BIpa09f6Con2vTBJKY63I4437QFNkP4I/ULvx+bBWDrvlzgJ4
 6XfHfI7PGeybWI5T7eapmiA7Hoy4V9t1xTbyn+AJAjTt62YfVnL88z546qhyn3tsTGcn
 FjwLk54HC54u1UhMzQO5mqpbNX+zWzcMQi+WiBdEHWyprPsTpWqGfYm6MGoOmaowYF0P
 tVEYRs3OWGNK9EUVkij7QU4StRWYQe46eMq2XiRAz8BjTBzI+bpaYeHd3QFJ6RyOvZ7l
 QEmcunSemVuGMyiIKI9lor9IKMEnSfItYX8kPxSyLlJQx+ORZKMPLq+0KlSsX3D0qOj8
 q/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727292404; x=1727897204;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wavNrkur48GeN+h9wVwnw640hllK1gsxWZL2GdQHIt4=;
 b=Pnlp5Erb8ekt7oG3CPMfA5yvxxyx0mil/gGWr3BhRtUd9EC1t7terrYjHLw8oRHyZf
 X61GYNlPnelLy3Olj4pufbTBLkBi5HkTEb2kSyT1tC4i6jF7kP5d6xzlnLuRe6sQQivz
 ZZkX0EJavc4X1kT098W2rDVhO47GZYh/2psao3AlrdyOOzg/59Ds3bRVyzec3MaJrOZd
 R85TVZKzqEQKWkKcTk6z5ENkzwLP7NO4BMZYn2esQ0NWE7iskoV8KSu1InIJtvlwhLx0
 9Q9YtCL8QVYMrJOtfXFX/5TsRpZt8nrqwXWYO9Wqf4kKy9iNIXH+aqCWODCejGWw+fwc
 AubQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdQ+gTMiI2GtcfvUddKllFIywuMHuSo6nAiC+7Uw/NQLnu5V7uzFfd02CjbxlBDpga4MC5aOFxTQg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJfs67UNIVKcDkfQqH0/W1wwnl/J6O237FpxgFl8lTAwmkSp5B
 MU2QlJmZeNqqVhOFXz/UsGhUwVVAMrQ4wdq5QD44KtDMb3PvsdFU
X-Google-Smtp-Source: AGHT+IH2GQjEErpqGA3vuE2aHV1lN+9RT8c67GKpvFPKReLg90CONS+giBuHrULBq7AYuJyGChnS2w==
X-Received: by 2002:a05:6000:c4b:b0:374:c454:dbb3 with SMTP id
 ffacd0b85a97d-37cc24c5bfdmr2097949f8f.55.1727292404298; 
 Wed, 25 Sep 2024 12:26:44 -0700 (PDT)
Received: from orome (p200300e41f147300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2a8ac3sm4734392f8f.8.2024.09.25.12.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 12:26:43 -0700 (PDT)
Date: Wed, 25 Sep 2024 21:26:42 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Fix boot regression for Tegra
Message-ID: <xbcu6weg4qxz6qpkz5dqooigchzvtwvwjz7cbgrpcjii2x4imp@ubkdea27kgi6>
References: <20240925160504.60221-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wsmwafovgoia3637"
Content-Disposition: inline
In-Reply-To: <20240925160504.60221-1-jonathanh@nvidia.com>
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


--wsmwafovgoia3637
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 05:05:04PM GMT, Jon Hunter wrote:
> Commit 4c27ac45e622 ("gpu: host1x: Request syncpoint IRQs only during
> probe") caused a boot regression for the Tegra186 device. Following this
> update the function host1x_intr_init() now calls
> host1x_hw_intr_disable_all_syncpt_intrs() during probe. However,
> host1x_intr_init() is called before runtime power-management is enabled
> for Host1x and the function host1x_hw_intr_disable_all_syncpt_intrs() is
> accessing hardware registers. So if the Host1x hardware is not enabled
> prior to probing then the device will now hang on attempting to access
> the registers. So far this is only observed on Tegra186, but potentially
> could be seen on other devices.
>=20
> Fix this by moving the call to the function host1x_intr_init() in probe
> to after enabling the runtime power-management in the probe and update
> the failure path in probe as necessary.
>=20
> Fixes: 4c27ac45e622 ("gpu: host1x: Request syncpoint IRQs only during pro=
be")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)

Applied, thanks.

Thierry

--wsmwafovgoia3637
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmb0Y/IACgkQ3SOs138+
s6Fwcw/+I3XPvWL9o2XLHonsUzrHkOYbO1kJQi4IvNOA+8GF6wN3rg/PBlfasKpp
5TATwOAJnl6GbEKHOZSnhN8GeGiL6Xor7mm6+mi5A6WKbd6MPh+tY6bheAFP+Qtl
lGq6Rq14yjJCoCoP3CHbEtVFfbzSEBXYysNF2zuis8KNk7GfXx+6lN66aGaX/CES
+be13pAA3/Mid2KwD2kCoVaObdHuNMroffab8vJy1PkHYVPsKoT9jUj0GIcCCpcA
BXOsC/J42F8Ga22tCXNuQkP5JGw0QexX8Tad0qnQfw1JK1FvrWYusPDH2BQRdjUp
3/ru37KM1S/CyrZIHIum4ksEPM7dIPu5Wx4opl9tyBozc9L8Xfo5SLhFS9iIFKFy
0Y1Xgc+wpA+CDvTbNp0Kr6xvjFyjgoBLA1YPLWwEuk7hnUzPsZ9WAiyA1dPH0prd
Ca5y/kRLCheAA0IOa+iU1bywHXSjKy+g9lvi5Hg4u5RpKwesnCZsO0fUaxxlwgG/
aQYDoh/kqHH44UD8F+Jc0MYB+83SW3iFZyypKF4Nk0JkH7zHkPRpBeBklZRAobBE
hex37SmYHE2p4az0bT0F+DsH3wncPzNvLwvPXZrmih/elCaQY9HStbJlrvBRnxU3
f1dObDr+IgEYttzWRZVyA8oNBfZZuMdAxribfAomCcAMbk6O+Bk=
=h3i4
-----END PGP SIGNATURE-----

--wsmwafovgoia3637--
