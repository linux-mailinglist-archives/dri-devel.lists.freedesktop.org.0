Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A06185D0C
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F4C6E1BA;
	Sun, 15 Mar 2020 13:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690BF6E1BC
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:22 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q10so11697015lfo.8
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VLNfyRlmaYQ3/Tah2cpzN27telonR8g89G9XuIdJiRY=;
 b=CwLZsI5V+/tWZaCIqyvhB2rMVWfYqvhbJbU51g16X5DRfUvt4JNVbm6UH0ZICJDzSc
 v1p671MHR5UtUzPn3UMdqiAAHsr35BikS8qmyQmXxDVifFVSF8CXvk2MWYSCXMsVFGhE
 N1vjzG3Bszvh7UrWOM6I9QvkUMGIJq44jS9viZmhBkt99IiHJnkMOkw9xXdk/7oJNovn
 hF4IX3As5FIYlx6psGT9vyrvwIEEzlqaIi4tg5LNz9G9VHhTufg7f2pdiBz56Y5uQpYG
 dtn87nGGFu5xwWlmp4UUQCjfp6iB2rvGqfnwn5O7LtRTzOVmgqlVqsYxSV9mUDMZRY3R
 NBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VLNfyRlmaYQ3/Tah2cpzN27telonR8g89G9XuIdJiRY=;
 b=p3BGkXV4VIg0v5Fngk7VnCTzq55O5Q8tuRj1V33IQTkpN5i3OlL+wTCIBLrdpW7qTS
 xylAugXiCnHc/tA0SuW6XvQSYZCi4B9lOEI0yOG449zuWO4kjcHex6m+SCsCwbLgA79c
 +sBC9xctsdVCNs5y5TXxlEU+XId2FqcSZh17FB3Z4nN+6cSQoI792TA4k+r4HTspHlXd
 98whPfkCN55GCvlbHFtAH09aYq6nQwW/EdjUOqOTQA7TIrSfMzV7P7xeSNouCts579sF
 nMKuIdPt/ruy2P+QAQeLP9oeK8nVhAVyCF/pITINVghlKmKiL4JxTXXKkIC32J5AG/HN
 vgow==
X-Gm-Message-State: ANhLgQ37GdrpKFGJo6lIHpQyhcP7IniHdCI4yiHyqU5SjoKWIkYfuuWc
 WSIHUqWdF+CxgFcKkjnoAbmeTTn314M=
X-Google-Smtp-Source: ADFU+vvHd3dqdQPhoUbbx/LB8y1V8lfjkv/qzbJjy6O+eaWkY6R8Mah3BL7Aqm9us/62AsJajCnVEw==
X-Received: by 2002:a19:6144:: with SMTP id m4mr13722652lfk.192.1584279920519; 
 Sun, 15 Mar 2020 06:45:20 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:20 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 25/36] dt-bindings: display: convert startek,
 startek-kd050c to DT Schema
Date: Sun, 15 Mar 2020 14:44:05 +0100
Message-Id: <20200315134416.16527-26-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200315134416.16527-1-sam@ravnborg.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, Paul Cercueil <paul@crapouillou.net>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 Guido Gunther <agx@sigxcpu.org>, Mark Brown <broonie@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Marek Belisko <marek@goldelico.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/startek,startek-kd050c.txt  |  4 ---
 .../display/panel/startek,startek-kd050c.yaml | 33 +++++++++++++++++++
 2 files changed, 33 insertions(+), 4 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.txt b/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.txt
deleted file mode 100644
index 70cd8d18d841..000000000000
--- a/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.txt
+++ /dev/null
@@ -1,4 +0,0 @@
-Startek Electronic Technology Co. KD050C 5.0" WVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "startek,startek-kd050c"
diff --git a/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml b/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml
new file mode 100644
index 000000000000..fd668640afd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/startek,startek-kd050c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Startek Electronic Technology Co. KD050C 5.0" WVGA TFT LCD panel
+
+maintainers:
+  - Nikita Kiryanov <nikita@compulab.co.il>
+
+allOf:
+  - $ref: panel-dpi.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: startek,startek-kd050c
+      - {} # panel-dpi, but not listed here to avoid false select
+
+  backlight: true
+  enable-gpios: true
+  height-mm: true
+  label: true
+  panel-timing: true
+  port: true
+  power-supply: true
+  reset-gpios: true
+  width-mm: true
+
+additionalProperties: false
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
