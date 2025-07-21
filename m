Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D384B0C77F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 17:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8609E10E2B6;
	Mon, 21 Jul 2025 15:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="N7F21LPI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6511C10E2B6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=N1dy7xoxRKl1sQ1tb4Ipkebpw3UhPsQ6Fu34IdYEgOA=; b=N7F21LPIdchD8+2O9CRvE6O6lI
 gX1sGnojJnysvzXKgRZSVl3qksY/yK/9djn9/YWNxOIWo7kFQbymnEjUusxPGd1xxRZxoe4sKglj0
 h5Dh1ridpadW6MvtjkAbPCgYeYBiRCxw1Sg96MnfuX+/9+opxxxztm6oYj0PzZmb1sgUJ4KI2NSYg
 3BVv4bX1JAQbphTSLHK+Me/8AOwc2onF5MjEXKI8VCbzpWtbhsMOvO5HiV0lI01ilo91r6z1ubpOv
 +Zu5Ulx51fV7sPn3ctWr48CQG/p3JV46sJ2rUHDQ9QNCIY9gs1FwB6HfVy+QTbCfCw1igvlrNNkf5
 K4zSFjWA==;
Received: from i53875b2e.versanet.de ([83.135.91.46] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1udsND-00047Z-91; Mon, 21 Jul 2025 17:24:15 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Mon, 21 Jul 2025 17:24:13 +0200
Message-ID: <4109088.mvXUDI8C0e@diego>
In-Reply-To: <b48c6694-2bd1-44d0-9dd1-1b7a67e22d87@oss.qualcomm.com>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
 <b48c6694-2bd1-44d0-9dd1-1b7a67e22d87@oss.qualcomm.com>
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

Hi Jeff,

Am Montag, 21. Juli 2025, 16:55:01 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Jeff Hugo:
> On 7/21/2025 3:17 AM, Tomeu Vizoso wrote:
> > This series adds a new driver for the NPU that Rockchip includes in its
> > newer SoCs, developed by them on the NVDLA base.
> >=20
> > In its current form, it supports the specific NPU in the RK3588 SoC.
> >=20
> > The userspace driver is part of Mesa and an initial draft can be found =
at:
> >=20
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> >=20
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>=20
> This (and the userspace component) appear ready for merge from what I=20
> can tell. Tomeu is still working on his drm-misc access so I've offered=20
> to merge on his behalf. Planning on waiting until Friday for any final=20
> feedback to come in before doing so.

sounds great.

Just to make sure, you're planning to merge patches 1-6 (driver + binding)
into drm-misc and I'll pick up the "arm64: dts: " patches 7-10 afterwards?

Heiko


