Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A7D3DD527
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 14:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B66D6E037;
	Mon,  2 Aug 2021 12:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B32A6E037
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 12:06:39 +0000 (UTC)
Received: from BC-Mail-Ex27.internal.baidu.com (unknown [172.31.51.21])
 by Forcepoint Email with ESMTPS id 02451D2C7872B8E207E8;
 Mon,  2 Aug 2021 20:06:36 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex27.internal.baidu.com (172.31.51.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 2 Aug 2021 20:06:35 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 2 Aug 2021 20:06:35 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH v3] drm: Fix typo in comments
Date: Mon, 2 Aug 2021 20:06:29 +0800
Message-ID: <20210802120629.1478-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex01.internal.baidu.com (10.127.64.11) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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

fix typo for drm:
*achived ==> achieved
*userpace ==> userspace
*commited ==> committed
*depencies ==> dependencies
*preceeding ==> preceding
*similiar ==> similar
*accidently ==> accidentally
*transfered ==> transferred
*openeing ==> opening
*Propage ==> Propagate
*interpretes ==> interprets
*evry ==> every
*interruptable ==> interruptible
*Unfortunatley ==> Unfortunately
*Deterine ==> Determine
*non-existant ==> non-existent
*satifying ==> satisfying
*initalizing ==> initializing
*possibily ==> possibly
*accidently ==> accidentally
*firmare ==> firmware
*shuld ==> should
*apperture ==> aperture
*falure ==> failure
*inforamtion ==> information
*implemnt ==> implement
*paramter ==> parameter
*candiates ==> candidates
*identifer ==> identifier
*wil ==> will
*overlayed ==> overlaid
*accomodate ==> accommodate
*uniqe ==> unique
*intializes ==> initializes
*useable ==> usable
*arguement ==> argument
*destry ==> destroy
*savely ==> safely
*Unsinged ==> Unsigned
*unititialized ==> uninitialized
*draing ==> drawing
*invers ==> inverse
*Enpoint ==> Endpointc
*mimick ==> mimic
*fo ==> for
*functons ==> functions

v1->v2:
*respin with the change "iff ==> implies that"
v2->v3:
*revert the change of "iff" which means "if and only if"
*remove "Reviewed-by:"
*add other typo
*update changelog

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/drm_aperture.c            |  2 +-
 drivers/gpu/drm/drm_atomic.c              |  2 +-
 drivers/gpu/drm/drm_atomic_helper.c       | 14 +++++++-------
 drivers/gpu/drm/drm_atomic_uapi.c         |  6 +++---
 drivers/gpu/drm/drm_auth.c                |  2 +-
 drivers/gpu/drm/drm_bridge.c              |  2 +-
 drivers/gpu/drm/drm_bufs.c                |  2 +-
 drivers/gpu/drm/drm_cache.c               |  2 +-
 drivers/gpu/drm/drm_color_mgmt.c          |  2 +-
 drivers/gpu/drm/drm_damage_helper.c       |  2 +-
 drivers/gpu/drm/drm_dp_dual_mode_helper.c |  2 +-
 drivers/gpu/drm/drm_dp_helper.c           |  8 ++++----
 drivers/gpu/drm/drm_dp_mst_topology.c     |  2 +-
 drivers/gpu/drm/drm_drv.c                 |  4 ++--
 drivers/gpu/drm/drm_dsc.c                 |  2 +-
 drivers/gpu/drm/drm_edid.c                |  4 ++--
 drivers/gpu/drm/drm_fb_helper.c           |  4 ++--
 drivers/gpu/drm/drm_file.c                |  6 +++---
 drivers/gpu/drm/drm_format_helper.c       |  2 +-
 drivers/gpu/drm/drm_framebuffer.c         |  2 +-
 drivers/gpu/drm/drm_gem.c                 |  4 ++--
 drivers/gpu/drm/drm_gem_atomic_helper.c   |  4 ++--
 drivers/gpu/drm/drm_gem_shmem_helper.c    |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c     |  2 +-
 drivers/gpu/drm/drm_ioctl.c               |  4 ++--
 drivers/gpu/drm/drm_irq.c                 |  2 +-
 drivers/gpu/drm/drm_mm.c                  |  2 +-
 drivers/gpu/drm/drm_mode_object.c         |  2 +-
 drivers/gpu/drm/drm_modes.c               |  4 ++--
 drivers/gpu/drm/drm_plane.c               |  2 +-
 drivers/gpu/drm/drm_plane_helper.c        |  2 +-
 drivers/gpu/drm/drm_prime.c               |  2 +-
 drivers/gpu/drm/drm_probe_helper.c        |  2 +-
 drivers/gpu/drm/drm_property.c            |  2 +-
 drivers/gpu/drm/drm_syncobj.c             |  2 +-
 drivers/gpu/drm/drm_vblank.c              |  6 +++---
 36 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 9ac39cf11694..74bd4a76b253 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -78,7 +78,7 @@
  *
  * Drivers that are susceptible to being removed by other drivers, such as
  * generic EFI or VESA drivers, have to register themselves as owners of their
- * given framebuffer memory. Ownership of the framebuffer memory is achived
+ * given framebuffer memory. Ownership of the framebuffer memory is achieved
  * by calling devm_aperture_acquire_from_firmware(). On success, the driver
  * is the owner of the framebuffer range. The function fails if the
  * framebuffer is already by another driver. See below for an example.
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index d820423fac32..b127e30082ba 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -723,7 +723,7 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
  * clocks, scaler units, bandwidth and fifo limits shared among a group of
  * planes or CRTCs, and so on) it makes sense to model these as independent
  * objects. Drivers then need to do similar state tracking and commit ordering for
- * such private (since not exposed to userpace) objects as the atomic core and
+ * such private (since not exposed to userspace) objects as the atomic core and
  * helpers already provide for connectors, planes and CRTCs.
  *
  * To make this easier on drivers the atomic core provides some support to track
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f7bf1ea62d58..4d92036422ce 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1686,7 +1686,7 @@ static void commit_work(struct work_struct *work)
 }
 
 /**
- * drm_atomic_helper_async_check - check if state can be commited asynchronously
+ * drm_atomic_helper_async_check - check if state can be committed asynchronously
  * @dev: DRM device
  * @state: the driver state object
  *
@@ -1695,7 +1695,7 @@ static void commit_work(struct work_struct *work)
  * but just do in-place changes on the current state.
  *
  * It will return 0 if the commit can happen in an asynchronous fashion or error
- * if not. Note that error just mean it can't be commited asynchronously, if it
+ * if not. Note that error just mean it can't be committed asynchronously, if it
  * fails the commit should be treated like a normal synchronous commit.
  */
 int drm_atomic_helper_async_check(struct drm_device *dev,
@@ -2193,10 +2193,10 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
 
 /**
- * drm_atomic_helper_wait_for_dependencies - wait for required preceeding commits
+ * drm_atomic_helper_wait_for_dependencies - wait for required preceding commits
  * @old_state: atomic state object with old state structures
  *
- * This function waits for all preceeding commits that touch the same CRTC as
+ * This function waits for all preceding commits that touch the same CRTC as
  * @old_state to both be committed to the hardware (as signalled by
  * drm_atomic_helper_commit_hw_done()) and executed by the hardware (as signalled
  * by calling drm_crtc_send_vblank_event() on the &drm_crtc_state.event).
@@ -2581,9 +2581,9 @@ EXPORT_SYMBOL(drm_atomic_helper_commit_planes);
  * This function is useful when plane updates should be done CRTC-by-CRTC
  * instead of one global step like drm_atomic_helper_commit_planes() does.
  *
- * This function can only be savely used when planes are not allowed to move
+ * This function can only be safely used when planes are not allowed to move
  * between different CRTCs because this function doesn't handle inter-CRTC
- * depencies. Callers need to ensure that either no such depencies exist,
+ * dependencies. Callers need to ensure that either no such dependencies exist,
  * resolve them through ordering of commit calls or through some other means.
  */
 void
@@ -2720,7 +2720,7 @@ EXPORT_SYMBOL(drm_atomic_helper_cleanup_planes);
 /**
  * drm_atomic_helper_swap_state - store atomic state into current sw state
  * @state: atomic state
- * @stall: stall for preceeding commits
+ * @stall: stall for preceding commits
  *
  * This function stores the atomic state into the current state pointers in all
  * driver objects. It should be called after all failing steps have been done
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7e48d40600ff..909f31833181 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -48,7 +48,7 @@
  * in all its forms: The monster ATOMIC IOCTL itself, code for GET_PROPERTY and
  * SET_PROPERTY IOCTLs. Plus interface functions for compatibility helpers and
  * drivers which have special needs to construct their own atomic updates, e.g.
- * for load detect or similiar.
+ * for load detect or similar.
  */
 
 /**
@@ -753,7 +753,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		 * restore the state it wants on VT switch. So if the userspace
 		 * tries to change the link_status from GOOD to BAD, driver
 		 * silently rejects it and returns a 0. This prevents userspace
-		 * from accidently breaking  the display when it restores the
+		 * from accidentally breaking  the display when it restores the
 		 * state.
 		 */
 		if (state->link_status != DRM_LINK_STATUS_GOOD)
@@ -1064,7 +1064,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
  * DOC: explicit fencing properties
  *
  * Explicit fencing allows userspace to control the buffer synchronization
- * between devices. A Fence or a group of fences are transfered to/from
+ * between devices. A Fence or a group of fences are transferred to/from
  * userspace using Sync File fds and there are two DRM properties for that.
  * IN_FENCE_FD on each DRM Plane to send fences to the kernel and
  * OUT_FENCE_PTR on each DRM CRTC to receive fences from the kernel.
diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 3a64a6a79ade..eba438027539 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -52,7 +52,7 @@
  *
  * In addition only one &drm_master can be the current master for a &drm_device.
  * It can be switched through the DROP_MASTER and SET_MASTER IOCTL, or
- * implicitly through closing/openeing the primary device node. See also
+ * implicitly through closing/opening the primary device node. See also
  * drm_is_current_master().
  *
  * Clients can authenticate against the current master (if it matches their own)
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 11ec2846addb..a8ed66751c2d 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -982,7 +982,7 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
 	bridge_state->output_bus_cfg.flags = output_flags;
 
 	/*
-	 * Propage the output flags to the input end of the bridge. Again, it's
+	 * Propagate the output flags to the input end of the bridge. Again, it's
 	 * not necessarily what all bridges want, but that's what most of them
 	 * do, and by doing that by default we avoid forcing drivers to
 	 * duplicate the "dummy propagation" logic.
diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index ae8e4d76209c..fcca21e8efac 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -1502,7 +1502,7 @@ int drm_legacy_freebufs(struct drm_device *dev, void *data,
  *
  * Maps the AGP, SG or PCI buffer region with vm_mmap(), and copies information
  * about each buffer into user space. For PCI buffers, it calls vm_mmap() with
- * offset equal to 0, which drm_mmap() interpretes as PCI buffers and calls
+ * offset equal to 0, which drm_mmap() interprets as PCI buffers and calls
  * drm_mmap_dma().
  */
 int __drm_legacy_mapbufs(struct drm_device *dev, void *data, int *p,
diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 546599f19a93..30cc59fe6ef7 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -170,7 +170,7 @@ drm_clflush_virt_range(void *addr, unsigned long length)
 		for (; addr < end; addr += size)
 			clflushopt(addr);
 		clflushopt(end - 1); /* force serialisation */
-		mb(); /*Ensure that evry data cache line entry is flushed*/
+		mb(); /*Ensure that every data cache line entry is flushed*/
 		return;
 	}
 
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6..c864c103ede6 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -52,7 +52,7 @@
  *	&drm_crtc_state.degamma_lut.
  *
  * “DEGAMMA_LUT_SIZE”:
- *	Unsinged range property to give the size of the lookup table to be set
+ *	Unsigned range property to give the size of the lookup table to be set
  *	on the DEGAMMA_LUT property (the size depends on the underlying
  *	hardware). If drivers support multiple LUT sizes then they should
  *	publish the largest size, and sub-sample smaller sized LUTs (e.g. for
diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index 3a4126dc2520..dbc4312160a5 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -170,7 +170,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
 	int ret = 0;
 
 	/*
-	 * When called from ioctl, we are interruptable, but not when called
+	 * When called from ioctl, we are interruptible, but not when called
 	 * internally (ie. defio worker)
 	 */
 	drm_modeset_acquire_init(&ctx,
diff --git a/drivers/gpu/drm/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
index 9faf49354cab..cd4d2ae3b546 100644
--- a/drivers/gpu/drm/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/drm_dp_dual_mode_helper.c
@@ -191,7 +191,7 @@ enum drm_dp_dual_mode_type drm_dp_dual_mode_detect(const struct drm_device *dev,
 	 * Let's see if the adaptor is there the by reading the
 	 * HDMI ID registers.
 	 *
-	 * Note that type 1 DVI adaptors are not required to implemnt
+	 * Note that type 1 DVI adaptors are not required to implement
 	 * any registers, and that presents a problem for detection.
 	 * If the i2c transfer is nacked, we may or may not be dealing
 	 * with a type 1 DVI adaptor. Some other mechanism of detecting
diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index b5f75ca05774..ed3ed6d3da25 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -772,7 +772,7 @@ int drm_dp_downstream_max_tmds_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 		 * It's left up to the driver to check the
 		 * DP dual mode adapter's max TMDS clock.
 		 *
-		 * Unfortunatley it looks like branch devices
+		 * Unfortunately it looks like branch devices
 		 * may not fordward that the DP dual mode i2c
 		 * access so we just usually get i2c nak :(
 		 */
@@ -1365,7 +1365,7 @@ static int drm_dp_i2c_msg_duration(const struct drm_dp_aux_msg *msg,
 }
 
 /*
- * Deterine how many retries should be attempted to successfully transfer
+ * Determine how many retries should be attempted to successfully transfer
  * the specified message, based on the estimated durations of the
  * i2c and AUX transfers.
  */
@@ -1418,7 +1418,7 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 			/*
 			 * While timeouts can be errors, they're usually normal
 			 * behavior (for instance, when a driver tries to
-			 * communicate with a non-existant DisplayPort device).
+			 * communicate with a non-existent DisplayPort device).
 			 * Avoid spamming the kernel log with timeout errors.
 			 */
 			if (ret == -ETIMEDOUT)
@@ -3327,7 +3327,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	fxp = DIV_ROUND_CLOSEST(1000 * DP_EDP_BACKLIGHT_FREQ_BASE_KHZ, driver_pwm_freq_hz);
 
 	/* Use highest possible value of Pn for more granularity of brightness adjustment while
-	 * satifying the conditions below.
+	 * satisfying the conditions below.
 	 * - Pn is in the range of Pn_min and Pn_max
 	 * - F is in the range of 1 and 255
 	 * - FxP is within 25% of desired value.
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index ad0795afc21c..0e4171fe28ed 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -5894,7 +5894,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 				     DP_DSC_SUPPORT, &upstream_dsc, 1) != 1)
 			return NULL;
 
-		/* Enpoint decompression with DP-to-DP peer device */
+		/* Endpoint decompression with DP-to-DP peer device */
 		if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
 		    (endpoint_fec & DP_FEC_CAPABLE) &&
 		    (upstream_dsc & 0x2) /* DSC passthrough */)
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8804ec7d3215..7a5097467ba5 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -249,7 +249,7 @@ void drm_minor_release(struct drm_minor *minor)
  * Finally when everything is up and running and ready for userspace the device
  * instance can be published using drm_dev_register().
  *
- * There is also deprecated support for initalizing device instances using
+ * There is also deprecated support for initializing device instances using
  * bus-specific helpers and the &drm_driver.load callback. But due to
  * backwards-compatibility needs the device instance have to be published too
  * early, which requires unpretty global locking to make safe and is therefore
@@ -379,7 +379,7 @@ void drm_minor_release(struct drm_minor *minor)
  * shortcoming however, drm_dev_unplug() marks the drm_device as unplugged before
  * drm_atomic_helper_shutdown() is called. This means that if the disable code
  * paths are protected, they will not run on regular driver module unload,
- * possibily leaving the hardware enabled.
+ * possibly leaving the hardware enabled.
  */
 
 /**
diff --git a/drivers/gpu/drm/drm_dsc.c b/drivers/gpu/drm/drm_dsc.c
index ff602f7ec65b..0381d5dbeb6a 100644
--- a/drivers/gpu/drm/drm_dsc.c
+++ b/drivers/gpu/drm/drm_dsc.c
@@ -98,7 +98,7 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
 {
 	int i;
 
-	/* Protect against someone accidently changing struct size */
+	/* Protect against someone accidentlly changing struct size */
 	BUILD_BUG_ON(sizeof(*pps_payload) !=
 		     DP_SDP_PPS_HEADER_PAYLOAD_BYTES_MINUS_1 + 1);
 
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 81d5f2524246..6325877c5fd6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1919,7 +1919,7 @@ EXPORT_SYMBOL(drm_add_override_edid_modes);
  * level, drivers must make all reasonable efforts to expose it as an I2C
  * adapter and use drm_get_edid() instead of abusing this function.
  *
- * The EDID may be overridden using debugfs override_edid or firmare EDID
+ * The EDID may be overridden using debugfs override_edid or firmware EDID
  * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
  * order. Having either of them bypasses actual EDID reads.
  *
@@ -5906,7 +5906,7 @@ drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
 	 * (ie.vic==0 and s3d_struct==0) we will still send it if we
 	 * know that the sink can handle it. This is based on a
 	 * suggestion in HDMI 2.0 Appendix F. Apparently some sinks
-	 * have trouble realizing that they shuld switch from 3D to 2D
+	 * have trouble realizing that they should switch from 3D to 2D
 	 * mode if the source simply stops sending the infoframe when
 	 * it wants to switch from 3D to 2D.
 	 */
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d77a24507d30..ad70d1453fd5 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -565,9 +565,9 @@ struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
 		goto err_release;
 
 	/*
-	 * TODO: We really should be smarter here and alloc an apperture
+	 * TODO: We really should be smarter here and alloc an aperture
 	 * for each IORESOURCE_MEM resource helper->dev->dev has and also
-	 * init the ranges of the appertures based on the resources.
+	 * init the ranges of the apertures based on the resources.
 	 * Note some drivers currently count on there being only 1 empty
 	 * aperture and fill this themselves, these will need to be dealt
 	 * with somehow when fixing this.
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ceb1a9723855..d1f3891d39b5 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -405,7 +405,7 @@ static int drm_open_helper(struct file *filp, struct drm_minor *minor)
  *
  * RETURNS:
  *
- * 0 on success or negative errno value on falure.
+ * 0 on success or negative errno value on failure.
  */
 int drm_open(struct inode *inode, struct file *filp)
 {
@@ -880,9 +880,9 @@ EXPORT_SYMBOL(drm_send_event);
  * @flags: file creation mode (O_RDWR etc)
  *
  * This create a new struct file that wraps a DRM file context around a
- * DRM minor. This mimicks userspace opening e.g. /dev/dri/card0, but without
+ * DRM minor. This mimics userspace opening e.g. /dev/dri/card0, but without
  * invoking userspace. The struct file may be operated on using its f_op
- * (the drm_device.driver.fops) to mimick userspace operations, or be supplied
+ * (the drm_device.driver.fops) to mimic userspace operations, or be supplied
  * to userspace facing functions as an internal/anonymous client.
  *
  * RETURNS:
diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 0e885cd34107..5231104b1498 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -412,7 +412,7 @@ EXPORT_SYMBOL(drm_fb_blit_rect_dstclip);
  * of the display and the framebuffer mismatch, the copy function will
  * attempt to convert between them.
  *
- * See drm_fb_blit_rect_dstclip() for more inforamtion.
+ * See drm_fb_blit_rect_dstclip() for more information.
  *
  * Returns:
  * 0 on success, or a negative error code otherwise.
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 4d01464b6f95..a8ad0da225a7 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1090,7 +1090,7 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb)
 
 	/*
 	 * drm ABI mandates that we remove any deleted framebuffers from active
-	 * useage. But since most sane clients only remove framebuffers they no
+	 * usage. But since most sane clients only remove framebuffers they no
 	 * longer need, try to optimize this away.
 	 *
 	 * Since we're holding a reference ourselves, observing a refcount of 1
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 68deb1de8235..6c102ba2d9ac 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -901,7 +901,7 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * drm_gem_open - initalizes GEM file-private structures at devnode open time
+ * drm_gem_open - initializes GEM file-private structures at devnode open time
  * @dev: drm_device which is being opened by userspace
  * @file_private: drm file-private structure to set up
  *
@@ -936,7 +936,7 @@ drm_gem_release(struct drm_device *dev, struct drm_file *file_private)
  * drm_gem_object_release - release GEM buffer object resources
  * @obj: GEM buffer object
  *
- * This releases any structures and resources used by @obj and is the invers of
+ * This releases any structures and resources used by @obj and is the inverse of
  * drm_gem_object_init().
  */
 void
diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index 26af09b959d4..86b3c676e0b1 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -52,7 +52,7 @@
  *
  * The helpers for shadow-buffered planes establish and release mappings,
  * and provide struct drm_shadow_plane_state, which stores the plane's mapping
- * for commit-tail functons.
+ * for commit-tail functions.
  *
  * Shadow-buffered planes can easily be enabled by using the provided macros
  * %DRM_GEM_SHADOW_PLANE_FUNCS and %DRM_GEM_SHADOW_PLANE_HELPER_FUNCS.
@@ -374,7 +374,7 @@ EXPORT_SYMBOL(drm_gem_prepare_shadow_fb);
  * This function implements struct &drm_plane_helper_funcs.cleanup_fb.
  * This function unmaps all buffer objects of the plane's framebuffer.
  *
- * See drm_gem_prepare_shadow_fb() for more inforamtion.
+ * See drm_gem_prepare_shadow_fb() for more information.
  */
 void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
 {
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d5e6d4568f99..a61946374c82 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -368,7 +368,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 }
 
 /*
- * drm_gem_shmem_vunmap - Unmap a virtual mapping fo a shmem GEM object
+ * drm_gem_shmem_vunmap - Unmap a virtual mapping for a shmem GEM object
  * @shmem: shmem GEM object
  * @map: Kernel virtual address where the SHMEM GEM object was mapped
  *
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 1e9b82e51a07..43cf7e887d1a 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -96,7 +96,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  * memory region. Call drm_gem_vram_offset() to retrieve this value. Typically
  * it's used to program the hardware's scanout engine for framebuffers, set
  * the cursor overlay's image for a mouse cursor, or use it as input to the
- * hardware's draing engine.
+ * hardware's drawing engine.
  *
  * To access a buffer object's memory from the DRM driver, call
  * drm_gem_vram_vmap(). It maps the buffer into kernel address
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f454e0424086..be4a52dc4d6f 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -426,7 +426,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
 }
 
 /**
- * drm_noop - DRM no-op ioctl implemntation
+ * drm_noop - DRM no-op ioctl implementation
  * @dev: DRM device for the ioctl
  * @data: data pointer for the ioctl
  * @file_priv: DRM file for the ioctl call
@@ -446,7 +446,7 @@ int drm_noop(struct drm_device *dev, void *data,
 EXPORT_SYMBOL(drm_noop);
 
 /**
- * drm_invalid_op - DRM invalid ioctl implemntation
+ * drm_invalid_op - DRM invalid ioctl implementation
  * @dev: DRM device for the ioctl
  * @data: data pointer for the ioctl
  * @file_priv: DRM file for the ioctl call
diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index 201eae4bba6c..4a853011549a 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -72,7 +72,7 @@
  * The DRM core provides very simple support helpers to enable IRQ handling on a
  * device through the drm_irq_install() and drm_irq_uninstall() functions. This
  * only supports devices with a single interrupt on the main device stored in
- * &drm_device.dev and set as the device paramter in drm_dev_alloc().
+ * &drm_device.dev and set as the device parameter in drm_dev_alloc().
  *
  * These IRQ helpers are strictly optional. Since these helpers don't automatically
  * clean up the requested interrupt like e.g. devm_request_irq() they're not really
diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index a4a04d246135..93d48a6f04ab 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -700,7 +700,7 @@ EXPORT_SYMBOL(drm_mm_replace_node);
  * interfaces. First a scan operation needs to be initialized with
  * drm_mm_scan_init() or drm_mm_scan_init_with_range(). The driver adds
  * objects to the roster, probably by walking an LRU list, but this can be
- * freely implemented. Eviction candiates are added using
+ * freely implemented. Eviction candidates are added using
  * drm_mm_scan_add_block() until a suitable hole is found or there are no
  * further evictable objects. Eviction roster metadata is tracked in &struct
  * drm_mm_scan.
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index b26588b52795..86d9e907c0b2 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -91,7 +91,7 @@ void drm_mode_object_register(struct drm_device *dev,
 }
 
 /**
- * drm_mode_object_unregister - free a modeset identifer
+ * drm_mode_object_unregister - free a modeset identifier
  * @dev: DRM device
  * @object: object to free
  *
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ae53ea624c73..3b77dfdaeaa0 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1542,7 +1542,7 @@ static int drm_mode_parse_cmdline_int(const char *delim, unsigned int *int_ret)
 
 	/*
 	 * delim must point to the '=', otherwise it is a syntax error and
-	 * if delim points to the terminating zero, then delim + 1 wil point
+	 * if delim points to the terminating zero, then delim + 1 will point
 	 * past the end of the string.
 	 */
 	if (*delim != '=')
@@ -1972,7 +1972,7 @@ int drm_mode_convert_umode(struct drm_device *dev,
 	out->flags = in->flags;
 	/*
 	 * Old xf86-video-vmware (possibly others too) used to
-	 * leave 'type' unititialized. Just ignore any bits we
+	 * leave 'type' uninititialized. Just ignore any bits we
 	 * don't like. It's a just hint after all, and more
 	 * useful for the kernel->userspace direction anyway.
 	 */
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index b373958ecb30..98ca1801253b 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -38,7 +38,7 @@
 /**
  * DOC: overview
  *
- * A plane represents an image source that can be blended with or overlayed on
+ * A plane represents an image source that can be blended with or overlaid on
  * top of a CRTC during the scanout process. Planes take their input data from a
  * &drm_framebuffer object. The plane itself specifies the cropping and scaling
  * of that image, and where it is placed on the visible area of a display
diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index 3aae7ea522f2..5b2d0ca03705 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -210,7 +210,7 @@ static int drm_primary_helper_update(struct drm_plane *plane, struct drm_crtc *c
 	 * We call set_config() directly here rather than using
 	 * drm_mode_set_config_internal.  We're reprogramming the same
 	 * connectors that were already in use, so we shouldn't need the extra
-	 * cross-CRTC fb refcounting to accomodate stealing connectors.
+	 * cross-CRTC fb refcounting to accommodate stealing connectors.
 	 * drm_mode_setplane() already handles the basic refcounting for the
 	 * framebuffers involved in this operation.
 	 */
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 2a54f86856af..3085858272c6 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -73,7 +73,7 @@
  * Thus the chain of references always flows in one direction, avoiding loops:
  * importing GEM object -> dma-buf -> exported GEM bo. A further complication
  * are the lookup caches for import and export. These are required to guarantee
- * that any given object will always have only one uniqe userspace handle. This
+ * that any given object will always have only one unique userspace handle. This
  * is required to allow userspace to detect duplicated imports, since some GEM
  * drivers do fail command submissions if a given buffer object is listed more
  * than once. These import and export caches in &drm_prime_file_private only
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index e7e1ee2aa352..5606bca3caa8 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -757,7 +757,7 @@ EXPORT_SYMBOL(drm_kms_helper_poll_disable);
  * drm_kms_helper_poll_init - initialize and enable output polling
  * @dev: drm_device
  *
- * This function intializes and then also enables output polling support for
+ * This function initializes and then also enables output polling support for
  * @dev. Drivers which do not have reliable hotplug support in hardware can use
  * this helper infrastructure to regularly poll such connectors for changes in
  * their connection state.
diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 27c824a6eb60..6c353c9dc772 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -434,7 +434,7 @@ EXPORT_SYMBOL(drm_property_add_enum);
 /**
  * drm_property_destroy - destroy a drm property
  * @dev: drm device
- * @property: property to destry
+ * @property: property to destroy
  *
  * This function frees a property including any attached resources like
  * enumeration values.
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 1c5b9ef6da37..c9a9d74f338c 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -725,7 +725,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 	return ret;
 }
 /**
- * drm_syncobj_open - initalizes syncobj file-private structures at devnode open time
+ * drm_syncobj_open - initializes syncobj file-private structures at devnode open time
  * @file_private: drm file-private structure to set up
  *
  * Called at device open time, sets up the structure for handling refcounting
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index bba6781cc48f..63ee3ea87478 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -191,7 +191,7 @@ static u32 drm_max_vblank_count(struct drm_device *dev, unsigned int pipe)
 
 /*
  * "No hw counter" fallback implementation of .get_vblank_counter() hook,
- * if there is no useable hardware frame counter available.
+ * if there is no usable hardware frame counter available.
  */
 static u32 drm_vblank_no_hw_counter(struct drm_device *dev, unsigned int pipe)
 {
@@ -2014,7 +2014,7 @@ EXPORT_SYMBOL(drm_crtc_handle_vblank);
  * Get crtc VBLANK count.
  *
  * \param dev DRM device
- * \param data user arguement, pointing to a drm_crtc_get_sequence structure.
+ * \param data user argument, pointing to a drm_crtc_get_sequence structure.
  * \param file_priv drm file private for the user's open file descriptor
  */
 
@@ -2070,7 +2070,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
  * Queue a event for VBLANK sequence
  *
  * \param dev DRM device
- * \param data user arguement, pointing to a drm_crtc_queue_sequence structure.
+ * \param data user argument, pointing to a drm_crtc_queue_sequence structure.
  * \param file_priv drm file private for the user's open file descriptor
  */
 
-- 
2.25.1

