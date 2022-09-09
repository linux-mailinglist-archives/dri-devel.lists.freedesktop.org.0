Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E564F5B3036
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBBE10EC25;
	Fri,  9 Sep 2022 07:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFC010EC06;
 Fri,  9 Sep 2022 07:35:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39E1361EDB;
 Fri,  9 Sep 2022 07:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C8FC433D6;
 Fri,  9 Sep 2022 07:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662708902;
 bh=nh2Uk3TlUaRu9UVMUU/JV+L/qvYYQzUsH29Ji+aEIaI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Al7mAT5XcsQJ7t0LjstvdNYLWMAQocjHizLxyZzYeHDcbgJr0QPdN2BIyhid5OZWD
 1La/BdQoIkxyhFUQb2hxO2BSKSQilgGflvlQxYJ4KEf6ZmdcYpU88xJUc/CYSRQdeU
 mtdRyL+u7nbGfAicPxRDI/pxGqG4ney5hY02e1LvWBj6B+YXo3wkbLrfC504cLpV71
 X4ugEsxB+roHJwksnOBeFq3PDobWWKMKWlBqWP/T7WoWHx7OXq+zJ49NMW0fDdFX3i
 +Qd6dEclupKAjdO1MHsEDjqS1SirkMEQJZWMjdGZv31wuZbMFdwdMW+3/9K9oivE9I
 sysIIDVef/3DA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oWYXH-007FI0-PE;
 Fri, 09 Sep 2022 09:34:47 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 37/37] drm/i915: be consistent with kernel-doc function
 declaration
Date: Fri,  9 Sep 2022 09:34:44 +0200
Message-Id: <b0caa1cfce522bef57351ac5bbaf1329eb05509f.1662708705.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1662708705.git.mchehab@kernel.org>
References: <cover.1662708705.git.mchehab@kernel.org>
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Fernando Ramos <greenfoo@u92.eu>, Matthew Brost <matthew.brost@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, 91% of kernel-doc function declarations don't have
parenthesis on it. Let's be consistent inside the driver by
removing the parenthesis from the other ones.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/display/intel_atomic.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_audio.c     |  4 ++--
 drivers/gpu/drm/i915/display/intel_crtc.c      |  4 ++--
 drivers/gpu/drm/i915/display/intel_dmc.c       | 10 +++++-----
 drivers/gpu/drm/i915/display/intel_dsb.c       | 10 +++++-----
 drivers/gpu/drm/i915/display/intel_lpe_audio.c |  8 ++++----
 drivers/gpu/drm/i915/gt/intel_engine_cs.c      | 10 +++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc.c         | 10 +++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc.h         |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c     |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c      |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c    |  8 ++++----
 drivers/gpu/drm/i915/gt/uc/intel_huc.c         |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c      |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h       |  2 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c         |  8 ++++----
 drivers/gpu/drm/i915/i915_reg_defs.h           | 12 ++++++------
 drivers/gpu/drm/i915/intel_wopcm.c             |  4 ++--
 18 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 18f0a5ae3bac..9b604a720ff0 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -373,7 +373,7 @@ static void intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_sta
 }
 
 /**
- * intel_atomic_setup_scalers() - setup scalers for crtc per staged requests
+ * intel_atomic_setup_scalers - setup scalers for crtc per staged requests
  * @dev_priv: i915 device
  * @intel_crtc: intel crtc
  * @crtc_state: incoming crtc_state to validate and setup scalers
diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index aacbc6da84ef..667fe9a8ff8e 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -1385,7 +1385,7 @@ static void i915_audio_component_cleanup(struct drm_i915_private *dev_priv)
 }
 
 /**
- * intel_audio_init() - Initialize the audio driver either using
+ * intel_audio_init - Initialize the audio driver either using
  * component framework or using lpe audio bridge
  * @dev_priv: the i915 drm device private data
  *
@@ -1397,7 +1397,7 @@ void intel_audio_init(struct drm_i915_private *dev_priv)
 }
 
 /**
- * intel_audio_deinit() - deinitialize the audio driver
+ * intel_audio_deinit - deinitialize the audio driver
  * @dev_priv: the i915 drm device private data
  *
  */
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 6792a9056f46..507d7aec7b1c 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -463,7 +463,7 @@ static int intel_mode_vblank_start(const struct drm_display_mode *mode)
 }
 
 /**
- * intel_pipe_update_start() - start update of a set of display registers
+ * intel_pipe_update_start - start update of a set of display registers
  * @new_crtc_state: the new crtc state
  *
  * Mark the start of an update to pipe registers that should be updated
@@ -617,7 +617,7 @@ static void dbg_vblank_evade(struct intel_crtc *crtc, ktime_t end) {}
 #endif
 
 /**
- * intel_pipe_update_end() - end update of a set of display registers
+ * intel_pipe_update_end - end update of a set of display registers
  * @new_crtc_state: the new crtc state
  *
  * Mark the end of an update started with intel_pipe_update_start(). This
diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index e52ecc0738a6..2024884688f6 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -408,7 +408,7 @@ static void pipedmc_clock_gating_wa(struct drm_i915_private *i915, bool enable)
 }
 
 /**
- * intel_dmc_load_program() - write the firmware from memory to register.
+ * intel_dmc_load_program - write the firmware from memory to register.
  * @dev_priv: i915 drm device.
  *
  * DMC firmware is read from a .bin file and kept in internal memory one time.
@@ -876,7 +876,7 @@ static void dmc_load_work_fn(struct work_struct *work)
 }
 
 /**
- * intel_dmc_ucode_init() - initialize the firmware loading.
+ * intel_dmc_ucode_init - initialize the firmware loading.
  * @dev_priv: i915 drm device.
  *
  * This function is called at the time of loading the display driver to read
@@ -973,7 +973,7 @@ void intel_dmc_ucode_init(struct drm_i915_private *dev_priv)
 }
 
 /**
- * intel_dmc_ucode_suspend() - prepare DMC firmware before system suspend
+ * intel_dmc_ucode_suspend - prepare DMC firmware before system suspend
  * @dev_priv: i915 drm device
  *
  * Prepare the DMC firmware before entering system suspend. This includes
@@ -993,7 +993,7 @@ void intel_dmc_ucode_suspend(struct drm_i915_private *dev_priv)
 }
 
 /**
- * intel_dmc_ucode_resume() - init DMC firmware during system resume
+ * intel_dmc_ucode_resume - init DMC firmware during system resume
  * @dev_priv: i915 drm device
  *
  * Reinitialize the DMC firmware during system resume, reacquiring any
@@ -1013,7 +1013,7 @@ void intel_dmc_ucode_resume(struct drm_i915_private *dev_priv)
 }
 
 /**
- * intel_dmc_ucode_fini() - unload the DMC firmware.
+ * intel_dmc_ucode_fini - unload the DMC firmware.
  * @dev_priv: i915 drm device.
  *
  * Firmmware unloading includes freeing the internal memory and reset the
diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index c4affcb216fd..2ce406f62d40 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -80,7 +80,7 @@ static bool intel_dsb_disable_engine(struct drm_i915_private *i915,
 }
 
 /**
- * intel_dsb_indexed_reg_write() -Write to the DSB context for auto
+ * intel_dsb_indexed_reg_write -Write to the DSB context for auto
  * increment register.
  * @crtc_state: intel_crtc_state structure
  * @reg: register address.
@@ -158,7 +158,7 @@ void intel_dsb_indexed_reg_write(const struct intel_crtc_state *crtc_state,
 }
 
 /**
- * intel_dsb_reg_write() -Write to the DSB context for normal
+ * intel_dsb_reg_write -Write to the DSB context for normal
  * register.
  * @crtc_state: intel_crtc_state structure
  * @reg: register address.
@@ -197,7 +197,7 @@ void intel_dsb_reg_write(const struct intel_crtc_state *crtc_state,
 }
 
 /**
- * intel_dsb_commit() - Trigger workload execution of DSB.
+ * intel_dsb_commit - Trigger workload execution of DSB.
  * @crtc_state: intel_crtc_state structure
  *
  * This function is used to do actual write to hardware using DSB.
@@ -254,7 +254,7 @@ void intel_dsb_commit(const struct intel_crtc_state *crtc_state)
 }
 
 /**
- * intel_dsb_prepare() - Allocate, pin and map the DSB command buffer.
+ * intel_dsb_prepare - Allocate, pin and map the DSB command buffer.
  * @crtc_state: intel_crtc_state structure to prepare associated dsb instance.
  *
  * This function prepare the command buffer which is used to store dsb
@@ -316,7 +316,7 @@ void intel_dsb_prepare(struct intel_crtc_state *crtc_state)
 }
 
 /**
- * intel_dsb_cleanup() - To cleanup DSB context.
+ * intel_dsb_cleanup - To cleanup DSB context.
  * @crtc_state: intel_crtc_state structure to cleanup associated dsb instance.
  *
  * This function cleanup the DSB context by unpinning and releasing
diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
index dca6003ccac8..078a14e991a0 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
@@ -250,7 +250,7 @@ static int lpe_audio_setup(struct drm_i915_private *dev_priv)
 }
 
 /**
- * intel_lpe_audio_irq_handler() - forwards the LPE audio irq
+ * intel_lpe_audio_irq_handler - forwards the LPE audio irq
  * @dev_priv: the i915 drm device private data
  *
  * the LPE Audio irq is forwarded to the irq handler registered by LPE audio
@@ -270,7 +270,7 @@ void intel_lpe_audio_irq_handler(struct drm_i915_private *dev_priv)
 }
 
 /**
- * intel_lpe_audio_init() - detect and setup the bridge between HDMI LPE Audio
+ * intel_lpe_audio_init - detect and setup the bridge between HDMI LPE Audio
  * driver and i915
  * @dev_priv: the i915 drm device private data
  *
@@ -291,7 +291,7 @@ int intel_lpe_audio_init(struct drm_i915_private *dev_priv)
 }
 
 /**
- * intel_lpe_audio_teardown() - destroy the bridge between HDMI LPE
+ * intel_lpe_audio_teardown - destroy the bridge between HDMI LPE
  * audio driver and i915
  * @dev_priv: the i915 drm device private data
  *
@@ -311,7 +311,7 @@ void intel_lpe_audio_teardown(struct drm_i915_private *dev_priv)
 }
 
 /**
- * intel_lpe_audio_notify() - notify lpe audio event
+ * intel_lpe_audio_notify - notify lpe audio event
  * audio driver and i915
  * @dev_priv: the i915 drm device private data
  * @pipe: pipe
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index da9cd41c45f1..0ac813422809 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -247,7 +247,7 @@ static const struct engine_info intel_engines[] = {
 };
 
 /**
- * intel_engine_context_size() - return the size of the context for an engine
+ * intel_engine_context_size - return the size of the context for an engine
  * @gt: the gt
  * @class: engine class
  *
@@ -576,7 +576,7 @@ static void intel_setup_engine_capabilities(struct intel_gt *gt)
 }
 
 /**
- * intel_engines_release() - free the resources allocated for Command Streamers
+ * intel_engines_release - free the resources allocated for Command Streamers
  * @gt: pointer to struct intel_gt
  */
 void intel_engines_release(struct intel_gt *gt)
@@ -846,7 +846,7 @@ static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
 }
 
 /**
- * intel_engines_init_mmio() - allocate and prepare the Engine Command Streamers
+ * intel_engines_init_mmio - allocate and prepare the Engine Command Streamers
  * @gt: pointer to struct intel_gt
  *
  * Return: non-zero if the initialization failed.
@@ -1631,7 +1631,7 @@ void __intel_engine_flush_submission(struct intel_engine_cs *engine, bool sync)
 }
 
 /**
- * intel_engine_is_idle() - Report if the engine has finished process all work
+ * intel_engine_is_idle - Report if the engine has finished process all work
  * @engine: the intel_engine_cs
  *
  * Return true if there are no requests pending, nothing left to be submitted
@@ -2203,7 +2203,7 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 }
 
 /**
- * intel_engine_get_busy_time() - Return current accumulated engine busyness
+ * intel_engine_get_busy_time - Return current accumulated engine busyness
  * @engine: engine to report on
  * @now: monotonic timestamp of sampling
  *
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 24451d000a6a..d969005a857c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -599,7 +599,7 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
 }
 
 /**
- * intel_guc_auth_huc() - Send action to GuC to authenticate HuC ucode
+ * intel_guc_auth_huc - Send action to GuC to authenticate HuC ucode
  * @guc: intel_guc structure
  * @rsa_offset: rsa offset w.r.t ggtt base of huc vma
  *
@@ -620,7 +620,7 @@ int intel_guc_auth_huc(struct intel_guc *guc, u32 rsa_offset)
 }
 
 /**
- * intel_guc_suspend() - notify GuC entering suspend state
+ * intel_guc_suspend - notify GuC entering suspend state
  * @guc:	the guc
  */
 int intel_guc_suspend(struct intel_guc *guc)
@@ -657,7 +657,7 @@ int intel_guc_suspend(struct intel_guc *guc)
 }
 
 /**
- * intel_guc_resume() - notify GuC resuming from suspend state
+ * intel_guc_resume - notify GuC resuming from suspend state
  * @guc:	the guc
  */
 int intel_guc_resume(struct intel_guc *guc)
@@ -706,7 +706,7 @@ int intel_guc_resume(struct intel_guc *guc)
  */
 
 /**
- * intel_guc_allocate_vma() - Allocate a GGTT VMA for GuC usage
+ * intel_guc_allocate_vma - Allocate a GGTT VMA for GuC usage
  * @guc:	the guc
  * @size:	size of area to allocate (both virtual space and memory)
  *
@@ -756,7 +756,7 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
 }
 
 /**
- * intel_guc_allocate_and_map_vma() - Allocate and map VMA for GuC usage
+ * intel_guc_allocate_and_map_vma - Allocate and map VMA for GuC usage
  * @guc:	the guc
  * @size:	size of area to allocate (both virtual space and memory)
  * @out_vma:	return variable for the allocated vma pointer
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 804133df1ac9..04b0cecf12bd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -325,7 +325,7 @@ static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
 #define GUC_GGTT_TOP	0xFEE00000
 
 /**
- * intel_guc_ggtt_offset() - Get and validate the GGTT offset of @vma
+ * intel_guc_ggtt_offset - Get and validate the GGTT offset of @vma
  * @guc: intel_guc structure.
  * @vma: i915 graphics virtual memory area.
  *
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 74cbe8eaf531..77204382cc44 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -786,7 +786,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 }
 
 /**
- * intel_guc_ads_create() - allocates and initializes GuC ADS.
+ * intel_guc_ads_create - allocates and initializes GuC ADS.
  * @guc: intel_guc struct
  *
  * GuC needs memory block (Additional Data Struct), where it will store
@@ -871,7 +871,7 @@ static void guc_ads_private_data_reset(struct intel_guc *guc)
 }
 
 /**
- * intel_guc_ads_reset() - prepares GuC Additional Data Struct for reuse
+ * intel_guc_ads_reset - prepares GuC Additional Data Struct for reuse
  * @guc: intel_guc struct
  *
  * GuC stores some data in ADS, which might be stale after a reset.
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index a0372735cddb..bcdc37e6d9c9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -151,7 +151,7 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
 }
 
 /**
- * intel_guc_fw_upload() - load GuC uCode to device
+ * intel_guc_fw_upload - load GuC uCode to device
  * @guc: intel_guc structure
  *
  * Called from intel_uc_init_hw() during driver load, resume from sleep and
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index fdd895f73f9f..288db5ada139 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -381,7 +381,7 @@ static void slpc_shared_data_reset(struct slpc_shared_data *data)
 }
 
 /**
- * intel_guc_slpc_set_max_freq() - Set max frequency limit for SLPC.
+ * intel_guc_slpc_set_max_freq - Set max frequency limit for SLPC.
  * @slpc: pointer to intel_guc_slpc.
  * @val: frequency (MHz)
  *
@@ -418,7 +418,7 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
 }
 
 /**
- * intel_guc_slpc_get_max_freq() - Get max frequency limit for SLPC.
+ * intel_guc_slpc_get_max_freq - Get max frequency limit for SLPC.
  * @slpc: pointer to intel_guc_slpc.
  * @val: pointer to val which will hold max frequency (MHz)
  *
@@ -445,7 +445,7 @@ int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
 }
 
 /**
- * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
+ * intel_guc_slpc_set_min_freq - Set min frequency limit for SLPC.
  * @slpc: pointer to intel_guc_slpc.
  * @val: frequency (MHz)
  *
@@ -498,7 +498,7 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 }
 
 /**
- * intel_guc_slpc_get_min_freq() - Get min frequency limit for SLPC.
+ * intel_guc_slpc_get_min_freq - Get min frequency limit for SLPC.
  * @slpc: pointer to intel_guc_slpc.
  * @val: pointer to val which will hold min frequency (MHz)
  *
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 3bb8838e325a..127f7b952646 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -126,7 +126,7 @@ void intel_huc_fini(struct intel_huc *huc)
 }
 
 /**
- * intel_huc_auth() - Authenticate HuC uCode
+ * intel_huc_auth - Authenticate HuC uCode
  * @huc: intel_huc structure
  *
  * Called after HuC and GuC firmware loading during intel_uc_init_hw().
@@ -194,7 +194,7 @@ static bool huc_is_authenticated(struct intel_huc *huc)
 }
 
 /**
- * intel_huc_check_status() - check HuC status
+ * intel_huc_check_status - check HuC status
  * @huc: intel_huc structure
  *
  * This function reads status register to verify if HuC
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
index 9d6ab1e01639..1fb05b45a8d2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
@@ -8,7 +8,7 @@
 #include "i915_drv.h"
 
 /**
- * intel_huc_fw_upload() - load HuC uCode to device via DMA transfer
+ * intel_huc_fw_upload - load HuC uCode to device via DMA transfer
  * @huc: intel_huc structure
  *
  * Called from intel_uc_init_hw() during driver load, resume from sleep and
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index cb586f7df270..b14c82e17a6c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -250,7 +250,7 @@ static inline u32 __intel_uc_fw_get_upload_size(struct intel_uc_fw *uc_fw)
 }
 
 /**
- * intel_uc_fw_get_upload_size() - Get size of firmware needed to be uploaded.
+ * intel_uc_fw_get_upload_size - Get size of firmware needed to be uploaded.
  * @uc_fw: uC firmware.
  *
  * Get the size of the firmware and header that will be uploaded to WOPCM.
diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
index f93e6122f247..1929aff97fee 100644
--- a/drivers/gpu/drm/i915/i915_cmd_parser.c
+++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
@@ -945,7 +945,7 @@ static void fini_hash_table(struct intel_engine_cs *engine)
 }
 
 /**
- * intel_engine_init_cmd_parser() - set cmd parser related fields for an engine
+ * intel_engine_init_cmd_parser - set cmd parser related fields for an engine
  * @engine: the engine to initialize
  *
  * Optionally initializes fields related to batch buffer command parsing in the
@@ -1059,7 +1059,7 @@ int intel_engine_init_cmd_parser(struct intel_engine_cs *engine)
 }
 
 /**
- * intel_engine_cleanup_cmd_parser() - clean up cmd parser related fields
+ * intel_engine_cleanup_cmd_parser - clean up cmd parser related fields
  * @engine: the engine to clean up
  *
  * Releases any resources related to command parsing that may have been
@@ -1422,7 +1422,7 @@ static unsigned long *alloc_whitelist(u32 batch_length)
 #define LENGTH_BIAS 2
 
 /**
- * intel_engine_cmd_parser() - parse a batch buffer for privilege violations
+ * intel_engine_cmd_parser - parse a batch buffer for privilege violations
  * @engine: the engine on which the batch is to execute
  * @batch: the batch buffer in question
  * @batch_offset: byte offset in the batch at which execution starts
@@ -1578,7 +1578,7 @@ int intel_engine_cmd_parser(struct intel_engine_cs *engine,
 }
 
 /**
- * i915_cmd_parser_get_version() - get the cmd parser version number
+ * i915_cmd_parser_get_version - get the cmd parser version number
  * @dev_priv: i915 device private
  *
  * The cmd parser maintains a simple increasing integer version number suitable
diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index 8f486f77609f..ce859aedfd01 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -10,7 +10,7 @@
 #include <linux/bits.h>
 
 /**
- * REG_BIT() - Prepare a u32 bit value
+ * REG_BIT - Prepare a u32 bit value
  * @__n: 0-based bit number
  *
  * Local wrapper for BIT() to force u32, with compile time checks.
@@ -23,7 +23,7 @@
 				 ((__n) < 0 || (__n) > 31))))
 
 /**
- * REG_GENMASK() - Prepare a continuous u32 bitmask
+ * REG_GENMASK - Prepare a continuous u32 bitmask
  * @__high: 0-based high bit
  * @__low: 0-based low bit
  *
@@ -38,7 +38,7 @@
 				 ((__low) < 0 || (__high) > 31 || (__low) > (__high)))))
 
 /**
- * REG_GENMASK64() - Prepare a continuous u64 bitmask
+ * REG_GENMASK64 - Prepare a continuous u64 bitmask
  * @__high: 0-based high bit
  * @__low: 0-based low bit
  *
@@ -58,7 +58,7 @@
 #define IS_POWER_OF_2(__x)		((__x) && (((__x) & ((__x) - 1)) == 0))
 
 /**
- * REG_FIELD_PREP() - Prepare a u32 bitfield value
+ * REG_FIELD_PREP - Prepare a u32 bitfield value
  * @__mask: shifted mask defining the field's length and position
  * @__val: value to put in the field
  *
@@ -75,7 +75,7 @@
 	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))
 
 /**
- * REG_FIELD_GET() - Extract a u32 bitfield value
+ * REG_FIELD_GET - Extract a u32 bitfield value
  * @__mask: shifted mask defining the field's length and position
  * @__val: value to extract the bitfield value from
  *
@@ -87,7 +87,7 @@
 #define REG_FIELD_GET(__mask, __val)	((u32)FIELD_GET(__mask, __val))
 
 /**
- * REG_FIELD_GET64() - Extract a u64 bitfield value
+ * REG_FIELD_GET64 - Extract a u64 bitfield value
  * @__mask: shifted mask defining the field's length and position
  * @__val: value to extract the bitfield value from
  *
diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/intel_wopcm.c
index 322fb9eeb880..c66b3c173ed6 100644
--- a/drivers/gpu/drm/i915/intel_wopcm.c
+++ b/drivers/gpu/drm/i915/intel_wopcm.c
@@ -70,7 +70,7 @@ static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
 }
 
 /**
- * intel_wopcm_init_early() - Early initialization of the WOPCM.
+ * intel_wopcm_init_early - Early initialization of the WOPCM.
  * @wopcm: pointer to intel_wopcm.
  *
  * Setup the size of WOPCM which will be used by later on WOPCM partitioning.
@@ -217,7 +217,7 @@ static bool __wopcm_regs_writable(struct intel_uncore *uncore)
 }
 
 /**
- * intel_wopcm_init() - Initialize the WOPCM structure.
+ * intel_wopcm_init - Initialize the WOPCM structure.
  * @wopcm: pointer to intel_wopcm.
  *
  * This function will partition WOPCM space based on GuC and HuC firmware sizes
-- 
2.37.3

