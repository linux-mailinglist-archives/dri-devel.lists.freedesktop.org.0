Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F44A8B41A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 11:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B156E0CA;
	Tue, 13 Aug 2019 09:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4CE6E0CA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:30:20 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n9so107209091wru.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 02:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rPxNUvPkCxY9I7urtl3GOvag2ns9EI9qUXHNKYyuKhk=;
 b=O7SNLV3uh6OToxC0y7z7JQih5HB9WoQrP8qBzLu1anittVrDa99piOjKyLy103yXcu
 low8an9kWQtY06Evw5sJu3g7Na7UTP5sbOAHj8bbR7Jfau93DO3mjojDCCm+SOvry05i
 9LqvSk7s3H+Mq4MnRvj0kBFT5Ey0+62LjSTqCsN1WftX5mPyfhTT+6EpWje5limG1FV1
 xf/PI/8J9npYSJ437dn5DsXHTOjIu3m+o336gN90vIdO8ggWk6ePfVF01mfb3ceWNU0x
 yhrLRhN0y+SxEXHh6CxlgMFGzgsZQ5CGUzGbe/pQNe1pEDW6V3DegwM884uCAfgeEX4O
 8i3g==
X-Gm-Message-State: APjAAAXddP3kcblV3zRLAAuQJsnFZcTQbM8H/QUz3R2JQPR58ZQh5z7z
 kosue6f5Oq+JYYbDgLXklnY=
X-Google-Smtp-Source: APXvYqxCN5USDlHFWTM6WRL0ofYfxaJxGEGE4m10tQJJOXltWZN3CK9N79y6CdpBOykjoyhrN/xiLw==
X-Received: by 2002:a05:6000:1186:: with SMTP id
 g6mr47130551wrx.17.1565688619391; 
 Tue, 13 Aug 2019 02:30:19 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id p13sm41515183wrw.90.2019.08.13.02.30.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 02:30:18 -0700 (PDT)
Date: Tue, 13 Aug 2019 11:30:17 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 2/4] drm/tegra: drop use of drmP.h
Message-ID: <20190813093017.GA1137@ulmo>
References: <20190804094132.29463-1-sam@ravnborg.org>
 <20190804094132.29463-3-sam@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20190804094132.29463-3-sam@ravnborg.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rPxNUvPkCxY9I7urtl3GOvag2ns9EI9qUXHNKYyuKhk=;
 b=EOaTK+3ynHmtnx/tk9zNy7spRID0q130X7LqjrejYm4u257/71prwKR/5gnDHwEobM
 B3czEsCzuHU1uGCs6I6zE0DKL2bzP46WQjSX5K5rcysgR+Dzj/Xdgy9Tfns940riSVhE
 uRy/kU3M6Nov+E2IqlJCQDeqGVhaX/5AjOtISDyRmaNYsfceEYJ5MekZh1trNqy9zcBY
 3Ni6zbTbNbIzzINqH0AO2tEtpNaJ7T63Ij4T5EDyitYxFNNEK/Lik84GEw1c7e2Ph451
 6Nl5D12JlS+SM+j/U1ahe5WHWIhs3Mh05CO95q0Ex8KuAYIGe/obGr0IXEiijwFjYlY2
 3uPg==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, malidp@foss.arm.com,
 linux-tegra@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1700089999=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1700089999==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 04, 2019 at 11:41:30AM +0200, Sam Ravnborg wrote:
> Drop use of the deprecated drmP.h header file.
>=20
> For all touched files divide include files into blocks,
> and sort them within the blocks.
> Fix fallout.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/dc.c    | 13 +++++++++----
>  drivers/gpu/drm/tegra/dpaux.c |  5 +++--
>  drivers/gpu/drm/tegra/drm.c   |  8 ++++++++
>  drivers/gpu/drm/tegra/drm.h   |  3 +--
>  drivers/gpu/drm/tegra/dsi.c   |  8 +++++---
>  drivers/gpu/drm/tegra/fb.c    |  6 ++++--
>  drivers/gpu/drm/tegra/gem.c   |  3 +++
>  drivers/gpu/drm/tegra/gem.h   |  1 -
>  drivers/gpu/drm/tegra/gr2d.c  |  1 +
>  drivers/gpu/drm/tegra/hdmi.c  |  5 +++++
>  drivers/gpu/drm/tegra/hub.c   |  3 ++-
>  drivers/gpu/drm/tegra/hub.h   |  1 -
>  drivers/gpu/drm/tegra/plane.c |  1 +
>  drivers/gpu/drm/tegra/sor.c   |  3 +++
>  drivers/gpu/drm/tegra/vic.c   |  1 +
>  15 files changed, 46 insertions(+), 16 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1SgyYACgkQ3SOs138+
s6ET1Q/9FATaE8e/ljpukBw2vJqgwCk0lAruZ55ljBkh0uH9YwvQUq4kMo2agPHD
Q+lcdErT2IqaqqRbotzUryatC26aT7l1QmxaEtgU/uWHLIC8k3elpOMz9CNIHSDh
1NVAiBKMxQtG5nqWWmebr8v/e3Ae9vvxXxbtuMW6YlbupGgp9NS35a5jEzdJhhYW
zqkvUcFZ0xigSmUYBgGIzukI/+q375A8x6JGBiV+/ymu6up9yRO/3OoRrHDCAalt
GCeXyR5drV9Co25GGwGcfIJOF7aIirBhBhVJS25ArXh5uEz8+vhZCcu7UrNC3o40
/QVuTJpyAn5kdW1d8n0MKE/1+dnqapM+W8LfRQAyg0ySftsLDaH8TLvHsRD5gstO
N1KwpqVaKp4a1LrFwVuA2aTG31nSf68rfF9fRUmTNgu2mV24o5Su7yuYYG+vt1pa
LkVTtV8gWHxePSrcFGEaT0fGMmM40fq3qMNi3o8anq20Kw5d9N6PJfx07bMZdlDr
c4IPLKomLE4yJVAkF46+p3hWeGPyhGvUVkt3SGWOO4LTIuC7n4on82NZ+UJv5Eao
bffeD8rCscHn9hVbXm1p4jE9CvIZHWqkfkBxpL7GUP4M2Wg+qp372A8LVraUjsXg
AucjRSo6WFs2DQZf9+jk8xsvJ1QMUNT3cKg+jPfLPZ3wwr0Bb4o=
=DQVr
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--

--===============1700089999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1700089999==--
