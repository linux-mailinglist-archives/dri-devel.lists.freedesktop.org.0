Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1AA7E65FE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39D810E1CD;
	Thu,  9 Nov 2023 09:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3124910E1EF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:00:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4081ccf69dcso10307245e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 01:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699520416; x=1700125216; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ITFrBsMzRnXjAnS6fzAeCUU7VFisCXzwG4lcariYq7Y=;
 b=v4nqiazmXdQd/fBsFBd3x7wjDtUyi6cSM2cu6usB7g0VL1/exMPYQj1hh7jovLayhX
 U1rf92ijNHXOuuBsaUoertJ8+sH7HDQ6oCxMVIgXI3fSt+iispy922jeKSinCM4iIvG3
 O0Mg752x5J8HuXjQnnHXgaflbr/Ve5i+PVBnDXgJ4atYcgpEX4s1c03UTtHf8UTP5HPv
 uNjWnaxbZVzRwV2Ht9M9Afn1zuSn70zc364VOkGElL5zQfZbhcN6Ut1Z66zOmr3iJVtq
 Vm0cOm5Z/KZMeHScWjpvJQ6n9z9TM4RyfR6aZUoilu+RIchpGFvKh+ppiJ5LdBClpiN1
 +qxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699520416; x=1700125216;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ITFrBsMzRnXjAnS6fzAeCUU7VFisCXzwG4lcariYq7Y=;
 b=wOTKUZWp1+2ZOKbRnsHYyX3PEhwKSXjl7PTEQ6F2XoGHW7sdkdv4FqPEYBqmuVvMUW
 mARLJ+yJII56TLgnovhTaUNBHYQFTIvPLngef8Hlhv9b6zVxbUiidy68yDucqGewhqA1
 qGZ/KmBl1ot8r7XmukNR3jDOGDsZg38P7OLWvCvSvZK+O7ykr3Hcmg3qe2lfoONnBfdm
 nObBIMvSYxyHXLiBJxtot9NDYGDyQCZOeHFvYezjZfsBig028OlWD/orWsQavkyhoXC0
 0T80v3zEtPfNlEiu9EKFfJfbnbeWplpGa5AwSE4cawa3gHsEDLUmS1Wg6hqL0kIc+15I
 aKXw==
X-Gm-Message-State: AOJu0YzL7LD+QuvDzdFADYYkWRzttZlds/7xPDMKnYg86BFDmezy4hQ9
 85e8l7MaZfpmh6ICNn5TeYtvRg==
X-Google-Smtp-Source: AGHT+IHjO+bTUUKrJCY9qJI6PbshUNq9k86eOeJoeaw8Z2cXsPrb59IOUhiYM5nWZGSaAIA4THxi5Q==
X-Received: by 2002:a05:600c:3548:b0:402:ea8c:ea57 with SMTP id
 i8-20020a05600c354800b00402ea8cea57mr5581601wmq.7.1699520416613; 
 Thu, 09 Nov 2023 01:00:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:00:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:04 +0100
Subject: [PATCH v8 03/12] dt-bindings: phy:
 amlogic,meson-axg-mipi-pcie-analog: drop text about parent syscon and drop
 example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-3-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=uz/zvzsSZxXVZUEtWgeIKFxNonTPWkXwn8B0J99UAIs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+WXcjvLMOnn8fmBl3USzfGqu93t/BCoKbOlBPn
 Hv552+qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflgAKCRB33NvayMhJ0ee7EA
 DB8SNulWBCaChemsw6runu8nf4gmvFIJZoGuRwt/vHyNwD1V0VTJBsWBMA5V5Gh/nfb+7oaE30EMuI
 3q1gYVfp9ISlsFbqq3OWfgvUlITVjBC8kqfrJ0+ZWN7Rhyptjba41o7IckERz1gzsgU/cB2ASy4fuq
 +ysDaWLeNJR2G+ZwZOeetPzp6tnRDdSdMbSyOtKS0mMl93VLzFb226XvQ14IK/zcGuPVb1YY6sJqi5
 Gilhooh1Q4Epynfu7v3gJ7YfgQt3SCfaoHllwFtsfP2Owe6A6Iasj+l7cB/CMIACS4jSZacvc1aJsK
 4EGeLSO6ZnZ9mpbw5FCwspuBh4Mug/Wtu5oxqbTB4BqA6jwfrQzrLc/70MauDw0sSVa0EMnv/UmlGl
 SdHPs88PTWV4GBtPdRKUSDJNQkqDc/EyGJ1xhK9DF1bnDnaQeAqHkLuUCVo80qwp5Cx7GZ00w62j51
 UwAOncWLeCYvpkOKKeoGj17j9/hLce6m9f6l6RRM6FIb9GC7c5Sg8/xpLY3UBafFD6djO8MXccAUCT
 rqpF5Rj2zS7K6acr7tA/a8CXlSfD/Md+tw6hO5qEG1vbArWfnUgv8NdVyMghEcXawh80TH4+gSCPmC
 QAr0ywKT2RjfuzCynjsFZutbI2JAVasPMsnmHJoNl+baRtCw7d9dbdGz70iA==
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
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml, drop the now
useless description about the parent node and also drop the unnecessary example.

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

