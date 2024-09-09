Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B04971BA1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEA510E58F;
	Mon,  9 Sep 2024 13:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aUGD/tqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD29F10E58F;
 Mon,  9 Sep 2024 13:50:56 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42cb1e623d1so15610335e9.0; 
 Mon, 09 Sep 2024 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725889855; x=1726494655; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lMG5CBAWeO4ejfahNXtDesCRER8MZqFkLGpgD/QrZx0=;
 b=aUGD/tqUtnMVXcmpRQ4qspmC/s+VGWryh4vPxE/k/HBovOk2250ETxrAmCW8Hy2MxB
 blX7H84NxDfRNNgxQxp0EFVqzkuV9tsFfCVbIcoWUpQdWuuOOW0n9v7qlC+ohsuEIEQA
 oAK3s+lBkryUbRcYQNTbBrBmgtqKxBBGPnnUPk0xSJmDqrMQwxSHuoo0A6soVfyM2lm7
 YGJJPZR3ZU8DTselUNocG2vmx+dxWtdl8v8HALFPye5bkYqTUkpQ3hwfvhZcG6aZ2+Vv
 dngAZCs2uo78hoSG/hsBVHGt1uZx5cE3pEmGOQe6wthYRHaUKCts0KmUWWHWvm4k7HUF
 uL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725889855; x=1726494655;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMG5CBAWeO4ejfahNXtDesCRER8MZqFkLGpgD/QrZx0=;
 b=XYpUwkZ23tbQgvczFtKMQc9HEQEq5+bgrm8b8YZZLtlaGpoG6XYVP9XYB49FeZXM+l
 pU9YVFQtrkg202VC8K5zVM5GLhE5uGj1XKMF4SpWyjhcWHCABqzUReWTiYUQMwVYa9gT
 KLFpWt+zyxhQrkFK7dFqTHZZ2umQfwb/XgT26wtMtgbablOCTaiosGJf8k3ytV0zANOz
 TXKT0ZBffg/wWmDeVNK3sGn8K1OR9dFTE0nGSCIrsBuliDgE8ggPk/2lK1JB3wAO3akB
 b4jbm7B2dz4HvCQJNs1CFPvauKzhrkfcUMwPPyQ47NMZj/eOeCJhse+lEA83329nj3Uo
 SeGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJjppVVQX3HSLYrtu4mrHdh3srzZ9xFCMhZ9oCTaUuYZ44qGIFe5kCQNaIJfZeF56euq8twP8Slr0=@lists.freedesktop.org,
 AJvYcCXxzlf7ByS1vtsOILVDC1mqu19TogXOz48nI+OcRh4ZAQau6sv+sJtfmSZQ/MDifVkg6l4gaOAmNQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF5niMmA0vPRL+MGdAUySv0n+iNWOcW5AvKIHk0I55AREhu2Rz
 lv8hvDH+e8YfNIy+WV+cxZ2XxAu93LKczjVy3AHeLV2Smd0htG0n
X-Google-Smtp-Source: AGHT+IH7gctIpKVybmTJbCiBDVWk+ue5UJ4VaJ0e/g/b1ur+KjZ/0Qi53vCEo48IGD4SKCIPKcrAhw==
X-Received: by 2002:a05:600c:4692:b0:428:10d7:a4b1 with SMTP id
 5b1f17b1804b1-42c9f9d6f06mr85546235e9.25.1725889854108; 
 Mon, 09 Sep 2024 06:50:54 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cabd05496sm89431845e9.27.2024.09.09.06.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 06:50:53 -0700 (PDT)
Date: Mon, 9 Sep 2024 15:50:51 +0200
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
Subject: Re: [PATCH v2 1/3] drm/nouveau/tegra: Use iommu_paging_domain_alloc()
Message-ID: <zpk3oj47djrrrkxpe6airhiaoe7xr3pvxyqotac2jqmhoerg6h@lp5d5ziiq453>
References: <20240902014700.66095-1-baolu.lu@linux.intel.com>
 <20240902014700.66095-2-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cbx2ef5ohko5pqdz"
Content-Disposition: inline
In-Reply-To: <20240902014700.66095-2-baolu.lu@linux.intel.com>
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


--cbx2ef5ohko5pqdz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2024 at 09:46:58AM GMT, Lu Baolu wrote:
> In nvkm_device_tegra_probe_iommu(), a paging domain is allocated for @dev
> and attached to it on success. Use iommu_paging_domain_alloc() to make it
> explicit.
>=20
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--cbx2ef5ohko5pqdz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbe/TsACgkQ3SOs138+
s6HxRhAAo/V2yRjVbLpppk3RuhOIcoErbyCc0GlXoAWEjqyBXH3YkzOVeaKlu8iR
cexHENRfvc2/AnQ4DZd43yo3DXB4RL06245qE5NmyTSs1/uzrcwHGrIxYLS2M5NV
GNRWjLVkVVMzZL8+WAVpZlu5Z4EjJiLYWi9ZAeOrK6Pf3KhAKfzNjVALOoLD6V3A
qMfXYpQc9yx8QnBJ/sVC6Jz11kUgDGMjz68rr3vyFftxvownjajcwpa6NvkEBaUW
a1vLHY9T4W4qt0df3VhQM2wmidkF5AFhSNRZvELogwVmVOh06W9sXIe1O79CzJ9d
vnjemWkF3w/d2qqjzSqdktYKDEwECa+f0LiCs0eYgx8btQkevTLqNoZP7f6vKG+5
ELXTVH2DHYbzMQXMnrN73uyd2WUtAP9JeoE+rcTQXv4jpkLx8JnV7cenBYTgl3Tv
xibyj23MiXDiPSX+ZQAs0fMJK9L/MSukej9WyuD95WvqadTCO7qG2DmMcklcoAe9
ZGIXvgwG429t1ttFF6Gd5FfrizP8cQPZAOQ9YgydfSgUrJRIkJJeIO9G3wcJBy4G
2kElKIFxevKxizhPmyAFJMoJCl4I2Ma/OnfVNFvuaJPhYqqfU38RxF6sV+JuwdWM
bg9Bp+0RuHrepTbQn4sGrGK3BLWeeiCoEyECMGc3V5BURxImEfo=
=IgSG
-----END PGP SIGNATURE-----

--cbx2ef5ohko5pqdz--
