Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A5229A853
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1526EB46;
	Tue, 27 Oct 2020 09:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB726EB4C;
 Tue, 27 Oct 2020 09:51:43 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de
 [95.90.213.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34D9622456;
 Tue, 27 Oct 2020 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603792302;
 bh=usL7gfHFc4G7AnespRehxUU27ojrrvGixrlv+aC7DDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jo1MXYuyDI9/cIaonUOADyY1fh508oFpKFCMeh4RjuMpdp8gxiL9kAgecwzUdunsZ
 rtkhtAibZ4Z6ysJGWA4u9v0AdJS0msUcgP8umvRjBa1bEeqJJrVFo8xt6I/GsDpC22
 nPEjTUPwcPFRUO+JWtR7b9SWrMl15xSUSeaosWkE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kXLdj-003FFi-Td; Tue, 27 Oct 2020 10:51:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 28/32] drm: amdgpu_dm: fix a typo
Date: Tue, 27 Oct 2020 10:51:32 +0100
Message-Id: <9de495fa791596609eb2e73ba71cea99e09b2689.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
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
Cc: Stylon Wang <stylon.wang@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Alexander Monakov <amonakov@ispras.ru>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	dm_comressor_info -> dm_compressor_info

The kernel-doc markup is right, but the struct itself
and their references contain a typo.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e2b23486ba4c..373b8481f76c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -583,7 +583,7 @@ static void amdgpu_dm_fbc_init(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
-	struct dm_comressor_info *compressor = &adev->dm.compressor;
+	struct dm_compressor_info *compressor = &adev->dm.compressor;
 	struct amdgpu_dm_connector *aconn = to_amdgpu_dm_connector(connector);
 	struct drm_display_mode *mode;
 	unsigned long max_size = 0;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 34f6369bf51f..a8a0e8cb1a11 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -86,7 +86,7 @@ struct irq_list_head {
  * @bo_ptr: Pointer to the buffer object
  * @gpu_addr: MMIO gpu addr
  */
-struct dm_comressor_info {
+struct dm_compressor_info {
 	void *cpu_addr;
 	struct amdgpu_bo *bo_ptr;
 	uint64_t gpu_addr;
@@ -148,7 +148,7 @@ struct amdgpu_dm_backlight_caps {
  * @soc_bounding_box: SOC bounding box values provided by gpu_info FW
  * @cached_state: Caches device atomic state for suspend/resume
  * @cached_dc_state: Cached state of content streams
- * @compressor: Frame buffer compression buffer. See &struct dm_comressor_info
+ * @compressor: Frame buffer compression buffer. See &struct dm_compressor_info
  * @force_timing_sync: set via debugfs. When set, indicates that all connected
  *		       displays will be forced to synchronize.
  */
@@ -324,7 +324,7 @@ struct amdgpu_display_manager {
 	struct drm_atomic_state *cached_state;
 	struct dc_state *cached_dc_state;
 
-	struct dm_comressor_info compressor;
+	struct dm_compressor_info compressor;
 
 	const struct firmware *fw_dmcu;
 	uint32_t dmcu_fw_version;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
