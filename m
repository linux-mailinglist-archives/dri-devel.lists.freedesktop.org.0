Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E17FA95046
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 13:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6483010E382;
	Mon, 21 Apr 2025 11:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Uh7btsQh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A44B10E382
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 11:37:00 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-af51b57ea41so419209a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 04:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1745235419; x=1745840219; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cgtjjjKCRxClYti6rXY+0AHa3f1l7CcQ+jhoO9zTJxE=;
 b=Uh7btsQhdEMbO1gRCgieOI+WDiXBhqP7LQDCpU3WOERC5HXFY0qkq7KXhawfHoW3iL
 j20wdh6ohCv+LR1deCSZhcPwzbeQp1IRU6QtW+gVz47TIxDlHLgXc2AcdAT/ZaWXaEFg
 Lw/qf0TD4+BsaSnTT+NQsENsMMtDAiDvEXcitOxqMdqNga1ZoOPrgGi3aANhST8iS0Mf
 d28tjME31TIGrsiDf9WHmosqv5WJ+PxXo94KJ1ZdZkOUag8kx2YMvMl8jkvEuhO3mrIv
 dm2aGIZNcmRfY/0hTMr4a41Uh2BPMNVoEgoilwGeoTlkhD4XwTOHogVd22/F5SlKz3UL
 0KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745235419; x=1745840219;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cgtjjjKCRxClYti6rXY+0AHa3f1l7CcQ+jhoO9zTJxE=;
 b=pQEVSX39UPo55VaA+/ZqkdWpM8iSa35Kfpd33UI49rlczMOkSfbRclTKYCImze/H+d
 35QMQmbjZsKzc9FEGrI5PojzARMIvxI9O6E6M4DqN66nNnYUCZtcRhkqnkOwi7jryKdL
 k0ZoAzM7x31QxxdW/GJPLFzQEo9NI7b/k+INfS4edPGKyU+2Nm90zu317/SmRA095FeM
 Sg36LUPNKoEkUovjrN6i07dydIkxsp4raxWWw4+iplfJTlmyRokEiZ+ZhC7AT3cs7cwn
 TgOoRfracJDzB51+UPWrcWER/nrlpDdbHj7KOGQMhm4Rr1y4oPXDiCO5EyRXLR2ed5KI
 aZZw==
X-Gm-Message-State: AOJu0YyP5K/FSVwK4EXZcetb4yg4nYMoZFMRzhBtbFvfD/nSD04hcGuy
 IprYW8rvulUVgzxJAggUvf6FPGHnilEmnHMMBs0adW75n3eV4ezHSBa82W+Ucoo=
X-Gm-Gg: ASbGncuYxn+a61fWMR5sBAsLPEtn7GGOByQYKrLmRozDGSjc+rnVS2/jsCn2xDcV0no
 GmHHSoJpzPluO6HDLuMNA8hvLOabkrd5U8Hyjjm+gxqJt2AXQ696+PTHRbBrVh3KWwfg0G4fNfB
 8BYpL26L1mgVdC0tLIc3piKigYdoxC4/MKn5TSMsy2wNkNguOphg5s90tuERJjKO30/W1c/1FD+
 c1pYVv2uFive+CXzrouG6h+Yozx1JMY6BM8De8U6k0Sj8s0tpRF6A3zBrpWFtrjvXlOP0oSsxMR
 1UnrL+80bRgpjGDpsc1i2yimUHVFgmKwno/8tH9Ne1HkU6DKYufVc//ok/6oXC42z0YQ7Rvoi8z
 t2jU3
X-Google-Smtp-Source: AGHT+IEL9RdM/lWdE8mAC+ymrQ8GL+mcn2szB9uvQOzq+OMmZ1jIMiAzJba//eD3KsmEjFBwsseVdg==
X-Received: by 2002:a17:90b:3b85:b0:2ff:7b67:2358 with SMTP id
 98e67ed59e1d1-3087bb418b2mr6289249a91.2.1745235419418; 
 Mon, 21 Apr 2025 04:36:59 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3087df4dfc5sm6336689a91.32.2025.04.21.04.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 04:36:59 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v2 3/3] drm/panel-edp: Add support for CSW MNE007QS3-8 panel
Date: Mon, 21 Apr 2025 19:36:37 +0800
Message-Id: <20250421113637.27886-4-xiazhengqiao@huaqin.corp-partner.google.com>
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
---
 drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 92844ab4cb9c..71cbee86fe81 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1770,6 +1770,13 @@ static const struct panel_delay delay_80_500_e50 = {
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
@@ -1982,6 +1989,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50, "MNB601LS1-3"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE007QS3-7"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
 
 	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po2e335, "LP079QX1-SP0V"),
 
-- 
2.17.1

