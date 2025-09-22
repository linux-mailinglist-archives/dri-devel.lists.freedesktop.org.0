Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CB8B92B20
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 20:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3F110E4E8;
	Mon, 22 Sep 2025 18:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="x9OIz/mY";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WdI6USyP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C766610E4DF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 18:58:40 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cVsp749PMz9v7r;
 Mon, 22 Sep 2025 20:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758567519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7Z33ifVGQU85bQ1pigrdRBQv1M42R2Qh85fJEFdDEM=;
 b=x9OIz/mY5OQB21L0/+iFUUTDLpp+u4+q0DPy0bzmmqbvrQJV1isxmI42hLvfuVx0Kr/NJA
 DJi2dL1zQKShmHQSaUGeofmZZs1f+yPJegILI41kffDorUeLPlARJbXZXtLBQx6zTXqcca
 SGanzKYL3rSP+BSzD3V4YUcX2K/O6kW7zLm7D0UPQOPDdethIiJW4NCRWqgKtfdnzEDtWa
 G7Ausj73l6Rw4gRzxlKIFZNZvbJ0+BbdjEZQIj41t+2uHXfxH9MITrhdfPqCwFDhIH9l7k
 HMNj4j3y2+aCjUV5WWNJOUwblD6IsqsmQ4a/6QZ3F9LPuYsobLjFeYnz94MUkA==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=WdI6USyP;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758567517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7Z33ifVGQU85bQ1pigrdRBQv1M42R2Qh85fJEFdDEM=;
 b=WdI6USyPeMZJZMiQXac7QS+1r5XJkrXktnjFfGc52LTb1y1E2T2gsN8sFGPCNfNPfpupo1
 aLaPah9U7ctEO74LQwxeYLKa9yG9b7Hbtvz75E2BY3R+AGzsXCI5/H217JXE1dH+tgvmew
 DHGo5M0wIpXB8Wkx9ZndZ73TiCMZ+IqJzuYHs9+ZO8THdMis92QmKXU3zJJ324Vbh2Lrxl
 k6InZL0LvYKGdz8B+FPf17dgbgWPCqRMGjxUTRxqoYd5RXhqC6Fqo/8NiVmtfRqbjPEszV
 XS0jSqNN2Pfs0pf3EJrpr1sAyJ6czRZjRL4qC3bnSDkkoOcq9d9RC0aeIANuTg==
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
Subject: [PATCH 8/9] drm/rcar-du: dsi: Convert register bits to BIT() macro
Date: Mon, 22 Sep 2025 20:55:04 +0200
Message-ID: <20250922185740.153759-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gfky4dbrh3gz3ia14rw4mz33uqzu5utz
X-MBO-RS-ID: 189aff4fa9b2263fcf5
X-Rspamd-Queue-Id: 4cVsp749PMz9v7r
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

Convert register bits to BIT() macro where applicable. This is done
automatically using regex 's@(1 << \([0-9]\+\))@BIT(\1)', except for
bitfields which are manually updated to use GENMASK().

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
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 248 +++++++++---------
 1 file changed, 124 insertions(+), 124 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 48c3b679b2663..29c806cae3557 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -9,37 +9,37 @@
 #define __RCAR_MIPI_DSI_REGS_H__
 
 #define LINKSR				0x010
-#define LINKSR_LPBUSY			(1 << 1)
-#define LINKSR_HSBUSY			(1 << 0)
+#define LINKSR_LPBUSY			BIT(1)
+#define LINKSR_HSBUSY			BIT(0)
 
 #define TXSETR				0x100
-#define TXSETR_LANECNT_MASK		(0x3 << 0)
+#define TXSETR_LANECNT_MASK		GENMASK(1, 0)
 
 /*
  * DSI Command Transfer Registers
  */
 #define TXCMSETR			0x110
-#define TXCMSETR_SPDTYP			(1 << 8)	/* 0:HS 1:LP */
-#define TXCMSETR_LPPDACC		(1 << 0)
+#define TXCMSETR_SPDTYP			BIT(8)	/* 0:HS 1:LP */
+#define TXCMSETR_LPPDACC		BIT(0)
 #define TXCMCR				0x120
-#define TXCMCR_BTATYP			(1 << 2)
-#define TXCMCR_BTAREQ			(1 << 1)
-#define TXCMCR_TXREQ			(1 << 0)
+#define TXCMCR_BTATYP			BIT(2)
+#define TXCMCR_BTAREQ			BIT(1)
+#define TXCMCR_TXREQ			BIT(0)
 #define TXCMSR				0x130
-#define TXCMSR_CLSNERR			(1 << 18)
-#define TXCMSR_AXIERR			(1 << 16)
-#define TXCMSR_TXREQEND			(1 << 0)
+#define TXCMSR_CLSNERR			BIT(18)
+#define TXCMSR_AXIERR			BIT(16)
+#define TXCMSR_TXREQEND			BIT(0)
 #define TXCMSCR				0x134
-#define TXCMSCR_CLSNERR			(1 << 18)
-#define TXCMSCR_AXIERR			(1 << 16)
-#define TXCMSCR_TXREQEND		(1 << 0)
+#define TXCMSCR_CLSNERR			BIT(18)
+#define TXCMSCR_AXIERR			BIT(16)
+#define TXCMSCR_TXREQEND		BIT(0)
 #define TXCMIER				0x138
-#define TXCMIER_CLSNERR			(1 << 18)
-#define TXCMIER_AXIERR			(1 << 16)
-#define TXCMIER_TXREQEND		(1 << 0)
+#define TXCMIER_CLSNERR			BIT(18)
+#define TXCMIER_AXIERR			BIT(16)
+#define TXCMIER_TXREQEND		BIT(0)
 #define TXCMADDRSET0R			0x140
 #define TXCMPHDR			0x150
-#define TXCMPHDR_FMT			(1 << 24)	/* 0:SP 1:LP */
+#define TXCMPHDR_FMT			BIT(24)	/* 0:SP 1:LP */
 #define TXCMPHDR_VC(n)			(((n) & 0x3) << 22)
 #define TXCMPHDR_DT(n)			(((n) & 0x3f) << 16)
 #define TXCMPHDR_DATA1(n)		(((n) & 0xff) << 8)
@@ -53,63 +53,63 @@
 #define RXSETR_CRCEN(n)			(((n) & 0xf) << 24)
 #define RXSETR_ECCEN(n)			(((n) & 0xf) << 16)
 #define RXPSETR				0x210
-#define RXPSETR_LPPDACC			(1 << 0)
+#define RXPSETR_LPPDACC			BIT(0)
 #define RXPSR				0x220
-#define RXPSR_ECCERR1B			(1 << 28)
-#define RXPSR_UEXTRGERR			(1 << 25)
-#define RXPSR_RESPTOERR			(1 << 24)
-#define RXPSR_OVRERR			(1 << 23)
-#define RXPSR_AXIERR			(1 << 22)
-#define RXPSR_CRCERR			(1 << 21)
-#define RXPSR_WCERR			(1 << 20)
-#define RXPSR_UEXDTERR			(1 << 19)
-#define RXPSR_UEXPKTERR			(1 << 18)
-#define RXPSR_ECCERR			(1 << 17)
-#define RXPSR_MLFERR			(1 << 16)
-#define RXPSR_RCVACK			(1 << 14)
-#define RXPSR_RCVEOT			(1 << 10)
-#define RXPSR_RCVAKE			(1 << 9)
-#define RXPSR_RCVRESP			(1 << 8)
-#define RXPSR_BTAREQEND			(1 << 0)
+#define RXPSR_ECCERR1B			BIT(28)
+#define RXPSR_UEXTRGERR			BIT(25)
+#define RXPSR_RESPTOERR			BIT(24)
+#define RXPSR_OVRERR			BIT(23)
+#define RXPSR_AXIERR			BIT(22)
+#define RXPSR_CRCERR			BIT(21)
+#define RXPSR_WCERR			BIT(20)
+#define RXPSR_UEXDTERR			BIT(19)
+#define RXPSR_UEXPKTERR			BIT(18)
+#define RXPSR_ECCERR			BIT(17)
+#define RXPSR_MLFERR			BIT(16)
+#define RXPSR_RCVACK			BIT(14)
+#define RXPSR_RCVEOT			BIT(10)
+#define RXPSR_RCVAKE			BIT(9)
+#define RXPSR_RCVRESP			BIT(8)
+#define RXPSR_BTAREQEND			BIT(0)
 #define RXPSCR				0x224
-#define RXPSCR_ECCERR1B			(1 << 28)
-#define RXPSCR_UEXTRGERR		(1 << 25)
-#define RXPSCR_RESPTOERR		(1 << 24)
-#define RXPSCR_OVRERR			(1 << 23)
-#define RXPSCR_AXIERR			(1 << 22)
-#define RXPSCR_CRCERR			(1 << 21)
-#define RXPSCR_WCERR			(1 << 20)
-#define RXPSCR_UEXDTERR			(1 << 19)
-#define RXPSCR_UEXPKTERR		(1 << 18)
-#define RXPSCR_ECCERR			(1 << 17)
-#define RXPSCR_MLFERR			(1 << 16)
-#define RXPSCR_RCVACK			(1 << 14)
-#define RXPSCR_RCVEOT			(1 << 10)
-#define RXPSCR_RCVAKE			(1 << 9)
-#define RXPSCR_RCVRESP			(1 << 8)
-#define RXPSCR_BTAREQEND		(1 << 0)
+#define RXPSCR_ECCERR1B			BIT(28)
+#define RXPSCR_UEXTRGERR		BIT(25)
+#define RXPSCR_RESPTOERR		BIT(24)
+#define RXPSCR_OVRERR			BIT(23)
+#define RXPSCR_AXIERR			BIT(22)
+#define RXPSCR_CRCERR			BIT(21)
+#define RXPSCR_WCERR			BIT(20)
+#define RXPSCR_UEXDTERR			BIT(19)
+#define RXPSCR_UEXPKTERR		BIT(18)
+#define RXPSCR_ECCERR			BIT(17)
+#define RXPSCR_MLFERR			BIT(16)
+#define RXPSCR_RCVACK			BIT(14)
+#define RXPSCR_RCVEOT			BIT(10)
+#define RXPSCR_RCVAKE			BIT(9)
+#define RXPSCR_RCVRESP			BIT(8)
+#define RXPSCR_BTAREQEND		BIT(0)
 #define RXPIER				0x228
-#define RXPIER_ECCERR1B			(1 << 28)
-#define RXPIER_UEXTRGERR		(1 << 25)
-#define RXPIER_RESPTOERR		(1 << 24)
-#define RXPIER_OVRERR			(1 << 23)
-#define RXPIER_AXIERR			(1 << 22)
-#define RXPIER_CRCERR			(1 << 21)
-#define RXPIER_WCERR			(1 << 20)
-#define RXPIER_UEXDTERR			(1 << 19)
-#define RXPIER_UEXPKTERR		(1 << 18)
-#define RXPIER_ECCERR			(1 << 17)
-#define RXPIER_MLFERR			(1 << 16)
-#define RXPIER_RCVACK			(1 << 14)
-#define RXPIER_RCVEOT			(1 << 10)
-#define RXPIER_RCVAKE			(1 << 9)
-#define RXPIER_RCVRESP			(1 << 8)
-#define RXPIER_BTAREQEND		(1 << 0)
+#define RXPIER_ECCERR1B			BIT(28)
+#define RXPIER_UEXTRGERR		BIT(25)
+#define RXPIER_RESPTOERR		BIT(24)
+#define RXPIER_OVRERR			BIT(23)
+#define RXPIER_AXIERR			BIT(22)
+#define RXPIER_CRCERR			BIT(21)
+#define RXPIER_WCERR			BIT(20)
+#define RXPIER_UEXDTERR			BIT(19)
+#define RXPIER_UEXPKTERR		BIT(18)
+#define RXPIER_ECCERR			BIT(17)
+#define RXPIER_MLFERR			BIT(16)
+#define RXPIER_RCVACK			BIT(14)
+#define RXPIER_RCVEOT			BIT(10)
+#define RXPIER_RCVAKE			BIT(9)
+#define RXPIER_RCVRESP			BIT(8)
+#define RXPIER_BTAREQEND		BIT(0)
 #define RXPADDRSET0R			0x230
 #define RXPSIZESETR			0x238
 #define RXPSIZESETR_SIZE(n)		(((n) & 0xf) << 3)
 #define RXPHDR				0x240
-#define RXPHDR_FMT			(1 << 24)	/* 0:SP 1:LP */
+#define RXPHDR_FMT			BIT(24)	/* 0:SP 1:LP */
 #define RXPHDR_VC(n)			(((n) & 0x3) << 22)
 #define RXPHDR_DT(n)			(((n) & 0x3f) << 16)
 #define RXPHDR_DATA1(n)			(((n) & 0xff) << 8)
@@ -128,38 +128,38 @@
 #define TASCR				0x514
 #define TAIER				0x518
 #define TOSR				0x610
-#define TOSR_TATO			(1 << 2)
-#define TOSR_LRXHTO			(1 << 1)
-#define TOSR_HRXTO			(1 << 0)
+#define TOSR_TATO			BIT(2)
+#define TOSR_LRXHTO			BIT(1)
+#define TOSR_HRXTO			BIT(0)
 #define TOSCR				0x614
-#define TOSCR_TATO			(1 << 2)
-#define TOSCR_LRXHTO			(1 << 1)
-#define TOSCR_HRXTO			(1 << 0)
+#define TOSCR_TATO			BIT(2)
+#define TOSCR_LRXHTO			BIT(1)
+#define TOSCR_HRXTO			BIT(0)
 
 /*
  * Video Mode Register
  */
 #define TXVMSETR			0x180
-#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16) /* 0:Pulses 1:Events */
-#define TXVMSETR_VSTPM			(1 << 15)
-#define TXVMSETR_PIXWDTH		(1 << 8)
-#define TXVMSETR_VSEN			(1 << 4)
-#define TXVMSETR_HFPBPEN		(1 << 2)
-#define TXVMSETR_HBPBPEN		(1 << 1)
-#define TXVMSETR_HSABPEN		(1 << 0)
+#define TXVMSETR_SYNSEQ_EVENTS		BIT(16) /* 0:Pulses 1:Events */
+#define TXVMSETR_VSTPM			BIT(15)
+#define TXVMSETR_PIXWDTH		BIT(8)
+#define TXVMSETR_VSEN			BIT(4)
+#define TXVMSETR_HFPBPEN		BIT(2)
+#define TXVMSETR_HBPBPEN		BIT(1)
+#define TXVMSETR_HSABPEN		BIT(0)
 
 #define TXVMCR				0x190
-#define TXVMCR_VFCLR			(1 << 12)
-#define TXVMCR_EN_VIDEO			(1 << 0)
+#define TXVMCR_VFCLR			BIT(12)
+#define TXVMCR_EN_VIDEO			BIT(0)
 
 #define TXVMSR				0x1a0
-#define TXVMSR_STR			(1 << 16)
-#define TXVMSR_VFRDY			(1 << 12)
-#define TXVMSR_ACT			(1 << 8)
-#define TXVMSR_RDY			(1 << 0)
+#define TXVMSR_STR			BIT(16)
+#define TXVMSR_VFRDY			BIT(12)
+#define TXVMSR_ACT			BIT(8)
+#define TXVMSR_RDY			BIT(0)
 
 #define TXVMSCR				0x1a4
-#define TXVMSCR_STR			(1 << 16)
+#define TXVMSCR_STR			BIT(16)
 
 #define TXVMPSPHSETR			0x1c0
 #define TXVMPSPHSETR_DT_MASK		(0x3f << 16)
@@ -170,10 +170,10 @@
 #define TXVMPSPHSETR_DT_YCBCR16		0x2c
 
 #define TXVMVPRMSET0R			0x1d0
-#define TXVMVPRMSET0R_HSPOL_LOW		(1 << 17) /* 0:High 1:Low */
-#define TXVMVPRMSET0R_VSPOL_LOW		(1 << 16) /* 0:High 1:Low */
-#define TXVMVPRMSET0R_CSPC_YCbCr	(1 << 4) /* 0:RGB 1:YCbCr */
-#define TXVMVPRMSET0R_BPP_MASK		(7 << 0)
+#define TXVMVPRMSET0R_HSPOL_LOW		BIT(17) /* 0:High 1:Low */
+#define TXVMVPRMSET0R_VSPOL_LOW		BIT(16) /* 0:High 1:Low */
+#define TXVMVPRMSET0R_CSPC_YCbCr	BIT(4) /* 0:RGB 1:YCbCr */
+#define TXVMVPRMSET0R_BPP_MASK		GENMASK(2, 0)
 #define TXVMVPRMSET0R_BPP_16		0
 #define TXVMVPRMSET0R_BPP_18		1
 #define TXVMVPRMSET0R_BPP_24		2
@@ -198,51 +198,51 @@
  * PHY-Protocol Interface (PPI) Registers
  */
 #define PPISETR				0x700
-#define PPISETR_DLEN_MASK		(0xf << 0)
-#define PPISETR_CLEN			(1 << 8)
+#define PPISETR_DLEN_MASK		GENMASK(3, 0)
+#define PPISETR_CLEN			BIT(8)
 
 #define PPICLCR				0x710
-#define PPICLCR_TXREQHS			(1 << 8)
-#define PPICLCR_TXULPSEXT		(1 << 1)
-#define PPICLCR_TXULPSCLK		(1 << 0)
+#define PPICLCR_TXREQHS			BIT(8)
+#define PPICLCR_TXULPSEXT		BIT(1)
+#define PPICLCR_TXULPSCLK		BIT(0)
 
 #define PPICLSR				0x720
-#define PPICLSR_HSTOLP			(1 << 27)
-#define PPICLSR_TOHS			(1 << 26)
-#define PPICLSR_STPST			(1 << 0)
+#define PPICLSR_HSTOLP			BIT(27)
+#define PPICLSR_TOHS			BIT(26)
+#define PPICLSR_STPST			BIT(0)
 
 #define PPICLSCR			0x724
-#define PPICLSCR_HSTOLP			(1 << 27)
-#define PPICLSCR_TOHS			(1 << 26)
+#define PPICLSCR_HSTOLP			BIT(27)
+#define PPICLSCR_TOHS			BIT(26)
 
 #define PPIDL0SR			0x740
-#define PPIDL0SR_DIR			(1 << 10)
-#define PPIDL0SR_STPST			(1 << 6)
+#define PPIDL0SR_DIR			BIT(10)
+#define PPIDL0SR_STPST			BIT(6)
 
 #define PPIDLSR				0x760
-#define PPIDLSR_STPST			(0xf << 0)
+#define PPIDLSR_STPST			GENMASK(3, 0)
 
 /*
  * Clocks registers
  */
 #define LPCLKSET			0x1000
-#define LPCLKSET_CKEN			(1 << 8)
+#define LPCLKSET_CKEN			BIT(8)
 #define LPCLKSET_LPCLKDIV(x)		(((x) & 0x3f) << 0)
 
 #define CFGCLKSET			0x1004
-#define CFGCLKSET_CKEN			(1 << 8)
+#define CFGCLKSET_CKEN			BIT(8)
 #define CFGCLKSET_CFGCLKDIV(x)		(((x) & 0x3f) << 0)
 
 #define DOTCLKDIV			0x1008
-#define DOTCLKDIV_CKEN			(1 << 8)
+#define DOTCLKDIV_CKEN			BIT(8)
 #define DOTCLKDIV_DOTCLKDIV(x)		(((x) & 0x3f) << 0)
 
 #define VCLKSET				0x100c
-#define VCLKSET_CKEN			(1 << 16)
-#define VCLKSET_COLOR_YCC		(1 << 8) /* 0:RGB 1:YCbCr */
+#define VCLKSET_CKEN			BIT(16)
+#define VCLKSET_COLOR_YCC		BIT(8) /* 0:RGB 1:YCbCr */
 #define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
 #define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
-#define VCLKSET_BPP_MASK		(3 << 2)
+#define VCLKSET_BPP_MASK		GENMASK(3, 2)
 #define VCLKSET_BPP_16			0
 #define VCLKSET_BPP_18			1
 #define VCLKSET_BPP_18L			2
@@ -250,24 +250,24 @@
 #define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
 
 #define VCLKEN				0x1010
-#define VCLKEN_CKEN			(1 << 0)
+#define VCLKEN_CKEN			BIT(0)
 
 #define PHYSETUP			0x1014
 #define PHYSETUP_HSFREQRANGE(x)		(((x) & 0x7f) << 16)
-#define PHYSETUP_HSFREQRANGE_MASK	(0x7f << 16)
+#define PHYSETUP_HSFREQRANGE_MASK	GENMASK(22, 16)
 #define PHYSETUP_CFGCLKFREQRANGE(x)	(((x) & 0x3f) << 8)
-#define PHYSETUP_SHUTDOWNZ		(1 << 1)
-#define PHYSETUP_RSTZ			(1 << 0)
+#define PHYSETUP_SHUTDOWNZ		BIT(1)
+#define PHYSETUP_RSTZ			BIT(0)
 
 #define CLOCKSET1			0x101c
-#define CLOCKSET1_LOCK_PHY		(1 << 17)
-#define CLOCKSET1_CLKSEL		(1 << 8)
-#define CLOCKSET1_CLKINSEL_MASK		(3 << 2)
+#define CLOCKSET1_LOCK_PHY		BIT(17)
+#define CLOCKSET1_CLKSEL		BIT(8)
+#define CLOCKSET1_CLKINSEL_MASK		GENMASK(3, 2)
 #define CLOCKSET1_CLKINSEL_EXTAL	0
 #define CLOCKSET1_CLKINSEL_DIG		1
 #define CLOCKSET1_CLKINSEL_DU		2
-#define CLOCKSET1_SHADOW_CLEAR		(1 << 1)
-#define CLOCKSET1_UPDATEPLL		(1 << 0)
+#define CLOCKSET1_SHADOW_CLEAR		BIT(1)
+#define CLOCKSET1_UPDATEPLL		BIT(0)
 
 #define CLOCKSET2			0x1020
 #define CLOCKSET2_M(x)			(((x) & 0xfff) << 16)
@@ -281,15 +281,15 @@
 #define CLOCKSET3_GMP_CNTRL(x)		(((x) & 0x3) << 0)
 
 #define PHTW				0x1034
-#define PHTW_DWEN			(1 << 24)
+#define PHTW_DWEN			BIT(24)
 #define PHTW_TESTDIN_DATA(x)		(((x) & 0xff) << 16)
-#define PHTW_CWEN			(1 << 8)
+#define PHTW_CWEN			BIT(8)
 #define PHTW_TESTDIN_CODE(x)		(((x) & 0xff) << 0)
 
 #define PHTR				0x1038
-#define PHTR_TEST			(1 << 16)
+#define PHTR_TEST			BIT(16)
 
 #define PHTC				0x103c
-#define PHTC_TESTCLR			(1 << 0)
+#define PHTC_TESTCLR			BIT(0)
 
 #endif /* __RCAR_MIPI_DSI_REGS_H__ */
-- 
2.51.0

