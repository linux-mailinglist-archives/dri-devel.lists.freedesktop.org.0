Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D157306E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FF295C0B;
	Wed, 13 Jul 2022 08:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18079528F;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2351061A87;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A8BC341D8;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=bSkbpAx11+TmEHvxW7ggJPLe705G0MX6L55HD9C2rwk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rjOdtS7V4UCOa61lYWAyi5Mn+vyfIAjajlI8OZ5BtbuOLmNIUqHxX6HD/WL9mqHbe
 Eo2bS6Z6QMfZNVptdvWXhxHU9qiEGrkIzWYREMF5p4K50eh84OHpPER9dzj+TyR0xt
 5dDzFtslvDmDnu/uNdmfStv0lC7sAC+CG+8RzqZoID4oiSQ1JWTGgFtbFZNtXsh6e/
 +ZqjRww0p+q6PWg95mHanQbh9glaA2x2ysFsd4SQR/efLcq7CR4SkFS3ENCT2RxFEd
 9WqNresukybehqKoZq4+Rsf1oxRUOsGoAbHns/z1ZaYCcFH9+yY8iIcIWHvhthGzl9
 faa+sIePWLqcA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004zsq-Ee;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 07/39] drm/i915: gvt: fix kernel-doc trivial warnings
Date: Wed, 13 Jul 2022 09:11:55 +0100
Message-Id: <375c0c0ca2ef414f25e14f274457f77373a9268d.1657699522.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657699522.git.mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some functions seem to have been renamed without updating the kernel-doc
markup causing warnings. Also, struct intel_vgpu_dmabuf_obj is not
properly documented, but has a kerneld-doc markup.

Fix those warnings:
	drivers/gpu/drm/i915/gvt/aperture_gm.c:308: warning: expecting prototype for inte_gvt_free_vgpu_resource(). Prototype was for intel_vgpu_free_resource() instead
	drivers/gpu/drm/i915/gvt/aperture_gm.c:344: warning: expecting prototype for intel_alloc_vgpu_resource(). Prototype was for intel_vgpu_alloc_resource() instead
	drivers/gpu/drm/i915/gvt/cfg_space.c:257: warning: expecting prototype for intel_vgpu_emulate_cfg_read(). Prototype was for intel_vgpu_emulate_cfg_write() instead
	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'vgpu' not described in 'intel_vgpu_dmabuf_obj'
	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'info' not described in 'intel_vgpu_dmabuf_obj'
	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'dmabuf_id' not described in 'intel_vgpu_dmabuf_obj'
	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'kref' not described in 'intel_vgpu_dmabuf_obj'
	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'initref' not described in 'intel_vgpu_dmabuf_obj'
	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or member 'list' not described in 'intel_vgpu_dmabuf_obj'
	drivers/gpu/drm/i915/gvt/handlers.c:3066: warning: expecting prototype for intel_t_default_mmio_write(). Prototype was for intel_vgpu_default_mmio_write() instead
	drivers/gpu/drm/i915/gvt/mmio_context.c:560: warning: expecting prototype for intel_gvt_switch_render_mmio(). Prototype was for intel_gvt_switch_mmio() instead
	drivers/gpu/drm/i915/gvt/page_track.c:131: warning: expecting prototype for intel_vgpu_enable_page_track(). Prototype was for intel_vgpu_disable_page_track() instead
	drivers/gpu/drm/i915/gvt/vgpu.c:215: warning: expecting prototype for intel_gvt_active_vgpu(). Prototype was for intel_gvt_activate_vgpu() instead
	drivers/gpu/drm/i915/gvt/vgpu.c:230: warning: expecting prototype for intel_gvt_deactive_vgpu(). Prototype was for intel_gvt_deactivate_vgpu() instead
	drivers/gpu/drm/i915/gvt/vgpu.c:358: warning: expecting prototype for intel_gvt_destroy_vgpu(). Prototype was for intel_gvt_destroy_idle_vgpu() instead

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gvt/cfg_space.c  | 2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.h     | 2 +-
 drivers/gpu/drm/i915/gvt/page_track.c | 2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c       | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
index dad3a6054335..a0fc6d356588 100644
--- a/drivers/gpu/drm/i915/gvt/cfg_space.c
+++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
@@ -243,7 +243,7 @@ static void emulate_pci_bar_write(struct intel_vgpu *vgpu, unsigned int offset,
 }
 
 /**
- * intel_vgpu_emulate_cfg_read - emulate vGPU configuration space write
+ * intel_vgpu_emulate_cfg_write - emulate vGPU configuration space write
  * @vgpu: target vgpu
  * @offset: offset
  * @p_data: write data ptr
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.h b/drivers/gpu/drm/i915/gvt/dmabuf.h
index 5f8f03fb1d1b..3dcdb6570eda 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.h
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.h
@@ -48,7 +48,7 @@ struct intel_vgpu_fb_info {
 	struct intel_vgpu_dmabuf_obj *obj;
 };
 
-/**
+/*
  * struct intel_vgpu_dmabuf_obj- Intel vGPU device buffer object
  */
 struct intel_vgpu_dmabuf_obj {
diff --git a/drivers/gpu/drm/i915/gvt/page_track.c b/drivers/gpu/drm/i915/gvt/page_track.c
index 3375b51c75f1..df34e73cba41 100644
--- a/drivers/gpu/drm/i915/gvt/page_track.c
+++ b/drivers/gpu/drm/i915/gvt/page_track.c
@@ -120,7 +120,7 @@ int intel_vgpu_enable_page_track(struct intel_vgpu *vgpu, unsigned long gfn)
 }
 
 /**
- * intel_vgpu_enable_page_track - cancel write-protection on guest page
+ * intel_vgpu_disable_page_track - cancel write-protection on guest page
  * @vgpu: a vGPU
  * @gfn: the gfn of guest page
  *
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 46da19b3225d..8e71cda19995 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -205,7 +205,7 @@ static void intel_gvt_update_vgpu_types(struct intel_gvt *gvt)
 }
 
 /**
- * intel_gvt_active_vgpu - activate a virtual GPU
+ * intel_gvt_activate_vgpu - activate a virtual GPU
  * @vgpu: virtual GPU
  *
  * This function is called when user wants to activate a virtual GPU.
@@ -219,7 +219,7 @@ void intel_gvt_activate_vgpu(struct intel_vgpu *vgpu)
 }
 
 /**
- * intel_gvt_deactive_vgpu - deactivate a virtual GPU
+ * intel_gvt_deactivate_vgpu - deactivate a virtual GPU
  * @vgpu: virtual GPU
  *
  * This function is called when user wants to deactivate a virtual GPU.
@@ -348,7 +348,7 @@ struct intel_vgpu *intel_gvt_create_idle_vgpu(struct intel_gvt *gvt)
 }
 
 /**
- * intel_gvt_destroy_vgpu - destroy an idle virtual GPU
+ * intel_gvt_destroy_idle_vgpu - destroy an idle virtual GPU
  * @vgpu: virtual GPU
  *
  * This function is called when user wants to destroy an idle virtual GPU.
-- 
2.36.1

