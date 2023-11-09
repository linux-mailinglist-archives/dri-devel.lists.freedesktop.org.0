Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518B47E6604
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0136810E1EC;
	Thu,  9 Nov 2023 09:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA4910E1EE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:00:17 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50943ccbbaeso840031e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 01:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699520415; x=1700125215; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6K7DUEVq4k96cRCmEKG1sJThC51M4OI0/7xFjD2DU6M=;
 b=MPQwhSeed/KJxkl6mVpTbJoq+2hDDkjM2m4BXyHu/mq4BierK9zEbGQrKKaaoqFSN9
 FFeumGuxsFQBWYgDyXS5abFbo2t5I5xoGwapPAX+3gAeMqmMnXic8sQuACIZ2RTrbZ1t
 /d8GUvK0DDnEUu0kb/KGdN2b4AoXQlMweINJNJEOTxAsdFEPi07wYHrMowdsROFPGBYZ
 K0jXuCYuvBN4vL68xMa6T57DQKh7S7uG5VafdQGzBgYgtHwnTX38FqwHWUAcACkgaBee
 sYb39mNMsfbY/Pj9v6F11CEF8cAbogJMSkQln9RdpycCSQgyRZA7GMOWmrZ5Jj9zjUm5
 BYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699520415; x=1700125215;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6K7DUEVq4k96cRCmEKG1sJThC51M4OI0/7xFjD2DU6M=;
 b=QvdCmdOnrmf2huSugIuMZnv3nURMqvIFJqh2MhJUwswL1bLp2TXrUrY0c+K8EZXN9h
 cpXSF8vNH+jMJk1+XEJ61zOZTlXXehj6hFc9QiJNkGFLCevviqAP85AjDRuuZiffES+H
 XQ6zscSHv/r3xrBmkeed19Mt6n6S4MSFCUKvlTJ4RyasGcoUgvxzLfnS1g99MZnj0Bs/
 uSow988mJpi4v5RYilqv5bXY4aEyDbqwkAUziR1xCnEbI0LazYPZDzY6tqwfKzEC9b34
 GbqJIHlr2lbxRGon8i8lak9kZwrvjHQ6EfAgGDUC28dqzf+Lw5Hn7Sx1nW6vUerBzneN
 dlyQ==
X-Gm-Message-State: AOJu0Yw6vS5vTAWXm62aug/jaDTF/hc4cPphmHJtUfdNG0BABUUoq9Jm
 BkylaSDEhLVgFhv1uZD5iTEEnQ==
X-Google-Smtp-Source: AGHT+IEz2Rbo1iFlt5T34StiguUybmx8i+EgvioY2Ns+O/ShW48jCuLMnwyrfAfGKMqbX7riaX7U4w==
X-Received: by 2002:ac2:57c6:0:b0:507:a58d:24ba with SMTP id
 k6-20020ac257c6000000b00507a58d24bamr679052lfo.63.1699520415302; 
 Thu, 09 Nov 2023 01:00:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:00:14 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:03 +0100
Subject: [PATCH v8 02/12] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl:
 add example covering meson-axg-hhi-sysctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rmmUAof1Km7bxj9UDL4YQbyGrQ3/OWsBkE3eSPayK1M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+WfUUarmFrtbxzFNQtmTgHaC2dbjJQ1PfGYXCS
 oFk5R6CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflgAKCRB33NvayMhJ0WlFD/
 4hKPd2SlGH71MFNfm+ZCIgny4FD5hPppa//r4ijo8NA7FSXhj6/jUB5R0c9FSYxNGsGGqq04nqYk8C
 cf5cyktTaJKo8bx/Vnasl4/31menxzc6pXE+Bmt6LiPLnp1d4rBQ3nVMbTXfmDeFk/MuwC3mhmcU8Y
 F8LNr7TlDkehXBTf4uSBmn0oxUnCzAa3bfadgWBl150CGUiVYsCVPLOW39hDMPZ9HB+lMHrHP+Za8Y
 p6WyIsI94u0a/XLMeizJo2o3X4wpDz10TPZqG4K/osfG7npTrF6NN80D+rrQGiamMXqA1VRgZUrTmi
 Vbbk1IWLBoabQSuzByXTozIB+s1ZQToDD4NjhfWCikUCH8XB6ifCIx4AfBsZX+MA7HUbVZzS3jGhzu
 KYbnoJo4CkOfEGwco2WirWaCHqm7u5iScQ9JCr9lxEZeQBWq3PJblVO9g46F3Yv0iK8SRimwrKn0a+
 EmrfI3FexR/WJX1TauCQqDRNw0gEIVJUamq0HCmqGH5moqPOaTo+4z60vAIoIV3vGlQKdXdSJPdVAq
 CkrmWROc5NBP/xWL1ElTlGJYrh/iZ33+/hyC3OBv28ErZEv/e0UVbkql8oHnX1pUi7lEISjm8AAHJ/
 822HEqgMVQkcpeW0z95z0HJ+9JYPtasDwP5UHzgjHeFSDg1tW2qdx++dLQSQ==
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

Add a thirst example covering the meson-axg-hhi-sysctrl variant and more
importantly the phy subnode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
index 16977e4e4357..2edf4ccea845 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
@@ -158,3 +158,44 @@ examples:
             };
         };
     };
+
+    bus@ff63c000 {
+        compatible = "simple-bus";
+        reg = <0xff63c000 0x1c00>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0xff63c000 0x1c00>;
+
+        system-controller@0 {
+            compatible = "amlogic,meson-axg-hhi-sysctrl", "simple-mfd", "syscon";
+            reg = <0 0x400>;
+
+            clock-controller {
+                compatible = "amlogic,axg-clkc";
+                #clock-cells = <1>;
+                clocks = <&xtal>;
+                clock-names = "xtal";
+            };
+
+            power-controller {
+                compatible = "amlogic,meson-axg-pwrc";
+                #power-domain-cells = <1>;
+                amlogic,ao-sysctrl = <&sysctrl_AO>;
+
+                resets = <&reset_viu>,
+                         <&reset_venc>,
+                         <&reset_vcbus>,
+                         <&reset_vencl>,
+                         <&reset_vid_lock>;
+                reset-names = "viu", "venc", "vcbus", "vencl", "vid_lock";
+                clocks = <&clk_vpu>, <&clk_vapb>;
+                clock-names = "vpu", "vapb";
+            };
+
+            phy {
+                compatible = "amlogic,axg-mipi-pcie-analog-phy";
+                #phy-cells = <0>;
+                status = "disabled";
+            };
+        };
+    };

-- 
2.34.1

