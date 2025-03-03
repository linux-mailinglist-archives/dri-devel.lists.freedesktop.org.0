Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC5EA4BFC6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57F110E257;
	Mon,  3 Mar 2025 12:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D8ASP58I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8311D10E24A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:05:16 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-54298ec925bso6594291e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 04:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741003515; x=1741608315; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6QAnF6RQJWxSSGLUa+yOoR8YIWrn+p1dbQGhI+0L21k=;
 b=D8ASP58IKktkhp65Zu+wcg1QWP3WMAQb//hJFqGFNPjLeoYNXQngM8I3eaZLyudFC6
 YQtnqfdgAGejWTev1JMFNU+nhWnPxc27gdv7WJAb8DYd7tlqBnfZ5UDHLeSDuFtWr+oL
 HaqIKj+2UmARCmta1akViYJj7tG6egxbKmTX8TQUPfjf5GolU+9estRKEs/SQ1COma70
 Y5qdrhDTVJynynXDcRnxET8IZy5UjEMvbDLf06Ob7aS/PwoYahAPmd5Ak1rUsYfOIoRX
 JwCjHQcIhfCQi/HwYg8LNhfQ+Utz9sOqZLvKJYnHbD14dVU6s/TZVqOcKM30Z7W+5oye
 RIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741003515; x=1741608315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6QAnF6RQJWxSSGLUa+yOoR8YIWrn+p1dbQGhI+0L21k=;
 b=Q23PZVruMs2lngwyRPsYFaFvkIwbbnicM46I+YQZ6iNaGnXE4IO/ApLzv5DYgP4mAV
 +wme8K2c10i9i8mYltol83Ck2Nyvn/5cKDDGfq5k32PCTLyF8PYcLg6pbloVfcuXJh/D
 ifhCJlVDIu4LBie/MnV64iN2ZAxxmSkSqjS3uahKr3ObaLuPlnLv0Nyj7KilAGpz/47f
 6qt6lH7u3r+hY2OQauNFMUsoOZ5Qe/Jk1Zzea1Nl/2uSk0XS2eIYQ2m/EW+26Y9XFnDk
 /S6IuIhuIv9ptBL7UAbjJ0D7yDOK5Jm6I9SdYf40L528Uf3ZZSaopkz+fXIpo9YMhoRP
 DYuw==
X-Gm-Message-State: AOJu0YxR4jQUuASi/56ct51ta+pc8iHobxkV4e24cG8Cs3zQWh+GyOay
 8UR2gqQ29ISP2k0p+Ak4crA+ExkAgFJZI67frbIGcqEkx/y9HC7w
X-Gm-Gg: ASbGncsFqP9b7NE778MlUqw8UH10KcGTenx4aTVaLHUsMQwG4ererytH91R+pjzcurn
 tu5A0Lk0dZwGmUdA5g5g/sbJp/0yDoSxeEnlTW7Vp87zTUGHmaoZbqSv/1vgBfVqGnEJ1F4tvBm
 6M/C3I7Yhpyemnyt+gnHyKin4F4tlEKIGpSyiel7LNBJ5XARsU1Bj2WYBCKlKFl5lAvejtc/SsY
 iV5CT9mrrS9VL0QfxQhAWxf08HS+jWqRWnzA5IYHOee6XEH07b72oulmJpCHu3a3YKcyaSCok9z
 7WIYQVb1p2jqZVhKZ1TwI1lAyPJ87i9KPbns
X-Google-Smtp-Source: AGHT+IGPG9b9iOwWJgfgUYhvGwxh6t/u8yLGFycXLMXLu8hbCQSS/cBxDVOzJPoM9NjK5sJrWRu1MQ==
X-Received: by 2002:a05:6512:281c:b0:545:986:1a0e with SMTP id
 2adb3069b0e04-5494c332d96mr3966260e87.40.1741003514670; 
 Mon, 03 Mar 2025 04:05:14 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549576b88d9sm869095e87.12.2025.03.03.04.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 04:05:14 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] drm/bridge: simple-bridge: Add support for MStar
 TSUMU88ADT3-LF-1
Date: Mon,  3 Mar 2025 14:04:55 +0200
Message-ID: <20250303120455.90156-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303120455.90156-1-clamor95@gmail.com>
References: <20250303120455.90156-1-clamor95@gmail.com>
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

From: Maxim Schwalm <maxim.schwalm@gmail.com>

A simple HDMI bridge used in ASUS Transformer AiO P1801-T.

Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index ab0b0e36e97a..948300378cb0 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -260,6 +260,11 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &default_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "mstar,tsumu88adt3-lf-1",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "ti,opa362",
 		.data = &(const struct simple_bridge_info) {
-- 
2.43.0

