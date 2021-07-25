Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A47BC3D4F14
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 19:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5C76E435;
	Sun, 25 Jul 2021 17:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E546E435
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:28:33 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id c16so3296269plh.7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 10:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U1qSxIQbiVdVt/lEXiEIEXng9XXzwdSD4TYYp63Ch7U=;
 b=MKyAWRu4ceLjKVKJJMSZ+JZdZt7XWJKsj/dse7md4NRBzmQjhicS6c1HSejfjkqJ3A
 ybwQUlJOvXLA8nsbVW2nSzMu8bTlBuiVACURkC9hWSxBBL9HlBXL1r+FfdBDiw2ZB9Lq
 9ptgoE/OCy+hfAn//XiNQVfxFRITmReZtMPOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U1qSxIQbiVdVt/lEXiEIEXng9XXzwdSD4TYYp63Ch7U=;
 b=NX6NX9BVbw/txD2KxIiB0KvLLsbF9BaGP/VU6y1SJ/Zph4t5sYPZFJFZwaH8RHNvxx
 FZUsRTnaKeqAtsag5wo0T8TGAxP/BlPbE6xGyjjHWLXb6yigD9peovss+8iZkbdknvih
 7JDD7pyvjK9vTywVFTf2m3c2OelAaR2/wUkKAVKNKVMi1OZMxOpcm/6I6OV0FMl1wl2j
 17QTcr/7GfUagRO4Y1Kxxk5HjaC26hDxpRHUdWLEWKWx3VxlZH5PHUxGXQIjKfTKr+BU
 4/A71ybZSzgZVq8kKDt39DnemARqDPezzHJthVW8mqbQNiwI3/zNuG0Qqkkzh2dBmC3I
 rWoQ==
X-Gm-Message-State: AOAM532ZtYhbK39zwnwKkQcQMSqghNcoWVC4EiGEARxaVS4cZWRmL5/O
 BhvtPOmtHNr9BZPANMnVHMjjsw==
X-Google-Smtp-Source: ABdhPJzoM5i38zUrzezGU7JigZkm4Cm4VM2JAjeKj2jGQmuMgKF+Vhl60TI8vyRiwEe29MIzVqysmQ==
X-Received: by 2002:a17:902:b692:b029:12b:e0b8:3415 with SMTP id
 c18-20020a170902b692b029012be0b83415mr7900893pls.32.1627234113452; 
 Sun, 25 Jul 2021 10:28:33 -0700 (PDT)
Received: from e-ThinkPad-E14-Gen-2.domain.name ([103.161.30.206])
 by smtp.gmail.com with ESMTPSA id 143sm14897026pfz.13.2021.07.25.10.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 10:28:33 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2] drm/panel: panel-simple: Fix proper bpc for
 ytc700tlag_05_201c
Date: Sun, 25 Jul 2021 22:58:22 +0530
Message-Id: <20210725172822.890363-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ytc700tlag_05_201c panel support 8 bpc not 6 bpc as per
recent testing in i.MX8MM platform.

Fix it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- none

 drivers/gpu/drm/panel/panel-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9be050ab372f..6f4151729fb7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4164,7 +4164,7 @@ static const struct drm_display_mode yes_optoelectronics_ytc700tlag_05_201c_mode
 static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
 	.modes = &yes_optoelectronics_ytc700tlag_05_201c_mode,
 	.num_modes = 1,
-	.bpc = 6,
+	.bpc = 8,
 	.size = {
 		.width = 154,
 		.height = 90,
-- 
2.25.1

