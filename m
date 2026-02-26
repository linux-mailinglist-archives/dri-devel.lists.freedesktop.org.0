Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEjODug8oGmrhAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:30:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62421A5B3F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A8410E91B;
	Thu, 26 Feb 2026 12:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KkOLTyVh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482C610E91A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 12:30:29 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2ad9a9be502so5266385ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 04:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772109029; x=1772713829; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E8bAx33DCcpAj247sU4+Wz28zAQ8myXVbly7seQhZNI=;
 b=KkOLTyVhGvmx5o1/faVi9rSeBrVDhIiwfZURkMhdDo3Axg3nYANi6bjhfRdIjqJyeS
 1Yia3UMUwu9dnR7lW+tamX+ZqICPhcDqKZm/eoU6uSuJSZcnvAFmv0JGA0KYKLimvopf
 h4j8gMPECzp1ERxwK5USOQPYMPNErOTIo3lsyYDTv0cApm4aBp0kM+3Kfr06/lNsVoUI
 5LPkvWP+Wbd4LwdR/Z2w7dDADDH8EtrXr6MrSw2cD8dQgrkGYu1qUFbTOCBahhJebiSG
 wB6gZtr3eQfL2x95+eRWIDhUtkotvinC8Nn8YXbpgE0MiiVOW7lllOjS6NylMbo/HlCs
 E2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772109029; x=1772713829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E8bAx33DCcpAj247sU4+Wz28zAQ8myXVbly7seQhZNI=;
 b=r7ymEdZCc6kLKpmB1ZEQ3nOJADtU3WzlSxQDdOl9qqf7z3puRUATh0pAyqRnj9EVI/
 mVNri6t4mQXXfYdlCgoAw9+dueMY1ZR9v2a0037Gjy6Od1ikudYnIFrusC5fX6E/8MhZ
 y+sW52b0y5sien4bAbgQdQ0e78sNKaOf8AppIS0CbZWqtBFDeZ166ULooaLku1IHFKK5
 sMKIKM7TTEiKjDBne6HT/1JtMyhcruJcauoSL3HoJN0cJxkfhEhvtzbfBxGhGc1xfHnY
 QDhqxYO9pvVH5vXTURv9gGUBn3xsg1y2VvwfkGzhsnOPIWHsmkXwxnklgLaVYAY9kDuZ
 m7ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCViJlvjhK20hACpHwm6zErCSoANYeEEB0OvxoEhjphgyoGiq4rtodgQo2PHyeNbU4x4MLxRVM6hIjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh8Nm/98T4kV7Bofy7vkaCTWdVdOe9i1qh91R8r5W/ZxWqCTyd
 H0kf+uiB39Wr44B0hlgBdWb9G9qu/FT4SrSs/xnc7fERr7VIQbklQwSG
X-Gm-Gg: ATEYQzzG14p88WV087olXtsU0RGipoYQxFCR2Bw3Zq8nv+98AImahwl2BU4VYocJzu4
 v5S+k1nYhaGF+IeRsFTHrrb9HRpL9ff669wBa4Rg1YsofAl9HkMAZSQWG/OsmX84XjE31Mvkgl6
 l35RTNP/34++aXI+iQddmP36t01G5alLkSQtwWsYgtNFaAtMo1EKKu25KeuyLTVzKFMZ8v0DF60
 57fZPKExXGU2TWHw3NoK1xq9wz76/CtxzzdwwTQb/DyTVD32q7bVMSSu0IMZHyqRVgtCw6CXOjg
 iAYqytIRdnozmHREwPz9CjTDPxhsTAxCYKJuddn9NMdCzW3t8Dlh3BiZGuRTIpY6jiKauKI8Tic
 z/PSURqjy/053sawUuTZzdPQOmYHpOpNRxS4arBB7q0PVK2r6LRddk3iftLpOtSwOkrdVEmtyiL
 pexnzeivfMMwJKC6Zx
X-Received: by 2002:a17:902:f68c:b0:2a0:c35c:572e with SMTP id
 d9443c01a7336-2ade9a3783dmr44069415ad.30.1772109028595; 
 Thu, 26 Feb 2026 04:30:28 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5b22e7sm25504125ad.3.2026.02.26.04.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 04:30:28 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pengyu Luo <mitltlatltl@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 2/2] drm/msm/dsi/phy: rename DSI_PHY_7NM_QUIRK_PRE_V4_1 to
 DSI_PHY_7NM_QUIRK_V4_0
Date: Thu, 26 Feb 2026 20:29:58 +0800
Message-ID: <20260226122958.22555-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226122958.22555-1-mitltlatltl@gmail.com>
References: <20260226122958.22555-1-mitltlatltl@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:broonie@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D62421A5B3F
X-Rspamd-Action: no action

The quirk flag DSI_PHY_7NM_QUIRK_PRE_V4_1 is renamed to
DSI_PHY_7NM_QUIRK_V4_0 to better reflect the actual hardware revision
it applies to. (Only SM8150 uses it, its hardware revision is 4.0)

No functional change.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 01182442d..8f4b03713 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -41,8 +41,8 @@
 #define VCO_REF_CLK_RATE		19200000
 #define FRAC_BITS 18
 
-/* Hardware is pre V4.1 */
-#define DSI_PHY_7NM_QUIRK_PRE_V4_1	BIT(0)
+/* Hardware is V4.0 */
+#define DSI_PHY_7NM_QUIRK_V4_0		BIT(0)
 /* Hardware is V4.1 */
 #define DSI_PHY_7NM_QUIRK_V4_1		BIT(1)
 /* Hardware is V4.2 */
@@ -141,7 +141,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
 	dec_multiple = div_u64(pll_freq * multiplier, divider);
 	dec = div_u64_rem(dec_multiple, multiplier, &frac);
 
-	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) {
+	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_0) {
 		config->pll_clock_inverters = 0x28;
 	} else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)) {
 		if (pll_freq < 163000000ULL)
@@ -264,7 +264,7 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	void __iomem *base = pll->phy->pll_base;
 	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
 
-	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
+	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_0))
 		if (pll->vco_current_rate >= 3100000000ULL)
 			analog_controls_five_1 = 0x03;
 
@@ -313,10 +313,10 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	writel(0x29, base + REG_DSI_7nm_PHY_PLL_PFILT);
 	writel(0x2f, base + REG_DSI_7nm_PHY_PLL_PFILT);
 	writel(0x2a, base + REG_DSI_7nm_PHY_PLL_IFILT);
-	writel(!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) ? 0x3f : 0x22,
+	writel(!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_0) ? 0x3f : 0x22,
 	       base + REG_DSI_7nm_PHY_PLL_IFILT);
 
-	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)) {
+	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_0)) {
 		writel(0x22, base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE);
 		if (pll->slave)
 			writel(0x22, pll->slave->phy->pll_base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE);
@@ -928,7 +928,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
 	const u8 *tx_dctrl = tx_dctrl_0;
 	void __iomem *lane_base = phy->lane_base;
 
-	if (!(phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
+	if (!(phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_0))
 		tx_dctrl = tx_dctrl_1;
 
 	/* Strength ctrl settings */
@@ -1319,7 +1319,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
-	.quirks = DSI_PHY_7NM_QUIRK_PRE_V4_1,
+	.quirks = DSI_PHY_7NM_QUIRK_V4_0,
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
-- 
2.53.0

