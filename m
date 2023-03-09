Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DD66B26C4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B30310E829;
	Thu,  9 Mar 2023 14:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B343210E829
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so1358680wmq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371790;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kcvQAWEayhngzcYvtkzp+4NmbmEVpDMUSMsfJ+/Nd7c=;
 b=inzIoiESMhVJPKDWmSnc9rq2d5ZEHWXybJCCmws/aUqZ9N63Gok7tgyN44uwDRAZ3Q
 UM4gzSxTfDcSBaxMS84sw5MD+7rZnKrDnp2i04kTZvORGGNimCHpvo4G6GY20OQOhkIN
 IDFZTcueS7wSuNuCwG+hk5AlFsHPvBA/cPG/OUFPLRcQHyrFeMgOUf7co+dooowrPCu4
 V1Wfb9jkKcAUFRKsbuIeof9fKBPA/WABcUpfsDVXw6BDmgtKrrYYQTEQ6QxUqL4U/PK5
 AH2CkaJZPkbFEAsGXHTQdaxUfkQWgBd0TXAJ55fhXB0vP9OEQcyHGEkj1K2PUntekLDR
 BMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371790;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kcvQAWEayhngzcYvtkzp+4NmbmEVpDMUSMsfJ+/Nd7c=;
 b=LUbzIjLdD1Z8kiYHZOr7+GW+8kbSpT5mTpm9g/jzCBRh+tAFDgcTDygrkpt+Y8/3ld
 aCpkcez9HvqQyxSGqfJLDgWD2nsVGmaaZUOjmhILZVSakcyykAZlCVxj4/GOdTNSugqI
 pZykfHoZUO86hkfWoCDY7vWSTyGo5S1tzBjVyTbhvP8vvylR2dk1hmCLWjp4ECWHW5oJ
 8HZZDg7fV7eiFqoNcSqteQVv56eEzHZ1b8O1YEmIiYcwLWRA3lHvR0u4Ty8oPAnq25Rh
 SfvztiglFRrYO+pXUCkU6kQho3sSCNITZCHF5hLVNQay5Y+WgHrDWFuM/TpjHahQhos5
 d+vg==
X-Gm-Message-State: AO0yUKWeXexfBYUS1SziYYFTar6tR+adGJqUU7QXT3A3EWrPnYoqYQqs
 HzdYH1B8KdwT2HfxOSW9Jd+Z3w==
X-Google-Smtp-Source: AK7set8M1EUCCZusFz4TtaKBc+jWDVOuRwllEILSYeHIvDvv8PEH9RZ87dmG5kiHvo7WJQGlJ75mhQ==
X-Received: by 2002:a05:600c:35cf:b0:3d0:6a57:66a5 with SMTP id
 r15-20020a05600c35cf00b003d06a5766a5mr19297104wmq.0.1678371790305; 
 Thu, 09 Mar 2023 06:23:10 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:09 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:01 +0100
Subject: [PATCH 12/21] dt-bindings: pwm: add power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-12-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=kJNESBJYj6hSPaR8ChRMowMRY/WR5pgSKuWA0748F5c=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+nVEDPPb6Gdh+AgHCjdauH29RygOJmjr7a8NR
 ctAw6CiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURa2PD/
 9YzFDJCjDZcgP7CODOpyVYt/cRNXs9p9yTLCepRSRWMz1elUPgasCjdl78j9LEhjdZnZJ7+bWsn4sd
 3pWRltutH9daZALNPyfqq2TuQqg2DxDkAhg25yaJg4DwtBIRfDCPbUYefAfg7dHVq/nQTgp+2Ugwf7
 y7obSg5dgNYB+cP8n+8YVEIcW/X9+AzyMDSlM9VLOfhxGwuY1Qhw0Lb35fyj1BsQuIuJZMTVFXo+n4
 z9G9Irii/MF2/kbweRjOX4bhoREmwPMBTa88ARJjWfafCOB0nN0g30wrvcGeaEoKHF58zv8slZkx8n
 Gyl5636sKO7qpvWuBsalHVEw9zOD3mrWD/B1Z+FlQ5VCpspfnMUP1jW22OUwTjDoam/z7yM3iBPrDN
 7eghxhBtmd7N4z8jtmXJD1i+1Z4nwaLH6huBDUM7+2OlQzh7FvXQX3XKB5e640YK0GNoLlkBsvkcXD
 AX3xJvntzyAA4LpSDjGV5jQqE4NTbZQLAXOYQsACtSmX+Jbdp6OJPt2JPGj08J9OelBjwreAL88OV+
 hyU5UJ7QxvojlmM/YmXvErdnrwpLlM3r7nCNFKwbRtF5LNgyJgu+QORw0+SJguftIAO1L150JGdBd7
 0nLCkQfC7AGFO4tY/0f/dTUpmB8+P5wIZZpU9SrOuiqIk1Ld5leouoE5JK5w==
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to the Mediatek datasheet, the display PWM block has a power
domain.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index 0088bc8e7c54..8a0005a8bf40 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -51,6 +51,12 @@ properties:
       - const: main
       - const: mm
 
+  power-domains:
+    maxItems: 1
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
 required:
   - compatible
   - reg
@@ -65,6 +71,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     pwm0: pwm@1401e000 {
         compatible = "mediatek,mt8173-disp-pwm";
@@ -73,4 +80,5 @@ examples:
         clocks = <&mmsys CLK_MM_DISP_PWM026M>,
                  <&mmsys CLK_MM_DISP_PWM0MM>;
         clock-names = "main", "mm";
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
     };

-- 
b4 0.10.1
