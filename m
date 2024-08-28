Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F3B962B65
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C9810E576;
	Wed, 28 Aug 2024 15:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ezNDQkVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F31E10E576
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:10:59 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-428fb103724so4461765e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724857857; x=1725462657; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UQ/4ajvZzaDOMDTKRC7CbsivFxEl/NxmaV5flB3XzkI=;
 b=ezNDQkVu9QfnzwuUDpdVssIXatBwOoHYrZrWF7uYA5P1fo/k2XUmy8KKmPL0DCgd6g
 ueVcHTZQObzf+UewwCHxcnqpcj2dxtfqhgR3M6Z9WEToUC2yi+KRwpI/UgwzpKWMTi5j
 x+RAwyQ8U3n/Y1/38eN3yYmg43Mroq6DDeCjNo9EcpkF6JvDlRpWhmRvM/bWF4M5crKm
 iA0GbKXVYMc4r7lrdByHGNkmxBVCXs7uvo1J2OBJ7EwW0NVLLF0Rgq4RBq7SYq8tuaDT
 WLaKM5Xhggl7RQHSlnvZ5/fOsJ5Y0IIVvIfPTJ8wlapNasdekH0yIZR0M7q12LhwnDmW
 ubDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724857857; x=1725462657;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UQ/4ajvZzaDOMDTKRC7CbsivFxEl/NxmaV5flB3XzkI=;
 b=COfV/TZEAUQvjU6QZT5ycE2PLJJ5flamsCS8m9QJtaR5lC42PaUy5naK1NLyGdqGUA
 7mRJ3qO6fPGbylYZUzmK/I2o4GnI6K8Qyd7Y2kkCDaKEfX0LR6AwIbow2dJpUmSJbvy9
 P8mKyinFv8GgdyHtsfqsekjMr7hG2RAsoXhvI5c8v/gWJZKDwHv6vtZNqlbV+GSZOZpz
 gT1GdbTfTk1Vax4gA4Chm2hcX36/vxZK/dH+Me1wkLNWTk3nV/Zb+sQfnG4ZhrfcmNpe
 Ynyk+++IHes2IpEBChERcoRrLWnv1fBL2LUHyEp+IQQ+VpFTEm3m4YErT1Nc0KfFxA4f
 bBQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2dUygcctDSNEsdvxucpqoPDRJeHDkJeQZxpYRxlpkDdmsqJQ5eqqQPvmxMpwBPvDos/qA/DeBh/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWMfLOg1ZAZcc+g6t5brBFIgbCdvVrd0N2NxkaWaIklUjGRNyU
 752Dm8bdM6yXrE7+/KwE7uclfGxH5QVLZGXIGUEuxg3BIXH8GqIg
X-Google-Smtp-Source: AGHT+IERe5eLdpwONj/vwyA+QSmJxF++N7sdszwss1qO4IhBV+DuW4oYJY8dtC/iq1N1kJGp7tf/lQ==
X-Received: by 2002:a05:600c:4fc8:b0:427:abfd:4432 with SMTP id
 5b1f17b1804b1-42ba5708dd6mr15087395e9.12.1724857856974; 
 Wed, 28 Aug 2024 08:10:56 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749b36a732sm36538f8f.113.2024.08.28.08.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 08:10:56 -0700 (PDT)
Date: Wed, 28 Aug 2024 17:10:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: mperttunen@nvidia.com, airlied@gmail.com, daniel@ffwll.ch, 
 jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: hub: Use fn parameter directly to fix
 Coccinelle warning
Message-ID: <ddh6votnreuhbylvk5wsiclep5e6qkcrdf66h3fvhsgsampwqk@w4a3p6n325jn>
References: <20240710210034.796032-2-thorsten.blum@toblux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pgr6eujdr52sieij"
Content-Disposition: inline
In-Reply-To: <20240710210034.796032-2-thorsten.blum@toblux.com>
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


--pgr6eujdr52sieij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 11:00:35PM GMT, Thorsten Blum wrote:
> The function parameter out can be used directly instead of assigning it
> to a temporary u64 variable first.
>=20
> Remove the local variable tmp2 and use the parameter out directly as the
> divisor in do_div() to remove the following Coccinelle/coccicheck
> warning reported by do_div.cocci:
>=20
>   WARNING: do_div() does a 64-by-32 division, please consider using div64=
_u64 instead
>=20
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
>  drivers/gpu/drm/tegra/hub.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied, thanks.

Thierry

--pgr6eujdr52sieij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbPPf8ACgkQ3SOs138+
s6HgvA//eOkCBC1C25PldBUYerxsYMFxP6AxLd7fnvfyMD8k5v8A3NQfIC+v8sTu
k6YZU6S9UCnbQyAEpsyKu+t1VtRx2O+5oTW8NbF+l6z528RUIPRqVgNTMlRgg0PW
nroHFg1myWGSdOkjOy5R8HaZGbXPx0Nbzlztg/l2gwRqqwvOfvg505o+M7X8X4SV
x2+Ahv5HuoqtRMG1euwXIjX1LMclQP2j7QH5as7GMqA+Bb0Ax8ji2ydR+ShBwc5D
IUdA2SjHulB8HIxWf6itG7Ex+fO0iemuhIzyCcTKeWz3+38GrhuSM/e1BkHWc3gM
T1lC10aagiNrGS7vsZ0JRfWclfuHVqbXsqJLMkaCtazW3/coWX4TQnpNF9AtFMgI
BtGVRsBSt04kDxJpQ0CZ0wQ7wSlGBpK2ew03GHqFXnOTHraA9uxApjh+wYbdsf1z
9Dvudn5tiaL3nmhzzPjEWdjs+QT6omlYOJfKZyfCmIGhAFoEgHb/LiJL+5M0mMOL
z37sDn3zGYUEFNEjXLs7BCpcuar6YumRcg4S/ffYJ3tfmRAwVn0ajNOw1wMtDXMG
aMeOj93BVKflap7gM0YdsN0LG7bRE97YvuGW3aN04JjhZw0onogIZ62Ic+xyCIeF
Rs3gAVVUnSVzWWHb5VfRJiju05fOMzQmEXzFAVWLUiDEqfjSzKo=
=0GlK
-----END PGP SIGNATURE-----

--pgr6eujdr52sieij--
