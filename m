Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFA85A7C1
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 01:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C2E6E98D;
	Fri, 28 Jun 2019 23:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A816E98D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 23:49:49 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d18so7861783wrs.5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 16:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q7IEImnfjv+A3lRFXyTXResy2KVoDPFK5pOWIOXw67k=;
 b=JhvCNZ3pYhUeHRO0jO6xVJ2NFXWJuOj4Pu0HlveQ7nVij7OPNULENd+HfWRoCQ+kX0
 c3QBdfzDVt+tYZyusiiB6oHc70XQp7xqaPTZ+w40K7LPBOtCTNHWDOY/L/cd3ziyb4V9
 g3938RUez0T8NfEcjOlxNvZqWGo+2EBY+5dBLmxskiRM2KP9oyZvoNeNvIXS+l3kKRaH
 ifnAYOTW8vkS7tiGjB7LYMjGVkPaSeyGWKKdJU0jsoZdaRlNyksCHNPHawlrwkOeX9Xa
 rX3oPcsPYumpADO7fdxbEaRGcBFpiU8j1bIF3N6pxpTTMj7tbFeOg04TMsaC2wwuaxnL
 l/ig==
X-Gm-Message-State: APjAAAUXH/VDCtjyc26IV+sFZyUJTaEDGaPw5UqIZvjchl7QH/w00yY1
 S8muHM7kudUL/1/JjlpzWLs=
X-Google-Smtp-Source: APXvYqxqv88pnNrGXl9e9tW3mOegaQe/CRnhjJlMga0gyKaLHiB23YZKxAYNn9ymY4Gf8UHD1YMp7A==
X-Received: by 2002:adf:fecd:: with SMTP id q13mr9877353wrs.97.1561765788237; 
 Fri, 28 Jun 2019 16:49:48 -0700 (PDT)
Received: from localhost
 (p200300E41F2AB200021F3CFFFE37B91B.dip0.t-ipconnect.de.
 [2003:e4:1f2a:b200:21f:3cff:fe37:b91b])
 by smtp.gmail.com with ESMTPSA id s188sm3658105wmf.40.2019.06.28.16.49.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 16:49:47 -0700 (PDT)
Date: Sat, 29 Jun 2019 01:49:46 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 2/7] drm/panel: simple: Add ability to override
 typical timing
Message-ID: <20190628234946.GB1189@mithrandir>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-3-dianders@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190401171724.215780-3-dianders@chromium.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q7IEImnfjv+A3lRFXyTXResy2KVoDPFK5pOWIOXw67k=;
 b=vG3d8acLaTa36M8Qk+1Ig6NnkHOM4RXcyJFhhNYvfAeittbGLBIk42dMPmgjNUsdn5
 FuYVQa5cR7tHr2HSfddbCSHiQE09EEBRNwSaFvQfSxIOOjgnN2uv5TAD5a7xmftR1T5T
 pwq8FCkeB+h/d/mMeVatdy/dOi9jzYpHc8DizVguo7L2LBu1Frni/N7D6Ji4+QESaydA
 6CkAd7WRlSIFr1DbePAevzpDomH5OxStI3Qj/Gndq12vMLl42ZMaSDAnZbNnui7niT0N
 L8iltdGDiezmYdLexEiKRS5zIuJc3XejBOaAIAXAiVoL2uKNPXt8Eu2bcyM+3tG1iuQq
 qUqA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Jeffy Chen <jeffy.chen@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
 Enric =?utf-8?B?QmFsbGV0YsOy?= <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>,
 mka@chromium.org
Content-Type: multipart/mixed; boundary="===============1960720911=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1960720911==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 10:17:19AM -0700, Douglas Anderson wrote:
> From: Sean Paul <seanpaul@chromium.org>
>=20
> This patch adds the ability to override the typical display timing for a
> given panel. This is useful for devices which have timing constraints
> that do not apply across the entire display driver (eg: to avoid
> crosstalk between panel and digitizer on certain laptops). The rules are
> as follows:
>=20
> - panel must not specify fixed mode (since the override mode will
>   either be the same as the fixed mode, or we'll be unable to
>   check the bounds of the overried)
> - panel must specify at least one display_timing range which will be
>   used to ensure the override mode fits within its bounds
>=20
> Changes in v2:
>  - Parse the full display-timings node (using the native-mode) (Rob)
> Changes in v3:
>  - No longer parse display-timings subnode, use panel-timing (Rob)
> Changes in v4:
>  - Don't add mode from timing if override was specified (Thierry)
>  - Add warning if timing and fixed mode was specified (Thierry)
>  - Don't add fixed mode if timing was specified (Thierry)
>  - Refactor/rename a bit to avoid extra indentation from "if" tests
>  - i should be unsigned (Thierry)
>  - Add annoying WARN_ONs for some cases (Thierry)
>  - Simplify 'No display_timing found' handling (Thierry)
>  - Rename to panel_simple_parse_override_mode() (Thierry)
> Changes in v5:
>  - Added Heiko's Tested-by
>=20
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: St=C3=A9phane Marchesin <marcheu@chromium.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
>=20
>  drivers/gpu/drm/panel/panel-simple.c | 109 +++++++++++++++++++++++++--
>  1 file changed, 104 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Wp5oACgkQ3SOs138+
s6HkOA//aJRj++gDyHqyv+35Dnz1qJOb04MLQT25wHlW53LhiXm6APFDfKgu6GY1
jEhdqsfBT7y0c+yM8SQRwJx44H4QN8YbkqpH0jFsvLli7S8oalKWtu6ti1nRv1XB
oW2oTzn340rTKD1zeqQL1A26GF7G3COyKIOBhW+yHNAGA4gqi3XMi3RwKP0tLYWa
1zpI7ZMQw8kwprzPZZbsEnfRYj1R5YUfBO1252HaixMStJbJGj5vfhKFE2H7wTJv
zCz0JlxX6kepkO7aHmrwOWHYgnvrcCaphJy8YBWMhsBRN7UdOlLjjcBtvqGidKbc
5bBZucu8NOKSBVKP9V7HlWgQjoCI4uPXSJ+Z9G+NemzcqFtLOYAgGezKiTVjnw1T
AvEbEQ2ed9MPm2Yt93ozVgR0fvTqeJu0t5ybGaVhUXqevtek7HTCDbCiY+oFLBGs
ubaXXPCJaYls415YuHWxeIOBuyuyAkSihPy9JB2SZ5jZbXgRiXFrppGI+/zcTklX
InfVw9QwQMMHay+FhcnET0HkWiD47kvEnVBmaeHoMEnYKrE3p1IVZMXlzQsLqefL
ADaFGSl0UIS5kyS6yB/b82C2XkyuyFqG40ohDu3qpa2ShzY7iovd1rJBRFmI22/3
05j4j/3dS0eGTqoVVM1zpmdAaIvHaw7GbVjIEsd0BtG+51TIhW4=
=P4R1
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--

--===============1960720911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1960720911==--
