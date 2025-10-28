Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A930C1759C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593B510E6AB;
	Tue, 28 Oct 2025 23:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="HwYQN4J/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="m4rSyYMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EEA10E6AB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 23:30:17 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cx66v1fVwz9tQr;
 Wed, 29 Oct 2025 00:30:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761694215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mAbwK7Q2HinPATBiXxg8SGPb+FOJdhY/KzzDIEF4H94=;
 b=HwYQN4J/EfPi4mk6WKzFVpQO7eCVLE9MFYKFMg/iT/oEydXgC+rmwx2TXH7cgY4g5E4XKN
 Jh2W4bfA0VdJOjsUvZjhzIVRAWyxDL1K9/LbF25wwaTtdHNB/z4Rj9YPnuQrke004zN5Bf
 Vnn9l3xUTlGObaXYT4PGKxjoA+AzVD2LtxGfrRon11q7HH1KOurAk3rL5ZZR+7CMjNg7U5
 59zDD5oPTV8Q7Ywk4lFdkerOLflWfAOWbeXR2hEiATJZ82FJa5S5WWzNYUxSdQZVLFUGXO
 F5PZqwoHd+sKk3liGSYT1GziGLh1M/bIjB0VYTRxkduhWeO442+2XFTjPwKfXw==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=m4rSyYMH;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761694213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mAbwK7Q2HinPATBiXxg8SGPb+FOJdhY/KzzDIEF4H94=;
 b=m4rSyYMHusHLdmWi+HQTp+gak4oVZ5q1aPKIVOXrVRMM1TN/HOhGau0px2z6sTlCoI3PQO
 o9WD7lcAVlXkR2Oe2ccq54BLGH4XebBwqm+P7sQ6wbxNf4RqN4hHMn4bgdyBJ5mA0dfr6z
 U+iHOkmL9121JzoUswmQL+mZzErduzk/Idg3hIMuCz5a3AAm+DPntH3IcLXsCNEK5/llNs
 npQhTW8q9pR0dCh/0S0BWeGmt90VuhA7MVdDeGly/B+GgRWfLmSXQGzXmzIKdPQLs29VK2
 kN466wv7LAGvXbU5K5pWHVfe7tghs0V0rL3uEOOLVxq207mTf4jzFzPIEhg2Jw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 01/11] drm/rcar-du: dsi: Fix missing parameter in
 RXSETR_...EN macros
Date: Wed, 29 Oct 2025 00:28:11 +0100
Message-ID: <20251028232959.109936-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6s5abxewwyb8to7h31pnjxpp9h1yime6
X-MBO-RS-ID: 0c87285623d8c4a7625
X-Rspamd-Queue-Id: 4cx66v1fVwz9tQr
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

The RXSETR_CRCEN(n) and RXSETR_ECCEN(n) macros both take parameter (n),
add the missing macro parameter. Neither of those macros is used by the
driver, so for now the bug is harmless.

Fixes: 685e8dae19df ("drm/rcar-du: dsi: Implement DSI command support")
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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
V3: No change
V4: Add RB from Tomi
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 76521276e2af8..dd871e17dcf53 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -50,8 +50,8 @@
 #define TXCMPPD3R			0x16c
 
 #define RXSETR				0x200
-#define RXSETR_CRCEN			(((n) & 0xf) << 24)
-#define RXSETR_ECCEN			(((n) & 0xf) << 16)
+#define RXSETR_CRCEN(n)			(((n) & 0xf) << 24)
+#define RXSETR_ECCEN(n)			(((n) & 0xf) << 16)
 #define RXPSETR				0x210
 #define RXPSETR_LPPDACC			(1 << 0)
 #define RXPSR				0x220
-- 
2.51.0

