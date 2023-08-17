Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB4D77F1A5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 10:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22E110E407;
	Thu, 17 Aug 2023 08:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD3610E414
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1692259253; x=1723795253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rdp++IA19oG6KMoVeDghJjr74gK6R2xHJ36onepxWOo=;
 b=HeEgQ/tt/IKWDUrkpditY1Og9ywPfbbnYYyz0X5Fu8EZbVUROsvCldws
 m4WOtoRwYnbR7w/niXSu4IfCylH67nmSCApudOvPQioITfFFxYNeYnkE9
 +ji8NRC5NsLNRGrotU7/De3ddp9fT+sZP1L6O8C9GJiuCOlSxGfi9GM0D
 FZV54FWqqIBRDDihkXhkFnpbQG5IQTjqPOWQSzzONRqFllgx1LaJXB4yj
 p7139J8kZccPk6r5Fjog44dc3J09M8RQJJIhzw6gmr1CRTPpK5/a1ukMh
 akP7ip4p27O8od0hQafiPGvOqpdWsPAxj+Na7R7sFhWmsUWSiAu41vHlH A==;
X-IronPort-AV: E=Sophos;i="6.01,179,1684792800"; d="scan'208";a="32487218"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Aug 2023 10:00:49 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 465F8280084;
 Thu, 17 Aug 2023 10:00:49 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 7/7] drm: bridge: tc358767: Add descriptions to register
 definitions
Date: Thu, 17 Aug 2023 10:00:45 +0200
Message-Id: <20230817080045.1077600-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817080045.1077600-1-alexander.stein@ew.tq-group.com>
References: <20230817080045.1077600-1-alexander.stein@ew.tq-group.com>
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
index 0a4d5dfcc0a5a..4860c48c14386 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -143,10 +143,10 @@
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
@@ -160,12 +160,12 @@
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
@@ -174,8 +174,8 @@
 #define TEST_INT_C		0x0570	/* Test Interrupts Control Register */
 #define TEST_INT_S		0x0574	/* Test Interrupts Status Register */
 
-#define INT_GP0_LCNT		0x0584
-#define INT_GP1_LCNT		0x0588
+#define INT_GP0_LCNT		0x0584	/* Interrupt GPIO0 Low Count Value Register */
+#define INT_GP1_LCNT		0x0588	/* Interrupt GPIO1 Low Count Value Register */
 
 /* Control */
 #define DP0CTL			0x0600
@@ -185,9 +185,9 @@
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
@@ -275,7 +275,7 @@
 #define AUDIFDATA5		0x071c	/* DP0 Audio Info Frame Bytes 23 to 20 */
 #define AUDIFDATA6		0x0720	/* DP0 Audio Info Frame Bytes 27 to 24 */
 
-#define DP1_SRCCTRL		0x07a0
+#define DP1_SRCCTRL		0x07a0	/* DP1 Control Register */
 
 /* PHY */
 #define DP_PHY_CTRL		0x0800
-- 
2.34.1

