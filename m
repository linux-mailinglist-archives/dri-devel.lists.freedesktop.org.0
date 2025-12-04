Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B9ECA2740
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F411610E842;
	Thu,  4 Dec 2025 06:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HFxRC07h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0395D10E83B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:06:59 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6408f9cb1dcso765599a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764828417; x=1765433217; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RzQwYBywu5dQ+NXbmQKbTsDDp6aCCRs8Xn3HiCAnbrQ=;
 b=HFxRC07hG62uW5B+fCKamD58pkcW43rz/zfpSfUXtpAOvGN18lpAFL9aw/RCbAPdVH
 fPAjp7cH6aFVgTFO/e/8SQqFztTh7GeO/9NUXjrj+tWfucuHRLXbXtnrEeRHYMU6+rJ9
 4AqlRHK0SHlsL5y2w6atAk+lxfOL8QG/ClFmo0SBhLoDUUW/M361oLugIg3To5TdyKRI
 apv2sRQy4RyuACXPaVzloM/9lku4x8u2alrw9qF+mI+xTCXVOBIGmgMrmxAJ54ZkR672
 UGtV2EnVbvXUIA0oVQ3t20efrPEcC45IrVecRWL66aizmPr1bdkYMgyvo3TCYXTtN7O/
 oYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764828417; x=1765433217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RzQwYBywu5dQ+NXbmQKbTsDDp6aCCRs8Xn3HiCAnbrQ=;
 b=q4W1UuLu+q12chMyTCixIRZxOgQWIaS2bVNSOZ5hyxALtjqHM2kdCb71RCtAT4m3T6
 XDX5z2/ova1zTaG/+SOZIMhdywc8SfZgWlN4gLUJH5YVzcR0hPBuVl4bDvo7rA+94C//
 N9mzH1GhhmFsFy3gbql0h8H5RYMM7e21ZuP730ofNnqBWwwWQKB//AX+idgu+j1CXGlk
 wNuJwToQP6ct0ZDr/rHxTLu/LLt28E5aNabz7b8hrCyaoo80dqgLTnVN74DdS7Q8a59Q
 03QrfG7NKiNETOWiZBPjp5VoHoypV6ZWJDpO5tP3yznllozGSmyhKd/GJauNG/n9qNVb
 xR2Q==
X-Gm-Message-State: AOJu0YyBTy6maFbM23qF6fhr/utK3RIwqbRp1a4RVnDYovqz491O7NyW
 CjV9wuMxORp+5emAc264EMu/1LKgsQXhSOENsdg3Bh0r2GRrS2VZXluB
X-Gm-Gg: ASbGncuwgIt1g1meYR2kfzKBiUvlO61cpeTSNxKjWoLUXaRr/5CIeFfxkZSS/D/9CDu
 UwqNHO9ETtZ6+OJtbuuwownCkdZYxAESn/9NhvXwSNgUrfX03vCjC6n+gllNnmIl014+5R4pOuu
 Bp17DH172pNtP3lxLsle90J5GssJgtZGLHhrgKWVYOTROt+MaUCasJBV5DTn27cmoCswM+hiusO
 sQPMoK8LeCQ+ZBvTv0lZ6py7QYwi6r2wu8aj6lXnVatvgeQ81nYxxcTFIJAVRFsNOQxFIn842w5
 AuDCdU3s3IBjZ6InWHq0Xn0l19DR+YGBRTkdvl6Uw/veZUYsAnlwmTe8hIRhln0257TFIU9me7J
 0iWRHX5GddTeafqX+yqcVmMFPJnX1mHdYPKuCh9Exaqzb+zXmcY+sGUNXn/mW12wnOOA67Sghy/
 jC8qYTFBHGtQ==
X-Google-Smtp-Source: AGHT+IFtMcIib2KK0rM9it1qxR9Y9tOOlZNiy0Ui6unryK95uOARlpcCnZM+R1FaHUMpUZkUjRTLoQ==
X-Received: by 2002:a17:906:6a07:b0:b70:ac7a:2a93 with SMTP id
 a640c23a62f3a-b79ec6b93d3mr176869766b.43.1764828417241; 
 Wed, 03 Dec 2025 22:06:57 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:06:56 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 5/7 RESEND] gpu/drm: panel: simple-panel: add Samsung
 LTL106AL01 LVDS panel support
Date: Thu,  4 Dec 2025 08:06:21 +0200
Message-ID: <20251204060627.4727-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204060627.4727-1-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
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

Samsung LTL106AL01 is a 10.6" FWXGA (1366x768) simple LVDS panel found in
Microsoft Surface RT tablet.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 6369e5828189..bdb53824e3ed 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4223,6 +4223,37 @@ static const struct panel_desc samsung_ltl101al01 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing samsung_ltl106al01_timing = {
+	.pixelclock = { 71980000, 71980000, 71980000 },
+	.hactive = { 1366, 1366, 1366 },
+	.hfront_porch = { 56, 56, 56 },
+	.hback_porch = { 106, 106, 106 },
+	.hsync_len = { 14, 14, 14 },
+	.vactive = { 768, 768, 768 },
+	.vfront_porch = { 3, 3, 3 },
+	.vback_porch = { 6, 6, 6 },
+	.vsync_len = { 1, 1, 1 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
+};
+
+static const struct panel_desc samsung_ltl106al01 = {
+	.timings = &samsung_ltl106al01_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 235,
+		.height = 132,
+	},
+	.delay = {
+		.prepare = 5,
+		.enable = 10,
+		.disable = 10,
+		.unprepare = 5,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode samsung_ltn101nt05_mode = {
 	.clock = 54030,
 	.hdisplay = 1024,
@@ -5390,6 +5421,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "samsung,ltl101al01",
 		.data = &samsung_ltl101al01,
+	}, {
+		.compatible = "samsung,ltl106al01",
+		.data = &samsung_ltl106al01,
 	}, {
 		.compatible = "samsung,ltn101nt05",
 		.data = &samsung_ltn101nt05,
-- 
2.48.1

