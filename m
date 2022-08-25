Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB7A5A0F38
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 13:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64881127F5;
	Thu, 25 Aug 2022 11:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B507D10FC5C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 11:33:45 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id l8so10301748lfc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 04:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uAj6PCuWD0Jdh8SbbVYKmqZvEbRpC9H1z0Nl20Cruac=;
 b=fvXfXXHh5BGdtsz5EycnPawDsbQFYVSc5NIkbHOCBoaR5sbVKjYhKf0riJxZtsJPn0
 yLkXyOcZ7O7JIzBtCuFXAdx1hymKNbd4gs+d7nj0e4VvWl4XrfrySGc/UWWzKKDZEhIK
 PMz9IhmKovNl6wE5mKmlZCJbkOZLvYujeJ9+Z+PdLEovtKAiynUSGlYTdFQH+L9I1o33
 aPzbFi0vyGjMUfUK4pO5yOoysBDhVf7GAzunWBiJtmNBaA9A23nonR7Uj/jAlkl5+u/w
 Pqke31tLYylGnmywof9M0uE0+6i88SzV9fj6yOGafWmodh1kwDgsqFgTQIZDW9VnaqaW
 R9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uAj6PCuWD0Jdh8SbbVYKmqZvEbRpC9H1z0Nl20Cruac=;
 b=nW/vRtVF0hMR/Yo6vFMKU+vmUXHsWUJXRWax/ePEXor1KHJZ08iK5OOJgmTb+WPhFJ
 u1516o/aJVNV7CjzumMSNUBOfCXhSifv0tcZeMHQionVis9RdRyjfpV/3ZFhjpPQ+5s/
 cnYQnXTFwLCioB1zTekAI6qJxHysoeZgJa/n0ygJ9bPC8KhC2OUOAhGxUetMWA/N6/2i
 5EPpOZPutlB+fqEmP91mWO2i8ia2RNTrOlALfJFORKkVNFUdIi4TpUAhaMW1fCYN7Poz
 M9neeQ7fiS2vGj50CSMIzmorEbbiim8lEHzEboZXuDl1m++t9jQME0nv2NnSihmp+mFi
 npQA==
X-Gm-Message-State: ACgBeo0CluFw2UO5fBEmvKjNjx8aYT4h+OXR8TGCj29TPDlZgVabTg0i
 iFcL8Vo1S+CQObxZBmJxhPDPDA==
X-Google-Smtp-Source: AA6agR712qcvmFpt50SIccfBNtYn9ngIdkzCeLBRl3LE4oSeWQnKcFPJ0lH5Lj37t8pI5y2uiTBTEw==
X-Received: by 2002:a05:6512:3f06:b0:492:f6b6:ad8b with SMTP id
 y6-20020a0565123f0600b00492f6b6ad8bmr993416lfa.544.1661427223942; 
 Thu, 25 Aug 2022 04:33:43 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee.
 [82.131.98.15]) by smtp.gmail.com with ESMTPSA id
 e18-20020a195012000000b0048b0aa2f87csm446764lfb.181.2022.08.25.04.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 04:33:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Marek Vasut <marex@denx.de>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: clock: drop minItems equal to maxItems
Date: Thu, 25 Aug 2022 14:33:32 +0300
Message-Id: <20220825113334.196908-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

minItems, if missing, are implicitly equal to maxItems, so drop
redundant piece to reduce size of code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml   | 1 -
 .../devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml  | 2 --
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml    | 1 -
 3 files changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index 0abd6ba82dfd..82836086cac1 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -23,7 +23,6 @@ properties:
   clocks:
     description:
       Common clock binding for CLK_IN, XTI/REF_CLK
-    minItems: 2
     maxItems: 2
 
   clock-names:
diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
index 6eaabb4d82ec..81f09df7147e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
@@ -47,7 +47,6 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 4
     maxItems: 4
 
   clock-names:
@@ -64,7 +63,6 @@ properties:
     maxItems: 1
 
   resets:
-    minItems: 2
     maxItems: 2
 
   reset-names:
diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index 9248bfc16d48..d5296e6053a1 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -34,7 +34,6 @@ properties:
     const: 1
 
   clock-output-names:
-    minItems: 3
     maxItems: 3
     description: Names for AP, CP and BT clocks.
 
-- 
2.34.1

