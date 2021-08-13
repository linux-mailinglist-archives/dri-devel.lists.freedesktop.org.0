Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1069E3EB799
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 17:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E896E863;
	Fri, 13 Aug 2021 15:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B710C6E856;
 Fri, 13 Aug 2021 15:19:28 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id e186so13732608iof.12;
 Fri, 13 Aug 2021 08:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=V5vqhjeJwhM7E6Pt089X9QON5NrjkvFV308x6a56U3o=;
 b=LZ3AdMIXcu2n0pYTkkI/+pU36yI/lhsT0TyHbsxCyXCSaMdoqclAGgPt2iibcVEGrp
 D+J/gZiijusoQpBycq24BNPOLXXHU3YjbQ3HyJbVms4DuEXsFiGZrmnbaNmNHiqiy67X
 FJT7Y4WNF+GW9DP7eMxc0QxuJxbI5AFcSGCd3umuI9KAInUBkK/oV9rAuZt6MetbIWPi
 6ocQw22suiG8DUF3MNRgACSisMxUbEWS54XZCY5ZWzutC/8ZHTtd9xu/DAfttGqM9mGz
 EU3I6KV8S9s43spU5E5XG9Ft2UM9MR0OAQOxAUdXaeW8f4nMTwz/bbd4IubAbe5q+us7
 Rvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V5vqhjeJwhM7E6Pt089X9QON5NrjkvFV308x6a56U3o=;
 b=si3fGUqk+VNGvpeC009hCi8tbLFeq6Ox7FphNkuMuO1G4zsIFDGmcjSp/9Z0cwDVgJ
 YmvWT5YRO1nmI9G0oU0qv7p3ImkrLlKE1tDr+BhfUjjCmbWdc/Psm460FMBpX0wGPbIk
 1XqSmnOqQGobd25kizFhGEXxGrwyFKhX2Uo1L6sWhfA1tMAgc9+wHYpd2jibgDZ8EPfd
 jzKIphHGB8lbrs6sVf8pbVS88hvWozaTG8KazQSiRQ0OoF6LuU/mM8WTNV0U1mLb8nS3
 WOILzTLcyRXaIveGCQQ0Dom/rxl7fO4TtZBbdL2dEMGByiSLn9PTm47MIBjcKGOcf5dt
 geOA==
X-Gm-Message-State: AOAM532DUsOqnHHykNXRMbbq1hF2reWsQfm2u3SQCTyBZ+DzKlEBePp3
 VnCZYAisTA7g5K+wYX+FauY=
X-Google-Smtp-Source: ABdhPJwSTdHRHZHLxUs9itY+cqohY+ssvDkK5TJigFWw1egZ0dHN8cBWgBGhuYjFhn5tx2SlLYEWtA==
X-Received: by 2002:a05:6638:618:: with SMTP id
 g24mr2839556jar.94.1628867967978; 
 Fri, 13 Aug 2021 08:19:27 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id d4sm921145ilo.29.2021.08.13.08.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:19:27 -0700 (PDT)
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
 Huang Rui <ray.huang@amd.com>, Chengming Gui <Jack.Gui@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Jim Cromie <jim.cromie@gmail.com>, John Clements <john.clements@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, Ashley Thomas <Ashley.Thomas2@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Wyatt Wood <Wyatt.Wood@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Johan Hovold <johan@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Joe Perches <joe@perches.com>,
 Nick Desaulniers <ndesaulniers@gooogle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vitor Massaru Iha <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Julian Braha <julianbraha@gmail.com>, Marco Elver <elver@google.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Johannes Berg <johannes.berg@intel.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Arvind Sankar <nivedita@alum.mit.edu>,
 Patricia Alfonso <trishalfonso@google.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Jiri Olsa <jolsa@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 4/9] i915/gvt: remove spaces in pr_debug "gvt: core:" etc
 prefixes
Date: Fri, 13 Aug 2021 09:17:12 -0600
Message-Id: <20210813151734.1236324-5-jim.cromie@gmail.com>
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

Taking embedded spaces out of existing prefixes makes them better
class-prefixes; simplifying the nested quoting needed otherwise:

  $> echo "format '^gvt: core:' +p" >control

Dropping the internal spaces means any trailing space in a query will
more clearly terminate the prefix being searched for.

Consider a generic drm-debug example:

  # turn off ATOMIC reports
  echo format "^drm:atomic: " -p > control

  # turn off all ATOMIC:* reports, including any sub-categories
  echo format "^drm:atomic:" -p > control

  # turn on ATOMIC:FAIL: reports
  echo format "^drm:atomic:fail: " +p > control

Removing embedded spaces in the class-prefixes simplifies the
corresponding match-prefix.  This means that "quoted" match-prefixes
are only needed when the trailing space is desired, in order to
exclude explicitly sub-categorized pr-debugs; in this example,
"drm:atomic:fail:".

RFC: maybe the prefix catenation should paste in the " " class-prefix
terminator explicitly.  A pr_debug_() flavor could exclude the " ",
allowing ad-hoc sub-categorization by appending for example, "fail:"
to "drm:atomic:".

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/i915/gvt/debug.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/debug.h b/drivers/gpu/drm/i915/gvt/debug.h
index c6027125c1ec..b4021f41c546 100644
--- a/drivers/gpu/drm/i915/gvt/debug.h
+++ b/drivers/gpu/drm/i915/gvt/debug.h
@@ -36,30 +36,30 @@ do {									\
 } while (0)
 
 #define gvt_dbg_core(fmt, args...) \
-	pr_debug("gvt: core: "fmt, ##args)
+	pr_debug("gvt:core: "fmt, ##args)
 
 #define gvt_dbg_irq(fmt, args...) \
-	pr_debug("gvt: irq: "fmt, ##args)
+	pr_debug("gvt:irq: "fmt, ##args)
 
 #define gvt_dbg_mm(fmt, args...) \
-	pr_debug("gvt: mm: "fmt, ##args)
+	pr_debug("gvt:mm: "fmt, ##args)
 
 #define gvt_dbg_mmio(fmt, args...) \
-	pr_debug("gvt: mmio: "fmt, ##args)
+	pr_debug("gvt:mmio: "fmt, ##args)
 
 #define gvt_dbg_dpy(fmt, args...) \
-	pr_debug("gvt: dpy: "fmt, ##args)
+	pr_debug("gvt:dpy: "fmt, ##args)
 
 #define gvt_dbg_el(fmt, args...) \
-	pr_debug("gvt: el: "fmt, ##args)
+	pr_debug("gvt:el: "fmt, ##args)
 
 #define gvt_dbg_sched(fmt, args...) \
-	pr_debug("gvt: sched: "fmt, ##args)
+	pr_debug("gvt:sched: "fmt, ##args)
 
 #define gvt_dbg_render(fmt, args...) \
-	pr_debug("gvt: render: "fmt, ##args)
+	pr_debug("gvt:render: "fmt, ##args)
 
 #define gvt_dbg_cmd(fmt, args...) \
-	pr_debug("gvt: cmd: "fmt, ##args)
+	pr_debug("gvt:cmd: "fmt, ##args)
 
 #endif
-- 
2.31.1

