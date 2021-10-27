Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EF643C1AB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 06:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CA489193;
	Wed, 27 Oct 2021 04:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9956F89083;
 Wed, 27 Oct 2021 04:37:21 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id z144so962159iof.0;
 Tue, 26 Oct 2021 21:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JnEv+1wiw5YTf5b+dk8jhOAFVorOFGekz7eDajaLDB4=;
 b=ljxP0s62mYkZ5IrRSrhEo5yUUYFJRSHIcDXt91KWM0roaqyofbb7eNcmIfrHhW5LHc
 uJqa5YVCTkiSFRWMpALVT8ZjoSRu8IxVkWiCURlRJuNXG9nlw57rho7LxLlR1c9cRvM7
 TrwvuxWJMUlnUt1Mj7aycPoOgVEPriELhQxie6wRDwR6lHLpkoMsmRyprk4o7T9OK3x2
 MzLptxLB3HPX+GphpsQ0Utf4/KZbnh9Er5BFcsTGN+7I/pQckj47e4tiphP6KgSDl8hC
 Wx2jZmffRXqQ039ughnGRhxre83eN3kmuwX88dcB91gZ211o95Zjjh1/FnueX+4+UQ2N
 MD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JnEv+1wiw5YTf5b+dk8jhOAFVorOFGekz7eDajaLDB4=;
 b=zTZTHCuXDNQzMOFQyodg9J5Eq90Npx9tnFvpTH1L3MHNkTg9TnJpWv+HDbemwc1WfB
 +W8PAwUqKTpWKOeio0XmTwAOBaZDxLxzjDPpL+W3jK/IgbUuVkhuo4jq8ev9dM0ImEH7
 Wun2UrInLUu4810y1WCuyyeH564JtUDacAwvdHB2XIHY4+fw1dz9Jpd1K2XDoz468L31
 6AfdYDpwTxbpPxnmveO+UphDT8GyMJc40KEdooBCnO7k9VBA5jYntZw/+qRuc2bz6K32
 6JHRR0eJ/xzp63vX6zK+7fRiqQD+sM7qvNkDu03E0uH/gQuOSy4u5mjD9mqYdgyApXvH
 Hlig==
X-Gm-Message-State: AOAM531doDlHpkz5jR1MsIN/8hAzmfSk598nPku8vvvTp+tFevO0Rbgo
 qWUpLMazKX1S2KYHx84ZBgI=
X-Google-Smtp-Source: ABdhPJwJ5+KFsDDo1Kh/8vs968qMEDlSxAlHN1y4Oaw8oXXsSQOtees/IkX4dKyyvPP+Z8bAEpqSBA==
X-Received: by 2002:a05:6638:459:: with SMTP id
 r25mr11720480jap.2.1635309440927; 
 Tue, 26 Oct 2021 21:37:20 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a15sm2030404ilj.81.2021.10.26.21.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:37:20 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 04/10] i915/gvt: trim spaces from pr_debug "gvt: core:"
 prefixes
Date: Tue, 26 Oct 2021 22:36:39 -0600
Message-Id: <20211027043645.153133-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027043645.153133-1-jim.cromie@gmail.com>
References: <20211027043645.153133-1-jim.cromie@gmail.com>
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

