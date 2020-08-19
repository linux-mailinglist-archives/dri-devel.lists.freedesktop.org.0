Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FB8249C39
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162996E24D;
	Wed, 19 Aug 2020 11:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC296E03B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:24 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A7F62311D;
 Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837583;
 bh=FpfLqTZVGeSp8MM2Pkt3e1EBtQJ47pB5nXQ5ggNPs24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QrRCC8dhYwIRWv2oe6nSuz0KoupARv8q0VsVrzsultzPiVOgnadXlAHnekjl4l67d
 HkwG7/9/N9ibqukhgRCRbiGxoyHDVpX/uWTa4frM/NYuphkaeBJfiWgbBlZWaYaRsv
 TRvkEQphTmMWEnmW/E3sTWXqRKRDgorMg8/fYXaI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXt-00Eubt-5a; Wed, 19 Aug 2020 13:46:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 41/49] staging: hikey9xx/gpu: get rid of some unused data
Date: Wed, 19 Aug 2020 13:46:09 +0200
Message-Id: <024a251bfc6c10f11e09add5fe84cfcc924d7751.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Liuyao An <anliuyao@huawei.com>,
 mauro.chehab@huawei.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some things inside struct dss_hw_ctx that are unused.
Get rid of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h | 2 --
 drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h | 3 ---
 drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c | 2 --
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
index cd248bf15503..ae4eaae14429 100644
--- a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
@@ -3081,8 +3081,6 @@ struct dss_hw_ctx {
 	ktime_t vsync_timestamp_prev;
 
 	struct iommu_domain *mmu_domain;
-	struct ion_client *ion_client;
-	struct ion_handle *ion_handle;
 	char __iomem *screen_base;
 	unsigned long smem_start;
 	unsigned long screen_size;
diff --git a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
index aeae3720c889..4751b8b6423c 100644
--- a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
@@ -4068,12 +4068,9 @@ struct dss_hw_ctx {
 	ktime_t vsync_timestamp_prev;
 
 	struct iommu_domain *mmu_domain;
-	struct ion_client *ion_client;
-	struct ion_handle *ion_handle;
 	char __iomem *screen_base;
 	unsigned long smem_start;
 	unsigned long screen_size;
-	struct dss_smmu smmu;
 };
 
 struct dss_clk_rate {
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
index 292e14d2edf5..6792ac6fa8dc 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
@@ -976,8 +976,6 @@ static int dss_drm_init(struct drm_device *dev)
 	if (ret)
 		return ret;
 
-	ctx->ion_client = NULL;
-	ctx->ion_handle = NULL;
 	ctx->screen_base = 0;
 	ctx->screen_size = 0;
 	ctx->smem_start = 0;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
