Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2681C4EF5C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 17:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8495210E06C;
	Tue, 11 Nov 2025 16:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GWGoehvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66BB10E06C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 16:15:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6AFFB42CBC;
 Tue, 11 Nov 2025 16:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644BEC16AAE;
 Tue, 11 Nov 2025 16:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762877718;
 bh=fLUCOZcJGqs10IzWWpUN1U+QCtifLHFvmvQS6PWoXi8=;
 h=From:To:Cc:Subject:Date:From;
 b=GWGoehvnXJiDbmFG8JSrPQbK/ND2R25jREsH4qUqkUpz6VdOsJCSB75/6+rdPPttd
 rf9PfNB9biA1Ehi0597tOk99ZcBXbNLsmRvN8XATqFhy9UF7w12pfDVjFexjB56v85
 naPWyVqvzmMTXpa7cV829H1xytWwLFRpcDpSzoQNA9sDOXqJmIGDOjysl2AUMMTqYg
 XHJlaGM9AJtZ7Sv5si/xG3KQ1Em3c2CYV8x0t1Kwl5oUhEj2ysx+mU7jZprqChdw5k
 WVZEZkuGMzIv/YCO9kNMacbKuwhlim2Z70vvPBtjZ7/OMZ/+fy5GjjWNq9MmEKkt4L
 0F0v/cq97GRgA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched: Fix outdated sched_job docu
Date: Tue, 11 Nov 2025 17:15:03 +0100
Message-ID: <20251111161502.86180-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

There is no such thing as a "done_list" anymore. Remove mention of it.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fb88301b3c45..18d6210ce2d0 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -320,7 +320,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * struct drm_sched_job - A job to be run by an entity.
  *
  * @queue_node: used to append this struct to the queue of jobs in an entity.
- * @list: a job participates in a "pending" and "done" lists.
+ * @list: for enqueueing the job into the list of pending jobs.
  * @sched: the scheduler instance on which this job is scheduled.
  * @s_fence: contains the fences for the scheduling of job.
  * @finish_cb: the callback for the finished fence.
-- 
2.49.0

