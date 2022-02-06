Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A64AB737
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 10:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D7F10E33F;
	Mon,  7 Feb 2022 09:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1194 seconds by postgrey-1.36 at gabe;
 Sun, 06 Feb 2022 08:20:37 UTC
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E2B10E3C7
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 08:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UtDHnov5d0OtIQeYLlHOaaJhlsYZLUbYnfZ7b9x4A78=; b=XWN2I+sBhihf8RWlnThBNBnXZl
 zvzm4R6C/0wg7D1MD3TcN/lr2FeYKaMyO67dhqwe7dxjO/DjhpWx2yzwnX92xghn1rJ5VStRgrrKp
 RX/2XR0w4Y6JQ9z5X8MBetJIr7GjAGb4y+hCbcIzuRLYFYuNbZju1DkylM5KtWuE0M5M=;
Received: from p200300ccff05f6001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff05:f600:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1nGcTL-0006Ve-BE; Sun, 06 Feb 2022 09:00:36 +0100
Received: from andi by aktux with local (Exim 4.94.2)
 (envelope-from <andreas@kemnade.info>)
 id 1nGcTK-003LEs-QO; Sun, 06 Feb 2022 09:00:34 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 andreas@kemnade.info, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alistair@alistair23.me, samuel@sholland.org,
 josua.mayer@jm0.eu, letux-kernel@openphoenux.org
Subject: [RFC PATCH 5/6] ARM: dts: imx6sll: add EPDC
Date: Sun,  6 Feb 2022 09:00:15 +0100
Message-Id: <20220206080016.796556-6-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206080016.796556-1-andreas@kemnade.info>
References: <20220206080016.796556-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Mon, 07 Feb 2022 09:09:20 +0000
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

The commercial variant has a controller for e-Paper displays.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/imx6sll.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
index d4a000c3dde7..042e8a391b2f 100644
--- a/arch/arm/boot/dts/imx6sll.dtsi
+++ b/arch/arm/boot/dts/imx6sll.dtsi
@@ -643,6 +643,15 @@ pxp: pxp@20f0000 {
 				clock-names = "axi";
 			};
 
+			epdc: epdc@20f4000 {
+				compatible = "fsl,imx6sll-epdc";
+				reg = <0x020f4000 0x4000>;
+				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_EPDC_AXI>, <&clks IMX6SLL_CLK_EPDC_PIX>;
+				clock-names = "axi", "pix";
+				status = "disabled";
+			};
+
 			lcdif: lcd-controller@20f8000 {
 				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
-- 
2.30.2

