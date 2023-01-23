Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E1677EDE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801C710E4C2;
	Mon, 23 Jan 2023 15:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADD010E4B3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:12:52 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id g23so11646841plq.12
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzZAbpiEnBNpm8Oq4UXR0GXlgPppEqEywsWppVlOZ3Q=;
 b=WsEQ7ZNakSFaD5MB9QRH0KYZFsxDgwkq4W5DXKR/9AIxLCpBZFeLKSeWwsEoHGm/y2
 XuOrl3dzkQ6uOz7PXUlOpHwWcnNHrl+2C4ZDtD9yQv/aW+gkFg0HS8Rhts7DyvGIdR9c
 YWeKk0ZcBHcZZ5dUY6NKan1SFM5Yozqz0rcxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hzZAbpiEnBNpm8Oq4UXR0GXlgPppEqEywsWppVlOZ3Q=;
 b=D+wkE3WbegnFd+C66QGEvZb2szWJgXaiS8YFIUYbd45cybqKKTduHUaRw/njc4Z3gL
 koHw5cvk4CokeOO869JsnpzGbh50hQm0MmZcFKqHqxEVW9g51AuEeEt5M2MCmNg3zQru
 7+K3ER5XzJOI+xXWPkoATkl6cu8q2oV82k9ngxNj3Cxp5ra8uYqR3oW4UsIC+p6AG8Cm
 pT75cGzPERcjMHLhRvoutebEhCkC+XWJwFED48Av2Lk3GEhslpoi30icNYO3DKjAR19W
 O27RbDSh8BvVfdPJOgMtUeqQKj5cT5rkUesFcQQr7RSAkO/aMgaETzCRTGP953RRfHsQ
 jlLg==
X-Gm-Message-State: AFqh2kqAKP2CxWj/spk9w3e01Egn88ox59OLqBhzFWS12eT3W4mfCc9X
 sHQGOe+GUF8OFKAyLush7NrBjA==
X-Google-Smtp-Source: AMrXdXvv5cKZFNGFAXX2Dm8h736TYNMomsAC0I//jhFBp+bIOWUSlW4B2TyNTwZhcxMF+G7mH/yQLw==
X-Received: by 2002:a17:902:8f82:b0:194:5116:c3e1 with SMTP id
 z2-20020a1709028f8200b001945116c3e1mr23105664plo.24.1674486772176; 
 Mon, 23 Jan 2023 07:12:52 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:12:51 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [RESEND PATCH v11 03/18] drm: exynos: dsi: Drop explicit call to
 bridge detach
Date: Mon, 23 Jan 2023 20:41:57 +0530
Message-Id: <20230123151212.269082-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exynos DSI already converted into a bridge driver, so bridge
detach will suppose happened during bridge chain removal done
by the bridge core.

Drop the explicit call chain to detach the bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- none
Changes for v10:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 06d6513ddaae..df15501b1075 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1531,8 +1531,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->encoder.dev;
 
-	if (dsi->out_bridge->funcs->detach)
-		dsi->out_bridge->funcs->detach(dsi->out_bridge);
 	dsi->out_bridge = NULL;
 
 	if (drm->mode_config.poll_enabled)
-- 
2.25.1

