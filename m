Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB664B3F31
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 03:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1353E10E17C;
	Mon, 14 Feb 2022 02:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79F310E17C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 02:05:37 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id o3so14310164qtm.12
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 18:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8dYgaqbyzaZ4a+XQK3SFxEhLH9q+oOb32bnkEUBxzw=;
 b=KV84/vMa70N+J/DIogaMTUeES93B0syybArjN7osEoJOSpOCp9rYn9jWzfGEXqMSKo
 Cy1KPWa6R3Lw2UQX1knSyRtUQRvWh1o/6c3KCLlBnTL53cLn8FGqBoaJUqnZnTHnZ7cr
 DqiZ38ciDR0TVM/igfYdpd/fBStNq4SjqFzhHkI4hdxcQG+AhVndWxS2kg2XE06hVbOz
 WT2s2yZW1YSvlhlc4ZRedB5SMpaNp34X5xLJo7BcX56WPLpzhA2hfaWLs/BEl9KODo2X
 DOmOPSTmhO4AeM549//yiQlS3o6pGkRyrjHWSlRLo/u5Lk1aveys4XPkUuLitNRzUy4j
 tWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8dYgaqbyzaZ4a+XQK3SFxEhLH9q+oOb32bnkEUBxzw=;
 b=QvRyYiqlGuj8B+Bm4jCtUmHmcGWjw9Ud1EHyP/Arpz6eZ8oUuqjz8A13wI9ewaXhHI
 pVf9HMyyW22vXhnfUHWp1FPXfFWy3yV1jtKbSatk+VQwiAdB+3oVlP32OewzDgDxrzR3
 R2fWS8OLPiheR/O43O1DdwPLa+cDBO/6LO6wnbMv3DBgEAaa9v2V2k0agB6FIu/BB85E
 DRt6NGlQ5ajP9bbU/0NjisqY/ZVm5/EV5ZTlfxm73v1/+2v/nVXoS011a2wpMCualtGs
 fZgC4Uogw2d4W+spjjbqRR++59sTYAWExpRWg3I6AneGXqz9WZb99UjfgmL2bSuF7BOA
 YP1w==
X-Gm-Message-State: AOAM53018/aycJY5hd1dpMgEcw32dsqTHsFSen+3cqHDlaW6nl8ThBv+
 30KvgB+gj+Up6uI6f0PsDG0=
X-Google-Smtp-Source: ABdhPJw+RLbcabsgmELQsb14jJa1NSKg6RdpkA7E1IVL2FwAU5mE916WH2ux+C01+YMT4Zr0JOqpMA==
X-Received: by 2002:ac8:5992:: with SMTP id e18mr8111155qte.66.1644804336919; 
 Sun, 13 Feb 2022 18:05:36 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id b9sm14652626qkj.24.2022.02.13.18.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 18:05:36 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: emma@anholt.net
Subject: [PATCH] drm/vc4: Use of_device_get_match_data()
Date: Mon, 14 Feb 2022 02:05:30 +0000
Message-Id: <20220214020530.1714631-1-chi.minghao@zte.com.cn>
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
 linux-kernel@vger.kernel.org,
 "Minghao Chi \(CGEL ZTE\)" <chi.minghao@zte.com.cn>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>

Use of_device_get_match_data() to simplify the code.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 9300d3354c51..752f921735c6 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1493,15 +1493,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 	struct vc4_dsi_encoder *vc4_dsi_encoder;
-	const struct of_device_id *match;
 	dma_cap_mask_t dma_mask;
 	int ret;
 
-	match = of_match_device(vc4_dsi_dt_match, dev);
-	if (!match)
-		return -ENODEV;
-
-	dsi->variant = match->data;
+	dsi->variant = of_device_get_match_data(dev);
 
 	vc4_dsi_encoder = devm_kzalloc(dev, sizeof(*vc4_dsi_encoder),
 				       GFP_KERNEL);
-- 
2.25.1

