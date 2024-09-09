Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BCA971B97
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992C410E58D;
	Mon,  9 Sep 2024 13:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zy9b3D4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBA210E586;
 Mon,  9 Sep 2024 13:50:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42cb5b3c57eso11591265e9.2; 
 Mon, 09 Sep 2024 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725889830; x=1726494630; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uTmI7FKnXchw996SUeECY59GrYXxeJtGeoLPHxq544M=;
 b=Zy9b3D4vrPdguBzjeynYKFAkg8deFmbUEZbvcFSZ+utT3i568Fu5XqOaJ/srWoWhEv
 kNKwDBsG6LonEBet+t33AvLrvocgJbmQoVGTZYyHj1gwKPW5c711It2pLMIPhlZqe6hP
 rfHe5bG48i4xqYeGGzbZNaKty6mL98wwGubjtixiZtY27QL8Pzt1vse/w3gln0s7JWPr
 qCJXGiuNCnDcw5Csp9qhc0Q1By46l5Qb6h4IxF6Bs59hIB83RYRlelEgCus0vo+B31Bx
 IaHZLJyot1khEQUOfIaVGY6n7pKa56ESI6DetARuK/ClQqZOu6JDiXGp8CK/W4fvE+WJ
 ynNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725889830; x=1726494630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uTmI7FKnXchw996SUeECY59GrYXxeJtGeoLPHxq544M=;
 b=FxJbqd22D4MZxnlZQ+lCDtiAxQmYSOd7dEXuk3rN3pOpFarSSAy8UmRS2ApWLiaoQm
 0dJrHM8IfXQEa/CrdeqrKKLKA82cLC1y/3R76MWPIGwfVbqwxKsC+EVTt1HCncFGqzMI
 B1MupfPWEhf7qTQ5xXW5Jzt82o7SZAEgWoEcOjTdgKTLWy98hkIYDgP77zFkMsBDFhpT
 3lkXveB86KavoishvNbyq6hq2QOoE25OGvCfqV7FTiq92D6t7Oj90efyGsLb1usjDNiN
 2+qJVPoRS/ozBbhU9s9qMiC2uWBNvRVEsZlyJfIXoFat3mgV7N2AQnbr3wBWwZ8lQT/u
 By8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUva/4mH/kKhbvtg7x6u4316JuxGSpqJnWFNJcG4D/zIf3f9ipu3IqH+nHzQVnJNat05M96G5z69Gs=@lists.freedesktop.org,
 AJvYcCXyxGAINxU1+Am9S19+eQcdGwrZlsGqKeHaJrMfr4qwqw0gN8Nn0a2v8p8TCGdC4XXt/DpY0dU2TQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykOMnjZTNm0QdUdoSNRHl0B7Ni/FzI4DxvrFzlQF0ONYfH7cB9
 sgngIV3A/QAlc4LNZMSTD3dd6W0MD3yx0QWuLR6JB3NeWYnaWXJr
X-Google-Smtp-Source: AGHT+IFWznISjjxuV7eQKDlaN9b6a4OoZXrdhN32jKOPKPIhtjTxNr0Q41kQYaOLItLh2+izQfDzHw==
X-Received: by 2002:a05:600c:19ce:b0:42c:aeff:9766 with SMTP id
 5b1f17b1804b1-42caeff99aamr49332695e9.20.1725889829441; 
 Mon, 09 Sep 2024 06:50:29 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb81ac0sm78365275e9.34.2024.09.09.06.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 06:50:28 -0700 (PDT)
Date: Mon, 9 Sep 2024 15:50:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/tegra: Use iommu_paging_domain_alloc()
Message-ID: <7unmvrhiydje2fqcrmj6flbvdbpexujibatpgoqcqevmuhkcgs@pa62yzobzajj>
References: <20240902014700.66095-1-baolu.lu@linux.intel.com>
 <20240902014700.66095-4-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sekau6utgzc3r2ki"
Content-Disposition: inline
In-Reply-To: <20240902014700.66095-4-baolu.lu@linux.intel.com>
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


--sekau6utgzc3r2ki
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2024 at 09:47:00AM GMT, Lu Baolu wrote:
> Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
> the bus structure. The iommu subsystem no longer relies on bus for
> operations. So iommu_domain_alloc() interface is no longer relevant.
>=20
> Replace iommu_domain_alloc() with iommu_paging_domain_alloc() which takes
> the physical device from which the host1x_device virtual device was
> instantiated. This physical device is a common parent to all physical
> devices that are part of the virtual device.
>=20
> Suggested-by: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--sekau6utgzc3r2ki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbe/SIACgkQ3SOs138+
s6GivQ/+JSKDqhg5e7WkMv/tttd5OTC46SSL0+cobiyQfyKnv+49GXf27ORgQw1S
aVk1ecp/nPSd0KksxiAd/ZDwulfWcOZSEVKSNhhm8Ju3WrCAZcDoI7wjiOjhNK4U
o1kbLg2ly3JhXkEhPuyvfW+1pk6rNt/xcqY5NrpW8Fh6/G1K5AJiC6oCEAsS65Ak
QejXU8T/A6s4jfBOd3O23td1serVya4AAc+wJzKgGcmVsG6ELwWbJSD0rGX+Ai5a
vO2IGIt5qzeibQIP/ZSOLX0lacV028ZEc0zCK/0tgoLkk/TiMfraIO6Ay3Ok5wdo
WiLZ/VYBfsxlQO/IqlgI/WbmhwcTReCK+T46GoyFAW6fvS2TP4YQ0JGJsubrxUby
zk8Bt9oUwJcAq9LotbPSaXgHgrkbUq1Zg4AX53UoZi6n2ClKsMusqx60Z7kbKBTU
MefEmbsZaQCoY6PdDZPYHehE08YC3d0RlojHdxwrzJM2UHfn9fCtdD5HQJGnpGxi
tgNrxCPCUNa7EzE0lqRIkDM3QoBaoxAQVf6Q2uI3BG3HPBowuwXXcTayfrKPJEoP
IVZHM9lH1aEo6B2iT1zE4oXbNS8PFeJPLkzS4XEZk+Ct0ytaBLLoGykSvvk8xE5h
oSnbslewV6UY1RVPQyOSGA/kxxwOhbB9hd65dQ87qSyKaXwc1u4=
=K/dz
-----END PGP SIGNATURE-----

--sekau6utgzc3r2ki--
