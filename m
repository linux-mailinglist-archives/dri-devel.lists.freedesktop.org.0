Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 694F66650EE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 02:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949E610E6A4;
	Wed, 11 Jan 2023 01:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3DE0710E6A4;
 Wed, 11 Jan 2023 01:10:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.125])
 by APP-05 (Coremail) with SMTP id zQCowADn7+9wDL5jjEwfDA--.50119S2;
 Wed, 11 Jan 2023 09:10:08 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: dianders@chromium.org
Subject: [PATCH v2] drm/msm/dsi: Drop the redundant fail label
Date: Wed, 11 Jan 2023 09:10:06 +0800
Message-Id: <20230111011006.6238-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADn7+9wDL5jjEwfDA--.50119S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw4ktry8uFWxGw1xCrWrAFb_yoW5Gw18pr
 yaqFsrtrW0yws2krW7JF17A3WrKF4fGa48G34UCwnrAw1ayw4UXF4Dua10ga48t3y8uw4U
 Kanaya4rWF1Utr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
 628vn2kIc2xKxwCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUChFxUUUUU=
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
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
Cc: marex@denx.de, vkoul@kernel.org, sean@poorly.run,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, vladimir.lypak@gmail.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the redundant fail label and change the "goto fail" into "return ret"
since they are the same.

Reviewed-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
Changelog:

v1 -> v2:

1. No change of the error handling of the irq_of_parse_and_map.
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 89aadd3b3202..de615c505def 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1883,8 +1883,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
 	if (!msm_host) {
-		ret = -ENOMEM;
-		goto fail;
+		return -ENOMEM;
 	}
 
 	msm_host->pdev = pdev;
@@ -1893,31 +1892,28 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	ret = dsi_host_parse_dt(msm_host);
 	if (ret) {
 		pr_err("%s: failed to parse dt\n", __func__);
-		goto fail;
+		return ret;
 	}
 
 	msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", &msm_host->ctrl_size);
 	if (IS_ERR(msm_host->ctrl_base)) {
 		pr_err("%s: unable to map Dsi ctrl base\n", __func__);
-		ret = PTR_ERR(msm_host->ctrl_base);
-		goto fail;
+		return PTR_ERR(msm_host->ctrl_base);
 	}
 
 	pm_runtime_enable(&pdev->dev);
 
 	msm_host->cfg_hnd = dsi_get_config(msm_host);
 	if (!msm_host->cfg_hnd) {
-		ret = -EINVAL;
 		pr_err("%s: get config failed\n", __func__);
-		goto fail;
+		return -EINVAL;
 	}
 	cfg = msm_host->cfg_hnd->cfg;
 
 	msm_host->id = dsi_host_get_id(msm_host);
 	if (msm_host->id < 0) {
-		ret = msm_host->id;
 		pr_err("%s: unable to identify DSI host index\n", __func__);
-		goto fail;
+		return msm_host->id;
 	}
 
 	/* fixup base address by io offset */
@@ -1927,19 +1923,18 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 					    cfg->regulator_data,
 					    &msm_host->supplies);
 	if (ret)
-		goto fail;
+		return ret;
 
 	ret = dsi_clk_init(msm_host);
 	if (ret) {
 		pr_err("%s: unable to initialize dsi clks\n", __func__);
-		goto fail;
+		return ret;
 	}
 
 	msm_host->rx_buf = devm_kzalloc(&pdev->dev, SZ_4K, GFP_KERNEL);
 	if (!msm_host->rx_buf) {
-		ret = -ENOMEM;
 		pr_err("%s: alloc rx temp buf failed\n", __func__);
-		goto fail;
+		return -ENOMEM;
 	}
 
 	ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
@@ -1983,9 +1978,6 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	DBG("Dsi Host %d initialized", msm_host->id);
 	return 0;
-
-fail:
-	return ret;
 }
 
 void msm_dsi_host_destroy(struct mipi_dsi_host *host)
-- 
2.25.1

