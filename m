Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB41D38A92
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 01:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2999610E090;
	Sat, 17 Jan 2026 00:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ddl/azSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD5D10E090
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 00:19:44 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47d6a1f08bbso9069975e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 16:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768609182; x=1769213982; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Qr4dd4sRl6alXbR76AfI/u+BBUeNx88I+aVBJKJ/FKc=;
 b=ddl/azSmIDU3XtDPvz+QE9JYhUxkmpWwr6kPirqF4yFFF35wF5UWzNiYjYSnhSX7OC
 qpTeWYJ07L0XBj5t10CFjouZmy3tJOwsxhLL9SwEcfZDcweky9f9svdGkDLePXITHqjw
 Nu1fHuvQqtjHDLBmTDl1/AQSpVUKIvPDRiYNSinwaMWBLWWAV8kzyHKeqA55uayfd09U
 ntMcVfQzADl4JOAQy6icFLK+siwr5NAru6Eo7vncur++cgWIggGj/nfephMZBJZCZ/gc
 /3HZZ64VkfeWe2wsv6L92FY5oSmBqIm2TvCABowg2CvVQyljRIyfCoSs5mtk7rBmffR4
 e3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768609182; x=1769213982;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qr4dd4sRl6alXbR76AfI/u+BBUeNx88I+aVBJKJ/FKc=;
 b=qSx+vho3M3dggpff12E2DJQvFgO8d1mqGvDB4e6Twm8Ioll6PcP50A1oF0UbZBCAiO
 07FN0sAxPfmeCMyyH9mur5XxW4ziO0RcPFpC6XE8ZVXhzfQnKdm1rHN87YYMgn8aUMJj
 FyMFg2/YgV2fKQtX9yCEPGQkUq7qs4mSD4AAde/4lTGWLdF9Rwmr6WLBmZCJvcPrj1dC
 qa4qwwrCs74W4WkwII6bpGWL9eSnBY5uH3NHOfs/WcXCEiS0EJv9aWtb7Bt/rsMteZuL
 HijGXar4BmuxPW9I3NY4pjfkpDfNDf+NW//T0N8FZ1fShEzAr5faGUpNltxVjij1LC1j
 iAOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfyJtgwf/HZGlaaMtfGMEVw8OyNlhJNgsx+LvSTSfYFVTTe660WIB/jg9TcXT/MXXOUQSa6qs9Y88=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRkqC501TBk3ua0nmKcFG4qPkr1nXreBsE503SM7Tp7FpV0vLF
 Dbgt6Aq6npXbzdYxUfQiCATHzrFcac/wMGbD4lKYxWu1VPunqQ1+EnNh
X-Gm-Gg: AY/fxX6DP7f+T5r18ZwN7VGCpSIigAGiFR99/q9wPiO2dJpQ3suhyvyqwxUPJyr4f1G
 0+0Uv5bPZiLBUyJptvmwxtwExGe9wJM0AhQmvUEINx6etaugtrLQq6bK3buFVCJ+4JvlwdHHitQ
 0vcU3FMhmEtyOo9BBv01WqzODarC5q2FHVgcZRYDY8SqdwaGfkisPR1uub8RW6/s22c7zE9abHj
 ULiyFo2f3aU961pp8Sck2N/BecAZyb2c8c/aaxMbRVDm/UIwgRejOqKCW7EW2JijLsiSDtyYRvo
 r1oP3YpTFSnmdCa5NtB58AWI4qHfnWiAxLmBzINLZ34S0yQRr5xCMtGTUZTqfM0/c9GR7TXJJOK
 no7ihyZevZWm43mXT45MmnKyR9hQvy9NiOasUtyW95kmdaibsiHu0tbh3WzcT70nbpVw5qAwiZn
 PpOAteCYQZUlMViyj/pegGjbgkXxCmhNZatXOxpwoyWOUW5YxeqPykR62Q21tmDjekBV9zN5c0F
 A==
X-Received: by 2002:a05:600c:6091:b0:480:1a9a:e571 with SMTP id
 5b1f17b1804b1-4801eb04160mr48471585e9.22.1768609182440; 
 Fri, 16 Jan 2026 16:19:42 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f4289b7aasm124804445e9.2.2026.01.16.16.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 16:19:40 -0800 (PST)
Date: Sat, 17 Jan 2026 01:19:38 +0100
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
Subject: Re: [PATCH v2 4/4 RESEND] ARM: tegra: adjust DSI nodes for
 Tegra20/Tegra30
Message-ID: <aWrVjkNzmowjPr0i@orome>
References: <20251204061703.5579-1-clamor95@gmail.com>
 <20251204061703.5579-5-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3ps3p3ummquvspuh"
Content-Disposition: inline
In-Reply-To: <20251204061703.5579-5-clamor95@gmail.com>
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


--3ps3p3ummquvspuh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/4 RESEND] ARM: tegra: adjust DSI nodes for
 Tegra20/Tegra30
MIME-Version: 1.0

On Thu, Dec 04, 2025 at 08:17:03AM +0200, Svyatoslav Ryhel wrote:
> Add missing nvidia,mipi-calibrate and cells properties to DSI nodes.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra20.dtsi | 4 ++++
>  arch/arm/boot/dts/nvidia/tegra30.dtsi | 8 ++++++++
>  2 files changed, 12 insertions(+)

Applied, thanks.

Thierry

--3ps3p3ummquvspuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlq1ZoACgkQ3SOs138+
s6FU/Q/+JnHz4z3iaM5N3GbdNqivjMvosUv7yPpTe+rH1fd0qedCwH/Ozg5mOBAA
fj89b6CFl8jNcxU26br2W7ePbJCqnz9+SENaMtlKZbUMXOd5rDzcdie2PMSclLxH
vC2ycq79lAOsKcUWCClkQb5vqR2Dny0w+Ph3Z94DhdxCpW0/NWWswmT8NePMsiNK
dgFtnWfsbzDYLzuNi6tSfngA4sHR68lmmoywqje+s4L1LEgCjVQlbJLDt7ztniOt
zp9kkVMbF03fOeyjk0L6iw+0MEHHGpCWWBqg5A0YG54vwot0kkb8E97tdJUBQJ9K
2vgxQ5hrsAYcJVh0h9SSiAsVXKJq5gu+0grEiFClSZbHMbFb5+J003t8Stk+2CwP
vKtIurLRZ65Dn3eQt2p7trRJzjfdQcSmATMUeoEqV0ledh40y2b/ACm8OgtE0HTq
hEJYyaOjbKUHxy5Asmp9Ioe7iDaXlOlK0L2w+ZAP0Hxaaem1Zfr9RRkA1wZIdhsy
/8ao0kVBfZCC0l8vN8/wEQm+3+P6QS45JpqCe4xj8OgJozy8qZU53UJVr1T9cc+l
BUuegRtXLa3Lv3vnxfHkQvNJ1CiwyrOEzFwOsoC5fjvToYWY0zQ5WSF/jW6+8yeH
yjb9+tfoli6Gml1zk63cL3Srqflb5bX2FxXT4dxCAvU3V1ErZtY=
=KaHS
-----END PGP SIGNATURE-----

--3ps3p3ummquvspuh--
