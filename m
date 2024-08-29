Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC9C964D55
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 19:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47B810E752;
	Thu, 29 Aug 2024 17:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m58YeGFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F9110E752
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 17:57:53 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3718706cf8aso592063f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724954272; x=1725559072; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UZqjo9Grjt5HxfkIc3dPfj+rlfAsRG7Cshm4koXrbrE=;
 b=m58YeGFnQ5rQkovQHyDPFPLE+rKzZqNejpp1OKlSb7owT0bqYQRAcxb2Hm3/svpWi+
 zZcL8yAMj6B8uHsc2NqXhMU+B/fgAe+fX+BchX9Pr0D/yuidcYx4TDXxx6RbpyKFSziZ
 2uqvfm+vzQlZBJOhVO7b0HSlYBnujFDrtOdRy2iCVa1AP3SZjENg2z/a6d8+trEiFHOd
 2gP6jpYjSx9z1JaIlzd+QCrNAKPC4QPds9DwYuF8jVE2ZYaQdRNogdq/AELWIy70dTZR
 k/wnfolOMLxapEMHgJq1wr+uqRuiPsZ9TXUVevXpqAV9Eznav79quElaw+PPwGeKj3uw
 Abfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724954272; x=1725559072;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UZqjo9Grjt5HxfkIc3dPfj+rlfAsRG7Cshm4koXrbrE=;
 b=m63UibKUOxzMtDlW+5HKI1rupgKSpxzb7J/Q8xvDjIjYaJbVAiMm06tBlvuNEH535o
 qoo/y7BWyNRBqqmykvtPV9c3sSMCTPDhNfcbDp9uO9yVgqJVKTNSCBvt6j+DLv3M0olw
 TxOvjLn7VpDzVxwWbLaeRQvItEcNtNbbeychWr8xcA8h91qWJZC68sMSEftgy6uBJhqD
 3MRQ31aDyTiBOZt1eNjZQgHfUQUaVk3UQEObxCTVr4iZsgLMDW15YNZhnqybf6c8klZt
 g7gHy4zagZN7PqujDj4yMIj9pYKDQXKyN1aBzyxUH81ACacMwkxMg1Mgld/FbELYdDfT
 VI1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAoB1hN+2i+t8oUIHbbNR8CksQOCQI4WgaAD4Dz2ZMsIuSzl4R07AkUs3rUctjPPr0zyjQXTDAXWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMWR+9MOQLUaphl/nIFBDSJJsRH25zlKsSrf1PoLdxWqUY7DbM
 sZqqDDNHxGp75fcALzcYG4NpVHbgEFUMccoApw+0jsO2xmVFvWZY57oMpsIE
X-Google-Smtp-Source: AGHT+IFDGSpnXkfBIf1LAhNqocK4+bPZg5jEZNP6ySq2F1l6hKD5sWKpcSfJBHbN91DvLwTeModl9w==
X-Received: by 2002:a5d:51c9:0:b0:368:4218:a3d with SMTP id
 ffacd0b85a97d-3749b54fe8bmr2503784f8f.37.1724954271025; 
 Thu, 29 Aug 2024 10:57:51 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee71616sm1989214f8f.31.2024.08.29.10.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 10:57:50 -0700 (PDT)
Date: Thu, 29 Aug 2024 19:57:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5/5] gpu: host1x: fence: Disable timeout on pre-silicon
Message-ID: <kzdgbgiawrnvpvls7fjxf4lxlqfxwaowjknyxnaxtazjcdfdce@ouizsxalzei5>
References: <20240425050238.2943404-1-cyndis@kapsi.fi>
 <20240425050238.2943404-5-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="e6ueyqjiext4dlk4"
Content-Disposition: inline
In-Reply-To: <20240425050238.2943404-5-cyndis@kapsi.fi>
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


--e6ueyqjiext4dlk4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 08:02:37AM GMT, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> Timing can be wonky on pre-silicon platforms, so disable fence timeouts
> on pre-silicon platforms.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/fence.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

This fails to build if host1x is built as a module, so I've only applied
the first four patches for now. We'd first need a patch to export the
tegra_is_silicon() helper.

Thierry

--e6ueyqjiext4dlk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbQtpoACgkQ3SOs138+
s6GTRA/9EU1tq0Dz2tJVYimupCNVu9+cyoGXAF1+mmlT9euQ6XmxnAEXmuUabx66
h65j4qFWx42g58LAEb1bnoFQMmifwbP5WmjBho31bn5zAHndFKab/ZcE3Lw3Vtir
aZgWyBCOtRTASXa42vaAyv9fWiGFg6MzvqTBZuiedCEABWBTP6O2Tu3k/UVLzUk0
Rlcj2PV5DnHCjwVvyY8eBJjII5LGUNNYXHfjg+df13jk3rV9xDjmKQ6xEcGtck1v
V5I71aJxbDCAsVDrPc95ad+ag35bahioRx3aG6OSxDIX59eQyljJ/zwIF+ELpcjf
xTUFWTzkGlcZSxyDWsB2OayHUIHMRq5dztEFdspuZmnUi/xqo7TJCwQuRWNb+T9N
gJXhTOPzzczd058UnulE3um5PdN2J2FxaZibXyLo0k2MHH+zHUStYD1Y8TiA6JUF
rorDDauOHyiIBYCeXudmsWfuiDsoe7V03zh56joyXdMQTeIPW2QucANaEsfp/BRv
v3LvMH3x/hEOjtLDZL0x0g8ILuf4zsSkBhbtGMOk3pTnYsvLZfpByo1eQeGKYDix
TeERmdRgDtTuuoTFJVIO99BrtWlFnGzB86QZ/togkE8NR9BPulbQDF9qkjiVUqFm
Njp2uXM/hd7yel9V4dK1umBtTqRnGlD6Y+rVfcVBXSZ2kUJYrdg=
=o7O/
-----END PGP SIGNATURE-----

--e6ueyqjiext4dlk4--
