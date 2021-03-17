Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D69333EBBE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 09:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463D16E503;
	Wed, 17 Mar 2021 08:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 940 seconds by postgrey-1.36 at gabe;
 Wed, 17 Mar 2021 07:42:46 UTC
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2960589A7A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 07:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Qtn8+
 btActA3yRVKwroBj6KrwpUMXfwBi44efCfGx7E=; b=AW7OmkXfKVD5lCEZK0jEk
 aUYV5AVWOBO5yWCYFbVQfGID6u6Wezs9wtBXZJ1zTdhvPPMBUY2fDXOiWZ3uhSLu
 U/2HiuI1dtfj0LzLPqLsynt8rHctVK7F2LoMMxr4Cj+YEvvC/GSxTPkkMK/aDUy9
 uhgdbJDdoJ0IYnB+NjEBCc=
Received: from COOL-20200911ZP.ccdomain.com (unknown [218.94.48.178])
 by smtp14 (Coremail) with SMTP id EsCowABXXgLBrlFgqQUIZQ--.44099S2;
 Wed, 17 Mar 2021 15:25:01 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de
Subject: [PATCH] the print is redundant because platform_get_irq()
Date: Wed, 17 Mar 2021 15:24:43 +0800
Message-Id: <20210317072443.286-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: EsCowABXXgLBrlFgqQUIZQ--.44099S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFyfXw43XryDWryfCFy7trb_yoW3CFX_Ca
 1kZrnruFWFvr98Zr1ayr13Ary2vFs09r40qF98ta4Svr9xCryUXr9F9rnIvF4kWa97ZFyD
 X3s5WFyF9rnIkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0RBTUUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiZQ1YUV8ZNQWSjAAAsJ
X-Mailman-Approved-At: Wed, 17 Mar 2021 08:42:48 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, tangchunyou@yulong.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: tangchunyou <tangchunyou@yulong.com>

already prints an error.

Signed-off-by: tangchunyou <tangchunyou@yulong.com>
---
 drivers/gpu/drm/mediatek/mtk_cec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index cb29b64..332a4df 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -208,10 +208,8 @@ static int mtk_cec_probe(struct platform_device *pdev)
 	}
 
 	cec->irq = platform_get_irq(pdev, 0);
-	if (cec->irq < 0) {
-		dev_err(dev, "Failed to get cec irq: %d\n", cec->irq);
+	if (cec->irq < 0)
 		return cec->irq;
-	}
 
 	ret = devm_request_threaded_irq(dev, cec->irq, NULL,
 					mtk_cec_htplg_isr_thread,
-- 
1.9.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
