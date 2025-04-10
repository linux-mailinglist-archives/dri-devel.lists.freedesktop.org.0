Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1F8A84D97
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 21:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146B110E177;
	Thu, 10 Apr 2025 19:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ZL5JCCO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CCA10E177
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:55:15 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-60297d7ab47so648097eaf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1744314914; x=1744919714;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=67QpnG1IpjBF7uPUMUchb2kmvWg0+ijtiH8x0A8xvfE=;
 b=ZL5JCCO1C8kytkciUaW13NfrfsotiipThmh7ZjgLfiIUwWOOZGSNMp249UDJELTCUO
 WmDi58sOp8Jt8pyZBrEHNQA2O898mnntche0mXvYciTto3jK7tJA9FHELHyflIW/T0Hd
 oI716LP9EUHKPy02k/sNiDPd9qcDOPq/H82xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744314914; x=1744919714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=67QpnG1IpjBF7uPUMUchb2kmvWg0+ijtiH8x0A8xvfE=;
 b=GiBAWKETWZDAksyWwDp+Ah1gRiilNie/uKUiicxc+TPL9tbnNkxaOX8pojJ0IIfEYH
 s1VCnXWucec68q47QTDZwstgt1hMziMJkXalsPp4Pajcc2ViV0EFIuM4kSh2loVpUxZQ
 aQREJcf4LM+j0OQfQFLn8Wi6vNZjdiiOhUf0Z2UCZepGUri9QTixi9vhoTEc5vD+uE0L
 EJO4SfPWcb5ueVsSVvM0mY2GwUTc88Jn5G3dQGok1hQ/1bPgdJ75R+5XmCAIeRbl26Jm
 cBxHf3pOXos69GBw5jIxVboWkwvF5A7r4/Z5Ra4p4cyD/ZpqcZifyM5Vv84+tiICwLny
 g3oQ==
X-Gm-Message-State: AOJu0Yz/af0heKAeZ7n90zWdMXAQjlNxvTziuQ+ObziHpeJ8/6RygAQf
 cm7bwB4g1cOcHPfYjXNuk8pN8+9HeuPIllUZZqqX0ncAmSfrJLE7ewPrNiYnSmCIFmz+6oMtB7X
 /AZKuWyI2W366fhKjyda7SjWd1aHMB10pF6KQWGeKErdZKXncN5IKz1SXRekd0bST7bEdcF5EKY
 ivaiX57ZaGkT0p7gEXBb8RfKCuvzaaLuS3v/RiS4aPtsvRO7KJ5yk7
X-Gm-Gg: ASbGncvQGcsuwa5+7jvhtIHPcNO061YxSI2pSiD6xs7CJ0oXVCp+fm3Da1Ld+y4Zbzo
 RAAscE3dwgzY2YUOx9bU7R2K639XEgaVgerBwK1o+GLFTYw7/RFVwf+sK13XwPFRt/MHE8DdVFD
 2BJErLCRMiur/AmYXjfPLIzEHBn9WxlLJjYyVsY/sdnmF0bm5SEln6haJOWmOC4MO7EDCv0ctUu
 po2DUWrUE1UbEfX5oqA0RV/OnS4fe4uuozeN60tpKLVRkFvABiETNUC85C8I10AYZZJDGQrbTNQ
 oz0sOFS3I89wpVk6FdZ5hZ84irkK818vClnMPA+6zssZNF2pa465KyptO6fK3c4IdEsKHWpehsU
 lVxcowfLIfg==
X-Google-Smtp-Source: AGHT+IEIqPFLKFKP7igEnsNRosHXRqTFN7K7NgQTciU268ZoP2hiNallsKcN3D1dM1Yz7qJAIt24Zg==
X-Received: by 2002:a05:6820:201:b0:603:ff3c:7d5e with SMTP id
 006d021491bc7-6046f5915ccmr19105eaf.5.1744314914501; 
 Thu, 10 Apr 2025 12:55:14 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6045f50eed4sm653599eaf.6.2025.04.10.12.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 12:55:14 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH 1/2] drm/vmwgfx: Update last_read_seqno under the fence lock
Date: Thu, 10 Apr 2025 14:55:06 -0500
Message-ID: <20250410195508.233367-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.49.0
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

There was a possible race in vmw_update_seqno. Because of this race it
was possible for last_read_seqno to go backwards. Remove this function
and replace it with vmw_update_fences which now sets and returns the
last_read_seqno while holding the fence lock. This serialization via the
fence lock ensures that last_read_seqno is monotonic again.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c     |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   | 18 +++++++++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h   |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c     | 12 +-----------
 6 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
index dd4ca6a9c690..8fe02131a6c4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
@@ -544,7 +544,7 @@ int vmw_cmd_send_fence(struct vmw_private *dev_priv, uint32_t *seqno)
 	cmd_fence = (struct svga_fifo_cmd_fence *) fm;
 	cmd_fence->fence = *seqno;
 	vmw_cmd_commit_flush(dev_priv, bytes);
-	vmw_update_seqno(dev_priv);
+	vmw_fences_update(dev_priv->fman);
 
 out_err:
 	return ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 594af8eb04c6..6d4a68f0ae37 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1006,7 +1006,6 @@ extern int vmw_fallback_wait(struct vmw_private *dev_priv,
 			     uint32_t seqno,
 			     bool interruptible,
 			     unsigned long timeout);
-extern void vmw_update_seqno(struct vmw_private *dev_priv);
 extern void vmw_seqno_waiter_add(struct vmw_private *dev_priv);
 extern void vmw_seqno_waiter_remove(struct vmw_private *dev_priv);
 extern void vmw_goal_waiter_add(struct vmw_private *dev_priv);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index e831e324e737..90ce5372343b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3878,8 +3878,7 @@ vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,
 
 		fence_rep.handle = fence_handle;
 		fence_rep.seqno = fence->base.seqno;
-		vmw_update_seqno(dev_priv);
-		fence_rep.passed_seqno = dev_priv->last_read_seqno;
+		fence_rep.passed_seqno = vmw_fences_update(dev_priv->fman);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 588d50ababf6..9d1465558839 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -172,7 +172,7 @@ vmwgfx_wait_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	wake_up_process(wait->task);
 }
 
-static void __vmw_fences_update(struct vmw_fence_manager *fman);
+static u32 __vmw_fences_update(struct vmw_fence_manager *fman);
 
 static long vmw_fence_wait(struct dma_fence *f, bool intr, signed long timeout)
 {
@@ -457,7 +457,7 @@ static bool vmw_fence_goal_check_locked(struct vmw_fence_obj *fence)
 	return true;
 }
 
-static void __vmw_fences_update(struct vmw_fence_manager *fman)
+static u32 __vmw_fences_update(struct vmw_fence_manager *fman)
 {
 	struct vmw_fence_obj *fence, *next_fence;
 	struct list_head action_list;
@@ -495,13 +495,16 @@ static void __vmw_fences_update(struct vmw_fence_manager *fman)
 
 	if (!list_empty(&fman->cleanup_list))
 		(void) schedule_work(&fman->work);
+	return (fman->dev_priv->last_read_seqno = seqno);
 }
 
-void vmw_fences_update(struct vmw_fence_manager *fman)
+u32 vmw_fences_update(struct vmw_fence_manager *fman)
 {
+	u32 seqno;
 	spin_lock(&fman->lock);
-	__vmw_fences_update(fman);
+	seqno = __vmw_fences_update(fman);
 	spin_unlock(&fman->lock);
+	return seqno;
 }
 
 bool vmw_fence_obj_signaled(struct vmw_fence_obj *fence)
@@ -778,7 +781,6 @@ int vmw_fence_obj_signaled_ioctl(struct drm_device *dev, void *data,
 		(struct drm_vmw_fence_signaled_arg *) data;
 	struct ttm_base_object *base;
 	struct vmw_fence_obj *fence;
-	struct vmw_fence_manager *fman;
 	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
 	struct vmw_private *dev_priv = vmw_priv(dev);
 
@@ -787,14 +789,12 @@ int vmw_fence_obj_signaled_ioctl(struct drm_device *dev, void *data,
 		return PTR_ERR(base);
 
 	fence = &(container_of(base, struct vmw_user_fence, base)->fence);
-	fman = fman_from_fence(fence);
 
 	arg->signaled = vmw_fence_obj_signaled(fence);
 
 	arg->signaled_flags = arg->flags;
-	spin_lock(&fman->lock);
-	arg->passed_seqno = dev_priv->last_read_seqno;
-	spin_unlock(&fman->lock);
+	arg->passed_seqno = READ_ONCE(dev_priv->last_read_seqno);
+
 
 	ttm_base_object_unref(&base);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
index a7eee579c76a..10264dab5f6a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
@@ -86,7 +86,7 @@ vmw_fence_obj_reference(struct vmw_fence_obj *fence)
 	return fence;
 }
 
-extern void vmw_fences_update(struct vmw_fence_manager *fman);
+u32 vmw_fences_update(struct vmw_fence_manager *fman);
 
 extern bool vmw_fence_obj_signaled(struct vmw_fence_obj *fence);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index 086e69a130d4..548ef2f86508 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -123,16 +123,6 @@ static bool vmw_fifo_idle(struct vmw_private *dev_priv, uint32_t seqno)
 	return (vmw_read(dev_priv, SVGA_REG_BUSY) == 0);
 }
 
-void vmw_update_seqno(struct vmw_private *dev_priv)
-{
-	uint32_t seqno = vmw_fence_read(dev_priv);
-
-	if (dev_priv->last_read_seqno != seqno) {
-		dev_priv->last_read_seqno = seqno;
-		vmw_fences_update(dev_priv->fman);
-	}
-}
-
 bool vmw_seqno_passed(struct vmw_private *dev_priv,
 			 uint32_t seqno)
 {
@@ -141,7 +131,7 @@ bool vmw_seqno_passed(struct vmw_private *dev_priv,
 	if (likely(dev_priv->last_read_seqno - seqno < VMW_FENCE_WRAP))
 		return true;
 
-	vmw_update_seqno(dev_priv);
+	vmw_fences_update(dev_priv->fman);
 	if (likely(dev_priv->last_read_seqno - seqno < VMW_FENCE_WRAP))
 		return true;
 
-- 
2.49.0

