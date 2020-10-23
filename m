Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548E6297419
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1326F8BD;
	Fri, 23 Oct 2020 16:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1104A6E145;
 Fri, 23 Oct 2020 16:33:49 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C7AB24688;
 Fri, 23 Oct 2020 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603470828;
 bh=Sylq2e9ar6D8YYBJCExBwyy0BcyrCcVrtoDLcGb4uUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VUj6i8Y8HNWPeUNZ1P2n+KaKqel8o67TTEPI8blw1occ/hgvw4kX29dW0eNPMB98F
 D5Jj74KlVqUrMRwMY8oilG0GrzBMJnif1KDrWcfyLxs8MDO4EWXxTAis3kVVTIrr+U
 OuM5zzitEei8v+WFYPJubCiV710gjDlGR4Bzm10s=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kW00f-002Avm-2w; Fri, 23 Oct 2020 18:33:45 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v3 12/56] drm: fix some kernel-doc markups
Date: Fri, 23 Oct 2020 18:32:59 +0200
Message-Id: <67949ee046ffcc9220c6dde4bd34eca5840ef504.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Steven Price <steven.price@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Yintian Tao <yttao@amd.com>, Wambui Karuga <wambui.karugax@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 changzhu <Changfeng.Zhu@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some identifiers have different names between their prototypes
and the kernel-doc markup.

Others need to be fixed, as kernel-doc markups should use this format:
        identifier - description

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c     | 2 +-
 drivers/gpu/drm/drm_connector.c               | 3 ++-
 drivers/gpu/drm/drm_dp_helper.c               | 2 +-
 drivers/gpu/drm/drm_framebuffer.c             | 2 +-
 drivers/gpu/drm/drm_gem.c                     | 4 ++--
 drivers/gpu/drm/drm_gem_vram_helper.c         | 2 +-
 drivers/gpu/drm/drm_mode_object.c             | 2 +-
 drivers/gpu/drm/drm_modes.c                   | 4 ++--
 drivers/gpu/drm/drm_scdc_helper.c             | 2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 2 +-
 drivers/gpu/drm/i915/i915_gem_evict.c         | 2 +-
 drivers/gpu/drm/i915/i915_perf.c              | 8 +++++---
 drivers/gpu/drm/scheduler/sched_main.c        | 2 +-
 drivers/gpu/drm/v3d/v3d_sched.c               | 2 +-
 drivers/gpu/drm/vc4/vc4_bo.c                  | 2 +-
 include/drm/drm_atomic_helper.h               | 4 ++--
 include/drm/drm_connector.h                   | 2 +-
 include/drm/drm_device.h                      | 2 +-
 include/drm/drm_dsc.h                         | 3 ++-
 include/drm/drm_gem_vram_helper.h             | 8 ++++----
 20 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 9ad74045158e..ddcf5c2c8e6a 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -543,7 +543,7 @@ void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
 EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
 
 /**
- * __drm_atomic_helper_private_duplicate_state - copy atomic private state
+ * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state
  * @obj: CRTC object
  * @state: new private object state
  *
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 717c4e7271b0..9dde11466cc2 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1427,7 +1427,8 @@ void drm_hdmi_avi_infoframe_content_type(struct hdmi_avi_infoframe *frame,
 EXPORT_SYMBOL(drm_hdmi_avi_infoframe_content_type);
 
 /**
- * drm_mode_attach_tv_margin_properties - attach TV connector margin properties
+ * drm_connector_attach_tv_margin_properties - attach TV connector margin
+ * 	properties
  * @connector: DRM connector
  *
  * Called by a driver when it needs to attach TV margin props to a connector.
diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index deeed73f4ed6..485c3e78ba98 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1084,7 +1084,7 @@ drm_dp_subconnector_type(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 EXPORT_SYMBOL(drm_dp_subconnector_type);
 
 /**
- * drm_mode_set_dp_subconnector_property - set subconnector for DP connector
+ * drm_dp_set_subconnector_property - set subconnector for DP connector
  * @connector: connector to set property on
  * @status: connector status
  * @dpcd: DisplayPort configuration data
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 2f5b0c2bb0fe..aca62ed51e82 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -552,7 +552,7 @@ int drm_mode_getfb(struct drm_device *dev,
 }
 
 /**
- * drm_mode_getfb2 - get extended FB info
+ * drm_mode_getfb2_ioctl - get extended FB info
  * @dev: drm device for the ioctl
  * @data: data pointer for the ioctl
  * @file_priv: drm file for the ioctl call
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 19d73868490e..74af32106cae 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -873,7 +873,7 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * drm_gem_open - implementation of the GEM_OPEN ioctl
+ * drm_gem_open_ioctl - implementation of the GEM_OPEN ioctl
  * @dev: drm_device
  * @data: ioctl data
  * @file_priv: drm file-private structure
@@ -918,7 +918,7 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * gem_gem_open - initalizes GEM file-private structures at devnode open time
+ * drm_gem_open - initalizes GEM file-private structures at devnode open time
  * @dev: drm_device which is being opened by userspace
  * @file_private: drm file-private structure to set up
  *
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 50cad0e4a92e..e81f6954d233 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -640,7 +640,7 @@ static void drm_gem_vram_object_free(struct drm_gem_object *gem)
  */
 
 /**
- * drm_gem_vram_driver_create_dumb() - \
+ * drm_gem_vram_driver_dumb_create() - \
 	Implements &struct drm_driver.dumb_create
  * @file:		the DRM file
  * @dev:		the DRM device
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index db05f386a709..b26588b52795 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -115,7 +115,7 @@ void drm_mode_object_unregister(struct drm_device *dev,
 }
 
 /**
- * drm_lease_required - check types which must be leased to be used
+ * drm_mode_object_lease_required - check types which must be leased to be used
  * @type: type of object
  *
  * Returns whether the provided type of drm_mode_object must
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 501b4fe55a3d..33fb2f05ce66 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1889,7 +1889,7 @@ drm_mode_create_from_cmdline_mode(struct drm_device *dev,
 EXPORT_SYMBOL(drm_mode_create_from_cmdline_mode);
 
 /**
- * drm_crtc_convert_to_umode - convert a drm_display_mode into a modeinfo
+ * drm_mode_convert_to_umode - convert a drm_display_mode into a modeinfo
  * @out: drm_mode_modeinfo struct to return to the user
  * @in: drm_display_mode to use
  *
@@ -1941,7 +1941,7 @@ void drm_mode_convert_to_umode(struct drm_mode_modeinfo *out,
 }
 
 /**
- * drm_crtc_convert_umode - convert a modeinfo into a drm_display_mode
+ * drm_mode_convert_umode - convert a modeinfo into a drm_display_mode
  * @dev: drm device
  * @out: drm_display_mode to return to the user
  * @in: drm_mode_modeinfo to use
diff --git a/drivers/gpu/drm/drm_scdc_helper.c b/drivers/gpu/drm/drm_scdc_helper.c
index 311e71bbba5b..991b8c86d78d 100644
--- a/drivers/gpu/drm/drm_scdc_helper.c
+++ b/drivers/gpu/drm/drm_scdc_helper.c
@@ -125,7 +125,7 @@ ssize_t drm_scdc_write(struct i2c_adapter *adapter, u8 offset,
 EXPORT_SYMBOL(drm_scdc_write);
 
 /**
- * drm_scdc_check_scrambling_status - what is status of scrambling?
+ * drm_scdc_get_scrambling_status - what is status of scrambling?
  * @adapter: I2C adapter for DDC channel
  *
  * Reads the scrambler status over SCDC, and checks the
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index e08684e34078..8abbae8f8808 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4531,7 +4531,7 @@ void intel_dpll_sanitize_state(struct drm_i915_private *i915)
 }
 
 /**
- * intel_shared_dpll_dump_hw_state - write hw_state to dmesg
+ * intel_dpll_dump_hw_state - write hw_state to dmesg
  * @dev_priv: i915 drm device
  * @hw_state: hw state to be written to the log
  *
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index 6501939929d5..e1a66c8245b8 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -238,7 +238,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
 }
 
 /**
- * i915_gem_evict_for_vma - Evict vmas to make room for binding a new one
+ * i915_gem_evict_for_node - Evict vmas to make room for binding a new one
  * @vm: address space to evict from
  * @target: range (and color) to evict for
  * @flags: additional flags to control the eviction algorithm
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index e94976976571..3ced82820483 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -625,7 +625,8 @@ static int append_oa_sample(struct i915_perf_stream *stream,
 }
 
 /**
- * Copies all buffered OA reports into userspace read() buffer.
+ * gen8_append_oa_reports - Copies all buffered OA reports into
+ *			    userspace read() buffer.
  * @stream: An i915-perf stream opened for OA metrics
  * @buf: destination buffer given by userspace
  * @count: the number of bytes userspace wants to read
@@ -917,7 +918,8 @@ static int gen8_oa_read(struct i915_perf_stream *stream,
 }
 
 /**
- * Copies all buffered OA reports into userspace read() buffer.
+ * gen7_append_oa_reports - Copies all buffered OA reports into
+ *			    userspace read() buffer.
  * @stream: An i915-perf stream opened for OA metrics
  * @buf: destination buffer given by userspace
  * @count: the number of bytes userspace wants to read
@@ -3227,7 +3229,7 @@ static long i915_perf_config_locked(struct i915_perf_stream *stream,
 }
 
 /**
- * i915_perf_ioctl - support ioctl() usage with i915 perf stream FDs
+ * i915_perf_ioctl_locked - support ioctl() usage with i915 perf stream FDs
  * @stream: An i915 perf stream
  * @cmd: the ioctl request
  * @arg: the ioctl data
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 9a0d77a68018..c6332d75025e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -446,7 +446,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 EXPORT_SYMBOL(drm_sched_stop);
 
 /**
- * drm_sched_job_recovery - recover jobs after a reset
+ * drm_sched_start - recover jobs after a reset
  *
  * @sched: scheduler instance
  * @full_recovery: proceed with complete sched restart
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 0747614a78f0..f968f389633a 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -64,7 +64,7 @@ v3d_job_free(struct drm_sched_job *sched_job)
 }
 
 /**
- * Returns the fences that the job depends on, one by one.
+ * v3d_job_dependency - Returns the fences that the job depends on, one by one.
  *
  * If placed in the scheduler's .dependency method, the corresponding
  * .run_job won't be called until all of them have been signaled.
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 74ceebd62fbc..b8c04c6eb7f9 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -375,7 +375,7 @@ static struct vc4_bo *vc4_bo_get_from_cache(struct drm_device *dev,
 }
 
 /**
- * vc4_gem_create_object - Implementation of driver->gem_create_object.
+ * vc4_create_object - Implementation of driver->gem_create_object.
  * @dev: DRM device
  * @size: Size in bytes of the memory the object will reference
  *
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 85df04c8e62f..5f47720440fa 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -167,7 +167,7 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
 	drm_for_each_plane_mask(plane, (crtc)->dev, (crtc)->state->plane_mask)
 
 /**
- * drm_crtc_atomic_state_for_each_plane - iterate over attached planes in new state
+ * drm_atomic_crtc_state_for_each_plane - iterate over attached planes in new state
  * @plane: the loop cursor
  * @crtc_state: the incoming CRTC state
  *
@@ -180,7 +180,7 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
 	drm_for_each_plane_mask(plane, (crtc_state)->state->dev, (crtc_state)->plane_mask)
 
 /**
- * drm_crtc_atomic_state_for_each_plane_state - iterate over attached planes in new state
+ * drm_atomic_crtc_state_for_each_plane_state - iterate over attached planes in new state
  * @plane: the loop cursor
  * @plane_state: loop cursor for the plane's state, must be const
  * @crtc_state: the incoming CRTC state
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 928136556174..fcdc58d8b88b 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -84,7 +84,7 @@ enum drm_connector_status {
 };
 
 /**
- * enum drm_connector_registration_status - userspace registration status for
+ * enum drm_connector_registration_state - userspace registration status for
  * a &drm_connector
  *
  * This enum is used to track the status of initializing a connector and
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index f4f68e7a9149..3ae248938305 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -27,7 +27,7 @@ struct pci_controller;
 
 
 /**
- * enum drm_switch_power - power state of drm device
+ * enum switch_power_state - power state of drm device
  */
 
 enum switch_power_state {
diff --git a/include/drm/drm_dsc.h b/include/drm/drm_dsc.h
index 732f32740c86..53c51231b31c 100644
--- a/include/drm/drm_dsc.h
+++ b/include/drm/drm_dsc.h
@@ -273,7 +273,8 @@ struct drm_dsc_config {
 };
 
 /**
- * struct picture_parameter_set - Represents 128 bytes of Picture Parameter Set
+ * struct drm_dsc_picture_parameter_set - Represents 128 bytes of
+ * 	Picture Parameter Set
  *
  * The VESA DSC standard defines picture parameter set (PPS) which display
  * stream compression encoders must communicate to decoders.
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 62cc6e6c3a4f..9a67dcca1f4a 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -69,8 +69,8 @@ struct drm_gem_vram_object {
 };
 
 /**
- * Returns the container of type &struct drm_gem_vram_object
- * for field bo.
+ * drm_gem_vram_of_bo - Returns the container of type
+ * &struct drm_gem_vram_object for field bo.
  * @bo:		the VRAM buffer object
  * Returns:	The containing GEM VRAM object
  */
@@ -81,8 +81,8 @@ static inline struct drm_gem_vram_object *drm_gem_vram_of_bo(
 }
 
 /**
- * Returns the container of type &struct drm_gem_vram_object
- * for field gem.
+ * drm_gem_vram_of_gem - Returns the container of type
+ * &struct drm_gem_vram_object for field gem.
  * @gem:	the GEM object
  * Returns:	The containing GEM VRAM object
  */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
