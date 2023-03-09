Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B88AD6B26BB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C5910E825;
	Thu,  9 Mar 2023 14:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB8010E817
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id p16so1260696wmq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371780;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fq8V/33dVQgHge8n1w+kEKrBuJXvNdZoMtd/dxWzcHk=;
 b=pH9jhSeWxNT5/kU6L7MNaM5/ur6uhg76pTZHmXmxPPrb61jwjkoI82J6fxbrcHYltU
 2f/rqdQIJbpp064BX0xuheTLdE3q3o9b8UdVvkxdQ1Fju/PSvgZWv9P3mVor/51H9uY9
 3tzK4x420PKNRNRmn46uVcvCNAIc80+NHW81zTmCtXXDCegldGmzuKNXcH8iwbKqaCjk
 2liI9a7jPl1hjRvUzJ1N1/cuDECTPoF1zaEpIU9DYYnnpWRyeO8oxDNf8kiOogHHvZuN
 iNRVCXT07tdieptyyjPFeRSLo2qMw6SUJU7dpXzvZbvIDpaIWfBPN38tKcV3/pEjimCF
 Blog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371780;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fq8V/33dVQgHge8n1w+kEKrBuJXvNdZoMtd/dxWzcHk=;
 b=Q2h/Mv3E/dIGYkyt7GXNmFZb2WKDnDCPpAd13VU5ULp83VJdi3lBwYxfZlafGuWvVg
 t8QG8AUHx6NJ91GtVui4hcfJ4uCMkXeMxAiyHbnQjW6m6wwwIbEl2jBI86uxejrkNdsg
 vdIgduxc0yrYfNuuamWm3HCVMWqz+lv92eyGY0ZJAlwoBQJTFFzN21QHKpuWXdxrVY4p
 fRVTUM2xpYAZYgQ07i4WYQhAj9TZum+MALOpwl/28p/eO0/9QmD8L/NIgtLYF4kOfkH9
 oYqnWjSUtOqPBXhPgGbas5wNNkB9PZgw9uzxRxGrg8FeYu7S0qZhJs7FUM7+gGBldoq2
 2aXA==
X-Gm-Message-State: AO0yUKUTwpIDgb6oEAqLiZ9idSKTPMRknz/f6JCBAGu31FalzUQmRWDu
 UgeeRj86uVj1yl7icphsQUVsPw==
X-Google-Smtp-Source: AK7set9+xV9RaAG44ZqWCnxRFbCjr4oxsivxsX7sdBfuzr/CZXijhbsdH233AjK4P62T/QKd9PMESQ==
X-Received: by 2002:a05:600c:1548:b0:3e2:1f00:bff7 with SMTP id
 f8-20020a05600c154800b003e21f00bff7mr15742801wmg.12.1678371779863; 
 Thu, 09 Mar 2023 06:22:59 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:22:59 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:52 +0100
Subject: [PATCH 03/21] dt-bindings: display: mediatek: color: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-3-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=945; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=OsM4WLgGtmA0GySMLOWRA0K7CaicDuwTJXkW1UXnsOE=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+UGUPeIJ+S2D6dPzbrAMg7/oQlmswOc0ccN7P
 u6wGgy6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURRgsD/
 9Su2CGheXWgumO/o1+RtFbfV/2NPJ6oPnQjRHboZ76/4aMHfZHlNwom726c+Uenp9FmszOcvURGcIj
 TmX/9MWQYbfvYkztFwVfy4nmU2Lp9yYQICKEqve6LhHz+dgepAxZ9CuwYoGI9TgWVAkWg4EXt/bPe+
 eZFkaY+QNGiZeveyB6YGxdH31b6UsulSwPoITDaTQWDEBbkTM3aSTN1SWim6wsWaMBsDV98L1DI3CQ
 QVmRdfyEx/HclVCmAWgjR0TBQ7m9tWZjvvjgjq5UIu7174p+aFba4UJWap88qZMkhJjthXpn3/35w2
 DbMegV/TT7IpdjFdkK1hjjoTHU2jTuiqEV6uf42D/hZij+QsLsLGFinuYbnKLpiO7fT7Uo6+C9YghB
 EtVsjcvH6jX3ceOhLtOOyyuCclwfemAenUYpDko6mgzobmuv0vQkSYvphhXvZ+SuII8RFPOZP9sy7/
 9XiXkH4j+x28Eld4fgVTZ4YPMMqW9o1Cejxh3AtMX+dfoUpMDDR3ej7BYo1dtmc21kOT9+pgFnuvVg
 TD6NTjMQb+ganTbeOvSHieHp87XYjw+owQMRDDnPpfD4AkqLG/LP9QfdjuZszkCpO5ZP8365csd8lI
 NeHt9xAJ3ArAgCBZLinXAckqQzfm1ebYJKKw/CNcjt9IlH8SSdSQ9KgPctuA==
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

Display Color for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index d2f89ee7996f..9d081da433e8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -39,6 +39,7 @@ properties:
               - mediatek,mt8186-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
           - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1

-- 
b4 0.10.1
