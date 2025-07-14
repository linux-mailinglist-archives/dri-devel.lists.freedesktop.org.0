Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01411B03CC4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 13:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1205910E45F;
	Mon, 14 Jul 2025 11:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i8xy+/fb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D7710E45F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:01:57 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-55622414cf4so3406206e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 04:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752490915; x=1753095715; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TEdmQ3sQzz4m1gTGlsELMQXiHmt7M9QslQ5TdDOoX78=;
 b=i8xy+/fbz1+ihf7wnVL25/amrFp5IQJf7H65lNqcFNulRb11HLwEPDoBKFrM7wW+ao
 E8wxpLOv5uMOFQlm7NPpBSaKio7w+akL09F/a72gWdJ9ic3szgobg5xedymum04PjQjS
 blcys6lKA8B+9VTO2aGuEj6w9Cgc0E5zVDNODyI5CW7g7/eIPZLkdqJbN79cDbS/tiO5
 2IQZ+/pLc9Jyxzucgn/CCyX0jEA+9hV1iiKpx37bN7LhxNkkPqlPSUo3aan3LC29i9DP
 7VZ5UvtQE0gu3pC+GvfH94cvQzi8fiwgUubXPj//m/QRx0drgUuyfihduTKo7bXA6W2z
 UP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752490915; x=1753095715;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEdmQ3sQzz4m1gTGlsELMQXiHmt7M9QslQ5TdDOoX78=;
 b=Rs5k4DDnGaylLL0xNQptGOwtmugIyjpDQrvBTyULOvwf6kOt3C+OxwAGMR5VkTQg28
 HRH5+JLF+dCLfklLkGYxKO8/9lLOPPIpQJoHlZcV7tO0FwmvmGS7dx4DgG/Owag+m33Y
 BiaYvCc9MWvit8/7mK3rdfvNl6I+C1aeJxJdv54xhJTS11+uUmPAykZf5zTZkeidTgfn
 wX8V2WxPXNu2aJTPQA52TM4kDXWbZS79pSSygBwFNn+3YClH3NWNDKiBzrG3fNBxhvEk
 lFJw9Pbj8lnvAiPR1oquQuhCYkmSjwFvisoodB5q7ktjxSa9krSTfPC4/Q/rPjNB84PH
 XUxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIKrDrajOROZqmCbxpHh2NgYXO5WAbjq2z/lOeg8nVSYnl4xcDb0tkTa/A5mACOTOy3XoxlbUqupw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrMDJPYPxPGcMWTRAbuukOfArOo3+n5fajY4b3vzriFMQLcGBR
 Tp57bHmzJbqu9/pNOPIEqVIGv1uCRbMeVj2GgR4y7s3IubuDrH2vnMy8
X-Gm-Gg: ASbGncvW2pJOkOA+Ag3/fyKGj9lW3gqhkPriiLsVYlF0wAIt7EtQoUwb2WIQsuiAuPj
 sM1rXdhVbWv4e+sujd6OXuof7fSoq50yzklP2orVB9Le9u1E6I8+1osyHnyajNPCRcEQXeqdS7f
 dHzowa3dCE8QbISwCRCwhm7BP1wyDpmtSktvq8+Cs549w+wSp/HUSzqyF93CvHnQEbQj4A73XF9
 PBYf5cippejg6HR8FUxiASjBKie02y4coYOOvssLz6Z5lGHAeg/pz0eI89d43KEv5lbURhwCKPe
 Ozww0gx6OJGc6/In8m1EEJel50WYxj0p2IOHKnNIL796fCeQuUoWXQ7HNjpY63UBwyOJosb2PQT
 Wp4VfxPO9C1RO6+m5k+Z4ZpqiAf4c/NFbM6kRzncbmReg5DPT3FJxXSuuKcc=
X-Google-Smtp-Source: AGHT+IHjS9hZdr8cyMVFntbRjNYb2Oumvk3FGh6U8F2VpP3TacRH3nymulm+jQlQNNGanb7gPRa5pA==
X-Received: by 2002:a2e:a006:0:b0:32b:3cf5:7358 with SMTP id
 38308e7fff4ca-33053473347mr25758041fa.28.1752490914855; 
 Mon, 14 Jul 2025 04:01:54 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32fa29141d1sm15310181fa.12.2025.07.14.04.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 04:01:54 -0700 (PDT)
Date: Mon, 14 Jul 2025 13:01:51 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: display: sitronix,st7571: add optional
 inverted property
Message-ID: <aHTjn3NqhuwwjQVh@gmail.com>
References: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
 <20250714-st7571-format-v1-2-a27e5112baff@gmail.com>
 <87o6tnkpun.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Hnxh8WnDa6UQU/LQ"
Content-Disposition: inline
In-Reply-To: <87o6tnkpun.fsf@minerva.mail-host-address-is-not-set>
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


--Hnxh8WnDa6UQU/LQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 12:51:12PM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> > Depending on which display that is connected to the controller, an "1"
> > means either a black or a white pixel.
> >
> > The supported formats (R1/R2/XRGB8888) expects the pixels
> > to map against (4bit):
> > 00 =3D> Black
> > 01 =3D> Dark Gray
> > 10 =3D> Light Gray
> > 11 =3D> White
> >
> > If this is not what the display map against, the controller has support
> > to invert these values.
> >
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
>=20
> Could you please rebase on top of my series that adds the ST7567? Because
> I see that this controller also have a "Inverse Display" command, so this
> property will also apply.

Sure, I will rebase on top of your series and include support for the
inverse display command for the ST7567 controller as well.

>=20
> Or do you prefer for this to land before and then I could post a v3 on to=
p?
>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat

Best regards,
Marcus Folkesson

--Hnxh8WnDa6UQU/LQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmh045oACgkQiIBOb1ld
UjIBbxAAgTFlu5KKAUWMswSzSlDNwsZ15dXj/w13i2R5WRaObTVQscLH3IpabSWN
vW2sSUlaiOkzSzIm/RVXzTEiU2Dz3tXan4vPGABBolmg+0kVKpXLr0NzDMQyy6P5
vu7yrtg3Fa6fBZeBMQodEoVNCXezJ7UV3AtOP8j6vSN98CnNl8NG1N5OpT+hfsmN
hxLL5qCAj0xw1t8v/75bVEUQReaPqNlBWckBo2tlJmw2J7WLAZ2K3jKzxjPfxxEL
Kq1cQ2RuSNyLF9BxjJgtZrY4+3M6to+Nzlre1kUPNPmGvu7IbyRQa9EZiAXO/mvV
RNLC+y4G5qworVGO9hJUrKoRM9gA9YXCK7+d1wyDxQK8stP1K9NwBA3lF6o71wyS
sejM5v9qN7Yc6xGSpcEtYOIGfT+znmbBmi5Gq/xVZJRtT4gg9ylxEtVJODInk60K
M05Rj9S4RzhM4CGF2B7Eie5wyZ/QVbAn1PZYzH8zOy+dWHlSY+75iuLjtk8/RDW+
XyrVBO8HOHUW4r601mDO9LiH/D6u2XDRIVKlMSy9zZctOah0WB8Sf3kKUPQuuF7l
ixyk170qygFa4kt+Rqc7pm2SH6gfGkIeE6ZmNGTI5yS7/LkZ62bNsoNvT+9BWkIa
bcERs0rvmAUaz5vz/x3uehgV6OGB5M/GklMHlPP37HeElKi3CZw=
=DDNb
-----END PGP SIGNATURE-----

--Hnxh8WnDa6UQU/LQ--
