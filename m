Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DCE3BAA36
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 22:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAC389CBC;
	Sat,  3 Jul 2021 19:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3E189CBC
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jul 2021 19:59:56 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id hc16so22220872ejc.12
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jul 2021 12:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kLQrtJv58aMfEF9OQy9liPbvRBW+hNnKfdefkXez+b8=;
 b=jwXzUjtPssRNGl52JuCcX/eUQFDNxTMtT+xB52sJgLq9OKEoAVC0pJ9afX7+qEmNJ5
 sVMmTv1SY4sDpOG4FnENVfmdmSwmHlOUhlEW+916a7FGx3gAfRv1h0+QMRtGg7Z3oXPf
 fhwFj0lpzi6sEhMsP0on6n7vNZmUlRvQc8duW0B4anRq+HYyuERlco/JrngxzifaOyMB
 FlSQTMahHtcqPIu9+BFxB48jw8Rk1erzN4YEGJ77O30nkcaldZq3GM0LTT6y3fsZohxg
 mAbva7uTwBV0p8ZDxWXUL7yh/ctEleP8USpp3ycDHmEdMykCM9My1OcSSQ3Fr0M4l3l/
 tHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kLQrtJv58aMfEF9OQy9liPbvRBW+hNnKfdefkXez+b8=;
 b=LA9Z8ZRXl1ffcXQ9qdxXtE77+mEcRYmU6xG5gOsHlWdr3kPZwPg7OQ//sgMf+vBKdx
 Ubj+NcNLQnvtAxV0LFUCxt0ImT4sfuP5D9RY8hQBLD6Wj27dVYA5t3ptwJb1aLlIV8cN
 eEcnzASg6PwzdyDmsMiTgnvoYGqdDYHDCgrzY/lnkAkE68cC+UwihEpvqjhltRaFv0h7
 Z6O763R28Pn035ocuS4wuaWWbEa1l9nzd4HpJN1aXVuOvTt0HqTCOe4qoEheC4Ia/Uyb
 BeuDBRpjF4aLADT+ivxYjPB2j0G7PDHm+P/irXTIPkkg/mNVKGthCQOp2WkKVUiJ44Iq
 Ra5w==
X-Gm-Message-State: AOAM533MK9ifrim/CA/imKHxenV3jBSMBAhXgIvrIuly7hNRuhpInA7W
 /gWx7lgIueywMYCvKlcgPVkTNP0uCvU=
X-Google-Smtp-Source: ABdhPJyGVkqZB+MKqm5VA4olxUG6yxUZ1cKBqWg93AhBeVDEb9PM/ywC3dt173RWUYuovMuEE4cDQQ==
X-Received: by 2002:a17:907:7d8c:: with SMTP id
 oz12mr5739446ejc.202.1625342393842; 
 Sat, 03 Jul 2021 12:59:53 -0700 (PDT)
Received: from twisty.localdomain
 (dynamic-2a01-0c22-d418-5400-6cbb-50d4-b91e-5b37.c22.pool.telefonica.de.
 [2a01:c22:d418:5400:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id s12sm2922249edd.68.2021.07.03.12.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 12:59:53 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] headers: drm: Sync with drm-next
Date: Sat,  3 Jul 2021 21:59:40 +0200
Message-Id: <20210703195940.25797-1-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
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

Generated using make headers_install from the drm-next
tree - git://anongit.freedesktop.org/drm/drm
branch - drm-next
commit - 8a02ea42bc1d4c448caf1bab0e05899dad503f74

The changes were as follows (shortlog from
b10733527bfd864605c33ab2e9a886eec317ec39..HEAD):

Aaron Liu (1):
      drm/amdgpu: add uapi to define yellow carp series

Abdiel Janulgue (1):
      drm/i915/query: Expose memory regions through the query uAPI

Alex Deucher (1):
      drm/amdgpu: add INFO ioctl support for querying video caps (v4)

Chris Wilson (1):
      drm/i915/gt: Track the overall awake/busy time

Christian Gmeiner (1):
      drm/etnaviv: provide more ID values via GET_PARAM ioctl.

Felix Kuehling (1):
      drm/amdgpu: Add new placement for preemptible SG BOs

Jason Ekstrand (1):
      drm/i915/gem: Drop legacy execbuffer support (v2)

Jiawei Gu (1):
      drm/amdgpu: Add vbios info ioctl interface

Jonathan Marek (2):
      drm/msm: add MSM_BO_CACHED_COHERENT
      drm/msm: deprecate MSM_BO_UNCACHED (map as writecombine instead)

Lionel Landwerlin (1):
      drm: fix drm_mode_create_blob comment

Mario Kleiner (1):
      drm/fourcc: Add 16 bpc fixed point framebuffer formats.

Matthew Auld (5):
      drm/i915/uapi: fix kernel doc warnings
      drm/i915/uapi: convert i915_user_extension to kernel doc
      drm/i915/uapi: convert i915_query and friend to kernel doc
      drm/i915/uapi: introduce drm_i915_gem_create_ext
      drm/i915/uapi: implement object placement extension

Nirmoy Das (1):
      drm/amdgpu: remove AMDGPU_GEM_CREATE_SHADOW flag

Noralf Trønnes (1):
      drm/uapi: Add USB connector type

Radhakrishna Sripada (1):
      drm/framebuffer: Format modifier for Intel Gen 12 render compression with Clear Color

Rob Clark (1):
      drm/msm: Add param for userspace to query suspend count

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

Tvrtko Ursulin (1):
      drm/i915/pmu: Deprecate I915_PMU_LAST and optimize state tracking

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 etnaviv/etnaviv_drm.h    |  13 +-
 include/drm/amdgpu_drm.h |  18 +-
 include/drm/drm.h        | 250 +++++++++---
 include/drm/drm_fourcc.h |  32 +-
 include/drm/drm_mode.h   | 168 ++++++--
 include/drm/i915_drm.h   | 862 +++++++++++++++++++++++++++++++++++++--
 include/drm/msm_drm.h    |  71 +++-
 7 files changed, 1266 insertions(+), 148 deletions(-)

diff --git a/etnaviv/etnaviv_drm.h b/etnaviv/etnaviv_drm.h
index 0d5c49dc..af024d90 100644
--- a/etnaviv/etnaviv_drm.h
+++ b/etnaviv/etnaviv_drm.h
@@ -73,6 +73,10 @@ struct drm_etnaviv_timespec {
 #define ETNAVIV_PARAM_GPU_INSTRUCTION_COUNT         0x18
 #define ETNAVIV_PARAM_GPU_NUM_CONSTANTS             0x19
 #define ETNAVIV_PARAM_GPU_NUM_VARYINGS              0x1a
+#define ETNAVIV_PARAM_SOFTPIN_START_ADDR            0x1b
+#define ETNAVIV_PARAM_GPU_PRODUCT_ID                0x1c
+#define ETNAVIV_PARAM_GPU_CUSTOMER_ID               0x1d
+#define ETNAVIV_PARAM_GPU_ECO_ID                    0x1e
 
 #define ETNA_MAX_PIPES 4
 
@@ -148,6 +152,11 @@ struct drm_etnaviv_gem_submit_reloc {
  * then patching the cmdstream for this entry is skipped.  This can
  * avoid kernel needing to map/access the cmdstream bo in the common
  * case.
+ * If the submit is a softpin submit (ETNA_SUBMIT_SOFTPIN) the 'presumed'
+ * field is interpreted as the fixed location to map the bo into the gpu
+ * virtual address space. If the kernel is unable to map the buffer at
+ * this location the submit will fail. This means userspace is responsible
+ * for the whole gpu virtual address management.
  */
 #define ETNA_SUBMIT_BO_READ             0x0001
 #define ETNA_SUBMIT_BO_WRITE            0x0002
@@ -177,9 +186,11 @@ struct drm_etnaviv_gem_submit_pmr {
 #define ETNA_SUBMIT_NO_IMPLICIT         0x0001
 #define ETNA_SUBMIT_FENCE_FD_IN         0x0002
 #define ETNA_SUBMIT_FENCE_FD_OUT        0x0004
+#define ETNA_SUBMIT_SOFTPIN             0x0008
 #define ETNA_SUBMIT_FLAGS		(ETNA_SUBMIT_NO_IMPLICIT | \
 					 ETNA_SUBMIT_FENCE_FD_IN | \
-					 ETNA_SUBMIT_FENCE_FD_OUT)
+					 ETNA_SUBMIT_FENCE_FD_OUT| \
+					 ETNA_SUBMIT_SOFTPIN)
 #define ETNA_PIPE_3D      0x00
 #define ETNA_PIPE_2D      0x01
 #define ETNA_PIPE_VG      0x02
diff --git a/include/drm/amdgpu_drm.h b/include/drm/amdgpu_drm.h
index 72856654..0cbd1540 100644
--- a/include/drm/amdgpu_drm.h
+++ b/include/drm/amdgpu_drm.h
@@ -116,8 +116,6 @@ extern "C" {
 #define AMDGPU_GEM_CREATE_CPU_GTT_USWC		(1 << 2)
 /* Flag that the memory should be in VRAM and cleared */
 #define AMDGPU_GEM_CREATE_VRAM_CLEARED		(1 << 3)
-/* Flag that create shadow bo(GTT) while allocating vram bo */
-#define AMDGPU_GEM_CREATE_SHADOW		(1 << 4)
 /* Flag that allocating the BO should use linear VRAM */
 #define AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS	(1 << 5)
 /* Flag that BO is always valid in this VM */
@@ -138,6 +136,10 @@ extern "C" {
  * accessing it with various hw blocks
  */
 #define AMDGPU_GEM_CREATE_ENCRYPTED		(1 << 10)
+/* Flag that BO will be used only in preemptible context, which does
+ * not require GTT memory accounting
+ */
+#define AMDGPU_GEM_CREATE_PREEMPTIBLE		(1 << 11)
 
 struct drm_amdgpu_gem_create_in  {
 	/** the requested memory size */
@@ -755,6 +757,8 @@ struct drm_amdgpu_cs_chunk_data {
 	#define AMDGPU_INFO_VBIOS_SIZE		0x1
 	/* Subquery id: Query vbios image */
 	#define AMDGPU_INFO_VBIOS_IMAGE		0x2
+	/* Subquery id: Query vbios info */
+	#define AMDGPU_INFO_VBIOS_INFO		0x3
 /* Query UVD handles */
 #define AMDGPU_INFO_NUM_HANDLES			0x1C
 /* Query sensor related information */
@@ -948,6 +952,15 @@ struct drm_amdgpu_info_firmware {
 	__u32 feature;
 };
 
+struct drm_amdgpu_info_vbios {
+	__u8 name[64];
+	__u8 vbios_pn[64];
+	__u32 version;
+	__u32 pad;
+	__u8 vbios_ver_str[32];
+	__u8 date[32];
+};
+
 #define AMDGPU_VRAM_TYPE_UNKNOWN 0
 #define AMDGPU_VRAM_TYPE_GDDR1 1
 #define AMDGPU_VRAM_TYPE_DDR2  2
@@ -1121,6 +1134,7 @@ struct drm_amdgpu_info_video_caps {
 #define AMDGPU_FAMILY_RV			142 /* Raven */
 #define AMDGPU_FAMILY_NV			143 /* Navi10 */
 #define AMDGPU_FAMILY_VGH			144 /* Van Gogh */
+#define AMDGPU_FAMILY_YC			146 /* Yellow Carp */
 
 #if defined(__cplusplus)
 }
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
 
diff --git a/include/drm/i915_drm.h b/include/drm/i915_drm.h
index 72afd94e..a1c0030c 100644
--- a/include/drm/i915_drm.h
+++ b/include/drm/i915_drm.h
@@ -55,15 +55,15 @@ extern "C" {
  *	cause the related events to not be seen.
  *
  * I915_RESET_UEVENT - Event is generated just before an attempt to reset the
- *	the GPU. The value supplied with the event is always 1. NOTE: Disable
+ *	GPU. The value supplied with the event is always 1. NOTE: Disable
  *	reset via module parameter will cause this event to not be seen.
  */
 #define I915_L3_PARITY_UEVENT		"L3_PARITY_ERROR"
 #define I915_ERROR_UEVENT		"ERROR"
 #define I915_RESET_UEVENT		"RESET"
 
-/*
- * i915_user_extension: Base class for defining a chain of extensions
+/**
+ * struct i915_user_extension - Base class for defining a chain of extensions
  *
  * Many interfaces need to grow over time. In most cases we can simply
  * extend the struct and have userspace pass in more data. Another option,
@@ -76,12 +76,58 @@ extern "C" {
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
  * the boundary with pointers encapsulated inside u64.
+ *
+ * Example chaining:
+ *
+ * .. code-block:: C
+ *
+ *	struct i915_user_extension ext3 {
+ *		.next_extension = 0, // end
+ *		.name = ...,
+ *	};
+ *	struct i915_user_extension ext2 {
+ *		.next_extension = (uintptr_t)&ext3,
+ *		.name = ...,
+ *	};
+ *	struct i915_user_extension ext1 {
+ *		.next_extension = (uintptr_t)&ext2,
+ *		.name = ...,
+ *	};
+ *
+ * Typically the struct i915_user_extension would be embedded in some uAPI
+ * struct, and in this case we would feed it the head of the chain(i.e ext1),
+ * which would then apply all of the above extensions.
+ *
  */
 struct i915_user_extension {
+	/**
+	 * @next_extension:
+	 *
+	 * Pointer to the next struct i915_user_extension, or zero if the end.
+	 */
 	__u64 next_extension;
+	/**
+	 * @name: Name of the extension.
+	 *
+	 * Note that the name here is just some integer.
+	 *
+	 * Also note that the name space for this is not global for the whole
+	 * driver, but rather its scope/meaning is limited to the specific piece
+	 * of uAPI which has embedded the struct i915_user_extension.
+	 */
 	__u32 name;
-	__u32 flags; /* All undefined bits must be zero. */
-	__u32 rsvd[4]; /* Reserved for future use; must be zero. */
+	/**
+	 * @flags: MBZ
+	 *
+	 * All undefined bits must be zero.
+	 */
+	__u32 flags;
+	/**
+	 * @rsvd: MBZ
+	 *
+	 * Reserved for future use; must be zero.
+	 */
+	__u32 rsvd[4];
 };
 
 /*
@@ -126,6 +172,20 @@ enum drm_i915_gem_engine_class {
 	I915_ENGINE_CLASS_INVALID	= -1
 };
 
+/*
+ * There may be more than one engine fulfilling any role within the system.
+ * Each engine of a class is given a unique instance number and therefore
+ * any engine can be specified by its class:instance tuplet. APIs that allow
+ * access to any engine in the system will use struct i915_engine_class_instance
+ * for this identification.
+ */
+struct i915_engine_class_instance {
+	__u16 engine_class; /* see enum drm_i915_gem_engine_class */
+	__u16 engine_instance;
+#define I915_ENGINE_CLASS_INVALID_NONE -1
+#define I915_ENGINE_CLASS_INVALID_VIRTUAL -2
+};
+
 /**
  * DOC: perf_events exposed by i915 through /sys/bus/event_sources/drivers/i915
  *
@@ -163,8 +223,9 @@ enum drm_i915_pmu_engine_sample {
 #define I915_PMU_REQUESTED_FREQUENCY	__I915_PMU_OTHER(1)
 #define I915_PMU_INTERRUPTS		__I915_PMU_OTHER(2)
 #define I915_PMU_RC6_RESIDENCY		__I915_PMU_OTHER(3)
+#define I915_PMU_SOFTWARE_GT_AWAKE_TIME	__I915_PMU_OTHER(4)
 
-#define I915_PMU_LAST I915_PMU_RC6_RESIDENCY
+#define I915_PMU_LAST /* Deprecated - do not use */ I915_PMU_RC6_RESIDENCY
 
 /* Each region is a minimum of 16k, and there are at most 255 of them.
  */
@@ -343,6 +404,9 @@ typedef struct _drm_i915_sarea {
 #define DRM_I915_PERF_ADD_CONFIG	0x37
 #define DRM_I915_PERF_REMOVE_CONFIG	0x38
 #define DRM_I915_QUERY			0x39
+#define DRM_I915_GEM_VM_CREATE		0x3a
+#define DRM_I915_GEM_VM_DESTROY		0x3b
+#define DRM_I915_GEM_CREATE_EXT		0x3c
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_I915_INIT		DRM_IOW( DRM_COMMAND_BASE + DRM_I915_INIT, drm_i915_init_t)
@@ -375,10 +439,12 @@ typedef struct _drm_i915_sarea {
 #define DRM_IOCTL_I915_GEM_ENTERVT	DRM_IO(DRM_COMMAND_BASE + DRM_I915_GEM_ENTERVT)
 #define DRM_IOCTL_I915_GEM_LEAVEVT	DRM_IO(DRM_COMMAND_BASE + DRM_I915_GEM_LEAVEVT)
 #define DRM_IOCTL_I915_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_CREATE, struct drm_i915_gem_create)
+#define DRM_IOCTL_I915_GEM_CREATE_EXT	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_CREATE_EXT, struct drm_i915_gem_create_ext)
 #define DRM_IOCTL_I915_GEM_PREAD	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_PREAD, struct drm_i915_gem_pread)
 #define DRM_IOCTL_I915_GEM_PWRITE	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_PWRITE, struct drm_i915_gem_pwrite)
 #define DRM_IOCTL_I915_GEM_MMAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_MMAP, struct drm_i915_gem_mmap)
 #define DRM_IOCTL_I915_GEM_MMAP_GTT	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_MMAP_GTT, struct drm_i915_gem_mmap_gtt)
+#define DRM_IOCTL_I915_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_MMAP_GTT, struct drm_i915_gem_mmap_offset)
 #define DRM_IOCTL_I915_GEM_SET_DOMAIN	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_SET_DOMAIN, struct drm_i915_gem_set_domain)
 #define DRM_IOCTL_I915_GEM_SW_FINISH	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_SW_FINISH, struct drm_i915_gem_sw_finish)
 #define DRM_IOCTL_I915_GEM_SET_TILING	DRM_IOWR (DRM_COMMAND_BASE + DRM_I915_GEM_SET_TILING, struct drm_i915_gem_set_tiling)
@@ -403,6 +469,8 @@ typedef struct _drm_i915_sarea {
 #define DRM_IOCTL_I915_PERF_ADD_CONFIG	DRM_IOW(DRM_COMMAND_BASE + DRM_I915_PERF_ADD_CONFIG, struct drm_i915_perf_oa_config)
 #define DRM_IOCTL_I915_PERF_REMOVE_CONFIG	DRM_IOW(DRM_COMMAND_BASE + DRM_I915_PERF_REMOVE_CONFIG, __u64)
 #define DRM_IOCTL_I915_QUERY			DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_QUERY, struct drm_i915_query)
+#define DRM_IOCTL_I915_GEM_VM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_CREATE, struct drm_i915_gem_vm_control)
+#define DRM_IOCTL_I915_GEM_VM_DESTROY	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_VM_DESTROY, struct drm_i915_gem_vm_control)
 
 /* Allow drivers to submit batchbuffers directly to hardware, relying
  * on the security mechanisms provided by hardware.
@@ -503,6 +571,7 @@ typedef struct drm_i915_irq_wait {
 #define   I915_SCHEDULER_CAP_PRIORITY	(1ul << 1)
 #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
 #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
+#define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
 
 #define I915_PARAM_HUC_STATUS		 42
 
@@ -520,7 +589,7 @@ typedef struct drm_i915_irq_wait {
 #define I915_PARAM_HAS_EXEC_FENCE	 44
 
 /* Query whether DRM_I915_GEM_EXECBUFFER2 supports the ability to capture
- * user specified buffers for post-mortem debugging of GPU hangs. See
+ * user specified bufffers for post-mortem debugging of GPU hangs. See
  * EXEC_OBJECT_CAPTURE.
  */
 #define I915_PARAM_HAS_EXEC_CAPTURE	 45
@@ -586,6 +655,25 @@ typedef struct drm_i915_irq_wait {
  */
 #define I915_PARAM_MMAP_GTT_COHERENT	52
 
+/*
+ * Query whether DRM_I915_GEM_EXECBUFFER2 supports coordination of parallel
+ * execution through use of explicit fence support.
+ * See I915_EXEC_FENCE_OUT and I915_EXEC_FENCE_SUBMIT.
+ */
+#define I915_PARAM_HAS_EXEC_SUBMIT_FENCE 53
+
+/*
+ * Revision of the i915-perf uAPI. The value returned helps determine what
+ * i915-perf features are available. See drm_i915_perf_property_id.
+ */
+#define I915_PARAM_PERF_REVISION	54
+
+/* Query whether DRM_I915_GEM_EXECBUFFER2 supports supplying an array of
+ * timeline syncobj through drm_i915_gem_execbuffer_ext_timeline_fences. See
+ * I915_EXEC_USE_EXTENSIONS.
+ */
+#define I915_PARAM_HAS_EXEC_TIMELINE_FENCES 55
+
 /* Must be kept compact -- no holes and well documented */
 
 typedef struct drm_i915_getparam {
@@ -761,6 +849,37 @@ struct drm_i915_gem_mmap_gtt {
 	__u64 offset;
 };
 
+struct drm_i915_gem_mmap_offset {
+	/** Handle for the object being mapped. */
+	__u32 handle;
+	__u32 pad;
+	/**
+	 * Fake offset to use for subsequent mmap call
+	 *
+	 * This is a fixed-size type for 32/64 compatibility.
+	 */
+	__u64 offset;
+
+	/**
+	 * Flags for extended behaviour.
+	 *
+	 * It is mandatory that one of the MMAP_OFFSET types
+	 * (GTT, WC, WB, UC, etc) should be included.
+	 */
+	__u64 flags;
+#define I915_MMAP_OFFSET_GTT 0
+#define I915_MMAP_OFFSET_WC  1
+#define I915_MMAP_OFFSET_WB  2
+#define I915_MMAP_OFFSET_UC  3
+
+	/*
+	 * Zero-terminated chain of extensions.
+	 *
+	 * No current extensions defined; mbz.
+	 */
+	__u64 extensions;
+};
+
 struct drm_i915_gem_set_domain {
 	/** Handle for the object */
 	__u32 handle;
@@ -872,6 +991,7 @@ struct drm_i915_gem_exec_object {
 	__u64 offset;
 };
 
+/* DRM_IOCTL_I915_GEM_EXECBUFFER was removed in Linux 5.13 */
 struct drm_i915_gem_execbuffer {
 	/**
 	 * List of buffers to be validated with their relocations to be
@@ -982,6 +1102,38 @@ struct drm_i915_gem_exec_fence {
 	__u32 flags;
 };
 
+/*
+ * See drm_i915_gem_execbuffer_ext_timeline_fences.
+ */
+#define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
+
+/*
+ * This structure describes an array of drm_syncobj and associated points for
+ * timeline variants of drm_syncobj. It is invalid to append this structure to
+ * the execbuf if I915_EXEC_FENCE_ARRAY is set.
+ */
+struct drm_i915_gem_execbuffer_ext_timeline_fences {
+	struct i915_user_extension base;
+
+	/**
+	 * Number of element in the handles_ptr & value_ptr arrays.
+	 */
+	__u64 fence_count;
+
+	/**
+	 * Pointer to an array of struct drm_i915_gem_exec_fence of length
+	 * fence_count.
+	 */
+	__u64 handles_ptr;
+
+	/**
+	 * Pointer to an array of u64 values of length fence_count. Values
+	 * must be 0 for a binary drm_syncobj. A Value of 0 for a timeline
+	 * drm_syncobj is invalid as it turns a drm_syncobj into a binary one.
+	 */
+	__u64 values_ptr;
+};
+
 struct drm_i915_gem_execbuffer2 {
 	/**
 	 * List of gem_exec_object2 structs
@@ -998,8 +1150,14 @@ struct drm_i915_gem_execbuffer2 {
 	__u32 num_cliprects;
 	/**
 	 * This is a struct drm_clip_rect *cliprects if I915_EXEC_FENCE_ARRAY
-	 * is not set.  If I915_EXEC_FENCE_ARRAY is set, then this is a
-	 * struct drm_i915_gem_exec_fence *fences.
+	 * & I915_EXEC_USE_EXTENSIONS are not set.
+	 *
+	 * If I915_EXEC_FENCE_ARRAY is set, then this is a pointer to an array
+	 * of struct drm_i915_gem_exec_fence and num_cliprects is the length
+	 * of the array.
+	 *
+	 * If I915_EXEC_USE_EXTENSIONS is set, then this is a pointer to a
+	 * single struct i915_user_extension and num_cliprects is 0.
 	 */
 	__u64 cliprects_ptr;
 #define I915_EXEC_RING_MASK              (0x3f)
@@ -1108,7 +1266,25 @@ struct drm_i915_gem_execbuffer2 {
  */
 #define I915_EXEC_FENCE_ARRAY   (1<<19)
 
-#define __I915_EXEC_UNKNOWN_FLAGS (-(I915_EXEC_FENCE_ARRAY<<1))
+/*
+ * Setting I915_EXEC_FENCE_SUBMIT implies that lower_32_bits(rsvd2) represent
+ * a sync_file fd to wait upon (in a nonblocking manner) prior to executing
+ * the batch.
+ *
+ * Returns -EINVAL if the sync_file fd cannot be found.
+ */
+#define I915_EXEC_FENCE_SUBMIT		(1 << 20)
+
+/*
+ * Setting I915_EXEC_USE_EXTENSIONS implies that
+ * drm_i915_gem_execbuffer2.cliprects_ptr is treated as a pointer to an linked
+ * list of i915_user_extension. Each i915_user_extension node is the base of a
+ * larger structure. The list of supported structures are listed in the
+ * drm_i915_gem_execbuffer_ext enum.
+ */
+#define I915_EXEC_USE_EXTENSIONS	(1 << 21)
+
+#define __I915_EXEC_UNKNOWN_FLAGS (-(I915_EXEC_USE_EXTENSIONS << 1))
 
 #define I915_EXEC_CONTEXT_ID_MASK	(0xffffffff)
 #define i915_execbuffer2_set_context_id(eb2, context) \
@@ -1220,7 +1396,7 @@ struct drm_i915_gem_caching {
 	__u32 handle;
 
 	/**
-	 * Caching level to apply or return value
+	 * Cacheing level to apply or return value
 	 *
 	 * bits0-15 are for generic caching control (i.e. the above defined
 	 * values). bits16-31 are reserved for platform-specific variations
@@ -1452,8 +1628,9 @@ struct drm_i915_gem_context_create_ext {
 	__u32 ctx_id; /* output: id of new context*/
 	__u32 flags;
 #define I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS	(1u << 0)
+#define I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE	(1u << 1)
 #define I915_CONTEXT_CREATE_FLAGS_UNKNOWN \
-	(-(I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS << 1))
+	(-(I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE << 1))
 	__u64 extensions;
 };
 
@@ -1495,12 +1672,83 @@ struct drm_i915_gem_context_param {
  * On creation, all new contexts are marked as recoverable.
  */
 #define I915_CONTEXT_PARAM_RECOVERABLE	0x8
+
+	/*
+	 * The id of the associated virtual memory address space (ppGTT) of
+	 * this context. Can be retrieved and passed to another context
+	 * (on the same fd) for both to use the same ppGTT and so share
+	 * address layouts, and avoid reloading the page tables on context
+	 * switches between themselves.
+	 *
+	 * See DRM_I915_GEM_VM_CREATE and DRM_I915_GEM_VM_DESTROY.
+	 */
+#define I915_CONTEXT_PARAM_VM		0x9
+
+/*
+ * I915_CONTEXT_PARAM_ENGINES:
+ *
+ * Bind this context to operate on this subset of available engines. Henceforth,
+ * the I915_EXEC_RING selector for DRM_IOCTL_I915_GEM_EXECBUFFER2 operates as
+ * an index into this array of engines; I915_EXEC_DEFAULT selecting engine[0]
+ * and upwards. Slots 0...N are filled in using the specified (class, instance).
+ * Use
+ *	engine_class: I915_ENGINE_CLASS_INVALID,
+ *	engine_instance: I915_ENGINE_CLASS_INVALID_NONE
+ * to specify a gap in the array that can be filled in later, e.g. by a
+ * virtual engine used for load balancing.
+ *
+ * Setting the number of engines bound to the context to 0, by passing a zero
+ * sized argument, will revert back to default settings.
+ *
+ * See struct i915_context_param_engines.
+ *
+ * Extensions:
+ *   i915_context_engines_load_balance (I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE)
+ *   i915_context_engines_bond (I915_CONTEXT_ENGINES_EXT_BOND)
+ */
+#define I915_CONTEXT_PARAM_ENGINES	0xa
+
+/*
+ * I915_CONTEXT_PARAM_PERSISTENCE:
+ *
+ * Allow the context and active rendering to survive the process until
+ * completion. Persistence allows fire-and-forget clients to queue up a
+ * bunch of work, hand the output over to a display server and then quit.
+ * If the context is marked as not persistent, upon closing (either via
+ * an explicit DRM_I915_GEM_CONTEXT_DESTROY or implicitly from file closure
+ * or process termination), the context and any outstanding requests will be
+ * cancelled (and exported fences for cancelled requests marked as -EIO).
+ *
+ * By default, new contexts allow persistence.
+ */
+#define I915_CONTEXT_PARAM_PERSISTENCE	0xb
+
+/*
+ * I915_CONTEXT_PARAM_RINGSIZE:
+ *
+ * Sets the size of the CS ringbuffer to use for logical ring contexts. This
+ * applies a limit of how many batches can be queued to HW before the caller
+ * is blocked due to lack of space for more commands.
+ *
+ * Only reliably possible to be set prior to first use, i.e. during
+ * construction. At any later point, the current execution must be flushed as
+ * the ring can only be changed while the context is idle. Note, the ringsize
+ * can be specified as a constructor property, see
+ * I915_CONTEXT_CREATE_EXT_SETPARAM, but can also be set later if required.
+ *
+ * Only applies to the current set of engine and lost when those engines
+ * are replaced by a new mapping (see I915_CONTEXT_PARAM_ENGINES).
+ *
+ * Must be between 4 - 512 KiB, in intervals of page size [4 KiB].
+ * Default is 16 KiB.
+ */
+#define I915_CONTEXT_PARAM_RINGSIZE	0xc
 /* Must be kept compact -- no holes and well documented */
 
 	__u64 value;
 };
 
-/**
+/*
  * Context SSEU programming
  *
  * It may be necessary for either functional or performance reason to configure
@@ -1525,13 +1773,13 @@ struct drm_i915_gem_context_param_sseu {
 	/*
 	 * Engine class & instance to be configured or queried.
 	 */
-	__u16 engine_class;
-	__u16 engine_instance;
+	struct i915_engine_class_instance engine;
 
 	/*
-	 * Unused for now. Must be cleared to zero.
+	 * Unknown flags must be cleared to zero.
 	 */
 	__u32 flags;
+#define I915_CONTEXT_SSEU_FLAG_ENGINE_INDEX (1u << 0)
 
 	/*
 	 * Mask of slices to enable for the context. Valid values are a subset
@@ -1559,12 +1807,115 @@ struct drm_i915_gem_context_param_sseu {
 	__u32 rsvd;
 };
 
+/*
+ * i915_context_engines_load_balance:
+ *
+ * Enable load balancing across this set of engines.
+ *
+ * Into the I915_EXEC_DEFAULT slot [0], a virtual engine is created that when
+ * used will proxy the execbuffer request onto one of the set of engines
+ * in such a way as to distribute the load evenly across the set.
+ *
+ * The set of engines must be compatible (e.g. the same HW class) as they
+ * will share the same logical GPU context and ring.
+ *
+ * To intermix rendering with the virtual engine and direct rendering onto
+ * the backing engines (bypassing the load balancing proxy), the context must
+ * be defined to use a single timeline for all engines.
+ */
+struct i915_context_engines_load_balance {
+	struct i915_user_extension base;
+
+	__u16 engine_index;
+	__u16 num_siblings;
+	__u32 flags; /* all undefined flags must be zero */
+
+	__u64 mbz64; /* reserved for future use; must be zero */
+
+	struct i915_engine_class_instance engines[0];
+} __attribute__((packed));
+
+#define I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(name__, N__) struct { \
+	struct i915_user_extension base; \
+	__u16 engine_index; \
+	__u16 num_siblings; \
+	__u32 flags; \
+	__u64 mbz64; \
+	struct i915_engine_class_instance engines[N__]; \
+} __attribute__((packed)) name__
+
+/*
+ * i915_context_engines_bond:
+ *
+ * Constructed bonded pairs for execution within a virtual engine.
+ *
+ * All engines are equal, but some are more equal than others. Given
+ * the distribution of resources in the HW, it may be preferable to run
+ * a request on a given subset of engines in parallel to a request on a
+ * specific engine. We enable this selection of engines within a virtual
+ * engine by specifying bonding pairs, for any given master engine we will
+ * only execute on one of the corresponding siblings within the virtual engine.
+ *
+ * To execute a request in parallel on the master engine and a sibling requires
+ * coordination with a I915_EXEC_FENCE_SUBMIT.
+ */
+struct i915_context_engines_bond {
+	struct i915_user_extension base;
+
+	struct i915_engine_class_instance master;
+
+	__u16 virtual_index; /* index of virtual engine in ctx->engines[] */
+	__u16 num_bonds;
+
+	__u64 flags; /* all undefined flags must be zero */
+	__u64 mbz64[4]; /* reserved for future use; must be zero */
+
+	struct i915_engine_class_instance engines[0];
+} __attribute__((packed));
+
+#define I915_DEFINE_CONTEXT_ENGINES_BOND(name__, N__) struct { \
+	struct i915_user_extension base; \
+	struct i915_engine_class_instance master; \
+	__u16 virtual_index; \
+	__u16 num_bonds; \
+	__u64 flags; \
+	__u64 mbz64[4]; \
+	struct i915_engine_class_instance engines[N__]; \
+} __attribute__((packed)) name__
+
+struct i915_context_param_engines {
+	__u64 extensions; /* linked chain of extension blocks, 0 terminates */
+#define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engines_load_balance */
+#define I915_CONTEXT_ENGINES_EXT_BOND 1 /* see i915_context_engines_bond */
+	struct i915_engine_class_instance engines[0];
+} __attribute__((packed));
+
+#define I915_DEFINE_CONTEXT_PARAM_ENGINES(name__, N__) struct { \
+	__u64 extensions; \
+	struct i915_engine_class_instance engines[N__]; \
+} __attribute__((packed)) name__
+
 struct drm_i915_gem_context_create_ext_setparam {
 #define I915_CONTEXT_CREATE_EXT_SETPARAM 0
 	struct i915_user_extension base;
 	struct drm_i915_gem_context_param param;
 };
 
+struct drm_i915_gem_context_create_ext_clone {
+#define I915_CONTEXT_CREATE_EXT_CLONE 1
+	struct i915_user_extension base;
+	__u32 clone_id;
+	__u32 flags;
+#define I915_CONTEXT_CLONE_ENGINES	(1u << 0)
+#define I915_CONTEXT_CLONE_FLAGS	(1u << 1)
+#define I915_CONTEXT_CLONE_SCHEDATTR	(1u << 2)
+#define I915_CONTEXT_CLONE_SSEU		(1u << 3)
+#define I915_CONTEXT_CLONE_TIMELINE	(1u << 4)
+#define I915_CONTEXT_CLONE_VM		(1u << 5)
+#define I915_CONTEXT_CLONE_UNKNOWN -(I915_CONTEXT_CLONE_VM << 1)
+	__u64 rsvd;
+};
+
 struct drm_i915_gem_context_destroy {
 	__u32 ctx_id;
 	__u32 pad;
@@ -1671,23 +2022,31 @@ enum drm_i915_perf_property_id {
 	 * Open the stream for a specific context handle (as used with
 	 * execbuffer2). A stream opened for a specific context this way
 	 * won't typically require root privileges.
+	 *
+	 * This property is available in perf revision 1.
 	 */
 	DRM_I915_PERF_PROP_CTX_HANDLE = 1,
 
 	/**
 	 * A value of 1 requests the inclusion of raw OA unit reports as
 	 * part of stream samples.
+	 *
+	 * This property is available in perf revision 1.
 	 */
 	DRM_I915_PERF_PROP_SAMPLE_OA,
 
 	/**
 	 * The value specifies which set of OA unit metrics should be
-	 * be configured, defining the contents of any OA unit reports.
+	 * configured, defining the contents of any OA unit reports.
+	 *
+	 * This property is available in perf revision 1.
 	 */
 	DRM_I915_PERF_PROP_OA_METRICS_SET,
 
 	/**
 	 * The value specifies the size and layout of OA unit reports.
+	 *
+	 * This property is available in perf revision 1.
 	 */
 	DRM_I915_PERF_PROP_OA_FORMAT,
 
@@ -1697,9 +2056,46 @@ enum drm_i915_perf_property_id {
 	 * from this exponent as follows:
 	 *
 	 *   80ns * 2^(period_exponent + 1)
+	 *
+	 * This property is available in perf revision 1.
 	 */
 	DRM_I915_PERF_PROP_OA_EXPONENT,
 
+	/**
+	 * Specifying this property is only valid when specify a context to
+	 * filter with DRM_I915_PERF_PROP_CTX_HANDLE. Specifying this property
+	 * will hold preemption of the particular context we want to gather
+	 * performance data about. The execbuf2 submissions must include a
+	 * drm_i915_gem_execbuffer_ext_perf parameter for this to apply.
+	 *
+	 * This property is available in perf revision 3.
+	 */
+	DRM_I915_PERF_PROP_HOLD_PREEMPTION,
+
+	/**
+	 * Specifying this pins all contexts to the specified SSEU power
+	 * configuration for the duration of the recording.
+	 *
+	 * This parameter's value is a pointer to a struct
+	 * drm_i915_gem_context_param_sseu.
+	 *
+	 * This property is available in perf revision 4.
+	 */
+	DRM_I915_PERF_PROP_GLOBAL_SSEU,
+
+	/**
+	 * This optional parameter specifies the timer interval in nanoseconds
+	 * at which the i915 driver will check the OA buffer for available data.
+	 * Minimum allowed value is 100 microseconds. A default value is used by
+	 * the driver if this parameter is not specified. Note that larger timer
+	 * values will reduce cpu consumption during OA perf captures. However,
+	 * excessively large values would potentially result in OA buffer
+	 * overwrites as captures reach end of the OA buffer.
+	 *
+	 * This property is available in perf revision 5.
+	 */
+	DRM_I915_PERF_PROP_POLL_OA_PERIOD,
+
 	DRM_I915_PERF_PROP_MAX /* non-ABI */
 };
 
@@ -1719,7 +2115,7 @@ struct drm_i915_perf_open_param {
 	__u64 properties_ptr;
 };
 
-/**
+/*
  * Enable data capture for a stream that was either opened in a disabled state
  * via I915_PERF_FLAG_DISABLED or was later disabled via
  * I915_PERF_IOCTL_DISABLE.
@@ -1728,17 +2124,34 @@ struct drm_i915_perf_open_param {
  * to close and re-open a stream with the same configuration.
  *
  * It's undefined whether any pending data for the stream will be lost.
+ *
+ * This ioctl is available in perf revision 1.
  */
 #define I915_PERF_IOCTL_ENABLE	_IO('i', 0x0)
 
-/**
+/*
  * Disable data capture for a stream.
  *
  * It is an error to try and read a stream that is disabled.
+ *
+ * This ioctl is available in perf revision 1.
  */
 #define I915_PERF_IOCTL_DISABLE	_IO('i', 0x1)
 
-/**
+/*
+ * Change metrics_set captured by a stream.
+ *
+ * If the stream is bound to a specific context, the configuration change
+ * will performed __inline__ with that context such that it takes effect before
+ * the next execbuf submission.
+ *
+ * Returns the previously bound metrics set id, or a negative error code.
+ *
+ * This ioctl is available in perf revision 2.
+ */
+#define I915_PERF_IOCTL_CONFIG	_IO('i', 0x2)
+
+/*
  * Common to all i915 perf records
  */
 struct drm_i915_perf_record_header {
@@ -1786,7 +2199,7 @@ enum drm_i915_perf_record_type {
 	DRM_I915_PERF_RECORD_MAX /* non-ABI */
 };
 
-/**
+/*
  * Structure to upload perf dynamic configuration into the kernel.
  */
 struct drm_i915_perf_oa_config {
@@ -1807,42 +2220,95 @@ struct drm_i915_perf_oa_config {
 	__u64 flex_regs_ptr;
 };
 
+/**
+ * struct drm_i915_query_item - An individual query for the kernel to process.
+ *
+ * The behaviour is determined by the @query_id. Note that exactly what
+ * @data_ptr is also depends on the specific @query_id.
+ */
 struct drm_i915_query_item {
+	/** @query_id: The id for this query */
 	__u64 query_id;
 #define DRM_I915_QUERY_TOPOLOGY_INFO    1
+#define DRM_I915_QUERY_ENGINE_INFO	2
+#define DRM_I915_QUERY_PERF_CONFIG      3
+#define DRM_I915_QUERY_MEMORY_REGIONS   4
 /* Must be kept compact -- no holes and well documented */
 
-	/*
+	/**
+	 * @length:
+	 *
 	 * When set to zero by userspace, this is filled with the size of the
-	 * data to be written at the data_ptr pointer. The kernel sets this
+	 * data to be written at the @data_ptr pointer. The kernel sets this
 	 * value to a negative value to signal an error on a particular query
 	 * item.
 	 */
 	__s32 length;
 
-	/*
-	 * Unused for now. Must be cleared to zero.
+	/**
+	 * @flags:
+	 *
+	 * When query_id == DRM_I915_QUERY_TOPOLOGY_INFO, must be 0.
+	 *
+	 * When query_id == DRM_I915_QUERY_PERF_CONFIG, must be one of the
+	 * following:
+	 *
+	 *	- DRM_I915_QUERY_PERF_CONFIG_LIST
+	 *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
+	 *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
 	 */
 	__u32 flags;
+#define DRM_I915_QUERY_PERF_CONFIG_LIST          1
+#define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID 2
+#define DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID   3
 
-	/*
-	 * Data will be written at the location pointed by data_ptr when the
-	 * value of length matches the length of the data to be written by the
+	/**
+	 * @data_ptr:
+	 *
+	 * Data will be written at the location pointed by @data_ptr when the
+	 * value of @length matches the length of the data to be written by the
 	 * kernel.
 	 */
 	__u64 data_ptr;
 };
 
+/**
+ * struct drm_i915_query - Supply an array of struct drm_i915_query_item for the
+ * kernel to fill out.
+ *
+ * Note that this is generally a two step process for each struct
+ * drm_i915_query_item in the array:
+ *
+ * 1. Call the DRM_IOCTL_I915_QUERY, giving it our array of struct
+ *    drm_i915_query_item, with &drm_i915_query_item.length set to zero. The
+ *    kernel will then fill in the size, in bytes, which tells userspace how
+ *    memory it needs to allocate for the blob(say for an array of properties).
+ *
+ * 2. Next we call DRM_IOCTL_I915_QUERY again, this time with the
+ *    &drm_i915_query_item.data_ptr equal to our newly allocated blob. Note that
+ *    the &drm_i915_query_item.length should still be the same as what the
+ *    kernel previously set. At this point the kernel can fill in the blob.
+ *
+ * Note that for some query items it can make sense for userspace to just pass
+ * in a buffer/blob equal to or larger than the required size. In this case only
+ * a single ioctl call is needed. For some smaller query items this can work
+ * quite well.
+ *
+ */
 struct drm_i915_query {
+	/** @num_items: The number of elements in the @items_ptr array */
 	__u32 num_items;
 
-	/*
-	 * Unused for now. Must be cleared to zero.
+	/**
+	 * @flags: Unused for now. Must be cleared to zero.
 	 */
 	__u32 flags;
 
-	/*
-	 * This points to an array of num_items drm_i915_query_item structures.
+	/**
+	 * @items_ptr:
+	 *
+	 * Pointer to an array of struct drm_i915_query_item. The number of
+	 * array elements is @num_items.
 	 */
 	__u64 items_ptr;
 };
@@ -1859,8 +2325,10 @@ struct drm_i915_query {
  *           (data[X / 8] >> (X % 8)) & 1
  *
  * - the subslice mask for each slice with one bit per subslice telling
- *   whether a subslice is available. The availability of subslice Y in slice
- *   X can be queried with the following formula :
+ *   whether a subslice is available. Gen12 has dual-subslices, which are
+ *   similar to two gen11 subslices. For gen12, this array represents dual-
+ *   subslices. The availability of subslice Y in slice X can be queried
+ *   with the following formula :
  *
  *           (data[subslice_offset +
  *                 X * subslice_stride +
@@ -1908,6 +2376,332 @@ struct drm_i915_query_topology_info {
 	__u8 data[];
 };
 
+/**
+ * struct drm_i915_engine_info
+ *
+ * Describes one engine and it's capabilities as known to the driver.
+ */
+struct drm_i915_engine_info {
+	/** @engine: Engine class and instance. */
+	struct i915_engine_class_instance engine;
+
+	/** @rsvd0: Reserved field. */
+	__u32 rsvd0;
+
+	/** @flags: Engine flags. */
+	__u64 flags;
+
+	/** @capabilities: Capabilities of this engine. */
+	__u64 capabilities;
+#define I915_VIDEO_CLASS_CAPABILITY_HEVC		(1 << 0)
+#define I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC	(1 << 1)
+
+	/** @rsvd1: Reserved fields. */
+	__u64 rsvd1[4];
+};
+
+/**
+ * struct drm_i915_query_engine_info
+ *
+ * Engine info query enumerates all engines known to the driver by filling in
+ * an array of struct drm_i915_engine_info structures.
+ */
+struct drm_i915_query_engine_info {
+	/** @num_engines: Number of struct drm_i915_engine_info structs following. */
+	__u32 num_engines;
+
+	/** @rsvd: MBZ */
+	__u32 rsvd[3];
+
+	/** @engines: Marker for drm_i915_engine_info structures. */
+	struct drm_i915_engine_info engines[];
+};
+
+/*
+ * Data written by the kernel with query DRM_I915_QUERY_PERF_CONFIG.
+ */
+struct drm_i915_query_perf_config {
+	union {
+		/*
+		 * When query_item.flags == DRM_I915_QUERY_PERF_CONFIG_LIST, i915 sets
+		 * this fields to the number of configurations available.
+		 */
+		__u64 n_configs;
+
+		/*
+		 * When query_id == DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_ID,
+		 * i915 will use the value in this field as configuration
+		 * identifier to decide what data to write into config_ptr.
+		 */
+		__u64 config;
+
+		/*
+		 * When query_id == DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID,
+		 * i915 will use the value in this field as configuration
+		 * identifier to decide what data to write into config_ptr.
+		 *
+		 * String formatted like "%08x-%04x-%04x-%04x-%012x"
+		 */
+		char uuid[36];
+	};
+
+	/*
+	 * Unused for now. Must be cleared to zero.
+	 */
+	__u32 flags;
+
+	/*
+	 * When query_item.flags == DRM_I915_QUERY_PERF_CONFIG_LIST, i915 will
+	 * write an array of __u64 of configuration identifiers.
+	 *
+	 * When query_item.flags == DRM_I915_QUERY_PERF_CONFIG_DATA, i915 will
+	 * write a struct drm_i915_perf_oa_config. If the following fields of
+	 * drm_i915_perf_oa_config are set not set to 0, i915 will write into
+	 * the associated pointers the values of submitted when the
+	 * configuration was created :
+	 *
+	 *         - n_mux_regs
+	 *         - n_boolean_regs
+	 *         - n_flex_regs
+	 */
+	__u8 data[];
+};
+
+/**
+ * enum drm_i915_gem_memory_class - Supported memory classes
+ */
+enum drm_i915_gem_memory_class {
+	/** @I915_MEMORY_CLASS_SYSTEM: System memory */
+	I915_MEMORY_CLASS_SYSTEM = 0,
+	/** @I915_MEMORY_CLASS_DEVICE: Device local-memory */
+	I915_MEMORY_CLASS_DEVICE,
+};
+
+/**
+ * struct drm_i915_gem_memory_class_instance - Identify particular memory region
+ */
+struct drm_i915_gem_memory_class_instance {
+	/** @memory_class: See enum drm_i915_gem_memory_class */
+	__u16 memory_class;
+
+	/** @memory_instance: Which instance */
+	__u16 memory_instance;
+};
+
+/**
+ * struct drm_i915_memory_region_info - Describes one region as known to the
+ * driver.
+ *
+ * Note that we reserve some stuff here for potential future work. As an example
+ * we might want expose the capabilities for a given region, which could include
+ * things like if the region is CPU mappable/accessible, what are the supported
+ * mapping types etc.
+ *
+ * Note that to extend struct drm_i915_memory_region_info and struct
+ * drm_i915_query_memory_regions in the future the plan is to do the following:
+ *
+ * .. code-block:: C
+ *
+ *	struct drm_i915_memory_region_info {
+ *		struct drm_i915_gem_memory_class_instance region;
+ *		union {
+ *			__u32 rsvd0;
+ *			__u32 new_thing1;
+ *		};
+ *		...
+ *		union {
+ *			__u64 rsvd1[8];
+ *			struct {
+ *				__u64 new_thing2;
+ *				__u64 new_thing3;
+ *				...
+ *			};
+ *		};
+ *	};
+ *
+ * With this things should remain source compatible between versions for
+ * userspace, even as we add new fields.
+ *
+ * Note this is using both struct drm_i915_query_item and struct drm_i915_query.
+ * For this new query we are adding the new query id DRM_I915_QUERY_MEMORY_REGIONS
+ * at &drm_i915_query_item.query_id.
+ */
+struct drm_i915_memory_region_info {
+	/** @region: The class:instance pair encoding */
+	struct drm_i915_gem_memory_class_instance region;
+
+	/** @rsvd0: MBZ */
+	__u32 rsvd0;
+
+	/** @probed_size: Memory probed by the driver (-1 = unknown) */
+	__u64 probed_size;
+
+	/** @unallocated_size: Estimate of memory remaining (-1 = unknown) */
+	__u64 unallocated_size;
+
+	/** @rsvd1: MBZ */
+	__u64 rsvd1[8];
+};
+
+/**
+ * struct drm_i915_query_memory_regions
+ *
+ * The region info query enumerates all regions known to the driver by filling
+ * in an array of struct drm_i915_memory_region_info structures.
+ *
+ * Example for getting the list of supported regions:
+ *
+ * .. code-block:: C
+ *
+ *	struct drm_i915_query_memory_regions *info;
+ *	struct drm_i915_query_item item = {
+ *		.query_id = DRM_I915_QUERY_MEMORY_REGIONS;
+ *	};
+ *	struct drm_i915_query query = {
+ *		.num_items = 1,
+ *		.items_ptr = (uintptr_t)&item,
+ *	};
+ *	int err, i;
+ *
+ *	// First query the size of the blob we need, this needs to be large
+ *	// enough to hold our array of regions. The kernel will fill out the
+ *	// item.length for us, which is the number of bytes we need.
+ *	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
+ *	if (err) ...
+ *
+ *	info = calloc(1, item.length);
+ *	// Now that we allocated the required number of bytes, we call the ioctl
+ *	// again, this time with the data_ptr pointing to our newly allocated
+ *	// blob, which the kernel can then populate with the all the region info.
+ *	item.data_ptr = (uintptr_t)&info,
+ *
+ *	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
+ *	if (err) ...
+ *
+ *	// We can now access each region in the array
+ *	for (i = 0; i < info->num_regions; i++) {
+ *		struct drm_i915_memory_region_info mr = info->regions[i];
+ *		u16 class = mr.region.class;
+ *		u16 instance = mr.region.instance;
+ *
+ *		....
+ *	}
+ *
+ *	free(info);
+ */
+struct drm_i915_query_memory_regions {
+	/** @num_regions: Number of supported regions */
+	__u32 num_regions;
+
+	/** @rsvd: MBZ */
+	__u32 rsvd[3];
+
+	/** @regions: Info about each supported region */
+	struct drm_i915_memory_region_info regions[];
+};
+
+/**
+ * struct drm_i915_gem_create_ext - Existing gem_create behaviour, with added
+ * extension support using struct i915_user_extension.
+ *
+ * Note that in the future we want to have our buffer flags here, at least for
+ * the stuff that is immutable. Previously we would have two ioctls, one to
+ * create the object with gem_create, and another to apply various parameters,
+ * however this creates some ambiguity for the params which are considered
+ * immutable. Also in general we're phasing out the various SET/GET ioctls.
+ */
+struct drm_i915_gem_create_ext {
+	/**
+	 * @size: Requested size for the object.
+	 *
+	 * The (page-aligned) allocated size for the object will be returned.
+	 *
+	 * Note that for some devices we have might have further minimum
+	 * page-size restrictions(larger than 4K), like for device local-memory.
+	 * However in general the final size here should always reflect any
+	 * rounding up, if for example using the I915_GEM_CREATE_EXT_MEMORY_REGIONS
+	 * extension to place the object in device local-memory.
+	 */
+	__u64 size;
+	/**
+	 * @handle: Returned handle for the object.
+	 *
+	 * Object handles are nonzero.
+	 */
+	__u32 handle;
+	/** @flags: MBZ */
+	__u32 flags;
+	/**
+	 * @extensions: The chain of extensions to apply to this object.
+	 *
+	 * This will be useful in the future when we need to support several
+	 * different extensions, and we need to apply more than one when
+	 * creating the object. See struct i915_user_extension.
+	 *
+	 * If we don't supply any extensions then we get the same old gem_create
+	 * behaviour.
+	 *
+	 * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
+	 * struct drm_i915_gem_create_ext_memory_regions.
+	 */
+#define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
+	__u64 extensions;
+};
+
+/**
+ * struct drm_i915_gem_create_ext_memory_regions - The
+ * I915_GEM_CREATE_EXT_MEMORY_REGIONS extension.
+ *
+ * Set the object with the desired set of placements/regions in priority
+ * order. Each entry must be unique and supported by the device.
+ *
+ * This is provided as an array of struct drm_i915_gem_memory_class_instance, or
+ * an equivalent layout of class:instance pair encodings. See struct
+ * drm_i915_query_memory_regions and DRM_I915_QUERY_MEMORY_REGIONS for how to
+ * query the supported regions for a device.
+ *
+ * As an example, on discrete devices, if we wish to set the placement as
+ * device local-memory we can do something like:
+ *
+ * .. code-block:: C
+ *
+ *	struct drm_i915_gem_memory_class_instance region_lmem = {
+ *              .memory_class = I915_MEMORY_CLASS_DEVICE,
+ *              .memory_instance = 0,
+ *      };
+ *      struct drm_i915_gem_create_ext_memory_regions regions = {
+ *              .base = { .name = I915_GEM_CREATE_EXT_MEMORY_REGIONS },
+ *              .regions = (uintptr_t)&region_lmem,
+ *              .num_regions = 1,
+ *      };
+ *      struct drm_i915_gem_create_ext create_ext = {
+ *              .size = 16 * PAGE_SIZE,
+ *              .extensions = (uintptr_t)&regions,
+ *      };
+ *
+ *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
+ *      if (err) ...
+ *
+ * At which point we get the object handle in &drm_i915_gem_create_ext.handle,
+ * along with the final object size in &drm_i915_gem_create_ext.size, which
+ * should account for any rounding up, if required.
+ */
+struct drm_i915_gem_create_ext_memory_regions {
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+
+	/** @pad: MBZ */
+	__u32 pad;
+	/** @num_regions: Number of elements in the @regions array. */
+	__u32 num_regions;
+	/**
+	 * @regions: The regions/placements array.
+	 *
+	 * An array of struct drm_i915_gem_memory_class_instance.
+	 */
+	__u64 regions;
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/drm/msm_drm.h b/include/drm/msm_drm.h
index c06d0a5b..f0758510 100644
--- a/include/drm/msm_drm.h
+++ b/include/drm/msm_drm.h
@@ -74,6 +74,9 @@ struct drm_msm_timespec {
 #define MSM_PARAM_TIMESTAMP  0x05
 #define MSM_PARAM_GMEM_BASE  0x06
 #define MSM_PARAM_NR_RINGS   0x07
+#define MSM_PARAM_PP_PGTABLE 0x08  /* => 1 for per-process pagetables, else 0 */
+#define MSM_PARAM_FAULTS     0x09
+#define MSM_PARAM_SUSPENDS   0x0a
 
 struct drm_msm_param {
 	__u32 pipe;           /* in, MSM_PIPE_x */
@@ -91,13 +94,12 @@ struct drm_msm_param {
 /* cache modes */
 #define MSM_BO_CACHED        0x00010000
 #define MSM_BO_WC            0x00020000
-#define MSM_BO_UNCACHED      0x00040000
+#define MSM_BO_UNCACHED      0x00040000 /* deprecated, use MSM_BO_WC */
+#define MSM_BO_CACHED_COHERENT 0x080000
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
                               MSM_BO_GPU_READONLY | \
-                              MSM_BO_CACHED | \
-                              MSM_BO_WC | \
-                              MSM_BO_UNCACHED)
+                              MSM_BO_CACHE_MASK)
 
 struct drm_msm_gem_new {
 	__u64 size;           /* in */
@@ -105,14 +107,24 @@ struct drm_msm_gem_new {
 	__u32 handle;         /* out */
 };
 
-#define MSM_INFO_IOVA	0x01
-
-#define MSM_INFO_FLAGS (MSM_INFO_IOVA)
+/* Get or set GEM buffer info.  The requested value can be passed
+ * directly in 'value', or for data larger than 64b 'value' is a
+ * pointer to userspace buffer, with 'len' specifying the number of
+ * bytes copied into that buffer.  For info returned by pointer,
+ * calling the GEM_INFO ioctl with null 'value' will return the
+ * required buffer size in 'len'
+ */
+#define MSM_INFO_GET_OFFSET	0x00   /* get mmap() offset, returned by value */
+#define MSM_INFO_GET_IOVA	0x01   /* get iova, returned by value */
+#define MSM_INFO_SET_NAME	0x02   /* set the debug name (by pointer) */
+#define MSM_INFO_GET_NAME	0x03   /* get debug name, returned by pointer */
 
 struct drm_msm_gem_info {
 	__u32 handle;         /* in */
-	__u32 flags;	      /* in - combination of MSM_INFO_* flags */
-	__u64 offset;         /* out, mmap() offset or iova */
+	__u32 info;           /* in - one of MSM_INFO_* */
+	__u64 value;          /* in or out */
+	__u32 len;            /* in or out */
+	__u32 pad;
 };
 
 #define MSM_PREP_READ        0x01
@@ -188,8 +200,11 @@ struct drm_msm_gem_submit_cmd {
  */
 #define MSM_SUBMIT_BO_READ             0x0001
 #define MSM_SUBMIT_BO_WRITE            0x0002
+#define MSM_SUBMIT_BO_DUMP             0x0004
 
-#define MSM_SUBMIT_BO_FLAGS            (MSM_SUBMIT_BO_READ | MSM_SUBMIT_BO_WRITE)
+#define MSM_SUBMIT_BO_FLAGS            (MSM_SUBMIT_BO_READ | \
+					MSM_SUBMIT_BO_WRITE | \
+					MSM_SUBMIT_BO_DUMP)
 
 struct drm_msm_gem_submit_bo {
 	__u32 flags;          /* in, mask of MSM_SUBMIT_BO_x */
@@ -202,13 +217,28 @@ struct drm_msm_gem_submit_bo {
 #define MSM_SUBMIT_FENCE_FD_IN   0x40000000 /* enable input fence_fd */
 #define MSM_SUBMIT_FENCE_FD_OUT  0x20000000 /* enable output fence_fd */
 #define MSM_SUBMIT_SUDO          0x10000000 /* run submitted cmds from RB */
+#define MSM_SUBMIT_SYNCOBJ_IN    0x08000000 /* enable input syncobj */
+#define MSM_SUBMIT_SYNCOBJ_OUT   0x04000000 /* enable output syncobj */
 #define MSM_SUBMIT_FLAGS                ( \
 		MSM_SUBMIT_NO_IMPLICIT   | \
 		MSM_SUBMIT_FENCE_FD_IN   | \
 		MSM_SUBMIT_FENCE_FD_OUT  | \
 		MSM_SUBMIT_SUDO          | \
+		MSM_SUBMIT_SYNCOBJ_IN    | \
+		MSM_SUBMIT_SYNCOBJ_OUT   | \
 		0)
 
+#define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
+#define MSM_SUBMIT_SYNCOBJ_FLAGS        ( \
+		MSM_SUBMIT_SYNCOBJ_RESET | \
+		0)
+
+struct drm_msm_gem_submit_syncobj {
+	__u32 handle;     /* in, syncobj handle. */
+	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
+	__u64 point;      /* in, timepoint for timeline syncobjs. */
+};
+
 /* Each cmdstream submit consists of a table of buffers involved, and
  * one or more cmdstream buffers.  This allows for conditional execution
  * (context-restore), and IB buffers needed for per tile/bin draw cmds.
@@ -221,7 +251,14 @@ struct drm_msm_gem_submit {
 	__u64 bos;            /* in, ptr to array of submit_bo's */
 	__u64 cmds;           /* in, ptr to array of submit_cmd's */
 	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
-	__u32 queueid;         /* in, submitqueue id */
+	__u32 queueid;        /* in, submitqueue id */
+	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_gem_submit_syncobj */
+	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_gem_submit_syncobj */
+	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
+	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
+	__u32 syncobj_stride; /* in, stride of syncobj arrays. */
+	__u32 pad;            /*in, reserved for future use, always 0. */
+
 };
 
 /* The normal way to synchronize with the GPU is just to CPU_PREP on
@@ -273,6 +310,16 @@ struct drm_msm_submitqueue {
 	__u32 id;      /* out, identifier */
 };
 
+#define MSM_SUBMITQUEUE_PARAM_FAULTS   0
+
+struct drm_msm_submitqueue_query {
+	__u64 data;
+	__u32 id;
+	__u32 param;
+	__u32 len;
+	__u32 pad;
+};
+
 #define DRM_MSM_GET_PARAM              0x00
 /* placeholder:
 #define DRM_MSM_SET_PARAM              0x01
@@ -289,6 +336,7 @@ struct drm_msm_submitqueue {
  */
 #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
 #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
+#define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
 
 #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
 #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
@@ -300,6 +348,7 @@ struct drm_msm_submitqueue {
 #define DRM_IOCTL_MSM_GEM_MADVISE      DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_MADVISE, struct drm_msm_gem_madvise)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
+#define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
 
 #if defined(__cplusplus)
 }
-- 
2.25.1

