Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379309E769F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 18:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D71A10E403;
	Fri,  6 Dec 2024 17:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F7KfFajj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E086810E403
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 17:03:27 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-841d8dec299so138404039f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 09:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733504607; x=1734109407; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dFYeC2ggW3uAbNOBdbSsj7OtslV8NoVLj4AJjNTegtE=;
 b=F7KfFajjb5OBdUxzUOoNNz3rUWLz5+yLFNDiI+lp6L2b80E+/4WQ4DQr5xhx+x2YL6
 G6qCzB+8s6qK4H9TxjGnfmfzmjctaffAfIqOA+YjOOFVbDedUp3ptZbTyQHucJ9pATjk
 3BiLaFdzZoeDXLjrWc95eGCWvL0+bCT9YKpXp44pLbHigKovJsnoCSnhozHiWDbiVhJv
 e3OBztOaO2dPzg75ntRaZMemw7QqgrNiMPfwr2R8byIOLQjsJWKEwMutnyunD4nC3UPq
 QFTVR83VtaahKdXDdaJQYONDckv8tuz4bO32Co5B5WgIJOp9bAqwIntZrs9f0Ml/CZYe
 qV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733504607; x=1734109407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dFYeC2ggW3uAbNOBdbSsj7OtslV8NoVLj4AJjNTegtE=;
 b=S5fcykeB0775N9GMJ0Gkz/LKPplCmBIQWgjwbNVWDP6eUrROc9be3q9jfJKYueNCnU
 B7vaQm9Yjqd2y3rU0BcIDsiJeR9ODrEC/o738GClWmIXntmnHNRjDz8O467Omckoak73
 QN4uepqnMvus1cg+kP90IiFzdndhzCuiKvUK2rowjLYD8jaGecBN0f/F14kANjP1Ywwu
 3L8INtPjgx70shQ+69V7eQq+CcFtOyMMI0ChO8wiIngFLM7ioZslA0xLxC4l76VVfB4s
 Eg/hEb4DCpZM4K/g6hyULCqhGFaikItCrml9gEbfD3MllCs4Mba/xGsPdZVLrQ1oIl/N
 2sEg==
X-Gm-Message-State: AOJu0Yza7Y78cq240g+qpNsHP2dfWW5I1e8mSY1Q2A8q2jZYg13n6SKY
 eBatLScTsPhN8c+t1yAf6YI8PXGjHrJ/IfAfE2HBqT7x9XGagW1W
X-Gm-Gg: ASbGncvjbYCrm0cMb18uvyEUkXsod6Iwx4WYSMP4gfkY0wkpLzhYPtWVdkEA+javMce
 XBfkJO3r/I+P1bR2E8o0qKRz8B1BRQtYNyelRodFjDxcem/dmE0wLglApFjovUhq/u6qvQaVGuv
 eSEVvUICCSyF1s4wcwWduEdOH3IqL6UP2zri6YRpOvpbGDVqsBA0YJF0jkLYdzLCDk/gIEQKh44
 OQcyesr2v3c2HNLBY6KyuIEhg6GLB9lM13PiVaLbpblaSLKXD1GPf2/HIqPUGRuZhcfDq+eGiaN
X-Google-Smtp-Source: AGHT+IHfrrwfd6H9P8Y9TtM8QUR2MQ/vH2sFi9rdk0KMDhijn1+TWzSMrAkdqBOETOtYMyNanxdcyA==
X-Received: by 2002:a05:6602:3402:b0:82c:e4e1:2e99 with SMTP id
 ca18e2360f4ac-8447e296ad5mr431902039f.11.1733504606846; 
 Fri, 06 Dec 2024 09:03:26 -0800 (PST)
Received: from inspiron7620plus.lan ([172.59.229.198])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-844737bc53esm110519039f.4.2024.12.06.09.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 09:03:25 -0800 (PST)
From: Guy Chronister <guyc.linux.patches@gmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@gmail.com, Guy Chronister <guyc.linux.patches@gmail.com>
Subject: [PATCH] drm:panel-orientation-quirks Added DeckHD support
Date: Fri,  6 Dec 2024 11:03:20 -0600
Message-ID: <20241206170320.2789-1-guyc.linux.patches@gmail.com>
X-Mailer: git-send-email 2.45.2
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

This commit introduces a new quirk to handle specific orientation issues for DeckHD panels on the Steam Deck. The quirk ensures the correct display orientation for these panels, enhancing the user experience on Steam Deck devices. Tested on my Steam Deck to ensure reliability. Feedback and further testing are welcome.

Signed-off-by: Guy Chronister <guyc.linux.patches@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 4a73821b81f6..9a3beca9f79c 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -455,6 +455,13 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
 		},
 		.driver_data = (void *)&lcd1280x1920_rightside_up,
+	}, {	/* Valve Steam Deck (Jupiter) with DeckHD */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* Valve Steam Deck (Jupiter) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
-- 
2.45.2

