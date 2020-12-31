Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D022E7F73
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 11:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E7B89B61;
	Thu, 31 Dec 2020 10:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 457 seconds by postgrey-1.36 at gabe;
 Thu, 31 Dec 2020 09:49:43 UTC
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9476289B29;
 Thu, 31 Dec 2020 09:49:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.241])
 by APP-01 (Coremail) with SMTP id qwCowABX2H6ynu1f_9FgAA--.43038S2;
 Thu, 31 Dec 2020 17:49:38 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 jcrouse@codeaurora.org, tzimmermann@suse.de, abhinavk@codeaurora.org
Subject: [PATCH] drm/msm/mdp5: Remove redundant null check before
 clk_prepare_enable/clk_disable_unprepare
Date: Thu, 31 Dec 2020 09:49:35 +0000
Message-Id: <20201231094935.25737-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowABX2H6ynu1f_9FgAA--.43038S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw4kAw1DArWkCryxGr1fXrb_yoW5Cw45pr
 9rKr4Fvw4xXr9Y93Z8tr45XryFyw47tFyfWrWrGa43XryfCryDXFWxAa4vva1DAr18JrW7
 Xw47Jr95u3WjgFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvCb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F
 4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
 4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
 67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
 x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
 nxnUUI43ZEXa7IU5PHUPUUUUU==
X-Originating-IP: [124.16.141.241]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCwoHA1z4jszeQgABs+
X-Mailman-Approved-At: Thu, 31 Dec 2020 10:42:13 +0000
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because clk_prepare_enable() and clk_disable_unprepare() already checked
NULL clock parameter, so the additional checks are unnecessary, just
remove them.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 18 ++++++------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 12 ++++--------
 2 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 15aed45022bc..8d373d2ffd51 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -303,15 +303,12 @@ static int mdp5_disable(struct mdp5_kms *mdp5_kms)
 	mdp5_kms->enable_count--;
 	WARN_ON(mdp5_kms->enable_count < 0);
 
-	if (mdp5_kms->tbu_rt_clk)
-		clk_disable_unprepare(mdp5_kms->tbu_rt_clk);
-	if (mdp5_kms->tbu_clk)
-		clk_disable_unprepare(mdp5_kms->tbu_clk);
+	clk_disable_unprepare(mdp5_kms->tbu_rt_clk);
+	clk_disable_unprepare(mdp5_kms->tbu_clk);
 	clk_disable_unprepare(mdp5_kms->ahb_clk);
 	clk_disable_unprepare(mdp5_kms->axi_clk);
 	clk_disable_unprepare(mdp5_kms->core_clk);
-	if (mdp5_kms->lut_clk)
-		clk_disable_unprepare(mdp5_kms->lut_clk);
+	clk_disable_unprepare(mdp5_kms->lut_clk);
 
 	return 0;
 }
@@ -325,12 +322,9 @@ static int mdp5_enable(struct mdp5_kms *mdp5_kms)
 	clk_prepare_enable(mdp5_kms->ahb_clk);
 	clk_prepare_enable(mdp5_kms->axi_clk);
 	clk_prepare_enable(mdp5_kms->core_clk);
-	if (mdp5_kms->lut_clk)
-		clk_prepare_enable(mdp5_kms->lut_clk);
-	if (mdp5_kms->tbu_clk)
-		clk_prepare_enable(mdp5_kms->tbu_clk);
-	if (mdp5_kms->tbu_rt_clk)
-		clk_prepare_enable(mdp5_kms->tbu_rt_clk);
+	clk_prepare_enable(mdp5_kms->lut_clk);
+	clk_prepare_enable(mdp5_kms->tbu_clk);
+	clk_prepare_enable(mdp5_kms->tbu_rt_clk);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
index 09bd46ad820b..02c6c4b68c68 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
@@ -137,10 +137,8 @@ static int mdp5_mdss_enable(struct msm_mdss *mdss)
 	DBG("");
 
 	clk_prepare_enable(mdp5_mdss->ahb_clk);
-	if (mdp5_mdss->axi_clk)
-		clk_prepare_enable(mdp5_mdss->axi_clk);
-	if (mdp5_mdss->vsync_clk)
-		clk_prepare_enable(mdp5_mdss->vsync_clk);
+	clk_prepare_enable(mdp5_mdss->axi_clk);
+	clk_prepare_enable(mdp5_mdss->vsync_clk);
 
 	return 0;
 }
@@ -150,10 +148,8 @@ static int mdp5_mdss_disable(struct msm_mdss *mdss)
 	struct mdp5_mdss *mdp5_mdss = to_mdp5_mdss(mdss);
 	DBG("");
 
-	if (mdp5_mdss->vsync_clk)
-		clk_disable_unprepare(mdp5_mdss->vsync_clk);
-	if (mdp5_mdss->axi_clk)
-		clk_disable_unprepare(mdp5_mdss->axi_clk);
+	clk_disable_unprepare(mdp5_mdss->vsync_clk);
+	clk_disable_unprepare(mdp5_mdss->axi_clk);
 	clk_disable_unprepare(mdp5_mdss->ahb_clk);
 
 	return 0;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
