Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A99AA06EC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 11:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9563510E400;
	Tue, 29 Apr 2025 09:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="cjloMFxO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCA210E3FE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:20:46 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-73b71a9a991so827113b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1745918446; x=1746523246; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=26BMu2J7+YmLinZWtd6WALTAuUBvQeb+c2nCPLBeOsM=;
 b=cjloMFxO3BKveuA9hdF/vg3HpPaYf7gG/0I4XKOMTbVRWigGjW04E3MCHDqNuJFz9I
 l9oM5afIz9vrHm4+jMvjeHzLRYJMo65cd6HxrVsNpSfficIossxXa1zTP28nZCeLdP5K
 nMreD6vJlRHA4UFOeu4vnth2xx+lkHmBxdifUwjElD+lwHe3fzQwmkyvYKNiGr+ztiRr
 za1hx9Vm/FF1+gvzX5lfnpZiMB//uxBTsY74hM+Z6LWGJV98ttyctYJifKuPQSVBqsMT
 Z+vW3NnMbbwW4puyDa8o3/+CITk9AidqLf/+k/tT9i6xBmh6skJnQa47UNHeeHgyh36l
 INrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745918446; x=1746523246;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=26BMu2J7+YmLinZWtd6WALTAuUBvQeb+c2nCPLBeOsM=;
 b=L8cxnNffyVcnqYC/JuG6/P3/FtV4YB+cmyoAGRutdc1ies360y/543N5dMGqFzpH/a
 jUWUaUS+sWo/6VwODFvNi0CALsKyW1LmYteJ7Y5sel0dgzHNYqKdvsFGZgTy3kWxSbmG
 y54904wuGq0V96HWdgLSdKggOu3AoODPmoEST/vnCOkviBX2cWhrxmX0KEPYU1EnwmkF
 v97ZHRLZpoGUzaejezz95arsYRK88m8UkmKPnyRhKmKkVUrKbT2xzpLg+rESNE25SLxG
 TVqbAUhqMm5BEVpHLWqmb0L2MF1bViSlqUDruYYqzneOVcQi0VzYKjYgerJUXOBuJAhx
 L4EA==
X-Gm-Message-State: AOJu0YyfZJCMx/VyFfJjK9akr6Wds10GROrdzk+ALSjZZfmAEWqK3bRz
 /RarfNczDVIGW2LJVWm29mkpzjkTWwgIcv3m74w5XuBBLVinCJTCqcCJyctygbM=
X-Gm-Gg: ASbGncvjhaUBDg3vwxzutHxTLp73bJEaeE7DDAIsoG/N0/gRlI5Kc+3vezU/U5nTyLM
 rIXmjcwzafKFewTj/DVtqlQDmwfZk2BIocIV/c0oIfYcroFcbpYsi4kwE4l2koIWVUm5Q12NDR0
 sS5JIINQGp+MIx0Vie6UJB5j6vOVIfWilQNQiTsyl8zsPG+fqF+Ikjqsb1TCSYh0MY0sxa5/9/7
 oNUWcscJGSSEnXzXdWYNZE1/1EMDlE7TT0BgG3cj3cdTX+xjf7AbuvdF/qQeY9rtmHOW89UvfA0
 S5tYzEFeQkEZaNZmLHxWVAgc5IUMAEA1/UsbX+mZ4skEeCiN5Aqzi1BvRWc3ZxSMwULzN20U5C4
 0H59y
X-Google-Smtp-Source: AGHT+IECOeeos8hakKjTzrUcW1kd63GA+YGV9Aq9eutfb+q+Jb54LTlUEgtlh8xbmvIdH1qtRi0yCQ==
X-Received: by 2002:aa7:9a89:0:b0:730:8c9d:5842 with SMTP id
 d2e1a72fcca58-7402914f1c0mr915511b3a.5.1745918445711; 
 Tue, 29 Apr 2025 02:20:45 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a9d44esm9722786b3a.148.2025.04.29.02.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 02:20:44 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v3 3/3] drm/panel-edp: Add support for CSW MNE007QS3-8 panel
Date: Tue, 29 Apr 2025 17:20:30 +0800
Message-Id: <20250429092030.8025-4-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
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

CSW MNE007QS3-8 EDID:
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 77 57 14 00 00 00 00
34 22 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 cd 7c 80 a0 70 b0 50 40 30 20
26 04 2e bc 10 00 00 1a cd 7c 80 a0 70 b0 50 45
30 20 26 04 2e bc 10 00 00 1a 00 00 00 fd 00 1e
78 9a 9a 20 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4d 4e 45 30 30 37 51 53 33 2d 38 0a 20 01 3f

70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
80 3d 8a 54 cd a4 99 66 62 0f 02 45 54 7c 5d 7c
5d 00 43 12 78 2b 00 0c 27 00 1e 77 00 00 27 00
1e 3b 00 00 2e 00 06 00 43 7c 5d 7c 5d 81 00 20
74 1a 00 00 03 01 1e 78 00 00 5a ff 5a ff 78 00
00 00 00 8d 00 e3 05 04 00 e6 06 01 01 5a 5a ff
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 76 90

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 4bbd11d57b28..ba6eb58ce730 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1763,6 +1763,13 @@ static const struct panel_delay delay_80_500_e50 = {
 	.enable = 50,
 };
 
+static const struct panel_delay delay_80_500_e80_p2e200 = {
+	.hpd_absent = 80,
+	.unprepare = 500,
+	.enable = 80,
+	.prepare_to_enable = 200,
+};
+
 static const struct panel_delay delay_100_500_e200 = {
 	.hpd_absent = 100,
 	.unprepare = 500,
@@ -1975,6 +1982,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50, "MNB601LS1-3"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE007QS3-7"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
 
 	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po2e335, "LP079QX1-SP0V"),
 
-- 
2.17.1

