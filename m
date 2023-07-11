Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562AC74F3A7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 17:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4976C10E3C8;
	Tue, 11 Jul 2023 15:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DB510E3C7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 15:36:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbfa811667so33587265e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 08:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689089805; x=1691681805; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0z5zfDlJgblDPbH90jQkXFb124rj0cRvmHZvcD3c8U8=;
 b=Bf3HZ76PFgfk9RlSgcgP0opND/p+2ccJZ3qojqsfaH2pPZtwAfTO220Nvj9NltJ4y5
 OfiMPDE4fyb+MUdbJG4bKJLBLAHRybOSFgBxbR0nFFkdf6+e8q8blPW5xTeMbtDLvxHV
 CWxAIoY39ESXd1up+JFv5Ve7aDax8rtrxkQqEIRj1xzLdWdD9Ow3241EkvpFm4IR0Iqm
 UGBEI08vMzKDuoybIn4hV5TCJ1tNdD462Ab1kJ9sXmxtBdWDZ+I45Kj1g3eGvnDsySC4
 MHkD/2TAGu9Fd/65O2uLSV97rtfkjeftOk66frBFAAhUKFZQIey0iY5qBUknwt64Jeb8
 rcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689089805; x=1691681805;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0z5zfDlJgblDPbH90jQkXFb124rj0cRvmHZvcD3c8U8=;
 b=dadrDvvKAkbOEBWFDBR9Urdjm6UvPy7cWCGzB6Gnf3NAPaUrpAcbG+vmtr5y3VeTOZ
 UETrwJyYJpHGNCawudDa0NQGSA+1aO8tLB392HmuXa9w4ivZxLe++ODl70Ol6tu7uOhN
 YCfZQ48k6exOEUTDUcfNvKKXmGq9DgSl/8PDl61DuafxfombDqVUYedhPrVo/eCzxdTr
 WTQAeIYAAXfKqmxowR/Z1Yz6b187JfGPm+slNARCTW1NGGkWTZjv/l7xQA4JqfB8n3nl
 lENyX8sgnKRNAKJ+CXrXRkRuo+DhKkiokzpSFYZ403egmtarBonKF+I0TUKshfEpARMy
 r5uA==
X-Gm-Message-State: ABy/qLZIgDx4C+REovc78IDsnAvLJBA3gZ67jLsGvAzmwSCtVpZCPRoF
 6XAO+KuhO6drtfIDYSFhvLn/zQ==
X-Google-Smtp-Source: APBJJlGXl4MDx60dGT+c7tQy3WNO23yUwT+V+1UoCMmX8/AIFycfsqE/pMSrZFmBZr2BvXHFVU7YYA==
X-Received: by 2002:adf:e4cb:0:b0:313:e88d:e6d3 with SMTP id
 v11-20020adfe4cb000000b00313e88de6d3mr18617688wrm.14.1689089805644; 
 Tue, 11 Jul 2023 08:36:45 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 v6-20020a05600c444600b003fbb1ce274fsm23458249wmn.0.2023.07.11.08.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 08:36:44 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 11 Jul 2023 17:36:27 +0200
Subject: [PATCH 1/3] dt-bindings: display: panel: add startek kd070fhfid015
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230711-startek_display-v1-1-163917bed385@baylibre.com>
References: <20230711-startek_display-v1-0-163917bed385@baylibre.com>
In-Reply-To: <20230711-startek_display-v1-0-163917bed385@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=Ujtb05N2fW+fMaNciuy01iapDl7k/u72Jx17MuBLiFk=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkrXcKfA2fh53Jo+c93oTbDBoSEtklb31hP5a4QQZQ
 L36xEaKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZK13CgAKCRArRkmdfjHURUo9D/
 44vQp6rRjJZELHD744OsROc4RSPqUfaqI7iGNPo2K5nE8hUTjDyTGZs/uOx+7xgFPhkim27iR8OmR6
 yGk7L012x/+lhRx1MdcBZtUW9IKgrrU60Z1Ljr6RIL8oKTHf1RhGhGBPZQO5SCVtzvTPfKDPHiFe4A
 yvHq+Mk5isCsQ3c3zx5uX2jfJ4r5T8T3RInVeUxpgt1s8BmlcYpmSIHIGeJ0RnZ5GOZtIkzXf45YoT
 Ay491CMz6+AZ1RuTqffJnVD8xSiYdiqRSAzmjeyLjpoON2V3f2ezA5BxvpGFpRRAawWVhOd6Xds3W8
 pv4rgCSuglELxhOTQ+z0Y0y08JhMRdOKETM5AaW6EeXodRIO1lWfLUkZzODdGC3WhxHHXboZ0StrHP
 VvwvpTvs4pgDL1zC/sM2u1llI2V2T30K0LLWIB1Ist7PzFoHxZDBgIZxPkC652flJU0HXFkB32dIWp
 +E7jZJhUyDHceICDDaYax6qsk3NraU+oGelTsIISp7+q4svhUdkdU8DZHpYopq9nTExJSYXAp+aPTU
 /h2U5XgSidiakTcnY4jbn7ge0vcvbgvv+MJ6qL1D/bIgHj1G1JtelVZhUZGWXXh7nv8KlsyBLi+Ysn
 5J/bY38Y/hJU1/gQASy1PpfbaSgLJaI1hrY2vULFjq/beLur+J1mNWg/i2yg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Startek KD070FHFID015 is a 7-inch TFT LCD display with a resolution
of 1024 x 600 pixels.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../display/panel/startek,kd070fhfid015.yaml       | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
new file mode 100644
index 000000000000..857658e002fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/startek,kd070fhfid015.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Startek Electronic Technology Co. kd070fhfid015 7 inch TFT LCD panel
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: startek,kd070fhfid015
+
+  dcdc-gpios: true
+
+  height-mm:
+    const: 151
+
+  iovcc-supply:
+    description: Reference to the regulator powering the panel IO pins.
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios: true
+
+  port: true
+
+  power-supply: true
+
+  width-mm:
+    const: 95
+
+additionalProperties: false
+
+required:
+  - compatible
+  - dcdc-gpios
+  - iovcc-supply
+  - reg
+  - reset-gpios
+  - port
+  - power-supply
+
+...

-- 
2.25.1

