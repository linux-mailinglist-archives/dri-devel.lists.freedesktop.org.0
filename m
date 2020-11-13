Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E833E2B1C2F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA446E51D;
	Fri, 13 Nov 2020 13:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0946E51D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:49:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o15so9986766wru.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlKk1bN1CES0mgH+wUmCXkMlZA1CVtbOfxEG6y0GM50=;
 b=OcVFHvgowhYl0ECvQLfpLorqw2RlulROMnX4KA0JdKlQSLv9mVUpHCZi3/3LowHNyd
 pPbib+JUF/TZx8WcxyO/ewyRBfjMIKS3UtXxxiapN+aLc3DL3tKjsK1RstnLzU6A7OOu
 raaPYzUHAk9pQHEX8DdhINPQHyXgCWD+EGqFlUaImR9oRRNSCrg3RwlpBO1rA8gRThur
 5ufXOxBBG3r/CwQgQ17S2gixxqvFYvcJhY5owIsbOAQnLy+muaiTQpOZiviP7ChJaRsR
 WQ+DcU7lcgVDScBOZS3SuTdJr7c9G5qztri+ctAZ9PmmnfGvXcyuvz22sG4Ynfu8k5ZR
 rg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlKk1bN1CES0mgH+wUmCXkMlZA1CVtbOfxEG6y0GM50=;
 b=fUI17zldREopI8WUJz0O0+IML61Mql3We/eCFwmcOnMRxeUPpkWT6NyaUT+7+XxrZN
 +f93R1GcYAygJF2cc1LiYnTE6RjJnUSRHuXDMfal1xIs6svp73xnl1Bgp5omWmrS/Ld7
 i8N3zMJ8orces95HqncV4BcwuWNFNrOYtS2v19CXKToGaLcFFXEM9oY/QpshrKgNmhrj
 GZXPaq1Kl9sjyQKiRHX3nNLVAwy6qiCCt+tX5Ke1oHgFUTMrVAI/kU4nyt6oUXNSLTrf
 SXAEMaSj/8bxBbtoIetOPqsNRleH2ZVXKLP28ZzBUq7/j9/df0MQBD5IrFe8kNyafh2+
 PjWA==
X-Gm-Message-State: AOAM5303XTLW0CsFzRh9ndHiHtjBAfMq7eqeaXLiRF/Vhab/aYW2p02V
 RRQMVXKYLVEuuxiMBjD2oWyW3w==
X-Google-Smtp-Source: ABdhPJyXHSTj58kWv9AHJ2Kd4IYB+cK8mVPoSovQ0Eu/M93IyXpZFI4npYQc9WOZVFn6vm9pr1K9Lg==
X-Received: by 2002:adf:ead1:: with SMTP id o17mr3629612wrn.396.1605275391038; 
 Fri, 13 Nov 2020 05:49:51 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/40] drm/mediatek/mtk_disp_rdma: Fix formatting and supply
 missing struct member description
Date: Fri, 13 Nov 2020 13:49:05 +0000
Message-Id: <20201113134938.4004947-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:66: warning: Function parameter or member 'ddp_comp' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:66: warning: Function parameter or member 'crtc' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:66: warning: Function parameter or member 'data' not described in 'mtk_disp_rdma'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index e04319fedf463..d46b8ae1d0800 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -56,8 +56,9 @@ struct mtk_disp_rdma_data {
 
 /**
  * struct mtk_disp_rdma - DISP_RDMA driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
+ * @ddp_comp: structure containing type enum and hardware resources
+ * @crtc: associated crtc to report irq events to
+ * @data: local driver data
  */
 struct mtk_disp_rdma {
 	struct mtk_ddp_comp		ddp_comp;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
