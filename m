Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19FC514504
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 11:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A5110FBE7;
	Fri, 29 Apr 2022 09:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E7110FBE7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 09:02:44 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id f14so5256842qtq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 02:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+89oAO86ydiGvNRr1qXWqQmX8G4rgyRzRmQYlJDSQoA=;
 b=ZcnXwo5//6N+ci+nwO9q5ypjPV7l4e8pTAmI/Nq4g1mbnh67hm6vSaKJ5N32g054oq
 S+norkfORNSyzH3+Kkp6DZJbPDLHbu3Tfv1BfyEqEhGKDItjU1hWsID6fuMHWi7OBSX5
 F6jl4Rp+/eokugIe8+0MxkogWj/TNCQ32fjjnjDmTDBWMiPWbGANhh0/8qeTnU4c4BBD
 ssQ4gJz5DSCfCGwdXPuJte64Akr5593hqBQNldjyn2VfHA+Be65sk/XnRaiFjvsukpPL
 bgLJPNK8J/Y/hJM1GXPfI2Zn5nIOmuqkbYqf2t+56JMuEl7sBVELqf++ZVtFCFXF68xS
 fCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+89oAO86ydiGvNRr1qXWqQmX8G4rgyRzRmQYlJDSQoA=;
 b=CAXwI2Da0YIgeO/LPk9/Bnku+j3BvBwIxV9aCxAQ7UuJ4p0BGLzOKn4m7GGPwxdrsf
 HbcBV2mWxHubs2mdCmf8uK4DTH3vQfZraU7nxVZQ05vvQqdHr8mEAt69U+1WevuTeLDm
 2qu/+8/V44DtVHhc2AXCm2hU54BK0WtHcuPuWmKvXBC5untauADPn8dBkrMD2WcwX/HW
 QMHLdyJEhwYHYoZ8M2XM7g4wY9s/XuPzkN0ErzPEPdNJ00UV+vcqBy6VXuiMJafUnqk4
 PccAiNH5twazbtCarFqj/xX3bn9eWi8iCSc1O4PVM4uVAiPvyFjGoTTtPFsUa/kPhEOQ
 ePaA==
X-Gm-Message-State: AOAM530a0oBk3tTlaa9ktC5ZRCYLBZloO2moZPj2cvfpSC8SpCQAXes/
 Q8GVAUu+z/IXdspgCUSf0HS9qMKZLjA=
X-Google-Smtp-Source: ABdhPJynceQU4nOjvDSdCTj0nX15G3svB7MoLxViEaLi23HhcHfplcwlFq24cdyu7s5htm2/AdsXtw==
X-Received: by 2002:a05:622a:2c4:b0:2f3:8743:6fc7 with SMTP id
 a4-20020a05622a02c400b002f387436fc7mr7208668qtx.187.1651222963712; 
 Fri, 29 Apr 2022 02:02:43 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 b28-20020a05620a271c00b0069f52b96667sm1188580qkp.53.2022.04.29.02.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 02:02:43 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: tomba@kernel.org
Subject: [PATCH] drm: omapdrm: simplify the return expression of
 dss_setup_default_clock()
Date: Fri, 29 Apr 2022 09:02:38 +0000
Message-Id: <20220429090238.3852941-1-chi.minghao@zte.com.cn>
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/omapdrm/dss/dss.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 0399f3390a0a..2f13805d85ba 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -672,7 +672,6 @@ static int dss_setup_default_clock(struct dss_device *dss)
 	unsigned long max_dss_fck, prate;
 	unsigned long fck;
 	unsigned int fck_div;
-	int r;
 
 	max_dss_fck = dss->feat->fck_freq_max;
 
@@ -687,11 +686,7 @@ static int dss_setup_default_clock(struct dss_device *dss)
 		    * dss->feat->dss_fck_multiplier;
 	}
 
-	r = dss_set_fck_rate(dss, fck);
-	if (r)
-		return r;
-
-	return 0;
+	return dss_set_fck_rate(dss, fck);
 }
 
 void dss_set_venc_output(struct dss_device *dss, enum omap_dss_venc_type type)
-- 
2.25.1


