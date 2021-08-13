Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27F23EB78B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 17:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F496E85C;
	Fri, 13 Aug 2021 15:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176486E855;
 Fri, 13 Aug 2021 15:18:21 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id v16so429648ilo.10;
 Fri, 13 Aug 2021 08:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kmHsDnFQwSbOnRKSJ1vga0OhlV8P3CEw6FanKWDIy40=;
 b=qIbqu8wzK9qscBpWltQp8Aqr7ZhvcWfH00SA9TSKhLsih6XkgvJlb5dNCPZed0Y428
 Ho9kklpRcc605c6T72bBSWIARlvwz6S7qW6/EB2v9AzlnwEnCt4tBKAIyLP9rU0PPNrp
 g3BK80iUG+n9gtrPKO/FIXQZ4WwxEYPcEjITnr0EOQAxWaM9N5L2+Y5p0JA6yuX+MxPS
 tDVYwgCJzRl0ib2fQcvHzAgnsI6uG1j9gbzjOnTDbxOGUtqwa5JVOUPgjsj6mUgOmkDt
 ccAO7IhwbTHmgHfSsi7c415C+GNOvmKLu+LI7+1dDq+wni4CY4abL0Ozr+W7lgGKA0oE
 MZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmHsDnFQwSbOnRKSJ1vga0OhlV8P3CEw6FanKWDIy40=;
 b=tDNKxVC01un7DSrPklKC2bWSZFTeT3aXpomkV6t1aWlYvSVVzK6Jvxt+Iu9i13kYle
 RbLTzuf/FExIajzkg5uhCLgyVgAoOKdqISyXhKykT3/ViJgiSEdJWJc5mMgp30HeTZ23
 mlS1IOgZzzlV71UzuSTTXNAxj+DXP7xGXzpZHjZFCTyGSF55vmoJ4peFDdehUhvDQRN0
 6Hik02m1NvAkYPGC5XBp+rQhXyDEBDewP43dsI3SB1PBKbd1/9BLGLhhjuBBEV9/tIAU
 9JotigZIg4c90a7WkTkexfvbU1xS9xJOEO0oe05QCPF+azXXt2n1gqn0I9nqwOZsb6sZ
 S7+w==
X-Gm-Message-State: AOAM531VRzJswO0cxJumPg2KSmzRPoFiZeqt4keWJHcB4bmWdo4ZnN11
 wfoVn+DT2/hqveObtCjwHhI=
X-Google-Smtp-Source: ABdhPJwBNjPAE8rcwIYw12ZbQ/+Re07hAKDo5N1F+WYwa4O8yCRZyySYX3DIgMz+s16zrzA6MI5NXA==
X-Received: by 2002:a92:5407:: with SMTP id i7mr2235589ilb.264.1628867900266; 
 Fri, 13 Aug 2021 08:18:20 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id d4sm921145ilo.29.2021.08.13.08.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:18:19 -0700 (PDT)
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
 Huang Rui <ray.huang@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>, John Clements <john.clements@amd.com>,
 Jim Cromie <jim.cromie@gmail.com>, Kevin Wang <kevin1.wang@amd.com>,
 Ashley Thomas <Ashley.Thomas2@amd.com>, Wyatt Wood <Wyatt.Wood@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Jessica Yu <jeyu@kernel.org>,
 Johan Hovold <johan@kernel.org>, Joe Perches <joe@perches.com>,
 Nick Desaulniers <ndesaulniers@gooogle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
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
 Jarkko Sakkinen <jarkko@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Johannes Berg <johannes.berg@intel.com>,
 Patricia Alfonso <trishalfonso@google.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Arnd Bergmann <arnd@arndb.de>,
 Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 1/9] drm/print: fixup spelling in a comment
Date: Fri, 13 Aug 2021 09:17:09 -0600
Message-Id: <20210813151734.1236324-2-jim.cromie@gmail.com>
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

s/prink/printk/ - no functional changes

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 9b66be54dd16..15a089a87c22 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -327,7 +327,7 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
 /*
  * struct device based logging
  *
- * Prefer drm_device based logging over device or prink based logging.
+ * Prefer drm_device based logging over device or printk based logging.
  */
 
 __printf(3, 4)
-- 
2.31.1

