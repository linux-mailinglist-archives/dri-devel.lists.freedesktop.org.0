Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B366A40FC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857C310E3E7;
	Mon, 27 Feb 2023 11:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811BF10E3E7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:41:22 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso1859487pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 03:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OactgBmjQNk0sq2vCizwf35037R0yRtN2J7cWRvN4+A=;
 b=i2xP69iEZ2gnIpYs7eOKjQjETZHHAF+NZPGWIxrR+TJFnjwlrMaGEqvWfbnEW5cNqD
 /iIG7snXET/5Me6y0gRybGxP1fcPXhNeUQNhC0Qn1j5HSts5z9IA/FR+HxBtxl3CxZro
 MjfNVIMR1XWXFyXkpEAH3Qe0CbH4PSsiuy/TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OactgBmjQNk0sq2vCizwf35037R0yRtN2J7cWRvN4+A=;
 b=6+2EVYRaOwJiX8ITBk6C8ZUVJAIdXkv75fXIpveKp8uiJCAH/j0VoCLQTlA4fvB9B0
 63LyJNc4jK8ueNWx4XrPJHT4UHDGJbd8DN5FKCQ607RVTrZTNds4yKIPzU0DPeogEekx
 hr6qXUAKf1BCDiO22cT2+54/vnIB+7OiRBlSaZpfn7KPyCjmX4OLTrI3bn9df2qMRMGX
 eF1cV+UYBCGH0LalWqiRZJYedYN8XA/pSBHcmAFFM2WnCYfCTnjDcaBsTHE943rJTASi
 xIt0HIOwx22jtzzu3xaPt1UV3TawKdmAeHVOcByxnRsQtrAf9vMo6jGrVMQtN18kM0Kz
 Xs3A==
X-Gm-Message-State: AO0yUKWjEyfT7Rf21V9vP9aDBOlbYe59vSPBP9YnbIYlvreA8fFgSMTe
 DysKIl9/uXj7TvGepf09cmzpxQ==
X-Google-Smtp-Source: AK7set/phBDiIp/M6U97W6LqTX87yXrxDO1RBEMT/MRgRzDDyp4yYLyLcDoKp+uwQ7elbiGnR+4zNg==
X-Received: by 2002:a17:902:f68f:b0:19c:1433:5fba with SMTP id
 l15-20020a170902f68f00b0019c14335fbamr29364325plg.0.1677498082146; 
 Mon, 27 Feb 2023 03:41:22 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:41:21 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v13 15/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Mini/Nano support
Date: Mon, 27 Feb 2023 17:09:22 +0530
Message-Id: <20230227113925.875425-16-jagan@amarulasolutions.com>
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

Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.

Add dt-bingings for it.

Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v13:
- none
Changes for v12:
- collect RB from Marek
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

