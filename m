Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 375FC3FCE76
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 22:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E357A6E0D0;
	Tue, 31 Aug 2021 20:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D73889AEA;
 Tue, 31 Aug 2021 20:21:42 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id q3so595403iot.3;
 Tue, 31 Aug 2021 13:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VevGQRX0f3bv63YwX/k69vMS69ewVWDs8ONm/N/C1Sc=;
 b=ek59l99OmiR9mUyjr8y9DQsVkGNnyOQoNmw1dZOM5OLGCT34Lm+dE62PrdYIWHEOOn
 sa9Ws8jwtag4yzn6+GXh+06Y/lM3m8QVeuHlfJfGgn6LxBjNZ4Voe000VhSoVEaGcyrz
 zI+7Co2Ar/CE4IPj1Ztf3LLbI+mY9K/ky4cUMpI4dmNRxCNuf0bWYaaemPAzfWzKnDk0
 qDP+bXr5Edb+ywpLo8vajtXl0MhgKGI32zJQtlzsyV0fo+E6mVVlvsF2d4oSWAigCuxl
 YbzIwdImpGd0SVDH+/j4S8O8fjTiyyR/YP4LIrRSZptXQhZT2c514EVEf2TCbZp4EgM/
 XOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VevGQRX0f3bv63YwX/k69vMS69ewVWDs8ONm/N/C1Sc=;
 b=Gjxxd//tG6Fkx93itnF136oeMiQBC8aC7zj0GCaoJS8kxjyQR/+C3f6mq6A2xI8As4
 vnEpSHDUTkw97KRo5Rx5RdeFFHK9gfy24TnSFjMgvs5poxQ3waZsREsDpi4g5kcnkcjz
 0Dj0dZGUyMKQe5ccbJp4e3SYzafCdfAdIydF1DUTBW4gpb9w3yFsXdb+LcSjoht5nFyv
 AvNZe86vUI0MYm5GzHjKrdM/reXu+wEdSvYoMfT+WGX9wKWi8f/T1PxYejQozAKS8qVA
 j9rUmQnEL0iKK8UerLCV+VXta8ZFm4u8OlX5XGIpNHeyq6GTvDdnNrcMjA+D8snL+hx1
 hfWA==
X-Gm-Message-State: AOAM530qKkW6vKhK9ViRzbWVEyqNtPsn26fynuNcE42j4BDfiFrVGEzi
 20U+0ye9WZjUaqOAqLI2CUbeOApoth4=
X-Google-Smtp-Source: ABdhPJyddbm54BnxLTe/23NlvxX+Frr1DcrqpFH5ZJpXq9sTh9bF2hJKZflGy0zBLD4MG7j58hGXzA==
X-Received: by 2002:a05:6638:4122:: with SMTP id
 ay34mr4436636jab.131.1630441301329; 
 Tue, 31 Aug 2021 13:21:41 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id u15sm10597384ilk.53.2021.08.31.13.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 13:21:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7 2/8] dyndbg: remove spaces in pr_debug "gvt: core:" etc
 prefixes
Date: Tue, 31 Aug 2021 14:21:27 -0600
Message-Id: <20210831202133.2165222-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831202133.2165222-1-jim.cromie@gmail.com>
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
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
class-prefixes; simplifying the extra quoting needed otherwise:

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

Removing embedded spaces in the class-prefixes simplifies the
corresponding match-prefix.  This means that "quoted" match-prefixes
are only needed when the trailing space is desired, in order to
exclude explicitly sub-categorized pr-debugs; in this example,
"drm:atomic:fail:".

RFC: maybe the prefix catenation should paste in the " " class-prefix
terminator explicitly.  A pr_debug_() flavor could exclude the " ",
allowing ad-hoc sub-categorization by appending for example, "fail:"
to "drm:atomic:" without the default " " insertion.

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

