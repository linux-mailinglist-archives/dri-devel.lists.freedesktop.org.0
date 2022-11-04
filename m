Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B7A6198F9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD39810E7E4;
	Fri,  4 Nov 2022 14:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403B810E7E4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 14:14:10 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso3250170wmp.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 07:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=li+ooNBePGxuv5adSrcu60bPx2IUcKrfzonF2RWQwto=;
 b=zR9PNCqP6LnfsGUVgC20l61o2e/4yuW58vmlf/xo2BRYL3BoOJKLInNIhJkmLVrhoF
 Xzc3czOjrEs/5KzBYRKyaCGBvVIvWdtvVOhMCRqmOhgglalyAAbVHmwG8O0aLu+UMX7u
 cvtKHzUKILM4SSPLJUng6/LOpay5HFoMOWVoN9MGSJacVudS83/y27LoVZiuyYU+J1Ny
 vHLmR4iCRMqREQzAuRLSHFQ5TeTNnyf//ScHESkxGLdiPDS1UFs1jv5oDMAe11/0wZS5
 O/wFpOwUiAFdYMRrlew+JFvUDYMv56eHxOV1xK73rgAWXHrvPMx0lI6RS7wOe9LqCVa7
 hGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=li+ooNBePGxuv5adSrcu60bPx2IUcKrfzonF2RWQwto=;
 b=zaNwFC1kivPcBxrGzqBKRzwQa6Xq1Za56hKYK+HzPz4VCaF+3OqfuyN6M1zpS30PQ8
 sUL/VGecfTNx/BagZOZfEGT8PKrAPZGjkmNU+PSwilAIzaQN0h8vHdCmJnXuAlpvabVa
 ik5+NxGT8M53dFk8MYKhFea9KtY3/aYIiGPuXViB4qoRIYnn0Y7Jrx0fQqMh1oB0AOzU
 6/c26+uD948KakEPSP4p7sCEqOMwUh/ASRSl+uM/QllUcZ3fK7LRmRhwMWiFr+Hjhkdy
 wsFiNVtoVONeD5FSIeY1ZW4wQYnwLS7eQStlWZeSz8rY0iniQ8fr8jgaXEgX0ZLEmqON
 rSdA==
X-Gm-Message-State: ACrzQf2EMpK2+i1+RgO0sFeKB4T3Ri295YOGGs+Yeckh3xkTelmnIPR6
 6PGYeVtBjBbZ+asmr/342dChsg==
X-Google-Smtp-Source: AMsMyM63r3C5u1drFWJNKOHbN490iUTdHFjO5ZeWcbLnzzuK//cTCIVyTn05wzs5W6KfxlqKz7l7MA==
X-Received: by 2002:a05:600c:4394:b0:3cf:75a8:ecc6 with SMTP id
 e20-20020a05600c439400b003cf75a8ecc6mr17784154wmn.74.1667571248761; 
 Fri, 04 Nov 2022 07:14:08 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6440-7fff-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6440:7fff:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 bj9-20020a0560001e0900b002365cd93d05sm3594512wrb.102.2022.11.04.07.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 07:14:08 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 04 Nov 2022 15:09:47 +0100
Subject: [PATCH v3 01/12] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v3-1-a803f2660127@baylibre.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
In-Reply-To: <20220919-v3-0-a803f2660127@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, 
 CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@ti.com>
X-Mailer: b4 0.11.0-dev
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
Cc: devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mac.shen@mediatek.com, stuart.lee@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a compatible for the HDMI PHY on MT8195

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index 0d94950b84ca..71c75a11e189 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -28,6 +28,7 @@ properties:
           - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt8173-hdmi-phy
+      - const: mediatek,mt8195-hdmi-phy
 
   reg:
     maxItems: 1

-- 
b4 0.11.0-dev
