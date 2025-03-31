Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6084A770E9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 00:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BA010E1EE;
	Mon, 31 Mar 2025 22:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DZ++TUH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36C410E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:13:00 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id
 d9443c01a7336-22401f4d35aso82455585ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 02:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743412380; x=1744017180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aXfa9bgMsQdeUBd20MfPXF0A+XxOPRxIRG+U13SNVEE=;
 b=DZ++TUH99SGdOmQjiicklEWeT/Z36WsO9u6IyyuC+qYNNGBzoeqW7GxdwUYAWx5ObO
 0etmUXLyp/OiHi4DrN8e+nMnO+FTSEtjAO6kQwrt0lSdqdrrx4nUf+gv7IrhPcCKM6PS
 0mJ/agFjHfWvPUkbxz/KdiufEsvEMChwxJ40gi9c0zfAkQWcGRqxqk30wHqb8j7Ro/ot
 1MhVWnlhr/yhGwMn5ISQOEUuxtI7oVsgLdMejaLyufhP7BrsjEdHf5YWo2VfWHOGlH+f
 QiUh7kAt/W96i3wKtrfNE17obwpFe8UdT1VnYT0gl4OoI9AUuVOMOdQygJoBvXVoHbIu
 rRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743412380; x=1744017180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aXfa9bgMsQdeUBd20MfPXF0A+XxOPRxIRG+U13SNVEE=;
 b=JGMv90ETcdLTwfqR7eK64rovXargLzX8PVQP+l7eUbF2wvGBb14GX7GQ6YKgmhHKMI
 f0wrxybIjHhHEJ9IfsL3cUHxWpIfKcaJt3b5Y3vwWUKnvnl3ytTj/VvU/GHj3A2O73/0
 3wQ6nuCR4SmJ6OfvbZq/vNL3g2UBAWRHHAPeXTXuuqMo4l/as/yv1FDMztiJoKgBSify
 hCwlCoog89K6R+gtsGVCmBuFpzuNDmcpqOLo/OysTd6HqHrxs68T7oUEl6N2gYAdx7gE
 JSE6mveZwS91l5sMkFx8ON1e0cZxqo948yGUHqYFFea4Dir7BDxCjc2RXfXBPBjcW1/5
 KM1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTNDvbswQPCUjZR5RhLXZz5308V6Pcvi9l2MzBmTbWretrdMN4xoM+BuFnTDrMkKP59c/zTCR8awU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtiOC9ch2mDYIqgbCJ5fxFqiBzyrWzSbZ+nSaIJIU099C8AYIc
 REU2xhebi5mYmeAYA3yhrGfTBnFSp3T3ZLyjft9DYUOCo+ky2jOb
X-Gm-Gg: ASbGncsnBrrKEESboPkSrQo+LJugRu9Xn//huzK2eAeJFXD+y1sGkNf3glpYpkN312P
 mwnJNtjInNtRwVjSw3KWtDAZ7MHsSfLI48+Nr8GTv5voLFa/qP4Hc59VWpVsdbtMSOTKCt9Fx22
 rh+JohwaQ9d957gPVMug3XvcI+hWFlMhnpdy5QBQHpSTV7q5AqblW/2mYWj/si8VWz85/i3hWgt
 O6BTMCeHW2jhfXu0pqC2vboL8SB4M3J891bHU54UpPxc2nMyyjVvKxadYfPAscx6CzaierC+ald
 iSszb3n5bSP5H3aYlaA6Fc7NwNUBh/nbnKk2ZzPDWWBilvid0rjwl1UdMJXw4gMcN9S2scGIeD3
 a3W+Ujg==
X-Google-Smtp-Source: AGHT+IFEEh/emvRl57NiK87EmBBBQ4yLrU3pfC0mqT77RnMd2vcNv7HBRIC3yTEMkuLyR9iPqdxvVw==
X-Received: by 2002:a17:902:e550:b0:224:c46:d167 with SMTP id
 d9443c01a7336-2292f95f1edmr137533305ad.16.1743412380165; 
 Mon, 31 Mar 2025 02:13:00 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291f1fa0a5sm64957295ad.240.2025.03.31.02.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 02:12:59 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] backlight: qcom-wled: Add NULL check in the wled_configure
Date: Mon, 31 Mar 2025 17:12:45 +0800
Message-Id: <20250331091245.6668-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Mar 2025 22:34:12 +0000
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

When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function wled_configure.

A NULL check should be added after the devm_kasprintf call to prevent potential NULL pointer dereference error.

Fixes: f86b77583d88c ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")

Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/video/backlight/qcom-wled.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 9afe701b2a1b..db5eda8ec37e 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1406,8 +1406,14 @@ static int wled_configure(struct wled *wled)
 	wled->ctrl_addr = be32_to_cpu(*prop_addr);
 
 	rc = of_property_read_string(dev->of_node, "label", &wled->name);
-	if (rc)
+	if (rc) {
 		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
+		if (!wled->name) {
+			dev_err(dev, "Failed to allocate memory for wled name\n");
+			return -ENOMEM;
+		}
+	}
+
 
 	switch (wled->version) {
 	case 3:
-- 
2.34.1

