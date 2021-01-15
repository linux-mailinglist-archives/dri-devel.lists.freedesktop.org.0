Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB302F837F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CBF6E0CA;
	Fri, 15 Jan 2021 18:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC576E4AA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:14:16 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id y187so8409894wmd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dkKAWRNMkHThiFz1M9uddp3Rd+YUVjBVQ8G0RRd1tPg=;
 b=o7PuaCI40GcwIe5PjjeOUWjBVVmNduFjVrX6LvSBREgDSRwEdcNazPXmpCSJJ3Abqp
 jHvxty8xwYtPpKoc8z0rMM48pZooE9DKPitlXD33YwkvNDAxgNfkzj2mDrBh2Z2o1FMo
 hPV/x2CCq7i4Jk5E7vLIuVQG8MfdtET82/eo1sYvUXNGPgNynkqb2VEZdnTcVRjFaECE
 VA6D/pnRGbVutsRAQDoVguz3v4iUPTtJFq7Jtx6ClYl3xKwV9kmQRHguoB/YAAtgkVYq
 xmNd+4nEIrsGksJR0dszRBUb7U8iqVNiILWrdJB1Pr3DcAo+GE8dKXLPiM3qthrpjTzS
 QUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dkKAWRNMkHThiFz1M9uddp3Rd+YUVjBVQ8G0RRd1tPg=;
 b=FY+hkux0gnjcIWyUZ0YCHGFMydPo3rrW2AV9MVrxZjiov6nWn8fUpthNrMp0U/ZCk4
 w0r6oFACWFi6vwoDfmVfzX9bKbfhv2bmDjeNU0zt6yh5Ncyqts/Kc+bpBL6AlZHt3RqL
 k1rwdB8XHPHIs0imAwCVSjR+JUaLwDSUq6I5a17T5s7gRLqvd03XwOKdK+WqCrkxdBbW
 X+x4X9XMYFTq+25wIbQnHvAByl6YpELUzHAIuPpe3NeiEcZ0DuN2f6HBC/IwvTJVthG8
 ITETauuRauNWpyh/sJp5Z0OBs5mT1ogirSE9iYXHOmBTkQ1E5LAiuOMgdy9iHGVs/gfK
 w7bQ==
X-Gm-Message-State: AOAM532TDyPxxZamNLvtxXYVyfV0kZXKptjx7rllPB6TDi6+TndqQMEL
 SM3g1nN+k6S5EovS53svp7tQNQ==
X-Google-Smtp-Source: ABdhPJyKfyhmRu1cvc+Cry6amUJ6hGG93mmiVURVcRG8yFp5kRHmojpm3WIR7qhof1KcethsJwFtcQ==
X-Received: by 2002:a7b:c2e8:: with SMTP id e8mr9709934wmk.103.1610734454715; 
 Fri, 15 Jan 2021 10:14:14 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:14:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 40/40] drm/vmwgfx/vmwgfx_stdu: Add some missing param/member
 descriptions
Date: Fri, 15 Jan 2021 18:13:13 +0000
Message-Id: <20210115181313.3431493-41-lee.jones@linaro.org>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:77: warning: Function parameter or member 'pitch' not described in 'vmw_stdu_dirty'
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:125: warning: Function parameter or member 'content_fb_type' not described in 'vmw_screen_target_display_unit'
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:125: warning: Function parameter or member 'display_width' not described in 'vmw_screen_target_display_unit'
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:125: warning: Function parameter or member 'display_height' not described in 'vmw_screen_target_display_unit'
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:125: warning: Function parameter or member 'cpp' not described in 'vmw_screen_target_display_unit'
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:682: warning: Function parameter or member 'user_fence_rep' not described in 'vmw_kms_stdu_dma'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index fbe9778813648..01567534f4fae 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -61,6 +61,7 @@ enum stdu_content_type {
  * @bottom: Bottom side of bounding box.
  * @fb_left: Left side of the framebuffer/content bounding box
  * @fb_top: Top of the framebuffer/content bounding box
+ * @pitch: framebuffer pitch (stride)
  * @buf: buffer object when DMA-ing between buffer and screen targets.
  * @sid: Surface ID when copying between surface and screen targets.
  */
@@ -109,8 +110,11 @@ struct vmw_stdu_update_gb_image {
  *               content_vfbs dimensions, then this is a pointer into the
  *               corresponding field in content_vfbs.  If not, then this
  *               is a separate buffer to which content_vfbs will blit to.
- * @content_type:  content_fb type
- * @defined:  true if the current display unit has been initialized
+ * @content_fb_type: content_fb type
+ * @display_width:  display width
+ * @display_height: display height
+ * @defined:     true if the current display unit has been initialized
+ * @cpp:         Bytes per pixel
  */
 struct vmw_screen_target_display_unit {
 	struct vmw_display_unit base;
@@ -652,6 +656,7 @@ static void vmw_stdu_bo_cpu_commit(struct vmw_kms_dirty *dirty)
  * @file_priv: Pointer to a struct drm-file identifying the caller. May be
  * set to NULL, but then @user_fence_rep must also be set to NULL.
  * @vfb: Pointer to the buffer-object backed framebuffer.
+ * @user_fence_rep: User-space provided structure for fence information.
  * @clips: Array of clip rects. Either @clips or @vclips must be NULL.
  * @vclips: Alternate array of clip rects. Either @clips or @vclips must
  * be NULL.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
