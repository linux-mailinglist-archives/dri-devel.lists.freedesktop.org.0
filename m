Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1EA7E6605
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1523010E1ED;
	Thu,  9 Nov 2023 09:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902A910E1CD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:00:19 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso4095475e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 01:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699520418; x=1700125218; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JrO2KXQhu+sFkGuvNniLZEdI1TmrpVNM0kvtI/PbIVE=;
 b=fyzsx09+sDZn8aa0DN3AMlfcIS6XCtgqAcPQPO/DtUE9dWkjEiRYfzFpBx5zMtEQgS
 UvGdBuSmTUxipWrnUsNtfca0YKqOx0gilJeYsbbaVXhjRaH4zZKKOsmnVvCKwc6XUTeD
 GecUp4RfuhnDo+S2Jahg/skvZN/DQdiICRFijvncc0Xrkn3eXrGRS0jCJ/tOHpeU4EFS
 kP4II82KQFHqZGv0olUbhL05Wa12C9rix5vJEg62PrCd90Gj153QpxOgwmjgnrIy55Pe
 iHc+eq08KN5s/7Jxzae+ecjJuaOKXCDHbf93qD/y9C5ZAajyUrcyGtsEIm5bjxEMKLrZ
 CWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699520418; x=1700125218;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JrO2KXQhu+sFkGuvNniLZEdI1TmrpVNM0kvtI/PbIVE=;
 b=l50Xjm3sOZsvwjfsQf/lwYoKhLS/IWZnbWC5Bj/zFsegXluNt+DxeHI9HA5z4SVT4B
 rCYbG2kzWPRG6mF9FDJjL25+3HclveM60Y9/U+PIL5h00w50ZxZyPohu5zXOZmn7r1az
 i6+ZJUkvXUPSivT2z2aVpMUGh8aj9bo3Iia8rMSiqUzcgzmjZKb8T1F/0hJrtdhOnG3a
 5PglLi8tLS44nBTk9CluI2O/oOKWXZNDdP8rriZa+uZ9gTzvqQ3jlVcKZy9UFWk7cxtM
 nAD/DuF6uyWJBNvpKGaryK41tjs2btpufctaDEtaA+xl7ALGLXVrA+Onp1IZZJ/FzdLj
 CSMw==
X-Gm-Message-State: AOJu0YwMcJLdS69zTA29xmEkyf1uZmrU+PF+tvIoPLMdUCQrzVqenDn1
 tH2CT+q4u7o6crLSQbzi98cPvg==
X-Google-Smtp-Source: AGHT+IExaL1sx8nDn+rJD854g00atvCrBi89tjscYYozw6EEibCZul8Cp/47U7ttMGU8Qu5+Bh9FLQ==
X-Received: by 2002:a05:600c:4753:b0:409:7d0:d20b with SMTP id
 w19-20020a05600c475300b0040907d0d20bmr3758579wmo.24.1699520417969; 
 Thu, 09 Nov 2023 01:00:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:00:17 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:05 +0100
Subject: [PATCH v8 04/12] dt-bindings: phy: amlogic,g12a-mipi-dphy-analog:
 drop unneeded reg property and example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-4-81e4aeeda193@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CRQwljGCl55mlBg//zbF+X1DQ9wf5iznuCDzWEp0CuQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+XLEMPnR15x7zvUzrwjt+1YsganDZBalmGC+RA
 Tf2EoGGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflwAKCRB33NvayMhJ0UnsEA
 C3ptUF1pzarK27aLq3ZZOcI7vsOeQNmB2GL83mvBZGwxGnMdToCwxC2k/nnjtzd7yBcEdsLBvp/iHP
 f83oTz7PiPxdPKaVjuMFnThXlUjx/hYnp0ZhSXKveK4kYH7bYh/6380ZVHgn2JluJHnj0tgnQyaWyI
 PvL1KM75WnOWcOJuqhbT+HuMkrFo8e5WIavxSUI8hA/QFRf8S6FsfF59OdUmjgtMPaGkyPdWKBeLKi
 TXrScBS0e67A54pXlGh+LKFGgExlH96OyDpz7ObKrkEoEgCtA9ppZ8GGhLfbPmL+i0W0hgKuwJVB9r
 wCabgDTqfkkdOYY9Sgga4keMXAlfnqZcAohZ8JfVnBvF1GVG9phzg82WZlXAbPB0ksXDl4q4vopKO7
 kBZRhAjbL+Rr4a73Ys1b9t8/O6rpuqRf/r6q4m2fXHUvnE2fZnfyxOgNg0OUHaY4T1mjyipGR3v76s
 6fomEBEZz/gxC3+KVN0LnzaMfB/zWaxEqmNJx6JjUmf387UFUFYO41i4iJy9Us1dj5p4vF0m/CmSpL
 tXrYMtAEd4C5w7PTsXBIezuSTipdZJvew2jYQUP6ylkVQtwgwRyHF3J4X5CuimCRQhf4JqVwXG2ve+
 CWmv0WlfK/uc3UYlVV1+Z4cT52PPrDmjgofyS+UPpJDYJUNYIZedj5m/lK1A==
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

Now this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml and is
documented as a subnode of a simple-mfd, drop the invalid reg property.

Also drop the unnecessary example, the top level bindings example should
be enough.

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

