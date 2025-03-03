Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6DEA4C390
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 15:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8592D10E33D;
	Mon,  3 Mar 2025 14:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Vawew98O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83C010E432;
 Mon,  3 Mar 2025 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=om6Pe7ZZ4TBnXEpqWdlBwdRqDe/1mArlAqj9LsmmXJo=; b=Vawew98OoN6iqkCZ
 3SymbqPYpKg9wEpCizX63v5Jpc1MWJgAKrKvvBcrG9/LDsQB+zMiF+7jJrolzuCoYimZ29qwK24DK
 SUzGbFgyEW/fZBmOXt881aEN1Y04Nxk7XdTMzb48hjbzWQOzrSVjtILKDVfQ2yftTk1ZRC/79eb8V
 BHqRigfOfBQ8f9bWEsNFJzRuCulRHUwkkeB0nFH9jBZeb6AvMIm1v/uYqNpCCYL2ctZgDucWgUgVD
 WGd3vdOV163eoWsY5lxSA7zqx2i29qH/fdJCmQA4DJIn1SeuvbWH9DH+yUjIZmEJI99Iq1u/EkiXR
 LfnhT+1PScUJxL0RVQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tp6x6-0028PG-0i;
 Mon, 03 Mar 2025 14:39:28 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, Felix.Kuehling@amd.com,
 christian.koenig@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, austin.zheng@amd.com, jun.lei@amd.com,
 kenneth.feng@amd.com, linux-kernel@vger.kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 6/6] drm/amdgpu: Remove unused pqm_get_kernel_queue
Date: Mon,  3 Mar 2025 14:39:22 +0000
Message-ID: <20250303143922.36342-7-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303143922.36342-1-linux@treblig.org>
References: <20250303143922.36342-1-linux@treblig.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

pqm_get_kernel_queue() has been unused since 2022's
commit 5bdd3eb25354 ("drm/amdkfd: Remove unused old debugger
implementation")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h               |  2 --
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c  | 13 -------------
 2 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 2c22e335a02e..bc26a2609f64 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1363,8 +1363,6 @@ int pqm_update_mqd(struct process_queue_manager *pqm, unsigned int qid,
 			struct mqd_update_info *minfo);
 int pqm_set_gws(struct process_queue_manager *pqm, unsigned int qid,
 			void *gws);
-struct kernel_queue *pqm_get_kernel_queue(struct process_queue_manager *pqm,
-						unsigned int qid);
 struct queue *pqm_get_user_queue(struct process_queue_manager *pqm,
 						unsigned int qid);
 int pqm_get_wave_state(struct process_queue_manager *pqm,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index bd36a75309e1..2b30ed0cecb6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -652,19 +652,6 @@ int pqm_update_mqd(struct process_queue_manager *pqm,
 	return 0;
 }
 
-struct kernel_queue *pqm_get_kernel_queue(
-					struct process_queue_manager *pqm,
-					unsigned int qid)
-{
-	struct process_queue_node *pqn;
-
-	pqn = get_queue_by_qid(pqm, qid);
-	if (pqn && pqn->kq)
-		return pqn->kq;
-
-	return NULL;
-}
-
 struct queue *pqm_get_user_queue(struct process_queue_manager *pqm,
 					unsigned int qid)
 {
-- 
2.48.1

