Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2819E3A1C2A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877416EACC;
	Wed,  9 Jun 2021 17:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE796EA95
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:44:49 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id v13so12959717ple.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a54CBrdUZFvu5Df2Uq5VXicIgx8GI6s8LwWaopBoFHY=;
 b=KRRFv6sgRtNiDiEIjoNdm+vG2YHenjtLEZMYnV6xob95vVM9mDgaNighhmHzTSNYWU
 e/nNSe8ragOPcvTYvkUWUkv4q1QM8vRVCVQKktDFPgZ4kqPN9Cmoizt6V+6TjV5EfdwD
 K9dv+/wtxwcpBOZL4ZWirWYTZ5t5W4pQGtlKZc8uRMK4lRCulI16wUnUhtB6tsCUYsj9
 /b45HVMNO0Gv+xf/tRNyrTfDrDcersLvcYlqUZ2dNkTJLuhQuT/NMBBG+ak2Oj/1zr6a
 qQPJRa2lf2I0su9zNMsGBX19lq2rFc3vF4vXnhk/sHUDosU0Aa+ymAdLPewjlju4AZl3
 wPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a54CBrdUZFvu5Df2Uq5VXicIgx8GI6s8LwWaopBoFHY=;
 b=QMcn53BqNfRgFbNkSkhhbO6HAah5C12mtq13Q3jCLsr6384QCsRHXcIypGQnv3a1Qh
 SyAhsn2KQlIjUQ3mPyx2zqaqoiBx78tF48r/E0qowPpjHGAqwR0GTsy+oDwbEd7PTNr+
 h0k7Lv3T65w13rGLYe70JS8EFsWh0vKGF3+hOyg6VgIFTjaV5bki/pnWE2of2fYGqQ0G
 FsSXI1SRPSFtAba7EJRQ96baJedl0ElnAuDS1FSDOdSMjR6oO0DcEepI9iBBDlsJsF2i
 6Zgs/clrqIopdOonq9QZRaYdN4NLRma/wsaXEjsBT+qss+b7v9IBE1ykTuOVmj9MTgqV
 QDyg==
X-Gm-Message-State: AOAM530XzD9Wf40AvHfFbA0/qZTtWJ4U9Bpg8xacyEkJhHeQuMpPDFvl
 mx6yjs33OkfvevWNUWlYJvs+txDicETmDw==
X-Google-Smtp-Source: ABdhPJy+Cyjm5qU8x9hbVYdYIqCTmZwxwDz+bL+9nLkT4Y3wWa9s5e/haxanmWQA2i6fpLCzDZtkAA==
X-Received: by 2002:a17:902:7c03:b029:f0:bbde:fc1e with SMTP id
 x3-20020a1709027c03b02900f0bbdefc1emr683520pll.57.1623260689058; 
 Wed, 09 Jun 2021 10:44:49 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:44:48 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 15/31] drm/i915: Add gem/i915_gem_context.h to the docs
Date: Wed,  9 Jun 2021 12:44:02 -0500
Message-Id: <20210609174418.249585-16-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609174418.249585-1-jason@jlekstrand.net>
References: <20210609174418.249585-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to prevent kernel doc warnings, also fill out docs for any
missing fields and fix those that forgot the "@".

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 Documentation/gpu/i915.rst                    |  2 +
 .../gpu/drm/i915/gem/i915_gem_context_types.h | 43 ++++++++++++++++---
 2 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 42ce0196930a1..b452f84c9ef2b 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -422,6 +422,8 @@ Batchbuffer Parsing
 User Batchbuffer Execution
 --------------------------
 
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+
 .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
    :doc: User command execution
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index df76767f0c41b..5f0673a2129f9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -30,19 +30,39 @@ struct i915_address_space;
 struct intel_timeline;
 struct intel_ring;
 
+/**
+ * struct i915_gem_engines - A set of engines
+ */
 struct i915_gem_engines {
 	union {
+		/** @link: Link in i915_gem_context::stale::engines */
 		struct list_head link;
+
+		/** @rcu: RCU to use when freeing */
 		struct rcu_head rcu;
 	};
+
+	/** @fence: Fence used for delayed destruction of engines */
 	struct i915_sw_fence fence;
+
+	/** @ctx: i915_gem_context backpointer */
 	struct i915_gem_context *ctx;
+
+	/** @num_engines: Number of engines in this set */
 	unsigned int num_engines;
+
+	/** @engines: Array of engines */
 	struct intel_context *engines[];
 };
 
+/**
+ * struct i915_gem_engines_iter - Iterator for an i915_gem_engines set
+ */
 struct i915_gem_engines_iter {
+	/** @idx: Index into i915_gem_engines::engines */
 	unsigned int idx;
+
+	/** @engines: Engine set being iterated */
 	const struct i915_gem_engines *engines;
 };
 
@@ -53,10 +73,10 @@ struct i915_gem_engines_iter {
  * logical hardware state for a particular client.
  */
 struct i915_gem_context {
-	/** i915: i915 device backpointer */
+	/** @i915: i915 device backpointer */
 	struct drm_i915_private *i915;
 
-	/** file_priv: owning file descriptor */
+	/** @file_priv: owning file descriptor */
 	struct drm_i915_file_private *file_priv;
 
 	/**
@@ -81,7 +101,9 @@ struct i915_gem_context {
 	 * CONTEXT_USER_ENGINES flag is set).
 	 */
 	struct i915_gem_engines __rcu *engines;
-	struct mutex engines_mutex; /* guards writes to engines */
+
+	/** @engines_mutex: guards writes to engines */
+	struct mutex engines_mutex;
 
 	/**
 	 * @syncobj: Shared timeline syncobj
@@ -118,7 +140,7 @@ struct i915_gem_context {
 	 */
 	struct pid *pid;
 
-	/** link: place with &drm_i915_private.context_list */
+	/** @link: place with &drm_i915_private.context_list */
 	struct list_head link;
 
 	/**
@@ -153,11 +175,13 @@ struct i915_gem_context {
 #define CONTEXT_CLOSED			0
 #define CONTEXT_USER_ENGINES		1
 
+	/** @mutex: guards everything that isn't engines or handles_vma */
 	struct mutex mutex;
 
+	/** @sched: scheduler parameters */
 	struct i915_sched_attr sched;
 
-	/** guilty_count: How many times this context has caused a GPU hang. */
+	/** @guilty_count: How many times this context has caused a GPU hang. */
 	atomic_t guilty_count;
 	/**
 	 * @active_count: How many times this context was active during a GPU
@@ -171,15 +195,17 @@ struct i915_gem_context {
 	unsigned long hang_timestamp[2];
 #define CONTEXT_FAST_HANG_JIFFIES (120 * HZ) /* 3 hangs within 120s? Banned! */
 
-	/** remap_slice: Bitmask of cache lines that need remapping */
+	/** @remap_slice: Bitmask of cache lines that need remapping */
 	u8 remap_slice;
 
 	/**
-	 * handles_vma: rbtree to look up our context specific obj/vma for
+	 * @handles_vma: rbtree to look up our context specific obj/vma for
 	 * the user handle. (user handles are per fd, but the binding is
 	 * per vm, which may be one per context or shared with the global GTT)
 	 */
 	struct radix_tree_root handles_vma;
+
+	/** @lut_mutex: Locks handles_vma */
 	struct mutex lut_mutex;
 
 	/**
@@ -191,8 +217,11 @@ struct i915_gem_context {
 	 */
 	char name[TASK_COMM_LEN + 8];
 
+	/** @stale: tracks stale engines to be destroyed */
 	struct {
+		/** @lock: guards engines */
 		spinlock_t lock;
+		/** @engines: list of stale engines */
 		struct list_head engines;
 	} stale;
 };
-- 
2.31.1

