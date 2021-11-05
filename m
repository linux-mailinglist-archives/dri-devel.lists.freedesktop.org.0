Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5416244691A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 20:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083796EC3F;
	Fri,  5 Nov 2021 19:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D436E4E6;
 Fri,  5 Nov 2021 19:27:11 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id q203so11772382iod.12;
 Fri, 05 Nov 2021 12:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RyfWj4lDBm5JLTztNtdXlP2pvw82NplVvLHkINaddHI=;
 b=qVKTmYneIDNEr7QHbl1uC6bSNBSf8Y05Zcal5qyh/Ge6l2rhQUhbuYh+2D2KYkKQ9G
 J4rFBTBNnyGKvVx5DJSfolblJfPOyh6MuDPssEL8LsJcHDvEZAQFFG3GfEiv4JuMQIGO
 N11V26vDqADX5L/RiolUjg1mhFkqc6mSXpuNts8eUt+JmZBOsyf+ifOZDYZ1JDhsALjG
 AmhAH3TqBi7pkekDpm6WmDvgNkGlsI3Kch9bjzyIGMN+l822ChvRmhJ3iwP9tmP5Svnx
 LUtBbi7JjRk4d4Mbfsq+a0d/ZU78j9Pw4zsajEcn1iz/djvfSF4sRfHCR7l4XUgVa3pn
 tqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RyfWj4lDBm5JLTztNtdXlP2pvw82NplVvLHkINaddHI=;
 b=dI0/8Z5frlFCxN8vT/hxizgZli9QdOk0mw/u0GBnRn3BlILK2Rn1ZkI6bq5AYAL4aa
 KuCaR5V4m+DUt+tbDEJCSAcx/XH8L+W2hKkM+iIUWAPFtcOzBow9XwDtB+WMh+VhVjvW
 x6lrf8hzXsppgb+vWUXqnmc2ZByiLtYU1hfZAMTMi/reiAj7tFZspcupDNT2lmqD1lNy
 g7e8rLY2kEsEWwl9roE3LepOpHKiQAawCb2ffLQoK856+CwNGLqWF66MQMkUGOfX9ZVl
 7MkK45YLYhJjZ5V3Y1+fl8QL1izgm10EB+hyEbpkMVgFAYqB7JUN0iTm+Adn6JOXZBrD
 JWUg==
X-Gm-Message-State: AOAM532+eOgOjpM2khcHPJLF5wMD4n8a5hZOT+bvDAExkLCMuwt7nFI/
 NIYrLdHAcq21QURNf3hr6vU=
X-Google-Smtp-Source: ABdhPJxOYt+lweZYvxAHtCNFFp40e2qQJbUadz/cFaCrc5NMal45RzO9yik8UJRD2dfAWz1Q8V1Jqg==
X-Received: by 2002:a02:bb85:: with SMTP id g5mr10708401jan.130.1636140431271; 
 Fri, 05 Nov 2021 12:27:11 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id l18sm4338617iob.17.2021.11.05.12.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 12:27:10 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, lyude@redhat.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 04/10] i915/gvt: trim spaces from pr_debug "gvt: core:"
 prefixes
Date: Fri,  5 Nov 2021 13:26:31 -0600
Message-Id: <20211105192637.2370737-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105192637.2370737-1-jim.cromie@gmail.com>
References: <20211105192637.2370737-1-jim.cromie@gmail.com>
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
Cc: Jim Cromie <jim.cromie@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Taking embedded spaces out of existing prefixes makes them more easily
searchable; simplifying the extra quoting needed otherwise:

  $> echo format "^gvt: core:" +p >control

Dropping the internal spaces means any trailing space in a query will
more clearly terminate the prefix being searched for.

Consider a generic drm-debug example:

  # turn off ATOMIC reports
  echo format "^drm:atomic: " -p > control

  # turn off all ATOMIC:* reports, including any sub-categories
  echo format "^drm:atomic:" -p > control

  # turn on ATOMIC:FAIL: reports
  echo format "^drm:atomic:fail: " +p > control

Removing embedded spaces in the format prefixes simplifies the
corresponding match string.  This means that "quoted" match-prefixes
are only needed when the trailing space is desired, in order to
exclude explicitly sub-categorized pr-debugs; in this example,
"drm:atomic:fail:".

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/i915/gvt/debug.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/debug.h b/drivers/gpu/drm/i915/gvt/debug.h
index c6027125c1ec..bbecc279e077 100644
--- a/drivers/gpu/drm/i915/gvt/debug.h
+++ b/drivers/gpu/drm/i915/gvt/debug.h
@@ -36,30 +36,30 @@ do {									\
 } while (0)
 
 #define gvt_dbg_core(fmt, args...) \
-	pr_debug("gvt: core: "fmt, ##args)
+	pr_debug("gvt:core: " fmt, ##args)
 
 #define gvt_dbg_irq(fmt, args...) \
-	pr_debug("gvt: irq: "fmt, ##args)
+	pr_debug("gvt:irq: " fmt, ##args)
 
 #define gvt_dbg_mm(fmt, args...) \
-	pr_debug("gvt: mm: "fmt, ##args)
+	pr_debug("gvt:mm: " fmt, ##args)
 
 #define gvt_dbg_mmio(fmt, args...) \
-	pr_debug("gvt: mmio: "fmt, ##args)
+	pr_debug("gvt:mmio: " fmt, ##args)
 
 #define gvt_dbg_dpy(fmt, args...) \
-	pr_debug("gvt: dpy: "fmt, ##args)
+	pr_debug("gvt:dpy: " fmt, ##args)
 
 #define gvt_dbg_el(fmt, args...) \
-	pr_debug("gvt: el: "fmt, ##args)
+	pr_debug("gvt:el: " fmt, ##args)
 
 #define gvt_dbg_sched(fmt, args...) \
-	pr_debug("gvt: sched: "fmt, ##args)
+	pr_debug("gvt:sched: " fmt, ##args)
 
 #define gvt_dbg_render(fmt, args...) \
-	pr_debug("gvt: render: "fmt, ##args)
+	pr_debug("gvt:render: " fmt, ##args)
 
 #define gvt_dbg_cmd(fmt, args...) \
-	pr_debug("gvt: cmd: "fmt, ##args)
+	pr_debug("gvt:cmd: " fmt, ##args)
 
 #endif
-- 
2.31.1

