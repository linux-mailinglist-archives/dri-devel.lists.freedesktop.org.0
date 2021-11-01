Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5F0441A5D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 12:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BC389BF4;
	Mon,  1 Nov 2021 11:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7038489BF3
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 11:01:48 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1A1AcdbL037901;
 Mon, 1 Nov 2021 18:38:39 +0800 (GMT-8)
 (envelope-from tommy_huang@aspeedtech.com)
Received: from tommy0527-VirtualBox.aspeedtech.com (192.168.2.141) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Nov 2021 19:01:23 +0800
From: tommy-huang <tommy_huang@aspeedtech.com>
To: <joel@jms.id.au>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <andrew@aj.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] ARM: dts: aspeed: Add GFX node to AST2600
Date: Mon, 1 Nov 2021 19:01:04 +0800
Message-ID: <20211101110107.29010-2-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211101110107.29010-1-tommy_huang@aspeedtech.com>
References: <20211101110107.29010-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.141]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1A1AcdbL037901
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
Cc: BMC-SW@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joel Stanley <joel@jms.id.au>

The GFX device is present in the AST2600 SoC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: tommy-huang <tommy_huang@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 1b47be1704f8..e38c3742761b 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -351,6 +351,17 @@
 				quality = <100>;
 			};
 
+			gfx: display@1e6e6000 {
+				compatible = "aspeed,ast2600-gfx", "aspeed,ast2500-gfx", "syscon";
+				reg = <0x1e6e6000 0x1000>;
+				reg-io-width = <4>;
+				clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
+				resets = <&syscon ASPEED_RESET_GRAPHICS>;
+				syscon = <&syscon>;
+				status = "disabled";
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			xdma: xdma@1e6e7000 {
 				compatible = "aspeed,ast2600-xdma";
 				reg = <0x1e6e7000 0x100>;
-- 
2.17.1

