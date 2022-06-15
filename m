Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E1D54D459
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 00:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793A411390A;
	Wed, 15 Jun 2022 22:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CE111390A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 22:14:26 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E6DBA49;
 Thu, 16 Jun 2022 00:14:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655331264;
 bh=DIQENIdSE1gjW6Rzp/77O3mIdomiUrw1FaQO4jkW33s=;
 h=From:To:Cc:Subject:Date:From;
 b=nAfAXHt7/MeaG91uSDaJcUhelSVdIWJfcyewrDDMzEJ9Sc3XvXQnZ6TGb/4V3nCs9
 jZ9vP33r5yZXcPjSf8YsekumlnyM9kvYjouxLxnHDqdGDdrpmNQbw4DEhzbXeU4DN3
 gbxDjoSrV4KaH8exUaBHYLP+L7S2izjRzMyj/WP0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/6] dt-bindings: Add macros for video interface bus types
Date: Thu, 16 Jun 2022 01:14:04 +0300
Message-Id: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
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

Hello,

This small patch series is the result of me getting a bus-type numerical
value wrong in a device tree file and spending too long debugging the
issue. Hopefully there's nothing controversial here.

Compared to v2, the PARALLEL bus type came back to replace BT601, as it
turned out that BT601 doesn't actually describe what is usually referred
to as the parallel bus type. Patch 3/3 has been split in per-vendor
patches at the request of Alexandre Torgue.

Laurent Pinchart (6):
  dt-bindings: media: Add macros for video interface bus types
  dt-bindings: Use new video interface bus type macros in examples
  ARM: dts: freescale: Use new media bus type macros
  ARM: dts: omap: Use new media bus type macros
  ARM: dts: renesas: Use new media bus type macros
  ARM: dts: stm32: Use new media bus type macros

 .../display/bridge/analogix,anx7625.yaml         |  1 +
 .../devicetree/bindings/media/i2c/mipi-ccs.yaml  |  3 ++-
 .../bindings/media/i2c/ovti,ov772x.yaml          |  3 ++-
 .../bindings/media/marvell,mmp2-ccic.yaml        |  3 ++-
 .../bindings/media/microchip,xisc.yaml           |  3 ++-
 .../devicetree/bindings/media/st,stm32-dcmi.yaml |  4 +++-
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi          |  4 +++-
 arch/arm/boot/dts/omap3-n900.dts                 |  5 +++--
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts  | 11 +++++++----
 .../r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi    |  4 +++-
 .../r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi    |  4 +++-
 arch/arm/boot/dts/stm32429i-eval.dts             |  3 ++-
 arch/arm/boot/dts/stm32mp157c-ev1.dts            |  3 ++-
 include/dt-bindings/media/video-interfaces.h     | 16 ++++++++++++++++
 14 files changed, 51 insertions(+), 16 deletions(-)
 create mode 100644 include/dt-bindings/media/video-interfaces.h


base-commit: b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
-- 
Regards,

Laurent Pinchart

