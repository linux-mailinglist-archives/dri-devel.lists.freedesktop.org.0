Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B594EB57AEA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BFF10E477;
	Mon, 15 Sep 2025 12:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="vkWqyvIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0FC10E45F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:34:47 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7723f0924a3so4995862b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 04:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1757936087; x=1758540887; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4NZhLJFAwarDAFKpIBv/PCVePqs917oamiLOEW2SkUg=;
 b=vkWqyvIkGYZvh1arbHX5GMUAxNOuGPHXCYHk3LWxJ10imCERBu0oKMw6xbAVDKUNW5
 WbOKYGHxeBzxG/OdbeBcW9HL0Zmnl9ZcaQFHAmarHvAi0dunADneUR5Zo0SxBftbfGec
 9plniGn9QLrYib5tv6X0ur59GNLuH2Zv6e75yq3lLtvIu+x83r8275tSGcHAvHk7eA8a
 YQka5rDu+bkx0oRgla5KLcou12rL9HbnWgMzNv9sAQSvelF4UH+M2+FJF/syebYkn2I3
 jN0Yt6i0bJc/OSAooqOXBdkIje4DnY3GbhPwWH/0uSRp8MrIneaVvFnU8Oza+eCrQrWH
 oDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757936087; x=1758540887;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4NZhLJFAwarDAFKpIBv/PCVePqs917oamiLOEW2SkUg=;
 b=GRsAvwdF9LhL6nCkYl29ry3BeaZSVsTfVT3yjnyZHZTs9orkCfDSf1lzmNmTttKM8l
 gxFDDWHlSy4V34k2aht62STJ5++VJp/vkCa5BcbhwpSvQ8CfYmIXkzx+4wtoKkwXhtQF
 onKtV+zw1VVocDzViqzu4E8FgPFSmHhYE1CY/m0C9dOlqgdNvmHRCr8qBfcyF2Hivt8x
 SH4qfe3I65wpJfTqASWU3U2W1X3XsJcrCyQXfjlaxGWpdhV2vv+14+tpsZb4jny6FxZr
 M6HZvI4sw2LZ6jZAPZ19H8Tr4JOiGKqBHEujTH73q9MSiA1o4TDUKLjMRn4TPpi/6Q1Q
 nsrA==
X-Gm-Message-State: AOJu0YwyiHvPSfLkZXr2xnx421ZnZl7sYswG3tQQ6RPaxIUZsUdyUnLh
 0PzQyECTn8r4z+7o1bkvYimk+M+JQZ1BGPzl84j1pYiXGzocG6bt7ew3IWuLug5lc8l5xVeCohx
 5DTGb
X-Gm-Gg: ASbGnctrZd4tE+k5ZlvdDK72o3GFMflB3wLJAiMvFo8DEpnEaWQipavLaVY+jGk6fwz
 s0CgOc0acmxy2z1vdj0gKjTKtWHUT2GUHmSqWyRXXBqLU/lrMVWOhad0iHOWdkTYSiYkoiCoNgL
 ih09PLPy4qqnv7WW7cHy+VyNl4n7c16gixBtICJu58ycFJq1gqZRCiRxScTy4Za012Zk2jIuLvI
 j3s6VXFpHU2YUnkEocRLxces8ALmP0QReH81YG5TA3O9HOoT7vvuOg0uNoI2UZOLq3y9DQDuxWI
 GbDHovQlLQYFYuWXnzZp3dik+4T44BDaMOiEKaG8psLUj0dN++kFMD8Z/8SZd98tNWD85TKbadi
 XULOsbwQTGw1hzbA2tPdO8Dj7Chs1KJs5fET9+obRp2BJ2iuS/Z2Vy6AR+0KZHEjg3QBSuJb/CE
 w/TAU1+wU7UBYkXU5dhlf/HEo0qavvFQJvU1WJIQdT
X-Google-Smtp-Source: AGHT+IEvPgrwUX4kCmCV9Syb0DjxG3MV45KBgsUck7q7xvM7/ZZuNyW0JKx0bHnMy+iU5gOgeVovvQ==
X-Received: by 2002:a05:6a00:234b:b0:772:101f:5e46 with SMTP id
 d2e1a72fcca58-77612095aa7mr12504855b3a.12.1757936086667; 
 Mon, 15 Sep 2025 04:34:46 -0700 (PDT)
Received: from ubuntu.. (202.60.225.077.static.cyberec.com. [202.60.225.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607b3603asm12711839b3a.84.2025.09.15.04.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 04:34:46 -0700 (PDT)
From: Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add several panel configurations for mt8189
 Chromebook
Date: Mon, 15 Sep 2025 19:34:37 +0800
Message-Id: <20250915113437.665345-1-wuzhongtian@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Sep 2025 12:28:22 +0000
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

Add several panel configurations for mt8189 Chromebook. For B140HAK03.3,
the enable timing required 50ms. For NV156FHM-N4S, the enable timing
required 200ms. For N140HCA-EAC, the enable timing required 80ms. For
N156HCA-EAB, the enable timing required 80ms. For MNE001BS1-4, the enable
timing required 80ms. For MNF601BS1-3, the enable timing required 80ms,
the disable timing required 50ms.

B140HAK03.3
edid-decode (hex):

00 ff ff ff ff ff ff 00 06 af a9 b7 00 00 00 00
28 20 01 04 95 1f 11 78 03 f5 65 8f 55 5a 93 2a
1f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 60 3b 80 04 71 38 52 40 10 10
3e 00 35 ae 10 00 00 18 95 27 80 04 71 38 52 40
10 10 3e 00 35 ae 10 00 00 18 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 34 30 48 41 4b 30 33 2e 33 20 0a 00 f1

NV156FHM-N4S
edid-decode (hex):

00 ff ff ff ff ff ff 00 09 e5 f2 0c 00 00 00 00
10 22 01 04 a5 22 13 78 03 00 f5 97 5e 5b 93 29
1f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 99 3b 80 10 71 38 50 40 30 20
36 00 58 c2 10 00 00 1a 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 42
4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 35 36 46 48 4d 2d 4e 34 53 0a 00 dc

N140HCA-EAC
edid-decode (hex):

00 ff ff ff ff ff ff 00 0d ae 8f 14 00 00 00 00
0f 22 01 04 a5 1f 11 78 03 28 65 97 59 54 8e 27
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 b4 3b 80 4a 71 38 34 40 50 3c
68 00 35 ad 10 00 00 18 c2 2f 80 4a 71 38 34 40
50 3c 68 00 35 ad 10 00 00 18 00 00 00 fd 00 28
3c 44 44 10 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4e 31 34 30 48 43 41 2d 45 41 43 0a 20 01 90

02 03 22 00 e3 05 80 00 e6 06 01 01 53 53 4b 72
1a 00 00 03 01 28 3c 00 00 00 00 00 00 3c 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 62

N156HCA-EAB
edid-decode (hex):

00 ff ff ff ff ff ff 00 0d ae 65 15 00 00 00 00
0b 22 01 04 a5 22 13 78 03 28 65 97 59 54 8e 27
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 b4 3b 80 4a 71 38 34 40 50 36
68 00 58 c1 10 00 00 18 c2 2f 80 4a 71 38 34 40
50 36 68 00 58 c1 10 00 00 18 00 00 00 fd 00 28
3c 44 44 10 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4e 31 35 36 48 43 41 2d 45 41 42 0a 20 01 50

02 03 22 00 e3 05 80 00 e6 06 01 01 53 53 42 72
1a 00 00 03 01 28 3c 00 00 00 00 00 00 3c 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 6b

MNE001BS1-4
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 77 4b 14 00 00 00 00
25 22 01 04 a5 1f 11 78 03 2c c5 94 5c 59 95 29
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 9a 36 80 a0 70 38 28 40 30 20
36 00 35 ae 10 00 00 1a 00 00 00 fd 00 28 3c 43
43 0e 01 0a 20 20 20 20 20 20 ae 2b 80 a0 70 38
28 40 30 20 36 00 35 ae 10 00 00 1a 00 00 00 fc
00 4d 4e 45 30 30 31 42 53 31 2d 34 0a 20 01 0e

70 20 79 02 00 81 00 1e 72 1a 00 00 03 01 28 3c
00 00 53 ff 53 ff 3c 00 00 00 00 e3 05 04 00 e6
06 01 01 53 53 ff 2b 00 06 27 00 28 3b 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 b8 90

MNF601BS1-3
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 77 19 15 00 00 00 00
19 22 01 04 a5 22 13 78 03 2c c5 94 5c 59 95 29
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 9a 36 80 a0 70 38 28 40 30 20
36 00 58 c1 10 00 00 1a ae 2b 80 a0 70 38 28 40
30 20 36 00 58 c1 10 00 00 1a 00 00 00 fd 00 28
3c 43 43 0e 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4d 4e 46 36 30 31 42 53 31 2d 33 0a 20 01 d4

70 20 79 02 00 81 00 1e 72 1a 00 00 03 01 28 3c
00 00 53 ff 53 ff 3c 00 00 00 00 e3 05 04 00 e6
06 01 01 53 53 ff 2b 00 06 27 00 28 3b 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 b8 90

Signed-off-by: Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 62435e3cd9f4..15425b224a72 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1909,6 +1909,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8bba, &delay_200_500_e50, "B140UAN08.5"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa199, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa7b3, &delay_200_500_e50, "B140UAN04.4"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xb7a9, &delay_200_500_e50, "B140HAK03.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116XAT04.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc9a8, &delay_200_500_e50, "B140QAN08.H"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xcdba, &delay_200_500_e50, "B140UAX01.2"),
@@ -1974,6 +1975,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf2, &delay_200_500_e200, "NV156FHM-N4S"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e200, "NV140WUM-N64"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d45, &delay_200_500_e80, "NV116WHM-N4B"),
@@ -2006,11 +2008,13 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142e, &delay_200_500_e80_d50, "N140BGA-EA4"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1441, &delay_200_500_e80_d50, "N140JCA-ELK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x144f, &delay_200_500_e80_d50, "N140HGA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x148f, &delay_200_500_e80, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1468, &delay_200_500_e80, "N140HGA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14a8, &delay_200_500_e80, "N140JCA-ELP"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d4, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, "N140BGA-EA4"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1565, &delay_200_500_e80, "N156HCA-EAB"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x162b, &delay_200_500_e80_d50, "N160JCE-ELL"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x7402, &delay_200_500_e200_d50, "N116BCA-EAK"),
 
@@ -2022,10 +2026,12 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50_d100, "MNB601LS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x143f, &delay_200_500_e50, "MNE007QS3-6"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE007QS3-7"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x144b, &delay_200_500_e80, "MNE001BS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1462, &delay_200_500_e50, "MNE007QS5-2"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1468, &delay_200_500_e50, "MNE007QB2-2"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x146e, &delay_80_500_e50_d50, "MNE007QB3-1"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1519, &delay_200_500_e80_d50, "MNF601BS1-3"),
 
 	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po2e335, "LP079QX1-SP0V"),
 
-- 
2.34.1

