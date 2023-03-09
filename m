Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BB96B26CB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5471B10E834;
	Thu,  9 Mar 2023 14:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7037C10E827
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:13 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso3715225wmi.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371793;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V27S5KvL1K2vWz8itNvO9k+w4B1SxfR+kJPCaUnFWDU=;
 b=330zcWuQ1eI0pJTDza3EkL27nNS6CiD3tAro858PFxmg4oIgpsFYyO5TYUdnzrkOzH
 ALl7GKmyWtJZOlh5t+2Tzuqa1admlGD7PvhfF40lGwmwlkzvi8abQES7Xx79Lzxf5jq1
 f+L/ciiLoYzniNS1+FAh5dt+mvCN7ncjNiv7yO/KBDZZ0E6cWyVvsIU44GGgqRR39WIH
 0FPunCr3WfT3mQNjFimeRf0wnylgGKonXSvS+SoyeKrqPrD1rpQZxNYgTKlsRm6Tu/aM
 2u/2dayRPPdDp5DG8LZYTM26csKitL4sSy7wJ+blX2oYL/jU/lBHT+H7zVfOd7HrfSkH
 CYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371793;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V27S5KvL1K2vWz8itNvO9k+w4B1SxfR+kJPCaUnFWDU=;
 b=5QXA5NijIdCOoC6Cx5zqEJAp+Om9lDai6T0N0Nnb2JO9FGyxLG5q74aijSYCSdO19a
 QyTsD6/k2U3gQk+9ZhkQaboTb36jz4qMeY2Q4ETfgdadx1T0vxQSosnUnw+PyyBaTGiN
 8Ff6rosORTMAgyJNG1ztACerF25TTBM/s17ptbB9AUneiiqgGRoqk9I8W9NwXzhw2YmD
 tblf98M4Y+eaEvyZnuQUu6J4yQAKREuNnNka7P3Ie8VX46IC64Gf7t5oh1Yl2WV7BesV
 NyKt8h1wGMjewzS1bl6Z/sIXLzsp2hos3C5fVXXl/i0bSI/PS6RWzNTjcbH/MrwCqiCp
 yVhQ==
X-Gm-Message-State: AO0yUKXsaefYeWkzfXu9hWD8vugayUBwLW9acN8NakJtN+fOJmwjJxXR
 rQpdb/uWB1IS2mc+Z9o5kGONxw==
X-Google-Smtp-Source: AK7set+ozYT3+VYr7fmgCHW+FD3/4xEoCNIdmOuH3nx6ozTZLs0TLqzYcERfLzlv8Ia7Ap+cejAasw==
X-Received: by 2002:a05:600c:a08:b0:3eb:5d17:8ddc with SMTP id
 z8-20020a05600c0a0800b003eb5d178ddcmr20488578wmp.18.1678371792947; 
 Thu, 09 Mar 2023 06:23:12 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:12 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:03 +0100
Subject: [PATCH 14/21] dt-bindings: soc: mediatek: specify which compatible
 requires clocks property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-14-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=0/sDiX4LVPAp/ORjzlykWzmFkIUKPbZkKZgeehvSSS8=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+S568lIEHHFVVzT7AxgJIhu0UcOZErtd2a/WI
 ARzoBjmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURVHND/
 4lG+29rGq6SrgR2EsMecuTDpP5JQLgec8RtkNNvpDmwff13asS+8EIp6zntOA6EGx0ZFTGsqgKbUal
 UhO3PDb+5GAGF+fR4h/vVo/9dBzgaJfeC2laY1LPKjf0rVzb0L9eSKgg1cBfxk0NVkkNKUY+5QX1Wo
 bG7EOr1CxaEyILqv6BcMkwACgB5xr73uvlVgu3UyH97fMWLE4H5kyPKG5k/B6VBojkLs4jmxkBZ+hF
 yxVSoe1fdWj9ZtLApW5i6oXVlxagBxLVdCDpnl8a4KclUKWitJ1Zh1jvOxl8ENBNNSs1K4EY5cK/EM
 idnI5RODT4ekUztJ96mpwtDfyf3CW5Gkq7OvK+T1QBkHKi7cxWdcrZJVqWas4Q14XURvyDPUAxcSww
 f2/JdoL4vWHgb4tfRZHhLE66D7eiFhSymurDqyYEbfpXSkkYuQOEuBQZ26odiVVdzneGByZ7f2Ns+4
 k0XGdQrs52QjZCHMPw9WJd5KZQy/Am2lFfJmurSQxF9wqX48Nnk2SIyd6S5h31dJTHGaic9C9eg/0g
 R8bVL0thuPclglLeth2ubZsJNqjXExMyvHBikkW93V2aqrqK30V44ngsGb/7ObMI0w1lvfTIUtzEaU
 JoB370ECUdcNd8xj3j0aGnlbiUlBn+xfhOZKQB7N759wWIjJPfO5wd97qVKw==
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

According to the mtk-mutex.c driver and the SoC DTS, the clock isn't
required to work properly for some of MTK SoC. Improve the clock
requirement by adding a condition which is function to the compatible.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/soc/mediatek/mediatek,mutex.yaml        | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index 9241e5fc7cff..ca0ca549257d 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -69,12 +69,30 @@ properties:
       4 arguments defined in this property. Each GCE subsys id is mapping to
       a client defined in the header include/dt-bindings/gce/<chip>-gce.h.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt2701-disp-mutex
+              - mediatek,mt2712-disp-mutex
+              - mediatek,mt6795-disp-mutex
+              - mediatek,mt8173-disp-mutex
+              - mediatek,mt8186-disp-mutex
+              - mediatek,mt8186-mdp3-mutex
+              - mediatek,mt8192-disp-mutex
+              - mediatek,mt8195-disp-mutex
+    then:
+      required:
+        - clocks
+
+
 required:
   - compatible
   - reg
   - interrupts
   - power-domains
-  - clocks
 
 additionalProperties: false
 

-- 
b4 0.10.1
