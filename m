Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C09B130204
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC956E3F9;
	Sat,  4 Jan 2020 11:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C0E6E2FF;
 Fri,  3 Jan 2020 13:20:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y11so42407654wrt.6;
 Fri, 03 Jan 2020 05:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=C3KbUwwGr1Cb8XkzCAZ3aK+ePPWFuPeAubzbR4jFmKM=;
 b=f9EOvdp1hfOh4h7Mj3m+BABI9zxxknG65AeyVIc2uxjPdSOBnoPN0qrYLkEj3HFCm6
 qCIJV7yD0ThJm/tCuLhK41AY539uXplPSODQZ50NjqCKTxfCtRXaMYpaZyj3dJJy1wzr
 sB9pLRr3IDlw0l1gH5Xh6HkDlOCU1lvdsWhkk7NojJz6mGNx46XCkaLqE/4fGIW0otqD
 sV+oQqrin1/fzrUanNlBNN/WmgNSj9qk7pROVAQYjD5VZoxnRrqkuhdpFR8sRxs+AMat
 HTb52hvrt7jN+H+VPe3iOBv46qdDr3FGM7xQOTt4tdNixZv6wctOkDmUlmXcZATcIoqi
 ct1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=C3KbUwwGr1Cb8XkzCAZ3aK+ePPWFuPeAubzbR4jFmKM=;
 b=aTZR2lMnonlE7px/ljQgdiEhBy8By5DuGywG2aeFwaABJkJCp3bDwwl4UWSXnCnyBp
 l72M95ZNCVRLmKdDkSaLB8yu8r3sgkriLyx8PRMguNOeB/oADE52/IYuJwODHvR860/b
 3BxZtPUy14kiHA/UzQZpxm0ET1KpC/KRhJktpbGscsRnxCi15E4TMJF8L7GHDW+82HKU
 dWwNePom9L+pFff+MAv8EtmutXr5Dy3fDk9R+vBstQ5bw9W5zfWhG8stQMONi+LmUGHU
 6xk6nbastxs1j+QqBVdVzAn+kwKNJbyIGApEcbts+PE3jNtNvAvMalsqxktPOxWCv0Z2
 nyQA==
X-Gm-Message-State: APjAAAUwh+cSWOLzmK5/C9/+GlCtyi2LN5HNxNHQRPhZV/QFebhMPhDY
 clxL0YSyFTJVX6yuT1EIVl4=
X-Google-Smtp-Source: APXvYqwnJHsZPsrZYEVhI9w8MF5FKbXpJta6dTpqi48+Tm2334oPH0Lh3xrr68U9hZaqCzfvspOqgw==
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr848408wrn.356.1578057639964; 
 Fri, 03 Jan 2020 05:20:39 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id w8sm10645840wmd.2.2020.01.03.05.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 05:20:39 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: remove unnecessary braces around conditionals.
Date: Fri,  3 Jan 2020 16:20:35 +0300
Message-Id: <20200103132035.27008-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As single statement conditionals do not need to be wrapped around
braces, the unnecessary braces can be removed.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/radeon/atombios_crtc.c     |  3 +--
 drivers/gpu/drm/radeon/atombios_dp.c       |  3 +--
 drivers/gpu/drm/radeon/atombios_encoders.c |  9 ++++-----
 drivers/gpu/drm/radeon/radeon_connectors.c |  4 ++--
 drivers/gpu/drm/radeon/radeon_vce.c        |  4 ++--
 drivers/gpu/drm/radeon/radeon_vm.c         | 16 ++++++++--------
 6 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
index da2c9e295408..be583695427a 100644
--- a/drivers/gpu/drm/radeon/atombios_crtc.c
+++ b/drivers/gpu/drm/radeon/atombios_crtc.c
@@ -244,9 +244,8 @@ static void atombios_blank_crtc(struct drm_crtc *crtc, int state)
 
 	atom_execute_table(rdev->mode_info.atom_context, index, (uint32_t *)&args);
 
-	if (ASIC_IS_DCE8(rdev)) {
+	if (ASIC_IS_DCE8(rdev))
 		WREG32(vga_control_regs[radeon_crtc->crtc_id], vga_control);
-	}
 }
 
 static void atombios_powergate_crtc(struct drm_crtc *crtc, int state)
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index 6f38375c77c8..39b342b5c495 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -816,9 +816,8 @@ void radeon_dp_link_train(struct drm_encoder *encoder,
 	dp_info.use_dpencoder = true;
 	index = GetIndexIntoMasterTable(COMMAND, DPEncoderService);
 	if (atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev)) {
-		if (crev > 1) {
+		if (crev > 1)
 			dp_info.use_dpencoder = false;
-		}
 	}
 
 	dp_info.enc_id = 0;
diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index 2a7be5d5e7e6..cc5ee1b3af84 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -1885,11 +1885,10 @@ atombios_set_encoder_crtc_source(struct drm_encoder *encoder)
 			if (ASIC_IS_AVIVO(rdev))
 				args.v1.ucCRTC = radeon_crtc->crtc_id;
 			else {
-				if (radeon_encoder->encoder_id == ENCODER_OBJECT_ID_INTERNAL_DAC1) {
+				if (radeon_encoder->encoder_id == ENCODER_OBJECT_ID_INTERNAL_DAC1)
 					args.v1.ucCRTC = radeon_crtc->crtc_id;
-				} else {
+				else
 					args.v1.ucCRTC = radeon_crtc->crtc_id << 2;
-				}
 			}
 			switch (radeon_encoder->encoder_id) {
 			case ENCODER_OBJECT_ID_INTERNAL_TMDS1:
@@ -2234,9 +2233,9 @@ int radeon_atom_pick_dig_encoder(struct drm_encoder *encoder, int fe_idx)
 		DRM_ERROR("Got encoder index incorrect - returning 0\n");
 		return 0;
 	}
-	if (rdev->mode_info.active_encoders & (1 << enc_idx)) {
+	if (rdev->mode_info.active_encoders & (1 << enc_idx))
 		DRM_ERROR("chosen encoder in use %d\n", enc_idx);
-	}
+
 	rdev->mode_info.active_encoders |= (1 << enc_idx);
 	return enc_idx;
 }
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 90d2f732affb..fe12d9d91d7a 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -700,9 +700,9 @@ static int radeon_connector_set_property(struct drm_connector *connector, struct
 			else
 				ret = radeon_legacy_get_tmds_info_from_combios(radeon_encoder, tmds);
 		}
-		if (val == 1 || !ret) {
+		if (val == 1 || !ret)
 			radeon_legacy_get_tmds_info_from_table(radeon_encoder, tmds);
-		}
+
 		radeon_property_change_mode(&radeon_encoder->base);
 	}
 
diff --git a/drivers/gpu/drm/radeon/radeon_vce.c b/drivers/gpu/drm/radeon/radeon_vce.c
index 59db54ace428..5e8006444704 100644
--- a/drivers/gpu/drm/radeon/radeon_vce.c
+++ b/drivers/gpu/drm/radeon/radeon_vce.c
@@ -388,9 +388,9 @@ int radeon_vce_get_create_msg(struct radeon_device *rdev, int ring,
 		ib.ptr[i] = cpu_to_le32(0x0);
 
 	r = radeon_ib_schedule(rdev, &ib, NULL, false);
-	if (r) {
+	if (r)
 		DRM_ERROR("radeon: failed to schedule ib (%d).\n", r);
-	}
+
 
 	if (fence)
 		*fence = radeon_fence_ref(ib.fence);
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index e0ad547786e8..f60fae0aed11 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -296,9 +296,9 @@ struct radeon_bo_va *radeon_vm_bo_find(struct radeon_vm *vm,
 	struct radeon_bo_va *bo_va;
 
 	list_for_each_entry(bo_va, &bo->va, bo_list) {
-		if (bo_va->vm == vm) {
+		if (bo_va->vm == vm)
 			return bo_va;
-		}
+
 	}
 	return NULL;
 }
@@ -323,9 +323,9 @@ struct radeon_bo_va *radeon_vm_bo_add(struct radeon_device *rdev,
 	struct radeon_bo_va *bo_va;
 
 	bo_va = kzalloc(sizeof(struct radeon_bo_va), GFP_KERNEL);
-	if (bo_va == NULL) {
+	if (bo_va == NULL)
 		return NULL;
-	}
+
 	bo_va->vm = vm;
 	bo_va->bo = bo;
 	bo_va->it.start = 0;
@@ -947,9 +947,9 @@ int radeon_vm_bo_update(struct radeon_device *rdev,
 
 	if (mem) {
 		addr = (u64)mem->start << PAGE_SHIFT;
-		if (mem->mem_type != TTM_PL_SYSTEM) {
+		if (mem->mem_type != TTM_PL_SYSTEM)
 			bo_va->flags |= RADEON_VM_PAGE_VALID;
-		}
+
 		if (mem->mem_type == TTM_PL_TT) {
 			bo_va->flags |= RADEON_VM_PAGE_SYSTEM;
 			if (!(bo_va->bo->flags & (RADEON_GEM_GTT_WC | RADEON_GEM_GTT_UC)))
@@ -1233,9 +1233,9 @@ void radeon_vm_fini(struct radeon_device *rdev, struct radeon_vm *vm)
 	struct radeon_bo_va *bo_va, *tmp;
 	int i, r;
 
-	if (!RB_EMPTY_ROOT(&vm->va.rb_root)) {
+	if (!RB_EMPTY_ROOT(&vm->va.rb_root))
 		dev_err(rdev->dev, "still active bo inside vm\n");
-	}
+
 	rbtree_postorder_for_each_entry_safe(bo_va, tmp,
 					     &vm->va.rb_root, it.rb) {
 		interval_tree_remove(&bo_va->it, &vm->va);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
