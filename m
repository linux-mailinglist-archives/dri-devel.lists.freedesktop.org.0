Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B3AAE4D7
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 17:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC4310E82B;
	Wed,  7 May 2025 15:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zx9GIpRW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FA110E82B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 15:31:28 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso33759525e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 08:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746631886; x=1747236686; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0LSqgehAHh+JF1zAqeuuqzRF3zBOcqXSPgCyduzWmBw=;
 b=Zx9GIpRWlayi/s+SqD5x8c/heU3ia0rXzeSozLkqEv4XF4U2MWOpevt+94nxiyuy2p
 anobxslk+zOEJd1+EGESmGjPGI/ZT++wAI+J2GZ+mmBzPgC+Iprm0EHFHJOuhvVYtSOP
 /YFT31xrFeDUZnoYV2/KmPci7MJc1I/VgdqW1om6fTtRu9MsY6GAdEckQRy9v26uQkUC
 +laa1/z3JJA7upqV0MUcaN1T362XgeZkB03941LQGx+RIgJFSGChK7a9xdKNsEvWxMJk
 uKaOcenuP0iEt/vMS1yBE1ZB0vmfqqt4VL1QpHHV0wsWQce6qY587cWSU3GlTx5HQmiJ
 M9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746631886; x=1747236686;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0LSqgehAHh+JF1zAqeuuqzRF3zBOcqXSPgCyduzWmBw=;
 b=vHhfSNMeNlvP4RUBcEt9scwdaHZWxr+WnaWJ+E/Ap01Uig+X/BfYZsRR8i8lmlWnAn
 Je7qpDoYyHNC1p8tCRBl4ZhudeWa/s/e+dZj0dDjndqsdGGi/vg0Cj+HFVhfnTuohIRj
 Ir0QWuvALqY7wIk1S8/K48ROQtLkBP2uzPpeHmcr1/gjjeIYXUpLJ6vjs6oxS1VSk23g
 Kv6yccEuSx3psvXPiWe0VRjolOIT/h1NpUMBAnab/+OxPcu5k8cJ0rQrefkMHskOuVuI
 mF5xUKpLxN3tHw84GWMOuVspyPKluMobS4QQA/XDbwO6JoMSRhtPSN3x0f4hGvzTcXcL
 50hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH31f01pk7OZ4zVNYHhSniiAx101SNPe+0mGduJUdrHZM5rljgm0sEjOJnm3UHxiRXobEzE+Gyo7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJ9PQXvdNNT9iN9MowwINJPXorTx/9QSQ2NvtFrZplfMPcph0h
 9Apt+PKVjcyE/4iu4cpijr+5NeukKt6igWMo8oTUnJZfZmsnOvFy
X-Gm-Gg: ASbGnctN7T18wDMHGrixdy+hInlrn2ETrT1JJgRarszwld7N4r3ZUb0EA7t+SGhzugw
 2vGbeNWA8mRTLdqnmU83UYqE46A9fXNJO251cLKPP4URdayjIfo9pYxaEnsD1Ccf8cGnbY0Aq6e
 LUs3kLGYl/Q+T46OAfvMldYY5IPVGo1UsgaJwlZ8c3C7+JSCtOCIIwzRaOuTmULPQC8CND7QoO6
 hCY4RtunZlWLhiyA7CE+ZexyaRIi7EhmcmitBmX7mQ1LhpEaIH8Xp3Qy01nGxTU5g4svjDkRfHa
 iXX0ajfw4Cy4e6IvZBdzH/AoVeF+L1lFtkG951SCQlLJmWewelj0SCUonRss3imQUnOP7CG/kjN
 oZfp5tiTVXSkjsw62Eh9KhgUM7PA=
X-Google-Smtp-Source: AGHT+IGc2KC7sLmOFv/xbHi+s6fMy0YISnDNcrSDbaVyUGPBE/I2B1P01JRPVbGQdHZVFeRriGjuDg==
X-Received: by 2002:a5d:5c84:0:b0:3a0:880f:1a87 with SMTP id
 ffacd0b85a97d-3a0b4a18043mr3369455f8f.51.1746631886486; 
 Wed, 07 May 2025 08:31:26 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b172b3sm17441656f8f.90.2025.05.07.08.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 08:31:25 -0700 (PDT)
Date: Wed, 7 May 2025 17:31:23 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Remove unneeded include
Message-ID: <yguq45oauqb43snpxg4yyldpwuqt3pz6abl2nwyb4hqmizukex@ecnoqfxpgd63>
References: <20250428153435.1013101-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="grb6ujg4rywgdmoe"
Content-Disposition: inline
In-Reply-To: <20250428153435.1013101-1-jonathanh@nvidia.com>
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


--grb6ujg4rywgdmoe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: Remove unneeded include
MIME-Version: 1.0

On Mon, Apr 28, 2025 at 04:34:35PM +0100, Jon Hunter wrote:
> The header file 'tegra_drm.h' is included in gem.c, but this file is
> already include 'drm.h'. Although there is no harm in including this
> file again, it is also not necessary. Furthermore, the header file is
> located under 'include/uapi/drm' so ideally the full path would be
> used to be explicit. For now, just remove from gem.c.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/gem.c | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thierry

--grb6ujg4rywgdmoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbfMYACgkQ3SOs138+
s6Hr5xAApRyArP5LkUAmRBwdE2IvtzFCUSQk47khrfXsQmXH2YETuF7/dxPPNt1Y
oZNPvbRtZhv6xJVJTs/Gj6KqFer2US3cKGsElXEH1YDBr87LD8ZDnZazP05nXR3d
QAteKKaKKvkBe90BSeNeaMa6m0VyR6GW2f4aeHrKsMP4viSEws5dhbX4NBS8s6YM
NMYix7hjwa3yfZC3FDDVV0LaGIIc6m6KHFj2WoX9BdLzIdOeUq2v2zgApQGNNoFt
f41E/Lt+nn7vcVAfFKofESnofBLGXoqfhsujeM+fJWRaTzJvvuKt3QREi2i/I175
KhT5TVodYxSrQIP6xnnSbkb7nRhBOYlajfdOuaP0na76WpAlUrxUYtLjY65twD2X
avP1EISGTcpx5q22wywamLig+S6Bg3H0MBTzPsyQh9sLbnO3YDZEeRhQIgCmp7oZ
5+zgoYr3CeaZYcr7FlAHFvPtisSg9d6OBxrG6YpMUQSqKcbIatD+jbKn1TiilZuo
/XH9oF0EH9YL5LNXHyeaWtNg59opx9dMmq6Ui/ADFuWm7mmin4214wIHxCLAnUrk
mnpfoSGaQzOOBZEMArnKA4z1UZYWn8tRlC7x/lhjVnBhznMRJDwMru7NjXRFP1YV
opsIpV0qW7atVBBv9KiJaNiVi20vK//S42wRxovEtkrkA0a08/c=
=p923
-----END PGP SIGNATURE-----

--grb6ujg4rywgdmoe--
