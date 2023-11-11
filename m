Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4917E89D5
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 09:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE69610E255;
	Sat, 11 Nov 2023 08:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F32E10E10E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 04:30:22 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6ce322b62aeso1367724a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699677022; x=1700281822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0UeOfKSGtUGFS1M67vt4QeOHf8NL5FRLZhzwheHOXEQ=;
 b=ERB9oTaXG2kdqxSKXEYMXAiXTnFlL3C2Q4zHt3FcXDIaebZzGihendI1ooIHu6qK1D
 W+bRzMf/O76k2bOJIp74uHTJelJKkeIhULvkUqtuU4Wa2mMhsekh5+KD2DJ8rkUaov/f
 J5P+koYrAnPgWKHBxoFO0aoF2R9ABGQxQ1wCx6kNUHUC/pAqo2mqa1NI+3Z0ZX4j1+0a
 MJ5+98HyzKa3xsACXEn8As4q8yefqLHS82a1vPDcc/Jh/g1vpDMXWEbsj3E6ANpFssGj
 0Cizb3wRiGXr1QPwejog2SKKgfht0PAR2279DoUWJruV8ctL4RlK21236QJG1kkr91EL
 F88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699677022; x=1700281822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0UeOfKSGtUGFS1M67vt4QeOHf8NL5FRLZhzwheHOXEQ=;
 b=ocoJc+1P6sgxZSjSXWZEc6vu1rvs2qJbwVJoax82pKmeGzaNn3+4vkRhE4WmX1QFM3
 pe4Uw5K6e7/UOzYahu2D830N4qJ8EJcYyOS4csFfBkwnO9MlvqOatHIaQG26IFqE8MFY
 wvBY7XuESS1A/QWs9Bum2r8JGm6uSuyTuG73D5kEbTN+cMQQbchR6tB/5Tm4ztbaclBc
 9mUW111IJWUWdwrZV1op3Kg8KTIgE+e/+rq0DiS6KNTHUrClMWyhKSO4FSnVQQPxJaDU
 yQR0/7K98yzAbp/LHrJ6L3ioyYpeJWQgjunUz6QEHp9W+VN/mpjbP48+2Mlu+dGygLv2
 rzTw==
X-Gm-Message-State: AOJu0YyHh3ZLJLSIS6dR7ak4ZXNv9THlzZpydbJ849VyDSxyjgjc3yTd
 aEAaJGniROqUg8c4MCc3Jcs=
X-Google-Smtp-Source: AGHT+IGqm442xKF6kqYoBxkN0ltyPIsvs6VvlDXjXkHff5Tv5uMmiXes6nVYN8UQxl3ctcJwjcpiKw==
X-Received: by 2002:a9d:684d:0:b0:6c4:a349:4b10 with SMTP id
 c13-20020a9d684d000000b006c4a3494b10mr1064937oto.28.1699677021877; 
 Fri, 10 Nov 2023 20:30:21 -0800 (PST)
Received: from macbook.lan (119-18-27-45.77121b.mel.nbn.aussiebb.net.
 [119.18.27.45]) by smtp.gmail.com with ESMTPSA id
 a8-20020a1709027d8800b001c74df14e6esm469672plm.51.2023.11.10.20.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 20:30:21 -0800 (PST)
From: Andrew Worsley <amworsley@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR FIRMWARE
 FRAMEBUFFERS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] Fix failure of simpledrm probe when trying to grab FB from
 the EFI-based Framebuffer
Date: Sat, 11 Nov 2023 15:21:22 +1100
Message-ID: <20231111042926.52990-2-amworsley@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231111042926.52990-1-amworsley@gmail.com>
References: <20231111042926.52990-1-amworsley@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 11 Nov 2023 08:24:49 +0000
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
Cc: Andrew Worsley <amworsley@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

   The simpledrm.c does not call aperture_remove_conflicting_devices() in it's probe
   function as the drivers/video/aperture.c documentation says it should. Consequently
   it's request for the FB memory fails.

...
[    3.085302] simple-framebuffer bd58dc000.framebuffer: [drm] *ERROR* could not acquire memory range [??? 0xffff6e1d8629d580-0x2a5000001a7 flags 0x0]: -16
[    3.086433] simple-framebuffer: probe of bd58dc000.framebuffer failed with error -16
...

   In my case no driver provided /dev/dri/card0 device is available on boot up and X
   fails to start as per this from X start up log.

...
[     5.616] (WW) Falling back to old probe method for modesetting
[     5.616] (EE) open /dev/dri/card0: No such file or directory
...

   Fault confirmed and fixed on Asahi 6.5.0 kernel with both CONFIG_FB_EFI and
   CONFIG_DRM_SIMPLEDRM config options set.

Signed-off-by: Andrew Worsley <amworsley@gmail.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 5fefc895bca2..e55a536b04cf 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -8,6 +8,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
+#include <linux/aperture.h>
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic.h>
@@ -828,6 +829,13 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	if (mem) {
 		void *screen_base;
 
+		ret = aperture_remove_conflicting_devices(mem->start, resource_size(mem),
+			DRIVER_NAME);
+		if (ret) {
+			drm_err(dev, "aperture_remove_conflicting_devices: failed:%d\n",
+			    __func__, ret);
+			return ERR_PTR(ret);
+		}
 		ret = devm_aperture_acquire_from_firmware(dev, mem->start, resource_size(mem));
 		if (ret) {
 			drm_err(dev, "could not acquire memory range %pr: %d\n", mem, ret);
@@ -848,6 +856,13 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		if (!res)
 			return ERR_PTR(-EINVAL);
 
+		ret = aperture_remove_conflicting_devices(res->start, resource_size(res),
+			DRIVER_NAME);
+		if (ret) {
+			drm_err(dev, "aperture_remove_conflicting_devices: failed:%d\n",
+			    __func__, ret);
+			return ERR_PTR(ret);
+		}
 		ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
 		if (ret) {
 			drm_err(dev, "could not acquire memory range %pr: %d\n", res, ret);
-- 
2.42.0

