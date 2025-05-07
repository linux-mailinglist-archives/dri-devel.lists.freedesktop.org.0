Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14173AAE559
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 17:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523EB10E838;
	Wed,  7 May 2025 15:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HK2Qtls5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E637410E838
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 15:49:44 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a0ac853894so15932f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 08:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746632982; x=1747237782; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R9hjok4wS7/jyfDA7YpA23jhzWzR1hZPY1B70z6QI6o=;
 b=HK2Qtls5m4SXR70ne4lE1y8wyISZVzvawq3T8f9TMU0Ae9/BVoyo1DCTusEN4EJ7Qn
 bUHVxOX/KQKC52DsCn9WBQYrFtVO5rHH0HjZYBw+dkEPLWRMHWt8sf3MZUBAacTiKqoH
 iUMU6leWQIsO0cWIVUj/n/TF6bXmtfKBDjEZCMGbzYjCNDEMbolvmVfgFp3QYseoh/zl
 tj+y/BYa6D8i5RjAIdk/eX6CE+dmqSQYYfxUge4OjvXpvrknbDVay/ts19lONg1swuhh
 uQbTJ2WxAr5y2TGJF/r5TBZjsL+W+w7NyK66UtdIiRkH4LmpiFuYV2/9PFWXeiazMHme
 Gjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746632982; x=1747237782;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R9hjok4wS7/jyfDA7YpA23jhzWzR1hZPY1B70z6QI6o=;
 b=K5BGwzUr9M3LfRVTn7G5y4RbopmBYJNmDdga+o/K77n7BRCBCTFw/oqbRZr0krTAWl
 5hX5C6c6To6fnlFnR11oo44uy9/aPdE6tGRQnRmIfEje70F4I1xekgs6eJsXmojumonc
 ZerMpyNo7Hi5izi+GYEn9AdMM7Tb2Jp5FexY1ZeAf1OINygmLaURch0ozYXnbfQMv4UM
 dSanhB3UKbtqa+03lTxVjHbblhk/fyvMnzc/Xg9EBok5HFGApfnnk/JQ/IyYI/OlPZxH
 h7WJtWtCFBHFoRZaLPZ3dg7wGNPSd1p89po5nJ10299NDyqDdvb4ZoUY3wIdkiHXZaWr
 osDQ==
X-Gm-Message-State: AOJu0YzIfe5oxc3/gvtEPRiIrUPnnyHQbMEKMCNPG8yqhH0uxL6MoJkD
 epcjB+78k55FR1fOPZLv878HAd1G3B30GPGBU3FtCL1Vgq3VNMJq
X-Gm-Gg: ASbGncsMNVxuDifw79H5zzQLTVuanBKZZPAtHX4ai6n3c49a2edxz/Efy86H46WDrxm
 1QPbWGJMhLlgfMv2VJT3wK1pZ46AjgeZlhBE0afiGzvD5isSoOQKmhuMgIN1zFulFuQN/U0fFzp
 9GymxRfWvf+KvZEozF36wzbBfJzjwuoXmICidYoyqXv4BI3pVb6vmqU7flbGMMUuA0OHezhM0BZ
 M7YkDBbuGTzBgKQ/Gu3jP5mQKFLMs9jONJ3wTTljyijymcCouCW8BgE8qA40iLX4CJxTHYuglyx
 Lsr2RhIPLNWOnDi1+q6UZ99PKGbaNFxmpOy1LXg7VEEpaAM0G14e+xOT2TeGa2pMSyec4rnBHbh
 BWq+FbFmAzMwD2hmooFg/3u2DG1g=
X-Google-Smtp-Source: AGHT+IEfBBX9lZi7CDSSTeq7Jp+h4dZpWsYn/tcSZZkhDjNw1bK5CzzUt6YmE5gfCvZKeo/kHS7hjg==
X-Received: by 2002:a5d:59a8:0:b0:391:13d6:c9f0 with SMTP id
 ffacd0b85a97d-3a0b4a0fc47mr3451624f8f.47.1746632982533; 
 Wed, 07 May 2025 08:49:42 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae3b57sm17644687f8f.36.2025.05.07.08.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 08:49:41 -0700 (PDT)
Date: Wed, 7 May 2025 17:49:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 Ivan Raul Guadarrama <iguadarrama@nvidia.com>
Subject: Re: [PATCH] drm/tegra: falcon: Pipeline firmware copy
Message-ID: <zr5xiqfla3hkzsqcrsgitbi4acwuiw434bj6fsez6mzpsj6qlj@t2mi3np5e6o4>
References: <20250205061027.1205748-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tcwdze7jyxpqlqww"
Content-Disposition: inline
In-Reply-To: <20250205061027.1205748-1-mperttunen@nvidia.com>
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


--tcwdze7jyxpqlqww
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: falcon: Pipeline firmware copy
MIME-Version: 1.0

On Wed, Feb 05, 2025 at 06:10:27AM +0000, Mikko Perttunen wrote:
> The Falcon DMA engine allows queueing multiple operations for
> improved performance. Do this to optimize firmware loading.
> A performance improvement of 4x to 6x is observed.
>=20
> Co-developed-by: Ivan Raul Guadarrama <iguadarrama@nvidia.com>
> Signed-off-by: Ivan Raul Guadarrama <iguadarrama@nvidia.com>
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/falcon.c | 20 +++++++++++++++++++-
>  drivers/gpu/drm/tegra/falcon.h |  1 +
>  2 files changed, 20 insertions(+), 1 deletion(-)

Sorry, missed this the last time. Applied now, thanks.

There was a warning from checkpatch about the (1 << 0) that's added here
for FALCON_DMATRFCMD_FULL, but I ignored it since using BIT() would look
odd among all the other definitions.

Thierry

--tcwdze7jyxpqlqww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbgRMACgkQ3SOs138+
s6EFSg//f/Sh6cYqCMaOysBS3w2h4w+wYug+gGPh5dlkrAW+zhJwlM8MvTi1oWn1
oYCCKX7G2ilgnVXLY/dV0XNE9NMQ+mh1XpreojFllACpOuX7Gj9K09ZMm+RoUSfw
ufoDlsNgsfAuqzWdONQ2tqCKR0WNzp9/Vs0224UvSbBJ2A1UKJeTYZmyaWH2hPpk
TfE9TjqJSc4sB1E8YPZpisSXWRldDYu8EhMcr9eZZUV9MyOs1E1eZS0lViijqQ22
qvfXcJ3SZN9GbdhahPTkqEwyuRreQlXoHrsVc5PLcsdVhgeoERpRHrq5J/biuBrO
cy9votexuZTDRLiOEVR5S+s1YibZt3ALak9alJJEJa+FLf4eYsb+meYQBv/Dtwh2
HkfPjIapS+aCS6DxDs4Q7WS1THPIN+sSmkiFQ2oga60C0YieKGq74Lah8E3MlZJu
NFYNNi0w/hgeKXVDD0jC0XMjHdN+tuahru460VSR42tP1fJlYaeQL6j0bzDbtMCl
KBBvHHqdpBUgTtzgkx9sx4xoEfdoPljoo00bowawWzlhiX6tB0t7MIMrdWrGRIr1
WGlVsdskW2O8qcF6rHmdEC6CBPt9xCqKuc01q9ZSU4znA6XBgWnbMfYwjVLlOVPE
qO06/tRGGLBND9OXuuJWkyGT6Hpy73jgp+V7YmzmHtQQ2kCvY9c=
=Em07
-----END PGP SIGNATURE-----

--tcwdze7jyxpqlqww--
