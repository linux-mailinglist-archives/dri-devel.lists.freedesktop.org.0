Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CE55E6461
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 15:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098FB10EB27;
	Thu, 22 Sep 2022 13:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6D410E36B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 13:54:57 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.143])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4MYGvB5wkdzKPPS
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 21:52:54 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.102.38])
 by APP2 (Coremail) with SMTP id Syh0CgC3VW8qaSxjR3npBA--.17148S12;
 Thu, 22 Sep 2022 21:54:54 +0800 (CST)
From: Wei Yongjun <weiyongjun@huaweicloud.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 08/10] drm/panel: tpg110: Silence no spi_device_id warning
Date: Thu, 22 Sep 2022 14:12:01 +0000
Message-Id: <20220922141204.1823931-9-weiyongjun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922141204.1823931-1-weiyongjun@huaweicloud.com>
References: <20220922141204.1823931-1-weiyongjun@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgC3VW8qaSxjR3npBA--.17148S12
X-Coremail-Antispam: 1UD129KBjvJXoW7CF48CF4kKFykWFy8Jw4UCFg_yoW8Gr1rpF
 s8GF98CFW8CF43KwsxA3WxXFyj9an2qayrtFZrGwsI9FZrAryUXw4SkF45Xa1DJrWUJa42
 qF9xCry7Xay8ArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
 Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
 rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267
 AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
 14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
 xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
 z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIda
 VFxhVjvjDU0xZFpf9x07UZo7tUUUUU=
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

SPI devices use the spi_device_id for module autoloading even on
systems using device tree, after commit 5fa6863ba692 ("spi: Check
we have a spi_device_id for each DT compatible"), kernel warns as
follows since the spi_device_id is missing:

SPI driver tpo-tpg110-panel has no spi_device_id for tpo,tpg110

Add spi_device_id entries to silence the warning, and ensure driver
module autoloading works.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/panel/panel-tpo-tpg110.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
index 0b1f5a11a055..f6cac569420c 100644
--- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
+++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
@@ -463,9 +463,16 @@ static const struct of_device_id tpg110_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tpg110_match);
 
+static const struct spi_device_id tpg110_ids[] = {
+	{ "tpg110" },
+	{},
+};
+MODULE_DEVICE_TABLE(spi, tpg110_ids);
+
 static struct spi_driver tpg110_driver = {
 	.probe		= tpg110_probe,
 	.remove		= tpg110_remove,
+	.id_table	= tpg110_ids,
 	.driver		= {
 		.name	= "tpo-tpg110-panel",
 		.of_match_table = tpg110_match,
-- 
2.34.1

