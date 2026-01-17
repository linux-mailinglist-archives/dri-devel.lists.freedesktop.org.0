Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED171D38A97
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 01:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2EB10E26B;
	Sat, 17 Jan 2026 00:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TM5ClUEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE16C10E26B
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 00:20:08 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2ae61424095so2843914eec.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 16:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768609208; x=1769214008; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cczEx05352KICGWcEnd+Dlv+PGQV2cIqtx8pi5Cp/Qo=;
 b=TM5ClUEqii17CyCURm7foHbJmy35SPtxYyj5a7RmgmM+jxpxJFRrQ/wdUfCFhoHIcl
 aGempmrK8ISMzmEADo6p8ADNMA4uYCm5TjncUutSjzk2clmxxBiUmFJiYORpXvRS3HA9
 gGPPnyyaro+XGXMqd6JnFyaaCsfZnHP1EHGgLjDH1/XZncQAglMttLccpOpt2D4+b8fX
 +rHNVG2aLhRUmvlQYcRYIZdxJJy1oQTjDJJndOZ2miSLDq4Ws8Pk9JPBqpWEU8Dumre/
 HYhsjIYT/1raUH3BpvgoNa19qh6jLrqU27gyESpJn/LZFd1QX2HCsQNywnGKaR+1n61C
 lRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768609208; x=1769214008;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cczEx05352KICGWcEnd+Dlv+PGQV2cIqtx8pi5Cp/Qo=;
 b=E1J+NC9rn1KHYr8uSp2kIZZ2Rgy5o1Rz3FBSHLU/QJzBHPM9R0dr//pZA7caohLqXU
 VUZErjow87d9DFvhxdZ0kuZAx9POxbPb+Ln4A68EOkPPhGJw9SO7TY+6BFJNyC6nbXLy
 dJx1ySOODtpD6tSFvNiK11cXlKHUBdKXKmesoarij+XTlcVFw0WSvVsknyipoI9hqC3i
 1AE3AYdOdeHHeIoyhPfNJ+Fz33joiZmQtkfDFiBLMrqMDuwZndOQapVLUjJg0CoFm2nI
 VusTx/GrxBFUThP3Jok1e8bmlw+Fv9GNMvF948ljp5IXE9zXDPSuuMT5KoS1IwUHIEO7
 wDig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpZx/wk0Mb8dYrTv0n7BU0hC3t3M18tziANBckpRfr+gIbNjkd9ICFpr9Yp3f406vlP/mXRgD6cjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5q1eA0+LxmpqZOp0Y8UuDm9m3yrUHwngY8JSlJ8SvvE4e5lQ8
 D1Pz6JX19OSmQ5p/vgwBOQnJsTvA8ViSJNp294iHD55gkklNIg6L5zcB
X-Gm-Gg: AY/fxX5xl/LsL9s/JgHvz5+u1HDMd7XvLza9lJzdX2iOHjglJfQJknmrLOe2XlcQU8l
 PrDQt7ZX/VySpYwNs1YyWfuuYOdt0iXKCwXpXpndQthIaRiwZT7ugA0MiIfU3IS0YDcIV75UqdM
 blZgN4CZTMjoN5S17Xnm3Uf5J9URx1MSlFTYHnTb9gzTREJx2cbBQM8gjMvNuZ6471NLvYq5kd6
 /Yoxo+PVIe8Obi0NqZdBTq55zvatvlVVgdltTv5BTp470g9rrHU7YGzaTsbk97+ECid8KfRPsMu
 G+SU/xlc5rbHNqyyIwjoc1C1AOVXGkqtQLDxB70lsJSluRZN9PW9BP8fFXAzY2KfUpNJ78sv7yv
 MsCnFqJVY8+XfpB37EfvFK1/DIY5Orpxr6wiT5yn5wcQyBgfPCD8E08DEm/mGsf6mUzDf2Tjy8S
 2fF60ljC726Mu3CoEp0D6GDZtNRAgTbtVKxXtbSmChSRjeYlmd2IsTWAsgC7SiNqzDWVZ8mFmyS
 w==
X-Received: by 2002:a05:7301:1e85:b0:2ae:546a:f2c3 with SMTP id
 5a478bee46e88-2b6b46d2dd9mr3435395eec.3.1768609207520; 
 Fri, 16 Jan 2026 16:20:07 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6b36550dfsm3932999eec.25.2026.01.16.16.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 16:20:06 -0800 (PST)
Date: Sat, 17 Jan 2026 01:19:59 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4 RESEND] clk: tegra20: reparent dsi clock to
 pll_d_out0
Message-ID: <aWrVplD0jfx-JM1v@orome>
References: <20251204061703.5579-1-clamor95@gmail.com>
 <20251204061703.5579-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jaydkfl2lwerisz4"
Content-Disposition: inline
In-Reply-To: <20251204061703.5579-2-clamor95@gmail.com>
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


--jaydkfl2lwerisz4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4 RESEND] clk: tegra20: reparent dsi clock to
 pll_d_out0
MIME-Version: 1.0

On Thu, Dec 04, 2025 at 08:17:00AM +0200, Svyatoslav Ryhel wrote:
> Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--jaydkfl2lwerisz4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlq1a8ACgkQ3SOs138+
s6G7cg/+Nqq8drdePQg7ZDPcGam2jT1OJFozjkQqShUwbw65NT30Ld24jWkBEDET
V66VMxWnuD+FqJUtmYFgBgP+09riMOIn1kjUwq48fs2/gTigorAcdLx60a80NuP3
uBece6NnnstpG/euRgY5blBwruOhTSyLnu9JPOVnnRSAoRncMndRKLWRykAn201U
ikxuUD7pdh2KLMbPDdqQaTgE/IyyEqjmtt8N50vHBLOZZAvgxaG7UwQsf5RH/KUh
GbB1fyfApGFoCvVJJT+Y3RIH1R0UA7Cz2iQ9BpnWq0qKZbRdx2aD3YoEhsAXT+qu
U/bY+kcvYwshKoxl1KQoM3jkk0k4V7QoN03fnjyR21ZsXjnQzf0RKu/0UzC1BK5y
vLBkf9olK7gFjgLDjrXEzKQUB3sIY/YGWig21onNSMU69zB+JOB6Y8ClDIOoyyJY
HtzjYhTgsuwPMi1vocOk2HrDTlWl7KYZOOi2y00YGp8/bOhWoOvP9z7D4AcbR3zW
kV248pj2Mzd/4/k0H2k69lMZeoBlXZnxAtK07aADqo7eRqYEFUjaESqAPSn7y1OL
5wSs+0gnrfv7vEAC5r1wJ5e+VEXk20ErPvTfzrbQtmo98iyWuRLvR1e7t5X9vuAj
BP+2EYu0xjdpPW9R9wuZG04CSNWKx4490GPl+9UTm8BmHsO5kPk=
=bC1o
-----END PGP SIGNATURE-----

--jaydkfl2lwerisz4--
