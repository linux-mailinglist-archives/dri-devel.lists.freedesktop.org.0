Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10654CD4F8D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9210E10E34B;
	Mon, 22 Dec 2025 08:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q0HHd4ZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C701D10E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:21:20 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id
 d2e1a72fcca58-7acd9a03ba9so3967934b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 00:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391680; x=1766996480; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8i2B8ufAHD9sSahBAZkEx2yO1Ly/YjHLa83EmimubvQ=;
 b=Q0HHd4ZVpB0Tb4MgyHhvPchlrEyMyF6BRV+HGUVBlA3KZza1EAxHyWvT1d1PrvCi27
 yt0WQdA6Qjx1gmKYm/rINKLggJJZvYY8Az2wEy2Ui6OcKHSkF8idVOk4jFSt4+kOfM3F
 d+yahqMEuLqb9RCsC9hBQeqO9BcaQ3zTUjrjYRSn5gBU660zBUJmTyX0g0a7LJOHKBRG
 i5x63foZ5lObgB0bOfWLs9gLwKI0kRkKC2R5TIpDRYMEGJPidI3bR6ZeVB8NR0akoyFQ
 y6fiF5fU6slk/C3Svzhzal1rby/ujF1B+ekMcx4cKAYH4b2tq3YX/g7IrPJcSiRkjMei
 tvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391680; x=1766996480;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8i2B8ufAHD9sSahBAZkEx2yO1Ly/YjHLa83EmimubvQ=;
 b=Nf+fnQIw4S0GlmeK1hbmCyoKG7mWunKsF3Pk0ODBGMm/JeVqEKxF/9CbI8J02IByyZ
 14Jd0481qlgWSRLknI8dzw0xnCVTZn+EbC0vyHFCeTkiYtLrvA+80mn2lZ8fdQZ1LNji
 2gG6qTrIrwyby0YHDPYQ8MaNXgnKX2E9fUkAw8kTGY/UNIbvAlluWtgHXr704wW8FlPy
 RGF6b3YdpJkUdB+END6ZtL3wC6+04Am5F4yO5kQ2gilDKPH5PcpqDMZgQripDUrZuc0w
 1DhIvf4Prb53mS+J3Dy3UaliltaMghe+vNchtzxPeDrtZF/2TcGkeuYQPAHSMtDd2+1G
 dO5g==
X-Gm-Message-State: AOJu0YxBAHLRwHCFMIi0RfjTSHcciRb8Jb9OGIaJvnb8FdTA/WcXXWH0
 78Ipf2FmqslBTMYd8J+0EB3mIOaphM9rfob3LaoXQDMVQYl3S3EJuwIO
X-Gm-Gg: AY/fxX6b0ABcvwRKrf+8nyOEPJBjhzFVd5MPMFOuarv3pOI0WRKVi+m7ohLGsQ39spd
 gZ8W0Kr2v0zKDXA2KUppZh6+ud1rfxbtjKHPleMMJhj3MCJQIqo/kJKJ2eyCcYNsIW39EXrJWy7
 Vj1bAKz5lAEeKqw2kwh3bIyoOxOttLd9MFzgepLkufKCr4SIXx+XNN/1w40gwpBm25sUdMxOHKu
 VOOLDI0tFQNheW3wAsmNGav+8VGeoOu9Yg0tp96gqgc4W9vYIliYk6x/KUmrzUKG9LL77hrbR7j
 kIggu9ltZ5r53KBuR4G6VFz3prUKgitru76DAD6XNipNKLh659ziY8nyOPA8kEhuvSgcwHc0NnS
 qBzgUIkV6ZRbNVOWlREX4FmjijEibyyZELk7xlBEopLEA6JIa+EF04Zw06N9UF1sGb4WxwCBSh1
 VCsjFvcunhAHoYm+9vjQs=
X-Google-Smtp-Source: AGHT+IG7yTX9GcAzuJxjdZol8GNeVjpWx8TpHrMGtTszznm0lKmDxk6yQdOE7nvJLCN2Ii7oDSHoog==
X-Received: by 2002:a05:6a00:4295:b0:781:17fb:d3ca with SMTP id
 d2e1a72fcca58-7ff648e71c8mr8607801b3a.15.1766391679935; 
 Mon, 22 Dec 2025 00:21:19 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:21:19 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v7 02/31] dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
Date: Mon, 22 Dec 2025 21:20:19 +1300
Message-ID: <20251222082049.1782440-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
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

Add the stub macro for !DYNAMIC_DEBUG builds, after moving the
original macro-defn down under the big ifdef.  Do it now so future
changes have a cleaner starting point.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 43 ++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ff44ec346162..98a36e2f94b6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -92,27 +92,6 @@ struct ddebug_class_map {
 	enum class_map_type map_type;
 };
 
-/**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
- * @_var:   a struct ddebug_class_map, passed to module_param_cb
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
- * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
- */
-#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
-	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
-	static struct ddebug_class_map __aligned(8) __used		\
-		__section("__dyndbg_classes") _var = {			\
-		.mod = THIS_MODULE,					\
-		.mod_name = KBUILD_MODNAME,				\
-		.base = _base,						\
-		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
-		.class_names = _var##_classnames,			\
-	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
-
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
@@ -137,6 +116,27 @@ struct ddebug_class_param {
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
 	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
 
+/**
+ * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
+ * @_var:   a struct ddebug_class_map, passed to module_param_cb
+ * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
+ * @_base:  offset of 1st class-name. splits .class_id space
+ * @classes: class-names used to control class'd prdbgs
+ */
+#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
+	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	static struct ddebug_class_map __aligned(8) __used		\
+		__section("__dyndbg_classes") _var = {			\
+		.mod = THIS_MODULE,					\
+		.mod_name = KBUILD_MODNAME,				\
+		.base = _base,						\
+		.map_type = _maptype,					\
+		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.class_names = _var##_classnames,			\
+	}
+#define NUM_TYPE_ARGS(eltype, ...)				\
+	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
+
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
 
@@ -303,6 +303,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
+#define DECLARE_DYNDBG_CLASSMAP(...)
 
 #define dynamic_pr_debug(fmt, ...)					\
 	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
-- 
2.52.0

