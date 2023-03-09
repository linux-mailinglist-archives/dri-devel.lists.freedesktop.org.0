Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41996B26B7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E36C10E81C;
	Thu,  9 Mar 2023 14:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DB810E818
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:22:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id az36so1274341wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371777;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oIAq75lH2Ms2bL3QI5/GLr9JphmlHB8/ymqV5IkJpKc=;
 b=iQ/Z08i+xnf0+QqJE0gYVxQ4HzKmXpqQEAOp8qp6ZOh4Bah0fbXKiDFQcJii6ajJ+f
 lj9QKiceDCt7X0u/RNFd9QMU6wnsrC4Stx9kDpsQrydI4GTt7yGozhUGTj4zBDZJ4ufT
 0rkmkcJgQse9ID1Nu4c48hz33JrvyeYhkez5o9TpFnmq/8BNKZKz7bfyvwZEHY/xOLkY
 74IC7uqk6UiuQAdvyYmbsfTj9OZuYjouSQSzIFf5xnvlgg4QKzCMoZXzl3xaeDdg/4l1
 NEuyqEkuf9MekN0owXFrv9vl3hVDmB0loaok4kLdi5yf+e5YpHn9LNVz1jz2Zi7OMYSy
 1VsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371777;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oIAq75lH2Ms2bL3QI5/GLr9JphmlHB8/ymqV5IkJpKc=;
 b=fv+T24osUhgoXomtf0rdOujt8fR0Ehwupn/4GFV511Csvgur6UIYGl/kFbaGaau6/m
 /VMgWkwfBO8gvMhrUqNGNW4U03DhIofZH06hMaBqC+V0Tq/IQ+//AuCmA2+rtEuJJ75c
 2SYID90Ervs2pAnKUICsLntCEsXCGWDfDYIo/3PtBsO/MTHz+1LgE1eRBrXrL/BWMfeB
 bbcf4gPJVs8dlV80FekFCj0ukskUcPbEmc4/4UlSiHIqkBFHotszGV2/Ugj/u8Xg2kBT
 cUFLDEJxo9jGL/Nv/ZGrw0z2Uz5FZD47HXaLeTCAjztwjjgebtSMGBBccF3Yw9bSDPHj
 GC8Q==
X-Gm-Message-State: AO0yUKUlUdZr/nXi4PiKup/1R3Gh/q+33QFKrcKZkaOwKyIc+oaVI5NJ
 BIW0a1uG+7HILZHWSWQZNjYfkg==
X-Google-Smtp-Source: AK7set8x+PI0RC1jqr6FcGHLymEePMs/0jRVfw13/HyaF1qSj0O2qlIoeWJ4Fj1seTcF8i4J9aGxow==
X-Received: by 2002:a05:600c:5127:b0:3ea:dbdd:66df with SMTP id
 o39-20020a05600c512700b003eadbdd66dfmr19528568wms.2.1678371777251; 
 Thu, 09 Mar 2023 06:22:57 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:22:56 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:50 +0100
Subject: [PATCH 01/21] dt-bindings: display: mediatek: aal: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-1-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=WEnU1yh+Xf5Fm/UQMnsfiUO7zkGJUQGiUbGopVaYs98=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+4sd0fzV97pSR5UsZOhCfXfr87D9x2eqrQp2p
 9rnV6IOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURewmD/
 0aPeRYQ6rCDSvjWKnRIJcolIOK3MGqzimlQ2PN5YzvyIhAHyJdWyzxAOuU0O2zE1Oa2NRenPZ0cJ89
 xA4XdvNTMwDrNpieSu+6K/mreygJWymCHanAtu8M4lZnRIc1QQiAB0S2PHxSuuLTiLVA74b3hUljao
 VLDcOtl3WxrlxKMe4rv1BtUcGN9a0v4I9qxSNC9aoWzZG2/hyuZtk38ziMe+TzT8G23n749o1frHZg
 RILO/9bTJYihnhwtjCV9ujmOM6e6weak2msm5Hu8ua9KWFOaFAgyGoN09Ox0Nut+YwkxfEp99cQnId
 oao1ipTTAkXcZgfjpuUgWLhmIGsiJvvZFRsdOtXuX9g/H1b/mmfojPnHrokuOi0XZxhBiaTYg+WdeG
 8quLYTLR9Vtp2PfaaZXuDXAWcFKGW+tvDy1dFpkqqPTXI9KQeA/wfWIIDosdlAqLnC9rXG8FCfwCeJ
 kIJGMGAQIvEWoz93A5aSvaM4KHOevj5mfm5b0nssksvKEZ7wP0gxpM1YVTCrj+vTo1doIhTzxrR6DS
 G6HqmHhulONoHNM+bvJzYiH00fPMIRsteIuQIa4HdyLweEvcQMYhF0IgYGtNdLnDH253Bxc4fOnFer
 7MAlBwHSlvzkuZbjwvCMcpDFTjeHkeJGF2Wq0arbAIN5WcntO3VeWC1vNwKw==
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

Display Adaptive Ambient Light for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index d4d585485e7b..d47bc72f09c0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -33,6 +33,7 @@ properties:
               - mediatek,mt8186-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
+              - mediatek,mt8365-disp-aal
           - const: mediatek,mt8183-disp-aal
 
   reg:

-- 
b4 0.10.1
