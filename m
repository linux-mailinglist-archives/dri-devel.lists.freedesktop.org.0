Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143EBB9397
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 05:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6F810E260;
	Sun,  5 Oct 2025 03:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="opvjdKbI";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VawxWEOo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237FD10E260
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 03:04:30 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cfS185f53z9sq6;
 Sun,  5 Oct 2025 05:04:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjkAFGuY+TeWUyTzvy9NaIPiyY++vsBbvoS4/XpMiCA=;
 b=opvjdKbIxTaiPT0kb9v55WJz7K4CuTP/OOfW0K79ng95da/YJGxZn+bKH23MsSx1XDNQgV
 h+2BImRPUWAprdYeUos/fP+Nnaqck3Vxj3QEHH8pmL6r2bBNh9QdBDuOvLmOna6OPaDgq1
 dFQRMB8MbuefwyFlGL29B0kLNjm8C/Hklc/gH37x9hj/BJX4QzGEeIE5n9eKIxgjci/LFj
 LN16YSrDX8g1MeM7gPJUeoAshZUtqedaXItqY7Trlq2z7teTgSvyxox1AtUMN1bekg5Z+0
 3s9UNpeNTlB65nxtEfs7W2LQPOhW3hPKSnNKbvgx0jUgKTzqo83+2dumS2YmEA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjkAFGuY+TeWUyTzvy9NaIPiyY++vsBbvoS4/XpMiCA=;
 b=VawxWEOoQETvDF75W+SRPuuCGUaGcK6YOY6Ni9v4idcs1Q5Ibm77B2juHYKxDt+ZYHBHlt
 ckPgRuuXr6PvDT1dlgi1MzwiNHlmd0XTlCXsHVAjBaCl+x3eJuQvj7DIyWatkoPWXJFGge
 78SEV4aA1h/ZQkC8z3/1VR2cNX0RJ4Iq82eQl+HBJM5Rv0512aO/TPKNm/IguBykOuxiS7
 TjhVhMceoXBrA6Rm/35YSGmd3vvyNbzgqliV5cvhMfIcBjOBml+FSCbZV0CRlLX1rqnvNE
 BK+lxoaNR1lLyIJvYp3WdOpI/RmixinHHnOIDA1vcy7Gm5YhGjegZ9vQbyQ6ZQ==
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
Subject: [PATCH v3 02/11] drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as
 bitfield
Date: Sun,  5 Oct 2025 05:02:49 +0200
Message-ID: <20251005030355.202242-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5y7qxsmtwbg3kxtwfquhba6jtqtynfun
X-MBO-RS-ID: 851773026db280bc497
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

The register TXVMSETR bitfield PIXWDTH is not a single bit, but a
bitfield. Add a MASK macro and document that the only allowed value
that can ever be written into the bitfield is the current value, 1.
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
V2: New patch
V3: No change
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index dd871e17dcf53..b8a719a13c006 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -143,7 +143,8 @@
 #define TXVMSETR_SYNSEQ_PULSES		(0 << 16)
 #define TXVMSETR_SYNSEQ_EVENTS		(1 << 16)
 #define TXVMSETR_VSTPM			(1 << 15)
-#define TXVMSETR_PIXWDTH		(1 << 8)
+#define TXVMSETR_PIXWDTH_MASK		(7 << 8)
+#define TXVMSETR_PIXWDTH		(1 << 8) /* Only allowed value */
 #define TXVMSETR_VSEN_EN		(1 << 4)
 #define TXVMSETR_VSEN_DIS		(0 << 4)
 #define TXVMSETR_HFPBPEN_EN		(1 << 2)
-- 
2.51.0

