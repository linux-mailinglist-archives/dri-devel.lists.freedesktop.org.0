Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CB3476C43
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 09:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC3510E4D8;
	Thu, 16 Dec 2021 08:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4734C10E4C9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 08:55:45 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t26so6496608wrb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 00:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SOuxRFXySPzshUyGC5iL0C2CvH+JBhvny1eTkHaCuAk=;
 b=C3+lWk3b0y78VVa5eWSCceWoMVKh8OoLiXVo7+b6aykRMYMZS84tnO1iY3ilDuL+9S
 kNFtEfRVtO639culhM0FpOo4Y5s9vMHKmSsjGZuezi40pU5i8mpnOQ3RS+oeaRMH3hl9
 pPN24fNaNFy0a9PsTywZjzg/vJ29iwzznOpSkfNmKYcxwRecN9Ii8967W2bG+MsJYOzd
 zipVfIzveylYNsmoBr6s3JwYXRZnmQ2MZdQL4HlJjlJcy9Yugxhwqe9D+SjsSbm+OJ0B
 hqYQy30NATx1d4buHLlzpvm/LnePURXPW/Ml0FrbTWnDlmXYjVLLhwVt0JIVC5anZtg1
 swTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SOuxRFXySPzshUyGC5iL0C2CvH+JBhvny1eTkHaCuAk=;
 b=6L/2k+232Qx4WUK1vHHQ9GPDs9Uq8iNsQrL9+cJS6idFENoJsHJaKjmGuUgL0rlJa9
 drUm1/wqs1ryGtAPOLMyjlZUgRwXhlWAvMZ5gd33+ymyTGrZ2NZAhc4Vs2jHB6dN/7if
 52JVuvHSKxbKs95SnGiDjTGS9U1miPPmIpmSZPyKx8vhDIVk5Re8DHJJmXQNwi5dnPlK
 UDJQHp4dv+U/FONxHSB2SdhrU9fF+3LUfYViR7w3YNLF+xtFYcHU6/K5nvSJu/o1XmpT
 kIN/YkolcbwsV2YDvJtWXAVVxWyoAg1HLbnFsx3sTOMh5RfMhczN8/+z/6npiZSjYn62
 99Rw==
X-Gm-Message-State: AOAM5321xw3S+lBmX84AQfP59OJjbtcNt0IiFFzI8Flu+Heo7JHA7B8t
 v62Hr01h4okUTIcNYkwrgII=
X-Google-Smtp-Source: ABdhPJwbtAMNBx3u2dBIsPqwFJsMFEOrlFqylkByzKob5f0kf3vZdqodg/kqdagKi6U3S/JWjAH3Vg==
X-Received: by 2002:adf:a18b:: with SMTP id u11mr7678332wru.397.1639644943821; 
 Thu, 16 Dec 2021 00:55:43 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id w15sm4090586wrk.77.2021.12.16.00.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 00:55:42 -0800 (PST)
Date: Thu, 16 Dec 2021 09:55:39 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 03/11] drm/tegra: vic: Fix DMA API misuse
Message-ID: <Ybr/C+GNFPDPgLnF@orome>
References: <cover.1639157090.git.robin.murphy@arm.com>
 <6b86f6e530b504a5eee864af10e2ae1570d7b645.1639157090.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xaI96K7vWbm32g6g"
Content-Disposition: inline
In-Reply-To: <6b86f6e530b504a5eee864af10e2ae1570d7b645.1639157090.git.robin.murphy@arm.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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
Cc: joro@8bytes.org, john.garry@huawei.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, suravee.suthikulpanit@amd.com,
 will@kernel.org, baolu.lu@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xaI96K7vWbm32g6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 05:54:44PM +0000, Robin Murphy wrote:
> Upon failure, dma_alloc_coherent() returns NULL. If that does happen,
> passing some uninitialised stack contents to dma_mapping_error() - which
> belongs to a different API in the first place - has precious little
> chance of detecting it.
>=20
> Also include the correct header, because the fragile transitive
> inclusion currently providing it is going to break soon.
>=20
> Fixes: 20e7dce255e9 ("drm/tegra: Remove memory allocation from Falcon lib=
rary")
> CC: Thierry Reding <thierry.reding@gmail.com>
> CC: Mikko Perttunen <mperttunen@nvidia.com>
> CC: dri-devel@lists.freedesktop.org
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>=20
> ---
>=20
> It also doesn't appear to handle failure of the tegra_drm_alloc() path
> either, but that's a loose thread I have no desire to pull on... ;)
>=20
> v2: Resend as part of the series, originally posted separately here:
>=20
> https://lore.kernel.org/dri-devel/2703882439344010e33bf21ecd63cf9e5e6dc00=
d.1637781007.git.robin.murphy@arm.com/
>=20
>  drivers/gpu/drm/tegra/vic.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied, thanks. I've also fixed up the missing failure handling for
tegra_drm_alloc(), which was actually quite trivial to do.

Thierry

--xaI96K7vWbm32g6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG6/wsACgkQ3SOs138+
s6G5Ng//YzfjTiVGwWVICqHpvgQHCcZ8oVaca2ULy6V9X+H0OOwBsrnOOsQRNQPN
bhUymR2MvtF7CGkWXSLcLBInR683ccLJefYom3K7kd/Lf1bptAbYsIIR6mEU/iHF
dgk52WgEANXqXpjIkny9hIQdmgjL4ilBS9vwZnBniFIfNTAER2fEy3CsfvoQnkC6
0ZoB9zaj+a+PBUy2oGB0K51wzoYWglCG5sbD94eeztUwdZtnWcFz8FpYWLVZQgvb
OH7mgLECdjDiu6ZJ+/h57xcO2gR0NhEPOlq5fhyWd6M2OMcqmwE4xEmH14zyq1RS
maeLK89xm8X7BCEneOai8B70OH2nzW7dHYMFT33WWJOVzvfX9jBzTn5aMxif8T1x
NYoJew1GJDCvc0hE1SQyWLqfomvVE9Ctod8pgR18us9XMn0jhQZ9+9frVE661g7C
0ATJ+ekU7msdPeQGG+gIgOoBI1nxVlhMyaeiEA5ZUI7jaa118EAS5o7RFHGW55yu
YTmw+ZiJ1Oqtm+sJIco6G4z30Su+rsAo99K0lALgJ0op2uBibF49yGyoDvfM/k62
7fgmTjnj2tA/V4isGVdH8/JjF8gvferm8YCBh2PZlArczHEUTOh1hIoNwxGOGIG7
y02bpMz2KLrRaOdf+ut96A/t1b+aUMiwgnH1cOyt1cy7SuBVvjU=
=+ED4
-----END PGP SIGNATURE-----

--xaI96K7vWbm32g6g--
