Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57901F34ED
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024346E1F5;
	Tue,  9 Jun 2020 07:35:14 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4ACF6E9D3
 for <dri-devel@freedesktop.org>; Tue,  9 Jun 2020 00:44:55 +0000 (UTC)
Date: Tue, 09 Jun 2020 00:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1591663161;
 bh=AGJtG9tQUKFHHSc7lwe/W00TIZ5m7Y22lrvqm8/oz2M=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=lvtJeprbTHrjqdRsGyLVvYQ+haF3ow0sETIih5Q/6W98WWETlAy80uej1+1pm1g89
 XDbAd7BjLgGvfXpoB+1cdUmYR3yPELSRAYmwj2bLXV/MYxIZt5M4oAi6RK06tJ/n7x
 Cwx6PjnExCWxiCAeurYNRdQ5D9pUDhugP3H0aZII=
To: dri-devel@freedesktop.org
From: Colton Lewis <colton.w.lewis@protonmail.com>
Subject: [PATCH 1/2] drm/amd: correct trivial kernel-doc inconsistencies
Message-ID: <20200609003810.1656842-2-colton.w.lewis@protonmail.com>
In-Reply-To: <20200609003810.1656842-1-colton.w.lewis@protonmail.com>
References: <20200609003810.1656842-1-colton.w.lewis@protonmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
Reply-To: Colton Lewis <colton.w.lewis@protonmail.com>
Cc: alexander.deucher@amd.com, Colton Lewis <colton.w.lewis@protonmail.com>,
 trivial@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Silence documentation warnings by correcting kernel-doc comments.

./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3388: warning: Excess function parameter 'suspend' description in 'amdgpu_device_suspend'
./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3485: warning: Excess function parameter 'resume' description in 'amdgpu_device_resume'
./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418: warning: Excess function parameter 'tbo' description in 'amdgpu_vram_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418: warning: Excess function parameter 'place' description in 'amdgpu_vram_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:279: warning: Excess function parameter 'tbo' description in 'amdgpu_gtt_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:279: warning: Excess function parameter 'place' description in 'amdgpu_gtt_mgr_del'
./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:332: warning: Function parameter or member 'hdcp_workqueue' not described in 'amdgpu_display_manager'
./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:332: warning: Function parameter or member 'cached_dc_state' not described in 'amdgpu_display_manager'

Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c       | 2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c      | 2 --
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 2 ++
 4 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a027a8f7b281..dd7da7b4b696 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3377,7 +3377,6 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
  * amdgpu_device_suspend - initiate device suspend
  *
  * @dev: drm dev pointer
- * @suspend: suspend state
  * @fbcon : notify the fbdev of suspend
  *
  * Puts the hw in the suspend state (all asics).
@@ -3474,7 +3473,6 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
  * amdgpu_device_resume - initiate device resume
  *
  * @dev: drm dev pointer
- * @resume: resume state
  * @fbcon : notify the fbdev of resume
  *
  * Bring the hw back to operating state (all asics).
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 627104401e84..bc01a06546aa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -268,8 +268,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_mem_type_manager *man,
  * amdgpu_gtt_mgr_del - free ranges
  *
  * @man: TTM memory type manager
- * @tbo: TTM BO we need this range for
- * @place: placement flags and restrictions
  * @mem: TTM memory object
  *
  * Free the allocated GTT again.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index d399e5893170..97ad8ffe6c6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -407,8 +407,6 @@ static int amdgpu_vram_mgr_new(struct ttm_mem_type_manager *man,
  * amdgpu_vram_mgr_del - free ranges
  *
  * @man: TTM memory type manager
- * @tbo: TTM BO we need this range for
- * @place: placement flags and restrictions
  * @mem: TTM memory object
  *
  * Free the allocated VRAM again.
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index d61186ff411d..86c132ddc452 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -139,10 +139,12 @@ struct amdgpu_dm_backlight_caps {
  * @backlight_link: Link on which to control backlight
  * @backlight_caps: Capabilities of the backlight device
  * @freesync_module: Module handling freesync calculations
+ * @hdcp_workqueue: AMDGPU content protection queue
  * @fw_dmcu: Reference to DMCU firmware
  * @dmcu_fw_version: Version of the DMCU firmware
  * @soc_bounding_box: SOC bounding box values provided by gpu_info FW
  * @cached_state: Caches device atomic state for suspend/resume
+ * @cached_dc_state: Cached state of content streams
  * @compressor: Frame buffer compression buffer. See &struct dm_comressor_info
  */
 struct amdgpu_display_manager {
-- 
2.26.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
