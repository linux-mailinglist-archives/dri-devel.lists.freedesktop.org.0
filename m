Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7138A4A36D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 21:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CD710ED3D;
	Fri, 28 Feb 2025 20:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="GCii4FgL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660BD10ED2E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 20:06:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-439350f1a0bso16773465e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1740773200; x=1741378000;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wyPpwM9tKp011b4P59QV0O++RQOqYmaYv1KldCNLWOM=;
 b=GCii4FgLJRsAazqI44Ca+NmBG4aqJ8KeJ3hxlMvNYkP0w8OoPfzz4rehp17xFm130K
 CMkuvfv3BikUsvEF3cLPUL1tXiKONIaNNv9RiYw7G8z6XmKush2jR0yGcS8uYjKxHrUZ
 TS9DK9RUlt+LeU7W/y2AMf/e6+DZs5c7rNYOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740773200; x=1741378000;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wyPpwM9tKp011b4P59QV0O++RQOqYmaYv1KldCNLWOM=;
 b=LatfnJK7re5RsOK7CxFaCvbudL5UvIdM0UfIxTEDVg29Il8Kg/BCCW4BZ1D8xACo7h
 SSBCGEu59qIFpExhKOmww85sZjho6KlviqiPFfleG+YSihXHBur/+k1VUjegjPoTKnd+
 NsbaNulFaB1uAomh5meCdY2L2HMI8WsbbzgZBTHO7aphLkyvWcfhTnvQpOT5upFcc2rD
 J9bl5aFi4sRYcNBLPQC/7Zn0cnkyEsWIUM3wo97mtXuSFfvRgIeqSEX5Hc+eRL+eQ7XM
 8fp65FPF5OYQ7saCkRLjaJZAfbbn4HcLQxooBp1xLNxrqbw/gbKcVO17RrorABH3bf/M
 bzpg==
X-Gm-Message-State: AOJu0YxfnPhIqn5MJqhLuuLefVhG7+LYumaqYoaOLV2q57MWOQb7fv8t
 m4u881YUMmbtD/qNJDLvHBk7Pk9ebXpwDG/Zagnb6h2jwDGW+I8lNdiHOjkep0w7/Z7Rf0Nkv1Y
 kC2Vh/JwyAUWC+kvDuZYuM31VdZxzb2oYASNbXYMw4NfVDPEKyBSOSSbVtVgpiyEn+R29rdJDfj
 vMknsfAepxzjp9EtbHaIHbHqVti4klLcEQlUW6v/5qvjIXHzz9sg==
X-Gm-Gg: ASbGncvAMHdFuNi9Xmycx3NDR3h51s9PzBKTVk3ABKfTmFnUVXQJNYsAkocPLFDC6Kh
 e1pqzyPcgMwi1jsw6obEe3ku015HA2/mRt/Fy0Ccf+OI+IQbkk3iaizIHb0wWfljqQo6wc9U07L
 qAatYAopUlN5b7envAXFU8I4CXfkxgtPN522oeWfztuCnJotnWgzkVZD0egYtp/39Teh9f7wSys
 poY/yGAiWgSYIJv68ed05zWebOKtQBHKiwtyyh7lpi0UmGVSPwcussEXUqMzxW2XF8ivrlENgYt
 gVaDYqgSXjLpKM46kJ85DwPrWlIVLxxYjH/sdW3i3u+tULAZwSjbx64eUq1DNa8LJVU7aJM=
X-Google-Smtp-Source: AGHT+IFa7eL6AE9HaBV4/HScqHqwxUiHMLOhVL6d1eZfa3PFOHhxI/z55Vr4/TXPAPRdUPnb4fRA1Q==
X-Received: by 2002:a05:600c:1c9f:b0:434:9e17:190c with SMTP id
 5b1f17b1804b1-43ba6188e94mr40494845e9.0.1740773200469; 
 Fri, 28 Feb 2025 12:06:40 -0800 (PST)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba52b7ecsm98157605e9.3.2025.02.28.12.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 12:06:40 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Add seqno waiter for sync_files
Date: Fri, 28 Feb 2025 14:06:33 -0600
Message-ID: <20250228200633.642417-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.48.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because sync_files are passive waiters they do not participate in
the processing of fences like the traditional vmw_fence_wait IOCTL.
If userspace exclusively uses sync_files for synchronization then
nothing in the kernel actually processes fence updates as interrupts
for fences are masked and ignored if the kernel does not indicate to the
SVGA device that there are active waiters.

This oversight results in a bug where the entire GUI can freeze waiting
on a sync_file that will never be signalled as we've masked the interrupts
to signal its completion. This bug is incredibly racy as any process which
interacts with the fencing code via the 3D stack can process the stuck
fences on behalf of the stuck process causing it to run again. Even a
simple app like eglinfo is enough to resume the stuck process. Usually
this bug is seen at a login screen like GDM because there are no other
3D apps running.

By adding a seqno waiter we re-enable interrupt based processing of the
dma_fences associated with the sync_file which is signalled as part of a
dma_fence_callback.

This has likely been broken since it was initially added to the kernel in
2017 but has gone unnoticed until mutter recently started using sync_files
heavily over the course of 2024 as part of their explicit sync support.

Fixes: c906965dee22 ("drm/vmwgfx: Add export fence to file descriptor support")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 2e52d73eba48..ea741bc4ac3f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -4086,6 +4086,23 @@ static int vmw_execbuf_tie_context(struct vmw_private *dev_priv,
 	return 0;
 }
 
+/*
+ * DMA fence callback to remove a seqno_waiter
+ */
+struct seqno_waiter_rm_context {
+	struct dma_fence_cb base;
+	struct vmw_private *dev_priv;
+};
+
+static void seqno_waiter_rm_cb(struct dma_fence *f, struct dma_fence_cb *cb)
+{
+	struct seqno_waiter_rm_context *ctx =
+		container_of(cb, struct seqno_waiter_rm_context, base);
+
+	vmw_seqno_waiter_remove(ctx->dev_priv);
+	kfree(ctx);
+}
+
 int vmw_execbuf_process(struct drm_file *file_priv,
 			struct vmw_private *dev_priv,
 			void __user *user_commands, void *kernel_commands,
@@ -4266,6 +4283,15 @@ int vmw_execbuf_process(struct drm_file *file_priv,
 		} else {
 			/* Link the fence with the FD created earlier */
 			fd_install(out_fence_fd, sync_file->file);
+			struct seqno_waiter_rm_context *ctx =
+				kmalloc(sizeof(*ctx), GFP_KERNEL);
+			ctx->dev_priv = dev_priv;
+			vmw_seqno_waiter_add(dev_priv);
+			if (dma_fence_add_callback(&fence->base, &ctx->base,
+						   seqno_waiter_rm_cb) < 0) {
+				vmw_seqno_waiter_remove(dev_priv);
+				kfree(ctx);
+			}
 		}
 	}
 
-- 
2.48.1

