Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E71F163EE7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1D66EB29;
	Wed, 19 Feb 2020 08:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1160D6EA52;
 Tue, 18 Feb 2020 17:28:50 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id u6so25025160wrt.0;
 Tue, 18 Feb 2020 09:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RQKZJvHf1WtLQUnnQ+YYr8z0U0bnUL/X5oP4lbmCs/g=;
 b=of1bnSomwHNCr/K4IwVeC844d2lNrG7EeEsYbcslvaQOYTyn6ONlfHSBA/bDDBcsgw
 Fr292hw7tiOAcRcAg9S8LuNfeHmlaYQ0bP2vEF4rX4oGw01MQ1Pas0LFZrpIVOvetzBe
 e3r1Cj5ZrC32v8GmGAMIrk2dmXsbojIb1aZAGrQzBJsv1KVhaZQM6+xXpKCF1BZlGku3
 hc+nI4Mw1AB4noQRq7YvpeJLzVMMtK1pGm7KpHMlAzyoUl/eWD7pyKX8LvRfyoBPbQIo
 YwM8VZSeZWzArpoMW5cJvhDFavE/qu9/YQUBRLMCTXPiqGPikviiKQ9uCyiv0TGlC6GI
 vlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQKZJvHf1WtLQUnnQ+YYr8z0U0bnUL/X5oP4lbmCs/g=;
 b=k7+vyKTyN3esKhuYyL4OzFtYOed9beQFfkbWT9Y3CJOIL0bNqqhVzBtj+CbhT08jzT
 DVY8m6gvkMoLt3W77kpUpDDVPFkOvuJh40nN3k7bJfjC3KYGZYKMVWE3ltkI6TNQGXB0
 4JOlV26oOVJ8pWXTJBfc36zsHcA8Z1T1VBLb1KPXWEovPdyMGc+jOMnAiMAt2xFRWOWU
 po7owO6NGG3xEC4aDCMK+TyTcO8donzTKbgijMK8B47VoQ4TaaaIq81rZfndwFoAzdOf
 6vlvAdKREUnm/XRYdPkRDBo92eGJEUxf/SIcLN8afy6UAYEbNhpgTqkX08FIvj6vWvED
 OwtQ==
X-Gm-Message-State: APjAAAXGIsJiTeV+XJBQeIU+ZAc+HbL8o8l/m0vqUxPn0XRYIT5Z8ozd
 keB/MR7HTG/ZlRU9iofARWQ=
X-Google-Smtp-Source: APXvYqwCmwWwQooLJukyapOJfGjMEKhOTHvMcsMfWr+K1Mn4hamrwPeP1liVlfVU3P2zF5Jk8xifdQ==
X-Received: by 2002:adf:e641:: with SMTP id b1mr30114961wrn.34.1582046928676; 
 Tue, 18 Feb 2020 09:28:48 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t13sm6998757wrw.19.2020.02.18.09.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 09:28:48 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/i915: make i915_debugfs_register return void.
Date: Tue, 18 Feb 2020 20:28:16 +0300
Message-Id: <20200218172821.18378-5-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218172821.18378-1-wambui.karugax@gmail.com>
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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

As drm_debugfs_create_files should return void, remove its use as the
return value of i915_debugfs_register and have i915_debugfs_register
return void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 8 ++++----
 drivers/gpu/drm/i915/i915_debugfs.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index e5eea915bd0d..4a3c58f9fc1e 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -2391,7 +2391,7 @@ static const struct i915_debugfs_files {
 	{"i915_guc_log_relay", &i915_guc_log_relay_fops},
 };
 
-int i915_debugfs_register(struct drm_i915_private *dev_priv)
+void i915_debugfs_register(struct drm_i915_private *dev_priv)
 {
 	struct drm_minor *minor = dev_priv->drm.primary;
 	int i;
@@ -2408,7 +2408,7 @@ int i915_debugfs_register(struct drm_i915_private *dev_priv)
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
