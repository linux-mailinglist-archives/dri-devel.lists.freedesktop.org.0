Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630D912EC1C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 23:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CB189316;
	Thu,  2 Jan 2020 22:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A40089320
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 22:15:29 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z22so37330538ljg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 14:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HySOJe4JKyQl5ngDElO/PSPX+NbxsmrxWdvKU/pVxQA=;
 b=WFukb8PDyZt8elf/S4xt9tzpov6IPxJN4NndjMtrOCeurF1Yxl98AIdwzYu2Qy6q3n
 j5q8gZgekpr++QpFxurDu8BkSQPD4SQYWnJLWmTKmiWchoc9e0b2iCmIBHm+KSjXSJ8u
 O4SaDwR/xwyWwXYlIjb04J5BQ1hQfPZNgGeL3uxupMJoINpYPGqxSVW0XtCOr/J6smSu
 QMU+FuZPV8LL9+TPtVeSQT+uhyyW3/j3lwrVRUhBo4dTBTFOfIxxWyXu/VAHSkAlHczx
 0/xOMnRVuMzPMJ+zZkZxytRI3aV7J6huRoUAXadllSm49NwAic8F0MgV0Uxxdb5L3Q0S
 dDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HySOJe4JKyQl5ngDElO/PSPX+NbxsmrxWdvKU/pVxQA=;
 b=nd05wUUIGm9K5yG9rJIv37azt0N4HvPwTHyDhSg6RsaRArlAjaN0eZGMdCmfLwOk12
 IqiRAHmeaJwmzBYi1Ske8d56GRsOHRu5ChYRwQrLGGwuWjdPGK+bYfNZXXbTrKeJRWLM
 UnBYDUzWXaobk+0XNK01TF3FBVqKwWwAKOG82ml3CJJYD7fsXkCTkWrSZfpIAGy0WCNc
 oIPh4jPUVM2YDJmesaByUWH1xdycYnN7ov0/gWtbfGbpLFP+zYeKdLbC2lKKd7XyLrtF
 nZnuRgCKkOOe8ub1TIpnjxB8NL+wgf0cFmiR0mHM2GII7lUC0iJxgjDtZD6uumdznRmT
 GIbA==
X-Gm-Message-State: APjAAAXRMZ2kqwJxUsJu14K0dB9dR0wf1IdT236IPkFCJuUEUVQL4/3h
 D3ud6Vby51kxzxwlTfBh8hMOStUG
X-Google-Smtp-Source: APXvYqzdhvxUrWgx4AvS07GwckAcRJo1GYxWHzEemIoxVxuCBiDCJhqgJw/7kIYERf8PvdKOjVzIcg==
X-Received: by 2002:a05:651c:2046:: with SMTP id
 t6mr36218047ljo.180.1578003327184; 
 Thu, 02 Jan 2020 14:15:27 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 z7sm23499965lji.30.2020.01.02.14.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 14:15:26 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/2] drm/print: document drm_ logging functions
Date: Thu,  2 Jan 2020 23:15:18 +0100
Message-Id: <20200102221519.31037-2-sam@ravnborg.org>
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

This is the documentation I have missed when I looked for help
how to do proper logging. Hopefully it can help others.

v2:
  - Add parameters to the logging functions in the doc
  - Drop notes on other types of logging

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 Documentation/gpu/drm-internals.rst |  6 +++
 include/drm/drm_print.h             | 80 ++++++++++++++++++++++++++---
 2 files changed, 79 insertions(+), 7 deletions(-)

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
index 8f99d389792d..89e75eea65d2 100644
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
@@ -273,6 +293,52 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
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
+ * DRM/Drivers can use the following functions for logging.
+ *
+ * .. code-block:: none
+ *
+ *   # Plain logging
+ *   drm_dbg(drm, fmt, ...)
+ *   drm_info(drm, fmt, ...)
+ *   drm_notice(drm, fmt, ...)
+ *   drm_warn(drm, fmt, ...)
+ *   drm_err(drm, fmt, ...)
+ *
+ *   # Log only once
+ *   drm_info_once(drm, fmt, ...)
+ *   drm_notice_once(drm, fmt, ...)
+ *   drm_warn_once(drm, fmt, ...)
+ *   drm_err_once(drm, fmt, ...)
+ *
+ *   # Ratelimited - do not flood the logs
+ *   drm_err_ratelimited(drm, fmt, ...)
+ *
+ *   # Logging with a specific category
+ *   drm_dbg_core(drm, fmt, ...)
+ *   drm_dbg(drm, fmt, ...)		# Uses the DRIVER category
+ *   drm_dbg_kms(drm, fmt, ...)
+ *   drm_dbg_prime(drm, fmt, ...)
+ *   drm_dbg_atomic(drm, fmt, ...)
+ *   drm_dbg_vbl(drm, fmt, ...)
+ *   drm_dbg_state(drm, fmt, ...)
+ *   drm_dbg_lease(drm, fmt, ...)
+ *   drm_dbg_dp(drm, fmt, ...)
+ *
+ * See enum &drm_debug_category for a description of the categories.
+ *
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
