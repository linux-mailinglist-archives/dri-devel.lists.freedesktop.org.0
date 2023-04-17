Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ECB6E4BA5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 16:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E74510E555;
	Mon, 17 Apr 2023 14:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F5C10E544
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 14:39:12 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2a8aea0c7dcso12731181fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681742350; x=1684334350;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mdXWnGN+qNaKraWMowQcC4c2XYV2qj6ZAg8aQ/wfVg8=;
 b=KE70/DF+2q+0fF/nJxKBvmnI7Wmms5EeVkDWdDNxeDaj0ZBUejawCRWxWx4vtZ+hNi
 BNAltsZoMzIIP6S83V1MS8G8bcXGKjlFxXpefTVQjc/WJeFiyfjIRbf79RxUMy8wob4C
 rkv1V4bhmS6XQMKd80T99g9JLZMHqsSGIC7DZ0vIAVKE/+my6RtalI2olaYyhqpz8ny7
 ZuSaIBP2DAmdNI+lkz5tns1UtGAbmsgu3WRD6Mg13zExIhALtpdbyI+mqZtvnU0BpNBk
 57NXLeXzLMes6TWNUn2xbBo9u/TXUsG+xsbqxewCH3LEJP5GRv/+y3BZ3PDNTI9CmwYN
 dMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681742350; x=1684334350;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mdXWnGN+qNaKraWMowQcC4c2XYV2qj6ZAg8aQ/wfVg8=;
 b=jkowL5N+GhX76xxGfgPIe5I3RABcPxSvJb+NIR1HY/xzsCxN4WxWi0YTZvZ64PnKpL
 I0NXMmP9FuafiYivUXef6Reixe6wZbz1CHkBHXTOHn79wHukGph+/zxGdUK6PEnAnSD3
 iXsc3zOB39ON2mxQYfGR4n0wb2PLjaCZYoB+x9O9pI37B7RnCIPTgOJZ8zCoMSumJOAV
 1GQwCw+wM9PENOYvamomsxo7bRQypBw483SsITvEbDPrVxYm4RShJrEChSDn3A4anIE4
 8fpZm4tTvNDm3OnvMkYg0n+Tc6hemjTlFovo9L4pPApWZso7O6ftwx2PpFrzMuDoY/Ts
 y4zw==
X-Gm-Message-State: AAQBX9dwcCqLP6GJy4162gtrMaMW9v9ydX5paZA5EXEiuHlCIvckt0vL
 oegwb2ToOErgC3Op70DH92XCBg==
X-Google-Smtp-Source: AKy350ZZs22FrJ75JOjYRqIRCK5ZMCb8gc7SCMH/uKo6ba7IcawT04XjUUO0OH9a2hT83fV2phplbg==
X-Received: by 2002:ac2:532c:0:b0:4ec:81c7:119a with SMTP id
 f12-20020ac2532c000000b004ec81c7119amr2299538lfh.3.1681742350540; 
 Mon, 17 Apr 2023 07:39:10 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
 by smtp.gmail.com with ESMTPSA id
 2-20020a2eb282000000b002a76b9e4058sm2235785ljx.43.2023.04.17.07.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:39:10 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 17 Apr 2023 16:39:03 +0200
Subject: [PATCH v3 1/4] dt-bindings: display: panel: nt36523: Add Lenovo
 J606F panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230412-topic-lenovopanel-v3-1-bcf9ba4de46f@linaro.org>
References: <20230412-topic-lenovopanel-v3-0-bcf9ba4de46f@linaro.org>
In-Reply-To: <20230412-topic-lenovopanel-v3-0-bcf9ba4de46f@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681742347; l=1499;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=5bPMRcgvavoc74XIAisYDrKLugQRhZ6brU3zPRYWSG8=;
 b=8Wd1zOxpgSAgmNNf1jSBv9gwguB/pPBp0P3GyRFUcGuVf4OEOfeSOjuiWZ/h5dCaAGZRurmMd0nI
 IrUkd+9sBdHvzpkvq0tOp2pG1CVO3hl8uxjejsOk5B1345tRlXh2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Lenovo J606F tablets come with a 2K (2000x1200) 60Hz 11" 5:3
video mode display. Document it and allow rotation while at it (Lenovo
mounted it upside down!).

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/display/panel/novatek,nt36523.yaml          | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
index 0039561ef04c..5f7e4c486094 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
@@ -19,11 +19,16 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - xiaomi,elish-boe-nt36523
-          - xiaomi,elish-csot-nt36523
-      - const: novatek,nt36523
+    oneOf:
+      - items:
+          - enum:
+              - xiaomi,elish-boe-nt36523
+              - xiaomi,elish-csot-nt36523
+          - const: novatek,nt36523
+      - items:
+          - enum:
+              - lenovo,j606f-boe-nt36523w
+          - const: novatek,nt36523w
 
   reset-gpios:
     maxItems: 1
@@ -34,6 +39,7 @@ properties:
 
   reg: true
   ports: true
+  rotation: true
   backlight: true
 
 required:

-- 
2.40.0

