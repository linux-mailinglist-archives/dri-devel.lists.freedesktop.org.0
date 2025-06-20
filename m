Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20640AE1780
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 11:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B75A10E20D;
	Fri, 20 Jun 2025 09:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="E0xVwfeP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EC210E20D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=O0Z76gXzXASZvB45zMW7OBOfjiQs1Vtulp5U1K5X9+M=; b=E0xVwfePovI7zW07TkUrEmyv3u
 R6+iMMc2szMneU5Th+XbYLGrJMTI6wOnXneDpAa+NUznRovozXXGjIsRNZ3jM5XtXpaSvZ+1O50KY
 /YiANnD7+B6m3xmrAmSMjP/ADzGH+C6YP3KUnsrlFQtdCCWYW1TKw6kg35jrkVA8/N1yz/0KxnISa
 VrP5B9U/Y2f2kkmCCaa5m0sT8obSTTtEQZQ29fJbf2qyDFec7LH9Tvi5mpfWM2Npr8PKr7SZ2DGtm
 gE+NS9aCpNSgCLmcAC0mjhuBV8cJR6kxgEocCpeaFl2Hkr/s+H0fNHscRzNLwFSQ8wO+n2cjCxUnY
 61fY+D8A==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154]
 helo=phil.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uSY2z-0008Po-Kz; Fri, 20 Jun 2025 11:28:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Fri, 20 Jun 2025 11:28:32 +0200
Message-ID: <2241399.8hzESeGDPO@phil>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Freitag, 6. Juni 2025, 08:28:20 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Tomeu Vizoso:
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
>=20
> In its current form, it supports the specific NPU in the RK3588 SoC.
>=20
> The userspace driver is part of Mesa and an initial draft can be found at:
>=20
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
>=20
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

> ---
> Nicolas Frattaroli (2):
>       arm64: dts: rockchip: add pd_npu label for RK3588 power domains
>       arm64: dts: rockchip: enable NPU on ROCK 5B
>=20
> Tomeu Vizoso (8):
>       accel/rocket: Add registers header
>       accel/rocket: Add a new driver for Rockchip's NPU
>       accel/rocket: Add IOCTL for BO creation
>       accel/rocket: Add job submission IOCTL
>       accel/rocket: Add IOCTLs for synchronizing memory accesses
>       dt-bindings: npu: rockchip,rknn: Add bindings
>       arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base
>       arm64: dts: rockchip: Enable the NPU on quartzpro64

from a handling point of view, I would expect patch 1 - 6
(driver code + dt-binding patch) to go through some driver tree
but have not clue which one that is.

And afterwards, I would pick up the arm64 devicetree additions
patches 7 - 10 .


Heiko


