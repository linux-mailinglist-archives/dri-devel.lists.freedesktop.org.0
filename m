Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9047FCB6810
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 17:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F014B10E85D;
	Thu, 11 Dec 2025 16:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IPbJAy2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A2810E854
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 16:40:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 349054E41B7C;
 Thu, 11 Dec 2025 16:40:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 081766072F;
 Thu, 11 Dec 2025 16:40:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6B625103C8D6B; Thu, 11 Dec 2025 17:40:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765471215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6j7nsPm++3S36MMzFNLaF3jNGyC7ahU+ZizctHuH6BI=;
 b=IPbJAy2PRNsmmU+cdgtYAPYg2+E+iG+ZAsH3fDUeU+fUNxuj91E7r5GpCkpdsVu/3z7hsp
 H+NV0pYrY/BOoFB+0xHd99KUjEA+S5NDVcwZomhUnLo4jX5iw1UjeKMCzNVM3yXCjzj0ui
 nKxlIDrprbqRwMCVdXD7xYXTVUq7TQS1OJL5El6mHNSQ8Cpm2J9gbm6q3SfH2if1oOW0gT
 hFSYUewWAHVjh8TdgxRR4dLAhUcxivgDsr3oudY5Q1HLg9dfKeg4holo00I87uQ5A/UzcS
 T9YyxrHlTdwYSKF8zQfngis1RCICobKzQ78aO1BZwndRUs9Oj1QXNeZHpVMUWA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 11 Dec 2025 17:38:56 +0100
Subject: [PATCH v2 12/20] drm/tilcdc: Rename tilcdc_external to tilcdc_encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-feature_tilcdc-v2-12-f48bac3cd33e@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

The tilcdc_external module describes the encoder part of the tilcdc
driver. Rename it to tilcdc_encoder for better clarity and to make
the naming more consistent with DRM subsystem conventions, where
encoder-related files typically use "encoder" in their names.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/Makefile                                | 2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                            | 2 +-
 drivers/gpu/drm/tilcdc/{tilcdc_external.c => tilcdc_encoder.c} | 2 +-
 drivers/gpu/drm/tilcdc/{tilcdc_external.h => tilcdc_encoder.h} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/Makefile b/drivers/gpu/drm/tilcdc/Makefile
index b78204a65ce29..c6b484dad711a 100644
--- a/drivers/gpu/drm/tilcdc/Makefile
+++ b/drivers/gpu/drm/tilcdc/Makefile
@@ -6,7 +6,7 @@ endif
 tilcdc-y := \
 	tilcdc_plane.o \
 	tilcdc_crtc.o \
-	tilcdc_external.o \
+	tilcdc_encoder.o \
 	tilcdc_drv.o
 
 obj-$(CONFIG_DRM_TILCDC)	+= tilcdc.o
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index bf6cd763ecd0f..6a08f50762af9 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -26,7 +26,7 @@
 
 
 #include "tilcdc_drv.h"
-#include "tilcdc_external.h"
+#include "tilcdc_encoder.h"
 #include "tilcdc_regs.h"
 
 enum {
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
similarity index 98%
rename from drivers/gpu/drm/tilcdc/tilcdc_external.c
rename to drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index 0c18d05dc7101..bca91226351dd 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -12,7 +12,7 @@
 #include <drm/drm_simple_kms_helper.h>
 
 #include "tilcdc_drv.h"
-#include "tilcdc_external.h"
+#include "tilcdc_encoder.h"
 
 static
 struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.h b/drivers/gpu/drm/tilcdc/tilcdc_encoder.h
similarity index 100%
rename from drivers/gpu/drm/tilcdc/tilcdc_external.h
rename to drivers/gpu/drm/tilcdc/tilcdc_encoder.h

-- 
2.43.0

