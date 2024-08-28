Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D12962B59
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0373C10E575;
	Wed, 28 Aug 2024 15:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yz2ssMcM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C5910E575
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:10:34 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-428119da952so60389855e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 08:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724857833; x=1725462633; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hf+/pO9Jbr8XpYBQvk+Tih2tnZ7Dpxs2Y/EiTBdvHJI=;
 b=Yz2ssMcMm1aI6bYWwfnbuQhxJcU1Izlgweh2YeNAGd4TvSIdmQMc0ff8kaLyHtOzh5
 HU+HaTPjPPNTSncj3oIZ7ObGQRO9AJIbZ5i07N4AEWeumy+/oGpD7NyomCbU1KMITlCG
 HI8qYLdyE4qq1QViqEohdMS+edEWQdKqNmVxG0SUyLuaqc1Eh2Im1tmhfO1E8ejteh7M
 HhP2AvHioup1VH3GTuObWIIeiNmZT4pydYwEF1yrrbW1dUa0+IOICjRTE2GiKVCRw7po
 werpTZnPJjcCjG/TcQfykhACRlWl2v8Oz3Mw5dJBQuo7sk7+0pZrxM6bPmMcKeqXUydl
 iGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724857833; x=1725462633;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hf+/pO9Jbr8XpYBQvk+Tih2tnZ7Dpxs2Y/EiTBdvHJI=;
 b=C6qv3EB9aGWlMi1ugJ1SER+sgF+U5HJy3B2b7o7axzitNpNUPvBx8izZ+5WI37Yc5F
 ZLWYsYCbVD+3TlGssY9dnuNc3+Iw1fyuxZeuCIyH5Xf8ItOYpKVtG9ioe7dxY2Zvv2ym
 lMmzb5mPXP7AFmt0l73zfbK8zKvadn5FoY5Sgf3e6IHMxTyUQermRFjyx4DMbQhJX7pO
 TiDCN4DHxZJjHZez7D119iAZwulE1+cOHMxgSt/1XPcmVeQhOTGBlSX38H2LyRVUCMpG
 EXPVTWfzAcf0hyKC8JnotRDCRnFnIIuFGQeW4A6xLTNtzLsKqD7pGPxeOchJiqbmxC2A
 +lmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDEYqGHWB9UqF7iHP8EQoa9CWvfalndvNnknXH3POyhR8cNTy8E4d3p1M3ajZgAYiYdr0xfYPWPTE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNZI4zf2ybwkEowQW4IdUxY0pam6gSIDUYR4kKkoWGeEPz71VU
 U8oLC9M5d4CRXKbbzFodtYAv6LmHbcmGG/ZmQ6AomPXJSY4ot5RP
X-Google-Smtp-Source: AGHT+IF1msUZqCjsJwm9tof8rPh4adZ7QbALZK6GaW3ozxXnhRWKeALS9s/XD7RnAwvEXy+no7pX0w==
X-Received: by 2002:a05:600c:1d17:b0:426:64a2:5375 with SMTP id
 5b1f17b1804b1-42acc8d5247mr123060045e9.1.1724857832639; 
 Wed, 28 Aug 2024 08:10:32 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749b241923sm49086f8f.53.2024.08.28.08.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 08:10:32 -0700 (PDT)
Date: Wed, 28 Aug 2024 17:10:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Request syncpoint IRQs only during probe
Message-ID: <ub6oigutkk3uynribznlvcwumtwfb4rnmsuz4jbtu3b5xdhji2@prr6ymiljgkv>
References: <20240531070719.2138-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i6r6vxewgn4idtec"
Content-Disposition: inline
In-Reply-To: <20240531070719.2138-1-cyndis@kapsi.fi>
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


--i6r6vxewgn4idtec
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 10:07:18AM GMT, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> Syncpoint IRQs are currently requested in a code path that runs
> during resume. Due to this, we get multiple overlapping registered
> interrupt handlers as host1x is suspended and resumed.
>=20
> Rearrange interrupt code to only request IRQs during initialization.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.h        |  2 ++
>  drivers/gpu/host1x/hw/intr_hw.c | 37 +++------------------------------
>  drivers/gpu/host1x/intr.c       | 21 ++++++++++++++++++-
>  drivers/gpu/host1x/intr.h       |  5 +++++
>  4 files changed, 30 insertions(+), 35 deletions(-)

Sorry, I only stumbled across this now. Applied, thanks.

Thierry

--i6r6vxewgn4idtec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbPPeYACgkQ3SOs138+
s6H7mg//ZQ/qgenzp2bB5wja1AwPgcvbNCMoGG9BUEmHpvLNS1FIp3KgTrSvhqLM
0D80ZW16r3UDhQNqR9Q/M0kgOYBmcOeUgwP2eKcPa3kdFc9bydP64acIGRNtff+5
THCQzaZUQcYmPfzIgzSljRTuH0+HAcnQyeI/ecNW93SyeKqNFKwAbfCInYoZH2R6
8Em4wZ6xDJZkv9rvgP856p2LkBS5AYvGcI3MjhMUDa6DRz7BFcrZ/ADbusDjvHtz
X3dLpg+LWs1ho2gjE0fO/jJ9fp7Qu3W/zrCgr7syHqaMytxAa2trR+J97BkZK5C6
SD2UydGnqMH400YXwq52EdCDsRBLLtA4YaIm2xb2M/YZu2O2PJ1tChnX0EUl6LNa
/K7zKIUHMrPz7I4y/kjwB8f7Y4BebGMpDuOx1PAzstOmXOrminOCsR/MLacx88mr
RtIHPIv89VsSs8GM3CRRF4b6RXulYY6Ri9Lx0Nhp7Qg6EHfgHCg/oThYcRQ9Vl/J
aHqrQyBPPsPDXdsqn4h6uwpF70AsXR+zoyKOj6LrW7sAj07pejtfCtIL2se4CVwf
t2tUnM6UqmrB1/ptJdREAfLxFQ5G39+Yab66n7esgABpdbHLbRKZW8XwTIhgn5KC
V97LOAwxmNEOfI+vqV2Gofb+26qVTLlqeY7ztRD1iW9FcdOq4Bw=
=1XOT
-----END PGP SIGNATURE-----

--i6r6vxewgn4idtec--
