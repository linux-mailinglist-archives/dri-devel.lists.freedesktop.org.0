Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB043DC86B
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 23:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590FE6E8FB;
	Sat, 31 Jul 2021 21:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4E26E8FB;
 Sat, 31 Jul 2021 21:42:52 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id f8so9746478ilr.4;
 Sat, 31 Jul 2021 14:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6viyI1lb5x1+xx5Qj63RWr1BY09/zfid8qOfXD+1kAU=;
 b=ZurrzBVjqIJ0KIJFYo7Rh5RtFtEyvrQ8/M+1bqOqTvF7ePYZHi1JnfT4s3Z4hHVqQx
 dKH0Uc0BCha5Fq88ofKm2kIFRZC6keu7HzpcCaH2IWPS/ejSWvAR/53keFwhaSOTrJ2G
 SwCwPp4IIka9x5SlTg3SyHollTD/qppNu0cBZZ9mOIDmPKE5fUegv337ZaCY61arEHak
 uBA8xva673w7iW4R8Eq98A6QDqFkC7gMNouatlPYK6j05GndIqtcxOEHyb71n1ijoP5N
 60eKtiW7BySlxiALK3U16WY07KvpGOI2f6/MsvqHwss79z1vbvruWU9kuRzNu2o03kOS
 gQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6viyI1lb5x1+xx5Qj63RWr1BY09/zfid8qOfXD+1kAU=;
 b=RlpvrpP+bispYejjjqFbnSFVr+IS+MYD9ceElSb+Nzjb/Sibj6JOae6ZT3/YgSp9jZ
 Zu5bEd6lX3xa5WLB1P/Ot3Wg5+VDHRKJi4O0XY/Ynfb1caArW1McoYxKz+g0rwWnmvIY
 0Y3ZUzlAGdOxPvk2w5Asnf0VFvIAwhFWVxLJ+kXDOphn9wYE1r1nBth/RiR2TxKZcYAF
 ll8/VbRXgD3ouVqJfdam3gOQ2/H91s7anWE/BKxxUv1oTAfKwRO9jKErfwVdtFRk/A1q
 oC1ZabrTOW/wkYkGgV7GoBMN7cynNwgsnjlGNjvQ0l2m6ycRVu0JkL4Vq/nxjTPgs7Ti
 2xRg==
X-Gm-Message-State: AOAM5334K7GlbqjFnsn76MpzDxA8FSniiAIpt96BBRHj60niL4u2mXth
 TE98QGAGCOyecWOif2+H2FI=
X-Google-Smtp-Source: ABdhPJzOfp+MdZuDQLTjYPCAaNpyh2MChjD+OMYZKUx9oS5oEezg5v1vuzPLHhZiyVxCn0639TBOWw==
X-Received: by 2002:a92:dc06:: with SMTP id t6mr6555546iln.231.1627767771591; 
 Sat, 31 Jul 2021 14:42:51 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id q10sm3721040ion.3.2021.07.31.14.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 14:42:51 -0700 (PDT)
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
 Miguel Ojeda <ojeda@kernel.org>,
 Nick Desaulniers <ndesaulniers@gooogle.com>, Joe Perches <joe@perches.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 5/7] i915/gvt: control pr_debug("gvt:")s with bits in
 parameters/debug_gvt
Date: Sat, 31 Jul 2021 15:42:02 -0600
Message-Id: <20210731214211.657280-6-jim.cromie@gmail.com>
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

The gvt component of this driver has ~120 pr_debugs, in 9 "classes".
Following the interface model of drm.debug, add a parameter to map
bits to these classes.

If CONFIG_DRM_USE_DYNAMIC_DEBUG=y (and CONFIG_DYNAMIC_DEBUG_CORE), add
-DDYNAMIC_DEBUG_MODULE into Makefile.  TBD: maybe add a separate
CONFIG_I915_USE_DYNAMIC_DEBUG to more fully optionalize this.

this is close to our target:

DYNDBG_BITMAP_DESC(__gvt_debug, "dyndbg bitmap desc",
	{ "gvt: cmd: ",  "command processing" },
	{ "gvt: core: ", "core help" },
	{ "gvt: dpy: ",  "display help" },
	{ "gvt: el: ",   "help" },
	{ "gvt: irq: ",  "help" },
	{ "gvt: mm: ",   "help" },
	{ "gvt: mmio: ", "help" },
	{ "gvt: render: ", "help" },
	{ "gvt: sched: " "help" });

actual patch has a few details different, helper macros mainly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/i915/gvt/Makefile  |  4 ++++
 drivers/gpu/drm/i915/i915_params.c | 34 ++++++++++++++++++++++++++++++
 include/drm/drm_print.h            |  3 ++-
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index ea8324abc784..846ba73b8de6 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -7,3 +7,7 @@ GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
 
 ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
 i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
+
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+ccflags-y	+= -DDYNAMIC_DEBUG_MODULE
+#endif
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index e07f4cfea63a..c951ef76454f 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -265,3 +265,37 @@ void i915_params_free(struct i915_params *params)
 	I915_PARAMS_FOR_EACH(FREE);
 #undef FREE
 }
+
+/* POC for callback -> dynamic_debug_exec_queries */
+unsigned long __gvt_debug;
+EXPORT_SYMBOL(__gvt_debug);
+
+#define _help(key)	"\t\"" key "\"\t: help for " key "\n"
+#define cmd_help(key)	{ .prefix = key, .help = key ": help for " key }
+
+#define I915_DYNDBG_PARM_DESC(name) \
+	"Enable debug output via /sys/module/i915/parameters/" #name	\
+	", where each bit enables a debug category.\n"			\
+	_help("gvt:cmd:")						\
+	_help("gvt:core:")						\
+	_help("gvt:dpy:")						\
+	_help("gvt:el:")						\
+	_help("gvt:irq:")						\
+	_help("gvt:mm:")						\
+	_help("gvt:mmio:")						\
+	_help("gvt:render:")						\
+	_help("gvt:sched:")
+
+MODULE_PARM_DESC(debug_gvt, I915_DYNDBG_PARM_DESC(debug_gvt));
+
+DEFINE_DYNDBG_BITMAP(debug_gvt, &__gvt_debug,
+		   I915_DYNDBG_PARM_DESC(debug_gvt),
+		   cmd_help("gvt:cmd:"),
+		   cmd_help("gvt:core:"),
+		   cmd_help("gvt:dpy:"),
+		   cmd_help("gvt:el:"),
+		   cmd_help("gvt:irq:"),
+		   cmd_help("gvt:mm:"),
+		   cmd_help("gvt:mmio:"),
+		   cmd_help("gvt:render:"),
+		   cmd_help("gvt:sched:"));
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 15a089a87c22..47803c64b144 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -530,7 +530,8 @@ void __drm_err(const char *format, ...);
 	const struct drm_device *drm_ = (drm);							\
 												\
 	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
-		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
+		drm_dev_dbg((drm_) ? (drm_)->dev : NULL,					\
+			    DRM_DBG_CLASS_ ## category, fmt, ##__VA_ARGS__);			\
 })
 
 #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
-- 
2.31.1

