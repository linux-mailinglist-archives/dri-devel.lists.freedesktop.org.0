Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC5B0483D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 22:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8771410E096;
	Mon, 14 Jul 2025 20:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UqRoB+gw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FC210E096
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 20:07:29 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so4520500b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 13:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752523648; x=1753128448;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DhdO2177EcE4SnYgx1n3JtwOIGI5XgQENyhYsXV5do4=;
 b=UqRoB+gwsGgifl26C+nhw27XMsbDLJWEfHvmeobnOtqQ6BqNxflITS9aVBCF4Sz6tN
 lhdszjTdeFdHabkT3JiyLKHwt4ONql5d/YG+37QBflZ+gOsbvM9/VsZ/YAd1I5IEc1Fj
 tFxtf7O1gj0JzK6UFS21HgL9PD+BjH3XoxDek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752523648; x=1753128448;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DhdO2177EcE4SnYgx1n3JtwOIGI5XgQENyhYsXV5do4=;
 b=iBKZNZFH7tmZeckGnHb8LpBHlQ2iGw+sPxNqblDlo7LC6p9Yv5khzNgI8VS6P2NO57
 7KunV6vSb54te+bNzvScHDcUO83CAsKkNIDs1PlUtHiq+5sUsCKZV/1PtVUBT3voJ/c/
 rIhzYWd9Zp6yYOKmqPab284Kkh3pyyrEFLoV6mOx7ZEQMSUUcfw1QghrZDSKM9eMM/YQ
 PWnmAi8qc3kLrLyOspV1XBhzr/o6lDUGBmvJ01Ek0gipP9/8/YH3e2iJvGPKQFI2tS4d
 a68g5xJTk/iXmUv/HsOXMKDgQg/badww+9JD2iViNQNmi4mk/0fkQ8SUWrfOdXOAQ274
 QVlA==
X-Gm-Message-State: AOJu0Yw48T7y4dMPPOLHmRX5UnYOb+H9jcpTG4CPEkmSisgdzYzIOUPu
 8gNIM5UBDoRiWKSpkCXSDxKIhr1GJpsVPsQnXtjbwtoFJsRw5zJBAIqd27CdGhT1ZMLii08eByP
 Gt/U=
X-Gm-Gg: ASbGncs1ECkDYw43opUVSJCOTdOsRDqymWQRsO0Ks7h/dyDo4HoSRoGHW/h5T+MnWHi
 8a6RZfXc+nTLiBDW4IEne+/zg/yJhaZbHZUeZU85As1drIgWrnn1VcAUD90U+tCTh+rMrwY/UKW
 Hd3PWtUEFXQabSl3+TR1Etp6YRiI44rC0f6mFXUv1zYaS+yKKaIhs0ZoA4xDgjbFkzCVKIksWls
 GovLSVgSDS7ruXnhnV2/YmL1ust7pX5cXiqb0+ZeCx+vwsc4uS5UuiDPOHwCm3ckl19H927cZAy
 x5vRtFELM+xzpv7wLANOS2wiIED+xJOkmmxGff3/9rew23wRKjatXTbvDLhTDFs6e3woFnf9g7o
 VcBY7yXcE7DjrCp73km4WlkRklWnVlNweCFO00/YqvQv0U1PpsQhfE9JFYaFIHP3uwacyF2xP48
 mFUwwyZg==
X-Google-Smtp-Source: AGHT+IH/sBAf7ZMF0haSNivYQxKsv1D44OPDHqeimprF/0WoqKmowK55eKE6ZIb1ExZDD+1b6JkFZg==
X-Received: by 2002:a05:6a00:b93:b0:748:2b23:308c with SMTP id
 d2e1a72fcca58-74f1e7ddd35mr17399241b3a.14.1752523648187; 
 Mon, 14 Jul 2025 13:07:28 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2a00:79e0:2e14:7:1728:40c9:46f6:6e5e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f53903sm10032053b3a.128.2025.07.14.13.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:07:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Douglas Anderson <dianders@chromium.org>,
 kernel test robot <lkp@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Remove extra semicolon in
 ti_sn_bridge_probe()
Date: Mon, 14 Jul 2025 13:06:32 -0700
Message-ID: <20250714130631.1.I1cfae3222e344a3b3c770d079ee6b6f7f3b5d636@changeid>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
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

As report by the kernel test robot, a recent patch introduced an
unnecessary semicolon. Remove it.

Fixes: 55e8ff842051 ("drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506301704.0SBj6ply-lkp@intel.com/
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index de9c23537465..834b42a4d31f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1373,7 +1373,7 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 			regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
 					   HPD_DISABLE, 0);
 		mutex_unlock(&pdata->comms_mutex);
-	};
+	}
 
 	drm_bridge_add(&pdata->bridge);
 
-- 
2.50.0.727.gbf7dc18ff4-goog

