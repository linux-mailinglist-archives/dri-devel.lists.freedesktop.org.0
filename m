Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0177C8B3B6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF9710E6C4;
	Wed, 26 Nov 2025 17:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="M3AWRTOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3683510E6D3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:37:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F0A4A4E418DB;
 Wed, 26 Nov 2025 17:37:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BF96160721;
 Wed, 26 Nov 2025 17:37:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D2A83102F1D8D; Wed, 26 Nov 2025 18:37:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764178634; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CnBJhHhRDeeDaJv2IAkXOHIOLztU83Vb3/7QhOHwzDE=;
 b=M3AWRTOAZLvMEjv/7WU9UrNSScWEKSgIGFwOWOXWnnJe9ogneVFk4rGq+DO3mbtFT2wv63
 zQY/exhgXeFRDhpeVhATOyoC+SLdNp3hi1Xkj6oOerd9j5NWZbRU5kYi2HqZCzC38zyupg
 0hVk+wyUmiAb0B/yBse5L5sLyUDHKhAskz7s51VQ633abskO+dkCibTwLwQETQU9r6q2At
 t2g5RKPeDmZVEeOMU8XHH3HoCnkX++jQKBgxHdfhmDaM4eDXNi3v+CIqPMhnO9ORa9rcBo
 QcQhlZTuWdSdSnpBUiduCwMTDviBeYjE9QuPZf7o94gmTlCxtzdzu24PFvp83g==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:52 +0100
Subject: [PATCH 10/21] drm/tilcdc: Remove redundant #endif/#ifdef in
 debugfs code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-10-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
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

Remove the unnecessary #endif/#ifdef CONFIG_DEBUG_FS pair that splits
the debugfs code section. This keeps all debugfs-related code within a
single preprocessor conditional block, improving code readability.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 2df3957ee0dc1..a5623247bc697 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -418,9 +418,6 @@ static const struct {
 #undef REG
 };
 
-#endif
-
-#ifdef CONFIG_DEBUG_FS
 static int tilcdc_regs_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;

-- 
2.43.0

