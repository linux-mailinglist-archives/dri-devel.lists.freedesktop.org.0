Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A9B69B9A4
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 12:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289C510E1F6;
	Sat, 18 Feb 2023 11:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6FE10E1F6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 11:17:30 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 rm14-20020a17090b3ece00b00229ca6a4636so594200pjb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 03:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tRUarQyWTXy/UaQ+aTCiS9aEshqx6SrntwaJME4vnY0=;
 b=FhaH7iwlgirzBhkctvbPIaE33nUBelcGHAF8fq0lsjOkQ+cusRFz/4cccjVw6NEftK
 PpoX0TZ8w3vqQVGe5P/lYxblKHcsFlSVpBKNCV54TFjvgawSpSzJc1EE02sPm2cIp82b
 392DVfxuznUnL2wiI4prL2FfCxja2ElN7chAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tRUarQyWTXy/UaQ+aTCiS9aEshqx6SrntwaJME4vnY0=;
 b=wsFmuC1Io1otORq8Rj5mWalIaaM5jqlgPsF8uekWtCW1Y5uo8GhA7Ygn6L4ZqhCJdo
 E/gTuc8jSY3DkyQh+N4ezQu3XSi4JQG/TNvVBdBmc1B+8vfFMBbqVOG2NrxemQZoHNND
 k1KHgPDdbVefsYGinHauxiHW8ZPo7SrdcV/N2o2GdKtvN/+BWWipZLRb7NZqOWoxsT8O
 eo5lXNQ68HIg1WH7Un+XmMBq9DiIGlGpRfJwfmEl2T4y9liO3NivPQZEQNdITBcqUrAV
 BGJmZ98XKYWZiwUbNwFdTo/zGvAjoq+nMfETCfhXKEKAn7NXC+PjZW1ybEoILdYXqhI2
 sFnQ==
X-Gm-Message-State: AO0yUKWNhcC4Py/3IvLG9sJxtD2fptCQgAVVru6SfHwdhE+MvdEK6cKi
 PiamEv9cd3ptEb4I5ivVimo7tQ==
X-Google-Smtp-Source: AK7set+FohWYixBOFWTvodfYG9ONEn4rCbUp2cY1CE91qYHZ6E0/D4C1ES2aYaY6oImj8VUL+8mG8A==
X-Received: by 2002:a05:6a20:1610:b0:c7:5983:7a82 with SMTP id
 l16-20020a056a20161000b000c759837a82mr7002881pzj.27.1676719049830; 
 Sat, 18 Feb 2023 03:17:29 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:88dd:be84:8f65:fec2])
 by smtp.gmail.com with ESMTPSA id
 23-20020aa79157000000b005a8686b72fcsm4457829pfi.75.2023.02.18.03.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 03:17:29 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Benson Leung <bleung@chromium.org>
Subject: [PATCH v3 1/5] dt-bindings: display: bridge: Add ddc-i2c-bus for
 anx7688
Date: Sat, 18 Feb 2023 19:17:08 +0800
Message-Id: <20230218111712.2380225-2-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
In-Reply-To: <20230218111712.2380225-1-treapking@chromium.org>
References: <20230218111712.2380225-1-treapking@chromium.org>
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
Cc: chrome-platform@lists.linux.dev, Nicolas Boichat <drinkcat@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Pin-yen Lin <treapking@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a optional "ddc-i2c-bus" property for anx7688 bridge. This
allows the bridge to register a .get_edid callback.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v3:
- New in v3

 .../bindings/display/bridge/google,cros-ec-anx7688.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
index a44d025d33bd..9d5ce8172e88 100644
--- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
@@ -25,6 +25,10 @@ properties:
     maxItems: 1
     description: I2C address of the device.
 
+  ddc-i2c-bus:
+    description: phandle link to the I2C controller used for DDC EDID probing
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -59,6 +63,7 @@ examples:
         anx7688: anx7688@2c {
             compatible = "google,cros-ec-anx7688";
             reg = <0x2c>;
+            ddc-i2c-bus = <&hdmiddc0>;
 
             ports {
                 #address-cells = <1>;
-- 
2.39.2.637.g21b0678d19-goog

