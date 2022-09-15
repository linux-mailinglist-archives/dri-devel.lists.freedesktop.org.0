Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1C65B9FA9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 18:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2127810EB78;
	Thu, 15 Sep 2022 16:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBEB10EB72
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 16:32:18 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.143])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4MT2NW53D9zlCLH
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 00:15:07 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.102.38])
 by APP2 (Coremail) with SMTP id Syh0CgC3VW_sTyNjONuRAw--.5309S4;
 Fri, 16 Sep 2022 00:16:44 +0800 (CST)
From: Wei Yongjun <weiyongjun@huaweicloud.com>
To: Markuss Broks <markuss.broks@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panel: s6d27a1: Silent no spi_device_id warning
Date: Thu, 15 Sep 2022 16:34:07 +0000
Message-Id: <20220915163407.2519686-1-weiyongjun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgC3VW_sTyNjONuRAw--.5309S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4kCryrtr1DZr45Wr4rZrb_yoWkJrg_Cr
 4UX3W3Za15Gry8WFyIyayUZFnF9a909r1kZwn3KF9xuw17Zr15CaykCF17Jw1DX3WUAFn8
 u3WkXF95uwnxWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbrxYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
 Y4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
 A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
 67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
 x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6x
 CaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCa
 FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
 Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I
 6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Gr
 0_Zr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
 cSsGvfC2KfnxnUUI43ZEXa7IU1YFAJUUUUU==
X-CM-SenderInfo: 5zhl50pqjm3046kxt4xhlfz01xgou0bp/
X-CFilter-Loop: Reflected
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
Cc: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

Add spi_device_id entries to silent following SPI warning:

SPI driver s6d27a1-panel has no spi_device_id for samsung,s6d27a1

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c b/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
index 2adb223a895c..7c2bbf84c28f 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
@@ -304,9 +304,16 @@ static const struct of_device_id s6d27a1_match[] = {
 };
 MODULE_DEVICE_TABLE(of, s6d27a1_match);
 
+static const struct spi_device_id s6d27a1_ids[] = {
+	{ "s6d27a1" },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, s6d27a1_ids);
+
 static struct spi_driver s6d27a1_driver = {
 	.probe		= s6d27a1_probe,
 	.remove		= s6d27a1_remove,
+	.id_table	= s6d27a1_ids,
 	.driver		= {
 		.name	= "s6d27a1-panel",
 		.of_match_table = s6d27a1_match,
-- 
2.34.1

