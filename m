Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EDF2C62A6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 11:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2A66EBA6;
	Fri, 27 Nov 2020 10:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by gabe.freedesktop.org (Postfix) with ESMTP id 731B96EB71
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 09:18:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.242])
 by APP-05 (Coremail) with SMTP id zQCowADXcghnxMBfjngQAA--.27352S2;
 Fri, 27 Nov 2020 17:18:31 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, bogdan.togorean@analog.com, laurentiu.palcu@nxp.com
Subject: [PATCH] drm: bridge: adv7511: Remove redundant null check before
 clk_disable_unprepare
Date: Fri, 27 Nov 2020 09:18:29 +0000
Message-Id: <20201127091829.50695-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowADXcghnxMBfjngQAA--.27352S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4ruw15WFy7GFykCw4fAFb_yoW8GF4xpw
 47uFZIkry8XrZFga1DAF45ta4Y9a1Uta4rZFZI9wnF9wsruFy0qFWDAw18ZFy7JFW8C347
 tr1UKrykWF1ayaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY
 04v7MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
 C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
 v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvE
 x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
 DU0xZFpf9x07jztCwUUUUU=
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgkNA10Tey1--QAAsb
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:11:27 +0000
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

Because clk_disable_unprepare() already checked NULL clock parameter,
so the additional check is unnecessary, just remove them.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index a0d392c338da..76555ae64e9c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1292,8 +1292,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 
 err_unregister_cec:
 	i2c_unregister_device(adv7511->i2c_cec);
-	if (adv7511->cec_clk)
-		clk_disable_unprepare(adv7511->cec_clk);
+	clk_disable_unprepare(adv7511->cec_clk);
 err_i2c_unregister_packet:
 	i2c_unregister_device(adv7511->i2c_packet);
 err_i2c_unregister_edid:
@@ -1311,8 +1310,7 @@ static int adv7511_remove(struct i2c_client *i2c)
 	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
 		adv7533_detach_dsi(adv7511);
 	i2c_unregister_device(adv7511->i2c_cec);
-	if (adv7511->cec_clk)
-		clk_disable_unprepare(adv7511->cec_clk);
+	clk_disable_unprepare(adv7511->cec_clk);
 
 	adv7511_uninit_regulators(adv7511);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
