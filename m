Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCFE573078
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBCA95C75;
	Wed, 13 Jul 2022 08:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD8E95239;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F07461ABD;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF3CC341CA;
 Wed, 13 Jul 2022 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=qczUEguDVUqJvy/woYoSbaWPrDFIYfetEUvYFnQIf4c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fPl89HjuVrZz2nZCxqrE8GG7VF12ThSQoDQItIUiDbY7k1kH4DhYfCjjAzPxes8gx
 utHjHIRkOIRwvWOX+QFqzw1w3VE0wCGyok9x4OxfElQ7HfxpZNWVm2/vO2W9P68Hhh
 Fnqe3/JVTBUKVs0xeiQlVNK3ipcn1jF1gcjc3N/3d5OsPbsxKY8D7m5QpG0rR2sH2i
 1IIX4WZFx3xXdh6lBAKbafqvG6jl4vakiQYdKvNppJQkxQS2fXHjLU0/KEIyPk/vAt
 gbbVYjFASbhmzXLw2v0cVkTH444aQrmRQJ2H+IAsLgSfg8V9n+uR3YiyPdKzODoa30
 SFjmhPI5R0Ugg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004zsn-Dt;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 06/39] drm/i915: gt: fix some Kernel-doc issues
Date: Wed, 13 Jul 2022 09:11:54 +0100
Message-Id: <3cb8ebff378fc0634e992eba68176ed30842572a.1657699522.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657699522.git.mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michael Cheng <michael.cheng@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Casey Bowman <casey.g.bowman@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several trivial warnings there, due to trivial things:
	- lack of function name at the kerneldoc markup;
	- undocumented structs with kernel-doc markups;
	- wrong parameter syntax.

    Fix such warnings:

	drivers/gpu/drm/i915/gt/intel_context.h:107: warning: Function parameter or member 'ce' not described in 'intel_context_lock_pinned'
	drivers/gpu/drm/i915/gt/intel_context.h:122: warning: Function parameter or member 'ce' not described in 'intel_context_is_pinned'
	drivers/gpu/drm/i915/gt/intel_context.h:141: warning: Function parameter or member 'ce' not described in 'intel_context_unlock_pinned'
	drivers/gpu/drm/i915/gt/intel_gtt.h:510: warning: Function parameter or member 'vm' not described in 'i915_vm_resv_put'
	drivers/gpu/drm/i915/gt/intel_gtt.h:510: warning: Excess function parameter 'resv' description in 'i915_vm_resv_put'
	drivers/gpu/drm/i915/gt/intel_gtt.h:615: warning: Function parameter or member 'i915' not described in 'i915_ggtt_mark_pte_lost'
	drivers/gpu/drm/i915/gt/intel_gtt.h:615: warning: Function parameter or member 'val' not described in 'i915_ggtt_mark_pte_lost'
	drivers/gpu/drm/i915/gt/intel_rps.c:2343: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
	 * Tells the intel_ips driver that the i915 driver is now loaded, if
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:28: warning: Function parameter or member 'size' not described in '__guc_capture_bufstate'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:28: warning: Function parameter or member 'data' not described in '__guc_capture_bufstate'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:28: warning: Function parameter or member 'rd' not described in '__guc_capture_bufstate'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:28: warning: Function parameter or member 'wr' not described in '__guc_capture_bufstate'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'link' not described in '__guc_capture_parsed_output'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'is_partial' not described in '__guc_capture_parsed_output'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'eng_class' not described in '__guc_capture_parsed_output'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'eng_inst' not described in '__guc_capture_parsed_output'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'guc_id' not described in '__guc_capture_parsed_output'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'lrca' not described in '__guc_capture_parsed_output'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'reginfo' not described in '__guc_capture_parsed_output'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:63: warning: wrong kernel-doc identifier on line:
	 * struct guc_debug_capture_list_header / struct guc_debug_capture_list
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:81: warning: wrong kernel-doc identifier on line:
	 * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:106: warning: wrong kernel-doc identifier on line:
	 * struct guc_state_capture_header_t / struct guc_state_capture_t /
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:164: warning: Function parameter or member 'is_valid' not described in '__guc_capture_ads_cache'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:164: warning: Function parameter or member 'ptr' not described in '__guc_capture_ads_cache'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:164: warning: Function parameter or member 'size' not described in '__guc_capture_ads_cache'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:164: warning: Function parameter or member 'status' not described in '__guc_capture_ads_cache'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:217: warning: Function parameter or member 'ads_null_cache' not described in 'intel_guc_state_capture'
	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:217: warning: Function parameter or member 'max_mmio_per_node' not described in 'intel_guc_state_capture'
	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'marker' not described in 'guc_log_buffer_state'
	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'read_ptr' not described in 'guc_log_buffer_state'
	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'write_ptr' not described in 'guc_log_buffer_state'
	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'size' not described in 'guc_log_buffer_state'
	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'sampled_write_ptr' not described in 'guc_log_buffer_state'
	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'wrap_offset' not described in 'guc_log_buffer_state'
	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'flush_to_file' not described in 'guc_log_buffer_state'
	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'buffer_full_cnt' not described in 'guc_log_buffer_state'
	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'reserved' not described in 'guc_log_buffer_state'
	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'flags' not described in 'guc_log_buffer_state'
	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'version' not described in 'guc_log_buffer_state'

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gt/intel_context.h       |  6 +++---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 ++--
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  6 +++---
 drivers/gpu/drm/i915/gt/intel_rps.c           |  4 ++--
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h | 14 +++++++-------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  2 +-
 6 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 8e2d70630c49..91c092d5deae 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -96,7 +96,7 @@ void intel_context_bind_parent_child(struct intel_context *parent,
 
 /**
  * intel_context_lock_pinned - Stablises the 'pinned' status of the HW context
- * @ce - the context
+ * @ce: the context
  *
  * Acquire a lock on the pinned status of the HW context, such that the context
  * can neither be bound to the GPU or unbound whilst the lock is held, i.e.
@@ -110,7 +110,7 @@ static inline int intel_context_lock_pinned(struct intel_context *ce)
 
 /**
  * intel_context_is_pinned - Reports the 'pinned' status
- * @ce - the context
+ * @ce: the context
  *
  * While in use by the GPU, the context, along with its ring and page
  * tables is pinned into memory and the GTT.
@@ -132,7 +132,7 @@ static inline void intel_context_cancel_request(struct intel_context *ce,
 
 /**
  * intel_context_unlock_pinned - Releases the earlier locking of 'pinned' status
- * @ce - the context
+ * @ce: the context
  *
  * Releases the lock earlier acquired by intel_context_unlock_pinned().
  */
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 37fa813af766..da225f5db2a4 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1197,7 +1197,7 @@ create_kernel_context(struct intel_engine_cs *engine)
 }
 
 /**
- * intel_engines_init_common - initialize cengine state which might require hw access
+ * engine_init_common - initialize cengine state which might require hw access
  * @engine: Engine to initialize.
  *
  * Initializes @engine@ structure members shared between legacy and execlists
@@ -1278,7 +1278,7 @@ int intel_engines_init(struct intel_gt *gt)
 }
 
 /**
- * intel_engines_cleanup_common - cleans up the engine state created by
+ * intel_engine_cleanup_common - cleans up the engine state created by
  *                                the common initiailizers.
  * @engine: Engine to cleanup.
  *
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index e639434e97fd..fca8eedee1d8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -503,7 +503,7 @@ static inline void i915_vm_put(struct i915_address_space *vm)
 
 /**
  * i915_vm_resv_put - Release a reference on the vm's reservation lock
- * @resv: Pointer to a reservation lock obtained from i915_vm_resv_get()
+ * @vm: The vm whose reservation lock was obtained from i915_vm_resv_get()
  */
 static inline void i915_vm_resv_put(struct i915_address_space *vm)
 {
@@ -604,8 +604,8 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt);
 
 /**
  * i915_ggtt_mark_pte_lost - Mark ggtt ptes as lost or clear such a marking
- * @i915 The device private.
- * @val whether the ptes should be marked as lost.
+ * @i915: The device private.
+ * @val: whether the ptes should be marked as lost.
  *
  * In some cases pte content is retained across suspend, but typically lost
  * across hibernate. Typically they should be marked as lost on
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index fb3f57ee450b..8aefc427e06e 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2339,8 +2339,8 @@ bool rps_read_mask_mmio(struct intel_rps *rps,
 static struct drm_i915_private __rcu *ips_mchdev;
 
 /**
- * Tells the intel_ips driver that the i915 driver is now loaded, if
- * IPS got loaded first.
+ * ips_ping_for_i915_load - Tells the intel_ips driver that the i915 driver
+ *	 is now loaded, if IPS got loaded first.
  *
  * This awkward dance is so that neither module has to depend on the
  * other in order for IPS to do the appropriate communication of
diff --git a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
index 3624abfd22d1..58f93226b1c1 100644
--- a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
@@ -12,7 +12,7 @@
 struct intel_guc;
 struct file;
 
-/**
+/*
  * struct __guc_capture_bufstate
  *
  * Book-keeping structure used to track read and write pointers
@@ -26,7 +26,7 @@ struct __guc_capture_bufstate {
 	u32 wr;
 };
 
-/**
+/*
  * struct __guc_capture_parsed_output - extracted error capture node
  *
  * A single unit of extracted error-capture output data grouped together
@@ -58,7 +58,7 @@ struct __guc_capture_parsed_output {
 #define GCAP_PARSED_REGLIST_INDEX_ENGINST  BIT(GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE)
 };
 
-/**
+/*
  * struct guc_debug_capture_list_header / struct guc_debug_capture_list
  *
  * As part of ADS registration, these header structures (followed by
@@ -76,7 +76,7 @@ struct guc_debug_capture_list {
 	struct guc_mmio_reg regs[0];
 } __packed;
 
-/**
+/*
  * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
  *
  * intel_guc_capture module uses these structures to maintain static
@@ -101,7 +101,7 @@ struct __guc_mmio_reg_descr_group {
 	struct __guc_mmio_reg_descr *extlist; /* only used for steered registers */
 };
 
-/**
+/*
  * struct guc_state_capture_header_t / struct guc_state_capture_t /
  * guc_state_capture_group_header_t / guc_state_capture_group_t
  *
@@ -148,7 +148,7 @@ struct guc_state_capture_group_t {
 	struct guc_state_capture_t capture_entries[0];
 } __packed;
 
-/**
+/*
  * struct __guc_capture_ads_cache
  *
  * A structure to cache register lists that were populated and registered
@@ -162,7 +162,7 @@ struct __guc_capture_ads_cache {
 	int status;
 };
 
-/**
+/*
  * struct intel_guc_state_capture
  *
  * Internal context of the intel_guc_capture module.
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index b3c9a9327f76..237019e98ede 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -360,7 +360,7 @@ enum guc_log_buffer_type {
 	GUC_MAX_LOG_BUFFER
 };
 
-/**
+/*
  * struct guc_log_buffer_state - GuC log buffer state
  *
  * Below state structure is used for coordination of retrieval of GuC firmware
-- 
2.36.1

