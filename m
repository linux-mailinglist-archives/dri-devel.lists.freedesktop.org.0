Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A05B92B07
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 20:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B8010E4E4;
	Mon, 22 Sep 2025 18:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="PRdtemEv";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aR4HnhIq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272EB10E4E1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 18:58:29 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cVsnv6MD3z9scD;
 Mon, 22 Sep 2025 20:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758567507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDY1goVSq/HGSZ7D/4+pOEjofQvXjXnmRYkYcRTvD1M=;
 b=PRdtemEvWdToMYDMNUFPCAtkKLwzVSOHirtUiEWz6wF/BtHO5Q6J4uqdtEs9kbxPsJ5up0
 KYXnzmiXWpK4orNJbyNl3rpsR2JbZRthmTqD9lxavXcQGEFISbf5cejcbyOiGYgyJcak3c
 NUs+C8qvHPhWiTj+AxHzM/evwOjHFbDUvdZaKp9C5/HOt1p9P9l3aMT4nTMTUcH5rF6XPF
 UPLNhvtoRMSr9q5nqhyDz2KSUeW/l/dXixbL7rwUI6b7ViOX6Mxea95Gga7cUSi5KtHeJz
 Y0Kv+0wskqKdaxSjrM4HeA70NW5ty6jBvwYIblQGktZrfBAJwmtq+TDjEiHUlQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=aR4HnhIq;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758567505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDY1goVSq/HGSZ7D/4+pOEjofQvXjXnmRYkYcRTvD1M=;
 b=aR4HnhIq1d7ZZDhDuJ4oKTu9Yd/e3pKdi+AXLGePmcL9O6yXXkXfkMOpM7GxqJp68uWZEZ
 XBR+F9D8t4pOD39c+Kxn0TBdvBZEOt8cQxyF6bG15vzSBZdNZ0qNFveepk8E8OcB97qsJm
 3rAwTL9m3pvpnHaswwCLucCPTE3qBXv5pe3XBG4pE9ERvj/bI1qqonUh6XkTeFWNDKVze3
 evybKrEF3JzE/zjH8xjiBaspTrjsN7tIKH5Bu4g+yb9C59w8H6ZhifF4ylBzAmwtgtlQhr
 FK7qLeKY/737R6iNOv+UGfZpTbIRfgF1KgcvyoIRwR6ZpOVu2lzOf2f2vKqDJQ==
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
Subject: [PATCH 4/9] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
Date: Mon, 22 Sep 2025 20:55:00 +0200
Message-ID: <20250922185740.153759-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: eprupd3mckgpjmjb1iaaohehfm9mspmw
X-MBO-RS-ID: ec67f5f24f237e89bec
X-Rspamd-Queue-Id: 4cVsnv6MD3z9scD
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

Introduce CLOCKSET1_CLKINSEL_MASK macro and remove bitshift from
values to make this bitfield usable with FIELD_PREP(). There are
no users of this bitfield, hence no updates to the DSI driver.

Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
consisten with the current style. Conversion to BIT() and GENMASK()
macros is done at the very end of this series in the last two patches.

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
NOTE: No functional change expected, this is a preparatory patch which
partly removes macros which evaluate to zeroes from rcar_mipi_dsi_regs.h .
The other patches in this series proceed with that job, piece by piece,
to make it all reviewable.
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index c2cb06ef144ed..808861aaf3bfe 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -268,9 +268,10 @@
 #define CLOCKSET1			0x101c
 #define CLOCKSET1_LOCK_PHY		(1 << 17)
 #define CLOCKSET1_CLKSEL		(1 << 8)
-#define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
-#define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
-#define CLOCKSET1_CLKINSEL_DU		(1 << 3)
+#define CLOCKSET1_CLKINSEL_MASK		(3 << 2)
+#define CLOCKSET1_CLKINSEL_EXTAL	0
+#define CLOCKSET1_CLKINSEL_DIG		1
+#define CLOCKSET1_CLKINSEL_DU		2
 #define CLOCKSET1_SHADOW_CLEAR		(1 << 1)
 #define CLOCKSET1_UPDATEPLL		(1 << 0)
 
-- 
2.51.0

