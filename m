Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E23AD6D81
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 12:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BD710E755;
	Thu, 12 Jun 2025 10:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BaJzVZi5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0158110E755
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 10:22:34 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-607cc1a2bd8so1452039a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 03:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749723753; x=1750328553; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ELcPuvNKLZu6Ryw5rajS8NLZ+N5vs8CjzH8DFZ2k5qY=;
 b=BaJzVZi5NxXEhllZyBw1O+wK859fMcivLp4JUtwjTnmTADft47BtysHrQkoHt4LfKn
 d1mpvC++ubDdlEX5xSN8aqORNp1spRkhgyTAs8hSJoZzf1+uFpx+vPAKo9pXEVH4eACo
 op+JikkBJWdh2lqZ3HH93ZXvh+Y42M86S4lbTQ08qC3nOmTmzXtu5tQ6FOERSSLfOgPp
 3/ukMZqOczU/eYKb3y9L6IoJElZEB1wLUBO10MHGCi6lDrQnLjFzzvZyxn6zEHHuzKHC
 gwFy/tXlDOx0yC+PP0MKzRkI7no3no/cxSkbPtrfa6AAZs3yJAOp/8JJ0kKrrXghp3WQ
 j32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749723753; x=1750328553;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ELcPuvNKLZu6Ryw5rajS8NLZ+N5vs8CjzH8DFZ2k5qY=;
 b=EtEJidSt7ufjahSIysS2WbS/dVX5SqDaqTUXT/2CUNKZUoZj6JpCIe7ZFWU/l9ID+D
 N1pTI/TPiIyNwYp8Sl4l/YXjgXw67od5vb/pzseRKQNLfp9goHVJfPpbhaRonaC/orUR
 EXD4F4fQSSAviJkegXnTt/hb7JbhEmYmuTENz9ypYZfos1YRU+0/VDyPPuYOsZCqxrFe
 Cp1wtYl3W9b2X77EbU3J7YcjKMLwCIulvXeVHWuzMGteEOWmMk57+7THdOxXpGv9i4WT
 HyBAcgvCopFhF91hHFeKfCzXh4MQxnRy+C9CbBEM6F0Ya4ttpQS7Y71MEqqu23SCMu22
 TqHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP8kqocEUQjWNABUxGzez4dg5vVbazBMVga5ZtsYm7ejMoq7q3nPTZhBceGNphq/AV7I4Cv0H+Iwg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywvw82LKlc+1cRUNlIkZa/LJ0ch9bkdhH2tRJBu8ZbzBCnANtcS
 ao+3/IH2Dm8UFetScSl467Mo0GoTALrDUDBpKhJ5bFRL8MGRfeyrmDmA
X-Gm-Gg: ASbGncsj4soU3KNR492TwJd3S/Ghzz+4tapjZ40/BAT9/QgobKlj1G3/eGfO1v6YIaA
 MppYB//HBVtGaXnhqeE1PmGNhGUrMkjgrgIBMNg/yvM3olSTVY+VOQchLnpN/h8ttrcxTH94mia
 pG77zK0lx4wT2v0lAjFdUKpD2eNNt3n53AXod4REUXDIQ37x85M2ItARczek4G/2R1vp/JlxhFu
 khfeU371nUAwaJzxPat7eC3YRiB9UWHgrjI0tH3c7yR//v/6rpmjaHMLmP/DOuDNoyZSHlOcQSh
 yM+0cGLkSAzpp8ct+RsRel4Z8JrnpeP6O7fR8+L0qLQ3UXq0fUBWtuCOUnFEl53W0AKpdaAKZOO
 RjSmlNpBYcw==
X-Google-Smtp-Source: AGHT+IE0/bTYEFCNhrQjD7YEJLFi+GzwBTgnJRxUstfNcaX5VD81i0FvmEvIypNuTLGINT6BjMUjbg==
X-Received: by 2002:a05:6402:40c5:b0:607:f431:33f4 with SMTP id
 4fb4d7f45d1cf-6086b2a46c4mr1919282a12.16.1749723753038; 
 Thu, 12 Jun 2025 03:22:33 -0700 (PDT)
Received: from smtpclient.apple ([89.66.237.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6086a551a2esm939584a12.1.2025.06.12.03.22.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Jun 2025 03:22:32 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add HDMI PHY PLL clock source
 to VOP2 on rk3576
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250612-rk3576-hdmitx-fix-v1-3-4b11007d8675@collabora.com>
Date: Thu, 12 Jun 2025 12:22:19 +0200
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
 Andy Yan <andyshrk@163.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <01D5D2D8-392B-4926-884E-1A4FB87C03CF@gmail.com>
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
 <20250612-rk3576-hdmitx-fix-v1-3-4b11007d8675@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
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



> Wiadomo=C5=9B=C4=87 napisana przez Cristian Ciocaltea =
<cristian.ciocaltea@collabora.com> w dniu 11 cze 2025, o godz. 23:47:
>=20
> Since commit c871a311edf0 ("phy: rockchip: samsung-hdptx: Setup TMDS
> char rate via phy_configure_opts_hdmi"), the workaround of passing the
> rate from DW HDMI QP bridge driver via phy_set_bus_width() became
> partially broken, as it cannot reliably handle mode switches anymore.
>=20
> Attempting to fix this up at PHY level would not only introduce
> additional hacks, but it would also fail to adequately resolve the
> display issues that are a consequence of the system CRU limitations.
>=20
> Instead, proceed with the solution already implemented for RK3588: =
make
> use of the HDMI PHY PLL as a better suited DCLK source for VOP2. This
> will not only address the aforementioned problem, but it should also
> facilitate the proper operation of display modes up to 4K@60Hz.
>=20
> It's worth noting that anything above 4K@30Hz still requires high TMDS
> clock ratio and scrambling support, which hasn't been mainlined yet.
>=20
> Fixes: d74b842cab08 ("arm64: dts: rockchip: Add vop for rk3576")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi =
b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index =
6a13fe0c3513fb2ff7cd535aa70e3386c37696e4..b1ac23035dd789f0478bf10c78c74ef1=
67d94904 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1155,12 +1155,14 @@ vop: vop@27d00000 {
> <&cru HCLK_VOP>,
> <&cru DCLK_VP0>,
> <&cru DCLK_VP1>,
> - <&cru DCLK_VP2>;
> + <&cru DCLK_VP2>,
> + <&hdptxphy>;
> clock-names =3D "aclk",
>      "hclk",
>      "dclk_vp0",
>      "dclk_vp1",
> -      "dclk_vp2";
> +      "dclk_vp2",
> +      "pll_hdmiphy0";
> iommus =3D <&vop_mmu>;
> power-domains =3D <&power RK3576_PD_VOP>;
> rockchip,grf =3D <&sys_grf>;
>=20
> --=20
> 2.49.0
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

Cristian,
It fixes fractional hd modes for me on rk3576.
Thx for this fix!
 =20
