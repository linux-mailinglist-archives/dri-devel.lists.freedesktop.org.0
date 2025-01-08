Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C334A061AC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B5810EC07;
	Wed,  8 Jan 2025 16:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PG1i8LZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD18510EC07
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:22:18 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-385de9f789cso12582732f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 08:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736353277; x=1736958077;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IG3hLas3UfTPkozAfYaKba7ObuA6dtQ/tq4NQXQommA=;
 b=PG1i8LZHZoGwi1dc2ltjlbJWZjoVlvGDlPB4+vzAq8P4+9g4mbHCVc3VAbtOlifKez
 NMhVRsSyqcTVqXdWlp8S/Hx4rVMNXinIH1VSSEi2NK9SZahuB9yUbAnMA5VGwYKI0l07
 jhlrv0HLv+S7AVb1M7y3I/e+0O/7Dgnh4NZHHU6GSJmKae/K69/nUDP4StrbvTydp4y2
 u0XxWhp0KAMdLD5DjhOK/E+Jl2+TZqio2A4mFBBfH4X2MkUjbDo98xh1I86Kxmt0lWY8
 CeXu6zOBvFVKtxDOVCKNlzKNkXZmK511Uk874pQQXKbpVoW8IoXcrUsG1CmeDwIzoBsU
 677g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736353277; x=1736958077;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IG3hLas3UfTPkozAfYaKba7ObuA6dtQ/tq4NQXQommA=;
 b=uKeoSzydnvPnMNeQu04PlF/Uys6cCAeBkgxLNKS8VqzddMFpKhYtdWfqq46Ct58jAj
 wIGyMDwxTnbpP/NkUDOSDPRm2Wn/6nXPdkMmKR00K8ATSP8mMi6DfuLhhFFLxBDNZhmZ
 bMUsqpNtD+/OB4vRdNmSIkavS3gYDsuILkP4vx78vJ7nSXqVn6zu/VEBbz3W6hAyjOKp
 q6KhNCOIosbC190aaPKIdFZbVNjMUv4Vpyv5cAUrVOP/jhRGvXRIO0LJgn3dxrgSK9G1
 ngVcmRpyhvSfJJRoypjjQcBIG1lidJ3KVgSvc7bWsy59Qog8xhX1HJQ/QzkiXqKHI7iZ
 dhBQ==
X-Gm-Message-State: AOJu0YxdSYNhex3HiyVeI15FiXsYkxQ38UCFRwH8L9OrFCGRAUqjug6t
 H2pJuxgbhOKWnmML6CJS/gyKdzPFGfKLyoDCMuRk4pfGF3l0+DhwyWsWntUmAWFVLkfmssazKOV
 +Yns=
X-Gm-Gg: ASbGncuEOt3kUewc9lEkNOn2Jg+uXUBafsUwCjhi1H0S6eJqo1UJcNYqAxK9QCNfMhV
 oCCZvXIQQRrnkvb/JcJt/63taEc8t99KTMu277mnMjQ0NoH9WXromkLWFVbE7u4l1qqXm+qyDG5
 dS7BSzkYzEpK/GfP2/MKUuBsFvRnJX3nRber7WvwvDkjtK7SsL6kZm4Q8SePulQ+1lFRpeqDit1
 yG13DuXS0Pk0UQjkJhFaTY1QaUVSPB5LrTzog9Z4MPcU9sb5UnJ2+1TPwbE
X-Google-Smtp-Source: AGHT+IGaEwxTWMsJfLtdd1I6PoPqL/PTANFRWph7aumfUnPlCkceeFP4oivIGxhbB8f3iUZetscqaw==
X-Received: by 2002:a05:600c:4ed4:b0:435:330d:de86 with SMTP id
 5b1f17b1804b1-436e25620e7mr33395155e9.0.1736352948494; 
 Wed, 08 Jan 2025 08:15:48 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 08:15:48 -0800 (PST)
From: amergnat@baylibre.com
Date: Wed, 08 Jan 2025 17:15:43 +0100
Subject: [PATCH v5 1/7] dt-bindings: display: mediatek: dpi: add
 power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v5-1-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
In-Reply-To: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=3t/5pxgQVWN7RxuofrCRFkP/dHvG8lcvXKXop7859wM=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSxAVfPOiiIfUU1aZI0sXET3HOzDDreNQ/UVUQf
 9pAs9VaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksQAKCRArRkmdfjHURV9eEA
 CfysJK9hX3xkHwEMAwlWyxohxYBetop54h6Gncy4LRniwOmHwaHW5GzckCxFRrulUjXJ8QlWAFaElS
 zuQ4mYO4jWauG1rxAYsPVUmIEmV6gYt9nDspt4oEk1s7XGXtwPDIvMS8hp4hkOoHOtPY/c1KO17ZxN
 Cu5CHlgsPXPtE0mOi4R4Vl56mKR8BxxBtY1H9FlceZDOTC2JsUCcpelsbF0Gvl1er0x+EIpwRGMLms
 dURg+Rl8h7q5FSLBnsFVqce/IhTw8mq6lfNk8+5a4D9uOfgeIqpc7rh1oNa+/I+JEcjf0e9Z2w7dwQ
 X/Fxs/2ALXuK9+uWmIUuKLCmNBzlptr4pK0PeTfSAD5WokQOPnp7Al6+5gF5avoUeUPZ0SqrpRZY8G
 o1OcxhBWiakMhAncV/t1/WtlqTF9qCPmaAhO3mHaGazYrjQuTWCC3aBxkt1S36+mTwypmRA7YRCIOr
 g07kxlvKNxEMck3rqP032ddDR5JU0tQPvBSFLnXZuxcXUvCDwqJzfnPyUHjXfOnD7mYA+5ynXrqKtg
 uvM+O0FAKnJruleQtvWbMs6d6ta6EOqdr+6i+SbqNP1ARB5WeuLQZva2bkGarQdY/G2bOuXE8WVcr9
 LaDL2vMN29vq3jlQJpBtUa5iVa1mV/UuY0tmAVhCV6He7z/gP2JPfQBvepYQ==
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

Fixes: 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 0f1e556dc8ef..d3c4942df58f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -97,6 +97,9 @@ properties:
       - port@0
       - port@1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -116,11 +119,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     dpi: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;

-- 
2.25.1

