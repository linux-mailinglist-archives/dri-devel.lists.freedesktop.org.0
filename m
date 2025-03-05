Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7335A503E5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0068310E7D8;
	Wed,  5 Mar 2025 15:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YjatVu0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5107D10E7DE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 15:54:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B3183A45A31;
 Wed,  5 Mar 2025 15:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02A8C4CEEA;
 Wed,  5 Mar 2025 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741190054;
 bh=hjKg1gDFgtmx4nrhI0ndame1TsHOJmcFeEivWJNbSco=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YjatVu0uHiwI2J/y+PPIKOC4X8mTngak0sPMk/cR4/SX6/MuzU459KjcIg1SFe/jA
 75jCEF4Itbfq2PNLhmvioXcSkOQB5y8pSydjDRWDLQGbwPEVe/GpSzXqalZ0x5Nxck
 5c5zneYao891QDGdLVxaeDTHKAQKNubSU0CtsnS4r+kXptlRuY5XE8fcptatCEcdy1
 D952VYh//2AKcNK6RW/coWrp37vAPRZA5GuY/YCi56a7AiqdZtQuK/iAyrvl34N23c
 7LtAKleE5CfqldcjhL5RSEeLPnrXz+0C/DzK60E8r+SXAsJfknMZPipVAyYVPvqZQp
 VWMBHUZSnxhAQ==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/sched: Remove kthread header
Date: Wed,  5 Mar 2025 16:53:27 +0100
Message-ID: <20250305155326.153596-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305155326.153596-2-phasta@kernel.org>
References: <20250305155326.153596-2-phasta@kernel.org>
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

The kthread header doesn't need to be included anymore. It's a relict
from commit a6149f039369 ("drm/sched: Convert drm scheduler to use a
work queue rather than kthread").

Remove the unneeded includes.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 1 -
 drivers/gpu/drm/scheduler/sched_fence.c  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index f9811420c787..e55b98af8a50 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -21,7 +21,6 @@
  *
  */
 
-#include <linux/kthread.h>
 #include <linux/slab.h>
 #include <linux/completion.h>
 
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index e971528504a5..d6239e015b66 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -21,7 +21,6 @@
  *
  */
 
-#include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-- 
2.48.1

