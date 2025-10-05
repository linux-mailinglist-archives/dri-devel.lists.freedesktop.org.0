Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF28CBB93C3
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 05:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E9F10E31D;
	Sun,  5 Oct 2025 03:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="XrvRhzrj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bCIIQnHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E49210E31D
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 03:04:51 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cfS1Z13Xsz9sq6;
 Sun,  5 Oct 2025 05:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZK0zoHj+NrijzbETWnzCVHaPxcsJjM5YLid7gPer7uA=;
 b=XrvRhzrjFALmEynRAhECYU6x2+9LdUK4MMHHDeXkQIuOJBKpZL5QXQ5YJjKjoVIkJJOVId
 UAwAZEEdjFpgwLbw+h4ezHt4jgLxHRn+Q1cjNpghr8e7au6SkD+LVo53kLpP7FKn/vreAm
 n57xeqnpAaBZ1AA5TNFhBgvE6zaXitU1JzTieUJ5yOi1u4EmPxQd7f1ZAqSmV4+HjPfRYc
 udEDWFdAR/0lHsscs01i+URANwcP4T9UzJd9cvPl8kMAMmEYPb7PFRglDnYixgzi2U+D8S
 LDvbtu/jnLwwtuuDSsUXzsbJ5bgzKX3ErBaZDebCzs+PgXzLPcLByG6O3VwIkg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bCIIQnHg;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759633488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZK0zoHj+NrijzbETWnzCVHaPxcsJjM5YLid7gPer7uA=;
 b=bCIIQnHgPQGV+q3jBRW0xpSSN7/J6rebcBSj/hIOLNW2ndng0xJ8oS/i8NMRtaF9sc5f9z
 OOWgBq35BrqELhD5Tl9fPTsAVdxFO4URxagDgpSsms3fWxtEbiRuq8C3kUCo4A7hrsZTux
 Sga1OPzzXxrqj8EOu9CO/nqQWjkgGd4VA5DHgYRne8CnSwukJ/JyAfAjTFqzRBttOBMMS3
 0EiLMSYNVfry9ptRlbxGay0kMuDq0bpelWm8BT6VDQfzmEvfaqt7NKZ/xiu+ri18X9h5nw
 0z2Ji1kn/6iFm/zIOE1Ajo9Fk8Ao4NFPLDi2M2l8fvh6C0GsC+HIs+MjxjS6yw==
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
Subject: [PATCH v3 11/11] drm/rcar-du: dsi: Convert register bitfields to
 GENMASK() macro
Date: Sun,  5 Oct 2025 05:02:58 +0200
Message-ID: <20251005030355.202242-12-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 55moixis3b97e3dbsuhen8zwnaxxjcu6
X-MBO-RS-ID: 798e3543b76215ed547
X-Rspamd-Queue-Id: 4cfS1Z13Xsz9sq6
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

Convert register bitfields to GENMASK() macro where applicable.
Use FIELD_PREP() throughout the driver.

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
V2: No change
V3: Use GENMASK_U32() and inline FIELD_PREP()
---
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 118 +++++++++++-------
 1 file changed, 70 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 431a107ba54d8..79684184b3b0b 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -13,7 +13,7 @@
 #define LINKSR_HSBUSY			BIT_U32(0)
 
 #define TXSETR				0x100
-#define TXSETR_LANECNT_MASK		GENMASK(1, 0)
+#define TXSETR_LANECNT_MASK		GENMASK_U32(1, 0)
 
 /*
  * DSI Command Transfer Registers
@@ -40,18 +40,22 @@
 #define TXCMADDRSET0R			0x140
 #define TXCMPHDR			0x150
 #define TXCMPHDR_FMT			BIT_U32(24)	/* 0:SP 1:LP */
-#define TXCMPHDR_VC(n)			(((n) & 0x3) << 22)
-#define TXCMPHDR_DT(n)			(((n) & 0x3f) << 16)
-#define TXCMPHDR_DATA1(n)		(((n) & 0xff) << 8)
-#define TXCMPHDR_DATA0(n)		(((n) & 0xff) << 0)
+#define TXCMPHDR_VC_MASK		GENMASK_U32(23, 22)
+#define TXCMPHDR_VC(n)			FIELD_PREP(TXCMPHDR_VC_MASK, (n))
+#define TXCMPHDR_DT_MASK		GENMASK_U32(21, 16)
+#define TXCMPHDR_DT(n)			FIELD_PREP(TXCMPHDR_DT_MASK, (n))
+#define TXCMPHDR_DATA1_MASK		GENMASK_U32(15, 8)
+#define TXCMPHDR_DATA1(n)		FIELD_PREP(TXCMPHDR_DATA1_MASK, (n))
+#define TXCMPHDR_DATA0_MASK		GENMASK_U32(7, 0)
+#define TXCMPHDR_DATA0(n)		FIELD_PREP(TXCMPHDR_DATA0_MASK, (n))
 #define TXCMPPD0R			0x160
 #define TXCMPPD1R			0x164
 #define TXCMPPD2R			0x168
 #define TXCMPPD3R			0x16c
 
 #define RXSETR				0x200
-#define RXSETR_CRCEN(n)			(((n) & 0xf) << 24)
-#define RXSETR_ECCEN(n)			(((n) & 0xf) << 16)
+#define RXSETR_CRCEN_MASK		GENMASK_U32(27, 24)
+#define RXSETR_ECCEN_MASK		GENMASK_U32(19, 16)
 #define RXPSETR				0x210
 #define RXPSETR_LPPDACC			BIT_U32(0)
 #define RXPSR				0x220
@@ -107,21 +111,21 @@
 #define RXPIER_BTAREQEND		BIT_U32(0)
 #define RXPADDRSET0R			0x230
 #define RXPSIZESETR			0x238
-#define RXPSIZESETR_SIZE(n)		(((n) & 0xf) << 3)
+#define RXPSIZESETR_SIZE_MASK		GENMASK_U32(6, 3)
 #define RXPHDR				0x240
 #define RXPHDR_FMT			BIT_U32(24)	/* 0:SP 1:LP */
-#define RXPHDR_VC(n)			(((n) & 0x3) << 22)
-#define RXPHDR_DT(n)			(((n) & 0x3f) << 16)
-#define RXPHDR_DATA1(n)			(((n) & 0xff) << 8)
-#define RXPHDR_DATA0(n)			(((n) & 0xff) << 0)
+#define RXPHDR_VC_MASK			GENMASK_U32(23, 22)
+#define RXPHDR_DT_MASK			GENMASK_U32(21, 16)
+#define RXPHDR_DATA1_MASK		GENMASK_U32(15, 8)
+#define RXPHDR_DATA0_MASK		GENMASK_U32(7, 0)
 #define RXPPD0R				0x250
 #define RXPPD1R				0x254
 #define RXPPD2R				0x258
 #define RXPPD3R				0x25c
 #define AKEPR				0x300
-#define AKEPR_VC(n)			(((n) & 0x3) << 22)
-#define AKEPR_DT(n)			(((n) & 0x3f) << 16)
-#define AKEPR_ERRRPT(n)			(((n) & 0xffff) << 0)
+#define AKEPR_VC_MASK			GENMASK_U32(23, 22)
+#define AKEPR_DT_MASK			GENMASK_U32(21, 16)
+#define AKEPR_ERRRPT_MASK		GENMASK_U32(15, 0)
 #define RXRESPTOSETR			0x400
 #define TACR				0x500
 #define TASR				0x510
@@ -142,7 +146,7 @@
 #define TXVMSETR			0x180
 #define TXVMSETR_SYNSEQ_EVENTS		BIT_U32(16) /* 0:Pulses 1:Events */
 #define TXVMSETR_VSTPM			BIT_U32(15)
-#define TXVMSETR_PIXWDTH_MASK		GENMASK(10, 8)
+#define TXVMSETR_PIXWDTH_MASK		GENMASK_U32(10, 8)
 #define TXVMSETR_PIXWDTH		BIT_U32(8) /* Only allowed value */
 #define TXVMSETR_VSEN			BIT_U32(4)
 #define TXVMSETR_HFPBPEN		BIT_U32(2)
@@ -174,32 +178,40 @@
 #define TXVMVPRMSET0R_HSPOL_LOW		BIT_U32(17) /* 0:High 1:Low */
 #define TXVMVPRMSET0R_VSPOL_LOW		BIT_U32(16) /* 0:High 1:Low */
 #define TXVMVPRMSET0R_CSPC_YCbCr	BIT_U32(4) /* 0:RGB 1:YCbCr */
-#define TXVMVPRMSET0R_BPP_MASK		GENMASK(2, 0)
+#define TXVMVPRMSET0R_BPP_MASK		GENMASK_U32(2, 0)
 #define TXVMVPRMSET0R_BPP_16		FIELD_PREP(TXVMVPRMSET0R_BPP_MASK, 0)
 #define TXVMVPRMSET0R_BPP_18		FIELD_PREP(TXVMVPRMSET0R_BPP_MASK, 1)
 #define TXVMVPRMSET0R_BPP_24		FIELD_PREP(TXVMVPRMSET0R_BPP_MASK, 2)
 
 #define TXVMVPRMSET1R			0x1d4
-#define TXVMVPRMSET1R_VACTIVE(x)	(((x) & 0x7fff) << 16)
-#define TXVMVPRMSET1R_VSA(x)		(((x) & 0xfff) << 0)
+#define TXVMVPRMSET1R_VACTIVE_MASK	GENMASK_U32(30, 16)
+#define TXVMVPRMSET1R_VACTIVE(n)	FIELD_PREP(TXVMVPRMSET1R_VACTIVE_MASK, (n))
+#define TXVMVPRMSET1R_VSA_MASK		GENMASK_U32(11, 0)
+#define TXVMVPRMSET1R_VSA(n)		FIELD_PREP(TXVMVPRMSET1R_VSA_MASK, (n))
 
 #define TXVMVPRMSET2R			0x1d8
-#define TXVMVPRMSET2R_VFP(x)		(((x) & 0x1fff) << 16)
-#define TXVMVPRMSET2R_VBP(x)		(((x) & 0x1fff) << 0)
+#define TXVMVPRMSET2R_VFP_MASK		GENMASK_U32(28, 16)
+#define TXVMVPRMSET2R_VFP(n)		FIELD_PREP(TXVMVPRMSET2R_VFP_MASK, (n))
+#define TXVMVPRMSET2R_VBP_MASK		GENMASK_U32(12, 0)
+#define TXVMVPRMSET2R_VBP(n)		FIELD_PREP(TXVMVPRMSET2R_VBP_MASK, (n))
 
 #define TXVMVPRMSET3R			0x1dc
-#define TXVMVPRMSET3R_HACTIVE(x)	(((x) & 0x7fff) << 16)
-#define TXVMVPRMSET3R_HSA(x)		(((x) & 0xfff) << 0)
+#define TXVMVPRMSET3R_HACTIVE_MASK	GENMASK_U32(30, 16)
+#define TXVMVPRMSET3R_HACTIVE(n)	FIELD_PREP(TXVMVPRMSET3R_HACTIVE_MASK, (n))
+#define TXVMVPRMSET3R_HSA_MASK		GENMASK_U32(11, 0)
+#define TXVMVPRMSET3R_HSA(n)		FIELD_PREP(TXVMVPRMSET3R_HSA_MASK, (n))
 
 #define TXVMVPRMSET4R			0x1e0
-#define TXVMVPRMSET4R_HFP(x)		(((x) & 0x1fff) << 16)
-#define TXVMVPRMSET4R_HBP(x)		(((x) & 0x1fff) << 0)
+#define TXVMVPRMSET4R_HFP_MASK		GENMASK_U32(28, 16)
+#define TXVMVPRMSET4R_HFP(n)		FIELD_PREP(TXVMVPRMSET4R_HFP_MASK, (n))
+#define TXVMVPRMSET4R_HBP_MASK		GENMASK_U32(12, 0)
+#define TXVMVPRMSET4R_HBP(n)		FIELD_PREP(TXVMVPRMSET4R_HBP_MASK, (n))
 
 /*
  * PHY-Protocol Interface (PPI) Registers
  */
 #define PPISETR				0x700
-#define PPISETR_DLEN_MASK		GENMASK(3, 0)
+#define PPISETR_DLEN_MASK		GENMASK_U32(3, 0)
 #define PPISETR_CLEN			BIT_U32(8)
 
 #define PPICLCR				0x710
@@ -221,49 +233,52 @@
 #define PPIDL0SR_STPST			BIT_U32(6)
 
 #define PPIDLSR				0x760
-#define PPIDLSR_STPST			GENMASK(3, 0)
+#define PPIDLSR_STPST			GENMASK_U32(3, 0)
 
 /*
  * Clocks registers
  */
 #define LPCLKSET			0x1000
 #define LPCLKSET_CKEN			BIT_U32(8)
-#define LPCLKSET_LPCLKDIV(x)		(((x) & 0x3f) << 0)
+#define LPCLKSET_LPCLKDIV_MASK		GENMASK_U32(5, 0)
 
 #define CFGCLKSET			0x1004
 #define CFGCLKSET_CKEN			BIT_U32(8)
-#define CFGCLKSET_CFGCLKDIV(x)		(((x) & 0x3f) << 0)
+#define CFGCLKSET_CFGCLKDIV_MASK	GENMASK_U32(5, 0)
 
 #define DOTCLKDIV			0x1008
 #define DOTCLKDIV_CKEN			BIT_U32(8)
-#define DOTCLKDIV_DOTCLKDIV(x)		(((x) & 0x3f) << 0)
+#define DOTCLKDIV_DOTCLKDIV_MASK	GENMASK_U32(5, 0)
 
 #define VCLKSET				0x100c
 #define VCLKSET_CKEN			BIT_U32(16)
 #define VCLKSET_COLOR_YCC		BIT_U32(8) /* 0:RGB 1:YCbCr */
-#define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
-#define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
-#define VCLKSET_BPP_MASK		GENMASK(3, 2)
+#define VCLKSET_DIV_V3U_MASK		GENMASK_U32(5, 4)
+#define VCLKSET_DIV_V3U(n)		FIELD_PREP(VCLKSET_DIV_V3U_MASK, (n))
+#define VCLKSET_DIV_V4H_MASK		GENMASK_U32(6, 4)
+#define VCLKSET_DIV_V4H(n)		FIELD_PREP(VCLKSET_DIV_V4H_MASK, (n))
+#define VCLKSET_BPP_MASK		GENMASK_U32(3, 2)
 #define VCLKSET_BPP_16			FIELD_PREP(VCLKSET_BPP_MASK, 0)
 #define VCLKSET_BPP_18			FIELD_PREP(VCLKSET_BPP_MASK, 1)
 #define VCLKSET_BPP_18L			FIELD_PREP(VCLKSET_BPP_MASK, 2)
 #define VCLKSET_BPP_24			FIELD_PREP(VCLKSET_BPP_MASK, 3)
-#define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
+#define VCLKSET_LANE_MASK		GENMASK_U32(1, 0)
+#define VCLKSET_LANE(n)			FIELD_PREP(VCLKSET_LANE_MASK, (n))
 
 #define VCLKEN				0x1010
 #define VCLKEN_CKEN			BIT_U32(0)
 
 #define PHYSETUP			0x1014
-#define PHYSETUP_HSFREQRANGE(x)		(((x) & 0x7f) << 16)
-#define PHYSETUP_HSFREQRANGE_MASK	GENMASK(22, 16)
-#define PHYSETUP_CFGCLKFREQRANGE(x)	(((x) & 0x3f) << 8)
+#define PHYSETUP_HSFREQRANGE_MASK	GENMASK_U32(22, 16)
+#define PHYSETUP_HSFREQRANGE(n)		FIELD_PREP(PHYSETUP_HSFREQRANGE_MASK, (n))
+#define PHYSETUP_CFGCLKFREQRANGE_MASK	GENMASK_U32(13, 8)
 #define PHYSETUP_SHUTDOWNZ		BIT_U32(1)
 #define PHYSETUP_RSTZ			BIT_U32(0)
 
 #define CLOCKSET1			0x101c
 #define CLOCKSET1_LOCK_PHY		BIT_U32(17)
 #define CLOCKSET1_CLKSEL		BIT_U32(8)
-#define CLOCKSET1_CLKINSEL_MASK		GENMASK(3, 2)
+#define CLOCKSET1_CLKINSEL_MASK		GENMASK_U32(3, 2)
 #define CLOCKSET1_CLKINSEL_EXTAL	FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 0)
 #define CLOCKSET1_CLKINSEL_DIG		FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 1)
 #define CLOCKSET1_CLKINSEL_DU		FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 2)
@@ -271,24 +286,31 @@
 #define CLOCKSET1_UPDATEPLL		BIT_U32(0)
 
 #define CLOCKSET2			0x1020
-#define CLOCKSET2_M(x)			(((x) & 0xfff) << 16)
-#define CLOCKSET2_VCO_CNTRL(x)		(((x) & 0x3f) << 8)
-#define CLOCKSET2_N(x)			(((x) & 0xf) << 0)
+#define CLOCKSET2_M_MASK		GENMASK_U32(27, 16)
+#define CLOCKSET2_M(n)			FIELD_PREP(CLOCKSET2_M_MASK, (n))
+#define CLOCKSET2_VCO_CNTRL_MASK	GENMASK_U32(13, 8)
+#define CLOCKSET2_VCO_CNTRL(n)		FIELD_PREP(CLOCKSET2_VCO_CNTRL_MASK, (n))
+#define CLOCKSET2_N_MASK		GENMASK_U32(3, 0)
+#define CLOCKSET2_N(n)			FIELD_PREP(CLOCKSET2_N_MASK, (n))
 
 #define CLOCKSET3			0x1024
-#define CLOCKSET3_PROP_CNTRL(x)		(((x) & 0x3f) << 24)
-#define CLOCKSET3_INT_CNTRL(x)		(((x) & 0x3f) << 16)
-#define CLOCKSET3_CPBIAS_CNTRL(x)	(((x) & 0x7f) << 8)
-#define CLOCKSET3_GMP_CNTRL(x)		(((x) & 0x3) << 0)
+#define CLOCKSET3_PROP_CNTRL_MASK	GENMASK_U32(29, 24)
+#define CLOCKSET3_PROP_CNTRL(n)	FIELD_PREP(CLOCKSET3_PROP_CNTRL_MASK, (n))
+#define CLOCKSET3_INT_CNTRL_MASK	GENMASK_U32(21, 16)
+#define CLOCKSET3_INT_CNTRL(n)		FIELD_PREP(CLOCKSET3_INT_CNTRL_MASK, (n))
+#define CLOCKSET3_CPBIAS_CNTRL_MASK	GENMASK_U32(14, 8)
+#define CLOCKSET3_CPBIAS_CNTRL(n)	FIELD_PREP(CLOCKSET3_CPBIAS_CNTRL_MASK, (n))
+#define CLOCKSET3_GMP_CNTRL_MASK	GENMASK_U32(1, 0)
+#define CLOCKSET3_GMP_CNTRL(n)		FIELD_PREP(CLOCKSET3_GMP_CNTRL_MASK, (n))
 
 #define PHTW				0x1034
 #define PHTW_DWEN			BIT_U32(24)
-#define PHTW_TESTDIN_DATA(x)		(((x) & 0xff) << 16)
+#define PHTW_TESTDIN_DATA_MASK		GENMASK_U32(23, 16)
 #define PHTW_CWEN			BIT_U32(8)
-#define PHTW_TESTDIN_CODE(x)		(((x) & 0xff) << 0)
+#define PHTW_TESTDIN_CODE_MASK		GENMASK_U32(15, 0)
 
 #define PHTR				0x1038
-#define PHTW_TESTDOUT			GENMASK(23, 16)
+#define PHTW_TESTDOUT			GENMASK_U32(23, 16)
 #define PHTR_TESTDOUT_TEST		BIT_U32(16)
 
 #define PHTC				0x103c
-- 
2.51.0

