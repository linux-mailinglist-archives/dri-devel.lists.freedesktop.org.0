Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8764128868
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 10:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DD36E433;
	Sat, 21 Dec 2019 09:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67DD6E42E
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 09:56:10 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k8so12471558ljh.5
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 01:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MegBDSu66fhUyXe+1lMvrcBAGgIc0C7vgWNW74n27Xs=;
 b=Zk6QhhN2nBhYYoVBxf9hv09dk1/kGEVtbib80tQ088NaNWh5D44nU6TnghgezRCbA1
 X+krKGru5ugeo5xtZZdQpiPsIgGNmr2xIl5XghzIXK3Cxdo4s+fSIpx5DpGbirWfEPdx
 kq+NmnLivVAtnxpFyiecfJxK2qHQjh5/TINdpuk+GoahjaVuixCfSYgiMabv4iVQUfhC
 aNjUb06JMyA3vYMoHj39MBFuw4uuPJ9tAE+D9BbMWPaBADaM5OEl/DQ/bV+0q/F3/heK
 YCQnHyMhBAMpSZLQJ32sA4wQXir74XYxTUA3yqc44RAHN5NRKL2+LvM8KmuEFu3FEGXN
 ifbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MegBDSu66fhUyXe+1lMvrcBAGgIc0C7vgWNW74n27Xs=;
 b=qAfvMo5pHIp451qdDhxl/BXUTsjmTs+T0kbeQ/7eqhS6xJYTSry+z2geut7H7O+Zc4
 cWwTAz3kKGfQOKi6By/MBNzrTr+Fik6vmJNsfklGGy4lffmOJsS7/Sr3tB91EyYz1L3g
 U1X6q3UrkHCR+6XEN4qTAzXqqbmYhBtB75MGjr7YJDXYn3kwEvjKwxhBlo+Mz9DkmAhW
 SETp+q0XiqccjKMjHy2mO8YFL3b5zthhMzp/eqOtalvvOhGYAGNr32POK4HPJqkLhcQL
 Te/183saJHGm7IXEY5qvLV4/3Nq5KUvU0eyDBhtXjfb5All8UcSaWVMHMovsCOS3DeKI
 rYtg==
X-Gm-Message-State: APjAAAW8zGCygZXQKCIG0rDtZBY02VVH5rEWcCAL2CuEQSsbntfBWBe0
 MVk4feBPSuUZwp6IWRYbGz2mx/Dm268=
X-Google-Smtp-Source: APXvYqwE1iFlyoGvAeQ4M9bwTCnozw7UB/J1wAIPswt51kKTV9vftziqr8RSsq6am6Z0lTxkul8p7Q==
X-Received: by 2002:a2e:95c4:: with SMTP id y4mr12602719ljh.38.1576922168990; 
 Sat, 21 Dec 2019 01:56:08 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n23sm5187263lfa.41.2019.12.21.01.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 01:56:08 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 1/8] drm/print: document logging functions
Date: Sat, 21 Dec 2019 10:55:46 +0100
Message-Id: <20191221095553.13332-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191221095553.13332-1-sam@ravnborg.org>
References: <20191221095553.13332-1-sam@ravnborg.org>
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

This is the documentation I have missed when I looked for help
how to do proper logging. Hopefully it can help others.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 Documentation/gpu/drm-internals.rst |  6 ++
 include/drm/drm_print.h             | 91 ++++++++++++++++++++++++++---
 2 files changed, 90 insertions(+), 7 deletions(-)

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index a73320576ca9..c2093611999c 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -164,6 +164,12 @@ File Operations
 Misc Utilities
 ==============
 
+Logging
+-------
+
+.. kernel-doc:: include/drm/drm_print.h
+   :doc: logging
+
 Printer
 -------
 
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 8f99d389792d..e9e31ace0afa 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -250,22 +250,42 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
 }
 
 /**
- * enum drm_debug_category - The DRM debug categories
+ * DOC: logging
+ *
+ * There is a set of functions/macros available used for logging
+ * in the DRM subsystem.
+ * Using the drm logging function enables that the logging is consistently
+ * prefixed with *[drm]* thus the logging is easy to recognize.
+ *
+ * Example of logging with *[drm]* prefix::
  *
- * Each of the DRM debug logging macros use a specific category, and the logging
- * is filtered by the drm.debug module parameter. This enum specifies the values
- * for the interface.
+ *   [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
+ *   [drm] Driver supports precise vblank timestamp query.
  *
- * Each DRM_DEBUG_<CATEGORY> macro logs to DRM_UT_<CATEGORY> category, except
- * DRM_DEBUG() logs to DRM_UT_CORE.
+ *
+ * Each of the debug logging macros use a specific category, and the logging
+ * is filtered by the drm.debug module parameter. The &drm_debug_category enum
+ * specifies the values for the interface.
+ *
+ * Each drm_dbg_<category> macro logs to a DRM_UT_<category> category,
+ * except drm_dbg() that logs to DRM_UT_DRIVER.
  *
  * Enabling verbose debug messages is done through the drm.debug parameter, each
  * category being enabled by a bit:
  *
  *  - drm.debug=0x1 will enable CORE messages
  *  - drm.debug=0x2 will enable DRIVER messages
+ *  - drm.debug=0x4 will enable KMS messages
+ *  - drm.debug=0x8 will enable PRIME messages
+ *  - drm.debug=0x10 will enable ATOMIC messages
+ *  - drm.debug=0x20 will enable VBL messages
+ *  - drm.debug=0x40 will enable STATE messages
+ *  - drm.debug=0x80 will enable LEASE messages
+ *  - drm.debug=0x100 will enable DP messages
+ *
+ * To enable more than one category OR the values - examples:
+ *
  *  - drm.debug=0x3 will enable CORE and DRIVER messages
- *  - ...
  *  - drm.debug=0x1ff will enable all messages
  *
  * An interesting feature is that it's possible to enable verbose logging at
@@ -273,6 +293,63 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
  *
  *   # echo 0xf > /sys/module/drm/parameters/debug
  *
+ *
+ * When a &drm_device * is available use one of the following logging functions.
+ * The same prototype is shared by all the logging functions
+ * that take a &drm_device * as first argument:
+ *
+ * .. code-block:: c
+ *
+ *   void drm_xxx(struct drm_device *, char * fmt, ...)
+ *
+ * Drivers can use the following functions for logging.
+ *
+ * .. code-block:: none
+ *
+ *   # Plain logging
+ *   drm_dbg()
+ *   drm_info()
+ *   drm_notice()
+ *   drm_warn()
+ *   drm_err()
+ *
+ *   # Log only once
+ *   drm_info_once()
+ *   drm_notice_once()
+ *   drm_warn_once()
+ *   drm_err_once()
+ *
+ *   # Ratelimited - do not flood the logs
+ *   drm_err_ratelimited()
+ *
+ *   # Logging with a specific category
+ *   drm_dbg_core()
+ *   drm_dbg()		# Uses the DRIVER category
+ *   drm_dbg_kms()
+ *   drm_dbg_prime()
+ *   drm_dbg_atomic()
+ *   drm_dbg_vbl()
+ *   drm_dbg_state()
+ *   drm_dbg_lease()
+ *   drm_dbg_dp()
+ *
+ * See enum &drm_debug_category for a description of the categories.
+ *
+ * Logging when a &device * is available, but no &drm_device *
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * TODO
+ *
+ * Logging when no &device * nor &drm_device * is available
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * TODO
+ *
+ * Obsoleted logging functions
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * The DRM_*() logging functions are deprecated - do not use them in new code.
+ */
+
+/**
+ * enum drm_debug_category - The DRM debug categories
  */
 enum drm_debug_category {
 	/**
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
