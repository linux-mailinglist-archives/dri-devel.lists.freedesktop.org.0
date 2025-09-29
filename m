Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5130BA98B5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335F210E43F;
	Mon, 29 Sep 2025 14:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZSSNbFHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B45E10E433
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:25:30 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-57d5ccd73dfso4884353e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 07:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759155928; x=1759760728; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmXPjuryXSqRr8DS4zExlYZnJGP8SsHdroCjEncRXpI=;
 b=ZSSNbFHD/ESHrBC2sp4aEN9zMTXgi4ZAZt2ePXcfoczoxieRLvBRv6BbN5s2a850lC
 O3Kj9EJmwSnc6aIoeWlqbAJ8pVzLCTgn6VmxK8c8TfSvPrasv9pEXlUJOumUMXJax1j/
 9TEGnxKFhmPekQztJi2KRr1ir6XnNQcg1o9ct8tLIkbldWJEaFyr1scrkOTXw1qM5Zwx
 lRm/CjxAG5F0gPjKo41gMRk3s+vtjmcCdRYUsq1xB8ofFWqjG0OLoT6BeOWrAjsnR4oU
 T87bdlwljcgZVcLw1tIW5A+XZM4sbjfyksUZW/g5Lf8Cab0wFSXs2napTk0EpAhCXmIF
 V55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759155928; x=1759760728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmXPjuryXSqRr8DS4zExlYZnJGP8SsHdroCjEncRXpI=;
 b=wOc+wFosBOHIjB6gw7C041CW/eHWUWSrrSaZuxoXSBASyyHPVfb2WtxGx8q4ZNjotB
 RoeuZ2aMjZ+WAclU3BH2DSSiCIM3S/p+tUG8JsoUCNljlBrzd2YfU/OyA2EjTDEc4kIr
 DtMGUI04R+ld5B1QqmcMMcBz3Gtfs3Hjzoyj7PmU4+p0hVVxQnAsVYQEBVoZ5KZArOkJ
 nIJtpT5v1OtKXDq7ysrwNWuhLG0v9mhNLYB4sRjnpGCwlBNBm9k8swXg3qwOpOO49rNC
 Fr4a7Scgaow5qu52CDeFpId8jzRmEk352HCS37GCr567X2TBu3cWhiC/ksj7P2D1ZmvM
 S2uw==
X-Gm-Message-State: AOJu0YxvHk99urLq7XtG/1b136XBKkBms/dOSGBunt3ffYUwL8JwQ2N2
 7TdJk9NwEYSEXgTgYfBqnxo7tzN10AVNOEY5LOiN5mgjrTboKK5feR+F
X-Gm-Gg: ASbGnctcBaer15WtYKlB3nHCTYrRJb2ldiG3RhQUnP0qZipS8UJBNflCajvMaQMRaL4
 YKxz9DJMfod5zXazY92GDsnEDKsM5GuB30nY9J90eUKPNsmycMbC+SEBzwKo3wS/eOMK+df5cEF
 6W+SJFIG+59hhaxkeA2X83QYIYmEmSZtFY22FVijd/wVsk9mSeGhBlnYlADHAJQjbOXpAbuL5bW
 jkPCLQRXcdSs6NoIKhdTijtAMcRNDQcupzSrf53Y0KUDguQgnTQFLB9s/w2DQpFq3+7a8klh+Vg
 G+ZqBXW7Y9eQvLLdO06FdgDfs+3Ei8MUoFSsND0P25pJUiFu7DJS0wSaJs8TzhluRlYNF1qN9dY
 G2arBTyQitr/a5yfH7GzQYX/cZJR6rjU2ka4=
X-Google-Smtp-Source: AGHT+IHcGLKbQ/s13YElRimx5FsWcbtSM3Vf0+G5+6fyUYRzlFXaqPvOerq0bMbZhupJyyuu2WrS+g==
X-Received: by 2002:a05:6512:1189:b0:55f:6b4d:85d8 with SMTP id
 2adb3069b0e04-582d2b4cbfdmr4907344e87.28.1759155928244; 
 Mon, 29 Sep 2025 07:25:28 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 07:25:27 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 8/8] gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry
Date: Mon, 29 Sep 2025 17:24:54 +0300
Message-ID: <20250929142455.24883-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250929142455.24883-1-clamor95@gmail.com>
References: <20250929142455.24883-1-clamor95@gmail.com>
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

Add an eDP panel entry for AUO B116XAN02.0 used in Lenovo IdeaPad Yoga 11
with Tegra 3 SoC.

The raw edid of the panel is:

00 ff ff ff ff ff ff 00 06 af 5c 20 00 00 00 00
00 16 01 04 90 1a 0e 78 02 99 85 95 55 56 92 28
22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 12 1b 56 5a 50 00 19 30 30 20
46 00 00 90 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 31 36 58 41 4e 30 32 2e 30 20 0a 00 f1

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 90e8c154a978..f01c11f7b59a 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1865,6 +1865,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x203d, &delay_200_500_e50, "B140HTN02.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x205c, &delay_200_500_e50, "B116XAN02.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x208d, &delay_200_500_e50, "B140HTN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116XAN06.1"),
-- 
2.48.1

