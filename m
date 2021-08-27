Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 350E83F99A6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655B46E941;
	Fri, 27 Aug 2021 13:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89286E93F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id x6so2168354wrv.13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bblH7EHFwC6q+4uEv8+f1ZOEc8xiM3bgUaMyaPPvO9I=;
 b=AAB1eCojZHAJ3HfvVTiycFCTiHN1efQiIk+c97uxVJhIKc0RIYV692rTQoUyDeWzZw
 otdTBzSrTIAz1BTfsJ+zdO3NiyuIVjn5tSdnijI9nFulqTrx/xOrvyLDVT9CyszViYmq
 rSRLevXBC2T1bRf/35NRiYuTVPRe/IgHhU41NXh85Ef8Ewz1UhX8LulXfrFEQ+DGI/e2
 DuUCUWo6cpUFsCbYrEQvScj/OkZPMIzmbLPSTPX12vepwYYUY+aGJr7+ImuNXR+Pk1Qf
 GyVj2lbkLZ4dDoQhF2tMo13tKxGHGQC9dilD2XkXLohSKYhAuTZFSO43+GLWlhWbwPHV
 jxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bblH7EHFwC6q+4uEv8+f1ZOEc8xiM3bgUaMyaPPvO9I=;
 b=mJ1AYg2LJzvDrmHjWPLs+Cjvej2IDq3JKcJ2qWWKt4Uy4/JGvlqlp8+wstYstw9I9a
 WhyP26CXLss5cNtaHxzNOBpAaiQAO7MZJO4x23EzT0m/RXmm3iLbiMpwO2f6SIlz5gD3
 Visb/qm82HEiNTEfes+pXwnMYOt/zeGTLHKkEoTDsV6fJhGAa0sRaGhMYQTIJr6/3JU4
 /qpcBBqXvzX9/eSPBCobRLB31SNZd56DAaHHuVkVeUA10KnHE6Zsc5+VarOocKbObcr4
 bLBU42A4ZNk0XjbEB5dh4xsO3aB+GHowYdtHXMpF4ACDmbX12E4kfiJ3bzkkoUwfN3jI
 WPsQ==
X-Gm-Message-State: AOAM530oO+yjaElHRBOJKc1WOOXwKS7vPs86Vki82rLQBgW5osmhGlX+
 on8eHlzdfCWRsOzsQ86kD5E=
X-Google-Smtp-Source: ABdhPJwljHLqLbvE+PuBpPiasCbAfYSQYXMC4CrtdG08IPka1kaSQe13o5U+eijeZwoNqP8Pw58KCQ==
X-Received: by 2002:a5d:5150:: with SMTP id u16mr10344531wrt.156.1630070608359; 
 Fri, 27 Aug 2021 06:23:28 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id e13sm5751495wra.40.2021.08.27.06.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 09/25] tegra: Update for new UABI
Date: Fri, 27 Aug 2021 15:22:49 +0200
Message-Id: <20210827132305.3572077-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding@nvidia.com>

This new UABI is a more modern version that works better with both old
and recent chips.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/drm/tegra_drm.h | 429 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 404 insertions(+), 25 deletions(-)

diff --git a/include/drm/tegra_drm.h b/include/drm/tegra_drm.h
index 6c07919c04e9..94cfc306d50a 100644
--- a/include/drm/tegra_drm.h
+++ b/include/drm/tegra_drm.h
@@ -1,27 +1,8 @@
-/*
- * Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
+/* SPDX-License-Identifier: MIT */
+/* Copyright (c) 2012-2020 NVIDIA Corporation */
 
-#ifndef _TEGRA_DRM_H_
-#define _TEGRA_DRM_H_
+#ifndef _UAPI_TEGRA_DRM_H_
+#define _UAPI_TEGRA_DRM_H_
 
 #include "drm.h"
 
@@ -29,6 +10,8 @@
 extern "C" {
 #endif
 
+/* Tegra DRM legacy UAPI. Only enabled with STAGING */
+
 #define DRM_TEGRA_GEM_CREATE_TILED     (1 << 0)
 #define DRM_TEGRA_GEM_CREATE_BOTTOM_UP (1 << 1)
 
@@ -649,8 +632,8 @@ struct drm_tegra_gem_get_flags {
 #define DRM_TEGRA_SYNCPT_READ		0x02
 #define DRM_TEGRA_SYNCPT_INCR		0x03
 #define DRM_TEGRA_SYNCPT_WAIT		0x04
-#define DRM_TEGRA_OPEN_CHANNEL		0x05
-#define DRM_TEGRA_CLOSE_CHANNEL		0x06
+#define DRM_TEGRA_OPEN_CHANNEL	        0x05
+#define DRM_TEGRA_CLOSE_CHANNEL	        0x06
 #define DRM_TEGRA_GET_SYNCPT		0x07
 #define DRM_TEGRA_SUBMIT		0x08
 #define DRM_TEGRA_GET_SYNCPT_BASE	0x09
@@ -674,6 +657,402 @@ struct drm_tegra_gem_get_flags {
 #define DRM_IOCTL_TEGRA_GEM_SET_FLAGS DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_SET_FLAGS, struct drm_tegra_gem_set_flags)
 #define DRM_IOCTL_TEGRA_GEM_GET_FLAGS DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_GET_FLAGS, struct drm_tegra_gem_get_flags)
 
+/* New Tegra DRM UAPI */
+
+/*
+ * Reported by the driver in the `capabilities` field.
+ *
+ * DRM_TEGRA_CHANNEL_CAP_CACHE_COHERENT: If set, the engine is cache coherent
+ * with regard to the system memory.
+ */
+#define DRM_TEGRA_CHANNEL_CAP_CACHE_COHERENT (1 << 0)
+
+struct drm_tegra_channel_open {
+	/**
+	 * @host1x_class: [in]
+	 *
+	 * Host1x class of the engine that will be programmed using this
+	 * channel.
+	 */
+	__u32 host1x_class;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * @context: [out]
+	 *
+	 * Opaque identifier corresponding to the opened channel.
+	 */
+	__u32 context;
+
+	/**
+	 * @version: [out]
+	 *
+	 * Version of the engine hardware. This can be used by userspace
+	 * to determine how the engine needs to be programmed.
+	 */
+	__u32 version;
+
+	/**
+	 * @capabilities: [out]
+	 *
+	 * Flags describing the hardware capabilities.
+	 */
+	__u32 capabilities;
+	__u32 padding;
+};
+
+struct drm_tegra_channel_close {
+	/**
+	 * @context: [in]
+	 *
+	 * Identifier of the channel to close.
+	 */
+	__u32 context;
+	__u32 padding;
+};
+
+/*
+ * Mapping flags that can be used to influence how the mapping is created.
+ *
+ * DRM_TEGRA_CHANNEL_MAP_READ: create mapping that allows HW read access
+ * DRM_TEGRA_CHANNEL_MAP_WRITE: create mapping that allows HW write access
+ */
+#define DRM_TEGRA_CHANNEL_MAP_READ  (1 << 0)
+#define DRM_TEGRA_CHANNEL_MAP_WRITE (1 << 1)
+#define DRM_TEGRA_CHANNEL_MAP_READ_WRITE (DRM_TEGRA_CHANNEL_MAP_READ | \
+					  DRM_TEGRA_CHANNEL_MAP_WRITE)
+
+struct drm_tegra_channel_map {
+	/**
+	 * @context: [in]
+	 *
+	 * Identifier of the channel to which make memory available for.
+	 */
+	__u32 context;
+
+	/**
+	 * @handle: [in]
+	 *
+	 * GEM handle of the memory to map.
+	 */
+	__u32 handle;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * @mapping: [out]
+	 *
+	 * Identifier corresponding to the mapping, to be used for
+	 * relocations or unmapping later.
+	 */
+	__u32 mapping;
+};
+
+struct drm_tegra_channel_unmap {
+	/**
+	 * @context: [in]
+	 *
+	 * Channel identifier of the channel to unmap memory from.
+	 */
+	__u32 context;
+
+	/**
+	 * @mapping: [in]
+	 *
+	 * Mapping identifier of the memory mapping to unmap.
+	 */
+	__u32 mapping;
+};
+
+/* Submission */
+
+/**
+ * Specify that bit 39 of the patched-in address should be set to switch
+ * swizzling between Tegra and non-Tegra sector layout on systems that store
+ * surfaces in system memory in non-Tegra sector layout.
+ */
+#define DRM_TEGRA_SUBMIT_RELOC_SECTOR_LAYOUT (1 << 0)
+
+struct drm_tegra_submit_buf {
+	/**
+	 * @mapping: [in]
+	 *
+	 * Identifier of the mapping to use in the submission.
+	 */
+	__u32 mapping;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * Information for relocation patching.
+	 */
+	struct {
+		/**
+		 * @target_offset: [in]
+		 *
+		 * Offset from the start of the mapping of the data whose
+		 * address is to be patched into the gather.
+		 */
+		__u64 target_offset;
+
+		/**
+		 * @gather_offset_words: [in]
+		 *
+		 * Offset in words from the start of the gather data to
+		 * where the address should be patched into.
+		 */
+		__u32 gather_offset_words;
+
+		/**
+		 * @shift: [in]
+		 *
+		 * Number of bits the address should be shifted right before
+		 * patching in.
+		 */
+		__u32 shift;
+	} reloc;
+};
+
+/**
+ * Execute `words` words of Host1x opcodes specified in the `gather_data_ptr`
+ * buffer. Each GATHER_UPTR command uses successive words from the buffer.
+ */
+#define DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR		0
+/**
+ * Wait for a syncpoint to reach a value before continuing with further
+ * commands.
+ */
+#define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT		1
+/**
+ * Wait for a syncpoint to reach a value before continuing with further
+ * commands. The threshold is calculated relative to the start of the job.
+ */
+#define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT_RELATIVE	2
+
+struct drm_tegra_submit_cmd_gather_uptr {
+	__u32 words;
+	__u32 reserved[3];
+};
+
+struct drm_tegra_submit_cmd_wait_syncpt {
+	__u32 id;
+	__u32 value;
+	__u32 reserved[2];
+};
+
+struct drm_tegra_submit_cmd {
+	/**
+	 * @type: [in]
+	 *
+	 * Command type to execute. One of the DRM_TEGRA_SUBMIT_CMD*
+	 * defines.
+	 */
+	__u32 type;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	union {
+		struct drm_tegra_submit_cmd_gather_uptr gather_uptr;
+		struct drm_tegra_submit_cmd_wait_syncpt wait_syncpt;
+		__u32 reserved[4];
+	};
+};
+
+struct drm_tegra_submit_syncpt {
+	/**
+	 * @id: [in]
+	 *
+	 * ID of the syncpoint that the job will increment.
+	 */
+	__u32 id;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * @increments: [in]
+	 *
+	 * Number of times the job will increment this syncpoint.
+	 */
+	__u32 increments;
+
+	/**
+	 * @value: [out]
+	 *
+	 * Value the syncpoint will have once the job has completed all
+	 * its specified syncpoint increments.
+	 *
+	 * Note that the kernel may increment the syncpoint before or after
+	 * the job. These increments are not reflected in this field.
+	 *
+	 * If the job hangs or times out, not all of the increments may
+	 * get executed.
+	 */
+	__u32 value;
+};
+
+struct drm_tegra_channel_submit {
+	/**
+	 * @context: [in]
+	 *
+	 * Identifier of the channel to submit this job to.
+	 */
+	__u32 context;
+
+	/**
+	 * @num_bufs: [in]
+	 *
+	 * Number of elements in the `bufs_ptr` array.
+	 */
+	__u32 num_bufs;
+
+	/**
+	 * @num_cmds: [in]
+	 *
+	 * Number of elements in the `cmds_ptr` array.
+	 */
+	__u32 num_cmds;
+
+	/**
+	 * @gather_data_words: [in]
+	 *
+	 * Number of 32-bit words in the `gather_data_ptr` array.
+	 */
+	__u32 gather_data_words;
+
+	/**
+	 * @bufs_ptr: [in]
+	 *
+	 * Pointer to an array of drm_tegra_submit_buf structures.
+	 */
+	__u64 bufs_ptr;
+
+	/**
+	 * @cmds_ptr: [in]
+	 *
+	 * Pointer to an array of drm_tegra_submit_cmd structures.
+	 */
+	__u64 cmds_ptr;
+
+	/**
+	 * @gather_data_ptr: [in]
+	 *
+	 * Pointer to an array of Host1x opcodes to be used by GATHER_UPTR
+	 * commands.
+	 */
+	__u64 gather_data_ptr;
+
+	/**
+	 * @syncobj_in: [in]
+	 *
+	 * Handle for DRM syncobj that will be waited before submission.
+	 * Ignored if zero.
+	 */
+	__u32 syncobj_in;
+
+	/**
+	 * @syncobj_out: [in]
+	 *
+	 * Handle for DRM syncobj that will have its fence replaced with
+	 * the job's completion fence. Ignored if zero.
+	 */
+	__u32 syncobj_out;
+
+	/**
+	 * @syncpt_incr: [in,out]
+	 *
+	 * Information about the syncpoint the job will increment.
+	 */
+	struct drm_tegra_submit_syncpt syncpt;
+};
+
+struct drm_tegra_syncpoint_allocate {
+	/**
+	 * @id: [out]
+	 *
+	 * ID of allocated syncpoint.
+	 */
+	__u32 id;
+	__u32 padding;
+};
+
+struct drm_tegra_syncpoint_free {
+	/**
+	 * @id: [in]
+	 *
+	 * ID of syncpoint to free.
+	 */
+	__u32 id;
+	__u32 padding;
+};
+
+struct drm_tegra_syncpoint_wait {
+	/**
+	 * @timeout: [in]
+	 *
+	 * Absolute timestamp at which the wait will time out.
+	 */
+	__s64 timeout_ns;
+
+	/**
+	 * @id: [in]
+	 *
+	 * ID of syncpoint to wait on.
+	 */
+	__u32 id;
+
+	/**
+	 * @threshold: [in]
+	 *
+	 * Threshold to wait for.
+	 */
+	__u32 threshold;
+
+	/**
+	 * @value: [out]
+	 *
+	 * Value of the syncpoint upon wait completion.
+	 */
+	__u32 value;
+
+	__u32 padding;
+};
+
+#define DRM_IOCTL_TEGRA_CHANNEL_OPEN DRM_IOWR(DRM_COMMAND_BASE + 0x10, struct drm_tegra_channel_open)
+#define DRM_IOCTL_TEGRA_CHANNEL_CLOSE DRM_IOWR(DRM_COMMAND_BASE + 0x11, struct drm_tegra_channel_close)
+#define DRM_IOCTL_TEGRA_CHANNEL_MAP DRM_IOWR(DRM_COMMAND_BASE + 0x12, struct drm_tegra_channel_map)
+#define DRM_IOCTL_TEGRA_CHANNEL_UNMAP DRM_IOWR(DRM_COMMAND_BASE + 0x13, struct drm_tegra_channel_unmap)
+#define DRM_IOCTL_TEGRA_CHANNEL_SUBMIT DRM_IOWR(DRM_COMMAND_BASE + 0x14, struct drm_tegra_channel_submit)
+
+#define DRM_IOCTL_TEGRA_SYNCPOINT_ALLOCATE DRM_IOWR(DRM_COMMAND_BASE + 0x20, struct drm_tegra_syncpoint_allocate)
+#define DRM_IOCTL_TEGRA_SYNCPOINT_FREE DRM_IOWR(DRM_COMMAND_BASE + 0x21, struct drm_tegra_syncpoint_free)
+#define DRM_IOCTL_TEGRA_SYNCPOINT_WAIT DRM_IOWR(DRM_COMMAND_BASE + 0x22, struct drm_tegra_syncpoint_wait)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.32.0

