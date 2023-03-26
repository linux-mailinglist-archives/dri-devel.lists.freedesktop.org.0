Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACD86C964F
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 17:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E8A10E1DE;
	Sun, 26 Mar 2023 15:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5591F10E1F5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 15:54:34 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id h8so26181776ede.8
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 08:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679846072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qb6wejOAWg8Tq0/xVUihnm3zM3Ykv1bV1Wxaitw6vys=;
 b=uFqZlpVVmx5h5YGt9V4RkhGjCgFfg/K53xRA90eWEwZ86FJdYz0lHlHfZ+UVmruME+
 H70w1sAhHv8hXJPLeWKNvEmI391bLRf4+S+l5RYE9j7G2Tz+1rKTAQGxWcul7qCTOd2T
 uJjnW6PX2ofmzgVmlmwGi+K4OWEELT4YTPaLmmOTM8tYs0GBVM5bgevUQpoYHZy3Xmyi
 omLEIAcwAEwvUBI5+iNUlJI4AJhlkilix63Pt1I9jOVinOJjx1pfJ2CrHW67ATorWT81
 Ag4uoRbQ7iiykNL5j1MkndTuoN7v/JGf7+N7YwaehYFtqFcD2B1/IfwGirP5MMpaxegB
 WDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679846072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qb6wejOAWg8Tq0/xVUihnm3zM3Ykv1bV1Wxaitw6vys=;
 b=2kyqBwSKV9AsRg/yE0aQPfc/HoNClucZ70TErSmit62IaCwsbdFmluhTFznijDyqCz
 flmwrH7MqIFWSCuZ7QcWaatTpaUcohlylp8JaZcl1S1Wsz1U2Z79NC1ln743hJ9UiSZQ
 S/UFFUJzsBA87i7+PiZX2HgJP7PcuK+BJLT/WveafE/+Br4XeImQ1FcVdvl1phQmCaBP
 ab7nNTCteYzH07eis/snZWSq3WLKli0BZh5Ku3RnOrSIKfyYAtFs8mhxdMU9Y7R2itt8
 T5FvuFxU3XhsVE/A5VU2FjyzLNwaFSvd/a2WVojTwp6mwzRlrWaIgmexT+1e519n8k3G
 frvQ==
X-Gm-Message-State: AAQBX9dmWkKMUCQMjJJdy/7xPTWWu+KtCpH4asoiH0oubBpIzskFVMR9
 ujQOlTMcDIt1KzU1Z23D4fbZgg==
X-Google-Smtp-Source: AKy350Zt2i4Or7nsFrCPdZGmCr9S/cL7QJFPKdglAMXRGLWGsseYfQ1oUV5m2neU6SIbvgRLUsj6Tg==
X-Received: by 2002:a17:906:3896:b0:933:3a22:8513 with SMTP id
 q22-20020a170906389600b009333a228513mr10968276ejd.53.1679846072731; 
 Sun, 26 Mar 2023 08:54:32 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a50d6c6000000b004af62273b66sm13506742edj.18.2023.03.26.08.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 08:54:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Srba <Michael.Srba@seznam.cz>,
 Harigovindan P <harigovi@codeaurora.org>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: display: panel-simple-dsi: document port
Date: Sun, 26 Mar 2023 17:54:23 +0200
Message-Id: <20230326155425.91181-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
References: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panels are supposed to have one port (coming from panel-common.yaml
binding):

  msm8916-samsung-a3u-eur.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/panel/samsung,s6e88a0-ams452ef01.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
index 44ce98f68705..b749e9e906b7 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     const: samsung,s6e88a0-ams452ef01
   reg: true
+  port: true
   reset-gpios: true
   vdd3-supply:
     description: core voltage supply
@@ -25,6 +26,7 @@ properties:
 required:
   - compatible
   - reg
+  - port
   - vdd3-supply
   - vci-supply
   - reset-gpios
@@ -46,5 +48,11 @@ examples:
                     vdd3-supply = <&pm8916_l17>;
                     vci-supply = <&reg_vlcd_vci>;
                     reset-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
+
+                    port {
+                            panel_in: endpoint {
+                                    remote-endpoint = <&dsi0_out>;
+                            };
+                    };
             };
     };
-- 
2.34.1

