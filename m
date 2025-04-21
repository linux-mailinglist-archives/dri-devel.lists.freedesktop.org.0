Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2B0A95045
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 13:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C006C10E381;
	Mon, 21 Apr 2025 11:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="M0ACDDv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7723810E381
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 11:36:56 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-30363975406so474018a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 04:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1745235416; x=1745840216; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FNzgKMUlsQlbaZsVnBHAf8TEaqUQ33irtDfzYvyzqio=;
 b=M0ACDDv+VZByDoaYacqPnvdJqatDNFPW7FfL4bmgscfIh5r6yuMGp8E0k7sLVxm3s6
 rJD5xRRHEiImFdS+iusLNKE7f7LrmqzfN6KRkKgbfXMfmwoZRM/pJHheleq7Y1ueRnOq
 tRGqCLKZnSD1KGwZuqMSH6Lz9a2CJ3iEsdoIIUk1AC+UuAuKvX3EXGUHEkbh1B+h1/nJ
 tqghdAi1g/BWo7pXZaJTwGLEolPXWbLPmmf6EfjJnKPbYkdeR4r1I/nMgVyvs9N7x8u3
 FcRNnRLhbT1dSFUk4KaGFWbzAeDd7W0L6M9jB3rNjeWm2WakFOvDnrCTVyy7PCXZ2v63
 6yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745235416; x=1745840216;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FNzgKMUlsQlbaZsVnBHAf8TEaqUQ33irtDfzYvyzqio=;
 b=cu5hktrsMFRHWslNwyLxZ5zY5v7NAGfzE3ddob/ieVPlMy7QSn0ufb92amsSMX+CTV
 6c96Yww7A2xhYjB6sEvd0Zd2vymkGDlOJTuL8XHuC7LwScCJD9F7uKgkNOLTzVn1qwCO
 DntHhhQ2tgwBAFll3W4vXnxFhXguJ1jI7mf1BP4q1CdHoR70xQcWTme2/e8Ki5m1nu7E
 +CkpbJ4g8SdGoCdJ5xpO84AuA3Ld8NA/+QjWMLnfi1QdA9MH+NAU1DXGZ8XKl6jLxqjb
 Rlco80KwQb132knP0Cd72/Y/me0V2zYj7JjzzaGQnIuojRWR6VOurPLSTNLCXRG/taET
 KAiA==
X-Gm-Message-State: AOJu0YwWxexFWEhOSW7kHcKKkQ1gEgxdSwdhHIAFHNWye6D2HIzPqPnq
 ccP0u+iW9hs1/tWVxiHB6Jzjmv+Ko4K3FfzijBMk777+9R4JaFAU1/zhJWfhpo4=
X-Gm-Gg: ASbGncsk+XtgGtUWBXLcnbFWHeVwOeHLZaR6REJHUZXrnnn7j+HlT1bOT4bDJoUeHXa
 79Vd1epxihbv/tj0Zw82UQWnmJmZPVhamqrwn5TpVu+/Q0W4be+XyfE+HsdROqjl0lElbOUj048
 1qML9Z7cF5cZGA9TopiuHX8TWWW3XV/s3IF6mEHUHDNhFT3onQ/1YbZmw+LkDNVFALwsADSu19U
 JhC1JNBIJGi9T5QZtEdNsHHGs7mrvHmYSuwiKbu4q1RHTYFTybaFuRA+B2wRdcbZAx2wG4dtJFk
 lkg2kUpdtdWt0zf14mDDQDJW400WlBVKQnkj0TpCMfhcj5aJaQw6EbA/B5vo2hY0wSNGhf6T7YZ
 Cb6Ay
X-Google-Smtp-Source: AGHT+IG3PT3SNzrXWBwrbdd7fOhfXn12VvwyJT8y9iF6KHoASlVEwulMKJ9igvqDsQ+fCm73ctx7Cg==
X-Received: by 2002:a17:90b:3e85:b0:306:b6ae:4d7a with SMTP id
 98e67ed59e1d1-3087bccb2c1mr6073478a91.3.1745235416066; 
 Mon, 21 Apr 2025 04:36:56 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3087df4dfc5sm6336689a91.32.2025.04.21.04.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 04:36:55 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v2 2/3] drm/panel-edp: Add support for BOE NE140WUM-N6S panel
Date: Mon, 21 Apr 2025 19:36:36 +0800
Message-Id: <20250421113637.27886-3-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
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

BOE NE140WUM-N6S EDID:
edid-decode (hex):

00 ff ff ff ff ff ff 00 09 e5 73 0d 00 00 00 00
32 22 01 04 a5 1e 13 78 07 13 45 a6 54 4d a0 27
0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 03 3e 80 a0 70 b0 48 40 30 20
36 00 2e bc 10 00 00 1a 00 00 00 fd 00 1e 78 99
99 20 01 0a 20 20 20 20 20 20 00 00 00 fc 00 4e
45 31 34 30 57 55 4d 2d 4e 36 53 0a 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 45

70 20 79 02 00 22 00 14 33 d8 04 85 7f 07 9f 00
2f 00 1f 00 af 04 47 00 02 00 05 00 81 00 13 72
1a 00 00 03 01 1e 78 00 00 5a 4a 5a 4a 78 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 ad 90

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 958d260cda8a..92844ab4cb9c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1757,6 +1757,13 @@ static const struct panel_delay delay_200_500_e80_d50 = {
 	.disable = 50,
 };
 
+static const struct panel_delay delay_200_500_e80_p2e80 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 80,
+	.prepare_to_enable = 80,
+};
+
 static const struct panel_delay delay_80_500_e50 = {
 	.hpd_absent = 80,
 	.unprepare = 500,
@@ -1916,6 +1923,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09c3, &delay_200_500_e50, "NT116WHM-N21,836X2"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116WHM-N47"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80_p2e80, "NE140WUM-N6S"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x096e, &delay_200_500_e50_po2e200, "NV116WHM-T07 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0979, &delay_200_500_e50, "NV116WHM-N49 V8.0"),
-- 
2.17.1

