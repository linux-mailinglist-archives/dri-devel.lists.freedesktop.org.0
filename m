Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44B6A4103
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5808610E3EB;
	Mon, 27 Feb 2023 11:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1649610E3EB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:41:37 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id y2so5793629pjg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 03:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YcGwdgBk9vWJlF1jRwo2xbD/AgV2OQNG9PS9RocpiKM=;
 b=eq0MbB6PY1NWYnlm9qu/gHlADhn5+6k5/BMuTfRJhMY0iluedtfLRkeBkeRPo23lzZ
 K80IPqUteBrKBtq987B4fQy1zmWirxVU3szpgZPq5duR/vhnT6oFxeDB6jwMjhvudCcP
 IzdD95n3MEGwkEzi+Ip1SjrER4K3ElRABjyi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YcGwdgBk9vWJlF1jRwo2xbD/AgV2OQNG9PS9RocpiKM=;
 b=ImruEADLCpVaK33uFX4TjdW616RZ3dtmNfj7Onsit2jZ5fAqXlMYRF2sa7/1SpfgQN
 FeXR4ZrO3O1nRxXh7YE99d8wNKk7cmJVTf8dk+hHxn96Sn/PYLWHexeuQdcqP0ayF6lr
 PDyi6aGKtvURoTwVuINjGHY7L59cf0PcuWQa4cc77/BGJ/QQQm71HOj3bMVskzpvdZO4
 NsqGKT/kIM5cFlGJ+UbuKrIfeUwBnYVq5nh3e/uT/v9t1gcCHcEVfeBS8063zroZqPKz
 TgzIYIyYzh/5jCgyOEjgT6XpQsw64CPzPgXnqmeHq7aNoy7+8hJcRJH21f/KAY7Xv6q6
 8fdQ==
X-Gm-Message-State: AO0yUKUyQUW1XbxLPHWZjhxP3PIMhWbSpUVYgAnCcnV4aW2xPEwGcKUY
 8C29Rweb2Bp7RsVCANq8Bz8oSw==
X-Google-Smtp-Source: AK7set8cPbWkGmpzNAyJDD39zrEKxNMtzV5rzVTu+ylJwiL1oOcrGi5uuyGwDiC5VAvGHz/SWjCuJA==
X-Received: by 2002:a17:902:ec81:b0:19a:a80e:a6d5 with SMTP id
 x1-20020a170902ec8100b0019aa80ea6d5mr29295112plg.23.1677498096668; 
 Mon, 27 Feb 2023 03:41:36 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:41:36 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v13 17/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Plus support
Date: Mon, 27 Feb 2023 17:09:24 +0530
Message-Id: <20230227113925.875425-18-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.

Add dt-bingings for it.

Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v13:
- none
Changes for v12:
- collect RB from Marek
Changes for v11:
- collect ACK from Rob
Changes for v10, v9:
- none

 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index 5133d4d39190..2a5f0889ec32 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -8,6 +8,7 @@ Required properties:
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
 		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
+		"fsl,imx8mp-mipi-dsim" /* for i.MX8M Plus SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

