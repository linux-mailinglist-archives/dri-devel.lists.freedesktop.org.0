Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1432829A84F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B095A6EB5A;
	Tue, 27 Oct 2020 09:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1948D6EB4C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:51:43 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de
 [95.90.213.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D8DC24677;
 Tue, 27 Oct 2020 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603792302;
 bh=7iRzQ9FtMsadAedSe/m2uOK3R6zBKK4pf/UOJjIXzSM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dcsblmz0EkVXN+vfJXxMzME789p5Ep83AyUYuExckEi++nLmuGrXGYKf6fuAZb9mB
 Hzh7y+UgEnIONRwARO7M8zu6X8DbUj2CYUy+IAJRei33rZOzx2juH2dSni9X2bpUY8
 sQk0IAHZvYVieBp/DkSc/RRJz6gtpNx56Qv7saQU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kXLdk-003FFr-0G; Tue, 27 Oct 2020 10:51:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 31/32] drm: drm_print.h: fix kernel-doc markups
Date: Tue, 27 Oct 2020 10:51:35 +0100
Message-Id: <5b76c5625709aaaa3abee98faa620b9f3d27ff85.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A kernel-doc markup should start with the identifier on its
first line.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/drm/drm_print.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 1c9417430d08..f32d179e139d 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -338,7 +338,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 		 const char *format, ...);
 
 /**
- * Error output.
+ * DRM_DEV_ERROR() - Error output.
  *
  * @dev: device pointer
  * @fmt: printf() like format string.
@@ -347,10 +347,12 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
 
 /**
- * Rate limited error output.  Like DRM_ERROR() but won't flood the log.
+ * DRM_DEV_ERROR_RATELIMITED() - Rate limited error output.
  *
  * @dev: device pointer
  * @fmt: printf() like format string.
+ *
+ * Like DRM_ERROR() but won't flood the log.
  */
 #define DRM_DEV_ERROR_RATELIMITED(dev, fmt, ...)			\
 ({									\
@@ -375,15 +377,27 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 })
 
 /**
- * Debug output.
+ * DRM_DEV_DEBUG() - Debug output for generic drm code
  *
  * @dev: device pointer
  * @fmt: printf() like format string.
  */
 #define DRM_DEV_DEBUG(dev, fmt, ...)					\
 	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
+/**
+ * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
+ *
+ * @dev: device pointer
+ * @fmt: printf() like format string.
+ */
 #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
 	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
+/**
+ * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
+ *
+ * @dev: device pointer
+ * @fmt: printf() like format string.
+ */
 #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
 	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
