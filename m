Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181C16C3CC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 15:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FBA6EAED;
	Tue, 25 Feb 2020 14:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1465 seconds by postgrey-1.36 at gabe;
 Tue, 25 Feb 2020 14:25:37 UTC
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com
 [192.185.196.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498D66EAED
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 14:25:37 +0000 (UTC)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id 0FD775141
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 08:01:11 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 6alqjdFF0XVkQ6alqjyjX3; Tue, 25 Feb 2020 08:01:11 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RUoiJPKbXOORUMcByfg3y59aLbGOyCajhNRZHKwxYdM=; b=K2TmY80nKM6JNCRMaqOjv6Y2II
 XFqNYwg3sy7pV8Klv6Z2CYpDDYYf3KFpYCENAtHow/6zmfi1f5q6y9f2zAkS9jI/oYF4JoAq+wcST
 AJvHG3FrQ7FB4RDL0KCggXRvfAB9mLOHtLxM4N9XJxuGDQXCDr09AhZkPVaQ9WHITZXV0N+oC/5vX
 i4tsYSH5RXHtjYhQ+ymmn1vXlNxuQXTnaGZlVoSlMissVsAOwJ5GiFCvfz9gDgQb3M4rd1vkhzFdL
 wjuWLRYQKT5yXwh7t7fk5QpAOoAYW2enhrqXF1i/udxOwjZOK/vU2qCxp0TyiL/cLLfqcR1NIu8T8
 5HxBx97Q==;
Received: from [201.162.241.105] (port=19602 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j6alo-001QK9-7P; Tue, 25 Feb 2020 08:01:08 -0600
Date: Tue, 25 Feb 2020 08:03:47 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Eric Anholt <eric@anholt.net>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH][next] drm: Replace zero-length array with flexible-array
 member
Message-ID: <20200225140347.GA22864@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.162.241.105
X-Source-L: No
X-Exim-ID: 1j6alo-001QK9-7P
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.162.241.105]:19602
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 22
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, spice-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.h         | 2 +-
 drivers/gpu/drm/gma500/intel_bios.h           | 2 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h | 4 ++--
 drivers/gpu/drm/i915/gt/intel_lrc.c           | 2 +-
 drivers/gpu/drm/i915/i915_gpu_error.h         | 2 +-
 drivers/gpu/drm/msm/msm_gem.h                 | 2 +-
 drivers/gpu/drm/qxl/qxl_cmd.c                 | 2 +-
 drivers/gpu/drm/vboxvideo/vboxvideo.h         | 2 +-
 drivers/gpu/drm/vc4/vc4_drv.h                 | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c    | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       | 2 +-
 include/drm/bridge/mhl.h                      | 4 ++--
 include/drm/drm_displayid.h                   | 2 +-
 include/uapi/drm/i915_drm.h                   | 4 ++--
 14 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index 6b68fe16041b..98e60df882b6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -105,7 +105,7 @@ struct etnaviv_gem_submit {
 	unsigned int nr_pmrs;
 	struct etnaviv_perfmon_request *pmrs;
 	unsigned int nr_bos;
-	struct etnaviv_gem_submit_bo bos[0];
+	struct etnaviv_gem_submit_bo bos[];
 	/* No new members here, the previous one is variable-length! */
 };
 
diff --git a/drivers/gpu/drm/gma500/intel_bios.h b/drivers/gpu/drm/gma500/intel_bios.h
index a1f9ce9465a5..0e6facf21e33 100644
--- a/drivers/gpu/drm/gma500/intel_bios.h
+++ b/drivers/gpu/drm/gma500/intel_bios.h
@@ -227,7 +227,7 @@ struct bdb_general_definitions {
 	 * number = (block_size - sizeof(bdb_general_definitions))/
 	 *	     sizeof(child_device_config);
 	 */
-	struct child_device_config devices[0];
+	struct child_device_config devices[];
 };
 
 struct bdb_lvds_options {
diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
index 05c7cbe32eb4..aef7fe932d1a 100644
--- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
@@ -462,7 +462,7 @@ struct bdb_general_definitions {
 	 * number = (block_size - sizeof(bdb_general_definitions))/
 	 *	     defs->child_dev_size;
 	 */
-	u8 devices[0];
+	u8 devices[];
 } __packed;
 
 /*
@@ -839,7 +839,7 @@ struct bdb_mipi_config {
 
 struct bdb_mipi_sequence {
 	u8 version;
-	u8 data[0]; /* up to 6 variable length blocks */
+	u8 data[]; /* up to 6 variable length blocks */
 } __packed;
 
 /*
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 47561dc29304..5cec79152f17 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -216,7 +216,7 @@ struct virtual_engine {
 
 	/* And finally, which physical engines this virtual engine maps onto. */
 	unsigned int num_siblings;
-	struct intel_engine_cs *siblings[0];
+	struct intel_engine_cs *siblings[];
 };
 
 static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index 0d1f6c8ff355..5a6561f7a210 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -42,7 +42,7 @@ struct i915_vma_coredump {
 	int num_pages;
 	int page_count;
 	int unused;
-	u32 *pages[0];
+	u32 *pages[];
 };
 
 struct i915_request_coredump {
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9e0953c2b7ce..37aa556c5f92 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -157,7 +157,7 @@ struct msm_gem_submit {
 			uint32_t handle;
 		};
 		uint64_t iova;
-	} bos[0];
+	} bos[];
 };
 
 #endif /* __MSM_GEM_H__ */
diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index ef09dc6bc635..d1086b2a6892 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -36,7 +36,7 @@ static int qxl_reap_surface_id(struct qxl_device *qdev, int max_to_reap);
 
 struct ring {
 	struct qxl_ring_header      header;
-	uint8_t                     elements[0];
+	uint8_t                     elements[];
 };
 
 struct qxl_ring {
diff --git a/drivers/gpu/drm/vboxvideo/vboxvideo.h b/drivers/gpu/drm/vboxvideo/vboxvideo.h
index 0592004f71aa..a5de40fe1a76 100644
--- a/drivers/gpu/drm/vboxvideo/vboxvideo.h
+++ b/drivers/gpu/drm/vboxvideo/vboxvideo.h
@@ -138,7 +138,7 @@ struct vbva_buffer {
 
 	u32 data_len;
 	/* variable size for the rest of the vbva_buffer area in VRAM. */
-	u8 data[0];
+	u8 data[];
 } __packed;
 
 #define VBVA_MAX_RECORD_SIZE (128 * 1024 * 1024)
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 6627b20c99e9..282293e6f751 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -65,7 +65,7 @@ struct vc4_perfmon {
 	 * Note that counter values can't be reset, but you can fake a reset by
 	 * destroying the perfmon and creating a new one.
 	 */
-	u64 counters[0];
+	u64 counters[];
 };
 
 struct vc4_dev {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index f07aa857587c..60cfbfadd3f2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -69,7 +69,7 @@ struct vmw_bo_dirty {
 	unsigned int ref_count;
 	unsigned long bitmap_size;
 	size_t size;
-	unsigned long bitmap[0];
+	unsigned long bitmap[];
 };
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 3ce630aa4fde..ec893cd17b50 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -79,7 +79,7 @@ struct vmw_surface_dirty {
 	struct svga3dsurface_cache cache;
 	size_t size;
 	u32 num_subres;
-	SVGA3dBox boxes[0];
+	SVGA3dBox boxes[];
 };
 
 static void vmw_user_surface_free(struct vmw_resource *res);
diff --git a/include/drm/bridge/mhl.h b/include/drm/bridge/mhl.h
index 1cc77bf38324..d96626a0e3fa 100644
--- a/include/drm/bridge/mhl.h
+++ b/include/drm/bridge/mhl.h
@@ -327,13 +327,13 @@ struct mhl_burst_bits_per_pixel_fmt {
 	struct {
 		u8 stream_id;
 		u8 pixel_format;
-	} __packed desc[0];
+	} __packed desc[];
 } __packed;
 
 struct mhl_burst_emsc_support {
 	struct mhl3_burst_header hdr;
 	u8 num_entries;
-	__be16 burst_id[0];
+	__be16 burst_id[];
 } __packed;
 
 struct mhl_burst_audio_descr {
diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index 9d3b745c3107..94b4390bf990 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -89,7 +89,7 @@ struct displayid_detailed_timings_1 {
 
 struct displayid_detailed_timing_block {
 	struct displayid_block base;
-	struct displayid_detailed_timings_1 timings[0];
+	struct displayid_detailed_timings_1 timings[];
 };
 
 #define for_each_displayid_db(displayid, block, idx, length) \
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 829c0a48577f..33de5dfadaf5 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1708,7 +1708,7 @@ struct i915_context_engines_load_balance {
 
 	__u64 mbz64; /* reserved for future use; must be zero */
 
-	struct i915_engine_class_instance engines[0];
+	struct i915_engine_class_instance engines[];
 } __attribute__((packed));
 
 #define I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(name__, N__) struct { \
@@ -1746,7 +1746,7 @@ struct i915_context_engines_bond {
 	__u64 flags; /* all undefined flags must be zero */
 	__u64 mbz64[4]; /* reserved for future use; must be zero */
 
-	struct i915_engine_class_instance engines[0];
+	struct i915_engine_class_instance engines[];
 } __attribute__((packed));
 
 #define I915_DEFINE_CONTEXT_ENGINES_BOND(name__, N__) struct { \
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
