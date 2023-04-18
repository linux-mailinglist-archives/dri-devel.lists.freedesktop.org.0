Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6B06E8B0A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A18010EB9F;
	Thu, 20 Apr 2023 07:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862D210E6AA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 07:40:58 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
 by mail.gandi.net (Postfix) with ESMTPSA id CE320FF80B;
 Tue, 18 Apr 2023 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
 t=1681803657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S23886ftCV2z3JzYA86agYfVu4I9nMhyGAcsGtlcMm8=;
 b=KqlPh3QYAhMULC+tUHT6fKDlldWSan9BP+wzcUnwqTptWA3xHs6WPMAX8ATFDDqGmGKAqG
 deAgqYnh+zZ6BPJFdCu+Ri+cWVow+Wgk+pi+EjxjqDVWpyZZwC90K+XowyaY7KKosN6z5R
 pF4GmBeuGH1MJti+gQztzLPvC8+4biLctajpgfmlFSL6P9aeyid8tm5m2p3+JNc3GS/88b
 GqHb/norXazE7TzuxCmYLxW4kYGCnBGEOQDO/g2a1vNuEeIPi5GvJebNVB8x3+IHQ2DdXs
 OtR+AXkfY67hQkxcT1yYgcDxW4s0sR53Pxp0F1q00skCWFBhbAVGnn34RaiuTg==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 4/7] arm64: dts: allwinner: a64: assign PLL_MIPI to
 CLK_TCON0
Date: Tue, 18 Apr 2023 09:40:05 +0200
Message-Id: <20230418074008.69752-5-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20230418074008.69752-1-me@crly.cz>
References: <20230418074008.69752-1-me@crly.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: linux-kernel@vger.kernel.org, Frank Oltmanns <frank@oltmanns.dev>,
 dri-devel@lists.freedesktop.org, Roman Beranek <me@crly.cz>,
 Ondrej Jirman <megi@xff.cz>, Icenowy Zheng <icenowy@aosp.io>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assign pll-mipi parent to tcon0's source clock via 'assigned-clocks'.

Signed-off-by: Roman Beranek <me@crly.cz>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 62f45f71ec65..e6a194db420d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -411,6 +411,8 @@ tcon0: lcd-controller@1c0c000 {
 			#clock-cells = <0>;
 			resets = <&ccu RST_BUS_TCON0>, <&ccu RST_BUS_LVDS>;
 			reset-names = "lcd", "lvds";
+			assigned-clocks = <&ccu CLK_TCON0>;
+			assigned-clock-parents = <&ccu CLK_PLL_MIPI>;
 
 			ports {
 				#address-cells = <1>;
-- 
2.34.1


