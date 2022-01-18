Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F7349314A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 00:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BA610E2A0;
	Tue, 18 Jan 2022 23:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 79426 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jan 2022 14:18:52 UTC
Received: from azure-sdnproxy-2.icoremail.net (azure-sdnproxy.icoremail.net
 [52.175.55.52])
 by gabe.freedesktop.org (Postfix) with SMTP id C76CE10E55D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=biMT0EYXUf9WFzVJmu+bA6LfPMOGWnUcLJSdaWB25GU=; b=k
 i3Uutoh8V7zM5M2h2LDpPzdKjPNfHZWefUWviZQD+qpLCYPik+2ucuwBKl4yz0KW
 JC3uhl0ZzdwFCvY7F97xTC/B3PJmIkcnjxKbjRf7MV0AE2lxBHOrb78DMkBz4uiD
 OpRzJH114PXwB+0opEOhip6e431p1Hvg1XZh07JkZI=
Received: from localhost (unknown [10.129.21.144])
 by front02 (Coremail) with SMTP id 54FpogBHTbnBy+ZhSHR1AA--.62372S2;
 Tue, 18 Jan 2022 22:16:33 +0800 (CST)
From: Yongzhi Liu <lyz_cs@pku.edu.cn>
To: l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 etnaviv@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: Add missing pm_runtime_put
Date: Tue, 18 Jan 2022 06:16:31 -0800
Message-Id: <1642515391-19329-1-git-send-email-lyz_cs@pku.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: 54FpogBHTbnBy+ZhSHR1AA--.62372S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKrW7ZFW7WF1rGrW8GF4rKrg_yoW3uwc_Cw
 1UZrn7XrsIqr1vqr17Z345ZFyIqFyrWa92qw18tas3Kry2vrn8XrykZw1DX34UXFW8WF1D
 Jayvqa4fAr1qgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb4kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAI
 w28IcVCjz48v1sIEY20_Kr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UU
 UUU
X-CM-SenderInfo: irzqijirqukmo6sn3hxhgxhubq/1tbiAwEKBlPy7uA+KwAIs8
X-Mailman-Approved-At: Tue, 18 Jan 2022 23:17:04 +0000
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
Cc: Yongzhi Liu <lyz_cs@pku.edu.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code, thus a matching decrement is needed
on the error handling path to keep the counter balanced.

Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 242a5fd..5e81a98 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1714,6 +1714,9 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	return 0;
 
 out_sched:
+#ifdef CONFIG_PM
+	pm_runtime_put_autosuspend(gpu->dev);
+#endif
 	etnaviv_sched_fini(gpu);
 
 out_workqueue:
-- 
2.7.4

