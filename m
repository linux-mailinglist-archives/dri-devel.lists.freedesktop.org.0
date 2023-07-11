Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E08D74E9EF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4185710E342;
	Tue, 11 Jul 2023 09:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0459410E340
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 09:12:00 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-668730696a4so2920466b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 02:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689066720; x=1691658720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pTyng55pA+kR26hSGNkbT7uPc2zM3Salr3BcTTccrew=;
 b=SUgHYxeroF3XQD5mLBG6WvDW8h79eCpFmw8FDDbwqgfmQT/M1HhLGNbF5Mv+qq6RPS
 0wAvtcCPRU1K/2HZg5NbqiLkyKt5DuMqje/TSzxnlAvp9fRWqp664zafty+3tzCnKAB0
 PqJ86i/yY4NeK8WCadQXicFPZUa3xW6AGfaZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689066720; x=1691658720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pTyng55pA+kR26hSGNkbT7uPc2zM3Salr3BcTTccrew=;
 b=ZAlLxpHGcjs9aySOmRAt4hT7RZQsZVOKYl7c/jVlW7PStd1XUJkZmIdcwKODtKQq5f
 V6AAh/qxlJWZY3hbJ0Ng4CCpDJTCtuRodM2cJ76TasZTNu1OUJkOWLpm2uKYcie1IZdJ
 1yCIg+mMMC3fqUgzBi+z95js5cmsQfoGKRzMChQ5Yz7uSze50r/5k+shec3OdRLG5erz
 6vF5a/48PQz37mH8w1FnN6nx4izzVqmnt0j9crp9djKbO2m/VajOzc5PqtZYMrhZGZ83
 pVuc9FWRaVW2qNCmbaqNjBU4CMoa4d/4oreRSv29T2SALa+74QuJeKoLzvBbD2WJ5JZx
 m/yg==
X-Gm-Message-State: ABy/qLZt0KICwLFwgBPu72QduW8TUff/x8jCAffMOUC0Ai7bi6rPARiq
 StqI6Y2lxmOkkosQw80JzI8fpw==
X-Google-Smtp-Source: APBJJlGbyDeSbMnlXiDQleGQjRRmmMxCouiDLMo1SZSGsbaB1huQXuXugpl4cI2dKKGuxhsUNasHow==
X-Received: by 2002:a05:6a20:3c8a:b0:12d:3069:69e1 with SMTP id
 b10-20020a056a203c8a00b0012d306969e1mr14020579pzj.60.1689066720255; 
 Tue, 11 Jul 2023 02:12:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:23f8:a996:7e53:c71a])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902c24d00b001b8896cd57bsm1336239plg.269.2023.07.11.02.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 02:11:59 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/panel-edp: Add AUO B116XAB01.4 (HW:0A) panel entry
Date: Tue, 11 Jul 2023 17:11:54 +0800
Message-ID: <20230711091155.2216848-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.390.g38632f3daf-goog
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel is found at least on the MT8183-based Juniper Chromebook,
also known as the Acer Chromebook Spin 311. It matches the common
delay_200_500_e50 set of delay timings.

Add an entry for it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index fbd114b4f0be..df7e3cff004c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1866,6 +1866,7 @@ static const struct panel_delay delay_200_500_e200 = {
  */
 static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B120XAN01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116XAB01.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
-- 
2.41.0.390.g38632f3daf-goog

