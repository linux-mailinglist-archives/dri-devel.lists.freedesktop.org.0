Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D16AAE607
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 18:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F0F10E1CB;
	Wed,  7 May 2025 16:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dxyd/ke4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CEF10E1CB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 16:08:24 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso791725e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 09:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746634103; x=1747238903; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o68V7zCdyeLD/zo96i9/6hmSeJ0InCcEwQEaKU1RQ2M=;
 b=Dxyd/ke4Qy747+rmHvBv5NAsAzBGFSryrPIGKPxJCyssFMbJlbKb1DOu0MM4W3QLJQ
 ca0rsV1MLlesZlC+SJsI0BFuwenCHVKKU8ToCX2aNMKOJhG/JD1XaokB205O+KoNWany
 hvcgG9Rf4QhLZU/Ly8EUN5TMBD7wSjNrTJWEEurWZ7gvurgZVKS5R2dbTBSlAKghbOrj
 UXx5XaquOvcoQojz5fWUxBwciQFkruq4FGEYUc5pMeh2ZURkSAZ7bpqzbBlSOg3v56Xn
 YcOekHqYvuSJkyMAentDWCzsHDdlJ1hPkd2NVicFwBmtMfog19xIzx4bqhJuUSH/vzNG
 Hl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746634103; x=1747238903;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o68V7zCdyeLD/zo96i9/6hmSeJ0InCcEwQEaKU1RQ2M=;
 b=wBrwPbUNc0EcS3FqidjS4ZlBD1eCnYvm9fNnv6H27qhQRxwisoX9hAB7J8WebeAl1v
 4/rnLKEDtuPhFGFTYU31WCMEFDZsNcIFlwGF+FpvfNVMEFbaCkHwok60AMca+LvNy7lg
 hiaSyRg2aNSis4L1CeW6h8meU5zvnSn3haQmcWXMf1g2PsYwh4TmtqobGVaLDUmIBcT1
 RFJpa4XLso+LcnuPM3GwJjlnVLfiY4dkHjpy7aobdS1dBVl3Lz4vwK8LcFHNBp36RIOG
 nGMCdGJ+F5arcqot27mFjF0anIaLisUhF5tlmzcRtxNWsNZeNRBRA83X7XJTEk6sFm21
 8r6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaDYgJnCoPgAtwNhKmcmqxkyCH+v5ncwBh3LvnuHhhvjrmIrYcvQODiXonzdx+jtIu5m18zagzmUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqitE5FiYy0P40BXqlhqW6X4Q7iR6UPkwEcZskrR0iYHJmo9OQ
 /xYDMLGKDPu4III9Y/foc7mJs4lkJd05GP0R6kNPhbv4IXrU5o3d
X-Gm-Gg: ASbGncuA6a/SFRzmf1uex4WxHgfI3yojlbANk1HNlB8QFENk/f7Kz9xaI9iVU14Agdt
 Nk5YWqBEBpcHsxNTY0WC6M7r+3e0tVVhMiMfPl2p6URMq5yRfDrPwcwbxyVLQ3ran0OXyVVmLTf
 GKVTCzL+j3l0Ioz92aP5RvXhrhWry1G/TITMFFjA9li2M0g1RWgZnu8HNmd12ecXTG45wdZTP2a
 LQQZy/eehDAGOGJkkAq5WF7galVcybIhSfJSAgmEpgzHmmJJLyBk9vM1We+e2ChmktKzPsB38Wq
 CboFmRiLIPM+fC5MA2pX1CBH/EG4eF6hMmNfViC/wyGsWFxwwv9dQJy3fHpRniJgRGF68D5997o
 +kDJUtmXz3iE1tDbAvT5AykJf8S4=
X-Google-Smtp-Source: AGHT+IEWtaaQHN90f9Ar75XF26861r4Smh2BGN0stetXtqgZ7jk2EzFouCKgXFVI8SFpwZcRQXNK+w==
X-Received: by 2002:a05:600c:331a:b0:43b:4829:8067 with SMTP id
 5b1f17b1804b1-442d02ca75fmr836535e9.6.1746634102644; 
 Wed, 07 May 2025 09:08:22 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a0b6d0e1ebsm1645388f8f.80.2025.05.07.09.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 09:08:21 -0700 (PDT)
Date: Wed, 7 May 2025 18:08:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: mperttunen@nvidia.com, airlied@gmail.com, simona@ffwll.ch, 
 jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH RESEND] drm/tegra: fix a possible null pointer dereference
Message-ID: <qicxj23zxidfh4zqvrm5r2udcy57xo2dezvcaxuinannfhodxy@vueedaqco4t6>
References: <20250212014245.908-1-chenqiuji666@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rt7pesreydbeihse"
Content-Disposition: inline
In-Reply-To: <20250212014245.908-1-chenqiuji666@gmail.com>
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


--rt7pesreydbeihse
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND] drm/tegra: fix a possible null pointer dereference
MIME-Version: 1.0

On Wed, Feb 12, 2025 at 09:42:45AM +0800, Qiu-ji Chen wrote:
> In tegra_crtc_reset(), new memory is allocated with kzalloc(), but
> no check is performed. Before calling __drm_atomic_helper_crtc_reset,
> state should be checked to prevent possible null pointer dereference.
>=20
> Fixes: b7e0b04ae450 ("drm/tegra: Convert to using __drm_atomic_helper_crt=
c_reset() for reset.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--rt7pesreydbeihse
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbhXMACgkQ3SOs138+
s6F7Ww/7BQUPPBt1SDPOYhWqQqpw/rRx5SjGlwoNShTy9KEjJtgmQhabWwyme5gZ
MZzdooSU+WBEk4emzsZNx+Qf2CjNya9whrweB959fN5Ip/kvCyF274Lop2qs+LKe
uMn7/bXUaXb1e1F5XvYP6ywuBNJAfylOnU6d73E3cwMJjk8Hm92r9q2q/NR264UP
hBLQsMDHzlsp11lTu18SrdMHWOpT9MoTUDEiZd4gVjCf5azw+STKrE7kNXZaU3S8
K0Nkh0Zy8vD/9+wvRDygroOlFNW/dRVAa/4gM3kgsC9MIiVU4C1k6eYfPEkBhJHG
quDxbPdHDENKo+mfSvO2JOpE8S5XNG/JEe2ecZXbSvpUMq/keEhVMgP66rKQBLhY
7JmcIsHzBiT6mkwnL7QLk5YHticRfES39SoXp7wCgIbw5UfNvpg0fFs+M1Yu9zIT
w6hwaodfHOLSgV3UpT5uLHD5ng3/08IspUc8Z2urY6PCIYkimzp+YwvjA+TTOg9e
f3biI7A4lKFPQ37jN/oyMJ0Wr2lBdianS3cdofevQpkfc1ZIWZLz4YqMduAPlhm/
+nWEN4Pc5F8dkCuoIL310J+rYQJHPLitXbk6SAXvM2OWyVVusmggyFkvaBdXWT7w
fDnQcazFbBvDyVjl3NLtgy1HqzXZehGPMNvzZoQS0I4NdPqMGuE=
=KGRG
-----END PGP SIGNATURE-----

--rt7pesreydbeihse--
