Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771915141E8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 07:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057C010FB4F;
	Fri, 29 Apr 2022 05:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713DB10FB4F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 05:47:59 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id iy15so4699805qvb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 22:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dmvctIow+IO8H7sfWVaNo+LfAgPKgXEAs61yE8oSiDQ=;
 b=oWiP1HCeTyemawgY2i30abE82xuGfAhqLYQ4az+d0RtVLrsc1W7y1QyPjWaHLwJNqQ
 v5cN/pTLQDNQO5acKAGmD1z2ODP3qmycMQLZ5D9JNR7gMrkfrGRuQ8hrjv7HIobEx++B
 Hxqv+O+18Bf1gmt8Y262IYlcex1TU7dElzqAlLPr+o57Rpgy35WLiShRzSPommRWRdsy
 OL2yD7pyRm0Dl3wMgkfvT3jrGH+LpEOb6zfnL0x8UHw8WPKo1Z4mMY7lBAvMNWqraoYy
 Eck7aVOyDPlrVnNMNNRGRSzvRyaxJ95QvJduLeLtXefZykn8XfJjjTSuLOOT73isEZUM
 DzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dmvctIow+IO8H7sfWVaNo+LfAgPKgXEAs61yE8oSiDQ=;
 b=k/7h+2CDjYgmFjJ9U6LZMZvcJhQmvvGRjbMZtpdjjC6vJATx84esgwCIeL2NtxlGkp
 g9o4NQqWdrdXuivjQWYrkZHQcKt7+AIUNWlWnhyqBLsHANzCuI98wk+8qWaCvkTj3B82
 iryCNZk6O/fzAr5Ajl+C/5W0+P67cK/YghlqNxE+809Iut/Yh8WsJYuwMcpdsJYGJvap
 YwsVWiTXxBWxBOQSpptziJSbdZoh7mYBDwL/ZIiILqBLenowsyJeaTgz7NW3sHlbd8Wn
 ms+UluA1KxxcuCjgADyiSyp2Eann1K1qENilT5XIeQ7Dm+kaMqM+ZokIIktXQA054pNu
 UUOw==
X-Gm-Message-State: AOAM530rUrSYvvMDvXfaNZ+fgE1gPd7LpOHZMz2LGkR1Obq1sp0qdoC3
 oMgCXbS5VlyZQ2/ueEyvQgI=
X-Google-Smtp-Source: ABdhPJywgs83ZsnO6SkmFFnrihPXpXj6JdK9JpVZwtn37Q80rvE/ZAmW9KtZfoLczSxU8F+4hfgL0g==
X-Received: by 2002:ad4:444a:0:b0:456:52bc:41cb with SMTP id
 l10-20020ad4444a000000b0045652bc41cbmr8229203qvt.54.1651211278445; 
 Thu, 28 Apr 2022 22:47:58 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05620a0d5400b0069c71a71ed3sm925303qkl.33.2022.04.28.22.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 22:47:58 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: deller@gmx.de
Subject: [PATCH] omapfb: simplify the return expression of dsi_init_pll_data()
Date: Fri, 29 Apr 2022 05:47:51 +0000
Message-Id: <20220429054751.3851851-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
index c5f89129dcdd..531b36d2232b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
@@ -173,7 +173,6 @@ static int dsi_init_pll_data(struct platform_device *pdev, struct hdmi_pll_data
 {
 	struct dss_pll *pll = &hpll->pll;
 	struct clk *clk;
-	int r;
 
 	clk = devm_clk_get(&pdev->dev, "sys_clk");
 	if (IS_ERR(clk)) {
@@ -203,12 +202,7 @@ static int dsi_init_pll_data(struct platform_device *pdev, struct hdmi_pll_data
 	}
 
 	pll->ops = &dsi_pll_ops;
-
-	r = dss_pll_register(pll);
-	if (r)
-		return r;
-
-	return 0;
+	return dss_pll_register(pll);
 }
 
 int hdmi_pll_init(struct platform_device *pdev, struct hdmi_pll_data *pll,
-- 
2.25.1


