Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD0F711E4B
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 05:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0747C10E79E;
	Fri, 26 May 2023 03:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC8610E795
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:06:15 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-775ebe161c5so36751439f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 20:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685070375; x=1687662375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4o9sUAx3iK/A4vzjmFl/tQ6LFFXKGPJqcsBJSVqCXEY=;
 b=hTACl7CnYTgFZvkWvYBZrZeC0sxZ9bLXte3Z0EFktq8iG/vgVQqMph4F1VcpAFS267
 XSQJu7EqS2BOx9zZDEV0kFe3Rx7bgw4kHSSkXZqOkB5U4Fb6wfe/TL1u6hBUNgdaqKZW
 ik7zbD6ZKTeBTrrE/Xvn9OmH29NcwcQokR2bl1ZLwL3G9US1wB0JX8AFbkeqpfE2O2aV
 AmXUm3nugXR69dB6TsSN6vzXSEkoU+xI0qZFhjuhVeoCp9FoPE8nQ91gR7z7mH4knuBQ
 EZzIzMFY4+WbgvSNY4oCfBDz7grCFfVMAd6zh5iArrdffJwzHPebujAWu5B/v4fsblia
 DE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685070375; x=1687662375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4o9sUAx3iK/A4vzjmFl/tQ6LFFXKGPJqcsBJSVqCXEY=;
 b=BTtMnb1Yk1NfIpoV7noqpY33ZHYOS8LTdzhywECxwpqlzBcSYWLIhKPgcrDWcD1hTa
 WKa/OL0Hkrkv6SQzYfp1tvA78tK9QnZcwVDUgYsH0bB+QzVOHkJUfXpfx1tQuv1XD2vs
 eXRrriTH11YWgsIdnsK0Up9tkCOkJYja5fYoeehQv9PwosAc1vEYWHtKfYh+lwSzFkMI
 5ZqcCUSbBkpscdn2vnx6CSqt5ngThSNjNzXZpxBay2JcbPKv2XoSKViSGisz4Hx73HR6
 GcB5e1WjmQUjGee0YeLn53koxRTlwxEHuvb/omqoChmUL76inUZ+0/V54u1MyuL38rXm
 Sn6g==
X-Gm-Message-State: AC+VfDzzGO4eCJxLVvPKQl1rt9LlGnJ91oKfq3IUp4LIKBT9j4EoEPpx
 nFZMjAQ7jCWEnazuSMHb2FyRVvTH/pc=
X-Google-Smtp-Source: ACHHUZ6ruY5h/u2nCZOxRF7M4+/wrfRmDfGCm2TEpMYrYd1j+/ULSUIf1H5LvzwyT6edBzO5cnul8A==
X-Received: by 2002:a5e:de07:0:b0:760:ebf0:bdfa with SMTP id
 e7-20020a5ede07000000b00760ebf0bdfamr180015iok.2.1685070375064; 
 Thu, 25 May 2023 20:06:15 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:3dd9:3f6c:9922:6420])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a5e8502000000b007702f55116fsm363189ioj.38.2023.05.25.20.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 20:06:14 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V8 4/7] drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
Date: Thu, 25 May 2023 22:05:56 -0500
Message-Id: <20230526030559.326566-5-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526030559.326566-1-aford173@gmail.com>
References: <20230526030559.326566-1-aford173@gmail.com>
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
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Adam Ford <aford173@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
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

