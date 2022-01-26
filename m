Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6155449CD0B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 15:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDDC10E676;
	Wed, 26 Jan 2022 14:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B237F10E67A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 14:58:24 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nCjkb-0005fL-RY; Wed, 26 Jan 2022 15:58:21 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nCjka-002l6a-Jp; Wed, 26 Jan 2022 15:58:20 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/27] clk: rockchip: rk3568: Add more PLL rates
Date: Wed, 26 Jan 2022 15:55:33 +0100
Message-Id: <20220126145549.617165-12-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220126145549.617165-1-s.hauer@pengutronix.de>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a few more PLL settings needed for some standard resolutions:

297MHz    3840x2160-30.00
241.5MHz  2560x1440-59.95
135MHz    1280x1024-75.02
119MHz    1680x1050-59.88
108MHz    1280x1024-60.02
 78.75MHz 1024x768-75.03

Changes since v3:
- new patch

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/rockchip/clk-rk3568.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index 69a9e8069a48..9d889fc46811 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -71,11 +71,17 @@ static struct rockchip_pll_rate_table rk3568_pll_rates[] = {
 	RK3036_PLL_RATE(500000000, 1, 125, 6, 1, 1, 0),
 	RK3036_PLL_RATE(408000000, 1, 68, 2, 2, 1, 0),
 	RK3036_PLL_RATE(312000000, 1, 78, 6, 1, 1, 0),
+	RK3036_PLL_RATE(297000000, 2, 99, 4, 1, 1, 0),
+	RK3036_PLL_RATE(241500000, 2, 161, 4, 2, 1, 0),
 	RK3036_PLL_RATE(216000000, 1, 72, 4, 2, 1, 0),
 	RK3036_PLL_RATE(200000000, 1, 100, 3, 4, 1, 0),
 	RK3036_PLL_RATE(148500000, 1, 99, 4, 4, 1, 0),
+	RK3036_PLL_RATE(135000000, 2, 45, 4, 1, 1, 0),
+	RK3036_PLL_RATE(119000000, 3, 119, 4, 2, 1, 0),
+	RK3036_PLL_RATE(108000000, 2, 45, 5, 1, 1, 0),
 	RK3036_PLL_RATE(100000000, 1, 150, 6, 6, 1, 0),
 	RK3036_PLL_RATE(96000000, 1, 96, 6, 4, 1, 0),
+	RK3036_PLL_RATE(78750000, 1, 96, 6, 4, 1, 0),
 	RK3036_PLL_RATE(74250000, 2, 99, 4, 4, 1, 0),
 	{ /* sentinel */ },
 };
-- 
2.30.2

