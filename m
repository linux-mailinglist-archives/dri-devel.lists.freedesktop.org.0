Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25638BE8FCA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AF010EC36;
	Fri, 17 Oct 2025 13:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MgP3WEzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDF410EC36
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:47:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B537E4B3FD;
 Fri, 17 Oct 2025 13:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AA1C4CEFE;
 Fri, 17 Oct 2025 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760708874;
 bh=vrRFEKTK4AWiLuQSasLbMw065+46eQtPuGvNJqTLrH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MgP3WEzH4xzjfD6A6/bW0TBNZZNnElvkbi1wUWqZ12I36MqZyEv/PJVoBsBNuZH/7
 WlLvZgFOdDrpj0Ck0ql7eSo1Mj9JDHTnFvT5q3rHiMJt1sij5uxRAOILDaQKd5PI92
 x78WkVedghK5peiINGn5Hw+ps6c6cplNXiyaT+Xz9ZtJf93/dmkKnjkvxlSpO7EaIX
 tV3YLDte3ZSdrNepHn+D7fr5M6gL4DKG83FpGZkiw6VCF7C5duPZD6zQNhV6qVjFJ4
 ED6fHIBBZVbwWQtC3kr9kPQD+rdJwNkG2G+qFVHTYg7mBGaV2doQg7xwIc8j7dopeB
 FkVzV32lxWT6w==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 2/3] drm/sched: Add TODO file with first entry
Date: Fri, 17 Oct 2025 15:47:02 +0200
Message-ID: <20251017134716.187723-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251017134716.187723-2-phasta@kernel.org>
References: <20251017134716.187723-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a drm_sched TODO file with open tasks, contact info, difficulty
level and a job description.

Add the missing successor of drm_sched_resubmit_jobs() as a first task.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/TODO | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 drivers/gpu/drm/scheduler/TODO

diff --git a/drivers/gpu/drm/scheduler/TODO b/drivers/gpu/drm/scheduler/TODO
new file mode 100644
index 000000000000..6a06e2858dd6
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/TODO
@@ -0,0 +1,27 @@
+=== drm_sched TODO list ===
+
+* GPU job resubmits
+  - Difficulty: hard
+  - Contact:
+    - Christian König <ckoenig.leichtzumerken@gmail.com>
+    - Philipp Stanner <phasta@kernel.org>
+  - Description:
+    drm_sched_resubmit_jobs() is deprecated. Main reason being that it leads to
+    reinitializing dma_fences. See that function's docu for details. The better
+    approach for valid resubmissions by amdgpu and Xe is (apparently) to figure
+    out which job (and, through association: which entity) caused the hang. Then,
+    the job's buffer data, together with all other jobs' buffer data currently
+    in the same hardware ring, must be invalidated. This can for example be done
+    by overwriting it.
+    amdgpu currently determines which jobs are in the ring and need to be
+    overwritten by keeping copies of the job. Xe obtains that information by
+    directly accessing drm_sched's pending_list.
+  - Tasks:
+	1. implement scheduler functionality through which
+	   the driver can obtain the information which *broken* jobs are currently in
+	   the hardware ring.
+	2. Such infrastructure would then typically be used in
+	   drm_sched_backend_ops.timedout_job(). Document that.
+	3. Port a driver as first user.
+	3. Document the new alternative in the docu of deprecated
+	   drm_sched_resubmit_jobs().
-- 
2.49.0

