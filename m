Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1206542D5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECBB10E030;
	Thu, 22 Dec 2022 14:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F5910E030
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:24:18 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id u9so5378376ejo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 06:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LnWhFDszNMI8+kb0kwDjwW0IO0VieHrS+DBjt8KEoSM=;
 b=cuFW0RTjiVDBdjiwgwJQVjfjjPxXLiH9SW6vNyZZT/0l+q7G1n/JB0x7gqXcaCVi/f
 eXG+dJt+DxN8IhfYygw5ufplocdh64KCshIotuIEHdVVvXRRkXNa10xNVnDpMQwBuznZ
 fs32PWrIK/UMzp1U5b+ytjdj7IFjCyNc5eRXWmBMGc5iOp6U6J8vNBNDiYGwusCCR/iG
 ktcB8G4hUnc50wXJHYkUEcgjZBaImBefO7nZ2HCrzsqBpTem/B/vOvoz711Yov98rc5J
 7luzBlQT9wZWUkdFuJ+W6cNtXAow2S3dMuhVHdYF48zu25TdAV9utgAXuVasjk7HJvIK
 v6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LnWhFDszNMI8+kb0kwDjwW0IO0VieHrS+DBjt8KEoSM=;
 b=LHwmEIk66py28bw1wGobgQsG89k6mgf6sd7jf5QHmjCUa+mE4m7mFt21vKgo/8Fp8a
 hL4fhyeYENvnRK5EkEJS5fYS09Xe8RUDUkvFJdyHSKbx+EPPSeff4bmFWGgTCjr8rn4Z
 QmnN7wi9uyKMlqBTlGjw0TUh0BfCLykyYPwHd6fRdHXMADyZR5USaYrEWh2TvxLowNtd
 kFm3D2xVJBwbjEkA9YvNrno2E97MdBmzDe8IIgYqJMBCihsGr6Gi+cUCQPJkW/sNbkU3
 etImgdj04qjdaxeQQiowr5KxVPCw1LKVmFzvn4MShHQW0J/1GwkT60iMpckPyxCi/u+r
 sfgA==
X-Gm-Message-State: AFqh2koVB3V6K0wojD3GnhpDj9Byq5w5GSBiM8GusXPNkStAKE3jUZFu
 Ue+Ux4UHhPSYTyzv94ReD2I=
X-Google-Smtp-Source: AMrXdXvroVpUBN7+mAP+hqeudjOkt5RRg2uy5FfYK2PWzHmdu0pl+Jqa8DrSEN30FJFKNCbQJOqIPg==
X-Received: by 2002:a17:906:6dd4:b0:836:e6f7:8138 with SMTP id
 j20-20020a1709066dd400b00836e6f78138mr5338891ejt.13.1671719057163; 
 Thu, 22 Dec 2022 06:24:17 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a056402134300b0047f5f5bb5fasm415838edw.62.2022.12.22.06.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:24:16 -0800 (PST)
Message-ID: <ff3644da-e5ae-f795-c7d9-454b8c8bdfe8@gmail.com>
Date: Thu, 22 Dec 2022 15:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 02/17] dt-bindings: soc: rockchip: grf: add
 rockchip,lvds.yaml
To: heiko@sntech.de
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
Content-Language: en-US
In-Reply-To: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-samsung-soc@vger.kernel.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com, hjc@rock-chips.com,
 robert.foss@linaro.org, kyungmin.park@samsung.com, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new converted rockchip,lvds.yaml to grf.yaml file.
Prepare for more SoCs with lvds output.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changed V5:
  Drop the quotes
---
 .../devicetree/bindings/soc/rockchip/grf.yaml | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2ed8cca79..7ac9aa5fa 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -75,13 +75,17 @@ allOf:
       properties:
         compatible:
           contains:
-            const: rockchip,px30-grf
+            enum:
+              - rockchip,px30-grf

     then:
       properties:
         lvds:
-          description:
-            Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
+          type: object
+
+          $ref: /schemas/display/rockchip/rockchip,lvds.yaml#
+
+          unevaluatedProperties: false

   - if:
       properties:
@@ -109,7 +113,7 @@ allOf:
         usbphy:
           type: object

-          $ref: "/schemas/phy/rockchip-usb-phy.yaml#"
+          $ref: /schemas/phy/rockchip-usb-phy.yaml#

           unevaluatedProperties: false

@@ -124,14 +128,14 @@ allOf:
         gpio:
           type: object

-          $ref: "/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"
+          $ref: /schemas/gpio/rockchip,rk3328-grf-gpio.yaml#

           unevaluatedProperties: false

         power-controller:
           type: object

-          $ref: "/schemas/power/rockchip,power-controller.yaml#"
+          $ref: /schemas/power/rockchip,power-controller.yaml#

           unevaluatedProperties: false

@@ -146,7 +150,7 @@ allOf:
         mipi-dphy-rx0:
           type: object

-          $ref: "/schemas/phy/rockchip-mipi-dphy-rx0.yaml#"
+          $ref: /schemas/phy/rockchip-mipi-dphy-rx0.yaml#

           unevaluatedProperties: false

@@ -174,7 +178,7 @@ allOf:
         reboot-mode:
           type: object

-          $ref: "/schemas/power/reset/syscon-reboot-mode.yaml#"
+          $ref: /schemas/power/reset/syscon-reboot-mode.yaml#

           unevaluatedProperties: false

@@ -200,7 +204,7 @@ allOf:
         "usb2phy@[0-9a-f]+$":
           type: object

-          $ref: "/schemas/phy/phy-rockchip-inno-usb2.yaml#"
+          $ref: /schemas/phy/phy-rockchip-inno-usb2.yaml#

           unevaluatedProperties: false

@@ -228,7 +232,7 @@ allOf:
         io-domains:
           type: object

-          $ref: "/schemas/power/rockchip-io-domain.yaml#"
+          $ref: /schemas/power/rockchip-io-domain.yaml#

           unevaluatedProperties: false

--
2.20.1

