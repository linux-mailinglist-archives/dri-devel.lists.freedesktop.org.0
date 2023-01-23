Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A13677F19
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F7510E4C4;
	Mon, 23 Jan 2023 15:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A5910E4C3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:14:18 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 z4-20020a17090a170400b00226d331390cso11272829pjd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qnaYYuZIFXsUXmdUbRbKvrLeFHz42sEEtjfLamyApLo=;
 b=GURlAgANBySQsWTDa3ZEndLod0am2tncVXCMXw7HbCWiLq524Tx8wNrnGjp5csKFTw
 Cu/zeP65ctptGGh4rA70a1VBhy+7b5Wm3u8ui6kXR7n9YVh42O3civyrCRevr5fYTwqM
 9099C8vzcM5s2D8HWfZ6IvqijuiaYPgCq/w/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qnaYYuZIFXsUXmdUbRbKvrLeFHz42sEEtjfLamyApLo=;
 b=mjqGHk2E1j3BAMzlKb1hAYEBPYcL7hOCvoXykXZbjN2JgYX6ztBd9rcbWbyQlhrPTp
 hW6aOa5AWtuZnruJgsayXoZsn3qQo6m3vQMBBwcZFUcbT/J7O+M2geDQdfj5+warbyp4
 hafCh7J3EtjWKbsON3aWa4t6JzWcdkm/AE8WCkUuu9tMMl3M1btpzJktBz6cnCOnqrRy
 /MXDEqGLLdEk/0wlejKJeUKBLe2Ky3h6KAWWn0MrGPyrS7sCRA9CgYRZFEEdVzuxFeeb
 Jt2A5gglgAo/1aeEJnf3JTM5P/bwxADx19Gek6eJHncpAILb2c0vBA6p9zDuueatmcPs
 DgnA==
X-Gm-Message-State: AFqh2krGP4sqnr99D4KgzE+YZktnSN+4MGf7ypJN4URnVqddiv28szLF
 5obC2UQFBVzvA0+Xk9fTosqtOA==
X-Google-Smtp-Source: AMrXdXuGNjci1R0MZEqOx2/BRSxuIHEtG1jvwqN/VE5h1x0FRBIwTS+XvG7wMKrtjPxrTAp6gqd6JA==
X-Received: by 2002:a17:902:c10d:b0:194:4986:a3db with SMTP id
 13-20020a170902c10d00b001944986a3dbmr26552672pli.36.1674486858564; 
 Mon, 23 Jan 2023 07:14:18 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:14:18 -0800 (PST)
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
Subject: [RESEND PATCH v11 15/18] dt-bindings: display: exynos: dsim: Add NXP
 i.MX8M Mini/Nano support
Date: Mon, 23 Jan 2023 20:42:09 +0530
Message-Id: <20230123151212.269082-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
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

Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.

Add dt-bingings for it.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11, v10, v9:
- none
Changes for v8:
- add comment to include i.MX8M Nano.
Changes for v7, v6, v5, v4:
- none
Changes for v3:
- collect Rob Acked-by
Changes for v2:
- updated comments
Changes for v1:
- new patch

 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index be377786e8cd..5133d4d39190 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -7,6 +7,7 @@ Required properties:
 		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
+		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

