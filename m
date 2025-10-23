Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FF2BFF55E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 08:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB55110E88B;
	Thu, 23 Oct 2025 06:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="KcDaXgjP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FDD10E88B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 06:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=2mg9PxhAuWd0IcBVyC6+oe/1W9+8LpgbCQK8mOaaiKo=; b=KcDaXgjP3by2QBuA/XaLRyJcHb
 jFvQdSORVeDPYdyPN9/XwvfvFc96Ql18rouFZYWBINL7NnpABhpa16NtwfDVL3977K9ouSdEuV+9K
 eV44beaknEEtqT2o5xzd3D9scrW5EeGRLw8UfxDU/TmZSwWC91t4THtnuiTQuhmSvYcCO1cYZ2Tev
 4x7Ucs4s2JsWHC7oup84QgNI6Q91jfuDyMOJatnlKoEHGq8CKXaOGk5ln8tEFlBgCpblk4fQ27Yaq
 Gg42z8lomGv5dZJcQABcxBaM7YgkN7fvfIRUGrRuYi6wRygYD4O9SIhNdRrFGXvYrFwsSfI0LDgWT
 tY7OD4Hg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vBoka-00000005DHH-3IvF; Thu, 23 Oct 2025 06:24:40 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Oded Gabbay <ogabbay@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] accel/rocket: rocket_accel.h: fix kernel-doc warnings
Date: Wed, 22 Oct 2025 23:24:40 -0700
Message-ID: <20251023062440.4093661-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.1
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

Fix all kernel-doc warnings in rocket_accel.h:

Warning: include/uapi/drm/rocket_accel.h:35 Incorrect use of kernel-doc
 format:  * Output: DMA address for the BO in the NPU address space.
 This address

and 22 warnings like these:

Warning: include/uapi/drm/rocket_accel.h:43 struct member 'size'
 not described in 'drm_rocket_create_bo'
Warning: include/uapi/drm/rocket_accel.h:60 struct member 'handle'
 not described in 'drm_rocket_prep_bo'
Warning: include/uapi/drm/rocket_accel.h:73 struct member 'handle'
 not described in 'drm_rocket_fini_bo'
Warning: include/uapi/drm/rocket_accel.h:86 struct member 'regcmd'
 not described in 'drm_rocket_task'
Warning: include/uapi/drm/rocket_accel.h:116 struct member 'tasks'
 not described in 'drm_rocket_job'
Warning: include/uapi/drm/rocket_accel.h:135 struct member 'jobs'
 not described in 'drm_rocket_submit'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/uapi/drm/rocket_accel.h |   98 ++++++++++++++++++++++--------
 1 file changed, 74 insertions(+), 24 deletions(-)

--- linux-next-20251022.orig/include/uapi/drm/rocket_accel.h
+++ linux-next-20251022/include/uapi/drm/rocket_accel.h
@@ -26,20 +26,27 @@ extern "C" {
  *
  */
 struct drm_rocket_create_bo {
-	/** Input: Size of the requested BO. */
+	/**
+	 * @size: Input: Size of the requested BO.
+	 */
 	__u32 size;
 
-	/** Output: GEM handle for the BO. */
+	/**
+	 * @handle: Output: GEM handle for the BO.
+	 */
 	__u32 handle;
 
 	/**
-	 * Output: DMA address for the BO in the NPU address space.  This address
-	 * is private to the DRM fd and is valid for the lifetime of the GEM
-	 * handle.
+	 * @dma_address: Output: DMA address for the BO in the NPU address
+	 * space.  This address is private to the DRM fd and is valid for
+	 * the lifetime of the GEM handle.
 	 */
 	__u64 dma_address;
 
-	/** Output: Offset into the drm node to use for subsequent mmap call. */
+	/**
+	 * @offset: Output: Offset into the drm node to use for subsequent
+	 * mmap call.
+	 */
 	__u64 offset;
 };
 
@@ -50,13 +57,19 @@ struct drm_rocket_create_bo {
  * synchronization.
  */
 struct drm_rocket_prep_bo {
-	/** Input: GEM handle of the buffer object. */
+	/**
+	 * @handle: Input: GEM handle of the buffer object.
+	 */
 	__u32 handle;
 
-	/** Reserved, must be zero. */
+	/**
+	 * @reserved: Reserved, must be zero.
+	 */
 	__u32 reserved;
 
-	/** Input: Amount of time to wait for NPU jobs. */
+	/**
+	 * @timeout_ns: Input: Amount of time to wait for NPU jobs.
+	 */
 	__s64 timeout_ns;
 };
 
@@ -66,10 +79,14 @@ struct drm_rocket_prep_bo {
  * Synchronize caches for NPU access.
  */
 struct drm_rocket_fini_bo {
-	/** Input: GEM handle of the buffer object. */
+	/**
+	 * @handle: Input: GEM handle of the buffer object.
+	 */
 	__u32 handle;
 
-	/** Reserved, must be zero. */
+	/**
+	 * @reserved: Reserved, must be zero.
+	 */
 	__u32 reserved;
 };
 
@@ -79,10 +96,15 @@ struct drm_rocket_fini_bo {
  * A task is the smallest unit of work that can be run on the NPU.
  */
 struct drm_rocket_task {
-	/** Input: DMA address to NPU mapping of register command buffer */
+	/**
+	 * @regcmd: Input: DMA address to NPU mapping of register command buffer
+	 */
 	__u32 regcmd;
 
-	/** Input: Number of commands in the register command buffer */
+	/**
+	 * @regcmd_count: Input: Number of commands in the register command
+	 * buffer
+	 */
 	__u32 regcmd_count;
 };
 
@@ -94,25 +116,44 @@ struct drm_rocket_task {
  * sequentially on the same core, to benefit from memory residency in SRAM.
  */
 struct drm_rocket_job {
-	/** Input: Pointer to an array of struct drm_rocket_task. */
+	/**
+	 * @tasks: Input: Pointer to an array of struct drm_rocket_task.
+	 */
 	__u64 tasks;
 
-	/** Input: Pointer to a u32 array of the BOs that are read by the job. */
+	/**
+	 * @in_bo_handles: Input: Pointer to a u32 array of the BOs that
+	 * are read by the job.
+	 */
 	__u64 in_bo_handles;
 
-	/** Input: Pointer to a u32 array of the BOs that are written to by the job. */
+	/**
+	 * @out_bo_handles: Input: Pointer to a u32 array of the BOs that
+	 * are written to by the job.
+	 */
 	__u64 out_bo_handles;
 
-	/** Input: Number of tasks passed in. */
+	/**
+	 * @task_count: Input: Number of tasks passed in.
+	 */
 	__u32 task_count;
 
-	/** Input: Size in bytes of the structs in the @tasks field. */
+	/**
+	 * @task_struct_size: Input: Size in bytes of the structs in the
+	 * @tasks field.
+	 */
 	__u32 task_struct_size;
 
-	/** Input: Number of input BO handles passed in (size is that times 4). */
+	/**
+	 * @in_bo_handle_count: Input: Number of input BO handles passed in
+	 * (size is that times 4).
+	 */
 	__u32 in_bo_handle_count;
 
-	/** Input: Number of output BO handles passed in (size is that times 4). */
+	/**
+	 * @out_bo_handle_count: Input: Number of output BO handles passed in
+	 * (size is that times 4).
+	 */
 	__u32 out_bo_handle_count;
 };
 
@@ -122,16 +163,25 @@ struct drm_rocket_job {
  * The kernel will schedule the execution of these jobs in dependency order.
  */
 struct drm_rocket_submit {
-	/** Input: Pointer to an array of struct drm_rocket_job. */
+	/**
+	 * @jobs: Input: Pointer to an array of struct drm_rocket_job.
+	 */
 	__u64 jobs;
 
-	/** Input: Number of jobs passed in. */
+	/**
+	 * @job_count: Input: Number of jobs passed in.
+	 */
 	__u32 job_count;
 
-	/** Input: Size in bytes of the structs in the @jobs field. */
+	/**
+	 * @job_struct_size: Input: Size in bytes of the structs in the
+	 * @jobs field.
+	 */
 	__u32 job_struct_size;
 
-	/** Reserved, must be zero. */
+	/**
+	 * @reserved: Reserved, must be zero.
+	 */
 	__u64 reserved;
 };
 
