Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 555C45A0F36
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 13:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBED11245E;
	Thu, 25 Aug 2022 11:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D2E10FC5C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 11:33:43 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id s1so25013889lfp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 04:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vJFyZ4gv7uWiZY7gLlnEc+MME2d1g+apMDYeqdsH534=;
 b=GmCvZ5CPgo7pW/PvY0w3ePfTcxnp1AUZHlBN7qx8csNaBhjJhTZFPpIt+K2tpHS3cb
 lWzmI+jsy+BsmTIO7jq8BbkYMnn8VnH0T/MmjBDLZkcSdpQfAXOp3q1+S5nKPRNOa1Tr
 V03DzrqqhMceS7MHVNL3a4SL3N4seRhJa3sq1UXzvjmU7+v0JD/qBI7t9a862HBi3Pk/
 cvDHX8T6sNyidT7M39TZ2avUKX6RLQUk8M7pezhvGR0zLKfkphbIR/04n3Euf/vV1+VX
 D3RubGp99jbSZXUgpwHkhVKfWpWLo6zQeuayC4F1PlNLImrKpG3hAEq19c19+VgiiQoc
 BGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vJFyZ4gv7uWiZY7gLlnEc+MME2d1g+apMDYeqdsH534=;
 b=2OGOUE7mMsTyHRQ9tjRvn8oC+/spm7DgLyhz0hngFrtr/WWUwwXRN6cGDN8tT2UAMm
 WHJ9OUJ7kAyXQ5WpGzwcUBbv9EBKuFf0ZcUuccqHiYw2X/5e+FX5nwPHHufOr44PhbFL
 Oz5KOefVz1b1XdqQ1FF6buT/fzuvumVYH1SoWhulbOGzSOZFiRbmIvtHEza3isLV+i4m
 EHoHx27P3OCCf2D+Jm6G18Hsn3VcMlHY/ylMLSGKhOvQ98A8Mx38fiMFAO3lMByTJcug
 gWM+VgrQM1ICyZP/SwTMruI76gS573mQz/gihXHW8e7nhRbwziWBz6hO7ioNvqa9CrHn
 1ciw==
X-Gm-Message-State: ACgBeo2jU+f3QB+yuzfp/45/fA/dScJ354IOy0F8KJ3ZH2Y/sxKLwUjj
 kA9DMPfA439Ch6fJt1aHqZABGA==
X-Google-Smtp-Source: AA6agR6HHKtOkxDIjlKrISLuP9gSIMQzZk2YFK0maUrFa24vBEbpyEy1Swt7twBvT/cLjTU/pj53BA==
X-Received: by 2002:a05:6512:1093:b0:492:ca36:d693 with SMTP id
 j19-20020a056512109300b00492ca36d693mr1019749lfg.226.1661427222193; 
 Thu, 25 Aug 2022 04:33:42 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee.
 [82.131.98.15]) by smtp.gmail.com with ESMTPSA id
 e18-20020a195012000000b0048b0aa2f87csm446764lfb.181.2022.08.25.04.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 04:33:41 -0700 (PDT)
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
Subject: [PATCH 2/5] dt-bindings: ata: drop minItems equal to maxItems
Date: Thu, 25 Aug 2022 14:33:31 +0300
Message-Id: <20220825113334.196908-2-krzysztof.kozlowski@linaro.org>
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
 Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml       | 1 -
 .../devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml     | 2 --
 Documentation/devicetree/bindings/ata/sata_highbank.yaml        | 1 -
 3 files changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
index 235a93ac86b0..3766cc80cb17 100644
--- a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
+++ b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
@@ -30,7 +30,6 @@ properties:
           - const: brcm,bcm-nsp-ahci
 
   reg:
-    minItems: 2
     maxItems: 2
 
   reg-names:
diff --git a/Documentation/devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml b/Documentation/devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml
index 21a90975593b..529093666508 100644
--- a/Documentation/devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml
+++ b/Documentation/devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml
@@ -22,7 +22,6 @@ properties:
     maxItems: 1
 
   resets:
-    minItems: 2
     maxItems: 2
     description: phandles to the reset lines for both SATA bridges
 
@@ -32,7 +31,6 @@ properties:
       - const: sata1
 
   clocks:
-    minItems: 2
     maxItems: 2
     description: phandles to the compulsory peripheral clocks
 
diff --git a/Documentation/devicetree/bindings/ata/sata_highbank.yaml b/Documentation/devicetree/bindings/ata/sata_highbank.yaml
index 49679b58041c..f23f26a8f21c 100644
--- a/Documentation/devicetree/bindings/ata/sata_highbank.yaml
+++ b/Documentation/devicetree/bindings/ata/sata_highbank.yaml
@@ -52,7 +52,6 @@ properties:
     minItems: 1
     maxItems: 8
     items:
-      minItems: 2
       maxItems: 2
 
   calxeda,tx-atten:
-- 
2.34.1

