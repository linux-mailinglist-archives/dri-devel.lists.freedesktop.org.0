Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F0354D45D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 00:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA6D113911;
	Wed, 15 Jun 2022 22:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1295A113910
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 22:14:31 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 913511354;
 Thu, 16 Jun 2022 00:14:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655331269;
 bh=WUCF7s+BlwIqIfc9hYLLfbsvWKEkAwsfGc0cNn3ceHg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FL6DP2vw4qXA7p0OZFrSzijnQdCz3TkEkvQVxT/kj27iZfAsx3MmZxThRkZ2imLGD
 Fh0KfxIg91ZfqWl3n0Je4pQn00QvEhwZCmIR9yGpH4F40vwrXaX1mjaaF3adoI4Ou6
 XooP52HJg18ne/ZE9np2IJB7FVsSXlqWXpw4vUOk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/6] ARM: dts: freescale: Use new media bus type macros
Date: Thu, 16 Jun 2022 01:14:07 +0300
Message-Id: <20220615221410.27459-4-laurent.pinchart@ideasonboard.com>
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
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
index 1a18c41ce385..d98111f2100f 100644
--- a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
@@ -2,6 +2,8 @@
 //
 // Copyright (C) 2015 Freescale Semiconductor, Inc.
 
+#include <dt-bindings/media/video-interfaces.h>
+
 / {
 	chosen {
 		stdout-path = &uart1;
@@ -170,7 +172,7 @@ &csi {
 	port {
 		parallel_from_ov5640: endpoint {
 			remote-endpoint = <&ov5640_to_parallel>;
-			bus-type = <5>; /* Parallel bus */
+			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 		};
 	};
 };
-- 
Regards,

Laurent Pinchart

