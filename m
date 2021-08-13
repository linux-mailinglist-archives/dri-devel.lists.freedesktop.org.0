Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE03EB7A1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 17:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F316E862;
	Fri, 13 Aug 2021 15:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C216E85A;
 Fri, 13 Aug 2021 15:20:12 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id y3so11204967ilm.6;
 Fri, 13 Aug 2021 08:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Di0vKi6q1FQK7H2Iauu5LRuMFu/619Qh3TdTrNtKXuA=;
 b=PLbGXNu9yoFFMGvAAq7mWxn1nB2oBNSmzMpU++6lMiwMowccbTk69/TgNBK9WRgBI/
 mrDIh2aU8WKSoBDTSm2Xxm7nkOt+8PzvzTkQHd/NzYgBZ1EY/zIZSamX/29Ngd3Rbeey
 ebplp9i5NFP3EVLieSjROCtLIr+3Ge1k/0jjfCS9QBhSA45Y35RYaAy26zOsg0DIKEql
 BC1U3EZ7B7SuQDlH+s85/RriXjUVwOdiOe8Zyjgj6c9/gxz4EQNl4nQYAKZddQgWMXik
 rPAIbHMdV72J4KXtWEl43oLdXcSxjk3lmrg3y93MNqiCSsWs9vY81UIf6rKbRN4xoi37
 U2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Di0vKi6q1FQK7H2Iauu5LRuMFu/619Qh3TdTrNtKXuA=;
 b=E2TGQ0qS13JY4xPAi61QWt74x68gL7c7gerDI++RTZ50PjBcJNEW3rPucny0ahRaNi
 8Jm2KCKeI4mi+W6xqiPQIZAaVROXeJ1F9A6TO1h/Vc0am7AoXBHqPUAbXGXOjf3PHHMy
 5Pw0VpvblHN/Befbd+Pg9dlVBK+pM1fyaupbi+wtWWz7fiQhevKRlNNrynt3Rez+V/A9
 CIJwn8Br2TkQv5gnbpAqb+DtpVEX5NQpRwboyQpwa0BSHZd/hbS3BwdvNNz1xURHQqwf
 WfF/rwyUw5hhnCtqvNStoj039nQfx7SdVZAJNm+H2j7z2Oqgw7/ZBqZoyC6wz9Vakx0U
 3eZA==
X-Gm-Message-State: AOAM53130PEEaUS6AfK2E53yyxQ7iVI9dyqQ/OevNL1sDnoxCAR1rSN9
 zPeyHkmDNZ2AT5z5IfUTzeU=
X-Google-Smtp-Source: ABdhPJwjZ3QV5w0NGk4jwf4SXlJWwLYG7CCgjFVrVegJXXhUT9WT2rYtUmFi+TK28d00QloXQ8BuTg==
X-Received: by 2002:a92:7d0f:: with SMTP id y15mr2194691ilc.10.1628868011655; 
 Fri, 13 Aug 2021 08:20:11 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id d4sm921145ilo.29.2021.08.13.08.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:20:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org, seanpaul@chromium.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Baron <jbaron@akamai.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Huang Rui <ray.huang@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Jim Cromie <jim.cromie@gmail.com>, John Clements <john.clements@amd.com>,
 Ashley Thomas <Ashley.Thomas2@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Wyatt Wood <Wyatt.Wood@amd.com>,
 Johan Hovold <johan@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>,
 Nick Desaulniers <ndesaulniers@gooogle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vitor Massaru Iha <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Changbin Du <changbin.du@intel.com>, Marco Elver <elver@google.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Albert van der Linde <alinde@google.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Arvind Sankar <nivedita@alum.mit.edu>,
 Patricia Alfonso <trishalfonso@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Jiri Olsa <jolsa@kernel.org>, Johannes Berg <johannes.berg@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 6/9] amdgpu: use DEFINE_DYNAMIC_DEBUG_CATEGORIES to control
 categorized pr_debugs
Date: Fri, 13 Aug 2021 09:17:14 -0600
Message-Id: <20210813151734.1236324-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813151734.1236324-1-jim.cromie@gmail.com>
References: <20210813151734.1236324-1-jim.cromie@gmail.com>
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

logger_types.h defines many DC_LOG_*() categorized debug wrappers.
Most of these use DRM debug API, so are controllable using drm.debug,
but others use bare pr_debug("$prefix: .."), each with a different
class-prefix matching "^\[\w+\]:"

Use DEFINE_DYNAMIC_DEBUG_CATEGORIES to create a /sys debug_dc
parameter, modinfos, and to specify a map from bits -> categorized
pr_debugs to be controlled.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../gpu/drm/amd/display/dc/core/dc_debug.c    | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
index 21be2a684393..69e68d721512 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
@@ -36,8 +36,50 @@
 
 #include "resource.h"
 
-#define DC_LOGGER_INIT(logger)
+#ifdef DRM_USE_DYNAMIC_DEBUG
+/* define a drm.debug style dyndbg pr-debug control point */
+#include <linux/dynamic_debug.h>
+
+unsigned long __debug_dc;
+EXPORT_SYMBOL(__debug_dc);
+
+#define _help_(key)	"\t   " key "\t- help for " key "\n"
+
+/* Id like to do these inside DEFINE_DYNAMIC_DEBUG_CATEGORIES, if possible */
+#define DC_DYNDBG_BITMAP_DESC(name)					\
+	"Control pr_debugs via /sys/module/amdgpu/parameters/" #name	\
+	", where each bit controls a debug category.\n"			\
+	_help_("[SURFACE]:")						\
+	_help_("[CURSOR]:")						\
+	_help_("[PFLIP]:")						\
+	_help_("[VBLANK]:")						\
+	_help_("[HW_LINK_TRAINING]:")					\
+	_help_("[HW_AUDIO]:")						\
+	_help_("[SCALER]:")						\
+	_help_("[BIOS]:")						\
+	_help_("[BANDWIDTH_CALCS]:")					\
+	_help_("[DML]:")						\
+	_help_("[IF_TRACE]:")						\
+	_help_("[GAMMA]:")						\
+	_help_("[SMU_MSG]:")
+
+DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_dc, __debug_dc,
+	DC_DYNDBG_BITMAP_DESC(debug_dc),
+	_DD_cat_("[CURSOR]:"),
+	_DD_cat_("[PFLIP]:"),
+	_DD_cat_("[VBLANK]:"),
+	_DD_cat_("[HW_LINK_TRAINING]:"),
+	_DD_cat_("[HW_AUDIO]:"),
+	_DD_cat_("[SCALER]:"),
+	_DD_cat_("[BIOS]:"),
+	_DD_cat_("[BANDWIDTH_CALCS]:"),
+	_DD_cat_("[DML]:"),
+	_DD_cat_("[IF_TRACE]:"),
+	_DD_cat_("[GAMMA]:"),
+	_DD_cat_("[SMU_MSG]:"));
+#endif
 
+#define DC_LOGGER_INIT(logger)
 
 #define SURFACE_TRACE(...) do {\
 		if (dc->debug.surface_trace) \
-- 
2.31.1

