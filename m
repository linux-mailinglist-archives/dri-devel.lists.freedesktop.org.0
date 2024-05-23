Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0288CD29D
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A908010E31B;
	Thu, 23 May 2024 12:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dbcaSRvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C140010E208
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:35 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-35501a905b3so257747f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468574; x=1717073374;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xenplDX50PgsFz2Mhp85GrWLaCXcLNdChHM7TGUmR30=;
 b=dbcaSRvEUVMMqrdn+hXEMCQvhDZbT4VoEea6Svk0JnsZFCuzMtxcRGBT1GWmbno6MB
 ZwmK6Qu1GoeYnhBOVds5wLotzcBeKfBiQns8XoxjVQWCoeF9IOTqAiyDHdrpUBPGrrLL
 +MCOWKmTYYuC3rhmIpdwB00gritZc/ZL9vDFnbtVLf0AtTShYAk8pTS1WFIaWDK0uwlO
 OUcy5TITpHfOzYkWZ7RBCRrNMP5/GmXuc6Wu+R5MH5AEhluxLsdUxrBtk0uhGFFLr/Dg
 KNAPGYe8q3ixP9QYAZP7hp59qOynwtbZRPZ6JABAAZO+6ECtTOh8iUUMaBVMojNT5OgU
 6igQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468574; x=1717073374;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xenplDX50PgsFz2Mhp85GrWLaCXcLNdChHM7TGUmR30=;
 b=gxyL3ND7Dzv+4XlyUQPXWSzBSKzlsUvGNgF7+tPEO8YFgiQ0S/HZZMXbY7DQu8RF25
 Qw4IIStUOlYOiFIVUBf8vrB8GUALfzxmRjLelic0L0qpfWhiCTAr7h/NlNK7tapLoALU
 2ySXxds+dAiMgLt3GE/So+c0CkB+UqWwthbLgNMv3462koZo1BxwRtxbGwt4dUbQN1IP
 vw+WZkTUOweA5frKpO8ctiEeRh5iszcXv7ZHFxH5DyfLDU6ojlKXqfesH4xvRQs32k3a
 X6FnOcX4bo1yaKVGlQs0cnuYDbGAL3EGsi4ioyIJfwDArVWClD9/HBFy7uNFB+Q2EsnC
 j/pQ==
X-Gm-Message-State: AOJu0YwBbNGa6PTjSCdPGK0ukmvKgF4CBLcjrxuZtSZVr4zxFyAljG8v
 pGDta33djhy+wy09A0V/foPi+nGrb+O8kEeADh3c6NMMBja7h4Cpeb63iwB/tWo=
X-Google-Smtp-Source: AGHT+IHKcCo5SkmMzoymqkjybudh+EkK1WbZuK5jxJV/cF01Mbd4x198B5LKwj085upJo1QzzuY8WQ==
X-Received: by 2002:adf:f192:0:b0:355:21f:be25 with SMTP id
 ffacd0b85a97d-355021fc4ecmr507776f8f.7.1716468574168; 
 Thu, 23 May 2024 05:49:34 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:33 -0700 (PDT)
From: amergnat@baylibre.com
Date: Thu, 23 May 2024 14:49:19 +0200
Subject: [PATCH v4 06/15] dt-bindings: display: mediatek: dpi: add
 power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-6-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=XahM8CveSVHt1oE74u7zHenJKYAxVWcUJtTL9lMvR8E=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTZLC6mHLbIv5Vn+HyPUhla4L7qCjuTNx0/N51
 3iYjrqaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURSOqD/
 9tudSYcwhpHYqdJVEwSxMTGCUhcD7VJyYs89HVB8ojqKBOzu1ofAiFlw30gn/v/yupim6rnrAZ1qhB
 98esztDXhRsMRf6axAX+D5VrcV3RLdtk68I0mNujM8nTlgUptXYAdc6AcZDmrqpcWbjF5tf4YwOAuQ
 OciVXFTCK+HbpFXvw+aYmy6C1spxfUDh5GiKP/rQG6mM6JRCV+o75CXmCIbeb3eJ5JVfPMWeufW5LE
 VTEw2tslXtD/PmkQ5OmH/YWGjyz/+UZxEzvZtAemr/5YJqh+xcS0D6V154dM0NXNWb5KJPX9BdjDdm
 uw9IkambKs2Kh3FJBZzT4XtELKZ6ssLtKDm2oy18rqr8nw8QnlMZW5QtgCO/KZfFezYgQP4FcX46Oh
 vl9+BXSXq/e7FCQXF52hMvvUC4h7Xa9ACilPVf2rGVFrIKoSNEUc3C0zumDnkJ7fJlYFDcfyyUrQDR
 eJ1dwwFmpCGA8llnZaK8YXDp165TWVmW7YIKvsXhWySIL8cz5rXLzr6vsatBOkAsGNx8Fd2gRssmoG
 tXSVmult4N9W2IdAbmVFxlt2HFoyQVX1uOcF+yYy/pON2sypo79Fttge5+qTDdXWatTZQ2cFlNYCkN
 sM8LFjNajmruxjPmgQIRYaAwvOM2GuGhnaZPX2NSc6xF9jb08HTnAH62ajuA==
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
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 6607cb1c6e0a..169d054d81ff 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -80,6 +80,9 @@ properties:
       - port@0
       - port@1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -99,11 +102,13 @@ examples:
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

