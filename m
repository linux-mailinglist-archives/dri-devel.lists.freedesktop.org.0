Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 418981B3286
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 00:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD3E6E33A;
	Tue, 21 Apr 2020 22:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEB16E33A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 22:15:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u13so94599wrp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 15:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Vp+BHFQY1Hh6JqMh5HS6HD45Ub0B5oqXNKVfhqM48lQ=;
 b=WFiYhyJ7pjwr4PDhAdo6+XhGMKZ6vUDucMhofLSqrSLDoxNLBBsduHGlAS7dMb/4gS
 CQS+OLe1TxOdY5c3Yz773SSEGUiuHd1SLEuHNOCwE8D3Us/G6dzoisTmmKGeORMd1SPc
 Uh14qhPXIQshqET+q+oZ78Tev9pXJESyR+rIcXhYud4zi+ZfU5kf9e2CFDYuptN++q+3
 14ilU85tLhHIBkipGRecymrEprFU28vIfHioCxmeOFlVN4jq7VpcrhJ9UwEcfNnAwON5
 cKyMJmIlT8enqTEl8NDVVvCRlNZmZUj+4vdSwhbX3MfkIiGqrV7Eybwpkhqm7lDNNHmd
 dSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Vp+BHFQY1Hh6JqMh5HS6HD45Ub0B5oqXNKVfhqM48lQ=;
 b=IP/j7kMus/RaePWWxbban4Ziy+M91nywQBLRCwLSgo+0XMFo6NDrtrzuR5kZ89MSJv
 sMYpJraMaKYzfdew8/bVh9MWlgJ4ajeyvsO7ujKoEHplzQhV+dQogwVAKjnDkxlapNLW
 GJOmJpDPKaJM8ykmkzkHtEwXJMWLyDqpDZF1ooJvDlFTrj4/C0UZ0JbKpOC9YK7K5sIx
 GSf2QrCyer70hXTPtcc7ad8eLURUNSCifssG07WH2Rq/QM3YFnsH8iTLKx99PfIHCJcq
 faPtjOCq6Gk0KVZDA5YjqdZOjyR720+Jg7lYwFWOzEoQlob56luIAaXfhyM4+qB0gBQ4
 WJ3Q==
X-Gm-Message-State: AGi0PubtM3UJTMwBlUhuA6xx3B0jq5gJVdMNfMCVgrxXoK5tj7FfxwI3
 4/qX9bSMHh/WQ6DZv6ck1kE=
X-Google-Smtp-Source: APiQypLzPm6SFJdjwFdz1QWHt7ZDv7wGpy6PStIN//zTdZhF9krr3qs4I+84wpP8PBiC2ldjM8H3FQ==
X-Received: by 2002:adf:afc6:: with SMTP id y6mr25210051wrd.74.1587507306478; 
 Tue, 21 Apr 2020 15:15:06 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
 by smtp.gmail.com with ESMTPSA id h16sm6089076wrw.36.2020.04.21.15.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 15:15:05 -0700 (PDT)
Date: Wed, 22 Apr 2020 00:15:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/tegra: Clean up GPIO includes
Message-ID: <20200421221503.GA3445172@ulmo>
References: <20200415122427.111769-1-linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200415122427.111769-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.13.1 (2019-12-14)
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0210781838=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0210781838==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 02:24:27PM +0200, Linus Walleij wrote:
> The Tegra DRM drivers includes the legacy GPIO headers
> <linux/gpio.h> and <linux/of_gpio.h> but what it really
> uses is <linux/gpio/consumer.h> since only gpio_desc
> structs are ever referenced.
>=20
> Include the right header on the top level tegra/drm.h
> file and drop all the surplus includes.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 2 --
>  drivers/gpu/drm/tegra/drm.h   | 2 +-
>  drivers/gpu/drm/tegra/hdmi.c  | 1 -
>  drivers/gpu/drm/tegra/sor.c   | 1 -
>  4 files changed, 1 insertion(+), 5 deletions(-)

Applied, thanks.

Thierry

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6fcGQACgkQ3SOs138+
s6HLkhAAu4iEB6DmFiY8mIfbg5zlR+Zh1clXUkIPGTDhEGEQjmNF+j3mjMs+Ij6k
fJZapANopEijtJpoAYpr8mDOAQ1gcdWLAaeKfGKWLyW/r3aoDO1ZxsaLQBQIeimN
oIrDycRU0d2r5wbg1bHQfOq0wwaUS1YuHEMx4v2RGSvK/E5IrDB/O3Td7E1ols6l
K8zZFHvvAvTUaecYHwVKac2NqRJVDHjDqvu9YIvaXbJ2VbXDy5kY33MjX8nfBewK
HBsnQ/r8nUpAjSBx9SRZy3lxBiFXfYOiWQwNvvBF+GSO/za5RTWzSJP8WQKvn2eo
gw4Foxqp+5xBEqLmRzjPya1y3y2pno3WKTzLTYPcUjBwu8SnUJ1eAmxj8JQpdRPx
FYeEaka89Ip5fX+NJ89N/pTmRfSYH5zkKecTMbloafmXcbsLP79YsYSEFuiC8pUW
Tot7yRErxDXuCgfeqUwfx/pcuuYHTIolYBGzJkzX/Kylw6tD1kgg3ChngveZjPTz
GS49BeviCSSAELi/B51+vHaQa4um9SSClAlqW1Rp4VI+d16lQsIgO48cUhEUC6X2
2g/BBScvZ5Kl+QBJmDriMHaa6/n4UkU5J2wgnNgcwuPbLJLqsmrkPjHaUr4S+Om7
s0jglCkeo/U/naAYZrQu+M9pkhY+PE9BWWBhWgqiW3C6SNnZyKg=
=S/Uu
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--

--===============0210781838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0210781838==--
