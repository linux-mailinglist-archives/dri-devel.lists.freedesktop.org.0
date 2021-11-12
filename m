Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2044E0BD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 04:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFF06E4EA;
	Fri, 12 Nov 2021 03:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079186E4EA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 03:21:45 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id g19so7323392pfb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 19:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WR5AGczr091yNTi2gDGKy+tB2yNi+2EZuQhR7DLAXiY=;
 b=U6/mW9tKxTplgdMbWP+vVfSVbURkU1CtAekOBs5Ck7yFeJFWD0CAfIt/wVJEm5nNtt
 SUnORTS2EyRE4mfYE8f3zmp3m3cJYUPua30CstN/u9/nLzuGkvy4sEeEuySkz6yc/OnE
 dk7Jf8DpBWZe8zilm7c5WCV/wZ7usO6nkJUd9NKuwgj18dLzINDRW7cLXHG2Mq/ho4BK
 6cgAoo6ITXPHrGZbNpme7MD1Gpd8y87WqOICFGdnh6CkpZHn13pthkT0IHe2svHl02My
 xYpEN4+UJ03/hOPulFqMbKf9YWXKPIUCRdn7/rqiq5137vpdqxgZLyjlndAQTyboQVX1
 moeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WR5AGczr091yNTi2gDGKy+tB2yNi+2EZuQhR7DLAXiY=;
 b=sWD+6s4V54Jxhf1EVJhXgbMY/9vykhyDuFnJXPewBVnSgNIrlWSgkz3QgdBkh2+3uD
 lLBwqQ5J6Yljn2qP4f+6wkNzw3xCTxCJFfjIpSc3YAH2AESRZ8XorlGt+AfhzgO1yEn9
 ytbvYB7yxpp743OvCRJlji0ViZyE7KLCeRkm6Hi/xlsQ+YM3ErkCpNsVU9X3nQlxgHjj
 xeG9YJQr9wHB0Pqcn4031kNwrf5F9JXxbuMHkmtao0i/lMDOfgzs5TpkTIfPmFKANHTq
 3KjbTl1A6CiJaLLw2i+fHuCjQkxYzClM6EapCQcKgtqRDNPGF4w5reOpb4QG9V/fObe0
 Tmug==
X-Gm-Message-State: AOAM533wMnyO2afoYMlaIcL+SKduCBt2ZKVoEp6WXVjvLQRZMRvmHmiH
 4dsMGyRTobelnZpU3SGGsdI23v9LmoE=
X-Google-Smtp-Source: ABdhPJxrqxnneJ2ksSxKG2ubvACd0PbawIumj0slhgQu7cRLF0Kxr8LSMeRBO1a8jSw9InIGtSgdkA==
X-Received: by 2002:a05:6a00:230d:b0:49f:b8ad:ae23 with SMTP id
 h13-20020a056a00230d00b0049fb8adae23mr11130812pfh.80.1636687304678; 
 Thu, 11 Nov 2021 19:21:44 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id e15sm4587224pfv.131.2021.11.11.19.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 19:21:44 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: thierry.reding@gmail.com
Subject: [PATCH] drivers:gpu: remove unneeded variable
Date: Fri, 12 Nov 2021 03:21:02 +0000
Message-Id: <20211112032102.5289-1-chi.minghao@zte.com.cn>
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cm>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, chiminghao <chi.minghao@zte.com.cn>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: chiminghao <chi.minghao@zte.com.cn>

Fix the following coccicheck REVIEW:
./drivers/gpu/drm/tegra/dpaux.c:282:13-16 REVIEW Unneeded variable

Reported-by: Zeal Robot <zealci@zte.com.cm>
Signed-off-by: chiminghao <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/tegra/dpaux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 1f96e416fa08..b65b21f26d2b 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -279,7 +279,6 @@ static void tegra_dpaux_hotplug(struct work_struct *work)
 static irqreturn_t tegra_dpaux_irq(int irq, void *data)
 {
 	struct tegra_dpaux *dpaux = data;
-	irqreturn_t ret = IRQ_HANDLED;
 	u32 value;
 
 	/* clear interrupts */
@@ -296,7 +295,7 @@ static irqreturn_t tegra_dpaux_irq(int irq, void *data)
 	if (value & DPAUX_INTR_AUX_DONE)
 		complete(&dpaux->complete);
 
-	return ret;
+	return IRQ_HANDLED;
 }
 
 enum tegra_dpaux_functions {
-- 
2.25.1

