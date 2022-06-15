Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE4F54D45B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 00:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17A811390E;
	Wed, 15 Jun 2022 22:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D8411390B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 22:14:27 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09D78BAC;
 Thu, 16 Jun 2022 00:14:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655331266;
 bh=X4VAEaTQTKnkyaZPESA6BesMEuNlxpGI2l6hsWy9eI0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=is+KaZEF3cyWDxv4uVVnNNSI7FTo5isYApwsDRrqyM6aHgS6Kw7Ci1b0IRUecKMGR
 5X7hhq2dzWhWAiWbh+3RXt9DLFEdUlnps9Bx0l+4jbnmKPO82B1WYN+Iq1w4hxMOh7
 TF5cRnt1FmcaP2F3CWRLK69U6w4IlpMq6A8WOHvs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/6] dt-bindings: media: Add macros for video interface bus
 types
Date: Thu, 16 Jun 2022 01:14:05 +0300
Message-Id: <20220615221410.27459-2-laurent.pinchart@ideasonboard.com>
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

Add a new dt-bindings/media/video-interfaces.h header that defines
macros corresponding to the bus types from media/video-interfaces.yaml.
This allows avoiding hardcoded constants in device tree sources.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Go back to PARALLEL

Changes since v1:

- Dual-license under GPL-2.0-only or MIT
- Rename PARALLEL TO BT601
---
 include/dt-bindings/media/video-interfaces.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/media/video-interfaces.h

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
new file mode 100644
index 000000000000..68ac4e05e37f
--- /dev/null
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
+#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
+
+#define MEDIA_BUS_TYPE_CSI2_CPHY		1
+#define MEDIA_BUS_TYPE_CSI1			2
+#define MEDIA_BUS_TYPE_CCP2			3
+#define MEDIA_BUS_TYPE_CSI2_DPHY		4
+#define MEDIA_BUS_TYPE_PARALLEL			5
+#define MEDIA_BUS_TYPE_BT656			6
+
+#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
-- 
Regards,

Laurent Pinchart

