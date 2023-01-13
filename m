Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CD666A34D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D6E10EAE7;
	Fri, 13 Jan 2023 19:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4C710EAE8;
 Fri, 13 Jan 2023 19:31:00 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id h11so243142ilc.1;
 Fri, 13 Jan 2023 11:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwY51vCw5d2KWkq9unQZFSxtB1BKyvHEDbc8ZQVYmz0=;
 b=CxnhZR5Y4ZqJM1g634VwuFdLi5atSc7D5VIBKBW4dLrTEiW4v7UroCjNzfjavsTB6l
 czTKGH/1v/EQ4SPhDpqRz3aXY/1yQyiIf0yzIQ0ufjpJ5SU++Qo0pB1XlJS1iu49H7aO
 JHgVBJlPWzjp4+bvJxR9fIRii0Gs4XI4Zo0bUf06hwsH0rcNREFeup9n0mHKJwLTUDlF
 j8lC5BrgL1iXoAMypRD80MVctJKsGsdsR4KplNoM7d/1WsIz8LbIVS0OgTKNyRuDMX49
 C/dyfePZmrS56rgdN3I51NH9pjQVxpPbavtNokoj2eTPuzhSUqVYpYAlbdIKZ+IS5pkA
 Q4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lwY51vCw5d2KWkq9unQZFSxtB1BKyvHEDbc8ZQVYmz0=;
 b=CRQbhZ3gZ2FB+NpObRqWD6Td23nErtsT33Np0zuwKwkiFv4W2EdnWOYkeY6zhoyE9v
 mum2mgEhoZkBwsWAzqINn1z8r85sFkf4MKKkDcqiRFbaf0m2E3fA1laUMUDdsHaciO65
 6W4sN+oVAujhmxqIHEgKC8cGwme9yigMm+dTL3pp5Ufxs0RFi0vzW6QYm5d+UfrZ3FY5
 DKf35L7SdJTaCd5TcdePHjjGtetFGhxay3BIUKALd3AS1mZQ3bStIs00PEC5Pg+H6CC8
 fXoAPubVE9nmglFM+RsCCyYd1YqKnK6SPDtNVWMg6a1Kze0X/7y3Al7lqMcG31tgJ5ku
 Z0+Q==
X-Gm-Message-State: AFqh2kp/AS8PsnekwWnslzaEyeqYuLjsvxunkFAkJXAMb6XgYNoLqxBK
 c9GQM0LBFbOaRcn1QVO3WBs=
X-Google-Smtp-Source: AMrXdXuepQxNSSHHm82kCfNKgO7OiaA997T8L5znxd8j+HTMb8MJP9lC3JyWYsL9Fkv+3uS13K2KjQ==
X-Received: by 2002:a92:c6d0:0:b0:303:9287:3af7 with SMTP id
 v16-20020a92c6d0000000b0030392873af7mr60731571ilm.4.1673638260085; 
 Fri, 13 Jan 2023 11:31:00 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:30:59 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 16/20] test-dyndbg: rename DD_SYS_WRAP to
 DYNDBG_CLASSMAP_PARAM
Date: Fri, 13 Jan 2023 12:30:12 -0700
Message-Id: <20230113193016.749791-17-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113193016.749791-1-jim.cromie@gmail.com>
References: <20230113193016.749791-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
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
index 39d4f63cade1..45e123b29a9b 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -44,14 +44,15 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
  * Additionally, here:
  * - tie together sysname, mapname, bitsname, flagsname
  */
-#define DD_SYS_WRAP(_model, _flags)					\
+#define DYNDBG_CLASSMAP_PARAM(_model, _flags)					\
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
  * dynamic-debug imitates drm.debug model's use of enums (DRM_UT_CORE
@@ -112,23 +113,23 @@ DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
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
2.39.0

