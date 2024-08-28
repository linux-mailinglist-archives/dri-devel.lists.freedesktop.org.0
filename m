Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16112962B8D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF8410E57A;
	Wed, 28 Aug 2024 15:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TJatRfxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12C510E57A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:12:44 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so57828025e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724857963; x=1725462763; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kbaH3V7Lk+uax03Oqau7bBE1nBYKOYJZ2EVryMzrRy4=;
 b=TJatRfxjqSJnIFvpfCtabw41YJXlGPI4ujiMEvdVbQs2B5rQM9ro0YeRhJoaeHnDfb
 DP5CJyXJDSPibV+dRYgAKrJjUcZ9lz+Tk4o1VjYGhPhNDnaV4i4kfACnCeqTzvxIs7lf
 e/2nahfHV0dnXzmAPSXQ3fUVjXQs0QG46enhPgx4ypDlPgRdID9Ht6PA8XrmMCOerqh8
 kJtZK8Nvan0zffm2QS93+jNG74DDOi/+sx6Sg9rVEY2LU0pkbZ/G431kEePK9d/E7WFY
 TrOrrDvmVu1qU9QgB9hdHQX9C1Ho++6WVzB2+wuhrA9gyAlqbgevk6Ni9Nn820XSVRmS
 /Yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724857963; x=1725462763;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kbaH3V7Lk+uax03Oqau7bBE1nBYKOYJZ2EVryMzrRy4=;
 b=l7s0Me0mYjzFKFykwQf5M4On88FfaXvCxWH9rv/i3kYlJr/x1JoFqMy0tVutJR9Nbh
 IMEmJUZbfggKPWRxbgCi71WulXsNF8VaV0YlIeMLxPkGxlBxbYCgv8WEw6TkQncVL0GJ
 BrvLy5hlGDlfxsK6shpbq9w+amm1FEtPI93+Ocm/5hYp6n0EnzLpWCOLURpN5oq3Mply
 P54R7sKbZLxEMIq80jl0KQ1N/SVrB4wa+eF27u0XImQS3D3lH0K1cH644jT3BkIXdxQL
 JRsvyE2L559ehfDoPnzQ/9+vDdmdlhyQvpfqpUj1xRzcC6uZpV7Jw+qOvRLNlspRCixa
 WKqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu9HqsdaAyHOfUkPFQtMVnI+W2H4xXRoBevJP0P1ZqgC10gdAq76zeFavOCHwS0o1WWXBqnFgD/D0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzzx8GXfTDtDABXj9qfCStz9q9kd7dwkc22VehVDLk9sDEaOouo
 TZiMlEt2QBQINjmTHNqvk0mkQhvFXDM4JEqty+Iq2RDBo0c+vNOt
X-Google-Smtp-Source: AGHT+IGQW0+v8moibSdO2Q/RDfDjaFv/WD0sbqLqA5iBEEKPuRh2zkLaDWQrYYlWkKTTw2QwiUONiA==
X-Received: by 2002:a05:600c:310f:b0:426:51ce:bb14 with SMTP id
 5b1f17b1804b1-42acd5d79b1mr105634055e9.30.1724857962403; 
 Wed, 28 Aug 2024 08:12:42 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba63965dbsm24684245e9.6.2024.08.28.08.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 08:12:42 -0700 (PDT)
Date: Wed, 28 Aug 2024 17:12:40 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 1/1] gpu: host1x: Use iommu_paging_domain_alloc()
Message-ID: <5bckndhbbvbvkt2bqxseyeo43qzvy6h2oykqbkhnfrpw7zjwu4@ziztccfxccv6>
References: <20240812071605.9513-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7mk5vwuaumccccci"
Content-Disposition: inline
In-Reply-To: <20240812071605.9513-1-baolu.lu@linux.intel.com>
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


--7mk5vwuaumccccci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 03:16:05PM GMT, Lu Baolu wrote:
> An iommu domain is allocated in host1x_iommu_attach() and is attached to
> host->dev. Use iommu_paging_domain_alloc() to make it explicit.
>=20
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Link: https://lore.kernel.org/r/20240610085555.88197-8-baolu.lu@linux.int=
el.com
> ---
>  drivers/gpu/host1x/dev.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--7mk5vwuaumccccci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbPPmgACgkQ3SOs138+
s6ErLBAArXWV8KB6676S4Mww6EFpvjmqtdeUPZADFF5+D4qAXK+eqPe/rprOAwCd
6+tCPTAkEGrym0m4qeV44txjQOtxEM4a+YWx6WxQfCYg+oprDa/jtEF+ysICSiwe
3fJRnrb16N/fFTaEHub+y+gAtr1BlhHmRt+zZKyNv7eCfM3tk5sMd6WcR8UCp/Ey
zBFXXmcC5ugNsZtxITQWGcHaY6dotmlkqQpRq41NMRr4tSnJgmR3z0PwCVftt23x
B+agCPY9txwY+vSCIwrQ/zQwP924utFtkf2avxSLhU8E/RabXCJFUtbKhe017SJC
mNw7Ahz2a5QHaXKTjNCrO/xczR2i9RK9VOsJUgOl85zQEVE66XoFzMlkpKNZZKze
B5jMd5Lm19Cqpl2wTRgqK5B4oulDKgwkusWOXuPTFZjocpKOzW6SsKzrmy/+/Ie+
ICZNIv3Op1m6Bc8rK5WWHFYsY7584/3yDqmpI9pb3JeB9+VMU0UCEz7bNBHTZCAK
kcj4LAOzk9oSvlN2h1oUBQzM+3tqh4v7Y++VVJxPi8ecNbgXekw8V76uKW0iKz9O
uzq198fgfG0P1TvN15AtUueY3d6J8lGZuVH8FEphvkNagj6+x/dx/dJW9tu//poK
Y8pQfxFEVSY4oC8gRlgIPwCEgFCSWKRatLXAokmYvhy3IRNc6Dc=
=cWHB
-----END PGP SIGNATURE-----

--7mk5vwuaumccccci--
