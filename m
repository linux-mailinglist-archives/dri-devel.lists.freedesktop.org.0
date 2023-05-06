Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6CD6F93CB
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 21:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8D310E0E7;
	Sat,  6 May 2023 19:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C052110E0D3
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 19:25:25 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-763c3429a8cso82634839f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 May 2023 12:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683401125; x=1685993125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S57aMfOKN4Ufu1gBwss42JtDuspNMJN7ZH7N5B2pZmI=;
 b=C5YRUTGAIGAFgGAu4PBTFHndyHZlpRW9iseYYOnAlzieoDG83oSp281kyw/IY4sM7Q
 Gi5HmZFQ2siulihfaq0s2rTbqcVyI7811vAuYqw7ymKcfzrJSHvIQXc0m6NO79KmNI3H
 IV6Vy5Ry4/7UJcZDm/gSozUsCakwfFTC270kO7b/viwsg/xLGlL03i7XoF/xQsKlR+YB
 LI6xUeCtFq5GI8Tu4Y/RZ6nNXBSwaYfn3wyDCiO1aWVJn8CvUNRC/BqAtJ4TeSiviSqR
 UP7rfZKbMlAwyH7F11m2uJt+qfGBlyNv2b0lWqYZVu79uqbibWpb9g16flcgm/kdFrct
 sTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683401125; x=1685993125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S57aMfOKN4Ufu1gBwss42JtDuspNMJN7ZH7N5B2pZmI=;
 b=IVFfrX4q7XQob15D5Eu4BxgJQrJbyNHRyXSkDbt2QIXjy/iggSLNOzemqSiFZN1yjh
 puCb0Y9Hgp0oDu/9Zc8YRUQ5GgM83PW10edMjvgn7+Xn8UZZ1x3X8S9DB55i0p4nyFE9
 rudsLSG5Ns4sxfsIbIIfXKf4MTW0LgFMM2B+PwC4Npyg7eKu+ZTzDSo/eVmiuBcPX2TH
 JWaTVXsu46NPWJ4yn7XVyQRyG6MYcuAI+GZ/KuhHMN05YtbY7OG6fLSCDQtziEdymROS
 hao8TTa3JvGdYzucuun/iZDCblXfIdCGBEllgYJU1eiq8Y6nBNKjC5C3E7BjQ4doBWnE
 Uj5w==
X-Gm-Message-State: AC+VfDxEl50uPxiCsem+liiwyh7fwbw1C3GtD0Tqs8YjLIoq5UMf5DIh
 LcTDHkMTsK6XJLIuDreAQgPtBHAj/TAHMg==
X-Google-Smtp-Source: ACHHUZ47U37rVifyXkRt2NUsekfY8Sh0y6GR0wjeK/VrAAobXnAIzwUieChhF/Z+wsG02VUs35UrWA==
X-Received: by 2002:a92:ce91:0:b0:331:9c03:dada with SMTP id
 r17-20020a92ce91000000b003319c03dadamr3185984ilo.13.1683401125026; 
 Sat, 06 May 2023 12:25:25 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:5e49:1bed:79d0:5c25])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a05663822b200b0041631393ac9sm847824jas.18.2023.05.06.12.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 12:25:24 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V5 4/6] drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
Date: Sat,  6 May 2023 14:24:51 -0500
Message-Id: <20230506192453.725621-5-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506192453.725621-1-aford173@gmail.com>
References: <20230506192453.725621-1-aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
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

