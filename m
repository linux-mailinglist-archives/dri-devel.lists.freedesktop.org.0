Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3611E8A7048
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6009A10F1BE;
	Tue, 16 Apr 2024 15:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FXSpfqBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C42F10F196
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:29 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a44f2d894b7so514381866b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282807; x=1713887607;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7qh9PxU4hB2rhg7F6m0ON5sprlF2NLZLAaf9QKMnEl8=;
 b=FXSpfqBlkAb3yR0aSiABLZyWTR83xc0hqEBZVbnp2LfB4maecXCoWAUyRBrPtCK2Wf
 nE1fSLeLFMdLUXMlWFwdTxgQO5yz6M0Otp0ssLftWunUtQTOjN74d5vZfsAd3kdgKpSt
 5PKh3inYiPNXpPs7Kl4RkM7nd02VP2UpGi+8OjWSNe34VqR8in2/dTM3bxpA5gGkLx9y
 Nnd93hsmFKwnFlnxgu7wtSVJeKMA2Ra0cXrACAErebofbGL6BaIPNtdFj1krwd3hq+HK
 Mec0eI/tYfS/XMqxwt3uGFDam4lOV7zNkfCmAJWj5wHyz7WFJdEt/m06I5H2+ZggbUYi
 Dpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713282807; x=1713887607;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7qh9PxU4hB2rhg7F6m0ON5sprlF2NLZLAaf9QKMnEl8=;
 b=uzYKVqH+hK5aV3L5aAtdchL0k1xXFQWKolHLv3ikRwpQMyc88bmdQNfXUql7OkjBEr
 Xt5PdUO3wfgwYvlt+S09JXKs0cNRdf+ZVqVP/01CaB/5ctxq4MfUqJfBBdVhnHgyBHP7
 nFXbtvPDyKLm3aDNTTiQ7kgh2KqBT+dlrei08//BbVdlH1ZQ118X3BmKblaZEWg4y5pD
 w2GckixmT7+5dm7bskjPN12b8bMmifEYVDWm4C/F6tUYjp6j4Y4WqVKrseZrSF4YK+wS
 8k7VaFJ/qxe2EiedIOfrujYLYtBh0kowYBYbLDWGq2RZEVgskGygY/A+a4SKzso8yaNn
 8BTg==
X-Gm-Message-State: AOJu0YzdoDAAO2HXXrfDb/b3A+mpGkbBYd4ukBozuIfuDDEt87XCPYXy
 yQEV8IQlQD+YoMW6qtJRspi5+kQxV3JIs16fiEHm681jtRnTlh0luk2Kt00w0VM=
X-Google-Smtp-Source: AGHT+IHG4nMoaKSD57SAIyTlyvLPyxnK1HAvzHuj382xIJFY3e72ktmyLHdo6Y32nrQ9p7F9ZplNGA==
X-Received: by 2002:a17:907:36ca:b0:a52:551e:7502 with SMTP id
 bj10-20020a17090736ca00b00a52551e7502mr8380201ejc.9.1713282807516; 
 Tue, 16 Apr 2024 08:53:27 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:53:27 -0700 (PDT)
From: amergnat@baylibre.com
Date: Tue, 16 Apr 2024 17:53:07 +0200
Subject: [PATCH v2 06/18] dt-bindings: display: mediatek: dpi: add
 power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-6-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=P6NTpV6Hcl2nq4Xnripe5Czc4f+S/tebkAJSAKKZfY8=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7q7A3lCxlMP0/HKhvtUiqGnm0iuZfwyvQOOBOs
 O6ocHteJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURUboEA
 CszLi6XJJcSVfKekD6IFu8zgjjPhyOHS6yOkiwK1inBDCiL3iYY9FBJJODWPA45yDccHp+kS4CM1GI
 NidF35oVE8KzVxPLph5vvUjfTxPpWKMuZwCMiXrOxD4YCqgtruDi6/6+ksSklxTXykiDoXer95bh/Y
 8eMnvUYTqO56etpeuErbtPrUhT4J1A41d3l7pWDN40+/KUnp36d+I/RYO7BIdBHTTQrZ/eJ5Uew0/a
 A7MjRoAHfoL/OEmgEIdAmOsFJKqTR/ixYvBJc/dTN9XshT2UAozJ6LhB4kiJ4ztGMm3xmPyIWeXg8s
 quX+bzYiYIXQnJzLJPL4UG3Y8/TUKzTC3tVajNjQKMqB2464mzI+0hfvz3ENLxmn2/IjN/nTbnkAeG
 V2t4/XyTcFKp+pMx9GgBFYcReVm4R/jYTnSNeCbo+cYKyhWHBiWdsAKqisWBXrduxVPO3Kd5YKHdwQ
 Nan0eLZTWTPJ5EjqQvp1YEM9IiQ1nc06gGpDpZnUJPi+nBGb43mp7BXlRFovjqJi9eB3yqfnLTpucj
 k8/7+2ZXJYtCi5i8D8Uzq6FWSrUUsefx3izGPKRDfNNQUtHjFs+W+C6Nqk4aH7qJ4+GQTkC2z84xgM
 trLY+7vwAgVDrICwYMmqmo8xqFYYrarWAME8lE4m6l1YvqB+8T0sfoZEGCng==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabien Parent <fparent@baylibre.com>

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding documentation.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 803c00f26206..e126486e8eac 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -64,6 +64,9 @@ properties:
       Output port node. This port should be connected to the input port of an
       attached HDMI, LVDS or DisplayPort encoder chip.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -78,11 +81,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     dpi0: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;

-- 
2.25.1

