Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DEF182AD3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73FC6EAA6;
	Thu, 12 Mar 2020 08:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961446E040;
 Thu, 12 Mar 2020 02:42:52 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 964B35ED28EA7C162979;
 Thu, 12 Mar 2020 10:42:48 +0800 (CST)
Received: from ubuntu.huawei.com (10.175.104.215) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Mar 2020 10:42:40 +0800
From: tongtiangen <tongtiangen@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <ddavenport@chromium.org>, <gregkh@linuxfoundation.org>,
 <abhinavk@codeaurora.org>, <jcrouse@codeaurora.org>, <tglx@linutronix.de>,
 <tongtiangen@huawei.com>
Subject: [PATCH -next] drm/msm/dpu: Remove some set but not used variables
Date: Thu, 12 Mar 2020 08:25:59 +0800
Message-ID: <20200312002559.20738-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.104.215]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function _dpu_debugfs_show_regset32:
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:142:26: warning: variable priv set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function dpu_kms_prepare_commit:
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:271:21: warning: variable dev set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function _dpu_kms_hw_destroy:
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:555:21: warning: variable dev set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function dpu_kms_hw_init:
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:763:26: warning: variable priv set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function dpu_runtime_suspend:
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:1021:21: warning: variable ddev set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: tongtiangen <tongtiangen@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index cb08fafb1dc1..089d1cde39da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -138,16 +138,12 @@ static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
 {
 	struct dpu_debugfs_regset32 *regset = s->private;
 	struct dpu_kms *dpu_kms = regset->dpu_kms;
-	struct drm_device *dev;
-	struct msm_drm_private *priv;
 	void __iomem *base;
 	uint32_t i, addr;
 
 	if (!dpu_kms->mmio)
 		return 0;
 
-	dev = dpu_kms->dev;
-	priv = dev->dev_private;
 	base = dpu_kms->mmio + regset->offset;
 
 	/* insert padding spaces, if needed */
@@ -267,8 +263,6 @@ static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
 static void dpu_kms_prepare_commit(struct msm_kms *kms,
 		struct drm_atomic_state *state)
 {
-	struct dpu_kms *dpu_kms;
-	struct drm_device *dev;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 	struct drm_encoder *encoder;
@@ -276,8 +270,6 @@ static void dpu_kms_prepare_commit(struct msm_kms *kms,
 
 	if (!kms)
 		return;
-	dpu_kms = to_dpu_kms(kms);
-	dev = dpu_kms->dev;
 
 	/* Call prepare_commit for all affected encoders */
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
@@ -552,11 +544,8 @@ static long dpu_kms_round_pixclk(struct msm_kms *kms, unsigned long rate,
 
 static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
-	struct drm_device *dev;
 	int i;
 
-	dev = dpu_kms->dev;
-
 	if (dpu_kms->hw_intr)
 		dpu_hw_intr_destroy(dpu_kms->hw_intr);
 	dpu_kms->hw_intr = NULL;
@@ -760,7 +749,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms;
 	struct drm_device *dev;
-	struct msm_drm_private *priv;
 	int i, rc = -EINVAL;
 
 	if (!kms) {
@@ -770,7 +758,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_kms = to_dpu_kms(kms);
 	dev = dpu_kms->dev;
-	priv = dev->dev_private;
 
 	atomic_set(&dpu_kms->bandwidth_ref, 0);
 
@@ -1018,10 +1005,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	int rc = -1;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
-	struct drm_device *ddev;
 	struct dss_module_power *mp = &dpu_kms->mp;
 
-	ddev = dpu_kms->dev;
 	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
 	if (rc)
 		DPU_ERROR("clock disable failed rc:%d\n", rc);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
