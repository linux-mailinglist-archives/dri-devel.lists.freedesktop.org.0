Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C08BB939F
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 05:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B7F10E265;
	Sun,  5 Oct 2025 03:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="YsXfyxIy";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tg0/Iqw8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1A010E261
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 03:04:34 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cfS1F3DsGz9svm;
 Sun,  5 Oct 2025 05:04:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2S5p5nv6MFF7p7Z1t9l+Sd1dcTb6LyWuWPbULx178w=;
 b=YsXfyxIyHcQgztsCtYWZUjJDUmPLZOi2uXk6dSsSdqXlMMta/fzJRmtWh09fXAW9Ill7R9
 h3nqjd4VwFDRfF2Rz3se6MrbPz3jyWXSLaZ4LXAvau5fvIgza2IGk2gSNsMSd8mVqWAINF
 Znm3Q1NIkiN3pZq3Ur6YZiJD+dUZ8oO6aUJ1S5oaDULrCfoSmy6o+11mbtzl5m2+c8u6ya
 dJDrkaAnrRjuK/HKw2HiuFedxLFAvqemYiijF5QAonyk/uqcR9maKXlTZZ485/RjacOSeR
 Z1X2yAK8IYrKrFy9YogFu8WjFgcM8ZqGQQF4rgfJJLE0RZVBX0ZX7+pl/RjfDw==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="tg0/Iqw8";
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2S5p5nv6MFF7p7Z1t9l+Sd1dcTb6LyWuWPbULx178w=;
 b=tg0/Iqw8Vm3EkymWfGsyPRNwgp6hkkiXBx0ADZSxoPeD5MUNvqBdZ14Y29cXKHJLsywU9o
 ylFHLJ7KCQF1ynforwVL8wezMFNQRCsmBp3h9afXocmldA87HAbCW0wsl48grUJrhE3rwp
 gcSX7BOIeDfEveby8/RQqm5p1DT6II4fjWvKE/6s21D83ro+UmCuVAtfLlaGQQkqkj0HL0
 lWcx4N7fEpSCaBFSLY46HQhD9ycIsonIrbvaXboayKU6tYButE4MboYnk+es8S0QTEIgOn
 hwH4n0Lvh4NV4qubDS8C3lC5jTWDqx9p5/n4apQvbjZWm/bg9TovGfBsOSAwYA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 04/11] drm/rcar-du: dsi: Deduplicate
 mipi_dsi_pixel_format_to_bpp() usage
Date: Sun,  5 Oct 2025 05:02:51 +0200
Message-ID: <20251005030355.202242-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fa56oigxkdysuhd9o1tiio1tpawyo1bf
X-MBO-RS-ID: 6d1616bc0b530417769
X-Rspamd-Queue-Id: 4cfS1F3DsGz9svm
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

Call mipi_dsi_pixel_format_to_bpp() once in rcar_mipi_dsi_set_display_timing()
and store the value into a variable. This slightly simplifies the code.

No functional change.

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
V2: Use switch-case statement
V3: No change
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index c24721a1eddf2..e13249e0134b4 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -457,13 +457,17 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 	u32 vprmset4r;
 
 	/* Configuration for Pixel Stream and Packet Header */
-	if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 24)
+	switch (mipi_dsi_pixel_format_to_bpp(dsi->format)) {
+	case 24:
 		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
-	else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 18)
+		break;
+	case 18:
 		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
-	else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 16)
+		break;
+	case 16:
 		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB16);
-	else {
+		break;
+	default:
 		dev_warn(dsi->dev, "unsupported format");
 		return;
 	}
-- 
2.51.0

