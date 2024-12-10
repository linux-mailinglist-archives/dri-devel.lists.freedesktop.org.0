Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BCC9EA688
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 04:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211FE10E5B2;
	Tue, 10 Dec 2024 03:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="LoQznGBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F334410E5B2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 03:23:13 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6d88cb85987so40624106d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 19:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1733800992; x=1734405792;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QqZokC3Pi/wzUBAEcvHHkCFF/44VYJfs+oXduBB/E0M=;
 b=LoQznGBSZ2UmjhdDzPjVVXLAfND+uGXETvLsGjwMzfYJNDkSgAgxpPmvXXZLB98FPF
 Wpf9flMdzqS4XqpUTdDH+oWNyMnss72muzhjDKCotxAZT3HVI9MmVzVHKCRzOEXBAirS
 FPx8q/jCX+EMOhEFLPjU+gclCt92E9AQ9dUhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733800992; x=1734405792;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QqZokC3Pi/wzUBAEcvHHkCFF/44VYJfs+oXduBB/E0M=;
 b=r6QFn1brlkRm0GpDqMved8GMZ9xDPbr71qJyWE4y/bIoObzJuPWX7ltcyjFACmc7o1
 pETSnUfEg9znMeEi7GXuT0EP/Bp87SwBdYH2DtP3/D3zkCrCBu5VKvUy7k4zYk0yQSaE
 xsdDxJCdLC2Ii1w88c8NqRCgwHF9F3JevBYOqC809tULEj2wB8aA3j8+A6Lx8Tyw41tW
 8v7TLycQFh4hON1c5isaQkyAnNQzWM8QB82ZBRe5N0jWRbePlbVT5Mn15ADTEq8oLqtR
 0RNhDu/xO0nYzwgiYAo4vsyGgvYs2tLKs3donztdZib90MomcFj+NDaps92Auv5okRUk
 jy7g==
X-Gm-Message-State: AOJu0YzRZ4+3dMQ5P1I4PV3qSyFIGdEmnQkQI52dcxsFZb4TiE/GDKSk
 sJBo5NVWDkM3ekcFzoJ0tDF0pmcbg28UGu1f8nI4tbmjUZ4+F9b3EZtG6AY7wQI/t+P0Vy0KKbi
 GJWCmzkjtcUEue3I+2hWP0fSlnIdPVH5XQNeAbAe2uM/UMYBDjT5vdK4CwUsr0WfAzyI1qPj9G0
 CNOgtR54VdwOc7NhF/LLwsXU0sG5pe9opIFsPbhz+H2F3c5wgaVfMegPVBtDSd
X-Gm-Gg: ASbGncsrdn+2bgqGVnmOgjfnPdTq0RMe9YC1OhBgyc1+7b+lJTrdLTYnetpYyUGH7NC
 9PmvM5QGPoJGRSobocMDHZN1+u41bGTnGd1m0j1czo8LjEnGcImjQcsoH9RuyN3AzxH+IVo8uFG
 7fdnKQY2Y79sahdz0eRmzECAc5ZL8/eBif3XlEbSMppZFImfVt3h4HLfrJXgc5EDdT4mb9V1xhM
 OQjaxmANLeBk1gLo1eOdUyk5RLVKPGRrQGvZIGy8G8OoeVNZnIK8ap7AdE2AN4O4NOENim0R9PX
 GIQQlpd5wP1z00r+6+oYSm4dMnlqIbGoyvjpbWcmY8biuqC1sRVPzTgP12idMlcJ
X-Google-Smtp-Source: AGHT+IG4ECsQXi3GeseI0I3OCL59PNWfE9sUnxearlovsKYFtRMORSU040fRCoRitEFGJuoJbiKulg==
X-Received: by 2002:a05:6214:3008:b0:6d8:7a85:59ca with SMTP id
 6a1803df08f44-6d921315466mr27931036d6.16.1733800992132; 
 Mon, 09 Dec 2024 19:23:12 -0800 (PST)
Received: from mombasawalam-Precision-5820-Tower.cap.broadcom.net
 ([216.221.25.44]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8ef223d18sm40871956d6.99.2024.12.09.19.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 19:23:10 -0800 (PST)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH v3 3/3] drm/vmwgfx: Add support for older define commands for
 userspace surfaces
Date: Mon,  9 Dec 2024 19:21:49 -0800
Message-ID: <20241210032149.2084068-4-maaz.mombasawala@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210032149.2084068-1-maaz.mombasawala@broadcom.com>
References: <20241210032149.2084068-1-maaz.mombasawala@broadcom.com>
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
Reply-To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Older HW versions of the svga device will only support older versions of
DefineGBSurface command.
Allow userspace to submit v3 and v2 of the DefineGBSurface command for
userspace managed surfaces. The first version of the command is not
supported since it is only used for pre-dx hardware.

Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 92 ++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 0468c9f4f293..71c1e0092d55 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3324,6 +3324,92 @@ vmw_cmd_get_expected_surface_version(struct vmw_private *dev_priv,
 	return 0;
 }
 
+static int vmw_cmd_define_gb_surface_v2(struct vmw_private *dev_priv,
+					struct vmw_sw_context *sw_context,
+					SVGA3dCmdHeader *header)
+{
+	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDefineGBSurface_v2);
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
+	metadata.autogen_filter = cmd->body.autogenFilter;
+	metadata.array_size = cmd->body.arraySize;
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
+static int vmw_cmd_define_gb_surface_v3(struct vmw_private *dev_priv,
+					struct vmw_sw_context *sw_context,
+					SVGA3dCmdHeader *header)
+{
+	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDefineGBSurface_v3);
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
 static int vmw_cmd_define_gb_surface_v4(struct vmw_private *dev_priv,
 					struct vmw_sw_context *sw_context,
 					SVGA3dCmdHeader *header)
@@ -3606,8 +3692,8 @@ static const struct vmw_cmd_entry vmw_cmd_entries[SVGA_3D_CMD_MAX] = {
 		    false, false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_GB_MOB_FENCE, &vmw_cmd_invalid,
 		    false, false, true),
-	VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE_V2, &vmw_cmd_invalid,
-		    false, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE_V2,
+		    &vmw_cmd_define_gb_surface_v2, true, false, true),
 
 	/* SM commands */
 	VMW_CMD_DEF(SVGA_3D_CMD_DX_DEFINE_CONTEXT, &vmw_cmd_invalid,
@@ -3761,6 +3847,8 @@ static const struct vmw_cmd_entry vmw_cmd_entries[SVGA_3D_CMD_MAX] = {
 		    true, false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_INTRA_SURFACE_COPY, &vmw_cmd_intra_surface_copy,
 		    true, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE_V3,
+		    &vmw_cmd_define_gb_surface_v3, true, false, true),
 
 	/*
 	 * SM5 commands
-- 
2.43.0

