Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC464171817
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29006ECAF;
	Thu, 27 Feb 2020 12:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F54E6EC95;
 Thu, 27 Feb 2020 12:03:47 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l5so3020739wrx.4;
 Thu, 27 Feb 2020 04:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JDFiHtXUYpw9/7YjF6hgsTU6zXp0udoM7RVARL/tRI4=;
 b=AR7qKUbTnFZFJhUbiw2wILy8YBU7aRm24uEVrizIZeXUZNnuow1AiJSWkZHsm+ROIT
 TCuXxcqqWo/c4+PP1chfR05ZAFk0Y37cjOB+LzVCs/7Yv+GqQkguY0Qd4tmjDKPe2gmk
 04FjLuFbkYSWXn2+Lw+RsmCYLI0MOPl9L65a6ANyK8JA06Xjdwx/x5d7Oh9P5FS5d6W4
 99WcOdHriz+O90flwURtV17N23h0QHARXF3s1oltpvS4r7MzNcVZR2r0o1UMMaJQ1j/t
 B/BCuUaqv8/tVWdN+iOp7z+A7DftT0ZMcTEY9Eq0JYCTRHJB7WFMiI9QOQjZ5wtQnpxL
 syQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JDFiHtXUYpw9/7YjF6hgsTU6zXp0udoM7RVARL/tRI4=;
 b=sYNmJScj1ZMfWVZyRxnyclA4ODIvliK5AG+jR/F0WpCSrQWNTdJQ+kKHwqUQHHwIKx
 iOkysgnAyPmeGikuwzzp+cpjmauEZ13/tZ/Iu81APT5s/SeKC+7bwXYiKZPD3jVkSrgv
 CX5zNtVIfa7lpKIkXZ1Y3mo1cyb0ie9oZQA5Zm81zPQR+4L1XLvQJAt/psqX0q56sWlk
 plMPel420noIxbbfDDQ4FghExWgrurP8ZGHVtAOn5iHcB9daAFQikd/O3lfSMulrDv6z
 lUfmgijfyhr0+RGqy6jiDl/kCqA0THaguq+Qvat9+8ngBJKOy+mt/y/MXPGsOTd9N5D6
 G01w==
X-Gm-Message-State: APjAAAX5b1ut5yHHQuVMd5u3DES/csfhitK1pdUoO9+kl/vmBrYRynCD
 U9S3OVTt8zgKzDrC3J8tjYk=
X-Google-Smtp-Source: APXvYqycfeHEVSwOmkH9aHMERPJ5uUBCwE6v7YS6/+KssWDzjjGaXBNUPLF6j1vpk0YqR5PazYwqlg==
X-Received: by 2002:adf:a746:: with SMTP id e6mr4572634wrd.329.1582805025787; 
 Thu, 27 Feb 2020 04:03:45 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:45 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 16/21] drm/i915: make *_debugfs_register() functions return
 void.
Date: Thu, 27 Feb 2020 15:02:27 +0300
Message-Id: <20200227120232.19413-17-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227120232.19413-1-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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

Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
fails and should return void. Therefore, remove its use as the
return value of i915_debugfs_register() and
intel_display_debugfs_register() and have both functions return void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 8 ++++----
 drivers/gpu/drm/i915/display/intel_display_debugfs.h | 4 ++--
 drivers/gpu/drm/i915/i915_debugfs.c                  | 8 ++++----
 drivers/gpu/drm/i915/i915_debugfs.h                  | 4 ++--
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 46954cc7b6c0..3b877c34c420 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1922,7 +1922,7 @@ static const struct {
 	{"i915_edp_psr_debug", &i915_edp_psr_debug_fops},
 };
 
-int intel_display_debugfs_register(struct drm_i915_private *i915)
+void intel_display_debugfs_register(struct drm_i915_private *i915)
 {
 	struct drm_minor *minor = i915->drm.primary;
 	int i;
@@ -1935,9 +1935,9 @@ int intel_display_debugfs_register(struct drm_i915_private *i915)
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
index a3bea1ce04c2..a5cf7a6d3d34 100644
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
+static inline int intel_display_debugfs_register(struct drm_i915_private *i915) {}
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
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
