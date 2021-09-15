Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CCC40CAC1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 18:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB84E6E9B1;
	Wed, 15 Sep 2021 16:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799186E9A8;
 Wed, 15 Sep 2021 16:40:42 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id z1so4253540ioh.7;
 Wed, 15 Sep 2021 09:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WWVzXcugFhShLI8+18wBUsvLbtXZHN1dHiomXl0q9m0=;
 b=h2nqqSiK05MaZPjZn0O9cW2a/DBKnxGpuJHqk1kgCRIu/6sePRxVEYYdS+iAt5RYmn
 tIxknQRSl7RgSl8FggO1GYcpt/ST0KUEtzZGc7/aOQ0ppv1AiHcURxJ6RoCpaexadWTw
 2L3Mw2saOEm92f2FT2If9VN80Xr0cqxXBqpONa6tFSlg9YAB97HV7u2/nczUftKCrkhK
 SNt3tJ+I2EwozPmBoclfxGrg2FhLPhrIvTP1y6fsqNLqOPnYdVyCNYe7MgaLNGes4T/Z
 eE5fq7ZAJdNXxAVxvcLwa1x2/X/IZBBuJgq7vkqE1FTmhKKFP2qsEvDXuVT0W5yid3fH
 aibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WWVzXcugFhShLI8+18wBUsvLbtXZHN1dHiomXl0q9m0=;
 b=yKzLCCwADExyttD9US+YG7UgHdgbOYm/unPSz1tpSvs5OLZ6At3wvaXReTM/GKf3wr
 Q9FS44+w3uhv1qxwEDRCvfYpZ5WJujIrz+NhTaPWDVHSEGMUf+9OZ3G4T9Q07jvWH8/v
 ohXizHQmj7Q5GGg+E4pgAQG94xru6nLjnh4pEEVz1EazfulC4D2c/2N5xs5cM6stUFsk
 Bo13N0dW/RY7laBEWdDlMlU23CoUOavngOW25l/Z/N/MNspdZiXvbdBiUKhKM0aNTZyC
 nmQsEA7g7VHqPac8HE1FljoSVW8CDMQTV8vaVdSuoBDyRIBT9sqiiozdh/II7AZEJQk8
 fspA==
X-Gm-Message-State: AOAM533IYxSMdTv4S55k15t37h0Aq1W1mQMZsGQ8cY1f+uUELs0XjDhz
 ozErtPxpPulSF1KY0ch0mM4=
X-Google-Smtp-Source: ABdhPJzobW5prgv7HuVZ/VMfpGur/vc5NbLATFSDX7do1XCkKAmSPcUYonOfjz2lqzGOwOC3BJNnyg==
X-Received: by 2002:a5d:8715:: with SMTP id u21mr796339iom.1.1631724041842;
 Wed, 15 Sep 2021 09:40:41 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a5sm299540ilf.27.2021.09.15.09.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:40:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 10/16] i915/gvt: remove spaces in pr_debug "gvt: core:" etc
 prefixes
Date: Wed, 15 Sep 2021 10:39:51 -0600
Message-Id: <20210915163957.2949166-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915163957.2949166-1-jim.cromie@gmail.com>
References: <20210915163957.2949166-1-jim.cromie@gmail.com>
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
v8:
. fix patchwork CI warning
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

