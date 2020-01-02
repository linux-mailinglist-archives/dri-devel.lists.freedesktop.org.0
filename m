Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E597D12EC1F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 23:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41CB8961D;
	Thu,  2 Jan 2020 22:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB9A895B2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 22:15:30 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id l2so42129266lja.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 14:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Y7TfioDwpgvtQ4e6N4jTKssseK6qyEb7EKKC6In28c=;
 b=sFLda86/eoiSl0wWMUEDAHTrLjyzWyK3ve64S7ZMtP02K9GBOX3Iy9WUcjXP5z+7D7
 kVEuhlpBKyF5ltZw/mH9GvVeZTiOLTAja3WHnI+YMgdOcpMbV3wGYSP4XVY5Gb7EjSmK
 cNL+28fRY67aM6+jo8QWK3yOvTGSMkxHf6rcqIYobfGYd/KR35Rp/ADPTYNTsUSo9IiI
 2Cex/IpzcZAsIMRDamL1GQK4WonyWCS2o8BVDpc6DRS3eKJe8Czzfs089eVk//uTQQ2S
 C8+xToT3VY8Pn7ChRSsAAR3JWIuScQlBN0tRjs9J7EPxl1wij+Jdn+0fjB+bRve4n0Qw
 bDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7Y7TfioDwpgvtQ4e6N4jTKssseK6qyEb7EKKC6In28c=;
 b=TWM4q84Sk8iLGA1BnevZRE0NJId4FTaHvNufJTeWU9gqojJ4fEcwwsWEHMYCyN3jyb
 jM6Rx0oXEbTMp5SVg3i5WrgMML9TJqvVnzU9X2bLeDm5roa43NYAFf+ZJ8XtqR7j5YS1
 ADBn9lKruasIUujseAFWxQMH2n6pwYmgvRroqHhp+F0Z0JYHN1zsXd0HXNOVnbCNoMkw
 dl54ek7RuLVYURjMDrwA+pi+vfYEdStNB8wxZqTseqstpNrhNYD8mZ9HcNZDrHjD7WJh
 rH3WqMWVYgJUejEfqjj/6TDSBf3+KspsoJmnAKc/ttfgfVlpISBqyIpcxG35JMgDiqkw
 1zCw==
X-Gm-Message-State: APjAAAVa6WcBzztLuWoeaTzl89JU2tk88YKx8Y2rKjgv1zh94wHItl77
 OVGwvIxEJLMdW37Qw4igSkp/q7UQ
X-Google-Smtp-Source: APXvYqy+HSg9BWKp37s7HXscgczR0JAVR0g7Fa5++yVhock1oJhCNs9rmzfbKIOIPjh9nxQM2KG5gQ==
X-Received: by 2002:a2e:2e12:: with SMTP id u18mr23481674lju.36.1578003328905; 
 Thu, 02 Jan 2020 14:15:28 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 z7sm23499965lji.30.2020.01.02.14.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 14:15:28 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/2] drm/print: document DRM_ logging functions
Date: Thu,  2 Jan 2020 23:15:19 +0100
Message-Id: <20200102221519.31037-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200102221519.31037-1-sam@ravnborg.org>
References: <20200102221519.31037-1-sam@ravnborg.org>
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
Cc: Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the remaining DRM_ logging functions.
As the logging functions are now all properly
listed drop the few specific kernel-doc markers
so we keep the relevant parts in the documentation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/drm_print.h | 84 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 89e75eea65d2..abe247199bf7 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -335,6 +335,82 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
  *
  * See enum &drm_debug_category for a description of the categories.
  *
+ * Logging when a &device * is available, but no &drm_device *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ *
+ * DRM/Drivers can use the following functions for logging when there is a
+ * struct device * available.
+ * The logging functions share the same prototype:
+ *
+ * .. code-block:: c
+ *
+ *   void DRM_xxx(struct device *, char * fmt, ...)
+ *
+ * .. code-block:: none
+ *
+ *   # Plain logging
+ *   DRM_DEV_INFO(dev, fmt, ...)
+ *   DRM_DEV_ERROR(dev, fmt, ...)
+ *
+ *   # Log only once
+ *   DRM_DEV_INFO_ONCE(dev, fmt, ...)
+ *
+ *   # Ratelimited - do not flood the logs
+ *   DRM_DEV_DEBUG_RATELIMITED(dev, fmt, ...)
+ *   DRM_DEV_DEBUG_DRIVER_RATELIMITED(dev, fmt, ...)
+ *   DRM_DEV_DEBUG_KMS_RATELIMITED(dev, fmt, ...)
+ *   DRM_DEV_DEBUG_PRIME_RATELIMITED(dev, fmt, ...)
+ *   DRM_DEV_ERROR_RATELIMITED(dev, fmt, ...)
+ *
+ *   # Logging with a specific category
+ *   DRM_DEV_DEBUG(dev, fmt, ...)		# Logged as CORE
+ *   DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)
+ *   DRM_DEV_DEBUG_KMS(dev, fmt, ...)
+ *   DRM_DEV_DEBUG_PRIME(dev, fmt, ...)
+ *   DRM_DEV_DEBUG_ATOMIC(dev, fmt, ...)
+ *   DRM_DEV_DEBUG_VBL(dev, fmt, ...)
+ *   DRM_DEV_DEBUG_DP(dev, fmt, ...)
+ *
+ * Logging when no &device * nor &drm_device * is available
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ *
+ * DRM/Drivers can use the following functions for logging when there is no
+ * extra info associated to the logging.
+ * The logging functions share the same prototype:
+ *
+ * .. code-block:: c
+ *
+ *   void DRM_xxx(char * fmt, ...)
+ *
+ * .. code-block:: none
+ *
+ *   # Plain logging
+ *   DRM_INFO(fmt, ...)
+ *   DRM_NOTE(fmt, ...)
+ *   DRM_WARN(fmt, ...)
+ *   DRM_ERROR(fmt, ...)
+ *
+ *   # Log only once
+ *   DRM_INFO_ONCE(fmt, ...)
+ *   DRM_NOTE_ONCE(fmt, ...)
+ *   DRM_WARN_ONCE(fmt, ...)
+ *
+ *   # Ratelimited - do not flood the logs
+ *   DRM_DEBUG_RATELIMITED(fmt, ...)
+ *   DRM_DEBUG_DRIVER_RATELIMITED(fmt, ...)
+ *   DRM_DEBUG_KMS_RATELIMITED(fmt, ...)
+ *   DRM_DEBUG_PRIME_RATELIMITED(fmt, ...)
+ *   DRM_ERROR_RATELIMITED(fmt, ...)
+ *
+ *   # Logging with a specific category
+ *   DRM_DEBUG(fmt, ...)		# Logged as CORE
+ *   DRM_DEBUG_DRIVER(fmt, ...)
+ *   DRM_DEBUG_KMS(fmt, ...)
+ *   DRM_DEBUG_PRIME(fmt, ...)
+ *   DRM_DEBUG_ATOMIC(fmt, ...)
+ *   DRM_DEBUG_VBL(fmt, ...)
+ *   DRM_DEBUG_LEASE(fmt, ...)
+ *   DRM_DEBUG_DP(fmt, ...)
  */
 
 /**
@@ -399,7 +475,7 @@ __printf(3, 4)
 void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 		 const char *format, ...);
 
-/**
+/*
  * Error output.
  *
  * @dev: device pointer
@@ -408,7 +484,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 #define DRM_DEV_ERROR(dev, fmt, ...)					\
 	drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
 
-/**
+/*
  * Rate limited error output.  Like DRM_ERROR() but won't flood the log.
  *
  * @dev: device pointer
@@ -436,7 +512,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	}								\
 })
 
-/**
+/*
  * Debug output.
  *
  * @dev: device pointer
@@ -466,7 +542,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 		drm_dev_dbg(dev, category, fmt, ##__VA_ARGS__);		\
 })
 
-/**
+/*
  * Rate limited debug output. Like DRM_DEBUG() but won't flood the log.
  *
  * @dev: device pointer
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
