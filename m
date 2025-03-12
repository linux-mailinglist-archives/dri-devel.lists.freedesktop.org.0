Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1DEA5D774
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5883410E715;
	Wed, 12 Mar 2025 07:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 338 seconds by postgrey-1.36 at gabe;
 Wed, 12 Mar 2025 07:40:05 UTC
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A7410E715
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 07:40:05 +0000 (UTC)
Received: from localhost (unknown [124.16.138.129])
 by APP-01 (Coremail) with SMTP id qwCowACXn9P9ONFn+Px8FA--.64272S2;
 Wed, 12 Mar 2025 15:34:21 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: jeff.hugo@oss.qualcomm.com, quic_carlv@quicinc.com, ogabbay@kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] accel/qaic: Remove redundant 'flush_workqueue()' calls
Date: Wed, 12 Mar 2025 15:34:04 +0800
Message-Id: <20250312073404.1429992-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACXn9P9ONFn+Px8FA--.64272S2
X-Coremail-Antispam: 1UD129KBjvJXoWrKF1xZFy7tr1DuryrtFyxZrb_yoW8Jryfpa
 95AF4rtrs3Jr4DC390kw4UWFyfuan0kFy7XrWIg34av3Z8Jr98X3W5KFW7tr95CF93Jr4q
 kF4Yy39ava4UKF7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
 xVWUAVWUtwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
 0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
 17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
 C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
 6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
 73UjIFyTuYvjfUYl1vDUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

This was generated with coccinelle:

@@
expression E;
@@
- flush_workqueue(E);
  destroy_workqueue(E);

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/accel/qaic/qaic_debugfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index ba0cf2f94732..a991b8198dc4 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -240,7 +240,6 @@ static int qaic_bootlog_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_d
 mhi_unprepare:
 	mhi_unprepare_from_transfer(mhi_dev);
 destroy_workqueue:
-	flush_workqueue(qdev->bootlog_wq);
 	destroy_workqueue(qdev->bootlog_wq);
 out:
 	return ret;
@@ -253,7 +252,6 @@ static void qaic_bootlog_mhi_remove(struct mhi_device *mhi_dev)
 	qdev = dev_get_drvdata(&mhi_dev->dev);
 
 	mhi_unprepare_from_transfer(qdev->bootlog_ch);
-	flush_workqueue(qdev->bootlog_wq);
 	destroy_workqueue(qdev->bootlog_wq);
 	qdev->bootlog_ch = NULL;
 }
-- 
2.25.1

