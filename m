Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0B07FBBC8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F1C10E52F;
	Tue, 28 Nov 2023 13:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E761F10E52B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1701178724; x=1732714724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EzC3uEFUmqFJcAlfOf2aMY3EA05EYnTspt71z+uITqw=;
 b=Wylb/RaKaiYdC3v9HT0LJQmIED38G5YDPt0D9OtB3XwNNP95LMJdAT5t
 YTFiseVBNGdaKcvq9Ey2y3KscBLRLQLH5Ct7IjdlT9j/Y7eNR/Va9WTcd
 +n5HvpMueqAfMPqkc9bT0287HT1/2DkmAbDHhp9p/wfjW7T7iI2YlMS4o
 AeImiY5Rq7aXY20qpPAqCzbP/B2xl/tdiZnWABZV1OQiqMuobsZ+PW41v
 /yhr8ErV9F6VMdsrI3Lflg5Fx3Y0hBQQHMFp27ih8sVJUxyNFt6uovAXS
 4XylAl9dhAPq+x972a8FH8tTV0NETqgggO9OJXj4PhvSjJi1UUV/3carl Q==;
X-IronPort-AV: E=Sophos;i="6.04,233,1695679200"; d="scan'208";a="34216295"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 28 Nov 2023 14:38:40 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 867DC280084;
 Tue, 28 Nov 2023 14:38:40 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 7/7] drm/bridge: tc358767: Add descriptions to register
 definitions
Date: Tue, 28 Nov 2023 14:38:36 +0100
Message-Id: <20231128133836.2923081-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128133836.2923081-1-alexander.stein@ew.tq-group.com>
References: <20231128133836.2923081-1-alexander.stein@ew.tq-group.com>
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
index a279eab77c36c..6675099a5f685 100644
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

