Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AC676E7B0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 14:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED3910E5F8;
	Thu,  3 Aug 2023 12:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2186410E103
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 12:04:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe12820bffso8741745e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 05:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691064245; x=1691669045;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
 b=MyHUsgRRMHSkZ6qLbXroIG85T6WWK2ZHKgoQEtUUZ1od5FzypfMMuLf2df2pa9Ns0d
 0RgOFw8RC8NzLVUWkTHp8sEEJuf2pMQ3njOFjsjfJ2+n3woo1xFIiDVQSAQPXIjK13fz
 y/4Hzbf1atwfzMbiE5rKvMful6lMlBkSpgXAwjCL2vzV4WgS+6raJ00j6qBFYciWIlLV
 iv9Ga0x1KWd/5GgEuVQFVuUItjfkUqQJAyuy41U7wPZJDAKwVCOixSy38CUX+UBdeJE5
 aO6vSLt4ZSYOEXnDd1KMmO6dXXMilm71qTKRvVMazm227YmgO6PPCnjVIPykA/RowZty
 M3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691064245; x=1691669045;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
 b=KmNArfz3bS98+BAhBBlS6sCh3giPxUCM4Fxpz8B4SZlReAzUTXbm1tTOUwY/cCRGRL
 Lxkbbf1QJa7lXJtb/fqggqQ8oW7vuL59CXerW3d30Iae07j3Uo153V1F6VeZMn13J9TU
 ayDR/qbsQ9d2tEI6KHGG1cZN/RqqenRVNH+MkN06PycvUtAYxG0Tmahn+In86PV0VYIj
 GWMEmZIxaJvZKgcN8FnlJaNyhlutjKW6Bh5q2V3NZPPbC3ZyRgv67tSX8rigL1NEdchc
 PC9huAa0vXdrJp2MGDJml7yg0gaaccyw150qSpiQ6LE4RLsoRofK7/hzIldEWqqAyXf3
 nk6Q==
X-Gm-Message-State: ABy/qLbk7jjXv7sObUuMEja+FT2whZVbQsNUia1KRBZPfOsA1fJDhyv4
 HXfKS5/xF0cCwflciwOKA/Steg==
X-Google-Smtp-Source: APBJJlHyl5WYI6N8c8ajSFmQT4ZqGANnisyCQEfMYfWWz8LEKIkaPLA4Ac14e/Ko1++3dxrq9AhIaQ==
X-Received: by 2002:a05:600c:282:b0:3fc:85c:5ed2 with SMTP id
 2-20020a05600c028200b003fc085c5ed2mr7182732wmk.11.1691064245559; 
 Thu, 03 Aug 2023 05:04:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a056000114a00b00317046f21f9sm21487465wrx.114.2023.08.03.05.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 05:04:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 03 Aug 2023 14:03:55 +0200
Subject: [PATCH v7 1/9] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-1-762219fc5b28@linaro.org>
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
In-Reply-To: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OBDzXE6zqX89kc7pvzy4CIEH7gf5glqDzs5WzIgtsF0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBky5evPqlyqm2PHjNKCgp/BXcAaRArzuGQt1FzLmzh
 IYCgxKSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMuXrwAKCRB33NvayMhJ0TAlEA
 C8/B9GuS3bdWQiUB/DwPVUIrv6jpMVkEuWwOY+3i31cD13nkHcb7O4C6Ld9WZbE94JrqeKg0/t9+iL
 JsdOzdf6971IiUC5SwHTtSVEHjxPbFzkOubk/eeoTJkxGRF/MsYM0iAg+rvNzbeTaxVF/9AtKrwriM
 9OzyJBguvh9wmnESKYRY0cSLznjvA+GxVDPHIzAYHDPLX3LJJ0cfpAx8JjEzx0PNWRjww7FGpm+zVa
 FYfy9EDQ6OQ06WQo9vNfskyh5SCBTWnFLvZbcb7/t0v7xncEuhNWtJvuyz6tWYw4yp/oFcmGXgjSFv
 aUqluT8S0r4sfNH/DGkXvBBpzHMbaNx7Kbdl+eyrrYjP7yu5h+Ig8urwtnW/qiu/myoj4DhwUQwXGo
 poOC5lpwnkbvAiFmFe3FGf8Hr2SEWuCelnjhfN8yBVKfAYzpJFN4jlCwUid2B/XPT0LDdnTjSnKmOC
 mzH0kUPdwR7m0g6eUYMW/wEpW00uNwDQgyPbBViE/hZqPg1oXFYG2e/5f7MY7VeQr6IWEq8XPJg7aL
 2XYlxslPMFYDCrDabsNy/o5baT4C26V/H1IuYCheOZeS/WHq2kd392DxMb1XwS+Cj+5FsMbJJnBaMh
 fjX9Kv43/zWgfJnIkL1GE7S7hAnc43MbnztJ7+TvF2D9S0bWJ5X8vEOlMhrg==
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
 Conor Dooley <conor.dooley@microchip.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new CLK ids for the CTS_ENCL and CTS_ENCL_SEL clocks
on G12A compatible SoCs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 387767f4e298..636d713f95ff 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -279,5 +279,7 @@
 #define CLKID_MIPI_DSI_PXCLK_DIV		268
 #define CLKID_MIPI_DSI_PXCLK_SEL		269
 #define CLKID_MIPI_DSI_PXCLK			270
+#define CLKID_CTS_ENCL				271
+#define CLKID_CTS_ENCL_SEL			272
 
 #endif /* __G12A_CLKC_H */

-- 
2.34.1

