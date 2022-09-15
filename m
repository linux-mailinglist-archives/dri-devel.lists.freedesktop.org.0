Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F30B5B9FAC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 18:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C953810EB72;
	Thu, 15 Sep 2022 16:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCBA10EB75
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 16:32:18 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.143])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4MT2MX0ZJLzKLg0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 00:14:16 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.102.38])
 by APP2 (Coremail) with SMTP id Syh0CgDXKXPJTyNjOdaRAw--.26920S4;
 Fri, 16 Sep 2022 00:16:10 +0800 (CST)
From: Wei Yongjun <weiyongjun@huaweicloud.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panel: innolux-ej030na: Silent no spi_device_id warning
Date: Thu, 15 Sep 2022 16:33:33 +0000
Message-Id: <20220915163333.2519630-1-weiyongjun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgDXKXPJTyNjOdaRAw--.26920S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Gw4kCryrtr4DKry7Gw4Uurg_yoW8Jr43pF
 sxJFWDAry8Aa15Kay7Aa9rXFyUAa1xKay8Ka4DC3Z09F4jyF95W3sxtay5Ar98AF13G34x
 tFnFkry7WF43Zr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyjb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
 x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6x
 CaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCa
 FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
 Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
 6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_JF
 I_Gr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
 cSsGvfC2KfnxnUUI43ZEXa7IU189N3UUUUU==
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

SPI driver panel-innolux-ej030na has no spi_device_id for innolux,ej030na

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/panel/panel-innolux-ej030na.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
index b2b0ebc9e943..281662ba2520 100644
--- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
+++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
@@ -293,6 +293,12 @@ static const struct of_device_id ej030na_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ej030na_of_match);
 
+static const struct spi_device_id ej030na_ids[] = {
+	{ "ej030na", (kernel_ulong_t)&ej030na_info },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, ej030na_ids);
+
 static struct spi_driver ej030na_driver = {
 	.driver = {
 		.name = "panel-innolux-ej030na",
@@ -300,6 +306,7 @@ static struct spi_driver ej030na_driver = {
 	},
 	.probe = ej030na_probe,
 	.remove = ej030na_remove,
+	.id_table = ej030na_ids,
 };
 module_spi_driver(ej030na_driver);
 
-- 
2.34.1

