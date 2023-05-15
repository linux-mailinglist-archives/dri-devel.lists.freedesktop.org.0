Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C686070418C
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 01:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D33C10E2C2;
	Mon, 15 May 2023 23:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE41110E0DE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 23:57:33 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-76c64da0e46so190668539f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 16:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684195052; x=1686787052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4o9sUAx3iK/A4vzjmFl/tQ6LFFXKGPJqcsBJSVqCXEY=;
 b=Qhc++AOKc6iuU6NDoWnS1HCbpn4iPCDGURXGkt7PM71KSwmvciygh1yDBOBiJ0LDA3
 hnw414SE6bnXHXCB9GAtOf2eJuw0Q/A0SBcz5OK7aNOznlX3XGYXDogEEExxdxcKKsT/
 x84+Z3C35XY6dYRzaaDOpDU/QsOVNe8g0R5HqmhfU7vbsr7MF4bp33QrK/dvejoXRn5L
 Nh/9ZyFBZDHPaSN1ZcjZIlZRMx9SnTQWKVczFyUvwNQxS9ppKYnRF1aMmq9c7TRg9ghT
 QbUTy3XvhLiZUJRtukxhVX9MqOE9DyG+9kPoBxyzOSz+mg5ElZoy3b+rOmixEZJaiipT
 bK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684195052; x=1686787052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4o9sUAx3iK/A4vzjmFl/tQ6LFFXKGPJqcsBJSVqCXEY=;
 b=X5oeMG5n0jbG55obxxXgdIHt3JXO0PQDJhO09KqhWGTsR9E4W9EpRtx7ZOSh4TyyjC
 nomeCpJkbiYT7s+aT6glH47MET+CTOrDDka9O1E6fKF4gtLi1DkA79pnupUkAFeOAjY5
 DeoibMBW837tapEGVJFsH3j3Y2kp9aJtb1wv72sIiUteVIRhXeupH1SQ/HWkWfAY05sE
 NNElPcExEwYM/2IUbKqBdXvtiHx2Uat3x/FHt3bNJSLU86/EXOVJGzS02XhsIzhREE0N
 IJhlBSlsNLENuxFJsMjds+gQvRHZkPfrIZIAXEmqbkEUZHH0m3GVOocaIa3mU3GEn1wp
 e9Rg==
X-Gm-Message-State: AC+VfDw222rrnI3NofuCPBDIyeJodktW2ELrbTGb3wNXKKNTdYxDjfpN
 zVU7rvfYu8K5cSI7ElqqDXXJIPU2xDo=
X-Google-Smtp-Source: ACHHUZ4XF7Hna2wtvI3r7ukfUzFNTLOqmB3ynidPlmpgPu1EcvqiwgTXbGgh1UZtGhdREDtHKDAwkw==
X-Received: by 2002:a5d:814d:0:b0:758:917b:c313 with SMTP id
 f13-20020a5d814d000000b00758917bc313mr750544ioo.13.1684195052132; 
 Mon, 15 May 2023 16:57:32 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:61e0:9fee:1bca:ea3c])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056638112600b00411b5ea8576sm7427851jar.108.2023.05.15.16.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 16:57:31 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V6 4/6] drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
Date: Mon, 15 May 2023 18:57:11 -0500
Message-Id: <20230515235713.232939-5-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515235713.232939-1-aford173@gmail.com>
References: <20230515235713.232939-1-aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support variable DPHY timings, it's necessary
to enable GENERIC_PHY_MIPI_DPHY so phy_mipi_dphy_get_default_config
can be used to determine the nominal values for a given resolution
and refresh rate.

Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index f076a09afac0..82c68b042444 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -227,6 +227,7 @@ config DRM_SAMSUNG_DSIM
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL_BRIDGE
+	select GENERIC_PHY_MIPI_DPHY
 	help
 	  The Samsung MIPI DSIM bridge controller driver.
 	  This MIPI DSIM bridge can be found it on Exynos SoCs and
-- 
2.39.2

