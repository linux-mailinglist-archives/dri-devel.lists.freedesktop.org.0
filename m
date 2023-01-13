Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C2366A351
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1C410EAD5;
	Fri, 13 Jan 2023 19:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F2B10EAE1;
 Fri, 13 Jan 2023 19:31:01 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id h26so11225218ila.11;
 Fri, 13 Jan 2023 11:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sXtZaooZ45JiB4b6dTyLmd0EG5FQixGlgDB25zw6+E4=;
 b=WilaoJVI3YuxchGiCcrK3zBv9B+yXVCKf7HtcgZ7GEGn+bZVJADzIBemXqTfws+FsU
 yX8BOLN/2Y9uvpkAW/0tHxItxH2t9f54BIJMd+bEO4h/I2ShfDrNsf4bgbeVJOLta0T5
 4iKxs16V2MhWJf90+7+ewR6vNwB9maVvQRPiVPq3wH0AwkKr8AJnu9nsNWYwAqNBHWA1
 Wsa39pOO57OQlA4skLoav1ADNWoWY0ibbAT2U5FGEBLefrVCFDZIweFkd5Bkh7gnq7qt
 zOKnwm4MMk8U4BIEPj2fIEKFaO5X3YBs6lmZf9S5iGIUwZFsocRElG6WlWFvXLXNCuCW
 VPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sXtZaooZ45JiB4b6dTyLmd0EG5FQixGlgDB25zw6+E4=;
 b=KHvIBCVGQOfkS1y6+TgksXMbZVg+d7Dy2AibETXnYbbmPcVUQz1YM4cBd7HT0fw0S2
 XgJVzer6LAWrLC5DfSuCStWioe2X7QsXl3icue4vnKDsRZ3gAqEUj1/baC9TTMqWazsj
 7awKx+hpnGhgZ7da7k6Ge/2UzMInqD7UxVcXp4ceCG1gUN0Kfrg67bvhkGQ41EHcwgxt
 4WYXTAlW6kSc6zs8psHMGGdViqnkCNENYj2Oj0rED+2kNz/gpR3OF2lyGA6OiQPx0h+/
 jeSsBZfUKEt9ey/SpQLSYhwpQproGrRmbAKY2oEUBudkCMqOCEdEEqSrPN9Bu+BPU/M7
 0RJw==
X-Gm-Message-State: AFqh2kpyJWM+HT+3edWc+mZnOWYl5XJ/nPjCR1w+ZR3BZ67WpHWWpSqW
 gdk2qmkaVnek1c9Ei44t3Wc=
X-Google-Smtp-Source: AMrXdXsrMaDJ+qnbKaUj7ZlrxW3dvJ4frh8HAEVmIwYKqJASSo9Im4/1fW4l0and/BelKRWmXYmbfw==
X-Received: by 2002:a92:d8cb:0:b0:30e:ebc9:f19d with SMTP id
 l11-20020a92d8cb000000b0030eebc9f19dmr274283ilo.25.1673638261006; 
 Fri, 13 Jan 2023 11:31:01 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:31:00 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 17/20] test-dyndbg: disable WIP dyndbg-trace params
Date: Fri, 13 Jan 2023 12:30:13 -0700
Message-Id: <20230113193016.749791-18-jim.cromie@gmail.com>
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

The dyndbg-to-trace feature is WIP, and not in mainline, so the
presence of the interface to use/test it is unhelpful/confusing.

So define DYNDBG_CLASSMAP_PARAM_T() as DYNDBG_CLASSMAP_PARAM() or
blank, depending upon ifdef DYDBG_TRACE, and update 4 params
controlling the T-flag to use it.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 45e123b29a9b..9e66c5a7e138 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -54,6 +54,14 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
 	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,	\
 			&_flags##_##_model, 0600)
 
+/* TBD */
+#ifdef DYNDBG_TRACE
+#define DYNDBG_CLASSMAP_PARAM_T(_model, _flags)	\
+	DYNDBG_CLASSMAP_PARAM(_model, _flags)
+#else
+#define DYNDBG_CLASSMAP_PARAM_T(_model, _flags)
+#endif
+
 /*
  * dynamic-debug imitates drm.debug model's use of enums (DRM_UT_CORE
  * etc) to define it's classes/categories.  dyndbg allows class-id's
@@ -114,22 +122,22 @@ DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
 		       D2_DP,
 		       D2_DRMRES);
 DYNDBG_CLASSMAP_PARAM(disjoint_bits, p);
-DYNDBG_CLASSMAP_PARAM(disjoint_bits, T);
+DYNDBG_CLASSMAP_PARAM_T(disjoint_bits, T);
 
 DYNDBG_CLASSMAP_DEFINE(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES,
 		       LOW, MID, HI);
 DYNDBG_CLASSMAP_PARAM(disjoint_names, p);
-DYNDBG_CLASSMAP_PARAM(disjoint_names, T);
+DYNDBG_CLASSMAP_PARAM_T(disjoint_names, T);
 
 DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 		       V0, V1, V2, V3, V4, V5, V6, V7);
 DYNDBG_CLASSMAP_PARAM(level_num, p);
-DYNDBG_CLASSMAP_PARAM(level_num, T);
+DYNDBG_CLASSMAP_PARAM_T(level_num, T);
 
 DYNDBG_CLASSMAP_DEFINE(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES,
 		       L0, L1, L2, L3, L4, L5, L6, L7);
 DYNDBG_CLASSMAP_PARAM(level_names, p);
-DYNDBG_CLASSMAP_PARAM(level_names, T);
+DYNDBG_CLASSMAP_PARAM_T(level_names, T);
 
 #endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
 
-- 
2.39.0

