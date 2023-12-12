Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D8980E51E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 08:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EC310E585;
	Tue, 12 Dec 2023 07:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F75010E55F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702367584; x=1733903584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AhWzgG5JBZA91dtYGK71jseVlS3Ro3TRfueYkKDlujM=;
 b=Da6mj4IvG5ZkaH85XNf3gbGK8h2Y65QkdaWloZV8vr4vyYL+WqQW7LmD
 H8J9A4hoQTh6iyTR1Yz/hnfWDM0JYecSYdUJvAZtmRGq3dxDruyAVlyuL
 OqQt7rhu8fFc4BLH/nQmJbFMSL8Mf1Ly9+suRPPk4rQHPRsKTafR5IlC/
 xi//tU1WZ/6bhGsh0S6WI7CXe+qVYf0txYGEEfQuRw8iwWfxZXsF2q4bX
 wO8Of7Z/fJt+DqlOoYPa9eDz80TS5k8ovFDUj9EorVDM5SeOV4h45BbNx
 yKDKUp4lpmbgsqU6gIgonEK3tvGvI7pPkd+wTzK5998R9EizBXharjklJ A==;
X-IronPort-AV: E=Sophos;i="6.04,269,1695679200"; d="scan'208";a="34448097"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Dec 2023 08:53:00 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B49C9280084;
 Tue, 12 Dec 2023 08:52:59 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 7/7] drm/bridge: tc358767: Add descriptions to register
 definitions
Date: Tue, 12 Dec 2023 08:52:57 +0100
Message-Id: <20231212075257.75084-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212075257.75084-1-alexander.stein@ew.tq-group.com>
References: <20231212075257.75084-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the register names from the datasheet. No functional change intended.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 93fa057eca8dc..43e860796e683 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -145,10 +145,10 @@
 #define VFUEN				BIT(0)   /* Video Frame Timing Upload */
 
 /* System */
-#define TC_IDREG		0x0500
-#define SYSSTAT			0x0508
-#define SYSRSTENB		0x050c
+#define TC_IDREG		0x0500	/* Chip ID and Revision ID */
 #define SYSBOOT			0x0504	/* System BootStrap Status Register */
+#define SYSSTAT			0x0508	/* System Status Register */
+#define SYSRSTENB		0x050c /* System Reset/Enable Register */
 #define ENBI2C				(1 << 0)
 #define ENBLCD0				(1 << 2)
 #define ENBBM				(1 << 3)
@@ -162,12 +162,12 @@
 #define DP0_VIDSRC_DSI_RX		(1 << 0)
 #define DP0_VIDSRC_DPI_RX		(2 << 0)
 #define DP0_VIDSRC_COLOR_BAR		(3 << 0)
-#define GPIOM			0x0540
-#define GPIOC			0x0544
-#define GPIOO			0x0548
-#define GPIOI			0x054c
-#define INTCTL_G		0x0560
-#define INTSTS_G		0x0564
+#define GPIOM			0x0540	/* GPIO Mode Control Register */
+#define GPIOC			0x0544	/* GPIO Direction Control Register */
+#define GPIOO			0x0548	/* GPIO Output Register */
+#define GPIOI			0x054c	/* GPIO Input Register */
+#define INTCTL_G		0x0560	/* General Interrupts Control Register */
+#define INTSTS_G		0x0564	/* General Interrupts Status Register */
 
 #define INT_SYSERR		BIT(16)
 #define INT_GPIO_H(x)		(1 << (x == 0 ? 2 : 10))
@@ -176,8 +176,8 @@
 #define TEST_INT_C		0x0570	/* Test Interrupts Control Register */
 #define TEST_INT_S		0x0574	/* Test Interrupts Status Register */
 
-#define INT_GP0_LCNT		0x0584
-#define INT_GP1_LCNT		0x0588
+#define INT_GP0_LCNT		0x0584	/* Interrupt GPIO0 Low Count Value Register */
+#define INT_GP1_LCNT		0x0588	/* Interrupt GPIO1 Low Count Value Register */
 
 /* Control */
 #define DP0CTL			0x0600
@@ -187,9 +187,9 @@
 #define DP_EN				BIT(0)   /* Enable DPTX function */
 
 /* Clocks */
-#define DP0_VIDMNGEN0		0x0610
-#define DP0_VIDMNGEN1		0x0614
-#define DP0_VMNGENSTATUS	0x0618
+#define DP0_VIDMNGEN0		0x0610	/* DP0 Video Force M Value Register */
+#define DP0_VIDMNGEN1		0x0614	/* DP0 Video Force N Value Register */
+#define DP0_VMNGENSTATUS	0x0618	/* DP0 Video Current M Value Register */
 #define DP0_AUDMNGEN0		0x0628	/* DP0 Audio Force M Value Register */
 #define DP0_AUDMNGEN1		0x062c	/* DP0 Audio Force N Value Register */
 #define DP0_AMNGENSTATUS	0x0630	/* DP0 Audio Current M Value Register */
@@ -277,7 +277,7 @@
 #define AUDIFDATA5		0x071c	/* DP0 Audio Info Frame Bytes 23 to 20 */
 #define AUDIFDATA6		0x0720	/* DP0 Audio Info Frame Bytes 27 to 24 */
 
-#define DP1_SRCCTRL		0x07a0
+#define DP1_SRCCTRL		0x07a0	/* DP1 Control Register */
 
 /* PHY */
 #define DP_PHY_CTRL		0x0800
-- 
2.34.1

