Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC14413637
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 17:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55C96EA1B;
	Tue, 21 Sep 2021 15:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780A089EA3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 15:28:31 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id r2so21033218pgl.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jL5fGwtC4j55LTOWAT+GILFN7trYNKsOooZiEJOBglo=;
 b=CVgXjLfxVPPZCl8S6+xYmywgFO/821gBvJld/ra3BvZhp8sYuR5zHlVMUI8pzflrjC
 2uIrPhuW+z1pYiH0hh0iWQczEOZMH5VEHkrSReF12xjlyEcB8fl3+kCJ9iJmjTUt/jZ9
 hQczEHEeDIiA28sy0XKbdvK9ZDdGJj1+jp6uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jL5fGwtC4j55LTOWAT+GILFN7trYNKsOooZiEJOBglo=;
 b=XSbl0xvEhjQCsPMNRuieiHIn4LAoZZ1W1lUkZKvgUGP46FrmxviJFXx/5Qcon+23nY
 9zCivGsXg1YnUfs0v/TUWFDmEXUBDkAXJdd5fVz0JrBQUMd3CDtE65Ow7+ttQK9dSWYX
 S3RYCy+Zh/gnhL0VTzVH49VNssU7tDfmsnamgQxNjMsJq47T6b5GWwY1TPoJccWRK4KA
 Xv9RJNQbuLC/RC6/52xfnGNHJa5ESIake8HUBKSWp/RbMN+uPzDQ/aXFBw7HGbm/pxg8
 qzve/wuAd+nzAgQ3Pu2p70LR7efoIPs6UYQgy4fsU/Hx8xMI5/3IddeEwGYdLZU/l4xn
 PvIw==
X-Gm-Message-State: AOAM531PiyAgW9S1SBGV6NwyH3VaLqB/7to5luLPpnfyV/FtxtvbWyIN
 KWw1fmUaZLPKw4QQO+ezxN9cm9lRuaCkFQ==
X-Google-Smtp-Source: ABdhPJyYjqMBuf7nb+ttOG1fuvgpEfDFQ/tDtegPet467YO1ldp7Iha/kbLA7d0LHdI95ltEdWcmyA==
X-Received: by 2002:aa7:825a:0:b0:43e:124e:5c1e with SMTP id
 e26-20020aa7825a000000b0043e124e5c1emr30655949pfn.76.1632238110490; 
 Tue, 21 Sep 2021 08:28:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:5d7:1a63:a991:2247])
 by smtp.gmail.com with ESMTPSA id k3sm2968083pjg.43.2021.09.21.08.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 08:28:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: sam@ravnborg.org, daniel.vetter@ffwll.ch, lyude@redhat.com,
 jani.nikula@intel.com, swboyd@chromium.org, airlied@redhat.com,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm/print: Add deprecation notes to DRM_...() functions
Date: Tue, 21 Sep 2021 08:28:01 -0700
Message-Id: <20210921082757.RFC.1.Ibd82d98145615fa55f604947dc6a696cc82e8e43@changeid>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
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

It's hard for someone (like me) who's not following closely to know
what the suggested best practices are for error printing in DRM
drivers. Add some hints to the header file.

In general, my understanding is that:
* When possible we should be using a `struct drm_device` for logging
  and recent patches have tried to make it more possible to access a
  relevant `struct drm_device` in more places.
* For most cases when we don't have a `struct drm_device`, we no
  longer bother with DRM-specific wrappers on the dev_...() functions
  or pr_...() functions and just encourage drivers to use the normal
  functions.
* For debug-level functions where we might want filtering based on a
  category we'll still have DRM-specific wrappers, but we'll only
  support passing a `struct drm_device`, not a `struct
  device`. Presumably most of the cases where we want the filtering
  are messages that happen while the system is in a normal running
  state (AKA not during probe time) and we should have a `struct
  drm_device` then. If we absolutely can't get a `struct drm_device`
  then these functions begrudgingly accept NULL for the `struct
  drm_device` and hopefully the awkwardness of having to manually pass
  NULL will keep people from doing this unless absolutely necessary.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/drm/drm_print.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 15a089a87c22..22fabdeed297 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -340,6 +340,8 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 /**
  * DRM_DEV_ERROR() - Error output.
  *
+ * NOTE: this is deprecated in favor of drm_err() or dev_err().
+ *
  * @dev: device pointer
  * @fmt: printf() like format string.
  */
@@ -349,6 +351,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 /**
  * DRM_DEV_ERROR_RATELIMITED() - Rate limited error output.
  *
+ * NOTE: this is deprecated in favor of drm_err_ratelimited() or
+ * dev_err_ratelimited().
+ *
  * @dev: device pointer
  * @fmt: printf() like format string.
  *
@@ -364,9 +369,11 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 		DRM_DEV_ERROR(dev, fmt, ##__VA_ARGS__);			\
 })
 
+/* NOTE: this is deprecated in favor of drm_info() or dev_info(). */
 #define DRM_DEV_INFO(dev, fmt, ...)				\
 	drm_dev_printk(dev, KERN_INFO, fmt, ##__VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of drm_info_once() or dev_info_once(). */
 #define DRM_DEV_INFO_ONCE(dev, fmt, ...)				\
 ({									\
 	static bool __print_once __read_mostly;				\
@@ -379,6 +386,8 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 /**
  * DRM_DEV_DEBUG() - Debug output for generic drm code
  *
+ * NOTE: this is deprecated in favor of drm_dbg_core().
+ *
  * @dev: device pointer
  * @fmt: printf() like format string.
  */
@@ -387,6 +396,8 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 /**
  * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
  *
+ * NOTE: this is deprecated in favor of drm_dbg() or dev_dbg().
+ *
  * @dev: device pointer
  * @fmt: printf() like format string.
  */
@@ -395,6 +406,8 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 /**
  * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
  *
+ * NOTE: this is deprecated in favor of drm_dbg_kms().
+ *
  * @dev: device pointer
  * @fmt: printf() like format string.
  */
@@ -480,47 +493,63 @@ void __drm_err(const char *format, ...);
 #define _DRM_PRINTK(once, level, fmt, ...)				\
 	printk##once(KERN_##level "[" DRM_NAME "] " fmt, ##__VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of pr_info(). */
 #define DRM_INFO(fmt, ...)						\
 	_DRM_PRINTK(, INFO, fmt, ##__VA_ARGS__)
+/* NOTE: this is deprecated in favor of pr_notice(). */
 #define DRM_NOTE(fmt, ...)						\
 	_DRM_PRINTK(, NOTICE, fmt, ##__VA_ARGS__)
+/* NOTE: this is deprecated in favor of pr_warn(). */
 #define DRM_WARN(fmt, ...)						\
 	_DRM_PRINTK(, WARNING, fmt, ##__VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of pr_info_once(). */
 #define DRM_INFO_ONCE(fmt, ...)						\
 	_DRM_PRINTK(_once, INFO, fmt, ##__VA_ARGS__)
+/* NOTE: this is deprecated in favor of pr_notice_once(). */
 #define DRM_NOTE_ONCE(fmt, ...)						\
 	_DRM_PRINTK(_once, NOTICE, fmt, ##__VA_ARGS__)
+/* NOTE: this is deprecated in favor of pr_warn_once(). */
 #define DRM_WARN_ONCE(fmt, ...)						\
 	_DRM_PRINTK(_once, WARNING, fmt, ##__VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of pr_err(). */
 #define DRM_ERROR(fmt, ...)						\
 	__drm_err(fmt, ##__VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of pr_err_ratelimited(). */
 #define DRM_ERROR_RATELIMITED(fmt, ...)					\
 	DRM_DEV_ERROR_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of drm_dbg_core(NULL, ...). */
 #define DRM_DEBUG(fmt, ...)						\
 	__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of drm_dbg(NULL, ...). */
 #define DRM_DEBUG_DRIVER(fmt, ...)					\
 	__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of drm_dbg_kms(NULL, ...). */
 #define DRM_DEBUG_KMS(fmt, ...)						\
 	__drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of drm_dbg_prime(NULL, ...). */
 #define DRM_DEBUG_PRIME(fmt, ...)					\
 	__drm_dbg(DRM_UT_PRIME, fmt, ##__VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of drm_dbg_atomic(NULL, ...). */
 #define DRM_DEBUG_ATOMIC(fmt, ...)					\
 	__drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of drm_dbg_vbl(NULL, ...). */
 #define DRM_DEBUG_VBL(fmt, ...)						\
 	__drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of drm_dbg_lease(NULL, ...). */
 #define DRM_DEBUG_LEASE(fmt, ...)					\
 	__drm_dbg(DRM_UT_LEASE, fmt, ##__VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of drm_dbg_dp(NULL, ...). */
 #define DRM_DEBUG_DP(fmt, ...)						\
 	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
 
@@ -536,6 +565,7 @@ void __drm_err(const char *format, ...);
 #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
 	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
 
+/* NOTE: this is deprecated in favor of drm_dbg_kms_ratelimited(NULL, ...). */
 #define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
 
 /*
-- 
2.33.0.464.g1972c5931b-goog

