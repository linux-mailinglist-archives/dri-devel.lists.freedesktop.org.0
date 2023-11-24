Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820E37F6EA1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D920010E7B4;
	Fri, 24 Nov 2023 08:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC8710E7AF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:41:31 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-332c0c32d19so1071422f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700815289; x=1701420089; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1vhZkFxLvuCZe0A7RVw31v//xJIvUsZb7i8/r2Jbnxg=;
 b=inxnhcFJhxtp24ihXkcyNFEKiHv1VmvbXK0dZf4ebJ7Ph0REUCvu57FfbBW/bihR+C
 uKxTSDybyynIy54oIskLQmh4GiTBiHKtZltJloaN9nKNlvwmMV0hFN7C8dF9u7kNtcO3
 dy1ZF8Gstr/OPRq4fGbd3VQdDYCZ4v+AT9iR9eFz8IllMlcQtM+D1nX7gy6B5wnsCIkU
 kC4NOkImkuOw0zsMpxMo4VOoADB+/OChC6w/QoefpqFrEyRLSdQPBEra7IGBGptrftQg
 BFNhAQ+M1Msq3+3QMA80mZFO7JTV4ewh4tfeX+AnFgRukJRbo4LzYNzYuUH9JJljfQFg
 2uWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700815289; x=1701420089;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1vhZkFxLvuCZe0A7RVw31v//xJIvUsZb7i8/r2Jbnxg=;
 b=KPSbHFaE9b6T0ztqU94Y5BdRJd18i2kfKmC3T0owgRWk30duxDoCGQd5jVB+YRk1y0
 fuYEfchNjb7kITjs3HTPSVApQHNcX2aWcVai8LjhAdY1f7kzfmEKbn00vBENb87Sd2lD
 JmOXkDyhiVlDzJj+3Cf2r8265ngGd0BsHyDcbnxVbYRAlqQSPJmFCLV9QHxIvXIjbXNU
 IfQos0eSe209p5ejyKufV6civ3ArCa8z0ilWhvEiAS1m/a4kR8Wi/PHhCkPsLFrWiFGe
 qEhlLHWc0oftrsqjbmgYtp5rumEsu4ZRrffAUfp2HiFKb3CdjRLSg6HMiL5q+JyInm8I
 E/pw==
X-Gm-Message-State: AOJu0Yz8xp+YguePGfnr6/vX4C3gjSbVmxn//p9ezYKfvMhL1w041iGl
 Jow5Tj+g0a1USGBcbEb/BkP/GQ==
X-Google-Smtp-Source: AGHT+IGommKInNd3FR31Z3mvyaSG7pswa9iifJaF+pYGzjLLSWEIzKdNop4bPbWiyyiCahf+KYNE1A==
X-Received: by 2002:a05:6000:253:b0:332:d84e:7fc5 with SMTP id
 m19-20020a056000025300b00332d84e7fc5mr1129911wrz.53.1700815289535; 
 Fri, 24 Nov 2023 00:41:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 00:41:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:15 +0100
Subject: [PATCH v9 04/12] dt-bindings: phy: amlogic,g12a-mipi-dphy-analog:
 drop unneeded reg property and example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-4-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oOPbXDBk3aIjcohZAd4QtWQn75Ng6fL6sZ33nsFIHDg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGvi+SK2D6szCKmhAOwxD/2QkmEkYDKCfLNt3LA
 z+A/wj2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhrwAKCRB33NvayMhJ0ePwEA
 CZkwqf2CNqmVAwhMX0mZ6T3o+S0SegeVMlwXXCEGDJEr4YPs+En7dabAcfzM+Cz06Vx9Zc/iok3MkR
 3l/Etm2uXi7mRQMPmkwioAgKInUhxH3cZikmdPzcDPpmofgII8wuYs7a6cYf5yTXw6pjEApR0HtiUK
 YdDcEJUhCQVntgWFS7k4cYOHvojsRtTeBtAkFN5Juedqh+/k0QT00muBYoiaDzpv0I9zKIFwAkQBaw
 +vjAo6H7OB7DxHTFN/rzL07P6VP0hKpn0A4wBml3xMm8pyzBrLTIeZrC/XNzMPnZMuEXc4xcLqcD0+
 yYfCnlrWlC5RdOY9r3O739eRSaT1sFV+CdPSYlZfmNytYz3scHVC7lvOFy2amjLYR8cIj44XpVl/gq
 nvCrQ0L+Np3xv3IAVNB+rgNWwA0Y6X+AdDc9WeR/N+tkIgVkRdOJbKwa+Tz5TQnyIlIn7H9+9kcxjr
 x9kHQzecSDOjxwkeDxnQoFYjq2zLIAtazMFXw18qKpIHytQKCVIwesOCK0vmh8UhcLPht/tvo5jygg
 6GmyPFvso6780JXtf4XZgJtV4iJD0kRG9ADaiFmlhjAj2c8tE9QBNiE5JBHZ9HwatytJficQUuOMYC
 fJV2oR4Qa4KbVzoK8OChR68Wmrx5JW1EE0Ye5nsmZzGraDCeBQaMd1wYGBkA==
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
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The amlogic,g12a-mipi-dphy-analog is a feature of the simple-mfd
amlogic,meson-axg-hhi-sysctrl system control register zone which is an
intermixed registers zone, thus it's very hard to define clear ranges for
each SoC controlled features even if possible.

The amlogic,g12a-mipi-dphy-analog was wrongly documented as an independent
register range, which is not the reality, thus fix the bindings by dropping
the reg property now it's referred from amlogic,meson-gx-hhi-sysctrl.yaml
and documented as a subnode of amlogic,meson-axg-hhi-sysctrl.

Also drop the unnecessary example, the top level bindings example should
be enough.

Fixes: 76ab79f9726c ("dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY bindings")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml          | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
index c8c83acfb871..81c2654b7e57 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
@@ -16,20 +16,8 @@ properties:
   "#phy-cells":
     const: 0
 
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - "#phy-cells"
 
 additionalProperties: false
-
-examples:
-  - |
-    phy@0 {
-          compatible = "amlogic,g12a-mipi-dphy-analog";
-          reg = <0x0 0xc>;
-          #phy-cells = <0>;
-    };

-- 
2.34.1

