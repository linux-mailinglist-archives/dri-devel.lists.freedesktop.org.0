Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE8C995063
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DE210E53D;
	Tue,  8 Oct 2024 13:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pl1+OrRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6167910E47F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 07:30:23 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42e82f7f36aso46329655e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 00:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728372621; x=1728977421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9O2hcJ+rHJih/O+xNq3vq97J5JEk0dHbNznv4YWdRVk=;
 b=Pl1+OrRXxIeqaiYZRy+y6r9Owdmozdkbmx8+sm1Bx/N+LuY/++/UfpzZCu0JvWHta7
 QTdTgBm9zhLw4PmwRpXQo3VCuIxBhiGjC9sUzs/xllFPHJT8GpRkWPWdCW+OQbJt8Q6W
 6GeTVJaSJd9B22pl973824//C4kqhpTwEn9Z/J07IZBSsSbHN7469vFTexZLt7dLURKy
 oQL2lG+GacNq2MQhxRLSZH9x4+IKW6e++aBSQKEZwnoGRMSz0SqDpDPy43KUYEXRGUE5
 U5Zap8HFi3MbAbFjAxUU5oDYsMCogPHafMnzJ8VveeaOEmS9m1vFtM4bF3eX6QOdk5zj
 eTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728372621; x=1728977421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9O2hcJ+rHJih/O+xNq3vq97J5JEk0dHbNznv4YWdRVk=;
 b=KK6FQLnx4GgR4PIZqzgLb5cIrLB1DtaUnBi+H+H6/0IGVo+teCmQBnCH1+LYltFDih
 7C+AAyRJIitSA6j4Nh7GToPO7kAm7UPcm1AAsteHb+AVxZhlJHTujtyplIZVp1WdKnLR
 BqtsQwBoUgNitWgzTtj0pEIIKk6ESALBvh6yyWpRsNFphSS4neJabUqg0kDs0dmS6rOo
 iaeje5V6gvLHLE1UE17b14sXR6e2QKKMgC4fcqqRI9j9I7QCTtwAPeOPlAuJdY4G8cS3
 7JlCbVjPYA7Y1DHKRD0rgOX1sW5jdEQ+ygSMuPy6HkqwtsF9x/VyUiR/sEzXb7n2EWOC
 /zTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1avyIc4Ncf1Hl8bH4fhdDyEhx85bmmJyNS5Kx5m2bhm7IpTyW5X3bcV/O96nEma9ZLdsFMyykAVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGPG0jxHGG/8TpUAiq2pL5rgZSSMJipEXl0/L/9Ii+lK4b6wqF
 PeqluJnwnKEEGZCccI48tl1loDNGVWQ4x9IiV9XZvwyFJ5qsLTM=
X-Google-Smtp-Source: AGHT+IEUgoB3rwhhVGEcX/EFy/hB5FmWA+oIeCCWvqbTYzAH4TpTaN8gB1BDFW8NLTGgbuRacONqVw==
X-Received: by 2002:a5d:4305:0:b0:374:bad2:6a5e with SMTP id
 ffacd0b85a97d-37d0e777812mr7620774f8f.28.1728372621002; 
 Tue, 08 Oct 2024 00:30:21 -0700 (PDT)
Received: from localhost.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1695e395sm7402729f8f.89.2024.10.08.00.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 00:30:20 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bryan.Kemp@dell.com,
 tudor.laurentiu.oss@gmail.com, peterdekraker@umito.nl,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 1/1] drm/edp-panel: Add panels used by Dell XPS 13 9345
Date: Tue,  8 Oct 2024 09:30:14 +0200
Message-ID: <20241008073014.16411-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Oct 2024 13:41:08 +0000
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

Introduce low-res IPS and OLED panels for mentioned device.

SHP panel's timings were picked experimentally, without this patch or with
`delay_200_500_e50` panel sometimes fails to boot/stays black on startup.

LGD panel's timings were copied from other LGD panels and tested to be
working.

Particular laptop also comes in high-res IPS variant, which unfortunately
I do not have access to verify.

The raw edid for SHP panel is:

00 ff ff ff ff ff ff 00 4d 10 93 15 00 00 00 00
2c 21 01 04 a5 1d 12 78 07 ee 95 a3 54 4c 99 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 f0 7b 80 90 70 b0 52 45 30 20
36 00 20 b4 10 00 00 18 00 00 00 fd 00 1e 78 9a
9a 20 01 0a 20 20 20 20 20 20 00 00 00 fe 00 4b
4a 46 47 52 80 4c 51 31 33 34 4e 31 00 00 00 00
00 02 41 0c 32 00 01 00 00 0b 41 0a 20 20 01 ef

70 20 79 02 00 20 00 13 8c 52 19 93 15 00 00 00
00 2c 17 07 4c 51 31 33 34 4e 31 21 00 1d 40 0b
08 07 80 07 b0 04 88 3d 8a 54 cd a4 99 66 62 0f
02 45 54 d0 5f d0 5f 00 34 12 78 26 00 09 02 00
00 00 00 00 01 00 00 22 00 14 5e d7 04 05 7f 07
8f 00 2f 00 1f 00 af 04 50 00 02 00 05 00 25 01
09 5e d7 04 5e d7 04 1e 78 80 81 00 0b e3 05 80
00 e6 06 01 01 6a 6a 39 00 00 00 00 00 00 ce 90

The raw edid for LGD panel is:

00 ff ff ff ff ff ff 00 30 e4 78 07 00 00 00 00
00 22 01 04 b5 1d 12 78 06 96 65 b0 4f 3c b9 23
0b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ef 83 40 a0 b0 08 34 70 30 20
36 00 20 b4 10 00 00 1a 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 44
48 39 50 57 80 31 33 34 57 54 31 0a 00 00 00 00
00 04 04 03 28 00 01 00 00 2b 01 0a 20 20 01 d4

70 20 79 02 00 20 00 13 3c e6 24 78 07 00 00 00
00 00 18 07 31 33 34 57 54 31 0a 21 00 1d 41 0b
08 07 40 0b 08 07 88 06 6b 4f c3 a3 b9 35 82 0b
02 45 54 40 5e 1a 60 18 10 23 78 26 00 09 04 00
00 00 00 00 41 00 00 22 00 14 55 27 05 85 3f 0b
9f 00 2f 80 1f 00 07 07 33 00 02 00 05 00 25 01
09 55 27 05 55 27 05 3c 3c 00 81 00 0b e3 05 80
00 e6 06 05 01 6d 60 02 00 00 00 00 00 00 31 90

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 767e47a2b0c1..8566e9cf2f82 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1977,11 +1977,13 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0567, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
+	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d200, "134WT1"),
 
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
+	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ134N1"),
 
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
 
-- 
2.45.2

