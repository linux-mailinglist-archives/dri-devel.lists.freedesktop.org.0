Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302B7562155
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 19:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40F7112EE1;
	Thu, 30 Jun 2022 17:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D59E11B163
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 17:34:26 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id 136so86047pfy.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 10:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1s1jurQNn/fJ4wlZGRfg1PNeoKP8xQg/ofkOwb0NO2E=;
 b=N0Zd0OVM4bQky4uabYzuMEV8PyZPfQ/N09BFx0mH52wgBdjlxbeg3dltvfkX2ydhgZ
 qGVMGj4nSzoaZK0ajiSbgouaegww7bDUoWn2zDXg/JhW89N1ZOAeMeamP4XyqoL0bX+A
 Z3qdd0mFEG9XDfttKG3enTn3ZS0Gyytg1pdi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1s1jurQNn/fJ4wlZGRfg1PNeoKP8xQg/ofkOwb0NO2E=;
 b=a+PTUJFdY8m2++zdzZBMQpZdXL9IfuTh8W59+D5bwi8keFnRw4o79bwzAHC0Kh4SJ5
 DgRbsyZgc8rq+4KMiBkJSl1Fcz5zlXfIj1PSh+44xQZgZ9TVu+ZNgvj16VDgCJAx8DYt
 xyN8iC9hydexdqvSDhoReG7aJjwy6Sl7uITvxUApxa5QEzBAh8ux6s9a3yPs9bbdXFlP
 snN60Goosyaq7bsqG4C8nJipcJx3eQNEOg7RfOYgYAJb5lqZz/r6tJBe8RPgB1kWeVQo
 UTDVg/SxSqIP1kxAhqNzO7pQMoKkAYmAt6Akweustyb6LNMNQHxgfuG6A4VW057GTq+Y
 PSxQ==
X-Gm-Message-State: AJIora837mHO0peWtZ1RlHNjtxEl+kxWC/RNVQ+GnYMp2dsJHjOB2mX4
 WCCfglWp7Pm8bcwL3ZYT6Nqef2CvRxXAuQ==
X-Google-Smtp-Source: AGRyM1sTkUaMZfcu6ioDPGwJiwe0TTGaBaUHp6sw3z9cYqSKpyM+kx7JG47ES5+UsaveuyB1Qkoe6A==
X-Received: by 2002:aa7:910b:0:b0:524:f8d9:a4c4 with SMTP id
 11-20020aa7910b000000b00524f8d9a4c4mr17128695pfh.5.1656610465558; 
 Thu, 30 Jun 2022 10:34:25 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5175:e079:2e5a:2405])
 by smtp.gmail.com with ESMTPSA id
 m20-20020aa78a14000000b00518950bfc82sm14331125pfa.10.2022.06.30.10.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 10:34:25 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] video: of_display_timing.h: include errno.h
Date: Fri,  1 Jul 2022 01:33:29 +0800
Message-Id: <20220630173328.1369576-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If CONFIG_OF is not enabled, default of_get_display_timing() returns an
errno, so include the header.

Fixes: 422b67e0b31a ("videomode: provide dummy inline functions for !CONFIG_OF")
Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 include/video/of_display_timing.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/video/of_display_timing.h b/include/video/of_display_timing.h
index e1126a74882a5..eff166fdd81b9 100644
--- a/include/video/of_display_timing.h
+++ b/include/video/of_display_timing.h
@@ -8,6 +8,8 @@
 #ifndef __LINUX_OF_DISPLAY_TIMING_H
 #define __LINUX_OF_DISPLAY_TIMING_H
 
+#include <linux/errno.h>
+
 struct device_node;
 struct display_timing;
 struct display_timings;
-- 
2.37.0.rc0.161.g10f37bed90-goog

