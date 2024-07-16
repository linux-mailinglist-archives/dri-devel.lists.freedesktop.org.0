Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D755893310D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4BA10E855;
	Tue, 16 Jul 2024 19:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aWDxb2QO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C1810E841;
 Tue, 16 Jul 2024 18:59:04 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3737dc4a669so443795ab.0; 
 Tue, 16 Jul 2024 11:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156344; x=1721761144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7xcpbsTDFqLNkX6yLBfMI4Cmqq9UEc7Ib3kRvowNps=;
 b=aWDxb2QOEhwc4TDu3j3wcAlfDru0WmjBhtn1HUoGysZ9cTI36GFidAOiOwVPQYGfjA
 IAlPVlgjvY3KgdGKtMALOXKP0V0MRMwVWfJ27jr/kI+IYqWbG+wGmC88cYAgTkq7gv8y
 GyUME883tQSrm5T3g2XAhFfmQ+2C1MB3IoawX9Sxp1BFvEglrTfvql5oYaqnoalASj2T
 IgIMWl0nCiWK4L73GHcxusULs2TLfx6khNHbGKqAl98opAHJKZAwjo+eqFaU84VyLutW
 WcsLPJKy0o67bgAc1yV9ErUgy6VZdn4PtRSD+teYzQNf2k+HNocxJDZAvD9fVkZ72hhA
 zpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156344; x=1721761144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7xcpbsTDFqLNkX6yLBfMI4Cmqq9UEc7Ib3kRvowNps=;
 b=h9EjXe6dfyN7XREcAjhV4U/0K+7l7E6Nf+vPzPmaukztq1H0soy+sTQETAQxHU8RYl
 xHXoNH4vn+Fa+tkVLA9jXXCYPwb0OY1UuiTTPU7VONTbROTmSaa5qqcOJA5A7P726Qij
 KAaEObit+KPx/MgBoBfEEp//Ixyy9Rxe24qpS16YdQIicsqiTcXBNZ66DEYHuOjUX0mh
 dEzbswMztcp/7Ck+l0MgisHKckQMNjHJzmzAM8vztioNIVEnsJFYe6NhE4IzEijyoA8C
 pwMn/AQalS0YqnkMGNLlW8hCvCdbI/WHT8bqKPbeHGegflQ2BCkhwfrYNVs50tHrueU7
 vtUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhRmtqOQwSdqiVqX4JKLi6GTiHzFyLzFTjefekBfip3rKMAByRsnbMkaMQb/6lPYWeJs0BO2oJHEhV31x9VU2BfwrlwjyJfJ7cGpK53O1NJS88gK/AFl0iulnyXM86kPFfy9NzMvKONYmmZPRnI33Xkuz/nnvQLr+PrqMQ5lxciF8g//H1zrMqkoleuIeAJwSC24rrx525Ub4SEFEfpNy/FjuxHxdhnEZeC4mo1NeiLrXv6/o=
X-Gm-Message-State: AOJu0YyYjTpnJ+6JamcWtlfPsooRw7g++v24r+Zs+HjuqgLBUa7O7mLb
 zLR4iFWzChcjMWDRKzbUOsENh3YNHZNPpVMfU/QuyuPNpCUDwROm
X-Google-Smtp-Source: AGHT+IExllrK/dDXx9zHRPe0P0zQSNNZHGhy8f3RcoaQKjATZG0VIQe5Ln/GSLSi2fMerteHcMi6Pw==
X-Received: by 2002:a92:c267:0:b0:375:ca62:a418 with SMTP id
 e9e14a558f8ab-3950e9d74d7mr3061045ab.22.1721156343924; 
 Tue, 16 Jul 2024 11:59:03 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:03 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 30/54] drm-dyndbg: adapt drm core to use dyndbg
 classmaps-v2
Date: Tue, 16 Jul 2024 12:57:42 -0600
Message-ID: <20240716185806.1572048-31-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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

dyndbg's CLASSMAP-v1 api was broken; DECLARE_DYNDBG_CLASSMAP tried to
do too much.  Its replaced by DRM_CLASSMAP_DEFINE, which creates &
EXPORTs the classmap when CONFIG_DRM_USE_DYNAMIC_DEBUG=y, for direct
reference by drivers.

The drivers still use DECLARE_DYNDBG_CLASSMAP for now, so they still
redundantly re-declare the classmap, but we can convert the drivers
later to DYNDBG_CLASSMAP_USE

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 25 +++++++++++++------------
 include/drm/drm_print.h     |  8 ++++++++
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index cf2efb44722c..41f167082042 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -55,18 +55,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 module_param_named(debug, __drm_debug, ulong, 0600);
 #else
-/* classnames must match vals of enum drm_debug_category */
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+/* classnames must match value-symbols of enum drm_debug_category */
+DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
+		    DRM_UT_CORE,
+		    "DRM_UT_CORE",
+		    "DRM_UT_DRIVER",
+		    "DRM_UT_KMS",
+		    "DRM_UT_PRIME",
+		    "DRM_UT_ATOMIC",
+		    "DRM_UT_VBL",
+		    "DRM_UT_STATE",
+		    "DRM_UT_LEASE",
+		    "DRM_UT_DP",
+		    "DRM_UT_DRMRES");
 
 static struct ddebug_class_param drm_debug_bitmap = {
 	.bits = &__drm_debug,
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 089950ad8681..b467ee67a281 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -140,6 +140,14 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+#define DRM_CLASSMAP_DEFINE(...) DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)   DYNDBG_CLASSMAP_USE(name)
+#else
+#define DRM_CLASSMAP_DEFINE(...)
+#define DRM_CLASSMAP_USE(name)
+#endif
+
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
-- 
2.45.2

