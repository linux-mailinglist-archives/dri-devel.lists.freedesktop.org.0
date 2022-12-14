Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572B164C990
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 14:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C87D10E3F8;
	Wed, 14 Dec 2022 13:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9688410E3F9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 13:01:38 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id x2so1931675plb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 05:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l8dC2Gsn7/DPw+06SvyPKXiLZl5J5e+MnQLJWr0R5lg=;
 b=C/CoxKrwgllUTgPoZwwqsWxbBjhZtbqeoP5H6TRO0VLQcRnrnz27cgh1gckODs6c4Y
 hjo/OgwrORxVMs+lneUR07jTMMyD06UxUsWzui1Dl2cz5AHMf2wezgZHAW9itVOKpJVE
 UfRhJmsZdywxBj0qj2Utiv0IGovp5fHumb29c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l8dC2Gsn7/DPw+06SvyPKXiLZl5J5e+MnQLJWr0R5lg=;
 b=AJTrN16W22Mo5WGzPY6dpibJMYORW+guwCLTbGaSfbP3agNAVCKap7GxMjvFfCg9qL
 wnljhQa8Bnda0MD4btON0l4adEoH50/q9pgrMepHkPNEFBqVTYBIKAzHFZRiUt+uuRgR
 hYk5ZLq5wpsy0pgj8yZWmL7p6/4jBXlHHNkAfdBdVmeIVq78k0NEI0ocWS3fUVMifn8b
 vPqZmKveBJmEVK9kMjGjb0X4eM16+kKY4wFL1njGzQiGW03cJuCaNNBrw95tY7DhQeoQ
 hx+WNh83AaEu5xwmu4iiNL2eLUJlxJfxXjWUtbTl8jALBoUe5tHXfFZ38oP6zT8W7fqD
 kIAA==
X-Gm-Message-State: ANoB5pmzcfB+3ZXo4bDfvejvMxgA8cpsmaRvWUYYhpADsoRX4pkmtgQv
 99B7ob552I+v2kiOiKN+TAGZiw==
X-Google-Smtp-Source: AA0mqf6ckNSerlrEGekXR/9I5wplg+qXi2frZincM6Z8lCDtlsNIlHj2C/nPOVwF6cGNeV60yfii6Q==
X-Received: by 2002:a17:903:2412:b0:188:82fc:e277 with SMTP id
 e18-20020a170903241200b0018882fce277mr24851098plo.12.1671022898068; 
 Wed, 14 Dec 2022 05:01:38 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
 by smtp.gmail.com with ESMTPSA id
 ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.05.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 05:01:37 -0800 (PST)
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
Subject: [PATCH v10 17/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Plus support
Date: Wed, 14 Dec 2022 18:29:06 +0530
Message-Id: <20221214125907.376148-18-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.

Add dt-bingings for it.

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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

