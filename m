Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B130F60520C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 23:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C974610E0E7;
	Wed, 19 Oct 2022 21:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492A110E0E7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 21:35:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g27so27159197edf.11
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 14:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yiqpubSSRjqi+xo3Zt6mRBDg4WQe+McsHWUueSRR8rc=;
 b=ZVPAHbECm9m1eYbMBBh9dm9FZ/PRwITiBRs6KLA8kM4fWSiN6WK8hRCLJA3OYDEkrm
 ajNYPk9TcK/15qfelg34GMb1JG5u6n68n4/ipxOk0IqHwLoTULy3Wxv/iqWvsR0oBjjn
 9ynUYvg6TuCuclTLiQ3uctoTFs6UQkUCRuz4qMOV0dMPouTfTaYNqDq+Jywr4gFmAg8x
 dfFIODgyW5KcsvbZyrGeFA9B5ZgfmmxKwD4UQXIZL0owjwst7MYYXyPsbjGMVo8k61DI
 P1ZBdj9Zn38YNki9eyU0x1HVKadKQdTzYQYQtAyyPzIJlQJmxBpnHRk5qChQ8D1jwO0z
 aQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yiqpubSSRjqi+xo3Zt6mRBDg4WQe+McsHWUueSRR8rc=;
 b=go7hoEKODiJFxTvzR4K4Yk8n78lpbwagjjiyz09Hmvv+Q8c1YyCmPiYgOXwP3lVfDQ
 ZJHB96EBNwo021ptsnKP7mIlw/H0gMlyFXsiYEesRrNOomyMqkJmKErd2JG1wMfVwEQp
 c0BOaRFWdsNHaoxeKbgp9XOG3s3NwbvNRagawspwVcaxqyKGa73/r/3pLH7yCcuxCP2E
 uqTxVK/tK3MwGV904ES242vg3f/GWsyq9jwFpEZ7vdF6lYAuhINYHbRyshBKavmqXAz+
 mh/njPgHYT9+Lq0gKknHXEwyo1MJDSz3h1AV2wNc1zLOc2qL8QTJZstkXkuaCNr65rOi
 Z59A==
X-Gm-Message-State: ACrzQf0/JNYaO51yrEAjEw2fhC5kPVoI+LhTJ2AIpVzJoM6BWJGz6CMT
 tn6gGgf4UzdOJlG1fd9eMbQ=
X-Google-Smtp-Source: AMsMyM5p5Q+y3GHvQ1uQlf0tVyPoWXJvSJ0/bWAEhhHlK32H8om8vlPlJ0nMYGLQnHUtl0k07WGQmQ==
X-Received: by 2002:a05:6402:360d:b0:459:5f40:5b0a with SMTP id
 el13-20020a056402360d00b004595f405b0amr9017951edb.168.1666215305362; 
 Wed, 19 Oct 2022 14:35:05 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 bs15-20020a170906d1cf00b0077958ddaec6sm9232118ejb.186.2022.10.19.14.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 14:35:04 -0700 (PDT)
Message-ID: <ebe91504-c5df-99e4-635f-832218584051@gmail.com>
Date: Wed, 19 Oct 2022 23:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1] drm: rockchip: remove rockchip_drm_framebuffer_init()
 function
To: john@metanate.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function rockchip_drm_framebuffer_init() was in use
in the rockchip_drm_fbdev.c file, but that is now replaced
by a generic fbdev setup. Reduce the image size by
removing the rockchip_drm_framebuffer_init() and sub function
rockchip_fb_alloc() and cleanup the rockchip_drm_fb.h header file.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 43 ----------------------
 drivers/gpu/drm/rockchip/rockchip_drm_fb.h |  6 ---
 2 files changed, 49 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
index 092bf863110b..409eaa1bf092 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
@@ -25,35 +25,6 @@ static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
 	.dirty	       = drm_atomic_helper_dirtyfb,
 };
 
-static struct drm_framebuffer *
-rockchip_fb_alloc(struct drm_device *dev, const struct drm_mode_fb_cmd2 *mode_cmd,
-		  struct drm_gem_object **obj, unsigned int num_planes)
-{
-	struct drm_framebuffer *fb;
-	int ret;
-	int i;
-
-	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
-	if (!fb)
-		return ERR_PTR(-ENOMEM);
-
-	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
-
-	for (i = 0; i < num_planes; i++)
-		fb->obj[i] = obj[i];
-
-	ret = drm_framebuffer_init(dev, fb, &rockchip_drm_fb_funcs);
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev,
-			      "Failed to initialize framebuffer: %d\n",
-			      ret);
-		kfree(fb);
-		return ERR_PTR(ret);
-	}
-
-	return fb;
-}
-
 static const struct drm_mode_config_helper_funcs rockchip_mode_config_helpers = {
 	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
 };
@@ -106,20 +77,6 @@ static const struct drm_mode_config_funcs rockchip_drm_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-struct drm_framebuffer *
-rockchip_drm_framebuffer_init(struct drm_device *dev,
-			      const struct drm_mode_fb_cmd2 *mode_cmd,
-			      struct drm_gem_object *obj)
-{
-	struct drm_framebuffer *fb;
-
-	fb = rockchip_fb_alloc(dev, mode_cmd, &obj, 1);
-	if (IS_ERR(fb))
-		return ERR_CAST(fb);
-
-	return fb;
-}
-
 void rockchip_drm_mode_config_init(struct drm_device *dev)
 {
 	dev->mode_config.min_width = 0;
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.h b/drivers/gpu/drm/rockchip/rockchip_drm_fb.h
index 1a696521096d..bae4e079dfb1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.h
@@ -7,11 +7,5 @@
 #ifndef _ROCKCHIP_DRM_FB_H
 #define _ROCKCHIP_DRM_FB_H
 
-struct drm_framebuffer *
-rockchip_drm_framebuffer_init(struct drm_device *dev,
-			      const struct drm_mode_fb_cmd2 *mode_cmd,
-			      struct drm_gem_object *obj);
-void rockchip_drm_framebuffer_fini(struct drm_framebuffer *fb);
-
 void rockchip_drm_mode_config_init(struct drm_device *dev);
 #endif /* _ROCKCHIP_DRM_FB_H */
-- 
2.20.1

