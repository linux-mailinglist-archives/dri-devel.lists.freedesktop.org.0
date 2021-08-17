Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37083EEE52
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 16:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B756E1B5;
	Tue, 17 Aug 2021 14:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3B76E1B5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 14:17:20 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id z9so28794627wrh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0ddf0QlWXZvw9cFQ3kuZ4Xnh7Li763SQ7aJW6E6s09Q=;
 b=qGjWbKfWFGyNuXZf4+T+XXtC7Bl1zf8fearXJvXyqS4WIM70WzneZXFuDJJi7vzwYD
 pQT79odUC/9i09IIFIs6s8qqVe9KFZDTLPpvGpGW3Ux3TStEoaZ1UMvTZpTKP7rUyKpk
 1qyQtRW1pmXENIK6jK7dNmJsTsaQDCZH1DK9ZxZ+XTWWe9e2e3YDnPhVX6wWGT0oxzsN
 JY2GqJTc1aSLzxZYqLRZaVQT5zoJJuoupSc9C9/K7zJEM6mUg086c4eDl3xqjmJoI2KH
 aXq+55oyCUqwKDiOIiHDCznVvfiLJM1sTFce1DeE7jtkvrFe3Dca8+oQUOHpYPAME2OG
 sJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0ddf0QlWXZvw9cFQ3kuZ4Xnh7Li763SQ7aJW6E6s09Q=;
 b=mCze62lRgeHdmuxf4Q+zJawXMXYukFsDf1ijzRklwg3fmLTsEpWF8CcF0bF9kiLcZQ
 dQkL+gijtHOSdnOpuhZ5fG5VGkamKG3+5PJpZ2Khwwvf1Ep7z6Np2rumCnxREBNFzJPl
 2SM+ydwH6bz9oaVfOZuSFiSCYvGBpp4zr5xJOmTlE7Jpa0+AZw5R08RdoA1dbEm0UegX
 dorIvYAWu61/1rbO9jEdiQREgA0c1T9qokqEiqL+DNvjjL6S9SSyi2Hb1gT0bUhxb6rB
 Gaf0QaDcBdF6XrynyiRcBdAjjKDiemJXsVUP7sQG9hSFoz1VqoH9320T8CQQXAR9gipK
 FPXQ==
X-Gm-Message-State: AOAM533xgA/y9X51jEwieWL2IFcPkmXi3M5fvTSjzRcEeZOkBdnGIAbo
 gNKOiaQw1iXBshkfRUTrqRY=
X-Google-Smtp-Source: ABdhPJyWWQG4vy0Ql++S+F59TPBJsGORcv9SNkFKHVL57RrSskmZQyR/ERyxIt/fObQT9dZ2K/yLqQ==
X-Received: by 2002:a5d:4d4b:: with SMTP id a11mr4368536wru.411.1629209838712; 
 Tue, 17 Aug 2021 07:17:18 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id e11sm2550320wrm.80.2021.08.17.07.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 07:17:17 -0700 (PDT)
Date: Tue, 17 Aug 2021 16:17:16 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 0/3] Tegra DRM and Host1x driver fixes
Message-ID: <YRvE7Cq++eR5MhKw@orome.fritz.box>
References: <20210817020153.25378-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EjbfSmiC+1y9P3RS"
Content-Disposition: inline
In-Reply-To: <20210817020153.25378-1-digetx@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
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


--EjbfSmiC+1y9P3RS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 05:01:50AM +0300, Dmitry Osipenko wrote:
> Fix troubles introduced by recent commits.
>=20
> Dmitry Osipenko (3):
>   drm/tegra: dc: Remove unused variables
>   drm/tegra: uapi: Fix wrong mapping end address in case of disabled
>     IOMMU
>   gpu/host1x: fence: Make spinlock static
>=20
>  drivers/gpu/drm/tegra/dc.c   | 3 ---
>  drivers/gpu/drm/tegra/dc.h   | 6 ------
>  drivers/gpu/drm/tegra/uapi.c | 2 +-
>  drivers/gpu/host1x/fence.c   | 2 +-
>  4 files changed, 2 insertions(+), 11 deletions(-)

All three patches applied, thanks.

Thierry

--EjbfSmiC+1y9P3RS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEbxOwACgkQ3SOs138+
s6EUuxAAmusBpdRYua3uXBIL/iWDWhGlbMKonYw014ZlKOhMHY3PeGFgLm8Dp/gH
kjeDu6Hz1IuqERdwai9x3XZN/QV9tqKCoOk5bgCxJ7JZRe8+C390bpH7MQiZyhA7
k0Ol9UDy6HS1vwGtfB3FH+vNmVxKeBcWHLgAcoZUqjck0kJ9stq76pSXIoBKK4gR
hPOTbKmTVCKU5Mf83MsWPgXiB4Ex1MFgBi8VtpSN1eaB8lAZ6pNJUrI8nqimnpQY
Xkpt698z2EkCdqtF1mv3hp09rUCUpojHKZPVsPNY5wEdIWFFYl9VriBHbzgLlH9l
8eQJ72jMsQ5q2R+KYNkzXOONb7WC6wce8h8hZgsc06tgZcIH8Ni1TjGMIJhXDXIZ
lGiDMIK22H+ySkhipEeQEJ+cwze5XbZMNV+0vXQ7FT6Hq7eAExq/kusyrmAjtujD
aDODLXVvAZi4dGjhg5QHIK886YahpLmsRmpDBXfUc3XmRhvvja75OsNWEDs1Ze8x
WHeiBSw+G8Cku12RvyReCTYGX03aR+wlN80x0IkSNv24Lp/RvFOqyNaQp9WuuSDQ
9E1HoMGKijnYSUD7gXB968vlkX8LxacG/ZlhL2CRlB6OMr8Old0etCtSkcoBeyP4
kdsmLYQyGsJs1Q1yXoAKhHn1sebWpYRInrfBJ/ZlMEjsrjdzIdU=
=kpzq
-----END PGP SIGNATURE-----

--EjbfSmiC+1y9P3RS--
