Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3E2570BAB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8915B90FD4;
	Mon, 11 Jul 2022 20:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACEB8B372;
 Mon, 11 Jul 2022 20:25:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DC09CB8121C;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C0FC36AE9;
 Mon, 11 Jul 2022 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571124;
 bh=rV3CmoWL6n2njTivz0SjBhm4SVPRHIfCzTuMZjOE2sI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HKWg0gdcPy5p0zhofibc69afplnXdZ3he9uvJ4Bdtmxc7xvd1LIX30QnFhQN7can6
 eMo7bCZF6o/lsE2wyCNu71qgCCYVcHAmTO0CAG7fuGq1FeJPT0A7bYOP+k+62xfIFa
 xXf3DqlGtqn+Qk3cAyzKOBsuKsOAMb4x0EKCStPkPeRgmjGhB+ONyo+AgoqH14KewJ
 45ruD20NCbrCH667DNLUkRcZe0dGWzl0eLu2z/XDYw53eRvzc8RAEdV4LDHwR8CzgY
 CD0IXyPU+GjFhlWnioXOKsKOi06/0Kvu6Ezzi2saId1Cs2us6YRX6i8BXQoaTcjmku
 AUBwUWPckiMTg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e8T-N0;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 19/32] drm/i915: stop using kernel-doc markups for something
 else
Date: Mon, 11 Jul 2022 21:25:04 +0100
Message-Id: <ce8d452fd8d28833a63a39878c83a0a1edb89c39.1657565224.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657565224.git.mchehab@kernel.org>
References: <cover.1657565224.git.mchehab@kernel.org>
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
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some occurrences of "/**" that aren't actually part of
a kernel-doc markup. Replace them by "/*", in order to make easier
to identify what i915 files contain kernel-doc markups.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/display/dvo_ch7017.c     | 26 ++++----
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c     |  6 +-
 .../drm/i915/display/intel_display_types.h    |  2 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h  |  6 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  4 +-
 drivers/gpu/drm/i915/display/intel_tv.c       |  2 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h | 63 +++++++++----------
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.h  |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h      | 12 ++--
 drivers/gpu/drm/i915/gt/intel_reset_types.h   |  4 +-
 .../gpu/drm/i915/gt/intel_timeline_types.h    |  6 +-
 .../drm/i915/gt/shaders/clear_kernel/hsw.asm  |  4 +-
 .../drm/i915/gt/shaders/clear_kernel/ivb.asm  |  4 +-
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h | 10 +--
 drivers/gpu/drm/i915/i915_drm_client.h        |  2 +-
 drivers/gpu/drm/i915/i915_drv.h               | 30 ++++-----
 drivers/gpu/drm/i915/i915_file_private.h      |  8 +--
 drivers/gpu/drm/i915/i915_gpu_error.h         |  4 +-
 drivers/gpu/drm/i915/i915_pmu.h               | 32 +++++-----
 drivers/gpu/drm/i915/intel_uncore.h           |  4 +-
 20 files changed, 115 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/dvo_ch7017.c b/drivers/gpu/drm/i915/display/dvo_ch7017.c
index 0589994dde11..581e29ab77e4 100644
--- a/drivers/gpu/drm/i915/display/dvo_ch7017.c
+++ b/drivers/gpu/drm/i915/display/dvo_ch7017.c
@@ -55,13 +55,13 @@
 #define CH7017_TEST_PATTERN		0x48
 
 #define CH7017_POWER_MANAGEMENT		0x49
-/** Enables the TV output path. */
+/* Enables the TV output path. */
 #define CH7017_TV_EN			(1 << 0)
 #define CH7017_DAC0_POWER_DOWN		(1 << 1)
 #define CH7017_DAC1_POWER_DOWN		(1 << 2)
 #define CH7017_DAC2_POWER_DOWN		(1 << 3)
 #define CH7017_DAC3_POWER_DOWN		(1 << 4)
-/** Powers down the TV out block, and DAC0-3 */
+/* Powers down the TV out block, and DAC0-3 */
 #define CH7017_TV_POWER_DOWN_EN		(1 << 5)
 
 #define CH7017_VERSION_ID		0x4a
@@ -84,26 +84,26 @@
 #define CH7017_UP_SCALER_HORIZONTAL_INC_1	0x5e
 
 #define CH7017_HORIZONTAL_ACTIVE_PIXEL_INPUT	0x5f
-/**< Low bits of horizontal active pixel input */
+/* Low bits of horizontal active pixel input */
 
 #define CH7017_ACTIVE_INPUT_LINE_OUTPUT	0x60
-/** High bits of horizontal active pixel input */
+/* High bits of horizontal active pixel input */
 #define CH7017_LVDS_HAP_INPUT_MASK	(0x7 << 0)
-/** High bits of vertical active line output */
+/* High bits of vertical active line output */
 #define CH7017_LVDS_VAL_HIGH_MASK	(0x7 << 3)
 
 #define CH7017_VERTICAL_ACTIVE_LINE_OUTPUT	0x61
-/**< Low bits of vertical active line output */
+/* Low bits of vertical active line output */
 
 #define CH7017_HORIZONTAL_ACTIVE_PIXEL_OUTPUT	0x62
-/**< Low bits of horizontal active pixel output */
+/* Low bits of horizontal active pixel output */
 
 #define CH7017_LVDS_POWER_DOWN		0x63
-/** High bits of horizontal active pixel output */
+/* High bits of horizontal active pixel output */
 #define CH7017_LVDS_HAP_HIGH_MASK	(0x7 << 0)
-/** Enables the LVDS power down state transition */
+/* Enables the LVDS power down state transition */
 #define CH7017_LVDS_POWER_DOWN_EN	(1 << 6)
-/** Enables the LVDS upscaler */
+/* Enables the LVDS upscaler */
 #define CH7017_LVDS_UPSCALER_EN		(1 << 7)
 #define CH7017_LVDS_POWER_DOWN_DEFAULT_RESERVED 0x08
 
@@ -116,9 +116,9 @@
 #define CH7017_LVDS_ENCODING_2		0x65
 
 #define CH7017_LVDS_PLL_CONTROL		0x66
-/** Enables the LVDS panel output path */
+/* Enables the LVDS panel output path */
 #define CH7017_LVDS_PANEN		(1 << 0)
-/** Enables the LVDS panel backlight */
+/* Enables the LVDS panel backlight */
 #define CH7017_LVDS_BKLEN		(1 << 3)
 
 #define CH7017_POWER_SEQUENCING_T1	0x67
@@ -197,7 +197,7 @@ static bool ch7017_write(struct intel_dvo_device *dvo, u8 addr, u8 val)
 	return i2c_transfer(dvo->i2c_bus, &msg, 1) == 1;
 }
 
-/** Probes for a CH7017 on the given bus and slave address. */
+/* Probes for a CH7017 on the given bus and slave address. */
 static bool ch7017_init(struct intel_dvo_device *dvo,
 			struct i2c_adapter *adapter)
 {
diff --git a/drivers/gpu/drm/i915/display/dvo_ch7xxx.c b/drivers/gpu/drm/i915/display/dvo_ch7xxx.c
index 54f58ba44b9f..1c1fe1f29675 100644
--- a/drivers/gpu/drm/i915/display/dvo_ch7xxx.c
+++ b/drivers/gpu/drm/i915/display/dvo_ch7xxx.c
@@ -81,7 +81,7 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define CH7301_SYNC_RGB_YUV	(1<<0)
 #define CH7301_SYNC_POL_DVI	(1<<5)
 
-/** @file
+/*
  * driver for the Chrontel 7xxx DVI chip over DVO.
  */
 
@@ -132,7 +132,7 @@ static char *ch7xxx_get_did(u8 did)
 	return NULL;
 }
 
-/** Reads an 8 bit register */
+/* Reads an 8 bit register */
 static bool ch7xxx_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
 {
 	struct ch7xxx_priv *ch7xxx = dvo->dev_priv;
@@ -170,7 +170,7 @@ static bool ch7xxx_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
 	return false;
 }
 
-/** Writes an 8 bit register */
+/* Writes an 8 bit register */
 static bool ch7xxx_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
 {
 	struct ch7xxx_priv *ch7xxx = dvo->dev_priv;
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0da9b208d56e..100715d4c2fb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1006,7 +1006,7 @@ struct intel_crtc_state {
 		enum drm_scaling_filter scaling_filter;
 	} hw;
 
-	/**
+	/*
 	 * quirks - bitfield with hw state readout quirks
 	 *
 	 * For various reasons the hw state readout code might not be able to
diff --git a/drivers/gpu/drm/i915/display/intel_dvo_dev.h b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
index d96c3cc46e50..45d47209c327 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo_dev.h
+++ b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
@@ -110,7 +110,7 @@ struct intel_dvo_dev_ops {
 	 */
 	bool (*get_hw_state)(struct intel_dvo_device *dev);
 
-	/**
+	/*
 	 * Query the device for the modes it provides.
 	 *
 	 * This function may also update MonInfo, mm_width, and mm_height.
@@ -119,12 +119,12 @@ struct intel_dvo_dev_ops {
 	 */
 	struct drm_display_mode *(*get_modes)(struct intel_dvo_device *dvo);
 
-	/**
+	/*
 	 * Clean up driver-specific bits of the output
 	 */
 	void (*destroy) (struct intel_dvo_device *dvo);
 
-	/**
+	/*
 	 * Debugging hook to dump device registers to log file
 	 */
 	void (*dump_regs)(struct intel_dvo_device *dvo);
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 19122bc6d2ab..7925f5ffaa68 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -162,7 +162,7 @@ struct intel_sdvo_connector {
 	/* this is to get the range of margin.*/
 	u32 max_hscan, max_vscan;
 
-	/**
+	/*
 	 * This is set if we treat the device as HDMI, instead of DVI.
 	 */
 	bool is_hdmi;
@@ -280,7 +280,7 @@ static bool intel_sdvo_read_byte(struct intel_sdvo *intel_sdvo, u8 addr, u8 *ch)
 
 #define SDVO_CMD_NAME_ENTRY(cmd_) { .cmd = SDVO_CMD_ ## cmd_, .name = #cmd_ }
 
-/** Mapping of command numbers to names, for debug output */
+/* Mapping of command numbers to names, for debug output */
 static const struct {
 	u8 cmd;
 	const char *name;
diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index 9379f3463344..2507ab1ceda6 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -26,7 +26,7 @@
  *
  */
 
-/** @file
+/*
  * Integrated TV-out support for the 915GM and 945GM.
  */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index d2d75d9c0c8d..351515db4ef5 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -128,7 +128,6 @@ struct intel_context {
 	struct {
 		u64 timeout_us;
 	} watchdog;
-
 	u32 *lrc_reg_state;
 	union {
 		struct {
@@ -139,7 +138,7 @@ struct intel_context {
 	} lrc;
 	u32 tag; /* cookie passed to HW to track this context on submission */
 
-	/** stats: Context GPU engine busyness tracking. */
+	/* stats: Context GPU engine busyness tracking. */
 	struct intel_context_stats {
 		u64 active;
 
@@ -158,7 +157,7 @@ struct intel_context {
 	atomic_t pin_count;
 	struct mutex pin_mutex; /* guards pinning and associated on-gpuing */
 
-	/**
+	/*
 	 * active: Active tracker for the rq activity (inc. external) on this
 	 * intel_context object.
 	 */
@@ -166,10 +165,10 @@ struct intel_context {
 
 	const struct intel_context_ops *ops;
 
-	/** sseu: Control eu/slice partitioning */
+	/* sseu: Control eu/slice partitioning */
 	struct intel_sseu sseu;
 
-	/**
+	/*
 	 * pinned_contexts_link: List link for the engine's pinned contexts.
 	 * This is only used if this is a perma-pinned kernel context and
 	 * the list is assumed to only be manipulated during driver load
@@ -180,9 +179,9 @@ struct intel_context {
 	u8 wa_bb_page; /* if set, page num reserved for context workarounds */
 
 	struct {
-		/** @lock: protects everything in guc_state */
+		/* @lock: protects everything in guc_state */
 		spinlock_t lock;
-		/**
+		/*
 		 * @sched_state: scheduling state of this context using GuC
 		 * submission
 		 */
@@ -192,18 +191,18 @@ struct intel_context {
 		 * being fenced until a GuC operation completes
 		 */
 		struct list_head fences;
-		/**
+		/*
 		 * @blocked: fence used to signal when the blocking of a
 		 * context's submissions is complete.
 		 */
 		struct i915_sw_fence blocked;
-		/** @number_committed_requests: number of committed requests */
+		/* @number_committed_requests: number of committed requests */
 		int number_committed_requests;
-		/** @requests: list of active requests on this context */
+		/* @requests: list of active requests on this context */
 		struct list_head requests;
-		/** @prio: the context's current guc priority */
+		/* @prio: the context's current guc priority */
 		u8 prio;
-		/**
+		/*
 		 * @prio_count: a counter of the number requests in flight in
 		 * each priority bucket
 		 */
@@ -211,75 +210,75 @@ struct intel_context {
 	} guc_state;
 
 	struct {
-		/**
+		/*
 		 * @id: handle which is used to uniquely identify this context
 		 * with the GuC, protected by guc->submission_state.lock
 		 */
 		u16 id;
-		/**
+		/*
 		 * @ref: the number of references to the guc_id, when
 		 * transitioning in and out of zero protected by
 		 * guc->submission_state.lock
 		 */
 		atomic_t ref;
-		/**
+		/*
 		 * @link: in guc->guc_id_list when the guc_id has no refs but is
 		 * still valid, protected by guc->submission_state.lock
 		 */
 		struct list_head link;
 	} guc_id;
 
-	/**
+	/*
 	 * @destroyed_link: link in guc->submission_state.destroyed_contexts, in
 	 * list when context is pending to be destroyed (deregistered with the
 	 * GuC), protected by guc->submission_state.lock
 	 */
 	struct list_head destroyed_link;
 
-	/** @parallel: sub-structure for parallel submission members */
+	/* @parallel: sub-structure for parallel submission members */
 	struct {
 		union {
-			/**
+			/*
 			 * @child_list: parent's list of children
 			 * contexts, no protection as immutable after context
 			 * creation
 			 */
 			struct list_head child_list;
-			/**
+			/*
 			 * @child_link: child's link into parent's list of
 			 * children
 			 */
 			struct list_head child_link;
 		};
-		/** @parent: pointer to parent if child */
+		/* @parent: pointer to parent if child */
 		struct intel_context *parent;
-		/**
+		/*
 		 * @last_rq: last request submitted on a parallel context, used
 		 * to insert submit fences between requests in the parallel
 		 * context
 		 */
 		struct i915_request *last_rq;
-		/**
+		/*
 		 * @fence_context: fence context composite fence when doing
 		 * parallel submission
 		 */
 		u64 fence_context;
-		/**
+		/*
 		 * @seqno: seqno for composite fence when doing parallel
 		 * submission
 		 */
 		u32 seqno;
-		/** @number_children: number of children if parent */
+		/* @number_children: number of children if parent */
 		u8 number_children;
-		/** @child_index: index into child_list if child */
+		/* @child_index: index into child_list if child */
 		u8 child_index;
-		/** @guc: GuC specific members for parallel submission */
+		/* @guc: GuC specific members for parallel submission */
 		struct {
-			/** @wqi_head: head pointer in work queue */
+			/* @wqi_head: head pointer in work queue */
 			u16 wqi_head;
-			/** @wqi_tail: tail pointer in work queue */
+			/* @wqi_tail: tail pointer in work queue */
 			u16 wqi_tail;
-			/**
+			/*
 			 * @parent_page: page in context state (ce->state) used
 			 * by parent for work queue, process descriptor
 			 */
@@ -288,18 +287,18 @@ struct intel_context {
 	} parallel;
 
 #ifdef CONFIG_DRM_I915_SELFTEST
-	/**
+	/*
 	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
 	 */
 	bool drop_schedule_enable;
 
-	/**
+	/*
 	 * @drop_schedule_disable: Force drop of schedule disable G2H for
 	 * selftest
 	 */
 	bool drop_schedule_disable;
 
-	/**
+	/*
 	 * @drop_deregister: Force drop of deregister G2H for selftest
 	 */
 	bool drop_deregister;
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.h b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.h
index 25340be5ecf0..230e846151a8 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.h
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.h
@@ -26,7 +26,7 @@ struct i915_fence_reg {
 	atomic_t pin_count;
 	struct i915_active active;
 	int id;
-	/**
+	/*
 	 * Whether the tiling parameters for the currently
 	 * associated fence register have changed. Note that
 	 * for the purposes of tracking tiling changes we also
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index df708802889d..905f547094ca 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -93,7 +93,7 @@ struct intel_gt {
 	} timelines;
 
 	struct intel_gt_requests {
-		/**
+		/*
 		 * We leave the user IRQ off as much as possible,
 		 * but this means that requests will finish and never
 		 * be retired once the system goes idle. Set a timer to
@@ -117,7 +117,7 @@ struct intel_gt {
 	ktime_t last_init_time;
 	struct intel_reset reset;
 
-	/**
+	/*
 	 * Is the GPU currently considered idle, or busy executing
 	 * userspace requests? Whilst idle, we allow runtime power
 	 * management to power down the hardware and display clocks.
@@ -143,12 +143,12 @@ struct intel_gt {
 	struct {
 		bool active;
 
-		/**
+		/*
 		 * @lock: Lock protecting the below fields.
 		 */
 		seqcount_mutex_t lock;
 
-		/**
+		/*
 		 * @total: Total time this engine was busy.
 		 *
 		 * Accumulated time not counting the most recent block in cases
@@ -156,7 +156,7 @@ struct intel_gt {
 		 */
 		ktime_t total;
 
-		/**
+		/*
 		 * @start: Timestamp of the last idle to active transition.
 		 *
 		 * Idle is defined as active == 0, active is active > 0.
@@ -222,7 +222,7 @@ struct intel_gt {
 
 		unsigned long mslice_mask;
 
-		/** @hwconfig: hardware configuration data */
+		/* @hwconfig: hardware configuration data */
 		struct intel_hwconfig hwconfig;
 	} info;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_reset_types.h b/drivers/gpu/drm/i915/gt/intel_reset_types.h
index 9312b29f5a97..4ef21186e6d5 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_reset_types.h
@@ -11,7 +11,7 @@
 #include <linux/srcu.h>
 
 struct intel_reset {
-	/**
+	/*
 	 * flags: Control various stages of the GPU reset
 	 *
 	 * #I915_RESET_BACKOFF - When we start a global reset, we need to
@@ -49,7 +49,7 @@ struct intel_reset {
 
 	struct mutex mutex; /* serialises wedging/unwedging */
 
-	/**
+	/*
 	 * Waitqueue to signal when the reset has completed. Used by clients
 	 * that wait for dev_priv->mm.wedged to settle.
 	 */
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline_types.h b/drivers/gpu/drm/i915/gt/intel_timeline_types.h
index 74e67dbf89c5..ae5f859d72c0 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_timeline_types.h
@@ -50,7 +50,7 @@ struct intel_timeline {
 
 	bool has_initial_breadcrumb;
 
-	/**
+	/*
 	 * List of breadcrumbs associated with GPU requests currently
 	 * outstanding.
 	 */
@@ -66,10 +66,10 @@ struct intel_timeline {
 
 	struct i915_active active;
 
-	/** A chain of completed timelines ready for early retirement. */
+	/* A chain of completed timelines ready for early retirement. */
 	struct intel_timeline *retire;
 
-	/**
+	/*
 	 * We track the most recent seqno that we wait on in every context so
 	 * that we only have to emit a new await and dependency on a more
 	 * recent sync point. As the contexts may be executed out-of-order, we
diff --git a/drivers/gpu/drm/i915/gt/shaders/clear_kernel/hsw.asm b/drivers/gpu/drm/i915/gt/shaders/clear_kernel/hsw.asm
index 5fdf384bb621..88d2dbbf981e 100644
--- a/drivers/gpu/drm/i915/gt/shaders/clear_kernel/hsw.asm
+++ b/drivers/gpu/drm/i915/gt/shaders/clear_kernel/hsw.asm
@@ -14,7 +14,7 @@
 /* Store designated "clear GRF" value */
 mov(1)          f0.1<1>UW       g1.2<0,1,0>UW                   { align1 1N };
 
-/**
+/*
  * Curbe Format
  *
  * DW 1.0 - Block Offset to write Render Cache
@@ -40,7 +40,7 @@ add(1)          g1.2<1>UD       g1.2<0,1,0>UD   0x00000001UD    { align1 1N }; /
 cmp.z.f0.0(1)   null<1>UD       g1.3<0,1,0>UD   0x00000000UD    { align1 1N };
 (+f0.0) jmpi(1) 352D                                            { align1 WE_all 1N };
 
-/**
+/*
  * State Register has info on where this thread is running
  *	IVB: sr0.0 :: [15:13]: MBZ, 12: HSID (Half-Slice ID), [11:8]EUID, [2:0] ThreadSlotID
  *	HSW: sr0.0 :: 15: MBZ, [14:13]: SliceID, 12: HSID (Half-Slice ID), [11:8]EUID, [2:0] ThreadSlotID
diff --git a/drivers/gpu/drm/i915/gt/shaders/clear_kernel/ivb.asm b/drivers/gpu/drm/i915/gt/shaders/clear_kernel/ivb.asm
index 97c7ac9e3854..4d7c5f1981ba 100644
--- a/drivers/gpu/drm/i915/gt/shaders/clear_kernel/ivb.asm
+++ b/drivers/gpu/drm/i915/gt/shaders/clear_kernel/ivb.asm
@@ -14,7 +14,7 @@
 /* Store designated "clear GRF" value */
 mov(1)          f0.1<1>UW       g1.2<0,1,0>UW                   { align1 1N };
 
-/**
+/*
  * Curbe Format
  *
  * DW 1.0 - Block Offset to write Render Cache
@@ -40,7 +40,7 @@ add(1)          g1.2<1>UD       g1.2<0,1,0>UD   0x00000001UD    { align1 1N }; /
 cmp.z.f0.0(1)   null<1>UD       g1.3<0,1,0>UD   0x00000000UD    { align1 1N };
 (+f0.0) jmpi(1) 44D                                             { align1 WE_all 1N };
 
-/**
+/*
  * State Register has info on where this thread is running
  *	IVB: sr0.0 :: [15:13]: MBZ, 12: HSID (Half-Slice ID), [11:8]EUID, [2:0] ThreadSlotID
  *	HSW: sr0.0 :: 15: MBZ, [14:13]: SliceID, 12: HSID (Half-Slice ID), [11:8]EUID, [2:0] ThreadSlotID
diff --git a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
index 58f93226b1c1..d8a7659079f5 100644
--- a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
@@ -168,12 +168,12 @@ struct __guc_capture_ads_cache {
  * Internal context of the intel_guc_capture module.
  */
 struct intel_guc_state_capture {
-	/**
+	/*
 	 * @reglists: static table of register lists used for error-capture state.
 	 */
 	const struct __guc_mmio_reg_descr_group *reglists;
 
-	/**
+	/*
 	 * @extlists: allocated table of steered register lists used for error-capture state.
 	 *
 	 * NOTE: steered registers have multiple instances depending on the HW configuration
@@ -181,7 +181,7 @@ struct intel_guc_state_capture {
 	 */
 	struct __guc_mmio_reg_descr_group *extlists;
 
-	/**
+	/*
 	 * @ads_cache: cached register lists that is ADS format ready
 	 */
 	struct __guc_capture_ads_cache ads_cache[GUC_CAPTURE_LIST_INDEX_MAX]
@@ -189,7 +189,7 @@ struct intel_guc_state_capture {
 						[GUC_MAX_ENGINE_CLASSES];
 	void *ads_null_cache;
 
-	/**
+	/*
 	 * @cachelist: Pool of pre-allocated nodes for error capture output
 	 *
 	 * We need this pool of pre-allocated nodes because we cannot
@@ -204,7 +204,7 @@ struct intel_guc_state_capture {
 #define PREALLOC_NODES_DEFAULT_NUMREGS 64
 	int max_mmio_per_node;
 
-	/**
+	/*
 	 * @outlist: Pool of pre-allocated nodes for error capture output
 	 *
 	 * A linked list of parsed GuC error-capture output data before
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 69496af996d9..c722e3c18694 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -34,7 +34,7 @@ struct i915_drm_client {
 
 	struct i915_drm_clients *clients;
 
-	/**
+	/*
 	 * @past_runtime: Accumulation of pphwsp runtimes from closed contexts.
 	 */
 	atomic64_t past_runtime[I915_LAST_UABI_ENGINE_CLASS + 1];
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index d25647be25d1..91a3aa49e918 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -224,37 +224,37 @@ struct i915_gem_mm {
 	 * support stolen.
 	 */
 	struct intel_memory_region *stolen_region;
-	/** Memory allocator for GTT stolen memory */
+	/* Memory allocator for GTT stolen memory */
 	struct drm_mm stolen;
-	/** Protects the usage of the GTT stolen memory allocator. This is
+	/* Protects the usage of the GTT stolen memory allocator. This is
 	 * always the inner lock when overlapping with struct_mutex. */
 	struct mutex stolen_lock;
 
 	/* Protects bound_list/unbound_list and #drm_i915_gem_object.mm.link */
 	spinlock_t obj_lock;
 
-	/**
+	/*
 	 * List of objects which are purgeable.
 	 */
 	struct list_head purge_list;
 
-	/**
+	/*
 	 * List of objects which have allocated pages and are shrinkable.
 	 */
 	struct list_head shrink_list;
 
-	/**
+	/*
 	 * List of objects which are pending destruction.
 	 */
 	struct llist_head free_list;
 	struct delayed_work free_work;
-	/**
+	/*
 	 * Count of objects pending destructions. Used to skip needlessly
 	 * waiting on an RCU barrier if no objects are waiting to be freed.
 	 */
 	atomic_t free_count;
 
-	/**
+	/*
 	 * tmpfs instance used for shmem backed objects
 	 */
 	struct vfsmount *gemfs;
@@ -266,7 +266,7 @@ struct i915_gem_mm {
 	struct shrinker shrinker;
 
 #ifdef CONFIG_MMU_NOTIFIER
-	/**
+	/*
 	 * notifier_lock for mmu notifiers, memory may not be allocated
 	 * while holding this lock.
 	 */
@@ -384,7 +384,7 @@ struct drm_i915_private {
 	struct intel_runtime_info __runtime; /* Use RUNTIME_INFO() to access. */
 	struct intel_driver_caps caps;
 
-	/**
+	/*
 	 * Data Stolen Memory - aka "i915 stolen memory" gives us the start and
 	 * end of stolen which we can optionally use to create GEM objects
 	 * backed by stolen memory. Note that stolen_usable_size tells us
@@ -392,7 +392,7 @@ struct drm_i915_private {
 	 * some portion of it is in fact reserved for use by hardware functions.
 	 */
 	struct resource dsm;
-	/**
+	/*
 	 * Reseved portion of Data Stolen Memory
 	 */
 	struct resource dsm_reserved;
@@ -421,11 +421,11 @@ struct drm_i915_private {
 
 	struct intel_gmbus *gmbus[GMBUS_NUM_PINS];
 
-	/** gmbus_mutex protects against concurrent usage of the single hw gmbus
+	/* gmbus_mutex protects against concurrent usage of the single hw gmbus
 	 * controller on different i2c buses. */
 	struct mutex gmbus_mutex;
 
-	/**
+	/*
 	 * Base address of where the gmbus and gpio blocks are located (either
 	 * on PCH or on SoC for platforms without PCH).
 	 */
@@ -454,7 +454,7 @@ struct drm_i915_private {
 	struct mutex sb_lock;
 	struct pm_qos_request sb_qos;
 
-	/** Cached value of IMR to avoid reads in updating the bitfield */
+	/* Cached value of IMR to avoid reads in updating the bitfield */
 	union {
 		u32 irq_mask;
 		u32 de_irq_mask[I915_MAX_PIPES];
@@ -503,7 +503,7 @@ struct drm_i915_private {
 		struct intel_global_obj obj;
 	} dbuf;
 
-	/**
+	/*
 	 * wq - Driver workqueue for GEM.
 	 *
 	 * NOTE: Work items scheduled here are not allowed to grab any modeset
@@ -554,7 +554,7 @@ struct drm_i915_private {
 
 	/* Kernel Modesetting */
 
-	/**
+	/*
 	 * dpll and cdclk state is protected by connection_mutex
 	 * dpll.lock serializes intel_{prepare,enable,disable}_shared_dpll.
 	 * Must be global rather than per dpll, because on some platforms plls
diff --git a/drivers/gpu/drm/i915/i915_file_private.h b/drivers/gpu/drm/i915/i915_file_private.h
index f42877869692..282e0c280224 100644
--- a/drivers/gpu/drm/i915/i915_file_private.h
+++ b/drivers/gpu/drm/i915/i915_file_private.h
@@ -22,7 +22,7 @@ struct drm_i915_file_private {
 		struct rcu_head rcu;
 	};
 
-	/** @proto_context_lock: Guards all struct i915_gem_proto_context
+	/* @proto_context_lock: Guards all struct i915_gem_proto_context
 	 * operations
 	 *
 	 * This not only guards @proto_context_xa, but is always held
@@ -33,7 +33,7 @@ struct drm_i915_file_private {
 	 */
 	struct mutex proto_context_lock;
 
-	/** @proto_context_xa: xarray of struct i915_gem_proto_context
+	/* @proto_context_xa: xarray of struct i915_gem_proto_context
 	 *
 	 * Historically, the context uAPI allowed for two methods of
 	 * setting context parameters: SET_CONTEXT_PARAM and
@@ -77,7 +77,7 @@ struct drm_i915_file_private {
 	 */
 	struct xarray proto_context_xa;
 
-	/** @context_xa: xarray of fully created i915_gem_context
+	/* @context_xa: xarray of fully created i915_gem_context
 	 *
 	 * Write access to this xarray is guarded by @proto_context_lock.
 	 * Otherwise, writers may race with finalize_create_context_locked().
@@ -101,7 +101,7 @@ struct drm_i915_file_private {
 #define   I915_CLIENT_FAST_HANG_JIFFIES (60 * HZ)
 #define I915_CLIENT_SCORE_CONTEXT_BAN   3
 #define I915_CLIENT_SCORE_BANNED	9
-	/** ban_score: Accumulated score of all ctx bans and fast hangs. */
+	/* ban_score: Accumulated score of all ctx bans and fast hangs. */
 	atomic_t ban_score;
 	unsigned long hang_timestamp;
 
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index 55a143b92d10..112a646c78ed 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -207,10 +207,10 @@ struct i915_gpu_error {
 
 	atomic_t pending_fb_pin;
 
-	/** Number of times the device has been reset (global) */
+	/* Number of times the device has been reset (global) */
 	atomic_t reset_count;
 
-	/** Number of times an engine has been reset */
+	/* Number of times an engine has been reset */
 	atomic_t reset_engine_count[I915_NUM_ENGINES];
 };
 
diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
index c30f43319a78..9fdb50376995 100644
--- a/drivers/gpu/drm/i915/i915_pmu.h
+++ b/drivers/gpu/drm/i915/i915_pmu.h
@@ -52,34 +52,34 @@ struct i915_pmu_sample {
 };
 
 struct i915_pmu {
-	/**
+	/*
 	 * @cpuhp: Struct used for CPU hotplug handling.
 	 */
 	struct {
 		struct hlist_node node;
 		unsigned int cpu;
 	} cpuhp;
-	/**
+	/*
 	 * @base: PMU base.
 	 */
 	struct pmu base;
-	/**
+	/*
 	 * @closed: i915 is unregistering.
 	 */
 	bool closed;
-	/**
+	/*
 	 * @name: Name as registered with perf core.
 	 */
 	const char *name;
-	/**
+	/*
 	 * @lock: Lock protecting enable mask and ref count handling.
 	 */
 	spinlock_t lock;
-	/**
+	/*
 	 * @timer: Timer for internal i915 PMU sampling.
 	 */
 	struct hrtimer timer;
-	/**
+	/*
 	 * @enable: Bitmask of specific enabled events.
 	 *
 	 * For some events we need to track their state and do some internal
@@ -92,14 +92,14 @@ struct i915_pmu {
 	 */
 	u32 enable;
 
-	/**
+	/*
 	 * @timer_last:
 	 *
 	 * Timestmap of the previous timer invocation.
 	 */
 	ktime_t timer_last;
 
-	/**
+	/*
 	 * @enable_count: Reference counts for the enabled events.
 	 *
 	 * Array indices are mapped in the same way as bits in the @enable field
@@ -107,11 +107,11 @@ struct i915_pmu {
 	 * are using the PMU API.
 	 */
 	unsigned int enable_count[I915_PMU_MASK_BITS];
-	/**
+	/*
 	 * @timer_enabled: Should the internal sampling timer be running.
 	 */
 	bool timer_enabled;
-	/**
+	/*
 	 * @sample: Current and previous (raw) counters for sampling events.
 	 *
 	 * These counters are updated from the i915 PMU sampling timer.
@@ -120,11 +120,11 @@ struct i915_pmu {
 	 * struct intel_engine_cs.
 	 */
 	struct i915_pmu_sample sample[__I915_NUM_PMU_SAMPLERS];
-	/**
+	/*
 	 * @sleep_last: Last time GT parked for RC6 estimation.
 	 */
 	ktime_t sleep_last;
-	/**
+	/*
 	 * @irq_count: Number of interrupts
 	 *
 	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
@@ -132,15 +132,15 @@ struct i915_pmu {
 	 * occasional wraparound easily. It's 32bit after all.
 	 */
 	unsigned long irq_count;
-	/**
+	/*
 	 * @events_attr_group: Device events attribute group.
 	 */
 	struct attribute_group events_attr_group;
-	/**
+	/*
 	 * @i915_attr: Memory block holding device attributes.
 	 */
 	void *i915_attr;
-	/**
+	/*
 	 * @pmu_attr: Memory block holding device attributes.
 	 */
 	void *pmu_attr;
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index b1fa912a65e7..5f896fbf3064 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -39,7 +39,7 @@ struct intel_uncore;
 struct intel_gt;
 
 struct intel_uncore_mmio_debug {
-	spinlock_t lock; /** lock is also taken in irq contexts. */
+	spinlock_t lock; /* lock is also taken in irq contexts. */
 	int unclaimed_mmio_check;
 	int saved_mmio_check;
 	u32 suspend_count;
@@ -133,7 +133,7 @@ struct intel_uncore {
 	struct intel_gt *gt;
 	struct intel_runtime_pm *rpm;
 
-	spinlock_t lock; /** lock is also taken in irq contexts. */
+	spinlock_t lock; /* lock is also taken in irq contexts. */
 
 	unsigned int flags;
 #define UNCORE_HAS_FORCEWAKE		BIT(0)
-- 
2.36.1

