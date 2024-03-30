Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE3F892928
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 04:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388F410E39D;
	Sat, 30 Mar 2024 03:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hCbLKlj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E763310E39D
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 03:59:32 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-513d247e3c4so2389678e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 20:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711771171; x=1712375971; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nEHv7161rF10nD2iZaJbFgvPRz2VUElIFclun8j93Iw=;
 b=hCbLKlj1sdJbeW/ZCAmaiBOfaICaO8ac5FX6OJFGOk5x2L76kF7mh+8AyCu1KKIHua
 OaL+XYBSkJZMpfknwRNHmjChseQ2D0726/7UZWfn4IiHPAhnwbOfr+cR6WpARFbSI5cZ
 JOcf5cXcQg4apNL6MsG+cG9Ol3SaYW/JNiaJzFhySaujzpASsBFbV21LpRyvs2UL9BtL
 RR06FaRIxU7ouEZffDKRjxBZl90Of0GPlgHbsD+xUqcelXM0oIlE2qyWf74M9r4bywg/
 US8g3hacHt/AcDegW3AROuhBfAL5CTWbBFpnuhNf7dUf7T1PlvvYKPaplEdANZPiPq1w
 x2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711771171; x=1712375971;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nEHv7161rF10nD2iZaJbFgvPRz2VUElIFclun8j93Iw=;
 b=lkjHh0e+VF8cjgm0fzwWf6D3in1laLoiphThEIAu8FFVFmOtojutX0EUMZzPNWbcsU
 +V36b/55TBT8V8y3wH+PzBFmncK4mrDLnUuxME8ANs18SDgY/lM631slcg4r2ZREF3kw
 up6J391quPsbVsPBmKFJ0VBlZj4kZGcx9gc+VFwixpQdxYGGpUT0xuNOR3YNKTK/FYv9
 QAuN1yk3qwVUUxLt8QojkFIIUn/EaN89F1lKFARc8ZBe11fPNbtWkj4HMbZZcBWZOvaY
 4vnPxIW0rp2Y+VsF/ENwns/UV81zx5ib0iK2hSZNa+U/2L3CB2i9NWPTqAb7nVI2hT+V
 PQNg==
X-Gm-Message-State: AOJu0Yz1yBEgJlCzoqiNC2N1QmxOA9Hv+pIBpw4C8mzcfJ1ceBL+iM4A
 H2t3Xt3q0k+z1ms5HzRXmqCG2JsNKDjMDq16xzFA9Q6wQ83kXgtHQxp61RmNMP4=
X-Google-Smtp-Source: AGHT+IE1ThAnidcAuJUVgaWX29h3ZaFTTmFMn3wvVDDkWWIpuaRfERN6frP0sFDgQn0vjwNXMb6wXw==
X-Received: by 2002:a05:6512:3b8d:b0:513:922a:4334 with SMTP id
 g13-20020a0565123b8d00b00513922a4334mr1661298lfv.1.1711771171043; 
 Fri, 29 Mar 2024 20:59:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 br2-20020a056512400200b00515d1393f3csm423957lfb.104.2024.03.29.20.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 20:59:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 05:59:28 +0200
Subject: [PATCH 1/3] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-lg-sw43408-panel-v1-1-f5580fc9f2da@linaro.org>
References: <20240330-lg-sw43408-panel-v1-0-f5580fc9f2da@linaro.org>
In-Reply-To: <20240330-lg-sw43408-panel-v1-0-f5580fc9f2da@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LJ+girYe4vykYjxl7S4n4qmMz70uzdqbzojIgAwohpA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmB44hkYXDEZ4U1NN773kLK8OhcQ/ESozP9fWl1
 6XuWJvjcSuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgeOIQAKCRCLPIo+Aiko
 1YwHCACTsVHb+AVpPFVAJZeqrxDPnebzaXXZ/O+m+gWCihSTksXW7Gac675ctl4z+1HouDBncPg
 c8NqCesf1zSkhB6cZ9frhnjvw0ruayMxBT5Zc4BRNohFGv7Urz6TZ1/++ylmGBCZVpvvvEIiP4O
 1dkz1t1/EH6Vn3l9deKIiHqsVZxErRmZHWU96y95BJJc6Fd3dwlipgy6iSBZJorrrokMw5E2gTJ
 IdnD2wX3506sW1Vq0T80gc35BydEVKi502pYN2itI8nv5pHrMvyeEEnZLMqp9s4I02EgxoSAhWI
 zDqreN34UTlIpRoy5sWYQ2kmxkIVp1GoEnkdCHNr886ueVko
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

From: Sumit Semwal <sumit.semwal@linaro.org>

LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel present on Google Pixel 3
phones.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
[caleb: convert to yaml]
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/panel/lg,sw43408.yaml         | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
new file mode 100644
index 000000000000..f3c9c9343c4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW43408 1080x2160 DSI panel
+
+maintainers:
+  - Caleb Connolly <caleb.connolly@linaro.org>
+
+description: |
+  This panel is used on the Pixel 3, it is a 60hz OLED panel which
+  required DSC (Display Stream Compression) and has rounded corners.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: lg,sw43408
+
+  reg: true
+  port: true
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - vddi-supply
+  - vpnl-supply
+  - reset-gpios
+...

-- 
2.39.2

