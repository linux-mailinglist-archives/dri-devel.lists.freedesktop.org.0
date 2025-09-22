Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4171B92AF2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 20:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9A510E4DD;
	Mon, 22 Sep 2025 18:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="goBH/wyX";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dcFf4UjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C664D10E4DD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 18:58:19 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cVsnk3CTNz9tCk;
 Mon, 22 Sep 2025 20:58:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758567498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7TjTTZzvOitfNQ9kj1rF/2nXlvbou5eQd2dXk//VaI=;
 b=goBH/wyXm+mmmkgbA9+T0k1b2RfTMEAqe8pZ24tPADWK8umD+eriO8ILp6Cwun1pe5t09k
 krN2jUDzzTwswoNV1JLfarUdOhuGzjc4vcMsPbRHyemiTnZR53Hr8qOtxvlRKXYpToAIDX
 19i4BGyK58j1H4FoRDHCbsw4oaHWionxdAVEpCahMlRwwvjCOvybeKvmIpoR88qLwXxQD2
 bxM2UVrbizF86y7LeNBXQL8nuhXSR3PUQWlhWwPsV/3z2z4/Cl2DvVa4K+7XA7xyhTyPLQ
 NdYbetRtu17NbwJxnMFfc9ONmZuMxN2g06s3ifdq9Rk/Cv3+1U6Hv3dJq6DKlg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=dcFf4UjI;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758567496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7TjTTZzvOitfNQ9kj1rF/2nXlvbou5eQd2dXk//VaI=;
 b=dcFf4UjIuqRiJE6OSqwGXL2Or6rg+wKsIkthdsqBTMnSrI3yX4fg5i83PoCNcJYLN6JbaR
 goExGFCQEQ1kSUTKCig5igWlKorCq5Or9Yd4hywiWfZ1vqVxgsV/an2BKEVXOEvQYBMgSk
 AM+IZt6O8Qga95dWtlI+SJ0v3OpTj+pwyQSm8M+9eGkDWwJT6vQfBYULEuMCIYgQ3aLnAF
 fUAaTPXhKy0rqU8nMxJKLuqYB3p5teQyx5hs7WROJeRUYCu3ncJGqUdQtevj3ZILgK9DDl
 3Z2JtXgi94tpD6M42sbt0T6TtYruEODBgM3+nfJaK7JY0Oua/i4vv33cusZf5A==
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
Subject: [PATCH 1/9] drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN
 macros
Date: Mon, 22 Sep 2025 20:54:57 +0200
Message-ID: <20250922185740.153759-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7pxgu3hrceae6rddjzqxs96ynidfrrp3
X-MBO-RS-ID: da8382f330cef2a252e
X-Rspamd-Queue-Id: 4cVsnk3CTNz9tCk
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

