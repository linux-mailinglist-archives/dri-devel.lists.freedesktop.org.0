Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BB7A3824E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 12:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5E510E438;
	Mon, 17 Feb 2025 11:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lvPW2mCL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8321610E438
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:53:27 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43935d1321aso3083755e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 03:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739793206; x=1740398006; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tgWx1O98lxWOuf2pUGZf2+wF+nxvuU7wTS9vVKBBrYU=;
 b=lvPW2mCLMreFUiQ/llwosk01n9SJ5yhFXd1/i//yPUXLk4upGPeu+rWY9rxLq/nnMY
 nd6gehzel84nrhKCB/NlaedAqIjjbnbnNt0a9y6j+qvqWWhtZM7/Knf88MDtHd15yvq8
 s0kMyxuucyLLN7bgqsaiMgV5b70fLX4g+OBz+GFodMBijXXYfKnxYI8387A9VqbMD5Hg
 HlRUxt9BRzy1zJzp7RTamvnhIa+oQBQ71tfWwgNEsOG6/oUqKtuoU0qgY+TkV/mxhCiX
 p6CxmtCsVwGfnaKe02hti19nZzyS0uoyu3XIZgnV2EilwL4ej7f/FibzzhI9RJ3IVmaf
 WWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739793206; x=1740398006;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tgWx1O98lxWOuf2pUGZf2+wF+nxvuU7wTS9vVKBBrYU=;
 b=sJbdHei5Y5cBkxY2TxtRYCHnVaANfZV6KXJ+gcfbvch+jVUEA5pRWPfxqejhs5oNvq
 GVhvr5HmnJwDRZQv5r7w9NSdcmeLmPUNEDqGAjzWh4ivxObd0lHA7y2m1pfdH7nu7qVJ
 mhbDwxjY7cRe5dzOwJfbAu3SNyh5Gy8O93EvhxgTdk49iemaaQfbb328pORwcAREZBXH
 rj1qORlj9eeSCA8nVD2rmTe2J7YQSrow6HwPcY02q6ZZd94iOPL8RHLA2dioAOcOHwol
 wFRpojjT6uY2e6waR1xdQeGfpAnKsBkuUsA0eYJkRZ2FnVjr6Pjg2E7XK6uA8EHQ3wrN
 EMZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3H7jY05xaQN7EOAnarH5gBdzHnUgfMHi8SFPx0tp4zuAeegX5ODuaq13VzuPMKSxrzlWaKTLMcmM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNv3BXjiR1fYC2BMgl1o1ZQ16wGU5XUHFTRmG7DzOLWU26leWN
 5YGEAJDgYWjzLbEMzO6Vx4wEKmLOe/3dopUErX4awhpVcpm/e5QNRYAdk9dlPSI=
X-Gm-Gg: ASbGnctburjk+BAPtHHmGxXd6RqO3mknoifWjip6dpNeARPaQRicn4p8C89MpiI4yA4
 YaSqsNP1HTRCYapd0gCcJRqNTE8gD80Br7nmk5ead7f696Rqvf+RdZFxbmmJ/3QFTiVb1FLIBSV
 pnGJ5uePlpu2/0w8D2Z0PrzgwLNdel1Rk+ub8McoUCH4BsdB+jAxQbkY62G61OHscevDUeilrZr
 z273JFlM5cRBlfj9MpkKINs1R8soBpbtqO02jeeN/o4WHTTJZbVf4s8P/jp5YzbemGXnox/mHbH
 noUNHsHRyZEneR7h3T5wjPt4nl7LjNk=
X-Google-Smtp-Source: AGHT+IENBpGOOCFfXQ2oU+u0lvPVoTf/HoOUkdK7JIiHIZbTU/t9CaTNX3kn8py3uSDeAAwKZRr4DQ==
X-Received: by 2002:a05:600c:154d:b0:439:6103:d2de with SMTP id
 5b1f17b1804b1-4396e78e432mr36085435e9.7.1739793206047; 
 Mon, 17 Feb 2025 03:53:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8397sm150212575e9.36.2025.02.17.03.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:53:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 12:53:14 +0100
Subject: [PATCH v4 1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated
 from driver side
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-drm-msm-phy-pll-cfg-reg-v4-1-106b0d1df51e@linaro.org>
References: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
In-Reply-To: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3488;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VSoo9tOfvx5J/rILKbc9JGnlfjdESe0PpUUegqGlGK4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnsyMuKJttLyTWP9K0UPqf4QMjwl4tteEV/CcIb
 UADWxj71/2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7MjLgAKCRDBN2bmhouD
 11xLD/9x4qurO23zU/hodHy295lsiPZHU24L4380Y9aoU1JpwtPWdySzx5OkgyZP/e5qdO5zccs
 H8tRCcPP8KP+gBceRgwAYKv5dZ1GseSMvfPCL17nIcns1QC3LseIXD8VzW+sT84r10gPPWg9sT+
 wT9fTJK99166K8b3RBCz2DCKX3/Wp7b2vWSeumk86EsGV/rovQm+xLzjwUBwCQZu7vUZJlsId47
 bxooued62Jd03oXxlKmHp4OdwSLg0/JWDGtcleuw9UAuL3oOsjo0W6jJraImo0wH/V4YxPg+DB7
 BpXlRNBlzjzQylj4hpfyyxnpogDEuJK2HBGkhJQdKtdmfdj80N/4wJ0h1K98BCBu5oCqfrJakl3
 9jvcmV3mnea2/MCifQErjHX2RTQEB7j7RuntOn8zFVCb0atFBZAumvQBLZFL7ZsHS5HoEmkEExx
 UDYTOAaY/Upy4QkptQ/l2csvmQ93z3xpDtoFxJGemPmEnQs0NhbrcCNZB6ZbbiFo/dIdWAk29pY
 4pIhpqM3OjpRnezrG/ai0E6uKOpUOC0SpwWGIELKt9/6E0NMCiOcnL+v2k3UWpoB0H3+sy2snlN
 gmrAyN+ITOKbEbVBddWqVCcFXlphEfhoR8f2uAm29x9NE2j6BXqjmnLRjC+WeqlvSHZZGP2sQEe
 Lo1anelF8vcMvXQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
divider clocks from Common Clock Framework:
devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
clocks side is protected with spinlock, however driver's side in
restoring state is not.  Restoring state is called from
msm_dsi_phy_enable(), so there could be a path leading to concurrent and
conflicting updates with clock framework.

Add missing lock usage on the PHY driver side, encapsulated in its own
function so the code will be still readable.

While shuffling the code, define and use PHY_CMN_CLK_CFG0 bitfields to
make the code more readable and obvious.

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Define bitfields (move here parts from patch #4)
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 14 ++++++++++++--
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  5 ++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 031446c87daec0af3f81df324158311f5a80014e..25ca649de717eaeec603c520bbaa603ece244d3c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 	ndelay(250);
 }
 
+static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&pll->postdiv_lock, flags);
+	writel(val, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
+}
+
 static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
 {
 	u32 data;
@@ -574,8 +583,9 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	val |= cached->pll_out_div;
 	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 
-	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
-	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
+				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(cached->bit_clk_div) |
+				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(cached->pix_clk_div));
 
 	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	val &= ~0x3;
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index d54b72f924493b4bf0925c287366f7b1e18eb46b..e0bf6e016b4ce5b35f73fce7b8e371456b88e3ac 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -9,7 +9,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x00004" name="REVISION_ID1"/>
 	<reg32 offset="0x00008" name="REVISION_ID2"/>
 	<reg32 offset="0x0000c" name="REVISION_ID3"/>
-	<reg32 offset="0x00010" name="CLK_CFG0"/>
+	<reg32 offset="0x00010" name="CLK_CFG0">
+		<bitfield name="DIV_CTRL_3_0" low="0" high="3" type="uint"/>
+		<bitfield name="DIV_CTRL_7_4" low="4" high="7" type="uint"/>
+	</reg32>
 	<reg32 offset="0x00014" name="CLK_CFG1"/>
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>

-- 
2.43.0

