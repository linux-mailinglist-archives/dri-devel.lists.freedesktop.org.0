Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9FE2F836D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970406E486;
	Fri, 15 Jan 2021 18:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447C66E479
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id c124so8203629wma.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xM/nZ90UZtBcAp5QNv/pK0XIOjFNxIv5JhwEyUdhjVM=;
 b=jjY6jrbjNmOrQiQDYOGRkAAIiAp/6KDE3vmYhx4DqYAVJjpaPO83rezynTkZus38Qc
 t4wRn0YT/RSRwfnRTuWoEOpz/oXXr745uuuvPdCu+12MhIBHFSt2gJEvgsBLyW/9NYTv
 ly0ALvUs7CphR/MaClnLwLV8D5t+U1d613DS5Ggu7iVr21IFw0AJkn2+X1AVVVnIYVy7
 g5brib7pVjxVa/FshrKlb7Rwar9BQtK7rSn4J+HPC4TEdSofTkNVdXk5EfoJXoj/pd6L
 QoZ0ZMeczQrR7iFB5Q3YWBBBQnw5ClVzOK+CTQ2dAlRZP7Yi5bldSl6piHZfCrjplOtm
 eoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xM/nZ90UZtBcAp5QNv/pK0XIOjFNxIv5JhwEyUdhjVM=;
 b=VwbqsMt43mxEonq783xb+8ujdGIKt/1om4vRXtTMzMPVI/cgn7oCYRLJvjo7t8jqum
 WsQYvf932il0qkV1wMG/xiw9uBqG4EOjhA0+rI4Ti4ZekFdcgUM9pBFnpi3XMtija5Mh
 TG48xY8d7mpJujtBGsCPcYUuV/Jn85jAjVbz3vBbITVmH7PRiW1huMy0UD6LABXcQq67
 4nMemo91gZsTri2iujtPLtaE5bbX8R+js0zUMJo1gKtRmB9SjS/5VVk1i5Q/NYGyBcns
 lmAbj56PBGapaE0JXjkPdORKyQlT8uNvP63E46pw2XJHsEWJ8A3XqRwI8thwSB7zafN8
 dE+g==
X-Gm-Message-State: AOAM533MaI3y9gvz78riVvyWk++nUQvEToTRoKoESHs6jYsvP6KgBnqT
 /9uzzZUe9ky0rWb4DDPP5q4UmQ==
X-Google-Smtp-Source: ABdhPJyz6t3vpry+yHHvZkuxg824UAQtjwFbNBG9Psqyj5I2KEjDtM4i6aE0P4Q7B9LdiEt4kTRXPg==
X-Received: by 2002:a1c:356:: with SMTP id 83mr10209410wmd.31.1610734417929;
 Fri, 15 Jan 2021 10:13:37 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/40] drm/gma500/framebuffer: Fix some possible doc-rot issues
Date: Fri, 15 Jan 2021 18:12:47 +0000
Message-Id: <20210115181313.3431493-15-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/framebuffer.c:171: warning: Function parameter or member 'obj' not described in 'psb_framebuffer_init'
 drivers/gpu/drm/gma500/framebuffer.c:171: warning: Excess function parameter 'gt' description in 'psb_framebuffer_init'
 drivers/gpu/drm/gma500/framebuffer.c:212: warning: Function parameter or member 'obj' not described in 'psb_framebuffer_create'
 drivers/gpu/drm/gma500/framebuffer.c:212: warning: Excess function parameter 'gt' description in 'psb_framebuffer_create'
 drivers/gpu/drm/gma500/framebuffer.c:262: warning: Function parameter or member 'fb_helper' not described in 'psbfb_create'
 drivers/gpu/drm/gma500/framebuffer.c:262: warning: Excess function parameter 'fbdev' description in 'psbfb_create'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/framebuffer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 22c80e87aeb41..ebe9dccf2d830 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -159,7 +159,7 @@ static const struct fb_ops psbfb_unaccel_ops = {
  *	@dev: our DRM device
  *	@fb: framebuffer to set up
  *	@mode_cmd: mode description
- *	@gt: backing object
+ *	@obj: backing object
  *
  *	Configure and fill in the boilerplate for our frame buffer. Return
  *	0 on success or an error code if we fail.
@@ -197,7 +197,7 @@ static int psb_framebuffer_init(struct drm_device *dev,
  *	psb_framebuffer_create	-	create a framebuffer backed by gt
  *	@dev: our DRM device
  *	@mode_cmd: the description of the requested mode
- *	@gt: the backing object
+ *	@obj: the backing object
  *
  *	Create a framebuffer object backed by the gt, and fill in the
  *	boilerplate required
@@ -252,7 +252,7 @@ static struct gtt_range *psbfb_alloc(struct drm_device *dev, int aligned_size)
 
 /**
  *	psbfb_create		-	create a framebuffer
- *	@fbdev: the framebuffer device
+ *	@fb_helper: the framebuffer helper
  *	@sizes: specification of the layout
  *
  *	Create a framebuffer to the specifications provided
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
