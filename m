Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D2D32B839
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424DC6E90A;
	Wed,  3 Mar 2021 13:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957426E906
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u14so23749896wri.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z4Bk/fTuFhVwU/7FdAPiJXssZfF9MOQHB9tTd64Ps9M=;
 b=bEmdaWNLhP8BgCpTYOqqi5FrXxWCwm/ouH5jo0mOjUndvlW/t72D+sET79M7hYkuf8
 auszFOXzFkigj84a5CFL2GUvyYd4efIIAisNzb14GY7wbqPqL2SK4lBJLsKdiY1amcQn
 fM5Yp/MDNth96VhuiwO5pLQkBf9NsVQGRgydLWC6VMfF6Enyp5ZqM0Y2vLbJCcRVmlQf
 HmZmErIQDtfdd7a82n2ydHDC1PVXW4TEmBLhgG62/DcUF/O4a+4BioT/G0PTdrOHDiVC
 JjlAtgKdxW7t23lkmFYNl5ud93kWxJkYti8+8cQ0ymG1H8gy/QiU9GMiM6f0rgUCohym
 d9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z4Bk/fTuFhVwU/7FdAPiJXssZfF9MOQHB9tTd64Ps9M=;
 b=MKKDppEYEXzkJKqYhpyxCl4rQP2eURzDSLrfr5fKvxsq4j5Igux0XIdqc4wJf+ISKi
 tcZ6llqHXY1uEPD+/fK+7MqOdmYCjoMBoayAoUeyFTKGonSZ/W7+UBp45KKc3kApuqwj
 iIMzAbOBGxA45l64VvhwNGu1t6Pj37wPJWSr77FUspg/Qj2NtOckufES9XfDvRS4IZ3w
 hGONfjm9dq0dVgawbO0Z5lHIYYgmP/iqLeyfFENCgTXreQzcg0HHoWfP6rElvu0zlFU7
 H149BV/lUnq1KcYjpEnhktoLmbfELF9JBwR4ULE1dpAzT+kT5lWJJxyKgIauquOs8UeA
 BGTw==
X-Gm-Message-State: AOAM53282ZjygXL10TJ+78rFGjbG5L+8Qi/aXXVbh4LgOW+dU14fBdhd
 7Q1ko2bncOksMXhL3lkv+m91tQ==
X-Google-Smtp-Source: ABdhPJzTgP1Y2LWJIejPOIa/WtOvSSVoKtlodrpESY6uinkDbzJWvahfvKjsPKrr5LM2TTQGVF1ibg==
X-Received: by 2002:adf:fb49:: with SMTP id c9mr27871005wrs.72.1614779048260; 
 Wed, 03 Mar 2021 05:44:08 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:07 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 33/53] drm/vmwgfx/vmwgfx_overlay: Demote kernel-doc abuses to
 standard comment blocks
Date: Wed,  3 Mar 2021 13:42:59 +0000
Message-Id: <20210303134319.3160762-34-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-24-lee.jones@linaro.org
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
