Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8419467BD02
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506AF10E8B1;
	Wed, 25 Jan 2023 20:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C12D10E89D;
 Wed, 25 Jan 2023 20:38:16 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id g16so20393ilr.1;
 Wed, 25 Jan 2023 12:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVl+HnEN+v0wIxiGTzNKn42qnV5EhpwvJd73YIzQ2wo=;
 b=IMpgUVnDUOYBdwOs7bcqbaDGzsgkMjf4UUiGkvJo+mgk1fMWICHH/gxINumJ6rKM1J
 tVhgMss0X3b9ABU1U73Wt1lfekDkcCVIWmdGNepY5MwtuSq7Kk2NOKNVAdfKwBCckO03
 A8LBZh70TSs4MJZN35D5PBH3jwzwGoOWHBH7bEUDD67yZ3RJAt9WmjOV347nsH9xOU7O
 wLHp3yGxGjPLV/+kr5EPBbr9AM0cQSTQ4c5r0mYz8kWA1XOljmB9FUh9R+rbdMcEZJ/D
 CUkt0NrwJVrJlek1ZavtN3VL/L4MIz2G9J8IjjUNxU27kb8nf17mg78w7vRJCZZfSpH/
 r6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVl+HnEN+v0wIxiGTzNKn42qnV5EhpwvJd73YIzQ2wo=;
 b=nD4HYnbnX7nndXbYaz0ti4V0u0vrlHbC3K5DV+3A2T24IITmDAWsXFbalXKnn80qDI
 ikasFxqaLmjRZ24EpPdYiwNvnntijh8FdCIiQQB5r9/PbTMuPfq+AnKRWaQ+IJ2IjRAD
 w4hH480UEJWZHHqITZmmsjLrruykT5qk9gaKRLq/h3nXV7tVwrQayMjW8vqskCSNeHl9
 Dd4MGWAXcV4Sap36VfZiUVUhigx6gNxk+GtN3dtTIvufNQ7JS2leG7bwi9MOd68c4TuX
 NdhLv0lxVuoQgU0WVt8bE4GlQRwL2lf9Rm/IS5Bcz230IfDtr5nnv8HO4jsT25hBpIc+
 U+wA==
X-Gm-Message-State: AFqh2kpge0ovCYMckDpNmUHoeKNlK+FDmw6w6AONGX6XiRKWg/aMivaF
 5NncJS8tms2DX4aeLvkQpwoDvglaeWQ=
X-Google-Smtp-Source: AMrXdXssIhDZ6YkcdjXT6Rn0LjRYjWgQ9PPO1ngV+ocC8+5A0CqhOWrLj9OLnLvXLGAah5Uk5Sl2yQ==
X-Received: by 2002:a92:d48c:0:b0:30e:e8d3:a5ff with SMTP id
 p12-20020a92d48c000000b0030ee8d3a5ffmr30054140ilg.27.1674679095367; 
 Wed, 25 Jan 2023 12:38:15 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056e02128b00b00310a599fd43sm665104ilq.46.2023.01.25.12.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:38:15 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 17/19] test-dyndbg: disable WIP dyndbg-trace params
Date: Wed, 25 Jan 2023 13:37:41 -0700
Message-Id: <20230125203743.564009-18-jim.cromie@gmail.com>
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
index ff1e70ae060e..6b7bd35c3e15 100644
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
  * dynamic-debug imitates drm.debug's use of enums (DRM_UT_CORE etc)
  * to define its classes/categories.  dyndbg allows class-id's 0..62,
@@ -115,22 +123,22 @@ DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
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
2.39.1

