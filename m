Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDFF714C33
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 16:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CEB10E2C7;
	Mon, 29 May 2023 14:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF9910E05E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 14:36:50 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-514924b4f8cso3594450a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 07:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685371008; x=1687963008; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=telyeAKdwo8lnoUKAmP+74qLgfYo7FAmVRnOD3rnVlA=;
 b=3QfEh8YT8VlS0OUoEUSTFqi+WztJAYkk4PhkEglwIH04qFEanNcPwOOPmCHJ/1lDt/
 yVqGExXRre1c1nr96wxJP7QnC4JprkZWqeQ/BtThg4TKlroQmiOxv+A+O6yueYTaQWhz
 7sLhSdW9avkV3hB82XpYzgZLK7b8O6gmYyEgU92a/RfFuwlymQgoluWFq2jBEGvGBisj
 kTOHOhRtav6y4SNBrQweLvEkORs3EZBvdATLVMBHuHW+iMoPqDWSR19jxiIPjeK9uNCk
 O4a0rhlExDisIvCEYiVQmeypKwJ1F2bvaABfy3THAitdx3yRpCG7r+rDD+MYgZCbfqIq
 fwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685371008; x=1687963008;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=telyeAKdwo8lnoUKAmP+74qLgfYo7FAmVRnOD3rnVlA=;
 b=PHjehSzjpdzGgesF+xoanaxlmJucMu32T1L8cqfdTs/MiN25Jf4CIYzJhukztId3cV
 A1SK8AoPul9e2MFkVCJgwd93JLK4tZ7hMa1c9qZiaxtAUy3CLXptuW6eTGmkB+/X2++r
 1gmk8BzzXg9SiKk7/SlDAdpjDuI8kU2u8/5tZxHrFIEXVesz6DecteuupjWnwt1SiceT
 OjvjSpbzivmy15tDxYSyHEA6kRGQb25iMCUzyFAuPr48W+Vl8oCJ3LUrdxJbkZp+cu0G
 OjjJnaSaUpo/6qpb0nUPaBuPT7VL+NAzXne5AejEPD/LviLQ0X0hZt4Or2KbFHq7I1dw
 S82g==
X-Gm-Message-State: AC+VfDxehWAkL4Q9Fc8WDdm1rGZ6wZN60Q7B5waHlhu4uSuHNTnKkiPp
 7jgGuQgiZckUq7vCL3OZQ6RwGQ==
X-Google-Smtp-Source: ACHHUZ4QgZFbnnhdPEGrQaTJdIUZ1I3VKBbk9dR2dNCddcnlogHxJeDuEb3qF8lU0zYWvc3pVjZAYA==
X-Received: by 2002:a17:907:7f0b:b0:96f:e080:4f56 with SMTP id
 qf11-20020a1709077f0b00b0096fe0804f56mr10191410ejc.31.1685371008553; 
 Mon, 29 May 2023 07:36:48 -0700 (PDT)
Received: from [127.0.0.1] (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr.
 [90.5.10.86]) by smtp.gmail.com with ESMTPSA id
 le8-20020a170907170800b0096f803afbe3sm5993654ejc.66.2023.05.29.07.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 07:36:48 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 29 May 2023 16:31:04 +0200
Subject: [PATCH v4 7/8] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20220919-v4-7-687f09a06dd9@baylibre.com>
References: <20220919-v4-0-687f09a06dd9@baylibre.com>
In-Reply-To: <20220919-v4-0-687f09a06dd9@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>
X-Mailer: b4 0.13-dev
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
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dt-binding documentation of dpi for MediaTek MT8195 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index d976380801e3..cabe4031729a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -25,6 +25,7 @@ properties:
       - mediatek,mt8186-dpi
       - mediatek,mt8188-dp-intf
       - mediatek,mt8192-dpi
+      - mediatek,mt8195-dpi
       - mediatek,mt8195-dp-intf
 
   reg:

-- 
2.40.0

