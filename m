Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F652F8379
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5346E49F;
	Fri, 15 Jan 2021 18:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60846E487
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:54 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c5so10201910wrp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MJ7KZtujQH+M7WYSfXjbrtwaSb8NJHqNOy8ewxmrog0=;
 b=OSCRWS4K/ajKw4Zi62PGwkpsViCnA1HR+jyZqd33c/Gif+UcKSsDy8nuLWTbb3ulgG
 Rj1cIl3zLmJhOQ3MJPneCnt9fDjPHh5TAsfxE+72eyp+SUxRNiB4p2PuxgDlimgbLUfa
 plzZs5+VpWcoElqvf5DLn2vTz/22SVU+wUWqit2ToY3K6EJV9XUQ+ph5uPLgHKMhFqgc
 ABpG/zvcdfEn+mOSiw5xbsC8VcrnmFCCim8bHA8vH58iFKjf2Muercbsjc0M/Ij4NJnJ
 nPbsjeMoJUMrj12Y4ywpbkhGfEDkDECm04cazUNkd7SpfTE/ocAR7f2LFr2Qf1wjiVbl
 EQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MJ7KZtujQH+M7WYSfXjbrtwaSb8NJHqNOy8ewxmrog0=;
 b=c+OY0xIlDEC5+2Xiv6kdUjVWKukwWvoNTWggF+0OwffrxW17jq2J/ucPmWug4nFMob
 LGhIherNTIbo+ZmGL+VAxIyWdVTXpGeHjS00f/p4Wg1wGJNPuZZf+Ac+AG46BRqhfKEC
 LY5VVH0FHr0v4kzLJ4vq3eEvIUBxILndo8s+liw8l8zJEDx0/m8Z/lurPKlyh+g5PiVv
 iLAvz6jdQxcNWKdU9BAOe8092raXqWt1NI0z1D3PnPkw4Ert1dvQdPiHJthemuGLFqqc
 LRhpRL3V9dJ+0Wm58DSVpf/QKBfhSAJztjPenRaeHzx8ccoq0F8atwdDwcCmlL5Vjdw4
 CJFQ==
X-Gm-Message-State: AOAM530oMJKfOJ+KA/Xz/2FPSSU43cxT2wuJ+n7RTekWRg+Jk3n/pqJK
 /PKfDp7O2if2vxttnSQwd1N0Fw==
X-Google-Smtp-Source: ABdhPJwTmbb/YEI7MMSglrxGwfHJHkweU2le7lzyioimqu7GtEcCKqgv4qCRYVcve28UlB7pszj7eA==
X-Received: by 2002:adf:dc84:: with SMTP id r4mr14097827wrj.232.1610734433220; 
 Fri, 15 Jan 2021 10:13:53 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:52 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 23/40] drm/vmwgfx/vmwgfx_overlay: Demote kernel-doc abuses to
 standard comment blocks
Date: Fri, 15 Jan 2021 18:12:56 +0000
Message-Id: <20210115181313.3431493-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:48: warning: cannot understand function prototype: 'struct vmw_overlay '
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:98: warning: Function parameter or member 'dev_priv' not described in 'vmw_overlay_send_put'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:98: warning: Function parameter or member 'buf' not described in 'vmw_overlay_send_put'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:98: warning: Function parameter or member 'arg' not described in 'vmw_overlay_send_put'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:98: warning: Function parameter or member 'interruptible' not described in 'vmw_overlay_send_put'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:186: warning: Function parameter or member 'dev_priv' not described in 'vmw_overlay_send_stop'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:186: warning: Function parameter or member 'stream_id' not described in 'vmw_overlay_send_stop'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:186: warning: Function parameter or member 'interruptible' not described in 'vmw_overlay_send_stop'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:228: warning: Function parameter or member 'dev_priv' not described in 'vmw_overlay_move_buffer'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:228: warning: Function parameter or member 'buf' not described in 'vmw_overlay_move_buffer'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:228: warning: Function parameter or member 'pin' not described in 'vmw_overlay_move_buffer'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:228: warning: Function parameter or member 'inter' not described in 'vmw_overlay_move_buffer'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:253: warning: Function parameter or member 'dev_priv' not described in 'vmw_overlay_stop'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:253: warning: Function parameter or member 'stream_id' not described in 'vmw_overlay_stop'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:253: warning: Function parameter or member 'pause' not described in 'vmw_overlay_stop'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:253: warning: Function parameter or member 'interruptible' not described in 'vmw_overlay_stop'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:301: warning: Function parameter or member 'dev_priv' not described in 'vmw_overlay_update_stream'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:301: warning: Function parameter or member 'buf' not described in 'vmw_overlay_update_stream'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:301: warning: Function parameter or member 'arg' not described in 'vmw_overlay_update_stream'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:301: warning: Function parameter or member 'interruptible' not described in 'vmw_overlay_update_stream'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:364: warning: Function parameter or member 'dev_priv' not described in 'vmw_overlay_resume_all'
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:398: warning: Function parameter or member 'dev_priv' not described in 'vmw_overlay_pause_all'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
index d6d282c13b7f7..ac4a9b7222795 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
@@ -42,7 +42,7 @@ struct vmw_stream {
 	struct drm_vmw_control_stream_arg saved;
 };
 
-/**
+/*
  * Overlay control
  */
 struct vmw_overlay {
@@ -85,7 +85,7 @@ static inline void fill_flush(struct vmw_escape_video_flush *cmd,
 	cmd->flush.streamId = stream_id;
 }
 
-/**
+/*
  * Send put command to hw.
  *
  * Returns
@@ -174,7 +174,7 @@ static int vmw_overlay_send_put(struct vmw_private *dev_priv,
 	return 0;
 }
 
-/**
+/*
  * Send stop command to hw.
  *
  * Returns
@@ -216,7 +216,7 @@ static int vmw_overlay_send_stop(struct vmw_private *dev_priv,
 	return 0;
 }
 
-/**
+/*
  * Move a buffer to vram or gmr if @pin is set, else unpin the buffer.
  *
  * With the introduction of screen objects buffers could now be
@@ -235,7 +235,7 @@ static int vmw_overlay_move_buffer(struct vmw_private *dev_priv,
 	return vmw_bo_pin_in_vram_or_gmr(dev_priv, buf, inter);
 }
 
-/**
+/*
  * Stop or pause a stream.
  *
  * If the stream is paused the no evict flag is removed from the buffer
@@ -285,7 +285,7 @@ static int vmw_overlay_stop(struct vmw_private *dev_priv,
 	return 0;
 }
 
-/**
+/*
  * Update a stream and send any put or stop fifo commands needed.
  *
  * The caller must hold the overlay lock.
@@ -353,7 +353,7 @@ static int vmw_overlay_update_stream(struct vmw_private *dev_priv,
 	return 0;
 }
 
-/**
+/*
  * Try to resume all paused streams.
  *
  * Used by the kms code after moving a new scanout buffer to vram.
@@ -387,7 +387,7 @@ int vmw_overlay_resume_all(struct vmw_private *dev_priv)
 	return 0;
 }
 
-/**
+/*
  * Pauses all active streams.
  *
  * Used by the kms code when moving a new scanout buffer to vram.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
