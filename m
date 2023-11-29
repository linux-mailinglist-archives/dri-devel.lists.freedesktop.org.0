Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D47FD2D5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 10:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCD110E3B2;
	Wed, 29 Nov 2023 09:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 919 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 09:18:33 UTC
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5596010E392
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 09:18:33 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SgCyx5hCJz4f3kk7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 17:03:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id A87B31A0D9D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 17:03:08 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.103.91])
 by APP1 (Coremail) with SMTP id cCh0CgDnNw5I_mZlCIsBCQ--.34087S4;
 Wed, 29 Nov 2023 17:03:08 +0800 (CST)
From: Yang Yingliang <yangyingliang@huaweicloud.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: nt36523: fix return value check in nt36523_probe()
Date: Wed, 29 Nov 2023 17:07:15 +0800
Message-Id: <20231129090715.856263-1-yangyingliang@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgDnNw5I_mZlCIsBCQ--.34087S4
X-Coremail-Antispam: 1UD129KBjvdXoW7JryDWry8Gr1xGF43tw18Krg_yoWkCrc_CF
 W8X3ZrXrWUJFnrWa4Ik3WUZFy2kFs09rWkuw40va4fGa47urn8Xa409rnxZryUWF4jyF9x
 A3W8JrWS9a17KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb2xYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
 Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
 A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
 67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IY
 c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0x
 vE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
 87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUzeOJUUUUU
X-CM-SenderInfo: 51dqw5xlqjzxhdqjqx5xdzvxpfor3voofrz/
X-Mailman-Approved-At: Wed, 29 Nov 2023 09:34:16 +0000
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
Cc: neil.armstrong@linaro.org, mripard@kernel.org, lujianhua000@gmail.com,
 tzimmermann@suse.de, yangyingliang@huawei.com, quic_jesszhan@quicinc.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yang Yingliang <yangyingliang@huawei.com>

mipi_dsi_device_register_full() never returns NULL pointer, it
will return ERR_PTR() when it fails, so replace the check with
IS_ERR().

Fixes: 0993234a0045 ("drm/panel: Add driver for Novatek NT36523")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
index 9b9a7eb1bc60..a189ce236328 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -1254,9 +1254,9 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
 			return dev_err_probe(dev, -EPROBE_DEFER, "cannot get secondary DSI host\n");
 
 		pinfo->dsi[1] = mipi_dsi_device_register_full(dsi1_host, info);
-		if (!pinfo->dsi[1]) {
+		if (IS_ERR(pinfo->dsi[1])) {
 			dev_err(dev, "cannot get secondary DSI device\n");
-			return -ENODEV;
+			return PTR_ERR(pinfo->dsi[1]);
 		}
 	}
 
-- 
2.25.1

