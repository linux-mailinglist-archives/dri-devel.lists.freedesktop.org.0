Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDA7708C07
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 01:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB60110E571;
	Thu, 18 May 2023 23:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305D510E571
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 23:06:46 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3381a0cae92so20611915ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 16:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684451204; x=1687043204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4o9sUAx3iK/A4vzjmFl/tQ6LFFXKGPJqcsBJSVqCXEY=;
 b=neaX1AsZMi4JgHzRyfIozgwJkv0FHSm6o2KaeG8oqw6uC6x7lCfn4Ki/4zzqGlEnya
 M0BuBiOj1lP7uaTnPY5que/47wI7qw7Ve/rH9kZMXmnc5cbq951KZ2i47NpVR3KPfO+P
 WnpunmjsKVfR+txcol9AxWoV1vEFS8n1T1X03Dyyjb7iLjzik9w5eeV1/prjhqy2nDpk
 EcgmWnwfGhByiNjV6yjOcR0CIkEfMYCzFAiKcxfQmGMUdKb3vyHwvpiw4RULlmGbIoIE
 uOQBFKvyXm//KalxwaUBmOoYpXwWj8NEVaiuEkp/S1BVHSXwQ2W2NQZkAtcsllmVRfTV
 rMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684451204; x=1687043204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4o9sUAx3iK/A4vzjmFl/tQ6LFFXKGPJqcsBJSVqCXEY=;
 b=AnzdQTBKYI88sahs7D7tMEMB47jNePEAdauzKsZs9SLWNU1PZA5d07DZ4reResn1U9
 fWopfWWgjKiLWwC/gTVhvUDcocLIP1NiXYkGjt1+CI3JxCzvHdT9oSXr6bWjlW6DbTvY
 WgCvjmjANOz5QfEPllmlMDfX5KdSA07BM45guY90b77OCjiciEfF+PE6dEiC7fjCHAdd
 Bth7OMjIwrwkV43DtWWS2Re6/zGnPNwMsZ5whRVP+qiOpOjt9pVI90zC3IVy2CS/k2YS
 jTCuJvk//cmLTIm0lzyKtQbiReHst1yQKDxSfHZSDBXn9GP6t93Yo9IZPA+sp29AzCFD
 eXLA==
X-Gm-Message-State: AC+VfDzMrOh3lYc7aWTZ4yMXEaLJw664OA5v6aLzDv4AbV9Vc6vXNOlm
 9V5qD+DRrf+SlWGOQxmMiFhwZlErFFk=
X-Google-Smtp-Source: ACHHUZ49jytJKEuT745t6jx63iNJD9VDzHUyMD5fg/bxd46QCh04b8HvC+o6yRsw5Kn3S5qQd5r04Q==
X-Received: by 2002:a92:c952:0:b0:337:83fc:43c8 with SMTP id
 i18-20020a92c952000000b0033783fc43c8mr5814594ilq.10.1684451204474; 
 Thu, 18 May 2023 16:06:44 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:56b8:635c:4c7a:15b1])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a92cd0c000000b003317ebbc426sm635897iln.47.2023.05.18.16.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 16:06:44 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V7 4/6] drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
Date: Thu, 18 May 2023 18:06:24 -0500
Message-Id: <20230518230626.404068-5-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518230626.404068-1-aford173@gmail.com>
References: <20230518230626.404068-1-aford173@gmail.com>
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

