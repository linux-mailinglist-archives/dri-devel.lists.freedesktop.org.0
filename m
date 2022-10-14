Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEAC5FF128
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 17:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3308A10EB1A;
	Fri, 14 Oct 2022 15:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39DE10EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 15:20:23 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w18so8069231wro.7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5W2yVD4YDWpQ3CdxVHUW7qDBpRLK/GNpv3OQ8xCAesQ=;
 b=wdd/7aN7YhyT8sy0Wn7Mag45qih26IWdRYbT5Iw2wQ0ZJWbWLh1lhND7KddPc9m84b
 AZt82xojAp98dl7fArcn0k3wQxhoqknF8aTX1ZhUH/hv50S00H/MVzafj5z2u34JC3wZ
 +r4Ug1XI1ju772lSNkLc1Xmn0MGDpbwon7IyCu/JEzG/eRCyLnzvz1f0HZZSyMjWuPlr
 S9stoFaXkDAPz30zm12InbQLbXyN8wqGx7fTOCcr3UE15bpkMMJeu6wyvfeonSxz737y
 NL0EbvQeO3NufGmA0jubTXPFpkEhE3XrhSPgj8JqywzHvk45b1HhGqYdjG/D+7/WcJfq
 ZILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5W2yVD4YDWpQ3CdxVHUW7qDBpRLK/GNpv3OQ8xCAesQ=;
 b=gx7XdjqfO5HIdjoQV0Oz/9VQGM1o3v0ReY/+41RgUm1z+8kW+LYOsD+FligB4RT0Nj
 xk0nXalV198CgC55m6Emcrbv5mZANrY3zi9RstYgOO79GUHqyyB1BPe2538r0N/eqvwM
 GZxxge70/6CvJZr18YQ0BRX8q32VFHdRje+dsfevtoYvzbyIRmB6WdMU8ePpPsxUzhPC
 e0QGR+Ny5CILivcNL77NzOgIDMJ7jo4zPJegJ2T2xfo1Uy0MzmOJ4kkpg50k7EJmVdpQ
 80Hr2usMtGNtnrsl9SdVyyTr6suwg6hRkib0UKDEzv1UPCir3hTwZgAVXiuoUNuMmDTe
 b3UA==
X-Gm-Message-State: ACrzQf1X/GM2rl7T9UuRFCMOcNtsjQBvDNtAhCDjgRabQmlJakY8GnmT
 qcAI2tt9OsIse+cqneC5GlPrXw==
X-Google-Smtp-Source: AMsMyM57zNuBSZSZskVONFl0D1EsJq67LXu5kElRP3jBck5MkzoVEBxigmx+zHaO7rTqRHHqajVoCQ==
X-Received: by 2002:a5d:47c5:0:b0:22e:6941:81eb with SMTP id
 o5-20020a5d47c5000000b0022e694181ebmr3733750wrc.408.1665760822143; 
 Fri, 14 Oct 2022 08:20:22 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6241-7429-3074-96af-9642-0004.rev.sfr.net.
 [2a02:8440:6241:7429:3074:96af:9642:4])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003c6bd91caa5sm2818223wmp.17.2022.10.14.08.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 08:20:21 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Oct 2022 17:16:04 +0200
Subject: [PATCH v2 11/12] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v2-11-8419dcf4f09d@baylibre.com>
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
