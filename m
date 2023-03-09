Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39656B26C8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4E610E82F;
	Thu,  9 Mar 2023 14:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAE210E824
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:09 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso3746425wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371788;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6y0EgOYSdMDz3+KorrQ0r3k6K66g6XiX6jBZImtrVOE=;
 b=7N7405SRRIId6Fw9WiPQgwLQVdf8pBao4SjQy4WjpeDtFbYOlj1zaSVkYButa1kbc5
 3R5RoGJY7oYCD5pgDTSSWb8JOvKBIOS8hwAv6ZpeMDc555SqmuE3O9wIIMaDRUoavKcY
 jmvNjQYpmDsAWn46qMoLNchn5Umbgzcy+bUzTfgkZEOnqgJEJuh/Soa9eBTXyIounf8v
 lRon0sAiJiOyEVOQvah6GySvSz1w9ot1MpCQ8I/q6bZOploCxsOMmC/zTOnfw8RYulO8
 uhDwcOWMZNtYvMO4kLHCH/U1IrhmOymyLU1AIPx9sYox8GXwVy35gP8w+e6dDbj433Zx
 QUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371788;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6y0EgOYSdMDz3+KorrQ0r3k6K66g6XiX6jBZImtrVOE=;
 b=C1w3ltP0A2c/SvvPKb0F5N5g4NymTnfHsnIz028tHe69IIyRF1Tq7dX+4x9fWx1lS9
 naY8NkAz8nx5dYcGrhHW0svVBKIl/APcZQUOz2aCed6evHUBPpSgN/BfMFZjS7FbrZsg
 WL68Ujg2I8pfeS+K8T5PNaV3xItNMUY/jI3VWjrOSKbVSJMtQhwjFneiKOkv06Z00a7K
 esz0Kb+M6CyQLgsU1bTQKvWkFyqnobXKURDnFMk15uPgpexhAKBv6eDgjugHyEkokRvE
 1OZ+5BuHfNhbNx8LDR/kJpEsNu6AG1Qjtvd16p4qDEkquat+3WDKaASF3H4gptB5nFub
 sf0w==
X-Gm-Message-State: AO0yUKW63xKnBqa9g22mLBfFRWvVtUeuSrLrxA+1/K0AbXHMamDcNg/S
 BIrzTfBwHxAiD9xO2S67iUTEKg==
X-Google-Smtp-Source: AK7set+9KAEqvfkzyPxOe24xna17NfixCHnFQT1MzH0SsBzNDwwIU8NvgfCPuEJSgKKoNJIlQbqsKw==
X-Received: by 2002:a05:600c:4509:b0:3eb:3c76:c241 with SMTP id
 t9-20020a05600c450900b003eb3c76c241mr19333471wmo.13.1678371788034; 
 Thu, 09 Mar 2023 06:23:08 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:07 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:59 +0100
Subject: [PATCH 10/21] dt-bindings: display: mediatek: rdma: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-10-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=0pXneIWCTN50mIGf1jyLG4V31thLbsARL6qKXISFL2g=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+xfM/cZ2Igd63sOwyiQObtBeytnZiIiEDXquP
 icSKEGeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURbr7D/
 4g3s/MVLsDH/3hXDBWmGYtJJhkxZNvV99ygtDkG/1d07uedV8fDZC1xWkFzzQdTXGtHD7DvP4UP/qP
 5fWoD7es0JAbByTDpeOzLp91dk14rgxRxlnCpROWB8ELu8KpvgsEknBlDAAn4gF2MOFGuApXNCMF36
 qhJR2HV1xBXmAKf5w+9sfGys6a/gGEJ7PBduVWaOo0LPtD4ml72Eb2VSRjeP3IkTqB3Qv2R78IdTpL
 OQi160kpwpKFzFkg27rshPSre9WkKfxA1Xilsh7LdcxHCWOh7R9Azq6HXYkjFasqv91sxXsOA9awvZ
 szc4mNAlvbT2PuIjeXL5Sa6gfIeKxRopFfw86DraLV7ORN4J9m3mq2mxUpgEcRIfVGOO6S6F5NS7LO
 pgbgvxclOWGcElkO0RuwiNYDKjZ/hjPfaYJvR2sBHt35csV2ySWw/evGi6M4x7ow+qL5UxrhhL056O
 Pj391MDejNNLPRKEDjTxsJk5gXECD2GaosO2SIuPneuevFav627LA9mTtm7ChW+yx9CqpdR61pcipg
 Ux4yIHqdgEofk8tvOahsTlnUKggEx1Xmvzi+wvpXfl0mCDAaoomfsmsCFMtxqHgcnWN9RaQDZQr+uJ
 UlW2q749LwKncbuiEdySOlmmyV541tw8J0wwzFSYRN8i5R/pBBsivBrMqGsw==
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

Display Data Path Read DMA for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 0882ae86e6c4..3bc914785976 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -40,6 +40,7 @@ properties:
           - enum:
               - mediatek,mt8186-disp-rdma
               - mediatek,mt8192-disp-rdma
+              - mediatek,mt8365-disp-rdma
           - const: mediatek,mt8183-disp-rdma
 
   reg:

-- 
b4 0.10.1
