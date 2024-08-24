Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A076895DD0C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 10:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1363210E14A;
	Sat, 24 Aug 2024 08:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="FRizWrQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 542 seconds by postgrey-1.36 at gabe;
 Sat, 24 Aug 2024 08:43:49 UTC
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com
 [203.205.221.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B82910E0F2;
 Sat, 24 Aug 2024 08:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1724489027;
 bh=GqD0dNxYsVmHoVqh3BS7VvlvMYcVSpaC9khgDuoOsGg=;
 h=From:To:Cc:Subject:Date;
 b=FRizWrQgP4ABD00haiCZkVZfVUapCnYmpeIYnVTPO/x6h8EVcebfDFY7I6Y957kPn
 usHTdVhARQLTcIq+hDktIYG0mKiwNGvIrKQWTWy6OiozUP83ZvwZhir07mgsKMr4Mv
 5hAzqUIXpdAh1qY8Xx5zEoYniCQUO+4C6W3MJlSw=
Received: from localhost.localdomain ([171.223.167.119])
 by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
 id 95686C80; Sat, 24 Aug 2024 16:37:22 +0800
X-QQ-mid: xmsmtpt1724488642tmx3cgwo5
Message-ID: <tencent_37A873672B5CD20DECAF99DEDAC5E45C3106@qq.com>
X-QQ-XMAILINFO: NDThSsAYNNx43f7PwJDTyJAaaaPPoFZF1BPpvq4KmCDoYwRd0ysexA/H4TXjO3
 JSFhoPEL8uHwLVxrtMp71/IORyBcIw/cfBeFOwgg5aDP2/3MHcVSVsxJ7tLFutShhntY2pSzffHa
 N9CsNnj5WICzAhP3jtJJqVZPmOMTy+Zrgmqhl8Jd6UpI0yyMG8KLgHNwlWcrvVzFDYjPWf8UW0rn
 CDAiLL+BT6LyI6V8UdYbVKrLiass9RfclDYuwNQLLo3m8rMO70h4vI5G/mRbEeX9Av/cwZdGGqg6
 MYB5X/blUQTjOMhA80PoMVEanaGcRVlWvzomJ19J7AOr6hFZ7466XM541kodTHuYjfJAiKSPCH1N
 TrcyVyhpiEHzGyAohCKlENzYBg6vZB3KjYB5RJG8UIiVndyBN2Z3+d306eBF9SYsOiHHJoPioxxv
 aHXRkwU1dNbk4oxvpCdJ7fvGQWsdWT/hDsJ87wiIr2VrulnLMs0Ehhtha48rDa0gzPgzJvDB1LA4
 x2n+tPx9kLa1EALKdcxd/tXomIfhoAxSMysR7No2bdVK1zwK/6qGkiQ/1CjTRTWf4QZ3awXq32f0
 5UyI7ecwosRU/JzL923Pn3EL9njjNOqO/ORb27f/uUjYZhZUoa3u4fSIh6fuSJ0CcWPFOzD2mhaP
 tSni5TEiFL0Q1mES1/o9dz699tC4IdB3Z7HHXc9dvHenpPL6aS05KCSAmZPqaMIjOhs6rDWqF5j6
 yfdHzB7b7ju/Y+ZKgPBntqECesxuEvW3g9JA+Lf5kzE+ek5Gkl9SsOa2LxRDVk8jdlbiOH1MAV8l
 n746jlkrxVTKyQ67BBK521zrrf1DIDTEF1DjK3gafW4V97YttWfC5kjeaWfo7XnA3Cwl52twrv3e
 6yQ7S6Ji4BegBr37Rrg7ksusEiTZulH/QwcDpC4QQFFcxAhXTsmncT9nTpCaOwc25tEIN1OWjZi3
 C1l+px0rmKV4riU5koLKtCIZ++FTFEpThap3ZiDurjRm8MhwHr0axXTShr2MzvFx+0rdUZhe5Y+h
 Psbuw0nFa2ulKTxd2GSUkGr0XNhJuzuvEYZSqBP1/HpABuHP6kVMhP5gkNU9E=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: renjun wang <renjunw0@foxmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, lyude@redhat.com,
 imre.deak@intel.com, Wayne.Lin@amd.com, ville.syrjala@linux.intel.com,
 vidya.srinivas@intel.com, renjunw0@foxmail.com, jouni.hogander@intel.com,
 andi.shyti@linux.intel.com, janusz.krzysztofik@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm: Fix kerneldoc for "Returns" section
Date: Sat, 24 Aug 2024 16:36:34 +0800
X-OQ-MSGID: <20240824083634.27111-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 24 Aug 2024 08:50:06 +0000
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

The blank line between title "Returns:" and detail description is not
allowed, otherwise the title will goes under the description block in
generated .html file after running `make htmldocs`.

There are a few examples for current kerneldoc:
https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#c.drm_crtc_commit_wait
https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#c.drm_atomic_get_crtc_state
https://www.kernel.org/doc/html/latest/gpu/i915.html#c.i915_vma_pin_fence

Signed-off-by: renjun wang <renjunw0@foxmail.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 ----
 drivers/gpu/drm/drm_atomic.c                  | 6 ------
 drivers/gpu/drm/drm_atomic_helper.c           | 2 --
 drivers/gpu/drm/drm_file.c                    | 7 -------
 drivers/gpu/drm/drm_gem.c                     | 7 ++-----
 drivers/gpu/drm/drm_modes.c                   | 1 -
 drivers/gpu/drm/drm_rect.c                    | 1 -
 drivers/gpu/drm/drm_vblank.c                  | 2 --
 drivers/gpu/drm/i915/gem/i915_gem_object.h    | 1 -
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  | 1 -
 drivers/gpu/drm/i915/i915_vma.h               | 1 -
 11 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index fc2ceae61db2..e68d23997d53 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5569,7 +5569,6 @@ EXPORT_SYMBOL(drm_dp_mst_atomic_check_mgr);
  * drm_dp_atomic_release_time_slots()
  *
  * Returns:
- *
  * 0 if the new state is valid, negative error code otherwise.
  */
 int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
@@ -5606,7 +5605,6 @@ EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
  * topology object.
  *
  * RETURNS:
- *
  * The MST topology state or error pointer.
  */
 struct drm_dp_mst_topology_state *drm_atomic_get_mst_topology_state(struct drm_atomic_state *state,
@@ -5626,7 +5624,6 @@ EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
  * topology object.
  *
  * Returns:
- *
  * The old MST topology state, or NULL if there's no topology state for this MST mgr
  * in the global atomic state
  */
@@ -5651,7 +5648,6 @@ EXPORT_SYMBOL(drm_atomic_get_old_mst_topology_state);
  * topology object.
  *
  * Returns:
- *
  * The new MST topology state, or NULL if there's no topology state for this MST mgr
  * in the global atomic state
  */
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 6e516c39a372..0fc99da93afe 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -63,7 +63,6 @@ EXPORT_SYMBOL(__drm_crtc_commit_free);
  * hardware and flipped to.
  *
  * Returns:
- *
  * 0 on success, a negative error code otherwise.
  */
 int drm_crtc_commit_wait(struct drm_crtc_commit *commit)
@@ -337,7 +336,6 @@ EXPORT_SYMBOL(__drm_atomic_state_free);
  * not created by userspace through an IOCTL call.
  *
  * Returns:
- *
  * Either the allocated state or the error code encoded into the pointer. When
  * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
  * entire atomic sequence must be restarted. All other errors are fatal.
@@ -518,7 +516,6 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
  * is consistent.
  *
  * Returns:
- *
  * Either the allocated state or the error code encoded into the pointer. When
  * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
  * entire atomic sequence must be restarted. All other errors are fatal.
@@ -828,7 +825,6 @@ EXPORT_SYMBOL(drm_atomic_private_obj_fini);
  * object lock to make sure that the state is consistent.
  *
  * RETURNS:
- *
  * Either the allocated state or the error code encoded into a pointer.
  */
 struct drm_private_state *
@@ -1061,7 +1057,6 @@ EXPORT_SYMBOL(drm_atomic_get_new_crtc_for_encoder);
  * make sure that the state is consistent.
  *
  * Returns:
- *
  * Either the allocated state or the error code encoded into the pointer. When
  * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
  * entire atomic sequence must be restarted. All other errors are fatal.
@@ -1169,7 +1164,6 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
  * state is consistent.
  *
  * Returns:
- *
  * Either the allocated state or the error code encoded into the pointer. When
  * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
  * entire atomic sequence must be restarted.
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index fb97b51b38f1..43cdf39019a4 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2266,7 +2266,6 @@ crtc_or_fake_commit(struct drm_atomic_state *state, struct drm_crtc *crtc)
  * automatically.
  *
  * Returns:
- *
  * 0 on success. -EBUSY when userspace schedules nonblocking commits too fast,
  * -ENOMEM on allocation failures and -EINTR when a signal is pending.
  */
@@ -3009,7 +3008,6 @@ EXPORT_SYMBOL(drm_atomic_helper_cleanup_planes);
  * don't pass the right state structures to the callbacks.
  *
  * Returns:
- *
  * Returns 0 on success. Can return -ERESTARTSYS when @stall is true and the
  * waiting for the previous commits has been interrupted.
  */
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 714e42b05108..7beed6902208 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -355,7 +355,6 @@ int drm_open_helper(struct file *filp, struct drm_minor *minor)
  * resources for it. It also calls the &drm_driver.open driver callback.
  *
  * RETURNS:
- *
  * 0 on success or negative errno value on failure.
  */
 int drm_open(struct inode *inode, struct file *filp)
@@ -417,7 +416,6 @@ void drm_lastclose(struct drm_device * dev)
  * DRM device also proceeds to call the &drm_driver.lastclose driver callback.
  *
  * RETURNS:
- *
  * Always succeeds and returns 0.
  */
 int drm_release(struct inode *inode, struct file *filp)
@@ -489,7 +487,6 @@ void drm_file_update_pid(struct drm_file *filp)
  * call the &drm_driver.lastclose driver callback.
  *
  * RETURNS:
- *
  * Always succeeds and returns 0.
  */
 int drm_release_noglobal(struct inode *inode, struct file *filp)
@@ -532,7 +529,6 @@ EXPORT_SYMBOL(drm_release_noglobal);
  * safety.
  *
  * RETURNS:
- *
  * Number of bytes read (always aligned to full events, and can be 0) or a
  * negative error code on failure.
  */
@@ -618,7 +614,6 @@ EXPORT_SYMBOL(drm_read);
  * See also drm_read().
  *
  * RETURNS:
- *
  * Mask of POLL flags indicating the current status of the file.
  */
 __poll_t drm_poll(struct file *filp, struct poll_table_struct *wait)
@@ -656,7 +651,6 @@ EXPORT_SYMBOL(drm_poll);
  * already hold &drm_device.event_lock.
  *
  * RETURNS:
- *
  * 0 on success or a negative error code on failure.
  */
 int drm_event_reserve_init_locked(struct drm_device *dev,
@@ -698,7 +692,6 @@ EXPORT_SYMBOL(drm_event_reserve_init_locked);
  * drm_event_reserve_init_locked() instead.
  *
  * RETURNS:
- *
  * 0 on success or a negative error code on failure.
  */
 int drm_event_reserve_init(struct drm_device *dev,
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index d4bbc5d109c8..149b8e25da5b 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -689,7 +689,6 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
  * For a single handle lookup, use drm_gem_object_lookup().
  *
  * Returns:
- *
  * @objs filled in with GEM object pointers. Returned GEM objects need to be
  * released with drm_gem_object_put(). -ENOENT is returned on a lookup
  * failure. 0 is returned on success.
@@ -737,12 +736,11 @@ EXPORT_SYMBOL(drm_gem_objects_lookup);
  * @filp: DRM file private date
  * @handle: userspace handle
  *
- * Returns:
+ * If looking up an array of handles, use drm_gem_objects_lookup().
  *
+ * Returns:
  * A reference to the object named by the handle if such exists on @filp, NULL
  * otherwise.
- *
- * If looking up an array of handles, use drm_gem_objects_lookup().
  */
 struct drm_gem_object *
 drm_gem_object_lookup(struct drm_file *filp, u32 handle)
@@ -763,7 +761,6 @@ EXPORT_SYMBOL(drm_gem_object_lookup);
  * @timeout: timeout value in jiffies or zero to return immediately
  *
  * Returns:
- *
  * Returns -ERESTARTSYS if interrupted, 0 if the wait timed out, or
  * greater than 0 on success.
  */
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 1a0890083aee..6ba167a33461 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -539,7 +539,6 @@ static int fill_analog_mode(struct drm_device *dev,
  * to reach those resolutions.
  *
  * Returns:
- *
  * A pointer to the mode, allocated with drm_mode_create(). Returns NULL
  * on error.
  */
diff --git a/drivers/gpu/drm/drm_rect.c b/drivers/gpu/drm/drm_rect.c
index 85c79a38c13a..492acce0516f 100644
--- a/drivers/gpu/drm/drm_rect.c
+++ b/drivers/gpu/drm/drm_rect.c
@@ -85,7 +85,6 @@ static u32 clip_scaled(int src, int dst, int *clip)
  * factors from @src to @dst.
  *
  * RETURNS:
- *
  * %true if rectangle @dst is still visible after being clipped,
  * %false otherwise.
  */
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index cc3571e25a9a..6428b7975dd6 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -686,7 +686,6 @@ EXPORT_SYMBOL(drm_calc_timestamping_constants);
  * drm_atomic_helper_calc_timestamping_constants().
  *
  * Returns:
- *
  * Returns true on success, and false on failure, i.e. when no accurate
  * timestamp could be acquired.
  */
@@ -831,7 +830,6 @@ EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp_internal);
  * drm_atomic_helper_calc_timestamping_constants().
  *
  * Returns:
- *
  * Returns true on success, and false on failure, i.e. when no accurate
  * timestamp could be acquired.
  */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 5d7446a48ae7..3dc61cbd2e11 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -89,7 +89,6 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj);
  * @handle: userspace handle
  *
  * Returns:
- *
  * A pointer to the object named by the handle if such exists on @filp, NULL
  * otherwise. This object is only valid whilst under the RCU read lock, and
  * note carefully the object may be in the process of being destroyed.
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index 93bc1cc1ee7e..0ffba50981e3 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -418,7 +418,6 @@ int __i915_vma_pin_fence(struct i915_vma *vma)
  * For an untiled surface, this removes any existing fence.
  *
  * Returns:
- *
  * 0 on success, negative error code on failure.
  */
 int i915_vma_pin_fence(struct i915_vma *vma)
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index e356dfb883d3..6a6be8048aa8 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -389,7 +389,6 @@ void i915_vma_unpin_iomap(struct i915_vma *vma);
  * i915_vma_unpin_fence().
  *
  * Returns:
- *
  * True if the vma has a fence, false otherwise.
  */
 int __must_check i915_vma_pin_fence(struct i915_vma *vma);
-- 
2.39.2

