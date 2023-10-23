Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2E17D39C1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3934710E1FD;
	Mon, 23 Oct 2023 14:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7857F10E090
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:40:40 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-778a108ae49so332353885a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072039; x=1698676839;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7qh9PxU4hB2rhg7F6m0ON5sprlF2NLZLAaf9QKMnEl8=;
 b=hrw98WW/BwA4Adw57P+JlwWYTO/6b4E6kaHqeEOfSGznRBsr/GL+94f2/Z8B3AOOVk
 7j4qxnL4Bf58QXZmCVuQeAUEkOBm7SAf5utQwEPCbazOgvGspopHOTFbv9Gt+Y5MfnUV
 qPlxOiMSg7BBPoPgdxiED5KRSLwSc/HLZ2NT8YWPSLtMX3ZAcDFG9zFLJWgZ8Gqq/ZMe
 YFy8PoFHivAyaTntmI1TDnb5UNY/9NrxENYDENvfBZhP6o93OugIHeErur4+qMNB7YTm
 Pa2mniwAt4pLE7DctUseuGp3J6+poGBuZZYQf6qPBhMRM5+Fc1AUEKqV4lCC5YserKCD
 URbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072039; x=1698676839;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7qh9PxU4hB2rhg7F6m0ON5sprlF2NLZLAaf9QKMnEl8=;
 b=GqfXuUeuCYMHesBqWGj/2bdTttXaC9JzfpTJmcXYvq1A+3Kr9Z2B547dL3vgtsujVG
 PHiYDiq7G1RYjIDOx/cAqNam4PpukA2yrMCtx/rmDfbGSi9/3Kf6I09/8OeClrG7jAJe
 1Q8n3+FXyoCiSIp07DRPBKDlFLys3LUY/qK3gX6roXd3Rits5bZ2nM/KRs97xBHPwY6V
 VA2iv9nhAe97sfXmFfw+X3PNdtQ1P1fNCuEpBQMEhTjcOS4cqMDhz0QP2Y5YR26hLyKL
 X8q9REhU8AcPrI4Q9KSCuaxzrV6Dl1EDyN7Rm9br6oIVUSoqMyk2LviwGusyfeeKKZjB
 aoUw==
X-Gm-Message-State: AOJu0Yx7ADubTN8VmTnikHMPtC+rEBJJp1p0fAXKx4TJviyacKMT5ppk
 tr0wuViyVuImlY4O7TTdXP/abw==
X-Google-Smtp-Source: AGHT+IGmkh9O1L77tHkFCr0ysnRzrxjRi2acXqt64UGUhhSvN/MH3ee3+LZqnzFy176Ke8Fnz9QwRg==
X-Received: by 2002:a05:620a:2590:b0:76c:a952:c70f with SMTP id
 x16-20020a05620a259000b0076ca952c70fmr12157510qko.35.1698072039552; 
 Mon, 23 Oct 2023 07:40:39 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:40:39 -0700 (PDT)
From: amergnat@baylibre.com
Date: Mon, 23 Oct 2023 16:40:06 +0200
Subject: [PATCH 06/18] dt-bindings: display: mediatek: dpi: add
 power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-6-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=P6NTpV6Hcl2nq4Xnripe5Czc4f+S/tebkAJSAKKZfY8=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPLAFxugtO1wZ1wc6FF7eR6Teq9Ksq5ScGKNOo
 wQqT5GaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURU8PD/
 9nARfanwZ43dC7K38128J+6s4DtRyTG8Hj37dZv3E61VaZVngol48cTkmXw090pPu59i5eED3Je7Zj
 j23oVIMjIX68q/zeBxDw4f2iBdqzrQpcfbYsEJM/wyt9jzk9K0d41kVLw2EOuf/8CcnISQFn9v0vr4
 Ba3mxWWRTn3rke0AR8IAfs/3OVQrzxbT1/9ZYihMIic0eoBoE0rHOxX1qgAux2bzUPRkTjecZF1NZE
 1t8Y+rNbCXFXtynEILOxuQeYMSudfUWkLJ3DmObNMbbcMvXdcBKq9TWTRn3nu26GnrnyKMyc8lt32s
 +eybrWvI8JX0OlCT3qtGZKq6DjCs/2YiegaxQnAWVQqwQlmbvSy7i182JHCPHmsdYy48fpz5pyAfQN
 tX5f2ghH3h90rmfwd80LH3T5u69lBpIUgNl3xs56SqCZcESvviuxGUEdKZRcWKHHAQlLr1Qx58vfnY
 4swHECrNRS8mQvQk00mISHgkWFE+FGp21hFuG126GPOpCSQetVNlq9Y+vLWL3hTuYAJTtcsOPFdm2I
 pfljEC21uDHrwGEdXicc8Nsm6w40nIkw6t71siqyx0vgQ8PchwCecgKZWz/2yuqO2XlOaICRDtbhU4
 4Cn75XRdTzR6Ax/7Q/RCVx15kQa1IubAdplkKWdvRb+g07dHmShLPZJgHFTA==
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

