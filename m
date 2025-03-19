Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A99FA6977B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 19:10:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC19610E352;
	Wed, 19 Mar 2025 18:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dD7ukR8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D3610E352
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 18:10:07 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso50514515e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 11:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742407806; x=1743012606; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eJKGXNaEOrFu3JsjmJdQhGviNYlOYhskFV2OB3dd63g=;
 b=dD7ukR8CfnrgtDfZ/TcjDJSdrWi03OpW4s84OnNNGxUAxkm0UW1M8BHSDprolo7ajd
 FC4mVvVWyjnn/9AsumpGZb560E+uEAg7ghvkhlJAz5kwc9i2oS5O/CTBqN0hOwQLY3qi
 EEaNsWDqOOZ7SNsh7BDOELUXCxZyh+QP2iFMPtQCYYNxfyeoZMt1I929Cx0H4MLAD6cT
 2SXf08keyKIPrpWJxo2vlm75PaoR62O6WpmaqeXbCcnzSBsH2AsAYBEByVt2/sC++VdL
 2CIANRNtEfGGFJhEnfIAxeqKqF8H5+g6KfSWHwD+Jtr+sokAJVI/iiqBUtUFLPhNK8fb
 JnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742407806; x=1743012606;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJKGXNaEOrFu3JsjmJdQhGviNYlOYhskFV2OB3dd63g=;
 b=nI7KqNJ6zVH28mQthupr8X8lOn7FiSywyY1tEaYrcKNEuhV0V1QdisLqP9CXt1VKNC
 cmtJyYLAD78reWsQVrc2hPurgG9odGl00aNHi5+6BqD7skVa0GyDCcUbWwYJ9sHhtJQ1
 syRWGbnjXw4mWTyuAmTI0EaM15LmtuuHSf5cQTDH9uVpayaLjUXBSP6KzfEHxrv+HC07
 kTe0T+z6z4/108uJM5DafiL1hPPgNTomE2YifWvlz9KupAFdx7S62yw5lpfDmeZM+MGk
 i6uHgxqGAbZ+QKF6QuNuQt7+3hJze8+AB9DJISVbmYZNooMEyZPxPCunIi8TNUcCSOGt
 zQug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK6Uw9mUhF8ZuK8LVjyLpq9hc49aNzhKPCltJKkLUsz6Dw8ebdA1HThoIIFvnDUYlLwVwJPJ/kB54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlHRvDr/nACetv6sbNzqW2yOK/OoUFa6riDcePz2bxhm4wgK7N
 /8ZuW0rpsAuK1OKReWmjv3Acz6Tkw6ms7SEZq7D/euPRZXjbq141
X-Gm-Gg: ASbGncubZE/RsO3XckobJ0QnJunJfuxGL88p2KwQGBAqEX1bSNpJgFU7AXfDMeFWQSn
 yZBzINbJhpSx7XM9sDiC9zIloD6I/t/IiUSILaKRyXmErpYkAcIkrozGZ3yFbKduCmlEOAtbI3W
 r9lNHuZVArT2GiDaMQoDUnfb8WzC3gep5ekQL3cx1VZgSCTlo8qKBKJ5DleRX/541lExHxydhjW
 GMiPvFeJvuLSA5zEE0ISyE+h+EIlHu24a/MTmp0LyAFU5jBFQopOWuZxqHBu6JSFtfdoBBFg2K5
 cxX1EYh8YkqW/qg5d1s2Y624569Kt2ad9xze7hmJzkDoWTpAN1DVlPDoFjtMKa3AM2A8hVXVM2r
 47xNNku17A99Pr4yPiAwGftddMH/8nxKaVOPGpAKeBQ==
X-Google-Smtp-Source: AGHT+IGqcQWiFzsnHo4CbIBWjtZCrTWOdeRB60hVLIrA/XtjazKLtNUS4dMjFqQzIzL/9B206PI+DQ==
X-Received: by 2002:a05:6000:4014:b0:391:ccf:2d17 with SMTP id
 ffacd0b85a97d-39979554699mr431114f8f.0.1742407805428; 
 Wed, 19 Mar 2025 11:10:05 -0700 (PDT)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f33242sm25582455e9.5.2025.03.19.11.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 11:10:04 -0700 (PDT)
Date: Wed, 19 Mar 2025 19:10:02 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
 Simona Vetter <simona@ffwll.ch>, Lu Baolu <baolu.lu@linux.intel.com>, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Joerg Roedel <jroedel@suse.de>, 
 Jerry Snitselaar <jsnitsel@redhat.com>, patches@lists.linux.dev
Subject: Re: [PATCH rc] gpu: host1x: Do not assume that a NULL domain means
 no DMA IOMMU
Message-ID: <5epualwpswqk674jhoq7lo542g7fc33vemzs4v2usou7ibijrw@uroxzqtbayix>
References: <0-v1-10dcc8ce3869+3a7-host1x_identity_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eqydumr5po2uxfmv"
Content-Disposition: inline
In-Reply-To: <0-v1-10dcc8ce3869+3a7-host1x_identity_jgg@nvidia.com>
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


--eqydumr5po2uxfmv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH rc] gpu: host1x: Do not assume that a NULL domain means
 no DMA IOMMU
MIME-Version: 1.0

On Tue, Feb 04, 2025 at 03:18:19PM -0400, Jason Gunthorpe wrote:
> Previously with tegra-smmu, even with CONFIG_IOMMU_DMA, the default domain
> could have been left as NULL. The NULL domain is specially recognized by
> host1x_iommu_attach() as meaning it is not the DMA domain and
> should be replaced with the special shared domain.
>=20
> This happened prior to the below commit because tegra-smmu was using the
> NULL domain to mean IDENTITY.
>=20
> Now that the domain is properly labled the test in DRM doesn't see NULL.
> Check for IDENTITY as well to enable the special domains.
>=20
> This is the same issue and basic fix as seen in
> commit fae6e669cdc5 ("drm/tegra: Do not assume that a NULL domain means no
> DMA IOMMU").
>=20
> Fixes: c8cc2655cc6c ("iommu/tegra-smmu: Implement an IDENTITY domain")
> Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Closes: https://lore.kernel.org/all/c6a6f114-3acd-4d56-a13b-b88978e927dc@=
tecnico.ulisboa.pt/
> Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to drm-misc-fixes now. Sorry for the delay.

Thierry

--eqydumr5po2uxfmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfbCHkACgkQ3SOs138+
s6E9XQ//dZrGX9bTbogtguhwFF/4IRrRe4qeEdzOV0hWNrSI/AgrCcZXVt8jyCRl
cMyrljBynGAY/Aza57MvNyWi9pMblhNdW3X8z0rhvRph4NFVqb6ABlkGm4YVKHuC
xVWTclRfb7oG7OpRAd/FaGbdEINE4UAJPXT+BIOkkjaTh8LSBlINLSpLOUTbu2aY
r47yrFhcVh0GHPPZ8tcUbYqyVdJdJGMnuulwfhPVwvgotzcIFNgzNHyHvC9Z4TsX
/HKZvXjSSCTjR1kzUvbt8pmKEKKqqCvCFULT2llTniiTwflqxjuPKCS8wYj5mueY
OJvQxghdYvfXNLMnTplQoOOWOWLTOc3/37OYGJIEziubEOx676+v78Uur+9107VY
lKDonC6ketIV49JGF6dxp5sH3FdzONG6LNYRSEEz9ATri/havxpHe54nH55gK0Tn
qwnMUymUJmVcl326K30czWhxtx50Fuucn+vjagmOKGdr4qY6+l8eZ2naxyqtAcDx
zznVflHEAIwi+iBVsETWaQZILbjpfoocGq86fsqMY08tY6+KdP7q3lk2gTX6PWz9
bAn72EIlZFUBTOSo7vmlHAlUghj1sm8PhfFiMIIGBrend2hHgdxvb4QLlDQZIIbz
anf189zuSi/kEoQzXuaryOoRdUXJx8wdEmcDL1Z138Ab6aD4hN4=
=levc
-----END PGP SIGNATURE-----

--eqydumr5po2uxfmv--
