Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAE4B48E8D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 15:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA0010E529;
	Mon,  8 Sep 2025 13:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sp4uxTUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B43910E523
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 13:04:29 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45b9814efbcso36001055e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 06:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757336668; x=1757941468; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=w3lH/JWdCi466yT+Udujas8igi6yje6X10bcnQeYQ7U=;
 b=sp4uxTUZGNgTpQ8DzvqKULPQWEiREbOkSlrGJlI0Fs2erypFcxs3/sdOJZusmeq/ez
 lrSmpKRWK/HKseE8KyLpCSbFehge+O/qndeZS5AaOwLnhKSrNAOk3AoFYfsQDjeUra4I
 qqvMUvaXu4x9+IKk1YWZFwlNUgQqnjBuC23xV9RnsC94OrCGoWwgXzUq7bx6QkcqXez6
 e4Bcy2l7+V+OyS37/Nuy6aNbXNNMJMJvIc/98ouWjFCKhN3DdnWaQKwTfJg0dQoquitJ
 490hAEpOhPYGnTg39yDLY7jvjdk1AOfmi7bHTO3tLnyGzPE65f7RtRoVuTfcjbmnYicQ
 5z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757336668; x=1757941468;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w3lH/JWdCi466yT+Udujas8igi6yje6X10bcnQeYQ7U=;
 b=tqnAmuFqDC5iDrrXWiQG2V0JbY101C0F5oF2Fwgwz8D0nAORyKrFm/4kTr1LoiE2gE
 sXDvfXVMtlU8pvpNiPmAgXEDW/DpoR9BKaRmETlp9SJ2J0CzwkSIRa1X8YNoFLPZ1Iwv
 6YzHedN/lhYQb0w+3nKE1kcDD/kWFuMtt+YBqDqJhfc+DZqqBb/3sFpSFW+oxys8uygP
 5miJtLQyyupo0rs9oL1KPVy6LRLmNMSU/5Y3E/xK6YZPG0uZR6lmbaTeK8CRtV4ZMjvo
 O46wPRF69je926yXjuLoh9dImew3of01iRdfKZ77A4I2DCE5Ka6m9EZeBrHvLMoVZdS8
 PXMA==
X-Gm-Message-State: AOJu0YxDWcN8DpiCUe+XOrTJ8AcC0O54RH0w6AcqBddzjNTOXe26hHvd
 b9JN7EMmBFmSDHe7xABOxg6k5EWcWKPB5G2Yzqz+UoA08Sxy98TwXAS9tEzoOPKGTLI=
X-Gm-Gg: ASbGnctw8tyEJ/rFuh9Lty9ddvDQSWJu41GJRfDlVQutc90UHr0JzXWUBm+ehzf2Hxa
 VVqgkOZgzlkFZPt/ttL3ngCniP/rlspXJHcaAFqHyds7EOx4HugCSijOyxu04lMbUNdVVX/mLx5
 tT4PW4kf5RKGc1cNiGNKK1mSOiYO1wwXvEtwj+BqrGJk0CkzQF3L6C4MME6TnRGbFS3+oAmZ0L4
 +bD9XQAojxghVfz3Wr2Yu4IQNiAbjERGBcj5lFzflB6SZg4LDVuUU9m4n/6aDWOw/Ch8Tat2syf
 PngVCi1ao/zyYC58aTw1FzRzcCyIfgEssc8rfhbESD8SSqGLpFGyP4lJH/3Zio5Oz/cdUU/ldQ8
 wDBNlw8wILA5FEHS5AWonyFtEa+JKa7ISenzdcR0lLvKG9vZt68XAIw==
X-Google-Smtp-Source: AGHT+IEoCJMvrySbDq5jyk5RqjV0NPwALftNDE3q+qWzdFdOy/QBMsqqG1w+PllPiaKresF5LY8s5A==
X-Received: by 2002:a5d:5f42:0:b0:3bd:13d6:6c21 with SMTP id
 ffacd0b85a97d-3e2fa64c720mr11205775f8f.0.1757336667919; 
 Mon, 08 Sep 2025 06:04:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd6891d23sm145632475e9.4.2025.09.08.06.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 06:04:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 08 Sep 2025 15:04:20 +0200
Subject: [PATCH v3 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-topic-x1e80100-hdmi-v3-3-c53b0f2bc2fb@linaro.org>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
In-Reply-To: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3818;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=l4jGjPnr6kkCLH/MgyK2xCnnHwY9L5KdNaTbIaLUKls=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBovtRWHuZlAgozjbJFii6xfRJsDGdI6qiUd5eBIkOO
 gHg1sbqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaL7UVgAKCRB33NvayMhJ0VO0D/
 wN1IoFM+6iDMczeX69C67hBvvLtrQstZFRcQP2yOXqNzF+BNoOKcHNvVJwlesJ/bhhkmogtc/gYBG5
 4XN3Nh8lpDkzzH0uHemVY143GefTfB9r2huYqAUa9QQS+PHrWvDRPrsZnTlkqgim9ETpSWSY5XaaY3
 H75bzT+NVggBudkNCaMUgqU5MTzpuftNb3q80bQDgNCuzrKdNCwqtGGQ+4GGBKYJvXI/TMHT9tb88A
 zk9Qg7hq0kDunLwjNODM8+iMRPqDsi9VenmJUejjO/4Qv0Id4+4c8SXMx7xNDCGcdmy4X2PhUD+/vZ
 tuBuhdooBoUTXuL1IsBaqtg40K9EUY+pwAlTGfZr4WROgsgdmJ8o+VMsdj8bC3fGxTSAo7d/0H1gpG
 fI9wHZbMZkgvxbFhCWedjMDD0lRymsX9FR6z67Kg24aW7df04l62Sinpn7G+v9f7CwdtqY2z3RruP2
 prGrPv1UHPtK0RYzkdBO8ZNpO82TRCla3tvI79pzi4BQLnM+BkqLiz9IL2/phpG6YpG+GDThG3E4EI
 bUnLnZdlap7QuzJ8beN0t3zc5VHCQo/FN0qn0pJpBow49cDWzRVgbHrJr5i52VwvkUhge/6+4782Nk
 Mrd94O2dUWbZKQtUnToaTfid3nnf2bZZOL0lei1dE1+cP+ZQaM7bYHHRczxg==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 2 DP + 2 USB3
- 4 DP
- 2 USB3

The layout of the lanes was designed to be mapped and swapped
related to the USB-C Power Delivery negociation, so it supports
a finite set of mappings inherited by the USB-C Altmode layouts.

Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
connector, DP->HDMI bridge, USB3 A Connector, etc... without
an USB-C connector and no PD events.

Document the data-lanes on numbered port@0 out endpoints,
allowing us to document the lanes mapping to DisplayPort
and/or USB3 connectors/peripherals.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 59 +++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 5005514d7c3a1e4a8893883497fd204bc04e12be..51e0d0983091af0b8a5170ac34a05ab0acc435a3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -81,10 +81,67 @@ properties:
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
+
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description: Output endpoint of the PHY
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            description: Display Port Output lanes of the PHY when used with static mapping
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 2
+                maxItems: 4
+                oneOf:
+                  - items: # DisplayPort 2 lanes, normal orientation
+                      - const: 0
+                      - const: 1
+                  - items: # DisplayPort 2 lanes, flipped orientation
+                      - const: 3
+                      - const: 2
+                  - items: # DisplayPort 4 lanes, normal orientation
+                      - const: 0
+                      - const: 1
+                      - const: 2
+                      - const: 3
+                  - items: # DisplayPort 4 lanes, flipped orientation
+                      - const: 3
+                      - const: 2
+                      - const: 1
+                      - const: 0
+            required:
+              - data-lanes
+
+          endpoint@1:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            description: USB Output lanes of the PHY when used with static mapping
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 2
+                oneOf:
+                  - items: # USB3, normal orientation
+                      - const: 1
+                      - const: 0
+                  - items: # USB3, flipped orientation
+                      - const: 2
+                      - const: 3
+
+            required:
+              - data-lanes
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port

-- 
2.34.1

