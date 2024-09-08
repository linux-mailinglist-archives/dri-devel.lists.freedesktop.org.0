Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EEC9707D8
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 15:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A0F10E272;
	Sun,  8 Sep 2024 13:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SCLYrQWn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8DB10E272
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 13:36:00 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7179802b8fcso2345421b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 06:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725802560; x=1726407360; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lrHW/WPW/tmB8xlxZt2U0QdmJv6UcMCpbqutQiX5JMA=;
 b=SCLYrQWnqSz6xRCY2x+SArDyA1LTknsJAKChRHn9XxBjUhz7yXV7jHkohFB0D8690o
 JDuWDYs6XIZBwUDFU+bzmdW6shQYA/de6F5JCaU+kp4hOjejOmH41bQ46+U+XjSaSc3n
 tA/xDsUrrZ5tdD59OL3sLZ+wHucUi+xFQftuUa2E/5jqTsE35yHp8FhTk2Hp2QLT/d3h
 24B9Lj5FHywwYS29QFLES9Jyy6sndaeLMr3vPMHx7J6o49bn1nUdssmLpM8LsEnVjhQk
 8ddfxwGDOvsH9C1SREwFcXX7Vtam22uHH9sGbPVBfeKZLFQctqBpcvXNoMrFGXK4H+d2
 jYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725802560; x=1726407360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lrHW/WPW/tmB8xlxZt2U0QdmJv6UcMCpbqutQiX5JMA=;
 b=na4EI6zCyJuFpWMAL0TX7+e6dD1hkYNnRlv9ovNcDrLWjJe6gnJ5fNKzhenvrzqK9h
 Iz4r+0sJeZXV836iD8u6AfDpl0KZ7fLK/SxI9kGC8aZiso3UKFephAI3WdquhhqNkCJK
 JKHiR2ehK2SEXMK/MO1L+dem0CcgjTODK7mbmbSGKWAnBkf7n9XQFy3bKxBXx24cPnYK
 TTY+FRIa6rllJDOTaeTbeV8n7Kp7o4crdU/G0SXLFKXEoECEqLoe0ldYD7o7yII9zaBL
 70GM7uCFDTPwsI0QEcCFghHOhe6DIZfyVwn7Sv/lOm2CCblg6q+C06AQsk+00+M7N+lG
 yvRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm+yCuuygrTYvkdxVomvYV21RosJc+3LKR/e7PcpUvrfYH65OxaR8ZaYRPzbWltuobAmWVtsTQHIk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw098zmdQPKfl+ZyzKGO7Sho+Wp7V9GNqfT4hpr6Nd94FcvlEhx
 TUeA5P5hYIh8bT81pCZnkQ+mS/RxRG+MjBwKV4EA2JN55X6EJkkN
X-Google-Smtp-Source: AGHT+IH+8craLoHGDf/GOz6Ze01xi4LSwURhatcmaHJgRbnYVbRO7h42x0b+cwcUiDAEeUnHkCRS7A==
X-Received: by 2002:a05:6a20:2d14:b0:1c6:ba9c:5d7b with SMTP id
 adf61e73a8af0-1cf1d0f98b5mr7076007637.23.1725802559695; 
 Sun, 08 Sep 2024 06:35:59 -0700 (PDT)
Received: from localhost.localdomain (111-240-109-89.dynamic-ip.hinet.net.
 [111.240.109.89]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710eeaf29sm20131935ad.143.2024.09.08.06.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 06:35:59 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: khadas-ts050: make ts050[v2]_panel_data static
Date: Sun,  8 Sep 2024 21:35:30 +0800
Message-ID: <20240908133533.112894-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.43.0
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

make ts050_panel_data and ts050v2_panel_data static because they
are only used in drivers/gpu/drm/panel/panel-khadas-ts050.c,
and fix the following sparse warnings:

drivers/gpu/drm/panel/panel-khadas-ts050.c:620:32:
sparse: warning: symbol 'ts050_panel_data' was not declared. Should it be static?
drivers/gpu/drm/panel/panel-khadas-ts050.c:625:32:
sparse: warning: symbol 'ts050v2_panel_data' was not declared. Should it be static?

No functional changes intended.

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 drivers/gpu/drm/panel/panel-khadas-ts050.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index 14932cb3defc..0e5e8e57bd1e 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -617,12 +617,12 @@ static const struct khadas_ts050_panel_cmd ts050_init_code[] = {
 	{0xd4, {0x04}, 0x01}, /* RGBMIPICTRL: VSYNC front porch = 4 */
 };
 
-struct khadas_ts050_panel_data ts050_panel_data = {
+static struct khadas_ts050_panel_data ts050_panel_data = {
 	.init_code = (struct khadas_ts050_panel_cmd *)ts050_init_code,
 	.len = ARRAY_SIZE(ts050_init_code)
 };
 
-struct khadas_ts050_panel_data ts050v2_panel_data = {
+static struct khadas_ts050_panel_data ts050v2_panel_data = {
 	.init_code = (struct khadas_ts050_panel_cmd *)ts050v2_init_code,
 	.len = ARRAY_SIZE(ts050v2_init_code)
 };
-- 
2.43.0

