Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D07008A5
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EE910E69E;
	Fri, 12 May 2023 13:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3F610E69D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:11:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f42d937d2eso28422305e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683897114; x=1686489114;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TCif7crIj/Q+cQYJxHIAitbk8dIOcZs5cJxa+/QObN0=;
 b=d8ReaVAZ8FGgRG41sHZjy5aJxvI3k2Wxp4ywR4UuUr6DVd2z5pq9ae5LRlfNCDj1+p
 7fCHM6i6ltr+pof+tk+/99AhTvsaEROv0fDEUbnyqZ3GkOOcMGSFiVJZf83V58DI6SKF
 d3cVUKbXyCUEN2qE1ckHhgmX7K0Q634+q/QgMoI8DzozrrSaDV0OnDnHyDa5ITpUY6Lb
 1+I0C8qZ+RDN5waxpoQSRXmhDt50GuLNA17VlhKV4STibWDY1vJmE1bCPSfHe9qsHm0m
 xyl+25xAA/ZflITwDnuw3j0QLRIaeLpdQRZNUXmjOUQ7XVTr8bs6vjUW1fz8zVwJt9Qu
 mnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683897114; x=1686489114;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TCif7crIj/Q+cQYJxHIAitbk8dIOcZs5cJxa+/QObN0=;
 b=a9t1ttmaxERT4X2slEOg89FY40LWDdbGq0hNdYCitvuA/qqAilnJrT4x0LeLb9By+7
 /zYz4yAJ5tl+tbRLG3GEUQlyOBD70dyjxlkuM1iCur7Ls1pE2QdjyZwmoALQixf3wJAs
 FkJu0UkGk1t467ot9iS16PA/2rmd8OYIQ8x/h4g6yHCy2A+yH96cYuCauKE9+NgU4x/s
 J+0VhRPyAgjw5Vul5sfIfeUNWWjBAgegFOD3YLImsP7PK5xr596/5xQXAZbDI4xk169f
 0DpgwvPYD+e2Vy/PzCrBxD4qmxcMh/j/TkO/2z3i60ZRbYxqQz6UJgRmNRAKQsQi19Sw
 Of2A==
X-Gm-Message-State: AC+VfDx0bXtnmRowL/dl9ePWDdyRuqtUWkghn0MieQcx7DpHEWrXZNvU
 t+gGu6SaffbfNYrLmYcIP09uZQ==
X-Google-Smtp-Source: ACHHUZ67QEpRyPnXTffp6qINy4JaH1a0QStphnwTn26loxuM1R3NTviMro+OSSlZwLxGVtNT1UsisA==
X-Received: by 2002:a1c:c908:0:b0:3f1:662a:93d0 with SMTP id
 f8-20020a1cc908000000b003f1662a93d0mr18456984wmb.15.1683897113972; 
 Fri, 12 May 2023 06:11:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:11:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 12 May 2023 15:11:32 +0200
Subject: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL and
 add CTS_ENCL clock ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-1-2592c29ea263@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Amfvy8AIRpoaKCjLWius5WoZ7OLXQo8QlfjTgDRK50c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsS/xb78nbVwpTmjP+QuEB7+O3NBa/QB86INXFY
 Y60FIeGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47EgAKCRB33NvayMhJ0X5HEA
 Cv0kyCcpaM9ud6vdmE+8t+V2OnX+Mm51tFsvYR9LjCMrDENGe0d+m2dWigi7JMMIeeuq/6n5RPjxHH
 RvrZm2Za0/sedwLuQ4DCdU+GT31rwcEEb/bE1Qp8lxgke+/bOTdNEiEhRNy2HlmjDgJ/AbdJ62Gfjk
 wlJVjS03B3cCwn5+/LxSlkhS9PBZIUXb0DKUkagnejQemxgKwBzAHCbjRCIYe1zQqE8x8Tbs0hHdUM
 xTRkhuRQfna7zLvtOHJezV8ZhjrOFjri6gFf12S/7KQtmDLIUkd8U4AzuHnRCPsj7iKHM+l9jQi36J
 FwZjxKeKUN+Jl2tAdqe2eO4odBHCCVWri4iDCwteEusAI/HwBQp7A0seEAxMvHMXei/sK5uFclitUk
 WdQlZAmmF5uSUi4Yk8krjGgRhsOGNA6euakrseK4XeCZ2dVRJGDH4qR52yWQsT3Jrw2qmrc7QyQ1kP
 vO/+xWZbE+kCjpmCxsXoxo9i4A1SCCjeo1Uw/EAOLfoNagbC+3eFG01Q2ERk7O0seC3PshCSNCyhee
 WpRXRRmnh5L5RXeKBAzbkh3d9/YoJGNY77075Pdm2Flgu4BS58cjeOvLP9b5cN6X82ehnyPfaxKuS1
 66zRZSxKi92sCRDxQUDmdLQ1MtYZNR4in/ZxcB/sXPzen1Y+6sbOwNSl0BUg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose VCLK2_SEL clock id and add new ids for the CTS_ENCL and CTS_ENCL_SEL
clocks on G12A compatible SoCs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a.h              | 1 -
 include/dt-bindings/clock/g12a-clkc.h | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index a97613df38b3..1a4a626c2c63 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -168,7 +168,6 @@
 #define CLKID_VID_PLL_SEL			130
 #define CLKID_VID_PLL_DIV			131
 #define CLKID_VCLK_SEL				132
-#define CLKID_VCLK2_SEL				133
 #define CLKID_VCLK_INPUT			134
 #define CLKID_VCLK2_INPUT			135
 #define CLKID_VCLK_DIV				136
diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index a93b58c5e18e..80421d7982dd 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -108,6 +108,7 @@
 #define CLKID_VAPB				124
 #define CLKID_HDMI_PLL				128
 #define CLKID_VID_PLL				129
+#define CLKID_VCLK2_SEL				133
 #define CLKID_VCLK				138
 #define CLKID_VCLK2				139
 #define CLKID_VCLK_DIV1				148
@@ -149,5 +150,7 @@
 #define CLKID_NNA_CORE_CLK			267
 #define CLKID_MIPI_DSI_PXCLK_SEL		269
 #define CLKID_MIPI_DSI_PXCLK			270
+#define CLKID_CTS_ENCL				271
+#define CLKID_CTS_ENCL_SEL			272
 
 #endif /* __G12A_CLKC_H */

-- 
2.34.1

