Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEFB619917
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B55A10E7F1;
	Fri,  4 Nov 2022 14:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE69310E7EB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 14:14:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id bk15so7192997wrb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 07:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5W2yVD4YDWpQ3CdxVHUW7qDBpRLK/GNpv3OQ8xCAesQ=;
 b=ZH2Ico95zCvYIhFHVP6NHK4O/87cVBVR6I9hbo3P/sVcFSUVcKKppKz+maSYGYhi/D
 NpWIm0t4PyoLdvM/bAya2RMTCsQjh6R6c4Cjh5iAX7AqelzO7RmfgrbbO4RPVAVa2tLJ
 jZXhQukTuY9Rt8GMWWEbmF706RL02veZ71ZVo6MaEMeUTUXpBedIdFTivAIRSJ2s4zFp
 4RdZPY/12nY/Ezf+WkzWCrcSR/n/J/gf34saIWlVTQkuIwNvronXLtYil6Uj0fCmtaK7
 7Fq4nsJoJFqqaloQGy2CBzCrYwLCoJWdRlm94Clm+S2A/n7/ZOj7+mtuj2MKfs5XUDQ9
 MQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5W2yVD4YDWpQ3CdxVHUW7qDBpRLK/GNpv3OQ8xCAesQ=;
 b=7Y7X/fEWFg/ld36NkOhZFAoBau69y/Azyq/8ybm5FtOfH/DXbmacAfiGAtCEdnB9/y
 k1ZwdtiMbATk+BcUgrxwiRcEyvP4MqgRjdgEqpDH3TfbDZm4OL0bTcnxWseHwMUTMEZ0
 jFH2x9MIm8f4QWRVVcAjSe9xN4PiLq+iPNXpnSHbJ003U8fWbgmV6UJjnz+BzRh88T3l
 cYWg6PGEadasxQZh17kfXKYRqdnVtXldLYcfjYhGSrxp+smGfmzJtbwvP/YiJWgBcGSl
 AkFN+DsQJ4HUAuylF4dgnPmanYN3RKARwf3eChIOTRBxQ3vG8tz3WNxNS2fSlDqVJuQq
 YZBQ==
X-Gm-Message-State: ACrzQf3lzOBLu6vdug2RbNBVLLtdtiWTgi+aQJwsaMD1MOCCkSGC2XTy
 al5s1wfVErkkloPmotcqY5xa4A==
X-Google-Smtp-Source: AMsMyM5UgSNrJdjJbaWkNmPYq6dn0dMCmkzxuRJCJIVsuSJ/GH354TzUrpT1mXY6Xoiz6vRA08LnyQ==
X-Received: by 2002:a5d:59c5:0:b0:236:cc8a:59fd with SMTP id
 v5-20020a5d59c5000000b00236cc8a59fdmr17239311wry.426.1667571267873; 
 Fri, 04 Nov 2022 07:14:27 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6440-7fff-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6440:7fff:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 bj9-20020a0560001e0900b002365cd93d05sm3594512wrb.102.2022.11.04.07.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 07:14:27 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 04 Nov 2022 15:09:57 +0100
Subject: [PATCH v3 11/12] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v3-11-a803f2660127@baylibre.com>
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

Add dt-binding documentation of dpi for MediaTek MT8195 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5bb23e97cf33..2c7ecef54986 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -24,6 +24,7 @@ properties:
       - mediatek,mt8183-dpi
       - mediatek,mt8186-dpi
       - mediatek,mt8192-dpi
+      - mediatek,mt8195-dpi
       - mediatek,mt8195-dp-intf
 
   reg:

-- 
b4 0.11.0-dev
