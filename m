Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6183867BCFD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888FC10E8A5;
	Wed, 25 Jan 2023 20:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0B410E877;
 Wed, 25 Jan 2023 20:38:14 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id f8so12684ilj.5;
 Wed, 25 Jan 2023 12:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovP7PFmgMqyQc9NY9GDFYVGSSu2k59LVEuwQJZ5PPI4=;
 b=MMDswgzXpzaUDYApMdu+BtPWTHUd/wN+emcwjG+zcUIdFl9SiOVeZ86yWHDOgABF/d
 GgL0K10meMOXrPXZugi33rB0CtZFjqvcrbWSnqK8M6z+/HUN78Xh5S1PWDIL1vrL2udJ
 Dd5mLXA7JkpNQFLk16uBcDB10VNfjdPPPjqTYszPdiL+mTYEfT0Qm5mXsPaK7g7e5qOG
 cWw/j65HAUXZ0GZ222r+iRyZnjSD8xml81LbgevL2o1uQQy8VPGDbdsU12HTVw5sgA1O
 TprOL59rGZSJFyx5ej5HDyk80fLvFLSV8W6VCeBAvG8FDc5tfeJ4vhjy1WG0c0Z0Y5Bs
 z2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovP7PFmgMqyQc9NY9GDFYVGSSu2k59LVEuwQJZ5PPI4=;
 b=XNlSROkONuo+WfkrOY5oILEmsjxrRJMG5uLLCUAEoel5MICBMXjlcSg2jI5b+I4GdR
 TQ0bfKLhBMZrvhQ8Alroewg66uvrfiufMZbd5osUjqA7zWVB0HXCpuwLTM6GfiOKDBmX
 6xeAbg9s7CdUtirnNuF3yStQVEDay2D4M94CobwfbCyn/4WRbATLwRcNhX7J705ljaY+
 tGsAqOVzt2XXXyNWXDpcUgSXGnSNArw5lgkvK4otzDGJYAs6TuB4uo5sXr/Az+cWeAv3
 ZNddlBNh9i+ZCtgtb5F0V51WZeyToYLn1MzN2t2YL1LMMt7AdTFWSkebSjaVzmjcAqEa
 +X+Q==
X-Gm-Message-State: AFqh2kqWFf9HElj1xnmPorDkgh8m4m9uyZUmJdLPGREp9qp5jhY8tv5R
 Ynyi+ltKmmi5RdRvUrz8oB0=
X-Google-Smtp-Source: AMrXdXuGRJJhY6PgU4R2atsAMxDJdEEymErRS55yv/fMGBzNaylMz260TGjuYbSnbFCDSzzjc5R4tg==
X-Received: by 2002:a92:503:0:b0:30d:b40b:6e4 with SMTP id
 q3-20020a920503000000b0030db40b06e4mr23273807ile.31.1674679094482; 
 Wed, 25 Jan 2023 12:38:14 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056e02128b00b00310a599fd43sm665104ilq.46.2023.01.25.12.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:38:14 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 16/19] test-dyndbg: rename DD_SYS_WRAP to
 DYNDBG_CLASSMAP_PARAM
Date: Wed, 25 Jan 2023 13:37:40 -0700
Message-Id: <20230125203743.564009-17-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125203743.564009-1-jim.cromie@gmail.com>
References: <20230125203743.564009-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Original name was a punt; but the macro is maybe general enough to put
in the API later.  Rename and improve the macro towards that end.

Also tweak internal name constructed in the macro, to add a '_'
between the name components.  This changes the .i file only.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 8c005c17f2db..ff1e70ae060e 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -44,14 +44,15 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
  * Additionally, here:
  * - tie together sysname, mapname, bitsname, flagsname
  */
-#define DD_SYS_WRAP(_model, _flags)					\
+#define DYNDBG_CLASSMAP_PARAM(_model, _flags)				\
 	static unsigned long bits_##_model;				\
-	static struct ddebug_class_param _flags##_model = {		\
+	static struct ddebug_class_param _flags##_##_model = {		\
 		.bits = &bits_##_model,					\
 		.flags = #_flags,					\
 		.map = &map_##_model,					\
 	};								\
-	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes, &_flags##_model, 0600)
+	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,	\
+			&_flags##_##_model, 0600)
 
 /*
  * dynamic-debug imitates drm.debug's use of enums (DRM_UT_CORE etc)
@@ -113,23 +114,23 @@ DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
 		       D2_LEASE,
 		       D2_DP,
 		       D2_DRMRES);
-DD_SYS_WRAP(disjoint_bits, p);
-DD_SYS_WRAP(disjoint_bits, T);
+DYNDBG_CLASSMAP_PARAM(disjoint_bits, p);
+DYNDBG_CLASSMAP_PARAM(disjoint_bits, T);
 
 DYNDBG_CLASSMAP_DEFINE(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES,
 		       LOW, MID, HI);
-DD_SYS_WRAP(disjoint_names, p);
-DD_SYS_WRAP(disjoint_names, T);
+DYNDBG_CLASSMAP_PARAM(disjoint_names, p);
+DYNDBG_CLASSMAP_PARAM(disjoint_names, T);
 
 DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 		       V0, V1, V2, V3, V4, V5, V6, V7);
-DD_SYS_WRAP(level_num, p);
-DD_SYS_WRAP(level_num, T);
+DYNDBG_CLASSMAP_PARAM(level_num, p);
+DYNDBG_CLASSMAP_PARAM(level_num, T);
 
 DYNDBG_CLASSMAP_DEFINE(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES,
 		       L0, L1, L2, L3, L4, L5, L6, L7);
-DD_SYS_WRAP(level_names, p);
-DD_SYS_WRAP(level_names, T);
+DYNDBG_CLASSMAP_PARAM(level_names, p);
+DYNDBG_CLASSMAP_PARAM(level_names, T);
 
 #endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
 
-- 
2.39.1

