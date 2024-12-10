Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A8C9EA687
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 04:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C298F10E5B8;
	Tue, 10 Dec 2024 03:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="f8KzHhwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41A910E5B8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 03:23:09 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id
 d75a77b69052e-46769b34cbfso19750261cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 19:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1733800987; x=1734405787;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0kvBw/ZUh6m5AksiYqYQD2QsenAQOyEsARlhoTSyIcc=;
 b=f8KzHhwBjICThI3mXeLlvyxrnAJI+WDNrdF3xXY1M+ZWlt8vWraJqngth+sfz1s2LA
 vFoMY3FeRRFtKZlOFqF8u7vg+46Um6Gsjfzq0+S7mWHBGoPf9n0i2F58Op+v17A8DGDX
 ErGiYePwBJLJalqncY2VlY/AuOgsfsYN5a0qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733800987; x=1734405787;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0kvBw/ZUh6m5AksiYqYQD2QsenAQOyEsARlhoTSyIcc=;
 b=vAOHRFavEqtYVUmLJSDyTRlh5aUEfd6ANWkp2Hjc/Z1G6UM9UovA+OqlibcAfqT4mg
 PVvIUQcpZrVvwQb6XMMR9UDB1cAcVadXjsiqO8kRJQ5rzSp26MLLWQkylY2VFqjieHIc
 JBvUXw1isj0t8WaDJZSQIoShQ8WNiwlWKL0hhPerxfs1/66J4ZdXuXhHFpGeOe41Wj45
 AjbDLyZ76daOYADowmDa0gWuU4PR3UgRXb4yaA4MGqlX2vbS5n8HC2T5jGCPkkwPICYA
 X9yjKokY7HmLSip1zEd+BubJtUjlhuhhuKXO9cMbJaHol9QxOo147woNhKvlbBXf3sf7
 z2sw==
X-Gm-Message-State: AOJu0YxIlMdlk9GnzheKv1s0LHkeoqyEZjvUlRTYzDCWh4zDIlLbRHiV
 6cl+El6wICwg92/34qFToikViF1+cHIwPOJ0ROPaW872kv1JJxoxRnXTY5lZBWNK+0ZNotfQv3b
 fJ7v+eYv8uyLwelqscThKhj41vsXagzNt6qPuQZ5CIJeXConC0GhwCQFjXXNzSiWNq0AG/O3vUl
 rU7lPBhoILP+bWWFeOb6CGTnoYwl9G6i8YCTHIYw5AkSv+CRG0nP2Pbv6AHhRNlQU=
X-Gm-Gg: ASbGncunpbesZSU9aqYlr7rYfUwNJoyqChMzZ871CCo4muFzF8U6yErJS4VF4u1QYaB
 wS/EQ4/QYepZ0m5CVQ5NsPEdwNDZ64dIHjGRTB/HmR2MxqK4gyIGOPOo1J0kHflbrc7iYKoxqEM
 aUfL9JpC79quOE2+44XIjLlXFriGxWRQORacimJF57HC8OtDPhdwU9/CebcxzrhFbK7Urjgt9iZ
 5li/35PFm/t+rhGE4xrYihlIddvwnmMrgFL6tI3ZY8wDzNxESyIVIwU58bqMuvNcH7N6xGWSBIr
 B7EsKkO8bzBhGhJKbVlT37fGJocLggKIo39uqwu8rAgbfCQoWlfVYieFcYWDw/jd
X-Google-Smtp-Source: AGHT+IF2VDiVE3NXsNkK62eUfO3cKYyi1PsDPxUoybKpLmBWr+NuQLrsYeylbW3zDplVCj5Jvx81Mw==
X-Received: by 2002:a05:6214:e64:b0:6d4:1680:612d with SMTP id
 6a1803df08f44-6d91e162591mr55863886d6.0.1733800987302; 
 Mon, 09 Dec 2024 19:23:07 -0800 (PST)
Received: from mombasawalam-Precision-5820-Tower.cap.broadcom.net
 ([216.221.25.44]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8ef223d18sm40871956d6.99.2024.12.09.19.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 19:23:04 -0800 (PST)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH v3 2/3] drm/vmwgfx: Support hw_destroy for userspace managed
 surfaces
Date: Mon,  9 Dec 2024 19:21:48 -0800
Message-ID: <20241210032149.2084068-3-maaz.mombasawala@broadcom.com>
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

A userspace may create a userspace managed surface but not destroy it,
add hw_destroy function for userspace surfaces so that vmwgfx records the
destroy command and submits it when the userspace context is destroyed.

Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 43 +++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 3f541e96e6b6..4e7edcbe398b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -113,6 +113,8 @@ static int vmw_surface_dirty_sync(struct vmw_resource *res);
 static void vmw_surface_dirty_range_add(struct vmw_resource *res, size_t start,
 					size_t end);
 static int vmw_surface_clean(struct vmw_resource *res);
+static void vmw_cmdbuf_surface_commit_notify(struct vmw_resource *res,
+					     enum vmw_cmdbuf_res_state state);
 
 static const struct vmw_user_resource_conv user_surface_conv = {
 	.object_type = VMW_RES_SURFACE,
@@ -165,6 +167,7 @@ static const struct vmw_res_func vmw_gb_cmdbuf_surface_func = {
 	.type_name = "guest backed command buffer managed surface",
 	.domain = VMW_BO_DOMAIN_MOB,
 	.busy_domain = VMW_BO_DOMAIN_MOB,
+	.commit_notify = vmw_cmdbuf_surface_commit_notify,
 };
 
 /*
@@ -2408,6 +2411,46 @@ static void vmw_cmdbuf_surface_base_release(struct ttm_base_object **p_base)
 }
 
 
+static void vmw_cmdbuf_surface_hw_destroy(struct vmw_resource *res)
+{
+	struct vmw_private *dev_priv = res->dev_priv;
+	struct vmw_cmdbuf_surface *surface;
+	struct {
+		SVGA3dCmdHeader header;
+		SVGA3dCmdDestroyGBSurface body;
+	} *cmd;
+
+	if (res->id == -1)
+		return;
+
+	surface = vmw_res_to_cmdbuf_srf(res);
+	mutex_lock(&dev_priv->binding_mutex);
+	vmw_view_surface_list_destroy(dev_priv, &surface->surface.view_list);
+	vmw_binding_res_list_scrub(&res->binding_head);
+
+	cmd = VMW_CMD_RESERVE(dev_priv, sizeof(*cmd));
+	if (unlikely(!cmd)) {
+		mutex_unlock(&dev_priv->binding_mutex);
+		return;
+	}
+
+	cmd->header.id = SVGA_3D_CMD_DESTROY_GB_SURFACE;
+	cmd->header.size = sizeof(cmd->body);
+	cmd->body.sid = res->id;
+	vmw_cmd_commit(dev_priv, sizeof(*cmd));
+	mutex_unlock(&dev_priv->binding_mutex);
+}
+
+static void vmw_cmdbuf_surface_commit_notify(struct vmw_resource *res,
+					     enum vmw_cmdbuf_res_state state)
+{
+	if (state == VMW_CMDBUF_RES_ADD)
+		res->hw_destroy = vmw_cmdbuf_surface_hw_destroy;
+	else
+		res->hw_destroy = NULL;
+}
+
+
 int vmw_cmdbuf_surface_define(struct vmw_private *dev_priv,
 			      struct vmw_sw_context *sw_context,
 			      struct vmw_surface_metadata *metadata,
-- 
2.43.0

