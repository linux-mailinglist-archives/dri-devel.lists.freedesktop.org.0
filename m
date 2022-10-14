Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99BB5FF10C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 17:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3480A10EB06;
	Fri, 14 Oct 2022 15:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072BF10E33B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 15:20:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id t4so3269492wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 08:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=li+ooNBePGxuv5adSrcu60bPx2IUcKrfzonF2RWQwto=;
 b=epkJ13yY8mYBq+7snTc4JIPHLrRNtilHx+hAalOSDuQQtz7vFP5mgU+7k1Vhr0+rFX
 Ow1xaOHCWvrWzCFqYYcViguZdLp828mdx+FfUb4KmOsBySHDSICcntviZ2W336a6B20D
 Govk7liuLT6Y5gJiCtbaGpu98F7yk7qK8JetNh9QJtVR/7O41KdtOWcSszbYCKNjK+oO
 WCC7gTI69GwD8HTlXtRqZ6XJlbkQptIlMG/ITOBi6Yl+1IfFhrk2LfFXI4o9IVx7ynBl
 /C3aGlkxyXAtGdgdwX5nXm3acDaEmIiDA4A0nDoP2aAcHyT7Rw7wYJsMk8u9fF38G0Wh
 uejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=li+ooNBePGxuv5adSrcu60bPx2IUcKrfzonF2RWQwto=;
 b=0OVFMWZXlxtr3XqCPgkmm8QX6iRxycbtIYAruPEWlhc4HswNFJgHQHdNXVwEiXrFPg
 e+9yb3JiTN4LthtsZYdXq32+LgYdV2I8KNiKMSmffca2g/oZ/WkkwMzToqSF2gGDKvx3
 dUkj8bS+5Za09AwIL9b/bUKZKVee6lFVI8UF5cYuajGPmpLIq4ev7lqKfjjX0/yf/M15
 lXya3cUP+3YOvcnqKg4+dm/uQLG+HG7CkQZzo0ijsKdAc48ve46FxhQZSzfkkCxhs65q
 OU54Osf7lLHZH2ohIoQnQna2pbvy7hJgTvbFV1LJfXCSMWSAsMTJqZABl/9JabU3HUgX
 N4eA==
X-Gm-Message-State: ACrzQf1rGV0NMffKqlskTsq77eUcAZgAPN3kQFvaDY+Ri+L6YnIk+bZt
 mC4FekEuCFhXD2Ug4a8KmuPkgg==
X-Google-Smtp-Source: AMsMyM7nfhhjiRNQJTJ256AUcmhFf8h1a1IyYKXuRQ+avC22+kNiw+Sb+phmd/NqxY8Jm5rg3oVcSA==
X-Received: by 2002:a05:600c:689b:b0:3c2:fd6e:1fe5 with SMTP id
 fn27-20020a05600c689b00b003c2fd6e1fe5mr3974394wmb.99.1665760803237; 
 Fri, 14 Oct 2022 08:20:03 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6241-7429-3074-96af-9642-0004.rev.sfr.net.
 [2a02:8440:6241:7429:3074:96af:9642:4])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003c6bd91caa5sm2818223wmp.17.2022.10.14.08.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 08:20:02 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Oct 2022 17:15:54 +0200
Subject: [PATCH v2 01/12] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v2-1-8419dcf4f09d@baylibre.com>
References: <20220919-v2-0-8419dcf4f09d@baylibre.com>
In-Reply-To: <20220919-v2-0-8419dcf4f09d@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, David Airlie <airlied@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jitao shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
