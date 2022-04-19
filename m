Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2B507722
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 20:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BFD10E1F4;
	Tue, 19 Apr 2022 18:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E18410E069;
 Tue, 19 Apr 2022 18:11:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98747600BE;
 Tue, 19 Apr 2022 18:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90ADC385A5;
 Tue, 19 Apr 2022 18:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650391869;
 bh=6JIV9bAl3AlhOIFiWtU+aC2MWdNmcLlPqJm+dbFnVFU=;
 h=From:To:Cc:Subject:Date:From;
 b=s8kF+pghm1cBam+/lZcRDPVj2LBEEqGcOfk/4adNOM1KeBoju4pHJmwXz3kR/AW7M
 oB//ImPKLth4hNqnSLG8FyAzrlP2g2tTOm+t6QiwnaDXgYfAXvCIT493lZ2cb6YSJF
 UJkKUJPozMdKVhcLqktKUOsfuR1T8a3a+KPfCLsotRC6oG88CZf2ACay7GKlql2WJ5
 XLy/bdjq5p8NkhB0/ROMA7lPTOVFOVdAhMezG0TGRakFTFXFjTjQ2S0MS9klPBuOQV
 Oon2zDGsZqe7jefEhQ+f0zpE5Yd3JN2kvxOqM7NhBgeQvOL3q3ErNguyszwRR0t0jS
 zOU0QfS1GoVRw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 01/34] drm/msm/gpu: Rename runtime suspend/resume
 functions
Date: Tue, 19 Apr 2022 14:10:28 -0400
Message-Id: <20220419181104.484667-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 vladimir.lypak@gmail.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, nathan@kernel.org, quic_akhilpo@quicinc.com,
 freedreno@lists.freedesktop.org, sean@poorly.run,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

[ Upstream commit f7eab1ddb9f8bc99206e3efa8d34ca1d2faca209 ]

Signed-off-by: Rob Clark <robdclark@chromium.org>
Link: https://lore.kernel.org/r/20220310234611.424743-2-robdclark@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index fb261930ad1c..b93de79000e1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -601,7 +601,7 @@ static const struct of_device_id dt_match[] = {
 };
 
 #ifdef CONFIG_PM
-static int adreno_resume(struct device *dev)
+static int adreno_runtime_resume(struct device *dev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 
@@ -617,7 +617,7 @@ static int active_submits(struct msm_gpu *gpu)
 	return active_submits;
 }
 
-static int adreno_suspend(struct device *dev)
+static int adreno_runtime_suspend(struct device *dev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	int remaining;
@@ -636,7 +636,7 @@ static int adreno_suspend(struct device *dev)
 
 static const struct dev_pm_ops adreno_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(adreno_suspend, adreno_resume, NULL)
+	SET_RUNTIME_PM_OPS(adreno_runtime_suspend, adreno_runtime_resume, NULL)
 };
 
 static struct platform_driver adreno_driver = {
-- 
2.35.1

