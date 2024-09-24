Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D70984720
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 15:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F059889D8E;
	Tue, 24 Sep 2024 13:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JRG32gE1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CE889D8E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 13:58:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B5D41A4263A;
 Tue, 24 Sep 2024 13:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC29C4CECD;
 Tue, 24 Sep 2024 13:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727186338;
 bh=wOmAV/NVLES4Ot48enknKQtgF1inWU6rd8X6FWlO0uM=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=JRG32gE1VKNj4N+5DNAxkHvHz/CX1JdjHGhy9bm28gSPxCjinn+c5Tuo1TiBbChXM
 mUpbI0EVjkhhdCAr4pT/ctEN7TPDayOO4gn+88agO/VctgNpiGW2olGHNcP4qtMhDz
 TNYPBA39zkbx7w2NVZGSqteanVouQvXE3Dp1mBDy6qtdbvRTbpex909QA6pjXdehbM
 kdoKkTZPxwunnXwKV/hWPA1hRCAkUxsFsWz9sQTFvert+qZhIEUeJxN+dHk4i7UIl/
 huU8XLhyuxIsZRbiz4NPO655yyR1Cs8qC1IoSLOruIyFoLJq+Rrci0tSglT1v857TB
 GNTAZMsNMTiLg==
Message-ID: <097f09d73db95dddcccfec9008e2a362@kernel.org>
Date: Tue, 24 Sep 2024 13:58:56 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v7 1/3] drm/bridge: synopsys: Add DW HDMI QP TX
 Controller support library
In-Reply-To: <20240914-b4-rk3588-bridge-upstream-v7-1-2b1348137123@collabora.com>
References: <20240914-b4-rk3588-bridge-upstream-v7-1-2b1348137123@collabora.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Alexandre
 ARNOUD" <aarnoud@me.com>, "Algea Cao" <algea.cao@rock-chips.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "Conor
 Dooley" <conor+dt@kernel.org>, "David Airlie" <airlied@gmail.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Luis de Arquer" <ldearquer@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Mark Yao" <markyao0591@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Robert Foss" <rfoss@kernel.org>,
 "Sandy Huang" <hjc@rock-chips.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Simona Vetter" <simona.vetter@ffwll.ch>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Sat, 14 Sep 2024 21:56:51 +0300, Cristian Ciocaltea wrote:
> The Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX Controller IP
> supports the following features, among others:
> 
> * Fixed Rate Link (FRL)
> * Display Stream Compression (DSC)
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
