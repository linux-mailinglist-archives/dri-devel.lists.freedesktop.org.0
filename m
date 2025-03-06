Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3AEA55690
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 20:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4818A10EA80;
	Thu,  6 Mar 2025 19:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O7jIgEtP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D7810E741;
 Thu,  6 Mar 2025 19:26:39 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3912c09be7dso687465f8f.1; 
 Thu, 06 Mar 2025 11:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741289198; x=1741893998; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yNcfgkruRbdQ2LTcDlb82l2rtv263h9UvbuoZgmPSdM=;
 b=O7jIgEtPM6f49RJBHj2VeG/MMXIT5hOO6xsWnPMuGQFjWnqBEMChnwNJXiPWq5f83Y
 MhmgRb/B41HTCSKxiudoebGRxKxJqZx+q7x7fcdBi7nsofWFeneCGap66R8eP1rcw0YQ
 Z60N05vNM8YfEPw+wGh23/Mh8gNSVwglpc1AaW0CnlFVt4Xmv4j1zlbSon3829L0q5b8
 uLA0tMI3bHKV9eU9c9eJK4gs1N62y+1I7mkj+u4RXh8ORcchHOIDD4c2ANJmI7BhrAdx
 olj7QhG5PG0KFCcsgD7IUV/518R3Pw7sfw4tt+4OSMzq9zx6hlKIaDkvtjh5DCS9PWbp
 9m6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741289198; x=1741893998;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yNcfgkruRbdQ2LTcDlb82l2rtv263h9UvbuoZgmPSdM=;
 b=YNvCJe+esjqzfqeDQ+BU885qxt/POWm8T2FfPbXQl/xHOC0gwMbXpqwHBMLeg7WfH7
 SNn2n57KGX9+R4KzGbILGhuzwm7UcQOLKtz+Zo7tNvcswIR2YSFiYl2DXJRaqD7gwc4X
 3J9uLiK9gqUKvne1UlIGuosQhYpN2GQ3qW/JWkT26oXrmVW7yjNOLW1pSTxoYuizAq8o
 NskP/1ZOJQ5W253FdFD6VoH5UIro1Mg7xlm1jlXd8PB1aWZE6zEAxGC6xaFC8FIlVkrM
 tiqn39dQ8u9YEtVzoGlke/g6tbNwEII7pnzifWjRc2PEhWylDELFF0O4drQkSIrVoYLL
 MQ1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSja/KW+7HfzDxCv+Ud+i8Xe8D6vM1r2+sXE+3VEyY3eabuioiOye3PkxgqxikoLuhWo+iUlBNuzGP@lists.freedesktop.org,
 AJvYcCW6eU9JQL3YrhDh6+iqdqCNe0Ue1L4rNmI698G7++hv69T2W9Ouiqhekn748dFrmQFqg+3B0jYra5HR/Ac=@lists.freedesktop.org,
 AJvYcCWCjFqk/N+SSKnOxmpHYlca6Fk96vlKEgQaTgQZdowBscQhyku3t7+WM7S1lpIiC8nUUzs6Bl49xw==@lists.freedesktop.org,
 AJvYcCWLp2W/pjpaHPkenxwoszpKux75BXDvYG5i74GClYjJYCY24/lTjneFia39GiPcgYZXWU75Q7CG+9Y=@lists.freedesktop.org,
 AJvYcCX4/uETl+fxvb50DOzk9xKJw1K+jFrBjMAUjePQRGxSVvn1Ll4UJeM1yeOI/9XRpTjYUTue3oPbV0E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvUr4s56TN/IA/8l8rWNSPUq+7OUvyIWgtjAkt1y0r6AxWMkaL
 wBoK9cGqKv++YKM1EXPS50iTO16TZXfMpOtINEBxyWgrBqolrE3B
X-Gm-Gg: ASbGncs2xFhGx2nxacC9Da2DKlgXMv31IM5pQKcU8rYUxWBsqA8u1iMMsTcdUOI9o3m
 rG6KYD56wdKQH6WWu6Dm0pDSDK1nzlRln+rUCAjjhXNkeCzeLC9vM5/cCSfHYLi55PSFCl+9nMS
 TIBBTe4MzFORMZyob5N0VcjbP2N87ExcnbUKVC0yXQdmHGaYFAALcXYgfPYOhB/tcW898ODVs5J
 /dZH1UR2x2JhQ8HsOSPrqmxFPdOF/7j8oFSptvng5UZpWUyOTItN1ItiuB9zEnxyTg/q6KsPEBZ
 XyL9bje8cvDnOprb+WCPVheYe+t8zEB3r3EBqrVDorOZ/3ACDdVvTj0EjsdWFW5ahKIMBXMVYYH
 l5CX95weQxBX7PHCfA5EGxmGlVa/GRKs=
X-Google-Smtp-Source: AGHT+IGse2HrwvQit3ez+Tb+IZmcWPgul6Oz1Of3MncB8IKv5GiNEYehZwUGHa/gmdRGfttFwUyGrw==
X-Received: by 2002:a5d:5f45:0:b0:390:eebc:6f32 with SMTP id
 ffacd0b85a97d-39132da8fecmr291664f8f.48.1741289198054; 
 Thu, 06 Mar 2025 11:26:38 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e1d67sm2905872f8f.74.2025.03.06.11.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 11:26:36 -0800 (PST)
Date: Thu, 6 Mar 2025 20:26:33 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, 
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
 Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v3 20/25] drm/tegra: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <mtsi7lohn4nq75y3mdzk7eomloxvswjn4blsmruutpejhppd5i@wexuiu7yfea3>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-21-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y6cp6aqkj6w24xiu"
Content-Disposition: inline
In-Reply-To: <20250218142542.438557-21-tzimmermann@suse.de>
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


--y6cp6aqkj6w24xiu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 20/25] drm/tegra: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 03:23:43PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch according to hardware requirements.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/gem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--y6cp6aqkj6w24xiu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ9ukACgkQ3SOs138+
s6GThw/9F553EWmmWz8ONopI5pY7Fy+Pu8kzqsU5bhKSKO2aqJ8y4PFOQAzaacO8
2HuvhLXsP6l91B+R49oebJTWnbgcl9ThzcA4njgdKRFc7yZU/EZUEUGdwDkU6qsh
/rkDnM+a+MzIAd3Z31B0Kvb0tUsl4e0UBueDHmjfP554dbtnMr94eIHuqLVRb1/D
LB6ddm8DbZVoDKT9Ji2gLQpW84oFuIzRZPOV8JmPe+wE8Xf6A9sLloqJndErnvHg
B8X2K8PzxkNNJGaZtQMUpiJ+S1oDNZnnKtzt0Wb+b9itJqUgykve29vGBDBImsb5
8JLFlkdPFdKpFsbAvGyHv8b+F2rDVu4Oelg88WWDUSMc9Ut274u5/a2DTUOwF806
DtCADAFUOOcIyDZKfPpeQuWDPeScN3/ANW8iQMlyPaNO5fBKlisFjiF1Bh0gS+vQ
shkKb74wChg/4jgq1+M+I4DPdCQRe0kGIqbNZ4yK71owOjoSE6WIxxEt0UUKxPwh
XZyf8ZF2O9TCPMigN6Qw2AGUhaC3HsAG9KbhOTSeUAsOwohFtYY+3B6Hkb8SQHEM
i05OutqXEhtdSZgBK+HuweZtYWCBfy/BcMeD99Rkg01C+aMZcNPGVLpvGqpryNaB
Ga0hQwFdIjbnMbXxjzyfJfs7GqNyTAJtpiqBO3uDhWH2LxJHZ7M=
=2m1E
-----END PGP SIGNATURE-----

--y6cp6aqkj6w24xiu--
