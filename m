Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D453CCF83
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 11:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C4889DA5;
	Mon, 19 Jul 2021 09:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC4489D8E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 09:00:01 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 7CB3580091;
 Mon, 19 Jul 2021 10:59:59 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] headers: drm: Sync core files with drm-next
Date: Mon, 19 Jul 2021 10:59:35 +0200
Message-Id: <20210719085935.15390-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Tc64SyYh c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=e5mUnYsNAAAA:8 a=SJz97ENfAAAA:8
 a=UYoTZ2hgAAAA:8 a=rWkr9Ua9AAAA:8 a=Ngo4zieShmjDpyWnuHQA:9
 a=QtiV2NhRUNugiftY:21 a=Pnjc_MSlQ-S2WPca:21 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=vFet0B0WnEQeilDPIY6i:22
 a=V6L1DCqn-8WKw3iEt1hp:22 a=Qv-QrLrHZjTXZfLJ-zom:22
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
Cc: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generated using make headers_install from the drm-next
tree - git://anongit.freedesktop.org/drm/drm
branch - drm-next
commit - 2734d6c1b1a089fb593ef6a23d4b70903526fe0c

The changes were as follows (shortlog from
b10733527bfd864605c33ab2e9a886eec317ec39):

Lionel Landwerlin (1):
      drm: fix drm_mode_create_blob comment

Mario Kleiner (1):
      drm/fourcc: Add 16 bpc fixed point framebuffer formats.

Noralf Trønnes (1):
      drm/uapi: Add USB connector type

Radhakrishna Sripada (1):
      drm/framebuffer: Format modifier for Intel Gen 12 render compression with Clear Color

Simon Ser (13):
      drm: improve kernel-docs in drm_mode.h
      drm: document drm_mode_get_connector
      drm: document drm_mode_modeinfo
      drm: document that user-space should force-probe connectors
      drm/doc: atomic implicitly enables other caps
      drm/doc: re-format drm.h file comment
      drm/doc: demote old doc-comments in drm.h
      drm/fourcc: fix Amlogic format modifier masks
      drm/uapi: document kernel capabilities
      drm/connector: demote connector force-probes for non-master clients
      drm: reference mode flags in DRM_CLIENT_CAP_* docs
      drm: clarify and linkify DRM_CLIENT_CAP_WRITEBACK_CONNECTORS docs
      drm: document minimum kernel version for DRM_CLIENT_CAP_*

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 include/drm/drm.h        | 250 ++++++++++++++++++++++++++++++---------
 include/drm/drm_fourcc.h |  32 ++++-
 include/drm/drm_mode.h   | 168 +++++++++++++++++++-------
 3 files changed, 350 insertions(+), 100 deletions(-)

diff --git a/include/drm/drm.h b/include/drm/drm.h
index c7fd2a35..398c396f 100644
--- a/include/drm/drm.h
+++ b/include/drm/drm.h
@@ -1,11 +1,10 @@
-/**
- * \file drm.h
+/*
  * Header for the Direct Rendering Manager
  *
- * \author Rickard E. (Rik) Faith <faith@valinux.com>
+ * Author: Rickard E. (Rik) Faith <faith@valinux.com>
  *
- * \par Acknowledgments:
- * Dec 1999, Richard Henderson <rth@twiddle.net>, move to generic \c cmpxchg.
+ * Acknowledgments:
+ * Dec 1999, Richard Henderson <rth@twiddle.net>, move to generic cmpxchg.
  */
 
 /*
@@ -79,7 +78,7 @@ typedef unsigned int drm_context_t;
 typedef unsigned int drm_drawable_t;
 typedef unsigned int drm_magic_t;
 
-/**
+/*
  * Cliprect.
  *
  * \warning: If you change this structure, make sure you change
@@ -95,7 +94,7 @@ struct drm_clip_rect {
 	unsigned short y2;
 };
 
-/**
+/*
  * Drawable information.
  */
 struct drm_drawable_info {
@@ -103,7 +102,7 @@ struct drm_drawable_info {
 	struct drm_clip_rect *rects;
 };
 
-/**
+/*
  * Texture region,
  */
 struct drm_tex_region {
@@ -114,7 +113,7 @@ struct drm_tex_region {
 	unsigned int age;
 };
 
-/**
+/*
  * Hardware lock.
  *
  * The lock structure is a simple cache-line aligned integer.  To avoid
@@ -126,7 +125,7 @@ struct drm_hw_lock {
 	char padding[60];			/**< Pad to cache line */
 };
 
-/**
+/*
  * DRM_IOCTL_VERSION ioctl argument type.
  *
  * \sa drmGetVersion().
@@ -143,7 +142,7 @@ struct drm_version {
 	char *desc;	  /**< User-space buffer to hold desc */
 };
 
-/**
+/*
  * DRM_IOCTL_GET_UNIQUE ioctl argument type.
  *
  * \sa drmGetBusid() and drmSetBusId().
@@ -162,7 +161,7 @@ struct drm_block {
 	int unused;
 };
 
-/**
+/*
  * DRM_IOCTL_CONTROL ioctl argument type.
  *
  * \sa drmCtlInstHandler() and drmCtlUninstHandler().
@@ -177,7 +176,7 @@ struct drm_control {
 	int irq;
 };
 
-/**
+/*
  * Type of memory to map.
  */
 enum drm_map_type {
@@ -189,7 +188,7 @@ enum drm_map_type {
 	_DRM_CONSISTENT = 5	  /**< Consistent memory for PCI DMA */
 };
 
-/**
+/*
  * Memory mapping flags.
  */
 enum drm_map_flags {
@@ -208,7 +207,7 @@ struct drm_ctx_priv_map {
 	void *handle;		 /**< Handle of map */
 };
 
-/**
+/*
  * DRM_IOCTL_GET_MAP, DRM_IOCTL_ADD_MAP and DRM_IOCTL_RM_MAP ioctls
  * argument type.
  *
@@ -225,7 +224,7 @@ struct drm_map {
 	/*   Private data */
 };
 
-/**
+/*
  * DRM_IOCTL_GET_CLIENT ioctl argument type.
  */
 struct drm_client {
@@ -257,7 +256,7 @@ enum drm_stat_type {
 	    /* Add to the *END* of the list */
 };
 
-/**
+/*
  * DRM_IOCTL_GET_STATS ioctl argument type.
  */
 struct drm_stats {
@@ -268,7 +267,7 @@ struct drm_stats {
 	} data[15];
 };
 
-/**
+/*
  * Hardware locking flags.
  */
 enum drm_lock_flags {
@@ -283,7 +282,7 @@ enum drm_lock_flags {
 	_DRM_HALT_CUR_QUEUES = 0x20  /**< Halt all current queues */
 };
 
-/**
+/*
  * DRM_IOCTL_LOCK, DRM_IOCTL_UNLOCK and DRM_IOCTL_FINISH ioctl argument type.
  *
  * \sa drmGetLock() and drmUnlock().
@@ -293,7 +292,7 @@ struct drm_lock {
 	enum drm_lock_flags flags;
 };
 
-/**
+/*
  * DMA flags
  *
  * \warning
@@ -322,7 +321,7 @@ enum drm_dma_flags {
 	_DRM_DMA_LARGER_OK = 0x40     /**< Larger-than-requested buffers OK */
 };
 
-/**
+/*
  * DRM_IOCTL_ADD_BUFS and DRM_IOCTL_MARK_BUFS ioctl argument type.
  *
  * \sa drmAddBufs().
@@ -345,7 +344,7 @@ struct drm_buf_desc {
 				  */
 };
 
-/**
+/*
  * DRM_IOCTL_INFO_BUFS ioctl argument type.
  */
 struct drm_buf_info {
@@ -353,7 +352,7 @@ struct drm_buf_info {
 	struct drm_buf_desc *list;
 };
 
-/**
+/*
  * DRM_IOCTL_FREE_BUFS ioctl argument type.
  */
 struct drm_buf_free {
@@ -361,7 +360,7 @@ struct drm_buf_free {
 	int *list;
 };
 
-/**
+/*
  * Buffer information
  *
  * \sa drm_buf_map.
@@ -373,7 +372,7 @@ struct drm_buf_pub {
 	void *address;	       /**< Address of buffer */
 };
 
-/**
+/*
  * DRM_IOCTL_MAP_BUFS ioctl argument type.
  */
 struct drm_buf_map {
@@ -386,7 +385,7 @@ struct drm_buf_map {
 	struct drm_buf_pub *list;	/**< Buffer information */
 };
 
-/**
+/*
  * DRM_IOCTL_DMA ioctl argument type.
  *
  * Indices here refer to the offset into the buffer list in drm_buf_get.
@@ -411,7 +410,7 @@ enum drm_ctx_flags {
 	_DRM_CONTEXT_2DONLY = 0x02
 };
 
-/**
+/*
  * DRM_IOCTL_ADD_CTX ioctl argument type.
  *
  * \sa drmCreateContext() and drmDestroyContext().
@@ -421,7 +420,7 @@ struct drm_ctx {
 	enum drm_ctx_flags flags;
 };
 
-/**
+/*
  * DRM_IOCTL_RES_CTX ioctl argument type.
  */
 struct drm_ctx_res {
@@ -429,14 +428,14 @@ struct drm_ctx_res {
 	struct drm_ctx *contexts;
 };
 
-/**
+/*
  * DRM_IOCTL_ADD_DRAW and DRM_IOCTL_RM_DRAW ioctl argument type.
  */
 struct drm_draw {
 	drm_drawable_t handle;
 };
 
-/**
+/*
  * DRM_IOCTL_UPDATE_DRAW ioctl argument type.
  */
 typedef enum {
@@ -450,14 +449,14 @@ struct drm_update_draw {
 	unsigned long long data;
 };
 
-/**
+/*
  * DRM_IOCTL_GET_MAGIC and DRM_IOCTL_AUTH_MAGIC ioctl argument type.
  */
 struct drm_auth {
 	drm_magic_t magic;
 };
 
-/**
+/*
  * DRM_IOCTL_IRQ_BUSID ioctl argument type.
  *
  * \sa drmGetInterruptFromBusID().
@@ -499,7 +498,7 @@ struct drm_wait_vblank_reply {
 	long tval_usec;
 };
 
-/**
+/*
  * DRM_IOCTL_WAIT_VBLANK ioctl argument type.
  *
  * \sa drmWaitVBlank().
@@ -512,7 +511,7 @@ union drm_wait_vblank {
 #define _DRM_PRE_MODESET 1
 #define _DRM_POST_MODESET 2
 
-/**
+/*
  * DRM_IOCTL_MODESET_CTL ioctl argument type
  *
  * \sa drmModesetCtl().
@@ -522,7 +521,7 @@ struct drm_modeset_ctl {
 	__u32 cmd;
 };
 
-/**
+/*
  * DRM_IOCTL_AGP_ENABLE ioctl argument type.
  *
  * \sa drmAgpEnable().
@@ -531,7 +530,7 @@ struct drm_agp_mode {
 	unsigned long mode;	/**< AGP mode */
 };
 
-/**
+/*
  * DRM_IOCTL_AGP_ALLOC and DRM_IOCTL_AGP_FREE ioctls argument type.
  *
  * \sa drmAgpAlloc() and drmAgpFree().
@@ -543,7 +542,7 @@ struct drm_agp_buffer {
 	unsigned long physical;	/**< Physical used by i810 */
 };
 
-/**
+/*
  * DRM_IOCTL_AGP_BIND and DRM_IOCTL_AGP_UNBIND ioctls argument type.
  *
  * \sa drmAgpBind() and drmAgpUnbind().
@@ -553,7 +552,7 @@ struct drm_agp_binding {
 	unsigned long offset;	/**< In bytes -- will round to page boundary */
 };
 
-/**
+/*
  * DRM_IOCTL_AGP_INFO ioctl argument type.
  *
  * \sa drmAgpVersionMajor(), drmAgpVersionMinor(), drmAgpGetMode(),
@@ -574,7 +573,7 @@ struct drm_agp_info {
 	unsigned short id_device;
 };
 
-/**
+/*
  * DRM_IOCTL_SG_ALLOC ioctl argument type.
  */
 struct drm_scatter_gather {
@@ -582,7 +581,7 @@ struct drm_scatter_gather {
 	unsigned long handle;	/**< Used for mapping / unmapping */
 };
 
-/**
+/*
  * DRM_IOCTL_SET_VERSION ioctl argument type.
  */
 struct drm_set_version {
@@ -592,14 +591,14 @@ struct drm_set_version {
 	int drm_dd_minor;
 };
 
-/** DRM_IOCTL_GEM_CLOSE ioctl argument type */
+/* DRM_IOCTL_GEM_CLOSE ioctl argument type */
 struct drm_gem_close {
 	/** Handle of the object to be closed. */
 	__u32 handle;
 	__u32 pad;
 };
 
-/** DRM_IOCTL_GEM_FLINK ioctl argument type */
+/* DRM_IOCTL_GEM_FLINK ioctl argument type */
 struct drm_gem_flink {
 	/** Handle for the object being named */
 	__u32 handle;
@@ -608,7 +607,7 @@ struct drm_gem_flink {
 	__u32 name;
 };
 
-/** DRM_IOCTL_GEM_OPEN ioctl argument type */
+/* DRM_IOCTL_GEM_OPEN ioctl argument type */
 struct drm_gem_open {
 	/** Name of object being opened */
 	__u32 name;
@@ -620,33 +619,150 @@ struct drm_gem_open {
 	__u64 size;
 };
 
+/**
+ * DRM_CAP_DUMB_BUFFER
+ *
+ * If set to 1, the driver supports creating dumb buffers via the
+ * &DRM_IOCTL_MODE_CREATE_DUMB ioctl.
+ */
 #define DRM_CAP_DUMB_BUFFER		0x1
+/**
+ * DRM_CAP_VBLANK_HIGH_CRTC
+ *
+ * If set to 1, the kernel supports specifying a CRTC index in the high bits of
+ * &drm_wait_vblank_request.type.
+ *
+ * Starting kernel version 2.6.39, this capability is always set to 1.
+ */
 #define DRM_CAP_VBLANK_HIGH_CRTC	0x2
+/**
+ * DRM_CAP_DUMB_PREFERRED_DEPTH
+ *
+ * The preferred bit depth for dumb buffers.
+ *
+ * The bit depth is the number of bits used to indicate the color of a single
+ * pixel excluding any padding. This is different from the number of bits per
+ * pixel. For instance, XRGB8888 has a bit depth of 24 but has 32 bits per
+ * pixel.
+ *
+ * Note that this preference only applies to dumb buffers, it's irrelevant for
+ * other types of buffers.
+ */
 #define DRM_CAP_DUMB_PREFERRED_DEPTH	0x3
+/**
+ * DRM_CAP_DUMB_PREFER_SHADOW
+ *
+ * If set to 1, the driver prefers userspace to render to a shadow buffer
+ * instead of directly rendering to a dumb buffer. For best speed, userspace
+ * should do streaming ordered memory copies into the dumb buffer and never
+ * read from it.
+ *
+ * Note that this preference only applies to dumb buffers, it's irrelevant for
+ * other types of buffers.
+ */
 #define DRM_CAP_DUMB_PREFER_SHADOW	0x4
+/**
+ * DRM_CAP_PRIME
+ *
+ * Bitfield of supported PRIME sharing capabilities. See &DRM_PRIME_CAP_IMPORT
+ * and &DRM_PRIME_CAP_EXPORT.
+ *
+ * PRIME buffers are exposed as dma-buf file descriptors. See
+ * Documentation/gpu/drm-mm.rst, section "PRIME Buffer Sharing".
+ */
 #define DRM_CAP_PRIME			0x5
+/**
+ * DRM_PRIME_CAP_IMPORT
+ *
+ * If this bit is set in &DRM_CAP_PRIME, the driver supports importing PRIME
+ * buffers via the &DRM_IOCTL_PRIME_FD_TO_HANDLE ioctl.
+ */
 #define  DRM_PRIME_CAP_IMPORT		0x1
+/**
+ * DRM_PRIME_CAP_EXPORT
+ *
+ * If this bit is set in &DRM_CAP_PRIME, the driver supports exporting PRIME
+ * buffers via the &DRM_IOCTL_PRIME_HANDLE_TO_FD ioctl.
+ */
 #define  DRM_PRIME_CAP_EXPORT		0x2
+/**
+ * DRM_CAP_TIMESTAMP_MONOTONIC
+ *
+ * If set to 0, the kernel will report timestamps with ``CLOCK_REALTIME`` in
+ * struct drm_event_vblank. If set to 1, the kernel will report timestamps with
+ * ``CLOCK_MONOTONIC``. See ``clock_gettime(2)`` for the definition of these
+ * clocks.
+ *
+ * Starting from kernel version 2.6.39, the default value for this capability
+ * is 1. Starting kernel version 4.15, this capability is always set to 1.
+ */
 #define DRM_CAP_TIMESTAMP_MONOTONIC	0x6
+/**
+ * DRM_CAP_ASYNC_PAGE_FLIP
+ *
+ * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC.
+ */
 #define DRM_CAP_ASYNC_PAGE_FLIP		0x7
-/*
- * The CURSOR_WIDTH and CURSOR_HEIGHT capabilities return a valid widthxheight
- * combination for the hardware cursor. The intention is that a hardware
- * agnostic userspace can query a cursor plane size to use.
+/**
+ * DRM_CAP_CURSOR_WIDTH
+ *
+ * The ``CURSOR_WIDTH`` and ``CURSOR_HEIGHT`` capabilities return a valid
+ * width x height combination for the hardware cursor. The intention is that a
+ * hardware agnostic userspace can query a cursor plane size to use.
  *
  * Note that the cross-driver contract is to merely return a valid size;
  * drivers are free to attach another meaning on top, eg. i915 returns the
  * maximum plane size.
  */
 #define DRM_CAP_CURSOR_WIDTH		0x8
+/**
+ * DRM_CAP_CURSOR_HEIGHT
+ *
+ * See &DRM_CAP_CURSOR_WIDTH.
+ */
 #define DRM_CAP_CURSOR_HEIGHT		0x9
+/**
+ * DRM_CAP_ADDFB2_MODIFIERS
+ *
+ * If set to 1, the driver supports supplying modifiers in the
+ * &DRM_IOCTL_MODE_ADDFB2 ioctl.
+ */
 #define DRM_CAP_ADDFB2_MODIFIERS	0x10
+/**
+ * DRM_CAP_PAGE_FLIP_TARGET
+ *
+ * If set to 1, the driver supports the &DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE and
+ * &DRM_MODE_PAGE_FLIP_TARGET_RELATIVE flags in
+ * &drm_mode_crtc_page_flip_target.flags for the &DRM_IOCTL_MODE_PAGE_FLIP
+ * ioctl.
+ */
 #define DRM_CAP_PAGE_FLIP_TARGET	0x11
+/**
+ * DRM_CAP_CRTC_IN_VBLANK_EVENT
+ *
+ * If set to 1, the kernel supports reporting the CRTC ID in
+ * &drm_event_vblank.crtc_id for the &DRM_EVENT_VBLANK and
+ * &DRM_EVENT_FLIP_COMPLETE events.
+ *
+ * Starting kernel version 4.12, this capability is always set to 1.
+ */
 #define DRM_CAP_CRTC_IN_VBLANK_EVENT	0x12
+/**
+ * DRM_CAP_SYNCOBJ
+ *
+ * If set to 1, the driver supports sync objects. See
+ * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
+ */
 #define DRM_CAP_SYNCOBJ		0x13
+/**
+ * DRM_CAP_SYNCOBJ_TIMELINE
+ *
+ * If set to 1, the driver supports timeline operations on sync objects. See
+ * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
+ */
 #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
 
-/** DRM_IOCTL_GET_CAP ioctl argument type */
+/* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
 	__u64 capability;
 	__u64 value;
@@ -655,9 +771,12 @@ struct drm_get_cap {
 /**
  * DRM_CLIENT_CAP_STEREO_3D
  *
- * if set to 1, the DRM core will expose the stereo 3D capabilities of the
+ * If set to 1, the DRM core will expose the stereo 3D capabilities of the
  * monitor by advertising the supported 3D layouts in the flags of struct
- * drm_mode_modeinfo.
+ * drm_mode_modeinfo. See ``DRM_MODE_FLAG_3D_*``.
+ *
+ * This capability is always supported for all drivers starting from kernel
+ * version 3.13.
  */
 #define DRM_CLIENT_CAP_STEREO_3D	1
 
@@ -666,13 +785,25 @@ struct drm_get_cap {
  *
  * If set to 1, the DRM core will expose all planes (overlay, primary, and
  * cursor) to userspace.
+ *
+ * This capability has been introduced in kernel version 3.15. Starting from
+ * kernel version 3.17, this capability is always supported for all drivers.
  */
 #define DRM_CLIENT_CAP_UNIVERSAL_PLANES  2
 
 /**
  * DRM_CLIENT_CAP_ATOMIC
  *
- * If set to 1, the DRM core will expose atomic properties to userspace
+ * If set to 1, the DRM core will expose atomic properties to userspace. This
+ * implicitly enables &DRM_CLIENT_CAP_UNIVERSAL_PLANES and
+ * &DRM_CLIENT_CAP_ASPECT_RATIO.
+ *
+ * If the driver doesn't support atomic mode-setting, enabling this capability
+ * will fail with -EOPNOTSUPP.
+ *
+ * This capability has been introduced in kernel version 4.0. Starting from
+ * kernel version 4.2, this capability is always supported for atomic-capable
+ * drivers.
  */
 #define DRM_CLIENT_CAP_ATOMIC	3
 
@@ -680,6 +811,10 @@ struct drm_get_cap {
  * DRM_CLIENT_CAP_ASPECT_RATIO
  *
  * If set to 1, the DRM core will provide aspect ratio information in modes.
+ * See ``DRM_MODE_FLAG_PIC_AR_*``.
+ *
+ * This capability is always supported for all drivers starting from kernel
+ * version 4.18.
  */
 #define DRM_CLIENT_CAP_ASPECT_RATIO    4
 
@@ -687,12 +822,15 @@ struct drm_get_cap {
  * DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
  *
  * If set to 1, the DRM core will expose special connectors to be used for
- * writing back to memory the scene setup in the commit. Depends on client
- * also supporting DRM_CLIENT_CAP_ATOMIC
+ * writing back to memory the scene setup in the commit. The client must enable
+ * &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This capability is always supported for atomic-capable drivers starting from
+ * kernel version 4.19.
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
-/** DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
+/* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
 	__u64 value;
@@ -944,7 +1082,7 @@ extern "C" {
 
 #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
 
-/**
+/*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
  * Generic IOCTLS restart at 0xA0.
@@ -955,7 +1093,7 @@ extern "C" {
 #define DRM_COMMAND_BASE                0x40
 #define DRM_COMMAND_END			0xA0
 
-/**
+/*
  * Header for events written back to userspace on the drm fd.  The
  * type defines the type of event, the length specifies the total
  * length of the event (including the header), and user_data is
diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index ed0258c6..cd3ce8a8 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -168,6 +168,13 @@ extern "C" {
 #define DRM_FORMAT_RGBA1010102	fourcc_code('R', 'A', '3', '0') /* [31:0] R:G:B:A 10:10:10:2 little endian */
 #define DRM_FORMAT_BGRA1010102	fourcc_code('B', 'A', '3', '0') /* [31:0] B:G:R:A 10:10:10:2 little endian */
 
+/* 64 bpp RGB */
+#define DRM_FORMAT_XRGB16161616	fourcc_code('X', 'R', '4', '8') /* [63:0] x:R:G:B 16:16:16:16 little endian */
+#define DRM_FORMAT_XBGR16161616	fourcc_code('X', 'B', '4', '8') /* [63:0] x:B:G:R 16:16:16:16 little endian */
+
+#define DRM_FORMAT_ARGB16161616	fourcc_code('A', 'R', '4', '8') /* [63:0] A:R:G:B 16:16:16:16 little endian */
+#define DRM_FORMAT_ABGR16161616	fourcc_code('A', 'B', '4', '8') /* [63:0] A:B:G:R 16:16:16:16 little endian */
+
 /*
  * Floating point 64bpp RGB
  * IEEE 754-2008 binary16 half-precision float
@@ -474,7 +481,7 @@ extern "C" {
  * This is a tiled layout using 4Kb tiles in row-major layout.
  * Within the tile pixels are laid out in 16 256 byte units / sub-tiles which
  * are arranged in four groups (two wide, two high) with column-major layout.
- * Each group therefore consists out of four 256 byte units, which are also laid
+ * Each group therefore consits out of four 256 byte units, which are also laid
  * out as 2x2 column-major.
  * 256 byte units are made out of four 64 byte blocks of pixels, producing
  * either a square block or a 2:1 unit.
@@ -527,6 +534,25 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS fourcc_mod_code(INTEL, 7)
 
+/*
+ * Intel Color Control Surface with Clear Color (CCS) for Gen-12 render
+ * compression.
+ *
+ * The main surface is Y-tiled and is at plane index 0 whereas CCS is linear
+ * and at index 1. The clear color is stored at index 2, and the pitch should
+ * be ignored. The clear color structure is 256 bits. The first 128 bits
+ * represents Raw Clear Color Red, Green, Blue and Alpha color each represented
+ * by 32 bits. The raw clear color is consumed by the 3d engine and generates
+ * the converted clear color of size 64 bits. The first 32 bits store the Lower
+ * Converted Clear Color value and the next 32 bits store the Higher Converted
+ * Clear Color value when applicable. The Converted Clear Color values are
+ * consumed by the DE. The last 64 bits are used to store Color Discard Enable
+ * and Depth Clear Value Valid which are ignored by the DE. A CCS cache line
+ * corresponds to an area of 4x1 tiles in the main surface. The main surface
+ * pitch is required to be a multiple of 4 tile widths.
+ */
+#define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
@@ -1036,9 +1062,9 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  * Not all combinations are valid, and different SoCs may support different
  * combinations of layout and options.
  */
-#define __fourcc_mod_amlogic_layout_mask 0xf
+#define __fourcc_mod_amlogic_layout_mask 0xff
 #define __fourcc_mod_amlogic_options_shift 8
-#define __fourcc_mod_amlogic_options_mask 0xf
+#define __fourcc_mod_amlogic_options_mask 0xff
 
 #define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
 	fourcc_mod_code(AMLOGIC, \
diff --git a/include/drm/drm_mode.h b/include/drm/drm_mode.h
index 96416e6d..9b6722d4 100644
--- a/include/drm/drm_mode.h
+++ b/include/drm/drm_mode.h
@@ -218,6 +218,27 @@ extern "C" {
 #define DRM_MODE_CONTENT_PROTECTION_DESIRED     1
 #define DRM_MODE_CONTENT_PROTECTION_ENABLED     2
 
+/**
+ * struct drm_mode_modeinfo - Display mode information.
+ * @clock: pixel clock in kHz
+ * @hdisplay: horizontal display size
+ * @hsync_start: horizontal sync start
+ * @hsync_end: horizontal sync end
+ * @htotal: horizontal total size
+ * @hskew: horizontal skew
+ * @vdisplay: vertical display size
+ * @vsync_start: vertical sync start
+ * @vsync_end: vertical sync end
+ * @vtotal: vertical total size
+ * @vscan: vertical scan
+ * @vrefresh: approximate vertical refresh rate in Hz
+ * @flags: bitmask of misc. flags, see DRM_MODE_FLAG_* defines
+ * @type: bitmask of type flags, see DRM_MODE_TYPE_* defines
+ * @name: string describing the mode resolution
+ *
+ * This is the user-space API display mode information structure. For the
+ * kernel version see struct drm_display_mode.
+ */
 struct drm_mode_modeinfo {
 	__u32 clock;
 	__u16 hdisplay;
@@ -367,28 +388,95 @@ enum drm_mode_subconnector {
 #define DRM_MODE_CONNECTOR_DPI		17
 #define DRM_MODE_CONNECTOR_WRITEBACK	18
 #define DRM_MODE_CONNECTOR_SPI		19
+#define DRM_MODE_CONNECTOR_USB		20
 
+/**
+ * struct drm_mode_get_connector - Get connector metadata.
+ *
+ * User-space can perform a GETCONNECTOR ioctl to retrieve information about a
+ * connector. User-space is expected to retrieve encoders, modes and properties
+ * by performing this ioctl at least twice: the first time to retrieve the
+ * number of elements, the second time to retrieve the elements themselves.
+ *
+ * To retrieve the number of elements, set @count_props and @count_encoders to
+ * zero, set @count_modes to 1, and set @modes_ptr to a temporary struct
+ * drm_mode_modeinfo element.
+ *
+ * To retrieve the elements, allocate arrays for @encoders_ptr, @modes_ptr,
+ * @props_ptr and @prop_values_ptr, then set @count_modes, @count_props and
+ * @count_encoders to their capacity.
+ *
+ * Performing the ioctl only twice may be racy: the number of elements may have
+ * changed with a hotplug event in-between the two ioctls. User-space is
+ * expected to retry the last ioctl until the number of elements stabilizes.
+ * The kernel won't fill any array which doesn't have the expected length.
+ *
+ * **Force-probing a connector**
+ *
+ * If the @count_modes field is set to zero and the DRM client is the current
+ * DRM master, the kernel will perform a forced probe on the connector to
+ * refresh the connector status, modes and EDID. A forced-probe can be slow,
+ * might cause flickering and the ioctl will block.
+ *
+ * User-space needs to force-probe connectors to ensure their metadata is
+ * up-to-date at startup and after receiving a hot-plug event. User-space
+ * may perform a forced-probe when the user explicitly requests it. User-space
+ * shouldn't perform a forced-probe in other situations.
+ */
 struct drm_mode_get_connector {
-
+	/** @encoders_ptr: Pointer to ``__u32`` array of object IDs. */
 	__u64 encoders_ptr;
+	/** @modes_ptr: Pointer to struct drm_mode_modeinfo array. */
 	__u64 modes_ptr;
+	/** @props_ptr: Pointer to ``__u32`` array of property IDs. */
 	__u64 props_ptr;
+	/** @prop_values_ptr: Pointer to ``__u64`` array of property values. */
 	__u64 prop_values_ptr;
 
+	/** @count_modes: Number of modes. */
 	__u32 count_modes;
+	/** @count_props: Number of properties. */
 	__u32 count_props;
+	/** @count_encoders: Number of encoders. */
 	__u32 count_encoders;
 
-	__u32 encoder_id; /**< Current Encoder */
-	__u32 connector_id; /**< Id */
+	/** @encoder_id: Object ID of the current encoder. */
+	__u32 encoder_id;
+	/** @connector_id: Object ID of the connector. */
+	__u32 connector_id;
+	/**
+	 * @connector_type: Type of the connector.
+	 *
+	 * See DRM_MODE_CONNECTOR_* defines.
+	 */
 	__u32 connector_type;
+	/**
+	 * @connector_type_id: Type-specific connector number.
+	 *
+	 * This is not an object ID. This is a per-type connector number. Each
+	 * (type, type_id) combination is unique across all connectors of a DRM
+	 * device.
+	 */
 	__u32 connector_type_id;
 
+	/**
+	 * @connection: Status of the connector.
+	 *
+	 * See enum drm_connector_status.
+	 */
 	__u32 connection;
-	__u32 mm_width;  /**< width in millimeters */
-	__u32 mm_height; /**< height in millimeters */
+	/** @mm_width: Width of the connected sink in millimeters. */
+	__u32 mm_width;
+	/** @mm_height: Height of the connected sink in millimeters. */
+	__u32 mm_height;
+	/**
+	 * @subpixel: Subpixel order of the connected sink.
+	 *
+	 * See enum subpixel_order.
+	 */
 	__u32 subpixel;
 
+	/** @pad: Padding, must be zero. */
 	__u32 pad;
 };
 
@@ -417,7 +505,7 @@ struct drm_mode_get_connector {
 /* the PROP_ATOMIC flag is used to hide properties from userspace that
  * is not aware of atomic properties.  This is mostly to work around
  * older userspace (DDX drivers) that read/write each prop they find,
- * without being aware that this could be triggering a lengthy modeset.
+ * witout being aware that this could be triggering a lengthy modeset.
  */
 #define DRM_MODE_PROP_ATOMIC        0x80000000
 
@@ -904,25 +992,24 @@ struct drm_format_modifier {
 };
 
 /**
- * struct drm_mode_create_blob - Create New block property
- * @data: Pointer to data to copy.
- * @length: Length of data to copy.
- * @blob_id: new property ID.
+ * struct drm_mode_create_blob - Create New blob property
+ *
  * Create a new 'blob' data property, copying length bytes from data pointer,
  * and returning new blob ID.
  */
 struct drm_mode_create_blob {
-	/** Pointer to data to copy. */
+	/** @data: Pointer to data to copy. */
 	__u64 data;
-	/** Length of data to copy. */
+	/** @length: Length of data to copy. */
 	__u32 length;
-	/** Return: new property ID. */
+	/** @blob_id: Return: new property ID. */
 	__u32 blob_id;
 };
 
 /**
  * struct drm_mode_destroy_blob - Destroy user blob
  * @blob_id: blob_id to destroy
+ *
  * Destroy a user-created blob property.
  *
  * User-space can release blobs as soon as they do not need to refer to them by
@@ -937,36 +1024,32 @@ struct drm_mode_destroy_blob {
 
 /**
  * struct drm_mode_create_lease - Create lease
- * @object_ids: Pointer to array of object ids.
- * @object_count: Number of object ids.
- * @flags: flags for new FD.
- * @lessee_id: unique identifier for lessee.
- * @fd: file descriptor to new drm_master file.
+ *
  * Lease mode resources, creating another drm_master.
  */
 struct drm_mode_create_lease {
-	/** Pointer to array of object ids (__u32) */
+	/** @object_ids: Pointer to array of object ids (__u32) */
 	__u64 object_ids;
-	/** Number of object ids */
+	/** @object_count: Number of object ids */
 	__u32 object_count;
-	/** flags for new FD (O_CLOEXEC, etc) */
+	/** @flags: flags for new FD (O_CLOEXEC, etc) */
 	__u32 flags;
 
-	/** Return: unique identifier for lessee. */
+	/** @lessee_id: Return: unique identifier for lessee. */
 	__u32 lessee_id;
-	/** Return: file descriptor to new drm_master file */
+	/** @fd: Return: file descriptor to new drm_master file */
 	__u32 fd;
 };
 
 /**
  * struct drm_mode_list_lessees - List lessees
- * @count_lessees: Number of lessees.
- * @pad: pad.
- * @lessees_ptr: Pointer to lessess.
- * List lesses from a drm_master
+ *
+ * List lesses from a drm_master.
  */
 struct drm_mode_list_lessees {
-	/** Number of lessees.
+	/**
+	 * @count_lessees: Number of lessees.
+	 *
 	 * On input, provides length of the array.
 	 * On output, provides total number. No
 	 * more than the input number will be written
@@ -974,23 +1057,26 @@ struct drm_mode_list_lessees {
 	 * the size and then the data.
 	 */
 	__u32 count_lessees;
+	/** @pad: Padding. */
 	__u32 pad;
 
-	/** Pointer to lessees.
-	 * pointer to __u64 array of lessee ids
+	/**
+	 * @lessees_ptr: Pointer to lessees.
+	 *
+	 * Pointer to __u64 array of lessee ids
 	 */
 	__u64 lessees_ptr;
 };
 
 /**
  * struct drm_mode_get_lease - Get Lease
- * @count_objects: Number of leased objects.
- * @pad: pad.
- * @objects_ptr: Pointer to objects.
- * Get leased objects
+ *
+ * Get leased objects.
  */
 struct drm_mode_get_lease {
-	/** Number of leased objects.
+	/**
+	 * @count_objects: Number of leased objects.
+	 *
 	 * On input, provides length of the array.
 	 * On output, provides total number. No
 	 * more than the input number will be written
@@ -998,22 +1084,22 @@ struct drm_mode_get_lease {
 	 * the size and then the data.
 	 */
 	__u32 count_objects;
+	/** @pad: Padding. */
 	__u32 pad;
 
-	/** Pointer to objects.
-	 * pointer to __u32 array of object ids
+	/**
+	 * @objects_ptr: Pointer to objects.
+	 *
+	 * Pointer to __u32 array of object ids.
 	 */
 	__u64 objects_ptr;
 };
 
 /**
  * struct drm_mode_revoke_lease - Revoke lease
- * @lessee_id: Unique ID of lessee.
- * Revoke lease
  */
 struct drm_mode_revoke_lease {
-	/** Unique ID of lessee
-	 */
+	/** @lessee_id: Unique ID of lessee */
 	__u32 lessee_id;
 };
 
-- 
2.23.0

