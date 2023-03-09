Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246646B26C6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D6B10E82A;
	Thu,  9 Mar 2023 14:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23BF10E827
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso3746465wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371789;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lE1bZPp7KRJkG065jA7BrjRq0e2c3UVRIFLdkJvreXg=;
 b=e3wRyPCxCTCbhqioIV84fwTJJWN1NAlFg9iXSquWHMB+55KKB4KLqzARSuOjj8DPMQ
 N8be9sHKY0/KWVtlU7to5JigikApJnETiCwDE4KDojZ7aLJ/9UPVd9zcLpYHBgOaSvRl
 8J+Xfw0FSp2HyMaVrMNbUMvVWlWEWwr4O5/Jc3wCXyOB7wCF1+s6eOAnraLRo8C2+EKS
 Cnszz064QmUgyYI3/hdj7izmvQpmwpSmx3n6Wsv/n2F/PCU1kvqL7T8v0Wc5vUwFtXAD
 G8++H809aE7XHRhumpMOl+4O+8YF22/f+3sCSvo2ZH7MRyoWfolCvwXxeZRpo46tBkLA
 vBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371789;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lE1bZPp7KRJkG065jA7BrjRq0e2c3UVRIFLdkJvreXg=;
 b=SWiZeyy++Brpx88gVuEC8iLa8vAlyCCM3oUWwJsPPp9KDrQ4dbrPc+XTJCyGE2NfH9
 PCO6vHNjqJ6278OY+LU5KGAy15pjcskrEZYAZbNXwg71gEm6M43AJkJEo/dELO5sdvsC
 krxVYAykgTY58QNFBGBAnzq6kUK6feH+W5wG4SIt7Cr/Dd2/JnP6W2NQmIshBCj3c1Fq
 7uCvZeRS86DHg7UJZtoXhFeqPRFhsAME0AwNWm5CYmnJbqdVUTtjWXp5q1enUgVxG918
 tD8nwImcr8FFyJ4e4kb8nInF26U1uQyaX/SSZbmEOhBVh8CwrCb6KkprV4AbCEQL/OS5
 flEQ==
X-Gm-Message-State: AO0yUKV/gsCfx5s51UR5sThsPHrbTIszVulubZS1cjkn+WxkYOn2Ef4z
 T8Ek6cxYm1yKMjLp2GzNE0waMg==
X-Google-Smtp-Source: AK7set/01szVVaeiIC4yN1x9Gpt/mNzvTYlHq94dchpbp1MYvvz4Fq2/M/RreXzcMvHUi3XBWN1Yhg==
X-Received: by 2002:a05:600c:3c9c:b0:3ea:bc08:b63e with SMTP id
 bg28-20020a05600c3c9c00b003eabc08b63emr19961784wmb.2.1678371789194; 
 Thu, 09 Mar 2023 06:23:09 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:08 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:00 +0100
Subject: [PATCH 11/21] dt-bindings: display: pannel: add startek kd070fhfid015
 binding documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-11-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=ZIT7zMlD8Ybmnc0MAE48dSiLfIIrFPqxzQFOQLpl7hE=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+G0qVP9OBtyeMgMvHIxMf6oq0XMUO3rJqXik3
 LjvSat6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURZfED/
 414WwVYTAUFUxJE4CwHKrWcmoCVewOA/dd32LBGVdTz8vaKpH+2d1a5N9ovuTY4GW3H8kjpVJORADx
 4Xmkf/2xqpoSp2G1tnQjX7gpPaiW1qEJmk0ItcAcOfzItflGiFnbiiYaVvZi6uigXBr77DusoqtZ2e
 2d7TuAG86s+vZrISj3CfXsnZY6GOwMBoIz++ha8QV1WUuXMOE53gUBKUt8VSakC9Tj1HYP4L3UBox8
 G2MrlJr/2NjismzZdJ1UEThjH3/kp9qZMJKNNDkimfX21jxvr6owH+AiEMBIM8bC3W6KAfidyapQn8
 XzaXRfinr5+s/OPzcMvcJJhJwuZjsEpb1OQRZ5JSElVpYzvEwnvJ+6ZZC0XpgX721HbW3zE8UUMpSP
 JSFkEn5NCpZ0FAbhlcKPn6yH0mzb5VO5I9n9PLHamCgcjmpBB3UZ+GKK7BbC5+14TZk4XUYM1S8UlQ
 JPa6sj8/2jjLZWZDPvHGTgXyZcYf3kbHU+/HphFNdWttWktnm3y8MXF5oUdWXieUsGzEkrLokGPp24
 RmmcS/f5beFeHXDKvVrBW00w7qJst/aHHOCXlUowrBgYy0cAHPBXdEX4sC7IKiwqb2GQbfs7+bUWMz
 H/TVDMy4mN1ewwGa0HahS+2c91dONKmtyyo/WEvhj3C/5kMC6yCiAXSWI7bA==
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

The Startek KD070FHFID015 is a 7-inch TFT LCD display with a resolution
of 1024 x 600 pixels.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../display/panel/startek,kd070fhfid015.yaml       | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
new file mode 100644
index 000000000000..5fde552838e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
@@ -0,0 +1,55 @@
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
+    const: 119
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
+  pinctrl-0: true
+
+  pinctrl-names: true
+
+  port: true
+
+  power-supply: true
+
+  width-mm:
+    const: 178
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
b4 0.10.1
