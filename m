Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839CBC01C59
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 16:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2879C10E908;
	Thu, 23 Oct 2025 14:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jx4Dsg5h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1747E10E907
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 14:30:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F38B644757;
 Thu, 23 Oct 2025 14:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73951C4CEFF;
 Thu, 23 Oct 2025 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761229844;
 bh=KCOKaI58Dqzg6Z/GWXMTAoM3n8N68zryV6zLecW4Hg4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jx4Dsg5h37BhCHR27HmHVAovcAiL6og0kPvboXmWRvUt18NnZBVT4eYiMCflNrSOR
 nnzbnCrWn35VqVC6Wv61tm/SUBY291w8elnR+nzB5/KBhVSPGgbGlIF9HlqtHmzVDO
 GpJfQW5uOnLU9IYCeiW7Y50pHZ8eqgj5PL4Wjt6i4nVOCIqZwTKIWKKLDfzEBWHACV
 j8JCC+/1HyoS0PgWjfBkdM/SOc3/lypCPbBGqGtq27iVfd7Ae07oh5NUefDYqVrip6
 ksOKSjyq0e2eSXCtOAuxLNuS1PjdMo9rZQvcg33CySbpyrHT/33E8lIgOP/7Wp/yMc
 bAuSzPtaxD7oQ==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 2/4] drm/sched: Add a TODO list
Date: Thu, 23 Oct 2025 16:30:29 +0200
Message-ID: <20251023143031.149496-4-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023143031.149496-2-phasta@kernel.org>
References: <20251023143031.149496-2-phasta@kernel.org>
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

The DRM GPU scheduler contains a huge number of problems. These should
be documented for (new) contributors to pick up work.

Add a TODO list with an example entry.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/TODO | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 drivers/gpu/drm/scheduler/TODO

diff --git a/drivers/gpu/drm/scheduler/TODO b/drivers/gpu/drm/scheduler/TODO
new file mode 100644
index 000000000000..79044adb7d01
--- /dev/null
+++ b/drivers/gpu/drm/scheduler/TODO
@@ -0,0 +1,12 @@
+=== drm_sched TODO list ===
+
+* Example Entry
+  - Difficulty: hard
+  - Contact:
+    - Danilo Krummrich <dakr@kernel.org>
+    - Philipp Stanner <phasta@kernel.org>
+  - Description:
+    This is an example.
+  - Tasks:
+	1. Read the example entry.
+	2. Remove the entry once solved (never in this case)
-- 
2.49.0

