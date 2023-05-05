Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4106F7A08
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 02:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0E710E1EF;
	Fri,  5 May 2023 00:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328DD10E1EF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 00:20:49 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-24e1d272b09so912588a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 May 2023 17:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683246048; x=1685838048; 
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=8TmpvJbU96K5mWAE+i9LXk7p3PZGa9UIfo8DUIyUZ0c=;
 b=LSbtL8+iwnX5GqWaGBkCj5rkG6Gk0y6hZi+1w189U0O1tCpGD2Jutew6l7t00+dHHM
 pmmTo2/kAT2zb4bZQ0AjNDI6QlsMybGTy8m+4VKZQG3FPpbhOR4GwsQYHTo1JSrYTtSq
 j1toePpqa6F4s3B12xkrFCc+UiRr62QzyiMy9O0juqjTlObi9W6dP4l8w6PcYjf+DcMI
 DDloLYjO69NWdgdFxg9r4fWhltlDq3NNHeRGUSiHau4SwNxHUXaUbQ/RXnd8RenvO0e4
 Hh5VRijo3++skLzX7LkAV7l2JC2q4j27oeaQzVzEl4iSKl9g7maZbyXCp/JzF7u1gxmZ
 9RwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683246048; x=1685838048;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8TmpvJbU96K5mWAE+i9LXk7p3PZGa9UIfo8DUIyUZ0c=;
 b=B/rZ/tLM0mXZxULWXCbMFzgj7kWTHbLhothzXoVnu26AfTeLAvb9eT1CvbS9rV7ew9
 hiu/AANgONKmIpvfoB5uMbnA7Qz+l41stFiRs2LufSp3AO7KR33H8P8h11fx0GOqcpBA
 oAGJ4Ot3DF0B9wmaAGAQgLrGptEjhBq8F/evQ5Nx3k0XeX7cHjpbfRGmaGDQtBymXQ58
 8u9mOQx6KNU0LuIiaNVEo5B59gp0yKrUvAQTcEC9FZsNWQ/+piDSe0OL2e3eTHuwosjv
 L2hV31UxJ9lJksvpsIayO40mwKPiwOEfguLF6HwtPIhtHtIcgEx+a5cUBGYdCP67O7cN
 Dw1g==
X-Gm-Message-State: AC+VfDwkfka8KrK0TLd5HYxvifHf187UNuqxUpTGtFAv6ibFYKg8797+
 OFPPcgvTs1EpNXrI64BhXWfUEg==
X-Google-Smtp-Source: ACHHUZ43/6VUqC/4H/Fyb8yXxZtcJhQwJ+Pf66SFGn86RioprdSlGVfrxR7XKatPpG2zpuh26E5OqA==
X-Received: by 2002:a17:90b:3e83:b0:24d:dc79:5901 with SMTP id
 rj3-20020a17090b3e8300b0024ddc795901mr3994645pjb.26.1683246047965; 
 Thu, 04 May 2023 17:20:47 -0700 (PDT)
Received: from localhost ([135.180.227.0]) by smtp.gmail.com with ESMTPSA id
 cq2-20020a17090af98200b002470b9503desm3659179pjb.55.2023.05.04.17.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 17:20:47 -0700 (PDT)
Subject: [PATCH] phy: mediatek: Remove unusued ret and check
Date: Thu,  4 May 2023 17:19:46 -0700
Message-Id: <20230505001945.10179-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@rivosinc.com>
To: vkoul@kernel.org
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
Cc: kishon@kernel.org, chunkuang.hu@kernel.org, linux@rivosinc.com,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
 chunfeng.yun@mediatek.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Palmer Dabbelt <palmer@rivosinc.com>

This trips up a maybe-uninitialized warning, but it's actually just not
used.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I just stumbled into this one when trying to test Linus' master.  I'm
not sure it's a sane fix, but I'm not using the driver.  No rush no my
end, I'll just keep the fix around in my local tree for now.
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index abfc077fb0a8..3fc0913ec73b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -213,7 +213,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
 	u8 txpredivs[4] = { 2, 4, 6, 12 };
 	u32 fbkdiv_low;
-	int i, ret;
+	int i;
 
 	pixel_clk = rate;
 	tmds_clk = pixel_clk;
@@ -295,8 +295,6 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
 			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
 			    txposdiv, digital_div);
-	if (ret)
-		return -EINVAL;
 
 	return 0;
 }
-- 
2.40.0

