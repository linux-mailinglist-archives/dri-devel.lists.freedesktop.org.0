Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE313D4F43
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 19:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D536E440;
	Sun, 25 Jul 2021 17:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB9F6E440
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:47:48 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d17so8865987plh.10
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mz0IpgWaZYl+yaUi9u3W4taecMqgzWCjqcRm42SxmHU=;
 b=At9OdVozOjN3NpXE8qp6SEOHdsp+iQuAsPPSSNtNIqFwRphnGzesT4b4MLG73y5XMq
 tMU301y325QlFqsbs9TnzFA45HHsxjBmNBmzif8IcrhPnV/IAmC4MFxDOw+c0U2e+Q9b
 UxQbeUbW3lZF+W4dzOpSar7r9OffJVFaenrOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mz0IpgWaZYl+yaUi9u3W4taecMqgzWCjqcRm42SxmHU=;
 b=pZl726tkivJM6aTgFnnMVu7Hq+AS0kAK479MDLLQwqMA27qqDYLxJW+DwXE6Vy6GDe
 gYqB1+FFbAOqqq3wnJM3Jj6mYQvS6Fswz3cWKqoUy+QZDTEAFaLwIABbgL0vMK/XKrj7
 CpA7qd3iwbkmBgHbqhjmW2bVqglniC5082yT7y2SEvejOTyovDvzwmxXrJTNpW6Oxmi/
 MS0SqN/Zhv+rQBioKlquJ1ssUzy3ofirH0Me2HlZ87z2l5fIjxF97fNMNx1iTD87BR2x
 ZbNKv7TUOesUzwSszSsByT83TCX346Lg1r8fQoUV/IA1XSAcS8DuM+siId/7pHWMyilP
 aWcg==
X-Gm-Message-State: AOAM53035rBRRFWSluwPU2cIXYOTM2xXJJZDd1eOKzmRWUuXntVIeP+q
 rSxCd5jsylZMoey/5shP3U9AQQ==
X-Google-Smtp-Source: ABdhPJwZOjetbSF3w/ttruGavCbthJ1mmrBk3hRya1s/R2uJeix/aeIbd3QNXCWpgGw18ArD6mwOwQ==
X-Received: by 2002:a63:9c5:: with SMTP id 188mr11132743pgj.187.1627235267848; 
 Sun, 25 Jul 2021 10:47:47 -0700 (PDT)
Received: from e-ThinkPad-E14-Gen-2.domain.name ([103.161.30.196])
 by smtp.gmail.com with ESMTPSA id p17sm11693681pjg.54.2021.07.25.10.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 10:47:47 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3] drm/panel: panel-simple: Fix proper bpc for
 ytc700tlag_05_201c
Date: Sun, 25 Jul 2021 23:17:37 +0530
Message-Id: <20210725174737.891106-1-jagan@amarulasolutions.com>
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

Fixes: 7a1f4fa4a629 ("drm/panel: simple: Add YTC700TLAG-05-201C")
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- add fixes tag
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

