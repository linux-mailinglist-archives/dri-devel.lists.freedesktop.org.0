Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BBD3933CF
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38B56F453;
	Thu, 27 May 2021 16:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779B36F447
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:17 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id r1so315434pgk.8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YS+Uri7E60HV84reO0WjW3vsU94vVbK2a/ugPb1Faa4=;
 b=zhB+KXosUdr+8dvxvJ0vG6OdXIoDgPIy7wuaPBu7nxjVrPfB1e+bhpqFaDd4HiIGfV
 rYq8Pua7w0sspIkc5ex+U7WK9Jwljg+S32+XOrLPD3aFb3Fp2WHuG4FMsFU+7dyPLef0
 akpuUoy5QUezXpTwua7FziMxY67EPeSpoIlPEwgZaE4NvmPXsCbNLpYzo652aHhlElcj
 DF2XEP0G5GQuKF2rSb/fZlfUk792dyIR30k8QEIqIyGRei+x38Jg9SZIqOL7cPX9AsCN
 hm+8v95YQjLPBYU7aisfPoVqOkyfqvgfUMEb+w5xiVCT1nEVcPhiB4jW97UO3p2caP4+
 G6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YS+Uri7E60HV84reO0WjW3vsU94vVbK2a/ugPb1Faa4=;
 b=DNRjXNo7IbjDD+bo9LqefQy0bielPUi18rYfigyRHd4n3ulx9SIA/sfXMGq9YHKMug
 /j2myeL4W3Y6MPe5rBxrZvv0sOmTv+pTWRC+dfLHNVJo8bAtnYhmSBDFA3yJVbvs3kah
 Ck/5BZkBbGQA2HvWaaOwnQO9uXBqkn/KzOscuZeEMKUAtrXt9KMYbE2NEm2n1rdPttmt
 5taWtSrmAbW4g3UuuRcljHBDmtgTiqmv5tNGdg47ilrolegzkzRsvyAkec6hFUDylX90
 kCmzQxuZKIcjTk/DA7Kc93UhgATJRnYdfbvhQQPzxiva49PGipF9EmKWk6tc0mqUWVr5
 A/+Q==
X-Gm-Message-State: AOAM532zP1GWgpRiSPLKjD3mY4jIPZquQQIS1jXtKgIy1vBkoV7C65Tr
 x1oYzdw3w4EbL5Nr1pRt2BIKiOqm3K+lvw==
X-Google-Smtp-Source: ABdhPJwb1oKRU7j5ug/WCuManLZe3zv+QcHZsBtKzJ6AVRwyAvIOiepnyrSIkaX6a2dnFAuezxFI/g==
X-Received: by 2002:aa7:8392:0:b029:2db:4a7:d866 with SMTP id
 u18-20020aa783920000b02902db04a7d866mr4402589pfm.66.1622132836961; 
 Thu, 27 May 2021 09:27:16 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:16 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 15/29] drm/i915: Add gem/i915_gem_context.h to the docs
Date: Thu, 27 May 2021 11:26:36 -0500
Message-Id: <20210527162650.1182544-16-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527162650.1182544-1-jason@jlekstrand.net>
References: <20210527162650.1182544-1-jason@jlekstrand.net>
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
index 486c720f38907..0529e5183982e 100644
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

