Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 725E144DD99
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 23:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04CB6E94F;
	Thu, 11 Nov 2021 22:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF13F6E486;
 Thu, 11 Nov 2021 22:02:33 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id l19so7261751ilk.0;
 Thu, 11 Nov 2021 14:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RyfWj4lDBm5JLTztNtdXlP2pvw82NplVvLHkINaddHI=;
 b=Kvi2EAdCdWaXJ6kJgQk1VrgqcTWkikERMgmlUhPlj9CaRDRDFG8Ud22y5A3dr2BTba
 P9hHkboLf6pReDaX4Xqgy+THgOV2hs7LHYQPsSPDrY3Ps+rzG+I/EG5+Sv9nCqx9pvDI
 o98MLJ1jBX6jcScTV+opGDb/FasBDTSLuyoLNqjixwjc4Zgq9bUeTt6D4SxIn0oiJfNq
 Rv/8Bc0d9uduhOM8YMbxhqRQ3yJLxsy1T+HfXdMj8ORsNi5ec+6aTRaC1kh/IHs2TBsK
 y7xSMofBrI6K0Onm+wtsu/DJnbv+pjpDn5twnIW8pXYpxuZBhJmAC9vciYeBk3qotqC9
 6F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RyfWj4lDBm5JLTztNtdXlP2pvw82NplVvLHkINaddHI=;
 b=CIm4zkm8dCfj/vQoZWW0Kf/FJ5f+iyeWH4mxxcFK86UF8v7DaTlZHhFyOg2A72M4cD
 /MMPmCvJwMjMgQPswAY6UpAwVJDubhI8CO2+mUUlulcgw/unogc2EtoMQbUWMC4rKp7i
 GIelv3AcpENF588xNaBJAMAZvRVUqYv4o8KGUw3fWFPCiraWqMh2EPOpllrpv+3o8ZG8
 ks7fWq73lZdI3fBmaTCYyxXgjkQwqEGsHOWwO3aBnN8J9DGBzC8/Xkc1wF59M6wOERxa
 K0UHofxcghD9QSf6znuTfA3oqpBIWi7fUd1cjtJR/Y/51xp7rAShxC+0+MQYSlwfd1dd
 iPsQ==
X-Gm-Message-State: AOAM530WkK2LQxWyC/jjrFGzpR3EacFfNFL5I/Su4ieyUkIir52T207L
 mTP99FqlQdQkWjZ1gvdL8g8=
X-Google-Smtp-Source: ABdhPJxis7a3Rv7SiZn5oIuzy4jt/6RHfyGEQvTemYeJX0kELCbQ+OJl6ZWlJ1TfCSFqvg8e36VzZg==
X-Received: by 2002:a05:6e02:1c0e:: with SMTP id
 l14mr6078084ilh.8.1636668153212; 
 Thu, 11 Nov 2021 14:02:33 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id t5sm2612315ilp.8.2021.11.11.14.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 14:02:32 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, robdclark@gmail.com,
 sean@poorly.run, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 lyude@redhat.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 04/10] i915/gvt: trim spaces from pr_debug "gvt: core:"
 prefixes
Date: Thu, 11 Nov 2021 15:02:00 -0700
Message-Id: <20211111220206.121610-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111220206.121610-1-jim.cromie@gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, arnd@arndb.de, jim.cromie@gmail.com,
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org, mingo@redhat.com,
 quic_psodagud@quicinc.com, maz@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

