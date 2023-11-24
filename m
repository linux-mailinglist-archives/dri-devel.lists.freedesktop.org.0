Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE547F6E7D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8791D10E7AD;
	Fri, 24 Nov 2023 08:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D0610E7AD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:41:30 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-507975d34e8so2266571e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700815288; x=1701420088; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=m2ZTLCIzGtDzdo93FJ4l2pfkops6GMcXVN1dXIsoDYI=;
 b=y56ekz2y6/PBfCrLDHw6L+TAS4HpDcYSvuMcDYlVAncKiUukZJTZkQdUQiS+nb7xba
 Oc+AS+ZcTxTsSoNNXVpeABwipeQ7yUDS+bhSzvjhg2rEwsLi569kEmJx0vbQi7Vwo14k
 s+RphdVFZIYTvz+on/A7MPPR7v7ktI2KsFOW1LUIwPV3g9jhkdk71sjqV8OKRyTbStKX
 2F1DuhIcUuUiUNCb3dmtfSsZFEogk1xBrIrY+ua+RgzFfgxlyArOO3KGuLP7c3HPUMBL
 nlrV8r66WE3TMIR5Nti7QC2Q8Go7aNb96OeRNs5bOhvmAnYlKro0/AhE4aTThj97woo9
 7E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700815288; x=1701420088;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m2ZTLCIzGtDzdo93FJ4l2pfkops6GMcXVN1dXIsoDYI=;
 b=KPqBh+swgVLMEjnx6JiF6G0Ilxu9K59shugM16fb+r3undalVr8VzdYygfzfK8d7Gz
 nbstZS/a6F8ClH2vK5QDAF+4R36ct3QlDkQZvB+nYl0CYL5UnPpHdW1yHCDRX4ThHdjV
 HKvMZPDlZ72h9oECSr9OyC+Khw/Pwe77kcQNC21QpxHg9Rtbur9hlnxfXaFKWhJ57e4p
 x3D4dCoGegtEED7We/9eQbR6b1bd61xICqqaUCJG6L7Uvn46/vS166q1JD0t8lIxCEvD
 aKrAoRv+7kVocZxSkADBc6LrMZGKtz9sm4ci8pfgmjWwp8fntiFf1dfSCiW+5Ut1UvBb
 JhhQ==
X-Gm-Message-State: AOJu0Ywc2ApmlGMi4sJFRKbG9LHH3UqM3KqSlq/K1q9cBP5henfPyfRy
 ymgwQ1WnlIdHE4AXKlTQB8ST8g==
X-Google-Smtp-Source: AGHT+IF7kjc01o/SSdybHjyNhj71mp3t5jB+vgaS6Zawv8K1Yz8ZO/SXKRCN8wCpxqC5dFcGrXnmPg==
X-Received: by 2002:ac2:48b0:0:b0:50a:71d8:c94f with SMTP id
 u16-20020ac248b0000000b0050a71d8c94fmr1135313lfg.60.1700815288264; 
 Fri, 24 Nov 2023 00:41:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 00:41:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:14 +0100
Subject: [PATCH v9 03/12] dt-bindings: phy:
 amlogic,meson-axg-mipi-pcie-analog: drop text about parent syscon and drop
 example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-3-95256ed139e6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8X7fhNCy/HvwIwzbk4yey3zcZzSI2bVpb2v4gVLXFlE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGu31exqQpuNJfZ3NjzAF/oHsRU6ubp/jrWqLQT
 WaJLbsCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhrgAKCRB33NvayMhJ0VZEEA
 CD9QWyKz5JqJKUffivHccIDuBx4b2ZX1upUOn4LYSEVYLaEcJbOEb6eAX5QsIvTezN2HvZAOD/TF9X
 9pmybusblHc3qqagjwruVann9xFjxmVQCB9SWYGaaQ0kQYjPaY5PMoVHthzTo9JWLHJSz24rKrbXDu
 xLpfwHLzURD2kOC43HpN66RtC1etfxfHeGOidg6loQOI04C9jg8vbuQKk7i0kIDBhl8PiFEJ+wgw6L
 D7M5mAuFYh9Tbd5Z5hbpNP6A+NahpX86HYi2TeKEMOMMCD92TqldpuV62F+Ry6VSJLYPVXi4i9FJ2y
 BG4Ix/aRkBZrVNcPjfiOppcPJ0kO+XcRl3EUpuMo/bjnARyq7bqZoHTiJ+VMyLwNo/K5LsaelA5kmv
 tA5YgY9gVsjAhiCEvOX8bGnkrRYLI6rINhOz1VqeVgbhFxOkYVfICfwTIaVpJmfniwQ4jOThbthyjO
 CAAKJ0dXfO51MW7CDFudjjcdwaRBdjl0nEOEWQgIe/adFoJX+l1iF43Lq8JJYTIF2ignclF4V7fEdO
 ihz9RrW4apafWFspszLmJDMa7hi6fS04cXDWU+4GidaAXBkpZmoJpvuwsx1qgdBLvOr6AlDgFvKXYk
 z9mvyPn/fy3OaYQofJppI6cR8w4scLqA3Bd7v8qyOdKyjBKiNATHR5rXnrrA==
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
 Conor Dooley <conor.dooley@microchip.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml, drop the now
useless description about the parent node and also drop the unnecessary example.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../phy/amlogic,meson-axg-mipi-pcie-analog.yaml         | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
index 009a39808318..70def36e5688 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
@@ -9,16 +9,6 @@ title: Amlogic AXG shared MIPI/PCIE analog PHY
 maintainers:
   - Remi Pommarel <repk@triplefau.lt>
 
-description: |+
-  The Everything-Else Power Domains node should be the child of a syscon
-  node with the required property:
-
-  - compatible: Should be the following:
-                "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon"
-
-  Refer to the bindings described in
-  Documentation/devicetree/bindings/mfd/syscon.yaml
-
 properties:
   compatible:
     const: amlogic,axg-mipi-pcie-analog-phy
@@ -31,10 +21,3 @@ required:
   - "#phy-cells"
 
 additionalProperties: false
-
-examples:
-  - |
-    mpphy: phy {
-          compatible = "amlogic,axg-mipi-pcie-analog-phy";
-          #phy-cells = <0>;
-    };

-- 
2.34.1

