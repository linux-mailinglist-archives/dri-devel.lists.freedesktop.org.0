Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EB37D39AE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845EA10E1F5;
	Mon, 23 Oct 2023 14:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7D910E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:40:44 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7789577b53fso215175285a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072043; x=1698676843;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JZz9i6ImFQmqM4y5QrZ6koA95MCCt5tnF575J5PorR0=;
 b=pHKuaT8nvMsvWQ140b8PLB0vEuXgkYG1z0skr61iCs/azNnK5tCYaUvKWLB2w9c1eC
 4F9p/pjEWz6OgKR6CTmbrqxcyCOjHO7ZuiVxG/zGMkLRw3ADT/w2OCln2D9mWAjeXSIh
 +H5aUf/Qbj6ubKvWsMZLh9UJXDwHuDlmLw+XmNTHKgRG+bRrQeI4wipfMkqa+KER+2W5
 ifSmV+leOm7seEpSeOcAanl+8iStD0I2fNEVuViLa/Jzhs8iWXy8ponaM08Bsg/EdooK
 I/ILaKT/+xFTrgPNqzuD4KNhn6JVBTZ8a89gPc6SRQTmLNS+ywMR8+dsMhSvubYdCMn0
 Nwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072043; x=1698676843;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZz9i6ImFQmqM4y5QrZ6koA95MCCt5tnF575J5PorR0=;
 b=IgvZqWkiCCstB2d50WqfsNS0+Wi4GNGN999faRGdK3jf14ufJqNHwmuG8E0L1uaQbg
 SKL39UArGUVPwDU4YjpVT2i7b4MBKefp6RqUuKDEjr44QCv+OU9jYQhyz6gZ73S/Wh8G
 QXDIz4T5qjKN9hFMewD62S9Iliika3bElRP7NgtgmSgur6jPMITirgezhZko9aILfYjq
 Lt+Ns4p7weFrgex9n3LxT153eMqCGj1i5YiJcyuM9nGNHiRcnfbmCdZUvL8SCQin5ozV
 l0375j9yjYUtVbJgBLq8bTsv1DxLIZQ2Ah955uS0oupKGK1xW/EbibYAHU3EVIGQbFt6
 3lGg==
X-Gm-Message-State: AOJu0YwOys4TJyJxdK/NzN4RDrK/ymFg6mqlyUyRazJiKarAKj81ArJA
 nUCVjFDMDF3T3/leqwxJuabrfg==
X-Google-Smtp-Source: AGHT+IHbPwl6Xj7okP15FlZMJetuD29qDDNSXkimIr93x9jaXLYk5EpuaT+glnhtgHxMvP6epra6AA==
X-Received: by 2002:a05:620a:4308:b0:778:8fee:e863 with SMTP id
 u8-20020a05620a430800b007788feee863mr10472895qko.75.1698072043216; 
 Mon, 23 Oct 2023 07:40:43 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:40:42 -0700 (PDT)
From: amergnat@baylibre.com
Date: Mon, 23 Oct 2023 16:40:07 +0200
Subject: [PATCH 07/18] dt-bindings: display: mediatek: dpi: add binding for
 MT8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-7-5c860ed5c33b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=jKTgLJ7tZRm38ANNnWtNI/u763F2Jj1UVc7V+THD25Q=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPxIX1QNuRobZW6u5aV9tmmhhr5yqPuC817lI4
 62W3Xv6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURQE3D/
 9gh0ybUwT+mSx5ZgcOKs8AfJtTZow7les4rs5WdR/ORkQzY6kXCEPQHJGwSm0pR6fHVeLntm2PWxpi
 78A3aSvnwtOhVtVJoriEEqc3VPTXLDGdncGNzxQgHjIaJf/qf0g3vXhMbQvnMcTGQKq0P7ofP70yRS
 yp3iq2ADrr+onPPVI9x5OqNqqrgou/rGorFRI3j6YUcUVuRk0eTZw2mvQPpRvhPou7cvlatR+mcOQd
 berg1tg3/mYPJutWXRz5ap4f1oflMYsg3i9spOCvvx7hjuYxBpU1hHWorYsM9gg0IcXml/oWyQKiQM
 17TD0yEEYJ/kIkt+1+FITaxqJIiV1yZC2y7/mWDR9lnavla8+8MVs7z/ISJu+CDzxrBIQyiBnSQ9Dd
 nEexfUsenm4xIu0EvfZMG1E3iAHqfb84Y4Pm8Ot7gLwQ0Ng2dN5kKXmT5Y0RgVOoRgtNmNyJmJiJ0Z
 SL6XNuTP80brDNxMxods4dmBecGPUVrhSMLc+2jle6uyNYeODCCeLeCW9AqK4oBI+BgchKhuIOoHCl
 +ER5rAlg0xyfWbsj1xq00CDmneG0+on57XQ++jBfGnGN6Ia/00PiXrCamZVX8HYu5PLJa1oS/DykiZ
 RsA4SIdFr0mQ+fJ9a1qydzvN8kxnhcf4lPkehbldTFcp7ns0U5UFtjtzHABQ==
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

DPI for MT8365 is compatible with MT8192 but requires an additional
clock. Modify the documentation to requires this clock only on MT8365 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/display/mediatek/mediatek,dpi.yaml       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index e126486e8eac..c86527c33acf 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8188-dp-intf
           - mediatek,mt8192-dpi
           - mediatek,mt8195-dp-intf
+          - mediatek,mt8365-dpi
       - items:
           - enum:
               - mediatek,mt6795-dpi
@@ -39,16 +40,20 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 3
     items:
       - description: Pixel Clock
       - description: Engine Clock
       - description: DPI PLL
+      - description: DPI Clock
 
   clock-names:
+    minItems: 3
     items:
       - const: pixel
       - const: engine
       - const: pll
+      - const: dpi
 
   pinctrl-0: true
   pinctrl-1: true
@@ -77,6 +82,20 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8365-dpi
+
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>

-- 
2.25.1

