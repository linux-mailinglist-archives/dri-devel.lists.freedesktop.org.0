Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C6B41D121
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 03:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6B76EB2C;
	Thu, 30 Sep 2021 01:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0BA6EB2C;
 Thu, 30 Sep 2021 01:44:44 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id j15so5048916ila.6;
 Wed, 29 Sep 2021 18:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BS9AKALGwmUgSOoK9p/66v+O3ZFmjWbjDLsxZcHUoJA=;
 b=fU0NeOS1NtLCMt52jV0EfRi2a0pN/3WfUwz7w8A0SqcTCwLwwh8Jwbpwjjf+NDNY4p
 kc90+gpm54vP8jiU4K7PsrdYQ4G0EUCNI+KGkIN/4kKYldWSJNzOdJITQ2HKng9eTp9S
 cM9nHjEt0en9ngHFjAZ2ehpg59Oa9p625q2myEfYm1B+MrlP0gw8sSXlntTXcJwcJmWH
 XbHYv9C+WBT6409mZfvVM9+NfluAzV3gYi6BH1mxTPK8ZiToHAmERCdJlATjHAgHKsfb
 QAArWWJB3myyFhIGX3ZIwnsnJbdlz8Wme81eaPNgnuBt/zfiCaXhqngEnjiBD8reDxaw
 y0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BS9AKALGwmUgSOoK9p/66v+O3ZFmjWbjDLsxZcHUoJA=;
 b=L+VrX1V262dLnBvQiQFoMQ8rIS1Kn24GO0xpaxK/D/OUBCbN4vzaFMmFnfPeadPNPb
 J4GItg/T/3YNxDms52F660SSP/FzNhnuRcm4VwrRMoe6viYXZFucFLFJ21tGEUZN+HAs
 k65Es0j8x/on6WMtuSuXJXpZ4EGuu2SIQ+hSvif+qllPFwgU4z1KWP9FoigonjalyVNf
 eXPR1sp77pnhozPlpDPMncoLsSsZyx6DuzdT6YpgV03h4toxk2AqgAD6GLKmLyEqXcmE
 i45Zb0tev0khhHACY0SkUJHcM7Jbrm08/otSG2zBdp+5MYZFRCQvvhzl1HB4vXy3S2qW
 r/Yg==
X-Gm-Message-State: AOAM531dsoSoE8PK06lmFRQ6RpKFGrJXOITp5vbgbPkHc5MYlN9hdFHP
 qXJYk8YgTh/fNb5NfY7mwbkIZCJ6iFo=
X-Google-Smtp-Source: ABdhPJwIMOyZMp7li4n1RDRWM997P9y9iKcB3MDGaziXeFE33j31hN+snrmkiubYIYsOPT7z5Ndr3g==
X-Received: by 2002:a05:6e02:1985:: with SMTP id
 g5mr2197498ilf.311.1632966283321; 
 Wed, 29 Sep 2021 18:44:43 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id h23sm1155414ila.32.2021.09.29.18.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 18:44:42 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 4/4] i915/gvt: remove spaces in pr_debug "gvt: core:" etc
 prefixes
Date: Wed, 29 Sep 2021 19:44:27 -0600
Message-Id: <20210930014427.14239-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930014427.14239-1-jim.cromie@gmail.com>
References: <20210930014427.14239-1-jim.cromie@gmail.com>
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
vs
  $> echo format ^gvt:core: +p >control

Dropping the internal spaces means that quotes are only needed when
the trailing space is required; they more distinctively signal that
requirement.

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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
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

