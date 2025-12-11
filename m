Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203D5CB67BC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 17:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A7810E7EE;
	Thu, 11 Dec 2025 16:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cHNvQEJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B3410E7EE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 16:39:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 15DC3C1934E;
 Thu, 11 Dec 2025 16:39:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1A9966072F;
 Thu, 11 Dec 2025 16:39:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 52560103C8C7B; Thu, 11 Dec 2025 17:39:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765471185; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sVcTUwOCRH5tnQZK1SD7eSjVIvUKNCHhAOFhXPDQ2uA=;
 b=cHNvQEJxuvuPsT39IuUKHb36IrNHyBSryBir25sEu70JFNA18i6VTtebbBVbtwIOLy6Tn9
 2lFVUZzZ7Z5cUy6m9qMX2TDwaMdWW/+VUiKA2RKbG/pnBaG8A0yxzqtSIH5C16NRZTusYh
 kssZoSJVT5KZwolD9I1MMu1mwNf5kej8nmnVHfraI+MfKq38Ct50lRjm7z/elItW4RUzMX
 iZMsMjgBniz1bIcr3RnPC3YbaSPLX2PUyX0XM65851mTSh0VdM9CZvEmLi89XoKuqrPyjw
 hqwQmSS7uDqDazxhL0AASbrClk2Hj+KGz4b7sXG7Z8CJXtmwKTdEalymfzJ7kg==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 11 Dec 2025 17:38:46 +0100
Subject: [PATCH v2 02/20] dt-bindings: display: tilcdc: Mark panel binding
 as deprecated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-feature_tilcdc-v2-2-f48bac3cd33e@bootlin.com>
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

Mark the ti,tilcdc,panel binding as deprecated in the documentation.
This legacy binding should no longer be used for new designs. Users
should migrate to the standard DRM panel bindings instead.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v2:
- New patch
---
 Documentation/devicetree/bindings/display/tilcdc/panel.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/panel.txt b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
index 808216310ea27..b973174d704ed 100644
--- a/Documentation/devicetree/bindings/display/tilcdc/panel.txt
+++ b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
@@ -1,4 +1,5 @@
 Device-Tree bindings for tilcdc DRM generic panel output driver
+This binding is deprecated and should not be used.
 
 Required properties:
  - compatible: value should be "ti,tilcdc,panel".

-- 
2.43.0

