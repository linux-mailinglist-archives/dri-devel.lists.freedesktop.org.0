Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6AF3DC870
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 23:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C276E91A;
	Sat, 31 Jul 2021 21:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD676E912;
 Sat, 31 Jul 2021 21:42:59 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id y4so13060625ilp.0;
 Sat, 31 Jul 2021 14:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=58/x+2QGDymGfK0lAmzmatXymq82n8t52NOr4OzAqak=;
 b=q9oE4WUTh+t2KTE5yd/zztvZeVXDqxbspFru6xnKJsszBZrKGgYEdFlcPXLXRaqyRl
 u6PrGKWxAKMv5dGU8Q7Ub8DhB/hJ6IjifPtriM/IWmMRmV+vTp82C0BqOB1BGHh+uAaz
 pvU23lgNwvpG2+bPAU2uHgBkKbSZ9w9cth1CqYO6BqKD5lJlero3G7zzMoMP1Hw//s2S
 v4npaUkiezb7wQSuEPzlUsber0F6iOSMAqpeuGkDT0k/ERDCEaB1OB5af09zx9uTRucQ
 nsnpnvwEVfhCJmn+0QSTheyjdRIjtN8HAck/IpJKqpqvCPAOJkgI3EjEeQ1WcgvoowHW
 qnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=58/x+2QGDymGfK0lAmzmatXymq82n8t52NOr4OzAqak=;
 b=nPo39eA8i9Eee1M7QLt8THJIXg3hKKSURotmtXFtqcA0YlyIa5Bg71nFGd/TKbDnlC
 AkFst7tgl2s+RXsK9QQWu4jWKlHytCU68GHQFcRTX7z9ZEsEflj5tAdhspy9U606o0IL
 t3MZZXN2F+E0LIh2RyPt7w37gvCtjQ+/kg2pTE79GxutriIvxlHaJC+oWMInyER6exUN
 6oXLUoXQ/0VKjXMsBg/knCsWMTCEphJUC9Vb3+ovM5/e7DQMRvyV0bLJ4smC7qTAUOLG
 RVRlWPj7Mqq7c8ov558u1exIc+VPMNXil0XhEqh0YRdHxSZOj1vvMTG78wQatqNKlz4D
 VwhA==
X-Gm-Message-State: AOAM532uyWHdD6GFK/x8PuR95JyyjIPickXRNFZPEtzEOQv3EMuU65jq
 Wk1/0o+PlZl5+tHPK57ZOgw=
X-Google-Smtp-Source: ABdhPJwA5tlcfKu+7uZN4abVjVI9nufJioA7PR6+bjW89rlUIwRw22xzKRIhW1beZt/C3KhfoeCZNw==
X-Received: by 2002:a05:6e02:5cc:: with SMTP id
 l12mr124288ils.60.1627767778265; 
 Sat, 31 Jul 2021 14:42:58 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id q10sm3721040ion.3.2021.07.31.14.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 14:42:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Baron <jbaron@akamai.com>,
 Ashley Thomas <Ashley.Thomas2@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Wyatt Wood <Wyatt.Wood@amd.com>, Jim Cromie <jim.cromie@gmail.com>,
 Jessica Yu <jeyu@kernel.org>, Johan Hovold <johan@kernel.org>,
 Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>,
 Nick Desaulniers <ndesaulniers@gooogle.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 6/7] drm/print: add choice to use dynamic debug in drm-debug
Date: Sat, 31 Jul 2021 15:42:03 -0600
Message-Id: <20210731214211.657280-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731214211.657280-1-jim.cromie@gmail.com>
References: <20210731214211.657280-1-jim.cromie@gmail.com>
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

drm's debug system writes 10 distinct categories of messages to syslog
using a small API[1]: drm_dbg*(10 names), DRM_DEBUG*(8 names),
DRM_DEV_DEBUG*(3 names).  There are thousands of these callsites, each
categorized by their authors.  ~2100 are on my laptop.

These callsites are enabled at runtime by their category, each
controlled by a bit in drm.debug (/sys/modules/drm/parameter/debug)

In the current "basic" implementation, drm_debug_enabled() tests these
bits each time an API[1] call is executed; while cheap individually,
the costs accumulate.

This patch uses dynamic-debug with jump-label to patch enabled calls
onto their respective NOOP slots, avoiding all runtime bit-checks of
__drm_debug.

Dynamic debug has no concept of category, but we can emulate one by
replacing enum categories with a set of prefix-strings; "drm:core:",
"drm:kms:" "drm:driver:" etc, and prepend them (at compile time) to
the given formats.

Then we can use:
  `echo module drm format "^drm:core: " +p > control`

to enable every pr_debug("drm:core: ...") with one query.

This conversion yields ~2100 new callsites on my i7/i915 laptop:

  dyndbg: 195 debug prints in module drm_kms_helper
  dyndbg: 298 debug prints in module drm
  dyndbg: 1630 debug prints in module i915

CONFIG_DRM_USE_DYNAMIC_DEBUG enables this, and is available if
CONFIG_DYNAMIC_DEBUG or CONFIG_DYNAMIC_DEBUG_CORE is chosen, and if
CONFIG_JUMP_LABEL is enabled; this because its required to get the
promised optimizations.

The indirection/switchover is layered into the macro scheme:

0. A new callback on drm.debug (in a previous patch)
   does: dynamic_debug_exec_queries("format ^drm:kms: +p", "drm*");
   DYNDBG_BITMAP_DESC(__drm_debug, "bla blah bitmap yada",
   	  	    { "drm:core:", "enable CORE debug messages" },
   	  	    { "drm:kms:", "enable KMS debug messages" });

1. A "converted" or "classy" DRM_UT_* map

   based on:  DRM_UT_* ( symbol => bit-mask )
   named it:  DRM_DBG_CLASS_* ( symbol => format-class-prefix-string )

   So DRM_DBG_CLASS_* is either:
   basic: DRM_DBG_CLASS_* <-- DRM_UT_*  identity map
   enabled:
    #define DRM_DBG_CLASS_KMS    "drm:kms: "
    #define DRM_DBG_CLASS_PRIME  "drm:prime: "
    #define DRM_DBG_CLASS_ATOMIC "drm:atomic: "

   DRM_UT_* are unchanged for now, since theyre used in
   drm_debug_enabled() and elsewhere.

2. drm_dev_dbg & drm_debug are renamed (prefixed with '__')

   original names are now macros, calling either:
     basic:   -> to renamed fn
     enabled: -> dev_dbg & pr_debug, with DRM_DBG_CLASS_* prefix # format.

   this is where drm_debug_enabled() is avoided.
   prefix is prepended at compile-time.

3. names in (2) are invoked by API[1]

   all these macros now use DRM_DBG_CLASS_* to get right token type
   for both !/!! DRM_USE_DYNAMIC_DEBUG cases

NOTES:

dyndbg does require that the prefix be in the compiled-in format
string; run-time prefixing would look like "format ^%s" in a query
(obviously not useful).

dyndbg is completely agnostic wrt the categorization scheme used; but
the query selectivity is completely dependent upon how the scheme fits
with a simple anchored literal substring match (no regex).

ad-hoc categories are implicitly allowed, author discipline and review
is expected.

 - "1","2","3" are allowed, 1-9 is effective max. 2 doesnt imply 1.
 - "1:","2:","3:" are better, avoiding [1-9]\d: etc
 - "todo:", "rfc:" might be handy.
 - "drm:*:" is used here.
 - "drm:*:*:" is a natural extension.
 - "drm:atomic:fail:" has been suggested.

A hierarchical category space is an obvious frontrunner, so it
deserves a little more exploration/scrutiny.

 - "drm:kms: " & "drm:kms:" are different
   (2nd, w/o trailing space, matches subcats)
 - "drm:kms" is also different
   (matches "drm:kmsmart", whatever that would be)
 - "drm:kms" & "drm:kms*" are different
   the latter does not work as you might reasonably expect.
   wildcarding not added for format, which was already special

Literal prefixes (as encoded in DRM_DBG_CLASS_* symbols) should
include the trailing space, both to terminate the class prefix, and to
read naturally in logs with plain #catenation.

Prefixes given in args to DYNDBG_BITMAP_DESC() determine the bit-query
map; so to insure the map is stable, new categories or 3rd level
categories must be added to the end.  The prefixes may have trailing
spaces, depending upon desired search results.

Since bits are applied 0-N, the later categories can countermand the
earlier ones. IOW, "drm:atomic:fail:" would override "drm:atomic:",
but "drm:atomic: " would never touch "drm:atomic:fail:" callsites.

There are plenty of bikeshed rabbit holes available.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig     | 13 +++++
 drivers/gpu/drm/drm_print.c | 15 ++++--
 include/drm/drm_print.h     | 94 +++++++++++++++++++++++++++----------
 3 files changed, 93 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 7ff89690a976..e4524ccba040 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -57,6 +57,19 @@ config DRM_DEBUG_MM
 
 	  If in doubt, say "N".
 
+config DRM_USE_DYNAMIC_DEBUG
+	bool "use dynamic debug to implement drm.debug"
+	default n
+	depends on DRM
+	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
+	depends on JUMP_LABEL
+	help
+	  The drm debug category facility does a lot of unlikely bit-field
+	  tests at runtime; while cheap individually, the cost accumulates.
+	  This option uses dynamic debug facility (if configured and
+	  using jump_label) to avoid those runtime checks, patching
+	  the kernel when those debugs are desired.
+
 config DRM_DEBUG_SELFTEST
 	tristate "kselftests for DRM"
 	depends on DRM
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 111b932cf2a9..086e7ea6823f 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -52,7 +52,12 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 "\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
 "\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
 "\t\tBit 8 (0x100) will enable DP messages (displayport code)");
+
+#ifndef CONFIG_DRM_USE_DYNAMIC_DEBUG
 module_param_named(debug, __drm_debug, int, 0600);
+#else
+module_param_cb(debug, &param_ops_dyndbg, &__drm_debug, 0644);
+#endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
 {
@@ -256,8 +261,8 @@ void drm_dev_printk(const struct device *dev, const char *level,
 }
 EXPORT_SYMBOL(drm_dev_printk);
 
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...)
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+		   const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -278,9 +283,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 	va_end(args);
 }
-EXPORT_SYMBOL(drm_dev_dbg);
+EXPORT_SYMBOL(__drm_dev_dbg);
 
-void __drm_dbg(enum drm_debug_category category, const char *format, ...)
+void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -297,7 +302,7 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
 
 	va_end(args);
 }
-EXPORT_SYMBOL(__drm_dbg);
+EXPORT_SYMBOL(___drm_dbg);
 
 void __drm_err(const char *format, ...)
 {
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 47803c64b144..b5256d59ac55 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -319,6 +319,51 @@ enum drm_debug_category {
 	DRM_UT_DRMRES		= 0x200,
 };
 
+#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+
+/* Use legacy drm-debug functions, and drm_debug_enabled().
+ * For DRM_DBG_CLASS_*, identity map to DRM_UT_*
+ */
+#define __drm_dbg(cls, fmt, ...)			\
+	___drm_dbg(cls, fmt, ##__VA_ARGS__)
+#define drm_dev_dbg(dev, cls, fmt, ...)			\
+	__drm_dev_dbg(dev, cls, fmt, ##__VA_ARGS__)
+
+#define DRM_DBG_CLASS_CORE	DRM_UT_CORE
+#define DRM_DBG_CLASS_DRIVER	DRM_UT_DRIVER
+#define DRM_DBG_CLASS_KMS	DRM_UT_KMS
+#define DRM_DBG_CLASS_PRIME	DRM_UT_PRIME
+#define DRM_DBG_CLASS_ATOMIC	DRM_UT_ATOMIC
+#define DRM_DBG_CLASS_VBL	DRM_UT_VBL
+#define DRM_DBG_CLASS_STATE	DRM_UT_STATE
+#define DRM_DBG_CLASS_LEASE	DRM_UT_LEASE
+#define DRM_DBG_CLASS_DP	DRM_UT_DP
+#define DRM_DBG_CLASS_DRMRES	DRM_UT_DRMRES
+
+#else /* !CONFIG_DRM_USE_DYNAMIC_DEBUG */
+
+/* use dynamic_debug to avoid drm_debug_enabled().
+ * dyndbg has no category, so we prefix the format with a "class"
+ * string; DRM_DBG_CLASS_* maps to those class strings
+ */
+#define __drm_dbg(cls, fmt, ...)		\
+	pr_debug(cls # fmt, ##__VA_ARGS__)
+#define drm_dev_dbg(dev, cls, fmt, ...)		\
+	dev_dbg(dev, cls # fmt, ##__VA_ARGS__)
+
+#define DRM_DBG_CLASS_CORE	"drm:core: "
+#define DRM_DBG_CLASS_DRIVER	"drm:drvr: "
+#define DRM_DBG_CLASS_KMS	"drm:kms: "
+#define DRM_DBG_CLASS_PRIME	"drm:prime: "
+#define DRM_DBG_CLASS_ATOMIC	"drm:atomic: "
+#define DRM_DBG_CLASS_VBL	"drm:vbl: "
+#define DRM_DBG_CLASS_STATE	"drm:state: "
+#define DRM_DBG_CLASS_LEASE	"drm:lease: "
+#define DRM_DBG_CLASS_DP	"drm:dp: "
+#define DRM_DBG_CLASS_DRMRES	"drm:res "
+
+#endif /* !CONFIG_DRM_USE_DYNAMIC_DEBUG */
+
 static inline bool drm_debug_enabled(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & category);
@@ -334,8 +379,8 @@ __printf(3, 4)
 void drm_dev_printk(const struct device *dev, const char *level,
 		    const char *format, ...);
 __printf(3, 4)
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...);
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+		   const char *format, ...);
 
 /**
  * DRM_DEV_ERROR() - Error output.
@@ -383,7 +428,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * @fmt: printf() like format string.
  */
 #define DRM_DEV_DEBUG(dev, fmt, ...)					\
-	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(dev, DRM_DBG_CLASS_CORE, fmt, ##__VA_ARGS__)
 /**
  * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
  *
@@ -391,7 +436,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * @fmt: printf() like format string.
  */
 #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
+	drm_dev_dbg(dev, DRM_DBG_CLASS_DRIVER, fmt, ##__VA_ARGS__)
 /**
  * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
  *
@@ -399,7 +444,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * @fmt: printf() like format string.
  */
 #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
-	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(dev, DRM_DBG_CLASS_KMS, fmt, ##__VA_ARGS__)
 
 /*
  * struct drm_device based logging
@@ -443,25 +488,25 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 
 #define drm_dbg_core(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CLASS_CORE, fmt, ##__VA_ARGS__)
 #define drm_dbg(drm, fmt, ...)						\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CLASS_DRIVER, fmt, ##__VA_ARGS__)
 #define drm_dbg_kms(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CLASS_KMS, fmt, ##__VA_ARGS__)
 #define drm_dbg_prime(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CLASS_PRIME, fmt, ##__VA_ARGS__)
 #define drm_dbg_atomic(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CLASS_ATOMIC, fmt, ##__VA_ARGS__)
 #define drm_dbg_vbl(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CLASS_VBL, fmt, ##__VA_ARGS__)
 #define drm_dbg_state(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CLASS_STATE, fmt, ##__VA_ARGS__)
 #define drm_dbg_lease(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CLASS_LEASE, fmt, ##__VA_ARGS__)
 #define drm_dbg_dp(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CLASS_DP, fmt, ##__VA_ARGS__)
 #define drm_dbg_drmres(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
+	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CLASS_DRMRES, fmt, ##__VA_ARGS__)
 
 
 /*
@@ -471,7 +516,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  */
 
 __printf(2, 3)
-void __drm_dbg(enum drm_debug_category category, const char *format, ...);
+void ___drm_dbg(enum drm_debug_category category, const char *format, ...);
 __printf(1, 2)
 void __drm_err(const char *format, ...);
 
@@ -500,29 +545,30 @@ void __drm_err(const char *format, ...);
 #define DRM_ERROR_RATELIMITED(fmt, ...)					\
 	DRM_DEV_ERROR_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
 
+
 #define DRM_DEBUG(fmt, ...)						\
-	__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CLASS_CORE, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_DRIVER(fmt, ...)					\
-	__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CLASS_DRIVER, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_KMS(fmt, ...)						\
-	__drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CLASS_KMS, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_PRIME(fmt, ...)					\
-	__drm_dbg(DRM_UT_PRIME, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CLASS_PRIME, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_ATOMIC(fmt, ...)					\
-	__drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CLASS_ATOMIC, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_VBL(fmt, ...)						\
-	__drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CLASS_VBL, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_LEASE(fmt, ...)					\
-	__drm_dbg(DRM_UT_LEASE, fmt, ##__VA_ARGS__)
+	__drm_dbg(DRM_DBG_CLASS_LEASE, fmt, ##__VA_ARGS__)
 
 #define DRM_DEBUG_DP(fmt, ...)						\
-	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
+	__drm_dbg(DRM_DBG_CLASS_DP, fmt, ## __VA_ARGS__)
 
 #define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
 ({												\
-- 
2.31.1

