Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E49A94EE9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 11:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED8E10E35C;
	Mon, 21 Apr 2025 09:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="pVWVnKPm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508FF10E35C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 09:44:50 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b01d8d976faso197312a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1745228686; x=1745833486; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GDEQT5UmTpyK8wbScJw07ZkJn1WpRVeDbWvf8Y9zcEc=;
 b=pVWVnKPmspruCnJkY9Zj5HWot6UHFl+FXaTTTapMhHhnpqfw6lI5TgWEQbgxVQaPUh
 pb62nT0oKe2/ySB3Rx/WJ7I5W5LIRsqwN12R/xg21MT1XzVhIkslKihmStXPb2fB6EUl
 JW08bHgzlX4IlnWSqhsy5gMAwRfvPCyzs0PyEXznskWpbNYgrOFctKJz/JM0RjA2Sn2s
 WpRKfQ+NWYD35Ez2CFhtt9xcDv9RKx2Jimm6VuUahBxbaf//5LIDFr/y/KF3Ab63eSnD
 6dXk6lvCYnC7FNruoAUbDdy0IAiEaVBy2sEEgPa+NeVuViR2L9YP9xua/RD4FbO69OLO
 1eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745228686; x=1745833486;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GDEQT5UmTpyK8wbScJw07ZkJn1WpRVeDbWvf8Y9zcEc=;
 b=U644iWus5jcnVwuiifIBC8dtEhjncOQ8EGmN9GyIaa58FgvM4GcbST+KJc4huKh5uF
 DABZFPQsVbxShgUFpjE7bj9YZdJuOX07w9fsjF3IH4sqLi3HcO6ZxXQJRY4RdgI8mSU3
 yAzluprs025+3cDfGUsYKgovh8g59+6Mb3YhZPUAZ3XOoKReEdrHaoRDbRyN2J2U2oMQ
 ewjQFA+WvcgkgH5tlvjpEPS6LQ7vynjF3FSw5lO0R+5voRQYVQ9VXT6iX4vJgS6W6DDf
 Wm1TstBPBTLV+rwJqLRksrsnX7AbMzWhgvhj2xBB6y+vGDPZPu9XzVDWjEzIU5gTCFVi
 9tXQ==
X-Gm-Message-State: AOJu0YxJKuEUsUPNPpOHk5BzlozaBEXN7VWym+WbdWSbyPmQlZpD/kEJ
 qDWmYTY2ek6H7ugOYQsiMcyPPeHZN1rMnHJPVUD8cNDfJQY920P5sM8IbmjB7s8=
X-Gm-Gg: ASbGncs3TC5t01PljyLIOrzj/9zDtO9qiy5ri3JIS2aAVO6xxfA0rpk0SqRSJgeaHnB
 WeFxEVFu4r+NeBKPJXXwLrx99N5T937OIo2jYdQq/mf5Tf871uPBD0L3dU2ulsqnsYs3Sm/+K9x
 kDx6VjxYsbDl7VyN6Uui/KblP8ghPDXMAwQ/ntCiJLxqrzC+CIjKlN4/swtVr+iKIaiuqMZE5Sz
 HF43pzSfPUJbLCpEkLQunU2nKBOHjvAXXODjr1wyfs/v/GWAur2O1oDoWDDkGMW45ZpU32fWJUp
 uCwWNlSmIqVO4xEl839xQPnpf/0X9DQm4AeUrmzRQpOwhGh0FhQYPjushvd/iT4dBmf8OOtswkR
 Zxni3
X-Google-Smtp-Source: AGHT+IGyGKN+jmsD3XsIQJ5rQcLtg+W/gGGswuQH0rrCgfkpkLFwOMKZpACmLAqDyXCu89NAwruxGw==
X-Received: by 2002:aa7:88d2:0:b0:736:457b:9857 with SMTP id
 d2e1a72fcca58-73dc15669e8mr5613644b3a.3.1745228686515; 
 Mon, 21 Apr 2025 02:44:46 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbf8e59f7sm6218123b3a.72.2025.04.21.02.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 02:44:46 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add support for several panels
Date: Mon, 21 Apr 2025 17:44:38 +0800
Message-Id: <20250421094438.4199-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

AUO B140QAN08.H
BOE NE140WUM-N6S
CSW MNE007QS3-8

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 52028c8f8988..83339c0ccaff 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1744,12 +1744,26 @@ static const struct panel_delay delay_200_500_e50_p2e200 = {
 	.prepare_to_enable = 200,
 };
 
+static const struct panel_delay delay_80_500_e80_p2e200 = {
+	.hpd_absent = 80,
+	.unprepare = 500,
+	.enable = 80,
+	.prepare_to_enable = 200,
+};
+
 static const struct panel_delay delay_200_500_e80 = {
 	.hpd_absent = 200,
 	.unprepare = 500,
 	.enable = 80,
 };
 
+static const struct panel_delay delay_200_500_e80_p2e80 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 80,
+	.prepare_to_enable = 80,
+};
+
 static const struct panel_delay delay_200_500_e80_d50 = {
 	.hpd_absent = 200,
 	.unprepare = 500,
@@ -1880,6 +1894,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116XAT04.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc9a8, &delay_200_500_e50, "B140QAN08.H"),
 
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0608, &delay_200_500_e50, "NT116WHM-N11"),
@@ -1915,6 +1930,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09c3, &delay_200_500_e50, "NT116WHM-N21,836X2"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116WHM-N47"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80_p2e80, "NE140WUM-N6S"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x096e, &delay_200_500_e50_po2e200, "NV116WHM-T07 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0979, &delay_200_500_e50, "NV116WHM-N49 V8.0"),
@@ -1973,6 +1989,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50, "MNB601LS1-3"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE007QS3-7"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
 
 	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po2e335, "LP079QX1-SP0V"),
 
-- 
2.17.1

