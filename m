Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D08E56249BE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 19:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75FB10E7B9;
	Thu, 10 Nov 2022 18:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B051010E7B5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 18:41:33 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so5578813pjc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 10:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W5IVp1MDfQ3jiErdrhdd9wfvmibtzkcHb8CP2mX46Mg=;
 b=TqyJO/2TPjhePxJuIr6UGBjZEF1cVqa5tRYJYiK30IM7Qex4fe0FkZB1kEFzRk00jO
 aq1HDVncgzW10eRjda6HWSdz6/jRayzyKkjYn9iT0ClvML8DRfVq83o+u8aXNAVKtcjo
 db/y31E1FVSN9Mho+xxnnuhAkjLHS/nku5U6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W5IVp1MDfQ3jiErdrhdd9wfvmibtzkcHb8CP2mX46Mg=;
 b=iDeUvGOGwi4RmazD+ZFRR9daSD99jIAqn8vYENKQVxFcc1CFdDQOdGJA8SWh/t8shf
 UPFQm+Bks/bnD827VR3YTcZI1npLLh0J/Mft1Ip+YV9W+Tnh2S7NvoNxo2M/OHE38n8p
 HZSW6hfmRRWfix1Lgig3KKsrIgevkzWEA5ZE9QSYwA7mJYrkj6JGRyvp0ooXuHMKO1bL
 d8s9c9lf2mx4UWBWDG65ofe0tFI1EwbLlXAZj5ZbcMByMMbd6g9r9VBy2v8xwNgwryKk
 gg33D13GxU42gQt2Yz7MHsFTA4rYbYzw62cuR4ruDlwubgO5G1eNiS5L3mZJK4kix4kh
 HwVw==
X-Gm-Message-State: ANoB5pkwGjbiACeTG/FYE+Rdw8+PSpiMPfwmvMMEgINspIUPxsRWt/A1
 hJ++Rhr+OiZWzxwzJDYUqpc+Jw==
X-Google-Smtp-Source: AA0mqf7jMH4MZRPkHb9D3lL/p2OidQ8oQzollWBrRPl5eWSOwD+NE4vfq8zYFR6EzXbHbAhMRgME/w==
X-Received: by 2002:a17:902:c211:b0:188:9806:2dfa with SMTP id
 17-20020a170902c21100b0018898062dfamr4353858pll.10.1668105693275; 
 Thu, 10 Nov 2022 10:41:33 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 10:41:32 -0800 (PST)
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
Subject: [PATCH v8 11/14] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Mini/Nano support
Date: Fri, 11 Nov 2022 00:08:50 +0530
Message-Id: <20221110183853.3678209-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
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

v8:
* add comment to include i.MX8M Nano.

v7, v6, v5, v4:
* none

v3:
* collect Rob Acked-by

v2:
* updated comments

v1:
* new patch

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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

