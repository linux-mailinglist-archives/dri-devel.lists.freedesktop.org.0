Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 680C44F5742
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A73C89209;
	Wed,  6 Apr 2022 08:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFA810F293
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 08:13:14 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id w7so1781009pfu.11
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 01:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VrE7MQ9M1YSw9ReLPBcfWeZseEAauGJw2LI8u3+GkAU=;
 b=B5mW6bMy3F3mmzVXwmpqFhDp8edGh0oacv8HcL/qM+z3JrfVrVaDinooKFX9yLpLmo
 pYB6VVItC9M05Ol+YN3ov/RZqrgQNb5gZD9eMB58vIDaHwvhbB1M/kK10s4H6iZGdwAN
 uhE48Fh6T3dt0jDhUwv7RyV2ORctzuLcE+iD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VrE7MQ9M1YSw9ReLPBcfWeZseEAauGJw2LI8u3+GkAU=;
 b=Fzt9eGFDaa1pGqkiCVvRCgoJTN5NpaPVbytJHhQBxx7HbquZU96BXALlGWGQLmS7zk
 OjEDy9vhvWuUxfw9Mn7QOj/uTi/HWKV6j2JIJf+yrenW/cAuRDYABuyCioyZBUKvfMbG
 z8dEEtuO/Qu45fIHrXeW/OrgDcPj5ljVRvPubWoHz5YIIDX/vYNJHVY0P6uFCGHsfX5V
 3Bvyac2W4ZIq0cVmDODg4IpeEc7KEWecq9k86W/fgNi/D98lhdvR82IsQYXVAggFiWgb
 4u2jr0v5nCLfdqilwZfoNqdlu+f34og7XyTFYi4pRQ0u+x0wke13W2HyYJzub5ZIXvOB
 8R2A==
X-Gm-Message-State: AOAM531bGw2zWQzK4rZwSFb3RMp9Qn4YMSyDtSsS1I8wb+Gc7xijTHmb
 c+w2vouIePUgJzKzFYIq3Yc0mQ==
X-Google-Smtp-Source: ABdhPJw64GQWp68YvOvlnagZ2aRT0S25WAh5pk5OlplNcITiHL7EztrKS6yAP63Ln7kyh4mffbjp4g==
X-Received: by 2002:a05:6a00:a26:b0:4fd:f9dd:549c with SMTP id
 p38-20020a056a000a2600b004fdf9dd549cmr7673269pfh.42.1649232794014; 
 Wed, 06 Apr 2022 01:13:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:64b9:79b8:9695:b4c4])
 by smtp.gmail.com with ESMTPSA id
 u62-20020a638541000000b00382791c89efsm15452013pgd.13.2022.04.06.01.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 01:13:13 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm: exynos: dsi: Drop explicit NULL to out_bridge
Date: Wed,  6 Apr 2022 13:42:50 +0530
Message-Id: <20220406081250.342286-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This driver has been changed to use the resource managed
devm_drm_of_get_bridge() to get bridge from ->attach(), it's
unnecessary to assign NULL to out_bridge to remove the bridge
from ->detach() as devm_drm_of_get_bridge() is automatically
remove the bridge when @dev is unbound.

Drop explicit NULL assignment to out_bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 06130eee8df8..5fe262f31065 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1500,7 +1500,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 
 	if (dsi->out_bridge->funcs->detach)
 		dsi->out_bridge->funcs->detach(dsi->out_bridge);
-	dsi->out_bridge = NULL;
 
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
-- 
2.25.1

