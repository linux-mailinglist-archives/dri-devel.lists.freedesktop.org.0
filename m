Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0612F83BC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5DD6E500;
	Fri, 15 Jan 2021 18:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48A16E4E8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l12so4984747wry.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W4lgvadJF0F6Eqo3TsN4IbMPwQEK3WYj/tmMeRVVJp8=;
 b=xlXITN0crvrSfNXAA3TYXbkG3biTTGWh/FeKcc0GwUfWToBTn1ZXsAlSAbSueg2VGo
 +xdTKtHkmYD4VLKzQ41PLO5LgxjNajgA8OiYgPCHvE18+WPzFxNqVrgzX48+8s90jXVm
 tdhh84IqxXC5EWBtLDwAiayJRWdFqc/fC1NbGjNc86XPp0MhXxyhwJf683KgKhTRFbUP
 Y+rwIuYviFsc4lI53HTwOaMC9bGDZb4XlLes1MFd3K2xpE5AvIRVKr9TMyy8+JW+DHW+
 TR/6qjtTrr9bjhQQ6sqyLlu8erF2tlDZYgQJ4FvL6WY+vFG+5BC/zNo1iI80ohX8Nin0
 oFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W4lgvadJF0F6Eqo3TsN4IbMPwQEK3WYj/tmMeRVVJp8=;
 b=ndT4HZWhv2YYIcaBwcAvcV8s1bqIT4NYvfKvkeUfvDMxJIfG6W21bRReqeCXpJMPZH
 a2n95yUnD0LzOtqFhsNrIQdmKLs/tla/6Yurnq9WJHnG8Nw7J/t5e/rJ0tqffF7I76RA
 x64ia0+Iz+K/djPpW+uZ14mC55achcz8DePs6bJdVFYlxHSDzW3RGvUX0auDbHhUm6LA
 txROGDmBMUoE3hDM7OXcpyil+avTvF+CdHwrQhSJcX056IGCwDs8L13mtuUbXIQTU5Xo
 2hi6aQlqyMlXMTpQDNUvJaCcHHqmO0i+YHAxnDP/I05RU1M0MP6eCaQk3SAYlT05plmM
 R5Yw==
X-Gm-Message-State: AOAM532Uo42p0MSRqHlxq0ulFo+q/t39WKV6o8LX9yms9Vt3iQr+R4hs
 H1sTmbUCBgwiURC075l6fbOdeg==
X-Google-Smtp-Source: ABdhPJwEvDmWbuyVUDSx+nnayljY66PPzuJiohq5lZ+voVXpmesn4219lFVLvwaeM8v/+T2zH2oZDQ==
X-Received: by 2002:adf:f4d0:: with SMTP id h16mr14699029wrp.30.1610734597599; 
 Fri, 15 Jan 2021 10:16:37 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 23/29] drm/drm_agpsupport: Strip out obviously wrong
 descriptions and demote to standard headers
Date: Fri, 15 Jan 2021 18:15:55 +0000
Message-Id: <20210115181601.3432599-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Faith <faith@valinux.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Gareth Hughes <gareth@valinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/drm_agpsupport.c:61: warning: Function parameter or member 'dev' not described in 'drm_agp_info'
 drivers/gpu/drm/drm_agpsupport.c:61: warning: Function parameter or member 'info' not described in 'drm_agp_info'
 drivers/gpu/drm/drm_agpsupport.c:105: warning: Function parameter or member 'dev' not described in 'drm_agp_acquire'
 drivers/gpu/drm/drm_agpsupport.c:132: warning: Function parameter or member 'dev' not described in 'drm_agp_acquire_ioctl'
 drivers/gpu/drm/drm_agpsupport.c:132: warning: Function parameter or member 'data' not described in 'drm_agp_acquire_ioctl'
 drivers/gpu/drm/drm_agpsupport.c:132: warning: Function parameter or member 'file_priv' not described in 'drm_agp_acquire_ioctl'
 drivers/gpu/drm/drm_agpsupport.c:145: warning: Function parameter or member 'dev' not described in 'drm_agp_release'
 drivers/gpu/drm/drm_agpsupport.c:171: warning: Function parameter or member 'dev' not described in 'drm_agp_enable'
 drivers/gpu/drm/drm_agpsupport.c:171: warning: Function parameter or member 'mode' not described in 'drm_agp_enable'
 drivers/gpu/drm/drm_agpsupport.c:203: warning: Function parameter or member 'dev' not described in 'drm_agp_alloc'
 drivers/gpu/drm/drm_agpsupport.c:203: warning: Function parameter or member 'request' not described in 'drm_agp_alloc'
 drivers/gpu/drm/drm_agpsupport.c:256: warning: Function parameter or member 'dev' not described in 'drm_agp_lookup_entry'
 drivers/gpu/drm/drm_agpsupport.c:256: warning: Function parameter or member 'handle' not described in 'drm_agp_lookup_entry'
 drivers/gpu/drm/drm_agpsupport.c:279: warning: Function parameter or member 'dev' not described in 'drm_agp_unbind'
 drivers/gpu/drm/drm_agpsupport.c:279: warning: Function parameter or member 'request' not described in 'drm_agp_unbind'
 drivers/gpu/drm/drm_agpsupport.c:318: warning: Function parameter or member 'dev' not described in 'drm_agp_bind'
 drivers/gpu/drm/drm_agpsupport.c:318: warning: Function parameter or member 'request' not described in 'drm_agp_bind'
 drivers/gpu/drm/drm_agpsupport.c:363: warning: Function parameter or member 'dev' not described in 'drm_agp_free'
 drivers/gpu/drm/drm_agpsupport.c:363: warning: Function parameter or member 'request' not described in 'drm_agp_free'
 drivers/gpu/drm/drm_agpsupport.c:404: warning: Function parameter or member 'dev' not described in 'drm_agp_init'

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Faith <faith@valinux.com>
Cc: Gareth Hughes <gareth@valinux.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/drm_agpsupport.c | 46 ++++++++------------------------
 1 file changed, 11 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupport.c
index 8b690ef306dec..7ae446fb84ad2 100644
--- a/drivers/gpu/drm/drm_agpsupport.c
+++ b/drivers/gpu/drm/drm_agpsupport.c
@@ -45,13 +45,9 @@
 
 #include "drm_legacy.h"
 
-/**
+/*
  * Get AGP information.
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg pointer to a (output) drm_agp_info structure.
  * \return zero on success or a negative number on failure.
  *
  * Verifies the AGP device has been initialized and acquired and fills in the
@@ -92,7 +88,7 @@ int drm_agp_info_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-/**
+/*
  * Acquire the AGP device.
  *
  * \param dev DRM device that is to acquire AGP.
@@ -115,13 +111,9 @@ int drm_agp_acquire(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_agp_acquire);
 
-/**
+/*
  * Acquire the AGP device (ioctl).
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg user argument.
  * \return zero on success or a negative number on failure.
  *
  * Verifies the AGP device hasn't been acquired before and calls
@@ -133,7 +125,7 @@ int drm_agp_acquire_ioctl(struct drm_device *dev, void *data,
 	return drm_agp_acquire((struct drm_device *) file_priv->minor->dev);
 }
 
-/**
+/*
  * Release the AGP device.
  *
  * \param dev DRM device that is to release AGP.
@@ -157,7 +149,7 @@ int drm_agp_release_ioctl(struct drm_device *dev, void *data,
 	return drm_agp_release(dev);
 }
 
-/**
+/*
  * Enable the AGP bus.
  *
  * \param dev DRM device that has previously acquired AGP.
@@ -187,13 +179,9 @@ int drm_agp_enable_ioctl(struct drm_device *dev, void *data,
 	return drm_agp_enable(dev, *mode);
 }
 
-/**
+/*
  * Allocate AGP memory.
  *
- * \param inode device inode.
- * \param file_priv file private pointer.
- * \param cmd command.
- * \param arg pointer to a drm_agp_buffer structure.
  * \return zero on success or a negative number on failure.
  *
  * Verifies the AGP device is present and has been acquired, allocates the
@@ -242,7 +230,7 @@ int drm_agp_alloc_ioctl(struct drm_device *dev, void *data,
 	return drm_agp_alloc(dev, request);
 }
 
-/**
+/*
  * Search for the AGP memory entry associated with a handle.
  *
  * \param dev DRM device structure.
@@ -263,13 +251,9 @@ static struct drm_agp_mem *drm_agp_lookup_entry(struct drm_device *dev,
 	return NULL;
 }
 
-/**
+/*
  * Unbind AGP memory from the GATT (ioctl).
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg pointer to a drm_agp_binding structure.
  * \return zero on success or a negative number on failure.
  *
  * Verifies the AGP device is present and acquired, looks-up the AGP memory
@@ -301,13 +285,9 @@ int drm_agp_unbind_ioctl(struct drm_device *dev, void *data,
 	return drm_agp_unbind(dev, request);
 }
 
-/**
+/*
  * Bind AGP memory into the GATT (ioctl)
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg pointer to a drm_agp_binding structure.
  * \return zero on success or a negative number on failure.
  *
  * Verifies the AGP device is present and has been acquired and that no memory
@@ -345,13 +325,9 @@ int drm_agp_bind_ioctl(struct drm_device *dev, void *data,
 	return drm_agp_bind(dev, request);
 }
 
-/**
+/*
  * Free AGP memory (ioctl).
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg pointer to a drm_agp_buffer structure.
  * \return zero on success or a negative number on failure.
  *
  * Verifies the AGP device is present and has been acquired and looks up the
@@ -388,7 +364,7 @@ int drm_agp_free_ioctl(struct drm_device *dev, void *data,
 	return drm_agp_free(dev, request);
 }
 
-/**
+/*
  * Initialize the AGP resources.
  *
  * \return pointer to a drm_agp_head structure.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
