Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02D18D1FC5
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 17:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535C610FA2B;
	Tue, 28 May 2024 15:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECEE10FA2B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 15:09:56 +0000 (UTC)
Received: from [213.70.33.226] (helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sBySJ-0004pm-E9; Tue, 28 May 2024 17:09:39 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alex Bee <knaerzche@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andy Yan <andy.yan@rock-chips.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sandy Huang <hjc@rock-chips.com>,
 David Airlie <airlied@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/7] Add DSI support for RK3128
Date: Tue, 28 May 2024 17:09:23 +0200
Message-Id: <171690893341.1899981.5685030462624644928.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240509140653.168591-1-knaerzche@gmail.com>
References: <20240509140653.168591-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 9 May 2024 16:06:46 +0200, Alex Bee wrote:
> This series aims to add support for the DesignWare MIPI DSI controller and
> the Innoslicon D-PHY found in RK3128 SoCs. The code additions are rather
> tiny: It only need some code in the Rockchip dw-mipi-dsi glue layer for
> this SoC and do some changes in the SoC's clock driver. Support for the phy
> was already added when the Innosilicon D-PHY driver was initially
> submitted. I tested it with a 800x1280 DSI panel where all 4 lanes that are
> supported are used.
> 
> [...]

Applied, thanks!

[2/7] dt-bindings: clock: rk3128: Add PCLK_MIPIPHY
      commit: 14a1d1dc35d346a1523f38f6517c349dfa447a58
[3/7] clk: rockchip: rk3128: Export PCLK_MIPIPHY
      commit: 577c04fbf255f81f26507a7ffb2477fce50c214d
[4/7] clk: rockchip: rk3128: Add hclk_vio_h2p to critical clocks
      commit: e745698209837a952d4515bc02cddd5a31a644b9
[6/7] ARM: dts: rockchip: Add D-PHY for RK3128
      commit: 45b22b83e00b1ec36d5de53b797cd9d8545a0d34
[7/7] ARM: dts: rockchip: Add DSI for RK3128
      commit: 73fc389129dfe22b5706b4b6cbc1a4f86d1fbc1b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
