Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F246B26B8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87D910E818;
	Thu,  9 Mar 2023 14:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACB010E818
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:02 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so1358430wmq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371782;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KZC5qBAJSZoc9F7aAJWQir3KEki0DQ4UHR0bP3Rd8Do=;
 b=oP0/Lrrq4QP7wG1xGKH1MmJdPBYEDwgyHwrwkjyr2Tq5EczUgB+S8p5ir7hnn4bkoe
 txH9Cu7PzrPdW++3Cr4Jh5Sx8c49BQ5o6QRE9lNrq/yehjO+ZYKxaDXqlZQKlLE63fbw
 Q/euy6mNPh7YutiFYWDCBxhy2x50NVFwvO3tHBcTM3Z5bhNSMwUo6Mg2sgqbV5fB0SUA
 BJ1pxJvHbJKw2Sa1YB/7xxqz9+/aNK6yR45z1OioaqkmIaAgMS3Cpl4Jl1Igypk6kSq1
 n68EIZF6kEk04/oTKS/zau+SXTvEjviqfnTJiK7+7jBR2UILSZmSB1wgSew0RzqKT27v
 7YmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371782;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZC5qBAJSZoc9F7aAJWQir3KEki0DQ4UHR0bP3Rd8Do=;
 b=aU7H8CfdoMwoVr+D3I//215jU8FJLXBbQFM3zOFpmugP8SiGk9sSqK2x2DgKo2YCEg
 cFcnf8y1AwiNKlWlGcfkU/hc5x2u0kwyJh20ulnFUaZxjqMBvjJvppFbjyz9pzACExxD
 DMOVHl4xNkTGSW6uZDFVfXRON95gICeMzSN8W1Hej4xZMi4QNUqnnfqJAcci68J2YLNy
 Vv9LhGFOEXlzuBu4Zjpne2LCug2UZlzPi5eniU3CS5VMn/7BaFXmqcdmxsMaINQ5foVt
 wo4lYt1+jobY2K2m4SEvubRA8Q7MI0o0geEHyJxZqQuy2uEiZLldDtcIZA+N1LA2mgrA
 HI4A==
X-Gm-Message-State: AO0yUKXGy2GozcHXbuhItlP5f0GGGnXlob++4wtkuFkhIH5qw6VWHwGz
 a2dOq+JcA9WzIQ/QxhkjrtzSGQ==
X-Google-Smtp-Source: AK7set+xR4QnuyIEHutoKQUxDYs1BLAEQW1vv2GUMN/llQrli+vHu9zVnxMe8Jp+XhFb5k0pIeKO+w==
X-Received: by 2002:a05:600c:154d:b0:3e2:f80:3df1 with SMTP id
 f13-20020a05600c154d00b003e20f803df1mr19947002wmg.19.1678371782245; 
 Thu, 09 Mar 2023 06:23:02 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:01 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:54 +0100
Subject: [PATCH 05/21] dt-bindings: display: mediatek: dsi: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-5-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=Z+PD/HG3NE11BJ2mTh036njJugWMt2nd1u2eHOQBoCM=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+GCL8xvWFL+ptlpV3sehG4PpJ38RbAQS5rbt1
 +Ile0c+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURSWOD/
 9RfuBFai2OHgcbNDhBzV0pUToxawUcIM3OnPZa0zVRov//1BJKpVqfY5nB3uMzU7aUXdTFXILuEV3Y
 XMk6nGH/5WIoS/TXKdPQKAKItedpW9wJWMg9YycRwSgObQVHiqtbDYwPxueBiWcGr5cNTuzegKCQdd
 nHqP0LzC4lQtM8swPcR7yTVL8d6o1SDIl9/3jSLzfDm32lwOt16s/MjjRFSddVisyGhoRm0oa+DYA8
 uFsY2Vc7ZwRN+iQk9uSGjvirfJwR10NhMC64IcsEcZcGlTO8nWnmENG8IOX2FLOwC8n4O5G91bYeOf
 H+d2lMt3ASfXD1ag93MJKISomTdNek7is8WhVqvsq3UTFuepZfZyZFSpnP0nEl7uOCjgGsAu/QkisQ
 gWhI9IoW+nw39HKpiyYLVJpIFXgxp2YHTAv7jMPZZVcbqvS2jPeWh7550ejhGVYM1mQ6vZp2zqrbOz
 Dif9LCNYN7Cm8QKZHVdZ1U6I+/oxaChwQDdto+TitOT7YUfi3dQpnMG0kYQwun5aFedwVscYdb3t88
 kC6eJ28KWE35E/k6FrIkEP+nTZPi33eBFRKRGWbj0ye+e3YBNKtsWfkT5deDzJv+Q7lWGemrWREABe
 2QfQw9AbCo9mgtDvpa7aTIfyx//JKOTRJ+imxN14T1j17fenhKSfRrzuFqRQ==
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

Display Serial Interface for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/display/mediatek/mediatek,dsi.yaml       | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 4707b60238b0..b6579d3effc5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -22,13 +22,18 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt2701-dsi
-      - mediatek,mt7623-dsi
-      - mediatek,mt8167-dsi
-      - mediatek,mt8173-dsi
-      - mediatek,mt8183-dsi
-      - mediatek,mt8186-dsi
+    oneOf:
+      - enum:
+          - mediatek,mt2701-dsi
+          - mediatek,mt7623-dsi
+          - mediatek,mt8167-dsi
+          - mediatek,mt8173-dsi
+          - mediatek,mt8183-dsi
+          - mediatek,mt8186-dsi
+      - items:
+          - enum:
+              - mediatek,mt8365-dsi
+          - const: mediatek,mt8183-dsi
 
   reg:
     maxItems: 1

-- 
b4 0.10.1
