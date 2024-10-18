Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBEE9A48A7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F6E10E99E;
	Fri, 18 Oct 2024 21:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="LpmvZrMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1943A10E99E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 21:01:37 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-5e7aec9e168so1385109eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 14:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1729285295; x=1729890095;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hwAvHGJA4EHAFecrKs5AFSFh71zbg8KI/dTV2/i9p4k=;
 b=LpmvZrMmp2vNI7deXunVrtPgNEuyDCaYn9FxAvBIJi4WMGPpTf5spw34wCW+4s3yf4
 AM3pFibMVfW2n7ET0crpkGqdtyUmwXg0EaXlr328gQAZ6y+PartG5lrWSIG+Gv7qqM/Q
 ibykOPthrDlpjihuVsp+jTLlQDV7VtsJ+boio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729285295; x=1729890095;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hwAvHGJA4EHAFecrKs5AFSFh71zbg8KI/dTV2/i9p4k=;
 b=mCI8JIjeQccLthsnaA2V4f/+CuirBeAdPHYbsVsv33CmiQt2UZRD33XNkAE9tyxydY
 gkGA8qo0Vqg7y16HGoY4YKzqevuZ6Kzsj/X3tdv0H0yb9m4OnInNikatrgAlqfQ2j41e
 yQg9v9UjgIbTN8q1EXV2q0FhzCGg9zxc0Scc8zrbiszmFiq/UNIfY6AEmtBTBifcFx3R
 4Hpo2FhiaAUUWEUverw50lnPqECYtaTwCk9A3LfxkfXKycrMineL9DsJhbRm4k+nc6sE
 odZzgcDTs/Egn3+gJxIfBgOqtMoeq+Wv5nHv+R2IgZ0w6q2fQVfn/xC56IjCEvZrzh8C
 1f+g==
X-Gm-Message-State: AOJu0Yyb58DuC2CuchLMR1M5nTd44yEfpU4z06xnc36FJUJNtN0hazmo
 UguyHTZ7RdVNQVZMtduApES0pExa5ql4JgBaTQzJxDYN/VXuG5BQ11yEbQIYt1syKGj4Z5WJx8Z
 OyCMYl9noAYvUBo1JO+wRXi1v31l/e9KmFApiVAQsaOY5Z2c+wDz5grAszkVL5WHYkmT2H3lvtw
 9SshdCXdjyqLmlmdlUXdt5mBhh+f4px3UssV0r8ppsStprtdjfk4GfGOKPsw==
X-Google-Smtp-Source: AGHT+IE6rDGBJ9HQ99eDFpbN+xyqcggGqMwWsnABo+Xedmr6EqjwbOFLfe41Ec94KnxQBkOMjqT5nQ==
X-Received: by 2002:a05:6870:e2d0:b0:268:2efa:2de0 with SMTP id
 586e51a60fabf-2892c2dedecmr3429831fac.13.1729285294761; 
 Fri, 18 Oct 2024 14:01:34 -0700 (PDT)
Received: from localhost.localdomain ([216.221.25.44])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-460aea48ebcsm10599501cf.63.2024.10.18.14.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 14:01:33 -0700 (PDT)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH v2 1/3] drm/vmwgfx: Introduce userspace managed surfaces
Date: Fri, 18 Oct 2024 14:00:44 -0700
Message-ID: <20241018210046.2222313-2-maaz.mombasawala@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018210046.2222313-1-maaz.mombasawala@broadcom.com>
References: <20241018210046.2222313-1-maaz.mombasawala@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reply-To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kernel currently exposes both mobs and surfaces to userspace through
ioctls. We would like to move to a model where kernel would only expose
mobs and have userspace manage surfaces. This would simplify kernel paths
for surfaces since these userspace managed surfaces will not support prime
transfer.

Allow userspace submission of surface create and destroy commands.
Userspace submits its own surface id which is mapped to a ttm base object
and a resource with their corresponding ids.

Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  23 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 234 +++++++++++++++++++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c   |   3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 157 +++++++++++++++-
 include/uapi/drm/vmwgfx_drm.h           |   4 +
 5 files changed, 390 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 3f4719b3c268..67f75d366f9d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /**************************************************************************
  *
- * Copyright (c) 2009-2024 Broadcom. All Rights Reserved. The term
- * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
+ * Copyright (c) 2009-2024 Broadcom. All Rights Reserved.
+ * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -196,7 +196,8 @@ enum vmw_res_type {
 enum vmw_cmdbuf_res_type {
 	vmw_cmdbuf_res_shader,
 	vmw_cmdbuf_res_view,
-	vmw_cmdbuf_res_streamoutput
+	vmw_cmdbuf_res_streamoutput,
+	vmw_cmdbuf_res_surface
 };
 
 struct vmw_cmdbuf_res_manager;
@@ -263,6 +264,11 @@ struct vmw_surface {
 	struct list_head view_list;
 };
 
+struct vmw_cmdbuf_surface {
+	struct vmw_surface surface;
+	struct ttm_base_object base;
+};
+
 struct vmw_fifo_state {
 	unsigned long reserved_size;
 	u32 *dynamic_buffer;
@@ -1199,6 +1205,17 @@ int vmw_dumb_create(struct drm_file *file_priv,
 		    struct drm_device *dev,
 		    struct drm_mode_create_dumb *args);
 
+struct vmw_cmdbuf_surface *vmw_res_to_cmdbuf_srf(struct vmw_resource *res);
+
+int vmw_cmdbuf_surface_define(struct vmw_private *dev_priv,
+			      struct vmw_sw_context *sw_context,
+			      struct vmw_surface_metadata *metadata,
+			      uint32 user_key);
+
+int vmw_cmdbuf_surface_destroy(struct vmw_private *dev_priv,
+			       struct vmw_sw_context *sw_context,
+			       uint32 user_key);
+
 /*
  * Shader management - vmwgfx_shader.c
  */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 2e52d73eba48..0468c9f4f293 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2009 - 2023 VMware, Inc., Palo Alto, CA., USA
+ * Copyright (c) 2009-2024 Broadcom. All Rights Reserved.
+ * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -614,28 +615,77 @@ static int vmw_resources_reserve(struct vmw_sw_context *sw_context)
 	return ret;
 }
 
-/**
- * vmw_cmd_res_check - Check that a resource is present and if so, put it on the
- * resource validate list unless it's already there.
- *
- * @dev_priv: Pointer to a device private structure.
- * @sw_context: Pointer to the software context.
- * @res_type: Resource type.
- * @dirty: Whether to change dirty status.
- * @converter: User-space visible type specific information.
- * @id_loc: Pointer to the location in the command buffer currently being parsed
- * from where the user-space resource id handle is located.
- * @p_res: Pointer to pointer to resource validation node. Populated on
- * exit.
- */
 static int
-vmw_cmd_res_check(struct vmw_private *dev_priv,
-		  struct vmw_sw_context *sw_context,
-		  enum vmw_res_type res_type,
-		  u32 dirty,
-		  const struct vmw_user_resource_conv *converter,
-		  uint32_t *id_loc,
-		  struct vmw_resource **p_res)
+vmw_cmd_cmdbuf_surface_check(struct vmw_private *dev_priv,
+			     struct vmw_sw_context *sw_context,
+			     u32 dirty,
+			     uint32_t *id_loc,
+			     struct vmw_resource **p_res)
+{
+	struct vmw_res_cache_entry *rcache =
+		&sw_context->res_cache[vmw_res_surface];
+	struct vmw_resource *res;
+	int ret = 0;
+	bool needs_unref = false;
+	uint32 handle;
+
+	res = vmw_cmdbuf_res_lookup(sw_context->man, vmw_cmdbuf_res_surface,
+				    *id_loc);
+	if (!IS_ERR(res)) {
+		kref_get(&res->kref);
+		needs_unref = true;
+		handle = vmw_res_to_cmdbuf_srf(res)->base.handle;
+	} else {
+		VMW_DEBUG_USER("Could not find resource 0x%08x.\n", *id_loc);
+		return -EINVAL;
+	}
+
+	if (likely(rcache->valid_handle && handle == rcache->handle)) {
+		res = rcache->res;
+		if (dirty)
+			vmw_validation_res_set_dirty(sw_context->ctx,
+						     rcache->private, dirty);
+	} else {
+		unsigned int size =
+			vmw_execbuf_res_size(dev_priv, vmw_res_surface);
+
+		ret = vmw_validation_preload_res(sw_context->ctx, size);
+		if (unlikely(ret != 0))
+			goto cmdbuf_check_done;
+
+		ret = vmw_execbuf_res_val_add(sw_context, res, dirty,
+					      vmw_val_add_flag_none);
+		if (unlikely(ret != 0))
+			goto cmdbuf_check_done;
+
+		if (rcache->valid && rcache->res == res) {
+			rcache->valid_handle = true;
+			rcache->handle = handle;
+		}
+	}
+
+	ret = vmw_resource_relocation_add(sw_context, res,
+					  vmw_ptr_diff(sw_context->buf_start,
+						       id_loc),
+					  vmw_res_rel_normal);
+	if (p_res)
+		*p_res = res;
+
+cmdbuf_check_done:
+	if (needs_unref)
+		vmw_resource_unreference(&res);
+
+	return ret;
+}
+
+static int
+vmw_cmd_gen_res_check(struct vmw_private *dev_priv,
+		      struct vmw_sw_context *sw_context,
+		      enum vmw_res_type res_type,
+		      u32 dirty,
+		      const struct vmw_user_resource_conv *converter,
+		      uint32_t *id_loc,
+		      struct vmw_resource **p_res)
 {
 	struct vmw_res_cache_entry *rcache = &sw_context->res_cache[res_type];
 	struct vmw_resource *res;
@@ -698,6 +748,40 @@ vmw_cmd_res_check(struct vmw_private *dev_priv,
 	return ret;
 }
 
+/**
+ * vmw_cmd_res_check - Check that a resource is present and if so, put it on the
+ * resource validate list unless it's already there.
+ *
+ * @dev_priv: Pointer to a device private structure.
+ * @sw_context: Pointer to the software context.
+ * @res_type: Resource type.
+ * @dirty: Whether to change dirty status.
+ * @converter: User-space visible type specific information. This is optional,
+ * it is not used for userspace managed surfaces.
+ * @id_loc: Pointer to the location in the command buffer currently being parsed
+ * from where the user-space resource id handle is located.
+ * @p_res: Pointer to pointer to resource validation node. Populated on
+ * exit.
+ */
+static int
+vmw_cmd_res_check(struct vmw_private *dev_priv,
+		  struct vmw_sw_context *sw_context,
+		  enum vmw_res_type res_type,
+		  u32 dirty,
+		  const struct vmw_user_resource_conv *converter,
+		  uint32_t *id_loc,
+		  struct vmw_resource **p_res)
+{
+	if (res_type == vmw_res_surface &&
+		(*id_loc < VMWGFX_NUM_GB_SURFACE + 1)) {
+		return vmw_cmd_cmdbuf_surface_check(dev_priv, sw_context, dirty,
+						    id_loc, p_res);
+	} else {
+		return vmw_cmd_gen_res_check(dev_priv, sw_context, res_type,
+					     dirty, converter, id_loc, p_res);
+	}
+}
+
 /**
  * vmw_rebind_all_dx_query - Rebind DX query associated with the context
  *
@@ -1759,6 +1843,15 @@ static int vmw_cmd_switch_backup(struct vmw_private *dev_priv,
 	if (ret)
 		return ret;
 
+	/**
+	 * Userspace managed surface can be unbound by putting SVGA_ID_INVALID
+	 * as mob id, so this particular case is valid.
+	 */
+	if ((res_type == vmw_res_surface) &&
+	    (*res_id < VMWGFX_NUM_GB_SURFACE + 1) &&
+	    (*buf_id == SVGA_ID_INVALID))
+		return 0;
+
 	return vmw_cmd_res_switch_backup(dev_priv, sw_context, res, buf_id,
 					 backup_offset);
 }
@@ -3212,6 +3305,95 @@ static int vmw_cmd_dispatch_indirect(struct vmw_private *dev_priv,
 				 &cmd->body.argsBufferSid, NULL);
 }
 
+static inline int
+vmw_cmd_get_expected_surface_version(struct vmw_private *dev_priv,
+				     uint32 array_size,
+				     uint32 *cmd_id)
+{
+	if (array_size > 0) {
+		if (has_sm5_context(dev_priv))
+			*cmd_id = SVGA_3D_CMD_DEFINE_GB_SURFACE_V4;
+		else if (has_sm4_1_context(dev_priv))
+			*cmd_id = SVGA_3D_CMD_DEFINE_GB_SURFACE_V3;
+		else if (has_sm4_context(dev_priv))
+			*cmd_id = SVGA_3D_CMD_DEFINE_GB_SURFACE_V2;
+	} else if (array_size == 0)
+		*cmd_id = SVGA_3D_CMD_DEFINE_GB_SURFACE;
+	else
+		return -EINVAL;
+	return 0;
+}
+
+static int vmw_cmd_define_gb_surface_v4(struct vmw_private *dev_priv,
+					struct vmw_sw_context *sw_context,
+					SVGA3dCmdHeader *header)
+{
+	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDefineGBSurface_v4);
+	uint32 expected_cmd_id;
+	struct vmw_surface_metadata metadata = {0};
+	int ret;
+
+	cmd = container_of(header, typeof(*cmd), header);
+
+	ret = vmw_cmd_get_expected_surface_version(dev_priv,
+						   cmd->body.arraySize,
+						   &expected_cmd_id);
+	if (ret || (expected_cmd_id != header->id))
+		return -EINVAL;
+
+	if (cmd->body.sid >= VMWGFX_NUM_GB_SURFACE)
+		return -EINVAL;
+
+	metadata.flags = cmd->body.surfaceFlags;
+	metadata.format = cmd->body.format;
+	metadata.mip_levels[0] = cmd->body.numMipLevels;
+	metadata.multisample_count = cmd->body.multisampleCount;
+	metadata.multisample_pattern = cmd->body.multisamplePattern;
+	metadata.quality_level = cmd->body.qualityLevel;
+	metadata.autogen_filter = cmd->body.autogenFilter;
+	metadata.array_size = cmd->body.arraySize;
+	metadata.buffer_byte_stride = cmd->body.bufferByteStride;
+	metadata.num_sizes = 1;
+	metadata.base_size.width = cmd->body.size.width;
+	metadata.base_size.height = cmd->body.size.height;
+	metadata.base_size.depth = cmd->body.size.depth;
+
+	ret = vmw_cmdbuf_surface_define(dev_priv, sw_context, &metadata,
+					cmd->body.sid);
+	if (unlikely(ret))
+		return ret;
+
+	ret = vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface,
+				VMW_RES_DIRTY_NONE, NULL, &cmd->body.sid, NULL);
+
+	return ret;
+}
+
+static int vmw_cmd_destroy_gb_surface(struct vmw_private *dev_priv,
+				      struct vmw_sw_context *sw_context,
+				      SVGA3dCmdHeader *header)
+{
+	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDestroyGBSurface);
+	int ret;
+
+	cmd = container_of(header, typeof(*cmd), header);
+
+	if (cmd->body.sid >= VMWGFX_NUM_GB_SURFACE)
+		return -EINVAL;
+
+	ret = vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface,
+				VMW_RES_DIRTY_NONE, NULL, &cmd->body.sid, NULL);
+	if (unlikely(ret))
+		return ret;
+
+	ret = vmw_cmdbuf_surface_destroy(dev_priv, sw_context, cmd->body.sid);
+	if (unlikely(ret))
+		return ret;
+
+	return 0;
+}
+
+
 static int vmw_cmd_check_not_3d(struct vmw_private *dev_priv,
 				struct vmw_sw_context *sw_context,
 				void *buf, uint32_t *size)
@@ -3350,8 +3532,8 @@ static const struct vmw_cmd_entry vmw_cmd_entries[SVGA_3D_CMD_MAX] = {
 		    false, false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE, &vmw_cmd_invalid,
 		    false, false, true),
-	VMW_CMD_DEF(SVGA_3D_CMD_DESTROY_GB_SURFACE, &vmw_cmd_invalid,
-		    false, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DESTROY_GB_SURFACE, &vmw_cmd_destroy_gb_surface,
+		    true, false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_BIND_GB_SURFACE, &vmw_cmd_bind_gb_surface,
 		    true, false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_COND_BIND_GB_SURFACE, &vmw_cmd_invalid,
@@ -3602,6 +3784,8 @@ static const struct vmw_cmd_entry vmw_cmd_entries[SVGA_3D_CMD_MAX] = {
 	VMW_CMD_DEF(SVGA_3D_CMD_DX_DISPATCH, &vmw_cmd_sm5, true, false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_DX_DISPATCH_INDIRECT,
 		    &vmw_cmd_dispatch_indirect, true, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE_V4,
+		    &vmw_cmd_define_gb_surface_v4, true, false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_DX_SET_CS_UA_VIEWS, &vmw_cmd_set_cs_uav, true,
 		    false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_DX_DEFINE_DEPTHSTENCIL_VIEW_V2,
@@ -3612,8 +3796,6 @@ static const struct vmw_cmd_entry vmw_cmd_entries[SVGA_3D_CMD_MAX] = {
 		    &vmw_cmd_dx_bind_streamoutput, true, false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE_V2,
 		    &vmw_cmd_dx_so_define, true, false, true),
-	VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE_V4,
-		    &vmw_cmd_invalid, false, false, true),
 };
 
 bool vmw_cmd_describe(const void *buf, u32 *size, char const **cmd)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index 835d1eed8dd9..cfa14a34a679 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -112,6 +112,9 @@ int vmw_getparam_ioctl(struct drm_device *dev, void *data,
 	case DRM_VMW_PARAM_DEVICE_ID:
 		param->value = to_pci_dev(dev_priv->drm.dev)->device;
 		break;
+	case DRM_VMW_PARAM_USER_SRF:
+		param->value = 1;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 8ae6a761c900..4dfce3ea104c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright (c) 2009-2024 Broadcom. All Rights Reserved. The term
- * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
+ * Copyright (c) 2009-2024 Broadcom. All Rights Reserved.
+ * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -80,6 +80,8 @@ struct vmw_surface_dirty {
 static void vmw_user_surface_free(struct vmw_resource *res);
 static struct vmw_resource *
 vmw_user_surface_base_to_res(struct ttm_base_object *base);
+static void vmw_cmdbuf_surface_free(struct vmw_resource *res);
+static struct vmw_resource *vmw_cmdbuf_surface_base_to_res(struct ttm_base_object *base);
 static int vmw_legacy_srf_bind(struct vmw_resource *res,
 			       struct ttm_validate_buffer *val_buf);
 static int vmw_legacy_srf_unbind(struct vmw_resource *res,
@@ -156,6 +158,15 @@ static const struct vmw_res_func vmw_gb_surface_func = {
 	.clean = vmw_surface_clean,
 };
 
+static const struct vmw_res_func vmw_gb_cmdbuf_surface_func = {
+	.res_type = vmw_res_surface,
+	.needs_guest_memory = false,
+	.may_evict = false,
+	.type_name = "guest backed command buffer managed surface",
+	.domain = VMW_BO_DOMAIN_MOB,
+	.busy_domain = VMW_BO_DOMAIN_MOB,
+};
+
 /*
  * struct vmw_surface_dma - SVGA3D DMA command
  */
@@ -2362,3 +2373,145 @@ int vmw_dumb_create(struct drm_file *file_priv,
 
 	return ret;
 }
+
+struct vmw_cmdbuf_surface *vmw_res_to_cmdbuf_srf(struct vmw_resource *res)
+{
+	struct vmw_surface *surface = vmw_res_to_srf(res);
+
+	return container_of(surface, struct vmw_cmdbuf_surface, surface);
+}
+
+static struct vmw_resource *vmw_cmdbuf_surface_base_to_res(struct ttm_base_object *base)
+{
+	return &(container_of(base, struct vmw_cmdbuf_surface, base)->surface.res);
+}
+
+static void vmw_cmdbuf_surface_free(struct vmw_resource *res)
+{
+	struct vmw_cmdbuf_surface *surface = vmw_res_to_cmdbuf_srf(res);
+
+	ttm_base_object_kfree(surface, base);
+}
+
+static void vmw_cmdbuf_surface_base_release(struct ttm_base_object **p_base)
+{
+	struct ttm_base_object *base = *p_base;
+	struct vmw_resource *res = vmw_cmdbuf_surface_base_to_res(base);
+
+	*p_base = NULL;
+	vmw_resource_unreference(&res);
+}
+
+
+int vmw_cmdbuf_surface_define(struct vmw_private *dev_priv,
+			      struct vmw_sw_context *sw_context,
+			      struct vmw_surface_metadata *metadata,
+			      uint32 user_key)
+{
+	struct vmw_cmdbuf_surface *surface;
+	struct vmw_resource *res;
+	int ret = 0;
+
+	if (!has_sm4_1_context(dev_priv)) {
+		if (SVGA3D_FLAGS_UPPER_32(metadata->flags) != 0)
+			ret = -EINVAL;
+
+		if (metadata->multisample_count != 0)
+			ret = -EINVAL;
+
+		if (metadata->multisample_pattern != SVGA3D_MS_PATTERN_NONE)
+			ret = -EINVAL;
+
+		if (metadata->quality_level != SVGA3D_MS_QUALITY_NONE)
+			ret = -EINVAL;
+
+		if (ret) {
+			VMW_DEBUG_USER("SM4.1 surface not supported.\n");
+			return ret;
+		}
+	}
+
+	if (metadata->buffer_byte_stride > 0 && !has_sm5_context(dev_priv)) {
+		VMW_DEBUG_USER("SM5 surface not supported.\n");
+		return -EINVAL;
+	}
+
+	if ((metadata->flags & SVGA3D_SURFACE_MULTISAMPLE) &&
+	    metadata->multisample_count == 0) {
+		VMW_DEBUG_USER("Invalid sample count.\n");
+		return -EINVAL;
+	}
+
+	if (metadata->mip_levels[0] > DRM_VMW_MAX_MIP_LEVELS) {
+		VMW_DEBUG_USER("Invalid mip level.\n");
+		return -EINVAL;
+	}
+
+	if (metadata->autogen_filter != SVGA3D_TEX_FILTER_NONE)
+		return -EINVAL;
+
+	if (metadata->num_sizes != 1)
+		return -EINVAL;
+
+
+	surface = kzalloc(sizeof(*surface), GFP_KERNEL);
+	if (unlikely(!surface))
+		return -ENOMEM;
+
+	res = &surface->surface.res;
+
+	ret = vmw_resource_init(dev_priv, res, false, vmw_cmdbuf_surface_free,
+				&vmw_gb_cmdbuf_surface_func);
+	if (unlikely(ret != 0)) {
+		vmw_cmdbuf_surface_free(res);
+		return ret;
+	}
+
+	INIT_LIST_HEAD(&surface->surface.view_list);
+
+	ret = vmw_cmdbuf_res_add(sw_context->man, vmw_cmdbuf_res_surface,
+				 user_key, res, &sw_context->staged_cmd_res);
+	if (unlikely(ret != 0)) {
+		vmw_resource_unreference(&res);
+		return ret;
+	}
+
+	ret = ttm_base_object_init(sw_context->fp->tfile, &surface->base, true,
+				   VMW_RES_SURFACE,
+				   &vmw_cmdbuf_surface_base_release);
+	if (unlikely(ret != 0)) {
+		vmw_resource_unreference(&res);
+		return ret;
+	}
+
+	return 0;
+}
+
+int vmw_cmdbuf_surface_destroy(struct vmw_private *dev_priv,
+			       struct vmw_sw_context *sw_context,
+			       uint32 user_key)
+{
+	struct vmw_resource *res;
+	struct vmw_cmdbuf_surface *surface;
+	struct ttm_base_object *base;
+	struct ttm_object_file *tfile = sw_context->fp->tfile;
+	int ret;
+
+	ret = vmw_cmdbuf_res_remove(sw_context->man, vmw_cmdbuf_res_surface,
+				    user_key, &sw_context->staged_cmd_res,
+				    &res);
+	if (unlikely(ret != 0))
+		return ret;
+
+	surface = vmw_res_to_cmdbuf_srf(res);
+	base = &surface->base;
+
+	mutex_lock(&dev_priv->binding_mutex);
+	vmw_view_surface_list_destroy(dev_priv, &surface->surface.view_list);
+	vmw_binding_res_list_scrub(&res->binding_head);
+	mutex_unlock(&dev_priv->binding_mutex);
+
+	ttm_ref_object_base_unref(tfile, base->handle);
+
+	return 0;
+}
diff --git a/include/uapi/drm/vmwgfx_drm.h b/include/uapi/drm/vmwgfx_drm.h
index 7d786a0cc835..9b92ab1fd113 100644
--- a/include/uapi/drm/vmwgfx_drm.h
+++ b/include/uapi/drm/vmwgfx_drm.h
@@ -99,6 +99,9 @@ extern "C" {
  *
  * DRM_VMW_PARAM_DEVICE_ID
  * PCI ID of the underlying SVGA device.
+ *
+ * DRM_VMW_PARAM_USER_SRF
+ * Userspace managed surface support is enabled.
  */
 
 #define DRM_VMW_PARAM_NUM_STREAMS      0
@@ -119,6 +122,7 @@ extern "C" {
 #define DRM_VMW_PARAM_SM5              15
 #define DRM_VMW_PARAM_GL43             16
 #define DRM_VMW_PARAM_DEVICE_ID        17
+#define DRM_VMW_PARAM_USER_SRF         18
 
 /**
  * enum drm_vmw_handle_type - handle type for ref ioctls
-- 
2.43.0

