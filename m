Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F084D59DC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 05:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1204510E690;
	Fri, 11 Mar 2022 04:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F38A10E497;
 Fri, 11 Mar 2022 04:48:19 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id r11so8922879ioh.10;
 Thu, 10 Mar 2022 20:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/h9xFvawkOKYC2TFtGI3znCZsvzaWHfu4sF1ThE8sW8=;
 b=Zh/GmixJA2Bkf+z3osxm52SixJc6N5HkApUb2Sp4YGoESKhGGarMHbycUmY/c6Dz4J
 +xK6+F/W73MpUprLT70tAmHEUqNOYAibOBVn/qnSaB5/rEQVsqqczquFlpxgR1J6wk0M
 kbOZ/NOewpqCsHafnHbqm2A5Lf7hQfpJ43mC8fN2jZThxq+HG4T1ItPSF8mYPAY/XPGd
 qfrdVcgaU60hqfL84zXmEEPWBRZc0F5S63EKjTShBYTzQyn3feampBV7byM6fXOxZeo+
 dCdZKUt0qW4bASMO7CIYGnErd2OblUZJi3Z3Wk2Rp3k1mFnoHGT2abEHrvk7R3J0bqw9
 IKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/h9xFvawkOKYC2TFtGI3znCZsvzaWHfu4sF1ThE8sW8=;
 b=KrjH4tSZ5GLHE4wI+oTC9Yj4iIfqbBXUcr19ScsD3VSonlhJRU8v27f0ZqlBMMT0NK
 YXt8d70TQJzps4J8vu6JDpURVz+htAWB8ocinFbDRtlO7mjz8aH7LgmqTX9G2NzYnoG3
 QeZaPepvkZVkgfd0a08Yph2FjzkY0iY4w7MyluP5xw5kOGenfbbQ24plaPEWDdeKWhtQ
 NKjzJPtpBS0TP42bfbjJYOguztJS/zIM1KsGOadmSN7R9jRNdQZmXr5HU7Ol2d+LOsvJ
 3b/LQk43xEGRhgnrLq0DnUmhC3XPkJG8+6C//HA/pr9aEmPYhY1a809Kb5szwC+YKfJr
 DqRw==
X-Gm-Message-State: AOAM5308LOXLqDWIQNNmHn61Gloy6KHft29+euthPey8cQuFY8NPSGQW
 KV5RrJS++LhvFDTJsjvFHEY=
X-Google-Smtp-Source: ABdhPJx9nc37H2OIUHqJB2EjVVVmHJqmzNnu/dUpgVAbx3aqEwg8oB7jd+HVTBgzb+5P6OYmKvD6dg==
X-Received: by 2002:a05:6638:2586:b0:319:ac56:5f2f with SMTP id
 s6-20020a056638258600b00319ac565f2fmr6752417jat.146.1646974098620; 
 Thu, 10 Mar 2022 20:48:18 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 q9-20020a5edb09000000b00645c7a00cbbsm3529834iop.20.2022.03.10.20.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 20:48:18 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] dyndbg: drop EXPORTed dynamic_debug_exec_queries
Date: Thu, 10 Mar 2022 21:47:55 -0700
Message-Id: <20220311044756.425777-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311044756.425777-1-jim.cromie@gmail.com>
References: <20220311044756.425777-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, amd-gfx@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This exported fn is effectively obsoleted by Commit:HEAD~2, so remove it.

Its intent was to allow drm.debug to use the exported function to
implement its drm.debug bitmap api using dynamic_debug.  Instead,
HEAD~2 implements the bitmap inside dyndbg, using the internal fn that
the export wraps.

Since there are no other expected users, and any prospects would
likely reuse the bitmap or a straightforward extension of it, we can
drop the exported function until its really needed.

This also drops the CONFIG_DYNAMIC_DEBUG=N stub-func, and its
pr_warn(), which I avoided in 2012, then added in 2020 :-/

Fixes: a2d375eda771 ("dyndbg: refine export, rename to dynamic_debug_exec_queries()")
Fixes: 4c0d77828d4f ("dyndbg: export ddebug_exec_queries")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  9 ---------
 lib/dynamic_debug.c           | 29 -----------------------------
 2 files changed, 38 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index e83c4e36ad29..664bb83778d2 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -60,9 +60,6 @@ struct _ddebug {
 
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
 
-/* exported for module authors to exercise >control */
-int dynamic_debug_exec_queries(const char *query, const char *modname);
-
 int ddebug_add_module(struct _ddebug *tab, unsigned int n,
 				const char *modname);
 extern int ddebug_remove_module(const char *mod_name);
@@ -253,12 +250,6 @@ static inline int ddebug_dyndbg_module_param_cb(char *param, char *val,
 				rowsize, groupsize, buf, len, ascii);	\
 	} while (0)
 
-static inline int dynamic_debug_exec_queries(const char *query, const char *modname)
-{
-	pr_warn("kernel not built with CONFIG_DYNAMIC_DEBUG_CORE\n");
-	return 0;
-}
-
 struct kernel_param;
 static inline int param_set_dyndbg_classbits(const char *instr, const struct kernel_param *kp)
 { return 0; }
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 704361af5b23..b15a9c715e5b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -582,35 +582,6 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/**
- * dynamic_debug_exec_queries - select and change dynamic-debug prints
- * @query: query-string described in admin-guide/dynamic-debug-howto
- * @modname: string containing module name, usually &module.mod_name
- *
- * This uses the >/proc/dynamic_debug/control reader, allowing module
- * authors to modify their dynamic-debug callsites. The modname is
- * canonically struct module.mod_name, but can also be null or a
- * module-wildcard, for example: "drm*".
- */
-int dynamic_debug_exec_queries(const char *query, const char *modname)
-{
-	int rc;
-	char *qry; /* writable copy of query */
-
-	if (!query) {
-		pr_err("non-null query/command string expected\n");
-		return -EINVAL;
-	}
-	qry = kstrndup(query, PAGE_SIZE, GFP_KERNEL);
-	if (!qry)
-		return -ENOMEM;
-
-	rc = ddebug_exec_queries(qry, modname);
-	kfree(qry);
-	return rc;
-}
-EXPORT_SYMBOL_GPL(dynamic_debug_exec_queries);
-
 #ifdef CONFIG_MODULES
 #define KP_MOD_NAME kp->mod->name
 #else
-- 
2.35.1

