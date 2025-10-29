Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2E2C18BBC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A1010E70F;
	Wed, 29 Oct 2025 07:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XPZepOt5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722EB10E70F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:41:40 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-26a0a694ea8so49541585ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 00:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761723700; x=1762328500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qgvDUTgmwUbybBiqh6wci1MBiFa+WkYYBAxgF2SWiwA=;
 b=XPZepOt5goqUdQ8DXFukwjpcMf8PQ6YFQANXFoMeiKa3egRBXMKW3htle564B8mvdk
 iqcJ0cYM4l7xHPRITCYpXCh3QwdUxMWpVTTbixM1OK7WRlZBD9LXJoO3A4p0rN3TRxf4
 hrLjDgL7Q1XZvphVVps0y+YSexcp2lrBMLPU+BmutqBKyPAA5DG94PqcOV+Kf6nPP0od
 i97BiYrhr0bWNEj4VHOPVGy8pdfNqJbiPECX0eT73E04wCJebO3nrerMjBuGLVwCtamq
 QDH416qJmq7s0DNf2qPx8T5k6nlcplrajno8MZPJ4mteb9Ifuse4qO5kW67WX+l/yvhJ
 H/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761723700; x=1762328500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qgvDUTgmwUbybBiqh6wci1MBiFa+WkYYBAxgF2SWiwA=;
 b=wZw4TVbuc3IRgwMgyO79vwhmj+kNoc+vWtcXOWeT11dIZOpKfHzxz73L5hDaxRgwqN
 Cz6iKo9uxhw4xPl01w5AEkmU6y2nSVEA7pk2CJLIHSvJ/uc9KU0bzzco4+I44NB8AHmQ
 twRzB9PBlUdsZBpqdMc4wDPJWvvWMLyMfFq/KzkuXNivG9eTRaLpKDR6nrPsHQ/b88ey
 2Q4AwsxSGlEIXP8mhnL9Vm+FKMtCo/NOFi/X/2z6hNq21/openzHeKuUQgzmIqXrfR53
 N9hErzX/Ilvwtr0trjXBLUs0Y2I2ZnhEV8ykqF64HQgARGrtzGYYV3wikvVE+j6jBbDT
 fl0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0ZPBneDryVZIc2ms9eHRqyOzzt1KHltQUbqQzG8rIypTfQTaKHXiAlVTZLoewb0Jjeo/TBWoyaPs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yypgq8UsQdV6sVbSoRSfJpvkvDSvjbFcSR3PGDRfGHjBR0cCXKI
 X21qnSloPJBoFPEdc78re4NdTw3/7gHnA6HHiBMailwwrYfrXU5D915S
X-Gm-Gg: ASbGnct77mIAluVJUttqWff5x2BpFoCHcmRg40P8jOJO1C3SEI1JzYcjneiVmIAvohs
 fSpe3vOcphId+KpQR4Us31lVido7a5oL/gGuGG+fI+RCv6KmW5I75qxF16vyJBT8mBR5eUZ21+p
 Sxpsxq1S3h9QfVOwxex9LGM+zefYN4qVPqETnSHqpnGfU3YjSo1pMdL3OlFVM4XGEXzoPzH+CR/
 9nmYBRm5qjBpA5giFhPRCETt1gQskpa2RhwtN5f0w/4S80hV0QuV2qtvalHLoi/IzaIiRbe2QpP
 5EZr3Sws9+hmh5UoEyx+EHFDxd0x9x3d4IkUjdwgdt5LxptvO63SQgXlcdtL7OwyFwrlUyZz3m6
 Nqi0mL/dDphbtUJtSj3ZmkXWZGp63QFCa+xd0ACTX7CrweXa2jB6yZhNU1o5FZhE7Pb/227CPoN
 Pl8kRaggNZFZ3lAJzBnAS9xg==
X-Google-Smtp-Source: AGHT+IEAqSeL49I0O53+T8EYYG0n4Be/S9PQxC/LftWWFjftQd/hhQp8QU08hja4QrlQTuil7K/59Q==
X-Received: by 2002:a17:903:234c:b0:246:4077:4563 with SMTP id
 d9443c01a7336-294def2da22mr23417225ad.34.1761723699803; 
 Wed, 29 Oct 2025 00:41:39 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-33fed706449sm14495814a91.2.2025.10.29.00.41.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 00:41:39 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Kaustabh Chakraborty <kauschluss@disroot.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/bridge: samsung-dsim: Fix device node reference leak in
 samsung_dsim_parse_dt
Date: Wed, 29 Oct 2025 15:41:20 +0800
Message-Id: <20251029074121.15260-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

The function samsung_dsim_parse_dt() calls of_graph_get_endpoint_by_regs()
to get the endpoint device node, but fails to call of_node_put() to release
the reference when the function returns. This results in a device node
reference leak.

Fix this by adding the missing of_node_put() call before returning from
the function.

Found via static analysis and code review.

Fixes: 77169a11d4e9 ("drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index eabc4c32f6ab..1a5acd5077ad 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -2086,6 +2086,7 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 		if (lane_polarities[1])
 			dsi->swap_dn_dp_data = true;
 	}
+	of_node_put(endpoint);
 
 	return 0;
 }
-- 
2.39.5 (Apple Git-154)

