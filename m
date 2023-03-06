Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E3B6ABB1E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39FC10E23F;
	Mon,  6 Mar 2023 10:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4436810E1F5;
 Mon,  6 Mar 2023 10:09:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BC43AB80D80;
 Mon,  6 Mar 2023 10:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14371C43445;
 Mon,  6 Mar 2023 10:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678097359;
 bh=b151yW+qXdaWwZr+uJKZCMaPRLko8VNYQPQR6bpEA/Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CkpNJJsthW0e/lsNOja6kI178cQAVWSxRPwJbe7ITZtDKyFNkVC0OwHWMoVq1Wi0/
 6BhvtipTNV0HHiROwWY7E6EaLKiedZoxV5zlzzNs+mTHAFkuVN893iP1O1K3GJyQi3
 VlDEVI45ff/2yTwyIrpuD1Tfri98WoFyyXeAOX3BuAIEnjdNndeb3RomSmR4iN+H0h
 DZqR399MX86QV7gYtONI5PdqJPsG/oNlxMkNCPfW/rjAy8xuXXsjhptPYN9LBxpLwj
 8U8gU8Q3afvyLi+8J8FOETfZGBBNWhLBbdqD43+0DIIfW9sexuM+hjmIafGEedRj7D
 n9PhgmHrzhLIg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1pZ7n5-0007R0-Q4; Mon, 06 Mar 2023 11:09:59 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 10/10] drm/msm: move include directive
Date: Mon,  6 Mar 2023 11:07:22 +0100
Message-Id: <20230306100722.28485-11-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306100722.28485-1-johan+linaro@kernel.org>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
MIME-Version: 1.0
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the include of of_address.h to the top of the file where it
belongs.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ade17947d1e5..42ae7575622b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -8,6 +8,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/fault-inject.h>
 #include <linux/kthread.h>
+#include <linux/of_address.h>
 #include <linux/sched/mm.h>
 #include <linux/uaccess.h>
 #include <uapi/linux/sched/types.h>
@@ -272,8 +273,6 @@ static int msm_drm_uninit(struct device *dev)
 	return 0;
 }
 
-#include <linux/of_address.h>
-
 struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 {
 	struct msm_gem_address_space *aspace;
-- 
2.39.2

