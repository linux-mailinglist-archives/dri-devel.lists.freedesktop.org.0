Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C2D780C0B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 14:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007B810E504;
	Fri, 18 Aug 2023 12:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F008610E504
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 12:45:56 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RS1jL2fWMztRsl;
 Fri, 18 Aug 2023 20:42:14 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 20:45:53 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <luben.tuikov@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>
Subject: [PATCH -next] drm/scheduler: Remove unused declarations
Date: Fri, 18 Aug 2023 20:45:37 +0800
Message-ID: <20230818124537.51296-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
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
Cc: linaro-mm-sig@lists.linaro.org, yuehaibing@huawei.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 06a2d7cc3f04 ("drm/amdgpu: revert "implement tdr advanced mode"")
removed drm_sched_reset_karma()/drm_sched_increase_karma_ext() but leave
the declarations.
Commit 2cf9886e2816 ("drm/scheduler: remove drm_sched_dependency_optimized")
removed drm_sched_dependency_optimized() but not its declaration.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 include/drm/gpu_scheduler.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index f9544d9b670d..cd8ac90865fc 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -554,10 +554,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
 void drm_sched_increase_karma(struct drm_sched_job *bad);
-void drm_sched_reset_karma(struct drm_sched_job *bad);
-void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type);
-bool drm_sched_dependency_optimized(struct dma_fence* fence,
-				    struct drm_sched_entity *entity);
 void drm_sched_fault(struct drm_gpu_scheduler *sched);
 
 void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
-- 
2.34.1

