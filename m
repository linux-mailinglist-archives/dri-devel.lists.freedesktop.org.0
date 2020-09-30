Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB8427FB36
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0164B6E854;
	Thu,  1 Oct 2020 08:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 330 seconds by postgrey-1.36 at gabe;
 Wed, 30 Sep 2020 08:24:49 UTC
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18F6A6E4D0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 08:24:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [159.226.5.100])
 by APP-03 (Coremail) with SMTP id rQCowACnrVXMQHRftxmjAA--.49057S2;
 Wed, 30 Sep 2020 16:24:45 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: paul@crapouillou.net,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/ingenic: remove redundant null check
Date: Wed, 30 Sep 2020 08:24:41 +0000
Message-Id: <20200930082441.52621-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowACnrVXMQHRftxmjAA--.49057S2
X-Coremail-Antispam: 1UD129KBjvJXoW7JF4UZF47GFy5Wry3ZFy8Grg_yoW8Jr4Upa
 y7JrWFkan7ZF4j9F98Ja9rG3W5ta17WFyI9F15G3ZrKFn8AFyvvFyFy347ZFn0yr1xCF43
 JwnrCFy8uF40kFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r43MxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42
 IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
 z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5RrW7UUUUU==
X-Originating-IP: [159.226.5.100]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQQPA102Zm8Z1gAAss
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because clk_disable_unprepare already checked NULL clock parameter,
so the additional checks are unnecessary, just remove them.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index b7074161ccf0..9dce02e779ad 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -932,8 +932,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	return 0;
 
 err_devclk_disable:
-	if (priv->lcd_clk)
-		clk_disable_unprepare(priv->lcd_clk);
+	clk_disable_unprepare(priv->lcd_clk);
 err_pixclk_disable:
 	clk_disable_unprepare(priv->pix_clk);
 	return ret;
@@ -953,8 +952,7 @@ static void ingenic_drm_unbind(struct device *dev)
 {
 	struct ingenic_drm *priv = dev_get_drvdata(dev);
 
-	if (priv->lcd_clk)
-		clk_disable_unprepare(priv->lcd_clk);
+	clk_disable_unprepare(priv->lcd_clk);
 	clk_disable_unprepare(priv->pix_clk);
 
 	drm_dev_unregister(&priv->drm);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
