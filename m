Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C270F455
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 12:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22D810E5DD;
	Wed, 24 May 2023 10:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E66610E5DD;
 Wed, 24 May 2023 10:38:05 +0000 (UTC)
X-UUID: 8fd7286b5a7f415a8fcadd3daee48710-20230524
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:1c41b63b-6c34-4a6d-8e5e-8b76d9e281ea, IP:15,
 URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-INFO: VERSION:1.1.22, REQID:1c41b63b-6c34-4a6d-8e5e-8b76d9e281ea, IP:15,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-5
X-CID-META: VersionHash:120426c, CLOUDID:7e79dc6c-2f20-4998-991c-3b78627e4938,
 B
 ulkID:230524183800Y1EDQ5GR,BulkQuantity:0,Recheck:0,SF:24|17|19|44|102,TC:
 nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 8fd7286b5a7f415a8fcadd3daee48710-20230524
X-User: pengfuyuan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <pengfuyuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 1152997920; Wed, 24 May 2023 18:37:57 +0800
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH] drm/i915/gt/uc:fix kernel-doc trivial warnings
Date: Wed, 24 May 2023 18:37:55 +0800
Message-Id: <20230524103755.1487749-1-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pengfuyuan <pengfuyuan@kylinos.cn>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 k2ci <kernel-bot@kylinos.cn>, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The test robot reports some make warnings.

Fix those warnings:
    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:491: warning: Function parameter or member 'marker' not described in 'guc_log_buffer_state'
    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:491: warning: Function parameter or member 'read_ptr' not described in 'guc_log_buffer_state'
    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:491: warning: Function parameter or member 'write_ptr' not described in 'guc_log_buffer_state'
    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:491: warning: Function parameter or member 'size' not described in 'guc_log_buffer_state'
    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:491: warning: Function parameter or member 'sampled_write_ptr' not described in 'guc_log_buffer_state'
    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:491: warning: Function parameter or member 'wrap_offset' not described in 'guc_log_buffer_state'
    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:491: warning: Function parameter or member 'flush_to_file' not described in 'guc_log_buffer_state'
    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:491: warning: Function parameter or member 'buffer_full_cnt' not described in 'guc_log_buffer_state'
    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:491: warning: Function parameter or member 'reserved' not described in 'guc_log_buffer_state'
    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:491: warning: Function parameter or member 'flags' not described in 'guc_log_buffer_state'
    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:491: warning: Function parameter or member 'version' not described in 'guc_log_buffer_state'
    drivers/gpu/drm/i915/gt/uc/intel_guc.h:274: warning: Function parameter or member 'dbgfs_node' not described in 'intel_guc'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:27: warning: Function parameter or member 'size' not described in '__guc_capture_bufstate'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:27: warning: Function parameter or member 'data' not described in '__guc_capture_bufstate'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:27: warning: Function parameter or member 'rd' not described in '__guc_capture_bufstate'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:27: warning: Function parameter or member 'wr' not described in '__guc_capture_bufstate'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'link' not described in '__guc_capture_parsed_output'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'is_partial' not described in '__guc_capture_parsed_output'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'eng_class' not described in '__guc_capture_parsed_output'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'eng_inst' not described in '__guc_capture_parsed_output'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'guc_id' not described in '__guc_capture_parsed_output'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'lrca' not described in '__guc_capture_parsed_output'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'reginfo' not described in '__guc_capture_parsed_output'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:163: warning: Function parameter or member 'is_valid' not described in '__guc_capture_ads_cache'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:163: warning: Function parameter or member 'ptr' not described in '__guc_capture_ads_cache'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:163: warning: Function parameter or member 'size' not described in '__guc_capture_ads_cache'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:163: warning: Function parameter or member 'status' not described in '__guc_capture_ads_cache'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:216: warning: Function parameter or member 'ads_null_cache' not described in 'intel_guc_state_capture'
    drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:216: warning: Function parameter or member 'max_mmio_per_node' not described in 'intel_guc_state_capture'

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h | 27 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 18 +++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
index 9d589c28f40f..84c74244a6a8 100644
--- a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
@@ -18,6 +18,11 @@ struct file;
  * Book-keeping structure used to track read and write pointers
  * as we extract error capture data from the GuC-log-buffer's
  * error-capture region as a stream of dwords.
+ *
+ * @size: size of the buffer.
+ * @data: pointer to the buffer containing the error capture data.
+ * @rd: read pointer indicating the current position for reading data.
+ * @wr: write pointer indicating the current position for writing data.
  */
 struct __guc_capture_bufstate {
 	u32 size;
@@ -32,6 +37,15 @@ struct __guc_capture_bufstate {
  * A single unit of extracted error-capture output data grouped together
  * at an engine-instance level. We keep these nodes in a linked list.
  * See cachelist and outlist below.
+ *
+ * @link: linked list node for storing the captured error data.
+ * @is_partial: flag indicating whether the captured data is partial.
+ * @eng_class: engine class identifier associated with the capture.
+ * @eng_inst: engine instance identifier associated with the capture.
+ * @guc_id: GuC identifier associated with the capture.
+ * @lrca: Logical Register Context Address associated with the capture.
+ * @reginfo: array of structures containing information about the captured
+ * register lists.
  */
 struct __guc_capture_parsed_output {
 	/*
@@ -154,6 +168,11 @@ struct guc_state_capture_group_t {
  * A structure to cache register lists that were populated and registered
  * with GuC at startup during ADS registration. This allows much quicker
  * GuC resets without re-parsing all the tables for the given gt.
+ *
+ * @is_valid: flag indicating whether the cache entry is valid.
+ * @ptr: pointer to the cached register list data.
+ * @size: size of the cached register list data.
+ * @status: status value indicating the current state of the cache entry.
  */
 struct __guc_capture_ads_cache {
 	bool is_valid;
@@ -187,6 +206,10 @@ struct intel_guc_state_capture {
 	struct __guc_capture_ads_cache ads_cache[GUC_CAPTURE_LIST_INDEX_MAX]
 						[GUC_CAPTURE_LIST_TYPE_MAX]
 						[GUC_MAX_ENGINE_CLASSES];
+
+	/**
+	 * @ads_null_cache: pointer to the cache for NULL ADS entries.
+	*/
 	void *ads_null_cache;
 
 	/**
@@ -202,6 +225,10 @@ struct intel_guc_state_capture {
 	struct list_head cachelist;
 #define PREALLOC_NODES_MAX_COUNT (3 * GUC_MAX_ENGINE_CLASSES * GUC_MAX_INSTANCES_PER_CLASS)
 #define PREALLOC_NODES_DEFAULT_NUMREGS 64
+
+	/**
+	 * @max_mmio_per_node: maximum number of MMIO per node
+	*/
 	int max_mmio_per_node;
 
 	/**
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index e46aac1a41e6..40cf2d491703 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -42,6 +42,7 @@ struct intel_guc {
 	/** @capture: the error-state-capture module's data and objects */
 	struct intel_guc_state_capture *capture;
 
+	/** @dbgfs_node: pointer to the debugfs node associated with the structure */
 	struct dentry *dbgfs_node;
 
 	/** @sched_engine: Global engine used to submit requests to GuC */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 4ae5fc2f6002..032b11758b9a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -471,6 +471,24 @@ enum guc_log_buffer_type {
  * sending an acknowledgment to GuC. marker & version fields are for internal
  * usage of GuC and opaque to i915. buffer_full_cnt field is incremented every
  * time GuC detects the log buffer overflow.
+ *
+ * @marker: marker fields for internal usage by GuC.
+ * @read_ptr: read pointer indicating the current position for reading from
+ * the buffer.
+ * @write_ptr: write pointer indicating the current position for writing to
+ * the buffer.
+ * @size: size of the buffer.
+ * @sampled_write_ptr: sampled value of the write pointer when a flush
+ * interrupt is triggered.
+ * @wrap_offset: offset to handle buffer wraparound.
+ * @flush_to_file: flag indicating whether a flush to file operation is
+ * requested by i915.
+ * @buffer_full_cnt: counter tracking the number of times the log buffer has
+ * overflowed.
+ * @reserved: reserved bits.
+ * @flags: union field for accessing the flush and buffer_full_cnt fields as
+ * a single value.
+ * @version: version field for internal usage by GuC.
  */
 struct guc_log_buffer_state {
 	u32 marker[2];
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
