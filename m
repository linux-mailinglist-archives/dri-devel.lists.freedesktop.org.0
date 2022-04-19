Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ECB506DB5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E6E10EFB1;
	Tue, 19 Apr 2022 13:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F48210EFAF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:40:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CBB7361693;
 Tue, 19 Apr 2022 13:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC1DC385A7;
 Tue, 19 Apr 2022 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375615;
 bh=1fFZ/OaS6ZClv/BpTxI65DDId5sPYXRbQkpa111wNoQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SBrvXLW2zVcL4oM2JTZy14QIztOs2NeSPSDRvDSB3PuiYhuyfupqTrAe+sUpRjYJq
 C/GKYP7Rr9OBPx8TOivj54uZ/4cXN37y81WRHLpyqeduJN/AM1rmWK3+dm/5sDrwI9
 e3AxiT/oXlEkctIWbmZCggqIVuL8YwyCPnAoJx7rwxuppFXSO2ULPPBCiTLjkiOoCg
 S/UwEjtXMKx8ZQN9AOp41OaXzVVEqbYRCJZmKXTbrmszKg/NpZ+SET8KE+jVSLFVb+
 DFVTEAALkLMldn2MDi+hmjX7hK5Y3kLvxKHS8N/zSEh0KKiqkmrzORHtQInIHNThua
 RAvesC2+gnbAA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 21/41] ARM: omap1: dma: remove omap2 specific bits
Date: Tue, 19 Apr 2022 15:37:03 +0200
Message-Id: <20220419133723.1394715-22-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

No part of plat-omap/dma.c is called on omap2 any more, so
anything omap2 specific in here can simply be removed.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/plat-omap/dma.c | 217 ++++++++++-----------------------------
 1 file changed, 55 insertions(+), 162 deletions(-)

diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/plat-omap/dma.c
index b7757864d0aa..eb14528f133c 100644
--- a/arch/arm/plat-omap/dma.c
+++ b/arch/arm/plat-omap/dma.c
@@ -34,11 +34,9 @@
 
 #include <linux/omap-dma.h>
 
-#ifdef CONFIG_ARCH_OMAP1
 #include <mach/hardware.h>
 #include <linux/soc/ti/omap1-io.h>
 #include <linux/soc/ti/omap1-soc.h>
-#endif
 
 /*
  * MAX_LOGICAL_DMA_CH_COUNT: the maximum number of logical DMA
@@ -51,16 +49,7 @@
 
 #undef DEBUG
 
-#ifndef CONFIG_ARCH_OMAP1
-enum { DMA_CH_ALLOC_DONE, DMA_CH_PARAMS_SET_DONE, DMA_CH_STARTED,
-	DMA_CH_QUEUED, DMA_CH_NOTSTARTED, DMA_CH_PAUSED, DMA_CH_LINK_ENABLED
-};
-
-enum { DMA_CHAIN_STARTED, DMA_CHAIN_NOTSTARTED };
-#endif
-
 #define OMAP_DMA_ACTIVE			0x01
-#define OMAP2_DMA_CSR_CLEAR_MASK	0xffffffff
 
 #define OMAP_FUNC_MUX_ARM_BASE		(0xfffe1000 + 0xec)
 
@@ -94,13 +83,9 @@ static inline void omap_disable_channel_irq(int lch)
 	/* disable channel interrupts */
 	p->dma_write(0, CICR, lch);
 	/* Clear CSR */
-	if (dma_omap1())
-		p->dma_read(CSR, lch);
-	else
-		p->dma_write(OMAP2_DMA_CSR_CLEAR_MASK, CSR, lch);
+	p->dma_read(CSR, lch);
 }
 
-#ifdef CONFIG_ARCH_OMAP1
 static inline void set_gdma_dev(int req, int dev)
 {
 	u32 reg = OMAP_FUNC_MUX_ARM_BASE + ((req - 1) / 5) * 4;
@@ -112,11 +97,6 @@ static inline void set_gdma_dev(int req, int dev)
 	l |= (dev - 1) << shift;
 	omap_writel(l, reg);
 }
-#else
-#define set_gdma_dev(req, dev)	do {} while (0)
-#define omap_readl(reg)		0
-#define omap_writel(val, reg)	do {} while (0)
-#endif
 
 #ifdef CONFIG_ARCH_OMAP1
 void omap_set_dma_priority(int lch, int dst_port, int priority)
@@ -181,59 +161,24 @@ void omap_set_dma_transfer_params(int lch, int data_type, int elem_count,
 				  int dma_trigger, int src_or_dst_synch)
 {
 	u32 l;
+	u16 ccr;
 
 	l = p->dma_read(CSDP, lch);
 	l &= ~0x03;
 	l |= data_type;
 	p->dma_write(l, CSDP, lch);
 
-	if (dma_omap1()) {
-		u16 ccr;
-
-		ccr = p->dma_read(CCR, lch);
-		ccr &= ~(1 << 5);
-		if (sync_mode == OMAP_DMA_SYNC_FRAME)
-			ccr |= 1 << 5;
-		p->dma_write(ccr, CCR, lch);
-
-		ccr = p->dma_read(CCR2, lch);
-		ccr &= ~(1 << 2);
-		if (sync_mode == OMAP_DMA_SYNC_BLOCK)
-			ccr |= 1 << 2;
-		p->dma_write(ccr, CCR2, lch);
-	}
-
-	if (dma_omap2plus() && dma_trigger) {
-		u32 val;
-
-		val = p->dma_read(CCR, lch);
-
-		/* DMA_SYNCHRO_CONTROL_UPPER depends on the channel number */
-		val &= ~((1 << 23) | (3 << 19) | 0x1f);
-		val |= (dma_trigger & ~0x1f) << 14;
-		val |= dma_trigger & 0x1f;
-
-		if (sync_mode & OMAP_DMA_SYNC_FRAME)
-			val |= 1 << 5;
-		else
-			val &= ~(1 << 5);
-
-		if (sync_mode & OMAP_DMA_SYNC_BLOCK)
-			val |= 1 << 18;
-		else
-			val &= ~(1 << 18);
-
-		if (src_or_dst_synch == OMAP_DMA_DST_SYNC_PREFETCH) {
-			val &= ~(1 << 24);	/* dest synch */
-			val |= (1 << 23);	/* Prefetch */
-		} else if (src_or_dst_synch) {
-			val |= 1 << 24;		/* source synch */
-		} else {
-			val &= ~(1 << 24);	/* dest synch */
-		}
-		p->dma_write(val, CCR, lch);
-	}
+	ccr = p->dma_read(CCR, lch);
+	ccr &= ~(1 << 5);
+	if (sync_mode == OMAP_DMA_SYNC_FRAME)
+		ccr |= 1 << 5;
+	p->dma_write(ccr, CCR, lch);
 
+	ccr = p->dma_read(CCR2, lch);
+	ccr &= ~(1 << 2);
+	if (sync_mode == OMAP_DMA_SYNC_BLOCK)
+		ccr |= 1 << 2;
+	p->dma_write(ccr, CCR2, lch);
 	p->dma_write(elem_count, CEN, lch);
 	p->dma_write(frame_count, CFN, lch);
 }
@@ -241,7 +186,7 @@ EXPORT_SYMBOL(omap_set_dma_transfer_params);
 
 void omap_set_dma_channel_mode(int lch, enum omap_dma_channel_mode mode)
 {
-	if (dma_omap1() && !dma_omap15xx()) {
+	if (!dma_omap15xx()) {
 		u32 l;
 
 		l = p->dma_read(LCH_CTRL, lch);
@@ -258,15 +203,12 @@ void omap_set_dma_src_params(int lch, int src_port, int src_amode,
 			     int src_ei, int src_fi)
 {
 	u32 l;
+	u16 w;
 
-	if (dma_omap1()) {
-		u16 w;
-
-		w = p->dma_read(CSDP, lch);
-		w &= ~(0x1f << 2);
-		w |= src_port << 2;
-		p->dma_write(w, CSDP, lch);
-	}
+	w = p->dma_read(CSDP, lch);
+	w &= ~(0x1f << 2);
+	w |= src_port << 2;
+	p->dma_write(w, CSDP, lch);
 
 	l = p->dma_read(CCR, lch);
 	l &= ~(0x03 << 12);
@@ -304,26 +246,15 @@ void omap_set_dma_src_burst_mode(int lch, enum omap_dma_burst_mode burst_mode)
 	case OMAP_DMA_DATA_BURST_DIS:
 		break;
 	case OMAP_DMA_DATA_BURST_4:
-		if (dma_omap2plus())
-			burst = 0x1;
-		else
-			burst = 0x2;
+		burst = 0x2;
 		break;
 	case OMAP_DMA_DATA_BURST_8:
-		if (dma_omap2plus()) {
-			burst = 0x2;
-			break;
-		}
 		/*
 		 * not supported by current hardware on OMAP1
 		 * w |= (0x03 << 7);
 		 */
 		fallthrough;
 	case OMAP_DMA_DATA_BURST_16:
-		if (dma_omap2plus()) {
-			burst = 0x3;
-			break;
-		}
 		/* OMAP1 don't support burst 16 */
 		fallthrough;
 	default:
@@ -342,12 +273,10 @@ void omap_set_dma_dest_params(int lch, int dest_port, int dest_amode,
 {
 	u32 l;
 
-	if (dma_omap1()) {
-		l = p->dma_read(CSDP, lch);
-		l &= ~(0x1f << 9);
-		l |= dest_port << 9;
-		p->dma_write(l, CSDP, lch);
-	}
+	l = p->dma_read(CSDP, lch);
+	l &= ~(0x1f << 9);
+	l |= dest_port << 9;
+	p->dma_write(l, CSDP, lch);
 
 	l = p->dma_read(CCR, lch);
 	l &= ~(0x03 << 14);
@@ -385,22 +314,12 @@ void omap_set_dma_dest_burst_mode(int lch, enum omap_dma_burst_mode burst_mode)
 	case OMAP_DMA_DATA_BURST_DIS:
 		break;
 	case OMAP_DMA_DATA_BURST_4:
-		if (dma_omap2plus())
-			burst = 0x1;
-		else
-			burst = 0x2;
+		burst = 0x2;
 		break;
 	case OMAP_DMA_DATA_BURST_8:
-		if (dma_omap2plus())
-			burst = 0x2;
-		else
-			burst = 0x3;
+		burst = 0x3;
 		break;
 	case OMAP_DMA_DATA_BURST_16:
-		if (dma_omap2plus()) {
-			burst = 0x3;
-			break;
-		}
 		/* OMAP1 don't support burst 16 */
 		fallthrough;
 	default:
@@ -416,10 +335,7 @@ EXPORT_SYMBOL(omap_set_dma_dest_burst_mode);
 static inline void omap_enable_channel_irq(int lch)
 {
 	/* Clear CSR */
-	if (dma_omap1())
-		p->dma_read(CSR, lch);
-	else
-		p->dma_write(OMAP2_DMA_CSR_CLEAR_MASK, CSR, lch);
+	p->dma_read(CSR, lch);
 
 	/* Enable some nice interrupts. */
 	p->dma_write(dma_chan[lch].enabled_irqs, CICR, lch);
@@ -437,8 +353,7 @@ static inline void enable_lnk(int lch)
 
 	l = p->dma_read(CLNK_CTRL, lch);
 
-	if (dma_omap1())
-		l &= ~(1 << 14);
+	l &= ~(1 << 14);
 
 	/* Set the ENABLE_LNK bits */
 	if (dma_chan[lch].next_lch != -1)
@@ -456,15 +371,8 @@ static inline void disable_lnk(int lch)
 	/* Disable interrupts */
 	omap_disable_channel_irq(lch);
 
-	if (dma_omap1()) {
-		/* Set the STOP_LNK bit */
-		l |= 1 << 14;
-	}
-
-	if (dma_omap2plus()) {
-		/* Clear the ENABLE_LNK bit */
-		l &= ~(1 << 15);
-	}
+	/* Set the STOP_LNK bit */
+	l |= 1 << 14;
 
 	p->dma_write(l, CLNK_CTRL, lch);
 	dma_chan[lch].flags &= ~OMAP_DMA_ACTIVE;
@@ -508,8 +416,7 @@ int omap_request_dma(int dev_id, const char *dev_name,
 
 	chan->enabled_irqs = OMAP_DMA_DROP_IRQ | OMAP_DMA_BLOCK_IRQ;
 
-	if (dma_omap1())
-		chan->enabled_irqs |= OMAP1_DMA_TOUT_IRQ;
+	chan->enabled_irqs |= OMAP1_DMA_TOUT_IRQ;
 
 	if (dma_omap16xx()) {
 		/* If the sync device is set, configure it dynamically. */
@@ -522,7 +429,7 @@ int omap_request_dma(int dev_id, const char *dev_name,
 		 * id.
 		 */
 		p->dma_write(dev_id | (1 << 10), CCR, free_ch);
-	} else if (dma_omap1()) {
+	} else {
 		p->dma_write(dev_id, CCR, free_ch);
 	}
 
@@ -739,8 +646,7 @@ dma_addr_t omap_get_dma_src_pos(int lch)
 			offset = p->dma_read(CSSA, lch);
 	}
 
-	if (dma_omap1())
-		offset |= (p->dma_read(CSSA, lch) & 0xFFFF0000);
+	offset |= (p->dma_read(CSSA, lch) & 0xFFFF0000);
 
 	return offset;
 }
@@ -778,8 +684,7 @@ dma_addr_t omap_get_dma_dst_pos(int lch)
 			offset = p->dma_read(CDSA, lch);
 	}
 
-	if (dma_omap1())
-		offset |= (p->dma_read(CDSA, lch) & 0xFFFF0000);
+	offset |= (p->dma_read(CDSA, lch) & 0xFFFF0000);
 
 	return offset;
 }
@@ -796,9 +701,8 @@ int omap_dma_running(void)
 {
 	int lch;
 
-	if (dma_omap1())
-		if (omap_lcd_dma_running())
-			return 1;
+	if (omap_lcd_dma_running())
+		return 1;
 
 	for (lch = 0; lch < dma_chan_count; lch++)
 		if (p->dma_read(CCR, lch) & OMAP_DMA_CCR_EN)
@@ -809,8 +713,6 @@ int omap_dma_running(void)
 
 /*----------------------------------------------------------------------------*/
 
-#ifdef CONFIG_ARCH_OMAP1
-
 static int omap1_dma_handle_ch(int ch)
 {
 	u32 csr;
@@ -863,10 +765,6 @@ static irqreturn_t omap1_dma_irq_handler(int irq, void *dev_id)
 	return handled ? IRQ_HANDLED : IRQ_NONE;
 }
 
-#else
-#define omap1_dma_irq_handler	NULL
-#endif
-
 struct omap_system_dma_plat_info *omap_get_plat_info(void)
 {
 	return p;
@@ -912,29 +810,27 @@ static int omap_system_dma_probe(struct platform_device *pdev)
 		if (ch >= 6 && enable_1510_mode)
 			continue;
 
-		if (dma_omap1()) {
-			/*
-			 * request_irq() doesn't like dev_id (ie. ch) being
-			 * zero, so we have to kludge around this.
-			 */
-			sprintf(&irq_name[0], "%d", ch);
-			dma_irq = platform_get_irq_byname(pdev, irq_name);
-
-			if (dma_irq < 0) {
-				ret = dma_irq;
-				goto exit_dma_irq_fail;
-			}
-
-			/* INT_DMA_LCD is handled in lcd_dma.c */
-			if (dma_irq == INT_DMA_LCD)
-				continue;
-
-			ret = request_irq(dma_irq,
-					omap1_dma_irq_handler, 0, "DMA",
-					(void *) (ch + 1));
-			if (ret != 0)
-				goto exit_dma_irq_fail;
+		/*
+		 * request_irq() doesn't like dev_id (ie. ch) being
+		 * zero, so we have to kludge around this.
+		 */
+		sprintf(&irq_name[0], "%d", ch);
+		dma_irq = platform_get_irq_byname(pdev, irq_name);
+
+		if (dma_irq < 0) {
+			ret = dma_irq;
+			goto exit_dma_irq_fail;
 		}
+
+		/* INT_DMA_LCD is handled in lcd_dma.c */
+		if (dma_irq == INT_DMA_LCD)
+			continue;
+
+		ret = request_irq(dma_irq,
+				omap1_dma_irq_handler, 0, "DMA",
+				(void *) (ch + 1));
+		if (ret != 0)
+			goto exit_dma_irq_fail;
 	}
 
 	/* reserve dma channels 0 and 1 in high security devices on 34xx */
@@ -954,9 +850,6 @@ static int omap_system_dma_remove(struct platform_device *pdev)
 {
 	int dma_irq, irq_rel = 0;
 
-	if (dma_omap2plus())
-		return 0;
-
 	for ( ; irq_rel < dma_chan_count; irq_rel++) {
 		dma_irq = platform_get_irq(pdev, irq_rel);
 		free_irq(dma_irq, (void *)(irq_rel + 1));
-- 
2.29.2

