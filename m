Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEA96B26B9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150E510E822;
	Thu,  9 Mar 2023 14:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC2A10E81E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso1327651wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371783;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d+yQgUupWPpIlOiQqba9JZgbizsM+tf3A5vNzGQQ6cI=;
 b=mzfJRi3rr3ADiB0HkiogBnHWfujR6PEq0KFeLVkc+Ap41u72IOxKgs/bJddmQG6WsF
 xzSjpYUmWdr5l3Eg3yVDCMvfQjYWgvfrIYAM0s4z7iqr2jBr2qPODb81q8CF8bkwWnSv
 3ris5wjDrmLrcDtBTIY7VkTwbNV+rL4RnlHMgPL/Xc1eXRg0Vq/eKd4Uth4i7tk2AOeK
 f+Pa70sCkDyq2+9+Oppxwhi6jUQt/UqbJRnEAI5ImRvzSmr+ejhcw9luOI7sK4VUpMbp
 /ItQOGkcw4Jiv/3XOwZDcB1hZG9g/0lexQk/mB7GbnxvpA2pbRBd7aDkSNRj/JCBdRxK
 Dccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371783;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+yQgUupWPpIlOiQqba9JZgbizsM+tf3A5vNzGQQ6cI=;
 b=Zf7a4xEbLZ+w+E01rIr+jkuYpsjLpaTq2pBPpPu3sleEBDJagWXSC9L+xLfYUhsGB+
 JCtBjyW+CeylOTbRZQjLhr6+0+zDa72xx7Ju6ID6Uc+RGs9qEwcRH4mp+vSQBZgyENva
 iV6USy8ycJJpXkVqB7dySdKovdx7gS3O8uuKoO0RfDbJ1gAzxidOztChy6qMEsufAmHV
 LCeak1L8oZN8roan2e1mpvWSJyTAe7qOi7oDTtYo5Sob+aPsCSHW6UrgUxFedoChJH5w
 NA2OGy4ID/+ToLmsfRuydYulgATzFWB5DqZQDsYwxZFjcRtaNRr5fdedx+yhLnTPZCm3
 dlog==
X-Gm-Message-State: AO0yUKWTkkOhWW4VClBHODasstwVMilczRz/9m/0lywdxpYhPxblpD/F
 6Nz9c076YHBmEbkqC14uW7tA8A==
X-Google-Smtp-Source: AK7set9MEaiRkz2A2iRRrRwUb0ZOdN3nxNICaLPL49D8FlcJGe9+rcOV87KkfjUqCDMibzNpj5DFEA==
X-Received: by 2002:a05:600c:3b9b:b0:3eb:3998:36f1 with SMTP id
 n27-20020a05600c3b9b00b003eb399836f1mr20191268wms.41.1678371783396; 
 Thu, 09 Mar 2023 06:23:03 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:03 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:55 +0100
Subject: [PATCH 06/21] dt-bindings: display: mediatek: dpi: add power-domains
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-6-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=8XdhUHkypetWJdIFuKJdeu4W8TGTvxJ+Za8X1maEAM4=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+DRa9AL2CpzRP2lVUsmPaWmgwYqlEIq/98IQS
 KxW0QIOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURRLFEA
 CVeyHA49RQBUUtLf5rt68aPlBSTSNZkV/4dybTnvo5XD3DTtL6SxXVb8PIRFZ8Z0BMtQ14vow360rZ
 yg2n67jDC8IU4XUGYs6VJJMVmjqPKzJ8bo050n678ZXKt8yoyLCdDUUAt45ejLZ4edK2uZ75PvUMo9
 PxpxL+K9W6sXhoUfiSGCB4MA1afJ8nPpE/aQK0S2SoXwWV2Vi/wU0Om1KZOFh7twso6EWjEn3PYv1b
 Csr4Lpz2u/aZYStBN7UDDB+/TTzRqG2G1eShU28auw16uz3TtHeEMOXaIDUldiaWdXEv7qIqgIUfKQ
 u5gsnp5+vPI5tmOJZAzbFRfy7kOONpq+5GVAb3szqGNZ1zrAuHMXy4REe0HT50itJRpppIIfac6UgE
 mCkqQFHnfZKTev3r4/l0L9NOVzblrsf3yn3b6wG+JpTwNLRe/sm7yUABonPMq4b/4m8kE7EwJRVqlh
 1FKA9j4X6ncZNs+i3Z/OSYaOgZ7zriJXwg4ofFAeE5DG3wTsUXShUE/ZddrlMa6ufbWVrJqaocmQ2F
 6XttS3JG9mRxq5WanmPs9304xVzo09LYXBMhZZu4bfOtm2w8yNex7LRbJ0UCMMYA09xrvhkLjLs2PW
 MhQz21g5o+7F2PdHm2ISbY5tpDhbSWtIEHSOfAji7vKN4VQFTjvDKur01vKQ==
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

From: Fabien Parent <fparent@baylibre.com>

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding documentation.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index d976380801e3..56511c4d4b9b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -59,6 +59,9 @@ properties:
       Output port node. This port should be connected to the input port of an
       attached HDMI, LVDS or DisplayPort encoder chip.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -73,11 +76,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     dpi0: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;

-- 
b4 0.10.1
