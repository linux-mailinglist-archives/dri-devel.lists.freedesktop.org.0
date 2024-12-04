Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D629E3C3E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 15:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9427610ED44;
	Wed,  4 Dec 2024 14:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E5lopxwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F414B10ED44
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 14:10:06 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-385de59c1a0so5094188f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 06:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733321405; x=1733926205; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mrFMLc/jdh5p8JybRnIahA1b8Q2rxGK6wJh2KFAKrwU=;
 b=E5lopxwRKfX48DOZ2WPH9JFA9gZzt42/UR4VyFILqTiIEDLAD0QVDF7DmMO7W6aUik
 P59iojoV1961obbL/0aJQEsLDHsNcNNjc49wp4m9X5XRoz/IuX9LicIzoWa861M0nVVW
 i6e1zFqR8sjo5NOaZ/GwO7eIBT6DBFS6XFdft52s61aheeVEUNA08zJlFpFelkHXjwnt
 1FpKOCrxbJEf3Ay5ucv0EO+rm1nH6IQ+xU7UAou+GqDZmdFNcIgl8Uf/Z8xqFqElwzgE
 CqMJoN7tPfvPoVUGlv3AGRAbL4s1EIsFE+0JR5skRT1P9k6ocAAf3dNe+rcgIF8XKv/z
 WcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733321405; x=1733926205;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mrFMLc/jdh5p8JybRnIahA1b8Q2rxGK6wJh2KFAKrwU=;
 b=ws40idym0nuvVgObv+YZryo8sRJhbluOtlvOWKT8po1DIfEZi02lbgNG+7/ePTXwwx
 /X8Oi60yS0FRBiAejXkI8dW6DC8KLSV18Ds2UxT/eOAMQrUWmBRP+fr8yFqP5o+K6/3+
 CZXcvX91g3VUzp12FlOc3F4QMZywUCcCmKxEtIOIXSZp98d9y1tAVNR8ErHc5U6Ci3/N
 JUY6hZ3+PW9B2MCgHsjHBYGmZq2PHQEg5LvM/LaJj8XVC418GthwsK8Sap4ABVZijt+m
 69d8ZAu5bioM/S5BbnsoIzZ0tMrFp9ql7nEwrziDN9WozKsKExzK8ZofYhAbvtf4PqpT
 Q+og==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSozSRoTFZxcSVPA7eOULfrao9zt7IxQaeSklkE5CiL/RNv3otKlXlwbLRcqSTZ1HRySAHUOvSGD4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbBgTTl21YzhHbyyHJ0ROzKQ3pvCc5neXopurhFxgjQeH6pm62
 +CdvCOAqJh7ZwOXUB1FFukdHdq22/QJtm0kpu6N0F4iCqK4AKn9O
X-Gm-Gg: ASbGncujnbCko9CSTxY71rYHAJMtFaz2Ztzvsxwtm9pJOXmlBPJauB7h/aGPJaXCkL/
 W3mmVWkyRvBhj7ukWt89yIt/Xi2MxSLvKnOAkInS44psxuyy7H0tLS7jve5qeU27HertdSR4INk
 H3SAl7eyVbHb41RpekOQTZs5mOkmZNdD2k/WrQPmbq5POIDhpUimCU7vJxcT/6yIHIDQule9YTC
 XexMAFQTPbzMnZMQWQ1XNiN6pXBzzTdXmEBiv0QGTl/GZ0YUsG3sFgECR3C57IxcIHsLWgMj4pv
 Zrxjc9RE2DHGE+HBW4uiPpi0S/RSHBmB19s7
X-Google-Smtp-Source: AGHT+IG17qKjHP7hajsb1NqDKGf26pPgtY+u2y2Irx0Mpfq+Bk5d1g+9CG/Zi2mBLwUCzK6vQKtkSA==
X-Received: by 2002:a5d:598c:0:b0:385:ea2b:12cc with SMTP id
 ffacd0b85a97d-385fd3e779bmr6188036f8f.13.1733321404995; 
 Wed, 04 Dec 2024 06:10:04 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d527257dsm26885385e9.1.2024.12.04.06.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 06:10:04 -0800 (PST)
Date: Wed, 4 Dec 2024 15:10:02 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Gax-c <zichenxie0106@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, mperttunen@nvidia.com,
 jonathanh@nvidia.com, kraxel@redhat.com, gurchetansingh@chromium.org, 
 olvaffe@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, 
 mst@redhat.com, airlied@redhat.com, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm: cast calculation to __u64 to fix potential integer
 overflow
Message-ID: <xlmfl2rhjgczu6oycgogchqi2gc65w7s3qy33yxzsrf6mbri3q@7onulkroaa7z>
References: <20241203160159.8129-1-zichenxie0106@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="magv3qwbnz55o6h7"
Content-Disposition: inline
In-Reply-To: <20241203160159.8129-1-zichenxie0106@gmail.com>
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


--magv3qwbnz55o6h7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: cast calculation to __u64 to fix potential integer
 overflow
MIME-Version: 1.0

On Tue, Dec 03, 2024 at 10:02:00AM -0600, Gax-c wrote:
> From: Zichen Xie <zichenxie0106@gmail.com>
>=20
> Like commit b0b0d811eac6 ("drm/mediatek: Fix coverity issue with
> unintentional integer overflow"), directly multiply pitch and
> height may lead to integer overflow. Add a cast to avoid it.
>=20
> Fixes: 6d1782919dc9 ("drm/cma: Introduce drm_gem_cma_dumb_create_internal=
()")
> Fixes: dc5698e80cf7 ("Add virtio gpu driver.")
> Fixes: dc6057ecb39e ("drm/tegra: gem: dumb: pitch and size are outputs")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/drm_gem_dma_helper.c | 6 +++---
>  drivers/gpu/drm/tegra/gem.c          | 2 +-
>  drivers/gpu/drm/virtio/virtgpu_gem.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

I don't think this can ever happen. All of these functions should only
ever be called via drm_mode_create_dumb(), which already ensures that
these won't overflow.

Thierry

--magv3qwbnz55o6h7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdQYrcACgkQ3SOs138+
s6HXsxAAtQJlAEOMdgNNQBcnlKziuLGEV6eDn2I2ZMbyfdflAwfxU1IZem8HHolu
Uf8rl4/XAETFBzeMup8SZ+DvspOCUSQY6kf8Dh+25/5NDTEf50vjBA/TXcws/ced
6pRImbXzulFvz7kEm/fOaTXdk9w7mKnNDpFj86FUBcuz5kIQm1Qo4uhEYZRR9BSs
C5c6m77m/4N3Iw7mkJoKW1U0jDJpfgw/iCdUpZrNh2buoKaRhe3WasizYdpXcbIn
ImHPVPKV7MUgLrlYjdqOlxninIKhRMB9n5hcbvHD2YQcv9Y3pj1XA9YzXu3+4pir
Sq6HLJFoHy+vmeLdTJZsMEljM25tBtkXkIUVEiWUb4BTbjJHLikCT4IYvfm9wByx
OKCLKtdAiKyC1mh3aswnmeHb9tHBTt2Zj++nl2u/oUJyUncmBeboX7Wh+C9aCWF3
cjT8OzvzTFX0bTLWyO9n0hwM9n84di0kuVmN8Bm7erXZcFAQyJfQpVB8lqiXokYA
iw+IZX7DQQ8oKnxYpXy+V+gxSD19e4fed6jzgGpn7s+JYRuH1SiBSA4iaIQ8OCze
7FPuGM5WT1d92OgNUU+jC3gjM58QHwLiEFhJgV2Oj6/sOi5fs1JY9uGKlMbxynlF
PQm2NJU7k9lZXI2hxYRY6AmtikgF4NSYiz5zgglZvHpLoeLItpo=
=dkp1
-----END PGP SIGNATURE-----

--magv3qwbnz55o6h7--
