Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6210E180C6B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FAC6E3E1;
	Tue, 10 Mar 2020 23:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5326D6E2DC;
 Tue, 10 Mar 2020 13:32:05 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id n8so1416671wmc.4;
 Tue, 10 Mar 2020 06:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5yjkQehLF0f6xll/bhOaQmEiXBo2J9wKC5XShatyRos=;
 b=KTPwiJSM/qzAYzigcpA0Y2zHDa/6QW3xECg+PL0A4YQZCTKBUehAocmVanrkaYwNWB
 BVuCETrnkcveGVfYF/e/qnudD5gWQoIsuJnsLBsoxaWZhuLSYZBwjkjREQkiqrtqq9G0
 fhCbmmMxnTenEzXygKIVlt+afExuMshk7MK6YWUmt2k8/tjRFVFbSj/G6Qz6UBaAwNEb
 qX2TsekYXrUzA43wqiTWsuQXzbEcUjl5J0W+xgbvDmalnbtx7B21ot1xCWeyRq9gAGP3
 Z1OZLPEt3QWVfKaZzjGl8G+DKAz+KmsmYt3ktwom160s2BWdHITseV6u05dkv+s8XO33
 PKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5yjkQehLF0f6xll/bhOaQmEiXBo2J9wKC5XShatyRos=;
 b=hMZWengo3r16uMMtXBQIrszSQK9jrlR5DLQwrhVi8O2jxyMeNxSQSoNu2G5hIJ3b+a
 4tqOPDf+3wXGr/1Mo3JkJHjD1Hg8XgcRqBT5H0L8BmHvZn9gL5/7KyxN4Y9VcjTxofg7
 tXODFq09Npe8M1E2Hsa8dl/vBmdVQSxuvUzJadp0MgbNEVaLhffBOktCGBA22jRiZUSx
 TiughBYjtKQp7mtc9psjeyf39y1wKWPV18/fb3bSmAzO0NWCHU70kAXl1ZaLGf+fflF6
 y/PZvnR8CqIOviMUv1ZMK0zUneG5nGLefqSuJNdrojVHoCkI8/s+VT38SsdP34MjnNpN
 0VDg==
X-Gm-Message-State: ANhLgQ2WWYo0IdaqHg0aBnSyOpd05HWmYUfo11l5taR+Jk2uZ8019Y2m
 zj7Hs9bhK0vJoSrUwksa7livanrglR2WbQ==
X-Google-Smtp-Source: ADFU+vtTt77jHYaEAcGJY28++Hmyg5x/Jy/jKLVwSwc+9Y+5LroFS2cLeRjqKdsEIJbBuTJj2tBGag==
X-Received: by 2002:a1c:ba42:: with SMTP id k63mr2275852wmf.71.1583847123016; 
 Tue, 10 Mar 2020 06:32:03 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:32:02 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 14/17] drm/i915: have *_debugfs_init() functions return
 void.
Date: Tue, 10 Mar 2020 16:31:18 +0300
Message-Id: <20200310133121.27913-15-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
fails and should return void. Therefore, remove its use as the
return value of debugfs_init() functions and have the functions return
void.

v2: convert intel_display_debugfs_register() stub to return void too.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 8 ++++----
 drivers/gpu/drm/i915/display/intel_display_debugfs.h | 4 ++--
 drivers/gpu/drm/i915/i915_debugfs.c                  | 8 ++++----
 drivers/gpu/drm/i915/i915_debugfs.h                  | 4 ++--
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 1e6eb7f2f72d..424f4e52f783 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1927,7 +1927,7 @@ static const struct {
 	{"i915_edp_psr_debug", &i915_edp_psr_debug_fops},
 };
 
-int intel_display_debugfs_register(struct drm_i915_private *i915)
+void intel_display_debugfs_register(struct drm_i915_private *i915)
 {
 	struct drm_minor *minor = i915->drm.primary;
 	int i;
@@ -1940,9 +1940,9 @@ int intel_display_debugfs_register(struct drm_i915_private *i915)
 				    intel_display_debugfs_files[i].fops);
 	}
 
-	return drm_debugfs_create_files(intel_display_debugfs_list,
-					ARRAY_SIZE(intel_display_debugfs_list),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(intel_display_debugfs_list,
+				 ARRAY_SIZE(intel_display_debugfs_list),
+				 minor->debugfs_root, minor);
 }
 
 static int i915_panel_show(struct seq_file *m, void *data)
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.h b/drivers/gpu/drm/i915/display/intel_display_debugfs.h
index a3bea1ce04c2..c922c1745bfe 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.h
@@ -10,10 +10,10 @@ struct drm_connector;
 struct drm_i915_private;
 
 #ifdef CONFIG_DEBUG_FS
-int intel_display_debugfs_register(struct drm_i915_private *i915);
+void intel_display_debugfs_register(struct drm_i915_private *i915);
 int intel_connector_debugfs_add(struct drm_connector *connector);
 #else
-static inline int intel_display_debugfs_register(struct drm_i915_private *i915) { return 0; }
+static inline void intel_display_debugfs_register(struct drm_i915_private *i915) {}
 static inline int intel_connector_debugfs_add(struct drm_connector *connector) { return 0; }
 #endif
 
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 8f2525e4ce0f..de313199c714 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -2392,7 +2392,7 @@ static const struct i915_debugfs_files {
 	{"i915_guc_log_relay", &i915_guc_log_relay_fops},
 };
 
-int i915_debugfs_register(struct drm_i915_private *dev_priv)
+void i915_debugfs_register(struct drm_i915_private *dev_priv)
 {
 	struct drm_minor *minor = dev_priv->drm.primary;
 	int i;
@@ -2409,7 +2409,7 @@ int i915_debugfs_register(struct drm_i915_private *dev_priv)
 				    i915_debugfs_files[i].fops);
 	}
 
-	return drm_debugfs_create_files(i915_debugfs_list,
-					I915_DEBUGFS_ENTRIES,
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(i915_debugfs_list,
+				 I915_DEBUGFS_ENTRIES,
+				 minor->debugfs_root, minor);
 }
diff --git a/drivers/gpu/drm/i915/i915_debugfs.h b/drivers/gpu/drm/i915/i915_debugfs.h
index 6da39c76ab5e..1de2736f1248 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.h
+++ b/drivers/gpu/drm/i915/i915_debugfs.h
@@ -12,10 +12,10 @@ struct drm_i915_private;
 struct seq_file;
 
 #ifdef CONFIG_DEBUG_FS
-int i915_debugfs_register(struct drm_i915_private *dev_priv);
+void i915_debugfs_register(struct drm_i915_private *dev_priv);
 void i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj);
 #else
-static inline int i915_debugfs_register(struct drm_i915_private *dev_priv) { return 0; }
+static inline void i915_debugfs_register(struct drm_i915_private *dev_priv) {}
 static inline void i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj) {}
 #endif
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
