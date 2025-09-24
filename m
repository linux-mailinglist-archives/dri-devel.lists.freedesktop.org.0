Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32BFB97E33
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 02:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81D610E684;
	Wed, 24 Sep 2025 00:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="h3misTWg";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uCkl50nW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A0110E67F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 00:30:42 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cWd6m6WRJz9tK4;
 Wed, 24 Sep 2025 02:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758673840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DH730XOPpFN6HN7JCc4GO0kh7mtSbEmrEIUo52aDQg=;
 b=h3misTWgA67+7IqXURGUfg5RSAz6KygtuIUo4AMhoYD+VlAlVI5QgUex5v0oHFowehNq3v
 4ZQkbw+VJAZCISAYZ4YE/2W446XbmXuUZACdpxlcSguIgHh+2On3QRQHHw9RyQn91pbHih
 gfvJJ73t1KvtrMLwA5im6ZtKdD6q3xrmvj2t5sSgYkSjHr3q2ovCyPk1QiYTHkwMha+tLH
 Gu/Da8dQf5sYbJQ5sV3o0YWY7WWZ/VDjt3Ppfx1NkNg/8FLyCbzCOzcD5sjILvKpzD8cDC
 fIorF1eISowOAohU+NHGQU0Ogy9B4IDY9p/u2jXKyIDnPUOiDYxyG+dpN24weg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=uCkl50nW;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758673839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DH730XOPpFN6HN7JCc4GO0kh7mtSbEmrEIUo52aDQg=;
 b=uCkl50nWd31SboytVUd3wIXn8j+yrKjDKz98f9FPenhHu+zQihbGBdVfxvowR7IHBroo8n
 2WCducN3G9og7pU/CHVwykaUz4Qh7x0SGhm9oS6Wtd7UIDkW0OWEQeUhCs8r8zWx0L5QfQ
 iHFjQ/9mpc8ZOjdvXYilLVREp4ymg28Wo/pV94S9bQg9iSRUN3yptwqxc3nvaoPeX0spb3
 zV2khPMm06gUJhDG3Vk3dqK6IAec22AeHoKo94hmksMzkYKwyqw4F7/LwmAVAui+Co0bxa
 BtgdseMdWHIk9svCASAnQ9L4etEYoM5OeJ8yX3oY6yT5jm7xFgtOB44zOGzgjA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 07/10] drm/rcar-du: dsi: Respect DSI mode flags
Date: Wed, 24 Sep 2025 02:28:24 +0200
Message-ID: <20250924003003.91039-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 80baaf7294540065a96
X-MBO-RS-META: c7trzdephh3bssfwmetrycodx7qg5j74
X-Rspamd-Queue-Id: 4cWd6m6WRJz9tK4
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

Cache DSI mode flags in new mode_flags member of struct rcar_mipi_dsi .
Configure TXVMSETR register based on the content of DSI mode flags in
case the controller operates in video mode.

Rename TXVMSETR_H..BPEN_EN to TXVMSETR_H..BPEN and drop TXVMSETR_H..BPEN_DIS
which resolves to 0. Update TXVMSETR_VSEN in the same manner. Replace
TXVMSETR_SYNSEQ_PULSES with a code comment next to TXVMSETR_SYNSEQ_EVENTS
because TXVMSETR_SYNSEQ_PULSES resolves to 0.

Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
consisten with the current style. Conversion to BIT() and GENMASK()
macros is done at the very end of this series in the last two patches.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Add RB from Laurent
---
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    | 18 +++++++++++++++---
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   | 15 +++++----------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 69cb31a913596..bff45456309a8 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -71,6 +71,7 @@ struct rcar_mipi_dsi {
 	} clocks;
 
 	enum mipi_dsi_pixel_format format;
+	unsigned long mode_flags;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 };
@@ -473,9 +474,19 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 	}
 
 	/* Configuration for Blanking sequence and Input Pixel */
-	setr = TXVMSETR_HSABPEN_EN | TXVMSETR_HBPBPEN_EN
-	     | TXVMSETR_HFPBPEN_EN | TXVMSETR_SYNSEQ_PULSES
-	     | TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
+	setr = TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
+
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE))
+			setr |= TXVMSETR_SYNSEQ_EVENTS;
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
+			setr |= TXVMSETR_HFPBPEN;
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
+			setr |= TXVMSETR_HBPBPEN;
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
+			setr |= TXVMSETR_HSABPEN;
+	}
+
 	rcar_mipi_dsi_write(dsi, TXVMSETR, setr);
 
 	/* Configuration for Video Parameters */
@@ -916,6 +927,7 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
+	dsi->mode_flags = device->mode_flags;
 
 	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
 						  1, 0);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 7c828f46cbb76..1adb53fce7a9e 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -140,19 +140,14 @@
  * Video Mode Register
  */
 #define TXVMSETR			0x180
-#define TXVMSETR_SYNSEQ_PULSES		(0 << 16)
-#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16)
+#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16) /* 0:Pulses 1:Events */
 #define TXVMSETR_VSTPM			(1 << 15)
 #define TXVMSETR_PIXWDTH_MASK		(7 << 8)
 #define TXVMSETR_PIXWDTH		(1 << 8) /* Only allowed value */
-#define TXVMSETR_VSEN_EN		(1 << 4)
-#define TXVMSETR_VSEN_DIS		(0 << 4)
-#define TXVMSETR_HFPBPEN_EN		(1 << 2)
-#define TXVMSETR_HFPBPEN_DIS		(0 << 2)
-#define TXVMSETR_HBPBPEN_EN		(1 << 1)
-#define TXVMSETR_HBPBPEN_DIS		(0 << 1)
-#define TXVMSETR_HSABPEN_EN		(1 << 0)
-#define TXVMSETR_HSABPEN_DIS		(0 << 0)
+#define TXVMSETR_VSEN			(1 << 4)
+#define TXVMSETR_HFPBPEN		(1 << 2)
+#define TXVMSETR_HBPBPEN		(1 << 1)
+#define TXVMSETR_HSABPEN		(1 << 0)
 
 #define TXVMCR				0x190
 #define TXVMCR_VFCLR			(1 << 12)
-- 
2.51.0

