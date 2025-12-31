Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810B4CEC1B8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 15:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278B710E9CD;
	Wed, 31 Dec 2025 14:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hnsQtsKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072D010E9CD
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 14:41:49 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id
 a640c23a62f3a-b7636c96b9aso1976800566b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 06:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767192108; x=1767796908; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6n3OW5NUfOZx0lkTNPzw5JAKuD6biTxM7bek7HtmsL4=;
 b=hnsQtsKSE/AjOMD/nKv7c50v1a/DAKxc2giCaCOBKfF3WDkirGm/LYJfI43wxe1IV5
 VAueVvz8EwXu3gvnDazQXZ8U74JulQ+MZyFFNVw8RVoaHJ2X65yEkiP260KmBtY8W+Gv
 0ZgHIVIdAAfK1DfQSrhz+vNS5goa45c6hkm/4tsZSRcjzbj6gflvLZTOy1QVWxJNIKcd
 +vYO5V1WB8X1VQOlDdeHn3FzH7zSjI83h7GJdhx3fmQlRcAMs0xr+FWr065AoBdnqNTI
 Ygu2LL7kRuBEyGDA/NLZaTpm+sh+6kFpwtH3UmzMoF2zFpR/8FKhdYOE+7/AFWtEjg/4
 wV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767192108; x=1767796908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6n3OW5NUfOZx0lkTNPzw5JAKuD6biTxM7bek7HtmsL4=;
 b=anISY2gX/U3WKHRjmXePF8Boler3OnaFiQzAEl6q5Y0962yzAzaMkIn5qC77YlEi3L
 2fF7UN3tx5arJo+mDAlFVzWsCMiH+4fNysmfzzjEDE2LhnubaXdhJfo8IG1ooleEUpZm
 MVsYaeg0XfKRdvBCxmBcM4JBQOQbqRG1P25+hEW+3SVrLyR8Uq4q0kJmo5FxqDh6cEOc
 NUhI9y5s18UT/60mP++pBiFytjPXIZ8uPKy6PzxYLl7vXCwD1I5sMEDaVp8CC9QezCIY
 vMfOzE4jTgJjNKyNPZRMyBkUpJJYqLKxxyTav/+8qKovOtINkHR61P+c8v7UTUU5xk1O
 4a1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+W28AzCdOiyAMO6qVAmCkaRMsmIJcTToj/F9qUlizaFZDyvl77b2C4BKVOTAj9OeWqKlMUeNtPig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSWZvc0Ab7rpf28EtA38E3UwRBSDXoWOqLKpnsqJx8YBHM8mx2
 Jmt5bFj3dMKr8cSMsvU+YXIEWsOgp+FEt8fcSjhMyNju3+sUONgzM8bi
X-Gm-Gg: AY/fxX7b9+UvJ3fa7su4x9J+yD5eTUGQ9b4fseJEy0W22dkcQLvzcS/iLbRX2oUXeba
 G5dtuf2ElzC3/CM+Pa0sdIA7b3+wl619+oHuClPmJSXBl8AxZr52P3ALWY8dHKTrCj8ius7nbdl
 /4hU/ySgMcY8EjMnANCP4ix/nJyImQayVPzcv4c6ATQ3dzDF4j6VhA6ODrf7QrslsbcQsKR0aFh
 GgHqPLipFuVqa+8rmUV7yY9u53HpN8epgD8MYQ7aSMX+H+n5gBIMpEKvPsFEkJkw1+VfAVhRGGg
 XhCqJS0juoUVEvd75WOQ5izgfS3qc0AHL+y6RdDonevoKmQbu80rcbs+F7FQ4vsaZRSGjD6W9Fy
 Ovo1ZUfRObR3oKbF8PVD7Ss1sTO0I4doZn95aWVGKkiIiuKFNQNPS7/2f7ItlrjJOo6gu3Q9vxJ
 1ZNTV8INOkJV/BW54=
X-Google-Smtp-Source: AGHT+IEUPzBdPCEuEHiEfsb+kEeP0YSRVpplBMnvJmaPjfjYKXuuxhE3L0J+JXeCfF8KIokhLTjB0w==
X-Received: by 2002:a17:907:984:b0:b72:3765:eda9 with SMTP id
 a640c23a62f3a-b8037256c76mr3755521366b.60.1767192108066; 
 Wed, 31 Dec 2025 06:41:48 -0800 (PST)
Received: from osama.. ([2a02:908:1b4:dac0:75b2:7ca6:1e15:d2e6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0cc52sm3909242066b.52.2025.12.31.06.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 06:41:47 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>, stable@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/bridge: synopsys: dw-dp: return when attach bridge fail
Date: Wed, 31 Dec 2025 15:41:14 +0100
Message-ID: <20251231144115.65968-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When drm_bridge_attach() fails, the function should return an error
instead of continuing execution.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Cc: stable@vger.kernel.org

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2:
use concise error message
add Fixes and Cc tags
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 82aaf74e1bc0..bc311a596dff 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2063,7 +2063,7 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 
 	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
-		dev_err_probe(dev, ret, "Failed to attach bridge\n");
+		return ERR_PTR(dev_err_probe(dev, ret, "Failed to attach bridge\n"));
 
 	dw_dp_init_hw(dp);
 
-- 
2.43.0

