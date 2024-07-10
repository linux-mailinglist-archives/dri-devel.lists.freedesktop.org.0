Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D7392D8B0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 21:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A19810E2B9;
	Wed, 10 Jul 2024 19:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HELji9D7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C18D10E2B9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 19:02:42 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-781f5007950so55275a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720638161; x=1721242961;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vJeijJfEPOXYsmpptZE2kjhEsCyE10v7ErxULEeU9Eg=;
 b=HELji9D70N2SeGHVeNpk0Z1Hif7OIpfanAHzzwFChMeFgOw5/sLH9kL7M0rzNRLnzK
 s9LrOxgNG3lW4RdLwl5EZmqydOkXKLMZfZ8jcMR+1RkejHyQCH6Ek13QeeQfbmVcfCVj
 EMc8hR9U/kIVhhGzceAl9lG8yyylmwlQAwDrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720638161; x=1721242961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vJeijJfEPOXYsmpptZE2kjhEsCyE10v7ErxULEeU9Eg=;
 b=aemo/QJtuF+6TQ2TEKwmSNgcPIpz3Nmd1Fgo+6pWaMe49D5aTjpUiXQnm38EaGCZQV
 0FPWSc3mUFBq0ojgVIp+gbBWoF91X5KS1gt291TKSr9HfC3u9dkpC0iu88TH2O1eBVtz
 z20OMS6DP4I/5wB+tOD8f2n0WBkHU9jawkBLD/hMZqLhHANlg5SOxcRotNMwOsW4Cy8t
 UsDzA87Yt/RIi7xLoUgtVeDpSZNG35qgbYQcO3pbkv0qALxeqVYCycGt/GVwHJMHyXsu
 v8fmoT0p0AP/DfGqdxI73hhOQw8CdFeAmdWGsVeNX4UDhSOp2iMlINGJrXnzi/G8AgQN
 nung==
X-Gm-Message-State: AOJu0YyTNvSRxglXvCn1OO4WswM9hp3k9iRySTM688c5wOlrBf5MG5B6
 sNuI8I5r5pn0sirBq73sbR0MyZzih8TYRsIpsEZsEMuePOmqR0LxAbvG4GEkrNCIoV6nLd7jykk
 =
X-Google-Smtp-Source: AGHT+IEgVRmEn2piggzG+hwvFk1I2yMgFuficmdy/JT00IcXmj5hSQr3zkuMnizZlMJCY4YCQpZxxw==
X-Received: by 2002:a05:6a20:7fa9:b0:1c0:f1c9:6846 with SMTP id
 adf61e73a8af0-1c2984c8526mr7639552637.42.1720638161127; 
 Wed, 10 Jul 2024 12:02:41 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:b77:3eaa:6a48:5e05])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-77d603fa567sm3270940a12.35.2024.07.10.12.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 12:02:40 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel-edp: Add BOE NV140WUM-N41
Date: Wed, 10 Jul 2024 12:02:19 -0700
Message-ID: <20240710190235.1095156-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
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

The raw edid of the panel is:
00 ff ff ff ff ff ff 00 09 e5 e8 0a 00 00 00 00
2a 1f 01 04 a5 1e 13 78 03 fb f5 96 5d 5a 91 29
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 9c 3e 80 c8 70 b0 3c 40 30 20
36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4c
4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 34 30 57 55 4d 2d 4e 34 31 0a 00 26

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 3a574a9b46e7..f85a6404ba58 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1895,6 +1895,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a3e, &delay_200_500_e80, "NV116WHM-N49"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
-- 
2.45.2.803.g4e1b14247a-goog

