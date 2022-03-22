Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6024E3F56
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 14:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E12510E5BC;
	Tue, 22 Mar 2022 13:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D9410E5BA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 13:17:52 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 o30-20020a05600c511e00b0038c9cfb79cbso1459015wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XJ+iPJ12WjAWFtDcve1s8LZ+LhkE1q3/jMmz6RIgI3I=;
 b=X8tX8dA+T/zveUWfdBLG15k2Y125b3nEvbrA0JboK1X4DIK/0hIOOv9cFARVPF26N2
 /R34lc+VhGSXj+aZ6VWya9mT7DabCE1WjvGIifkQlR8le0vIy66WySqKoh2Jdccs5qZy
 s4rnVLvNgZn5+FEqRtgTZuL1cXRJ5GfbYoEHkzzWonYWGtgH/Z5H3ZdeVuRda9Y5lSH1
 DUuyE9muQFFNX/1Sl9b0zsVWYW0UNar2mVfrywz112FQWzkG6cga5lB2E7F3Timn/y1q
 zlSjrhyEuO3GTFM1RlC9Pnd4p3hKxlushaGC4IVGNGkof/+JsbczT1HLbVjIhZWpDkLw
 lnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XJ+iPJ12WjAWFtDcve1s8LZ+LhkE1q3/jMmz6RIgI3I=;
 b=RQKZMA2xKYoWbZzo2qBRF1obyCt7PerbWmK0UftEbTo+s9oc2JpB9jsqxF3OH4ykum
 hCksc9n2SKzW8n8L5/NXTN4pOya5Gzwcc6GGDVltCnnWEKVjV9drDaBd4H1e8vaspHbc
 bw/6HcnTRUC0uKKEzNmYSM/H1On6k9iLg5p2yu0iZvhBXhXcNFH3jzKYV46Om5TszM/t
 JKRpitC7hH/JaS0QLEDxKDvVLMnBUlrR1EYxA/LeDobfQwBQwUJ93BpDPwOFkIVUvjqG
 KgMqH7vfI0EzDlqFx3Ny55qoyOL0JL+KCqCfMqne4qNp3Furioof/0e5DhEyNy61b4ie
 WhKg==
X-Gm-Message-State: AOAM532FwcNVONwnJ9RTx5TGVLZdsZS6Fd056a3DERF1zk46I9CitrPM
 aEn/de0DcIvZtad26RjCj9VIiZyxCXc=
X-Google-Smtp-Source: ABdhPJxizhzPIoGHWMEOYd77rdNUvm+CQcunnUy/wfDp1OkcYrKcb7z4w6FyruDEt4yAEexWwzcJqg==
X-Received: by 2002:a05:600c:4b88:b0:38c:8f32:34df with SMTP id
 e8-20020a05600c4b8800b0038c8f3234dfmr3885715wmp.141.1647955070389; 
 Tue, 22 Mar 2022 06:17:50 -0700 (PDT)
Received: from workstation.suse.de (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600002ad00b00203d64c5289sm17978437wry.112.2022.03.22.06.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 06:17:49 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/gma500: Declare a few functions static
Date: Tue, 22 Mar 2022 14:17:41 +0100
Message-Id: <20220322131742.11566-6-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These functions are not used outside of their file scope so can be
declared as static.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/gma_display.c | 15 +++++++--------
 drivers/gpu/drm/gma500/psb_drv.c     |  2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index e8157464d9eb..369bc1f751cb 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -176,9 +176,9 @@ void gma_crtc_load_lut(struct drm_crtc *crtc)
 	}
 }
 
-int gma_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green, u16 *blue,
-		       u32 size,
-		       struct drm_modeset_acquire_ctx *ctx)
+static int gma_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green,
+			      u16 *blue, u32 size,
+			      struct drm_modeset_acquire_ctx *ctx)
 {
 	gma_crtc_load_lut(crtc);
 
@@ -323,10 +323,9 @@ void gma_crtc_dpms(struct drm_crtc *crtc, int mode)
 	REG_WRITE(DSPARB, 0x3F3E);
 }
 
-int gma_crtc_cursor_set(struct drm_crtc *crtc,
-			struct drm_file *file_priv,
-			uint32_t handle,
-			uint32_t width, uint32_t height)
+static int gma_crtc_cursor_set(struct drm_crtc *crtc,
+			       struct drm_file *file_priv, uint32_t handle,
+			       uint32_t width, uint32_t height)
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
@@ -439,7 +438,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 	return ret;
 }
 
-int gma_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
+static int gma_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 {
 	struct drm_device *dev = crtc->dev;
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index bb0e3288e35b..2aff54d505e2 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -100,7 +100,7 @@ static const struct drm_ioctl_desc psb_ioctls[] = {
  *
  *	Soft reset the graphics engine and then reload the necessary registers.
  */
-void psb_spank(struct drm_psb_private *dev_priv)
+static void psb_spank(struct drm_psb_private *dev_priv)
 {
 	PSB_WSGX32(_PSB_CS_RESET_BIF_RESET | _PSB_CS_RESET_DPM_RESET |
 		_PSB_CS_RESET_TA_RESET | _PSB_CS_RESET_USE_RESET |
-- 
2.35.1

