Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5100AA49F3D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A7310ED06;
	Fri, 28 Feb 2025 16:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bbngr86Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67CE10ED06
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 16:46:42 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-390f5556579so302587f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740761201; x=1741366001; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bIuiU4XrhfkhWXOTfdn2ANWaE+TYEkq8GIKO0W429gE=;
 b=bbngr86YUV42EDOT2gMN8YapbyPelNncaP3nLmMDOlwrQi9tjX3froS3MNgWgZ9pPm
 BBD9hgzL64nsLkO1E4nEc/B/G0NjEMUu9mks4RJMhw5Jnvc/P0X+TXvmX7CSDrA2dIPi
 0mgxGCogmuBjHq+9dBabU0TGhGHSxsok4aX9GptjK+uWi2g2EIxAv9P5grrfSChcd52c
 M6W18hy1GGRergMAr3F2JebQ5ergJ+/qZB9TqGR6qxXLBh+8n5DgLzlxb8aP+BhGHOg/
 2ib/5JUhSZAaKoV2Kaf9M03xVQk+XUWxhDBFnPMLwrWut8w8WLrPoX2w1sTPjPlimHHg
 VEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740761201; x=1741366001;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bIuiU4XrhfkhWXOTfdn2ANWaE+TYEkq8GIKO0W429gE=;
 b=VN1V0nBCCDhiSOMfNatYwouLGZG8khEOxw3xmuzxp4Jg+jbJtQYyWhD9F/mongU5Bd
 pByGl5gc9lwxcH+HHGuZM5jAbdlMoKmYhDHSuc5YGFScjAl+5Lbu4NMxv4GNlEXdPaVy
 Zw7Q8w1diWLTXRMZhTkAjMAmV8ahaBgjPRFtOWVa5dYRtZmL92vxl1TUhuatx9yD8gHp
 PWxG4VI1CiIugULjdL/uuVORJ2ff/rnV35vC32MEu98fXKyYTwwBv8pEAc7iemZMSbrC
 5bTPi8lnVvh/aIh/G6vQ7yfnHIx2APmb/FlTnqPN2vRkjLEIaegt48VZZAFhvKCguAh0
 paXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHaBCE1aZM/wp6hOa2IrAXDmtDoxEYSFc85ZAIAqTmgFmFqxX6Aff3xIqvThOCwEZh0VCxp4W8wRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywpvrmfg3eaBddocGdgc7tQmc7jV9n4Ff7lfj1wIyK8HtYrwRIt
 qY4r9MqjpJlQisDdgykJsbif8avtzmuhH34rHATesvYH2+EC9ltr
X-Gm-Gg: ASbGncsmPKuUAqAyDArSgWRe3pnp1t7OZRodwwyoz1xqsoqlCMTUH7jFzlffRRfulFt
 D6LkNgpu6zXThCxMxdeqwwowm8s4NcGDQZCJMiw0q5YU4ecl6/r7z4Ad2uHQ35zSVTSppL1oEEd
 4jTHNT+tb3H3E4eto3654ibglqWLqJTG7x+toTQgn7Hlpv1EmFup3izys2CGBhcvwqXmPB4IwKW
 kOCr9WdY12csQ0GlG96iQzcCGfRPCJHUYAOGss5R2RgpSpp+bnc1n0226B+7TOwBlABtK2SRJ1n
 +v8Y79/Nodfw0V+WmrSOmEWZUL2JVuzgCXX07FhK+cZ6nSuH+4kkHbIESbejHpdM2Var7OAJBUF
 gdUwlNdIIBqfY
X-Google-Smtp-Source: AGHT+IER1+rSFFUu3fp8H0Ep8h3KR4BZHOPdnn2CHy633ABSD7noywrDfjqO6v6gIHCs9lWQwwrr3Q==
X-Received: by 2002:a05:6000:42c9:b0:38f:43c8:f765 with SMTP id
 ffacd0b85a97d-390ec7d2e69mr2382920f8f.26.1740761201038; 
 Fri, 28 Feb 2025 08:46:41 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e485d785sm5717708f8f.83.2025.02.28.08.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 08:46:39 -0800 (PST)
Date: Fri, 28 Feb 2025 17:46:37 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: linux@treblig.org
Cc: mperttunen@nvidia.com, linux-tegra@vger.kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Remove unused host1x_debug_dump_syncpts
Message-ID: <vukpbuvuyfljqtexnimsrfozt64pfrjc33a4ojb7lht7fke45a@g4afdjrz6u52>
References: <20241215214750.448209-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ff7apm55vn4rtl67"
Content-Disposition: inline
In-Reply-To: <20241215214750.448209-1-linux@treblig.org>
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


--ff7apm55vn4rtl67
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] gpu: host1x: Remove unused host1x_debug_dump_syncpts
MIME-Version: 1.0

On Sun, Dec 15, 2024 at 09:47:50PM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>=20
> host1x_debug_dump_syncpts() has been unused since
> commit f0fb260a0cdb ("gpu: host1x: Implement syncpoint wait using DMA
> fences")
>=20
> Remove it.
>=20
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/host1x/debug.c | 9 ---------
>  drivers/gpu/host1x/debug.h | 1 -
>  2 files changed, 10 deletions(-)

Applied to drm-misc-next, thanks.

Thierry

--ff7apm55vn4rtl67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfB6G0ACgkQ3SOs138+
s6EUBBAAgLDSAD8aYvQjGaTHJQTUm8gK7TeixY0nqbT9LFALAgJU1wA3DvmRvfIt
vzHyaekT29Okc3NKZSu7YOCkn/JjwDDJXEcOphZ4HZG4PLk+SPXYNdqOIFShLdNe
ikZLlAytLGgoxw7yBNzm/8p1xdLCSREKuXgkYY0q7FyCyRwA3r8iNJZoHTEB4TmY
nVrE51yJDvZZIOGGA/YUcAcnMEArYlmUm9uZnb2hK8UUOzCWYwllMHS7ZCb1IrQ+
k8Td/dD/IWowQVu0MEExSj/5hepdf0wn5FB5ooy+FXaJFvn6Nag4E1JtsDuxRZcL
UiVfP7+RYC2w4DuqRU7bv2K/+ac7twINlGEK/j4qTi3HJ2wFKvaCpCHCV2vGzfpj
BNDhrEby/eUuJurYZ9ySmE+yhJFcA6Yp0spzaNwa0bzRN4ivyQvaKh7mnQkpxbhg
WXvEPRnf/F/Y2u2aPstbCjAeQK/DVTNhmSl8j3KIn6LVWm1/dncZvNkUjL2orxdn
fg1f4sa7pbsV07DunFwCQNNLe6PXSeMyIA2mSbKoSYt2BqCw9sQDFMUbH90qCYiB
6qblTxCNFyUL4G5GM8pvaKJfTTr0Uik3+wXCFjYE2O4KYuUP3plBzgmpZqnSIdLb
ysAGN03PV5Dc2y91Fd1xNlYB0VqxK1KN4N5CMKK3oITMSdjR8lQ=
=cUVd
-----END PGP SIGNATURE-----

--ff7apm55vn4rtl67--
