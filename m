Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657A954D45E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 00:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4115113910;
	Wed, 15 Jun 2022 22:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF1D1138F2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 22:14:32 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09FED1440;
 Thu, 16 Jun 2022 00:14:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655331271;
 bh=CvmefkoiMCCllfPdCZdsUzGM5N3XWshqkLSA6CI/9hg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R5mbdHU0rHEAKrnJVpCCMtEc8+sg9w1HwIDAqFxJiJkWMFlCsCFV6E/UO+l8qft6U
 sFqNk2sAo+k8CCfJWs/TnUFyI52znZimLRKRsu712Pj+e4o3VPhFQofps9R4x2YaoH
 6dPkCwMzbp21VlDJYXtrgTvrGhv9R/D50Vbumoy0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/6] ARM: dts: omap: Use new media bus type macros
Date: Thu, 16 Jun 2022 01:14:08 +0300
Message-Id: <20220615221410.27459-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Jacopo Mondi <jacopo@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that a header exists with macros for the media interface bus-type
values, replace hardcoding numerical constants with the corresponding
macros in the DT sources.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/omap3-n900.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index d40c3d2c4914..9cad9d6a83e2 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -9,6 +9,7 @@
 #include "omap34xx.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 
 /*
  * Default secure signed bootloader (Nokia X-Loader) does not enable L3 firewall
@@ -194,7 +195,7 @@ port@1 {
 
 			csi_isp: endpoint {
 				remote-endpoint = <&csi_cam1>;
-				bus-type = <3>; /* CCP2 */
+				bus-type = <MEDIA_BUS_TYPE_CCP2>;
 				clock-lanes = <1>;
 				data-lanes = <0>;
 				lane-polarity = <0 0>;
@@ -835,7 +836,7 @@ cam1: camera@3e {
 
 		port {
 			csi_cam1: endpoint {
-				bus-type = <3>; /* CCP2 */
+				bus-type = <MEDIA_BUS_TYPE_CCP2>;
 				strobe = <1>;
 				clock-inv = <0>;
 				crc = <1>;
-- 
Regards,

Laurent Pinchart

