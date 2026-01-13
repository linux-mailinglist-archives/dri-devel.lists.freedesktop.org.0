Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902F7D1B0CA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 20:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2CF10E538;
	Tue, 13 Jan 2026 19:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="e9dUKdor";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6596810E538
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 19:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r/peNOTgTzGUFYVPiT7tpBUbzIfn4ZdTgKaGtsMJe5Q=; b=e9dUKdor4XnLs4+cbsWzD3cpi+
 31ZxfYMZWguc7zxDrnmFVDEG2blVr/YUXm2JSnSXmq4qDPxp7XBYqwbQkaVYgvZXvFm64yzzuGZEE
 DTpLT6MgaLDORrRfJzdMXRUH5XFUILq1Qqvwu+d/wWCD/HaKGMF5waRgUuBX1QIZ9X6G5OuZHC06H
 mVhd9aLoeCVdNhhjz05FanWhLTj0zrxX90vC+3J7rcG6PeHygdhpg75r7rtrSqzBXnQmhK/LavivX
 IXglOlpYJflfWEXpt8guB0PbECTc9sxnt3vlwPClbzhHbOG/UD9Ei8BJZ9lnfDaj+nDPbX3aW11Ea
 0FHQy67g==;
Received: from [187.36.210.68] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256)
 (Exim) id 1vfk5q-004ymG-8d; Tue, 13 Jan 2026 20:30:18 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-dev@igalia.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] arm64: dts: broadcom: bcm2712: Add V3D device node
Date: Tue, 13 Jan 2026 16:28:21 -0300
Message-ID: <20260113192902.48046-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Commits 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D 7.x")
and 6fd9487147c4 ("drm/v3d: add brcm,2712-v3d as a compatible V3D device")
added driver support for V3D on BCM2712, but the corresponding device
tree node is still missing.

Add the V3D device tree node to the BCM2712 DTS.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 .../boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  |  4 ++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 7d4742ebe247..97522c6803c5 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -247,3 +247,7 @@ &pcie1 {
 &pcie2 {
 	status = "okay";
 };
+
+&v3d {
+	clocks = <&firmware_clocks 5>;
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 330a121ebfcb..4c9c63fcf037 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/bcm2835-pm.h>
 
 / {
 	compatible = "brcm,bcm2712";
@@ -642,6 +643,19 @@ mip1: msi-controller@1000131000 {
 			msi-ranges = <&gicv2 GIC_SPI 247 IRQ_TYPE_EDGE_RISING 8>;
 			brcm,msi-offset = <8>;
 		};
+
+		v3d: gpu@2000000 {
+			compatible = "brcm,2712-v3d";
+			reg = <0x10 0x02000000 0x0 0x4000>,
+			      <0x10 0x02008000 0x0 0x6000>,
+			      <0x10 0x02030800 0x0 0x0700>;
+			reg-names = "hub", "core0", "sms";
+
+			power-domains = <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
+			resets = <&pm BCM2835_RESET_V3D>;
+			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 
 	vc4: gpu {
-- 
2.52.0

