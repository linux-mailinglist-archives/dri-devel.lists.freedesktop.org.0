Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F35663C9A0E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 10:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254916E588;
	Thu, 15 Jul 2021 08:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2B36E588
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 08:02:22 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id b40so7446049ljf.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 01:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CYdPi9b0WxQcuxgr6Dr+0bXs+1Ze8hxAdrJBypViniA=;
 b=Rjy1qv9AhF5XnvBMNasXNThQAXdPZdYB0dMZ/XQJqq5RyxYN1PhL2ATsBkGkgvIHob
 QF1DwRbsnqit5Epq4vtqXBm+gXsIxdLQ17giqmuOoSMC58Tte7Nj6DYDoaR8utghjjtK
 V5z2Ft8k1qX4va/ENUaWOmcB7u63Gp88CvRnRLdOvFQrLkLyVerQ2QZpe/CvctSQDIfL
 fP07Z6zFLUpKKjjfV5inI2aCUekELldOjl4h+juqf7vNP0E8wjymYjOpeUb/mAxqUF0C
 9OmwU2Mmj4eSx4PcqfGNl8QAdC9aGNKotwgYck5GhealYuZ5CD0BS/sJZkjqSS4GfSTn
 hlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CYdPi9b0WxQcuxgr6Dr+0bXs+1Ze8hxAdrJBypViniA=;
 b=qonuinCmA4pQoou7QWdGcTDto1oQ22eRiltxluH6MHVd4s6V2MNcSQ3YFSXI3yUN/R
 sjAK+LZWuT7XitEiv3gBUxOVvNRHAD5ww7GeJyR5vQS7D2x0tOnPdas+A5Vd1tQcPIZA
 FEA+Wkj+GlSnYOC9uFJakJMuro2dZhnW7G6Vtoief83qozd4Dvn4IHXuJ+nkgmwZ+O3+
 5jlFtX3KK1ZwcluUqkV2WAF/06KLaBFkZcL9fWBcsDxNS2S4X60ZTHOPlrIIS77f6u7/
 2D0HfLz8hJRZ1egBxH6xq+emzNosH/jWRFg7epwsn4P3sRTi8Uy5tyx2XQEvkDl5CQ2R
 SpDA==
X-Gm-Message-State: AOAM531kHdAsZ0LL0daYjBTtVqZIK0aG2Oj4lzimG9YqNsI1qNw2E88b
 cg1/kkOZnfh0nqjB2P7x07BsBQ==
X-Google-Smtp-Source: ABdhPJyY/bbHXFf4aLrw5THCUkofd+HzycH06JrpM3b9LXldIhphAmX0gGa7Aormckxts7If0N47QA==
X-Received: by 2002:a2e:bc0a:: with SMTP id b10mr632438ljf.271.1626336140714; 
 Thu, 15 Jul 2021 01:02:20 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id g15sm349462lfv.72.2021.07.15.01.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 01:02:20 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH] drm/panel: Document internal backlight handling
Date: Thu, 15 Jul 2021 10:00:17 +0200
Message-Id: <20210715080017.239633-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
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
Cc: Doug Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panels with internal backlight need to assign their backlight member
directly.

Reported-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/drm/drm_panel.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 33605c3f0eba..1e63fadf1368 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -144,8 +144,9 @@ struct drm_panel {
 	 * Backlight device, used to turn on backlight after the call
 	 * to enable(), and to turn off backlight before the call to
 	 * disable().
-	 * backlight is set by drm_panel_of_backlight() and drivers
-	 * shall not assign it.
+	 * External backlight is assigned by drm_panel_of_backlight() while
+	 * panel-internal backlight is assigned directly to this member by the
+	 * panel driver.
 	 */
 	struct backlight_device *backlight;
 
-- 
2.31.1

