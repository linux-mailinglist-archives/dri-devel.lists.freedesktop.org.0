Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3918CD2B0
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F3610E543;
	Thu, 23 May 2024 12:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jPX5nZDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42F110E208
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:32 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4202ca70318so50925885e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468571; x=1717073371;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=e4+lhQwg6d0dw4D/M2LqzYSihjAzASjj+z4J8l/ZvJA=;
 b=jPX5nZDlAm14l3i1BwfhUUKFkbMmkzeBEkcNzieB+DbGo2kZZZdnNvK6tvMmMLDuUA
 0ib2yIoWfo7xPkj2hpcoHPZruDGZY/Gpmin39bG2qzm13PFRDVnGxfdVZamN0lA/9OkQ
 2Ii7oE+lqZmg1eeVpWpKhFqZKXYaQPPVkd2sIx8OIwKpjVCE2+WyGt6A2WWUnZBxljQ2
 HqOwdMxcWapY/U3efwpPTdxM1Jh5pJH0/FiGT+izlCWwEkCCowbFuhI+7EXoM2aDMhOw
 5xs6EF6Q56dvGz7xijgqZPWW7UesFDamSwH4hYcQHvMdFk9CP+QJWoGf93mtwCDoAM50
 RuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468571; x=1717073371;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e4+lhQwg6d0dw4D/M2LqzYSihjAzASjj+z4J8l/ZvJA=;
 b=BtYQTsu1bQbJDsHX8qvgGOU6x8xBHy6+xbIBsM1MUkd7tElx0LlTajud1J5O/gWMEK
 JgJrKg4C/2f/H1fKfxQoiZDILryegpRSuUXvXM28/tpWUB9CsnQ8ng3aCLQq8j7RJven
 xsWPtR1iZMqHN22S06PepidR3fjcmIkN9/Z3YU6rqCrsiCvj/tIa7I9M5Wrn5wQH+zsZ
 eP8zvhfkkhcOwwEL2BB32aO7YdYG+U+WUwg3vANN8hLWhzJVUmuD+ztWmlnLEywVkuyT
 +VMB4dxfZyi7c9BWLcNwscoTGluFX9XaqNdLQRH4YlBuuO5ur+SMBiV2hdfaPJFM+Wga
 KpDQ==
X-Gm-Message-State: AOJu0Yy3TvtQN07cMTp5Loh0dkeV7HMmR2IjbNhATaDrxsd+9A9cdG6N
 slFs+cG/YiodYVVovssd7OOvKumaxYv4Nq5xy53MCKsto8s2t5alo1uvm+qs1Is=
X-Google-Smtp-Source: AGHT+IGE22UqtsLajB5J2AZLCW6T1wLmkDjk6Ujukx8eL5dtqwesn4j29CTzSuVzDnzCA/oY9cqPCA==
X-Received: by 2002:a5d:5486:0:b0:34c:cca6:3d18 with SMTP id
 ffacd0b85a97d-354d8db5facmr3414527f8f.68.1716468571321; 
 Thu, 23 May 2024 05:49:31 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:30 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:17 +0200
Subject: [PATCH v4 04/15] dt-bindings: display: mediatek: dither: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-4-ed82eb168fb1@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=pgul3jyPnwLlRqrVeieDrjKje7AnvTfN/5pB8LOeEww=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTJWMDmQgV1eFukFRne6luvhDCe/jawZVZUNOA
 UANg9eWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURddGD/
 4pQDxdcLdE71Q27pfLrGFAI9JkPgBfXW99J0aWLRqy4VHlnPMUPUDxjN4uPw88EKX8/ofiTBGYAReY
 jVxWJwulOWiVE/UL6hHcI/dZRtlosGVE/nTzt3hM4o/yNfdvClPtgO+huPOGUW32N5UXMjkhW+zXlV
 L2aIFffducIIGxuuD1pJONWfkBvA9RNeyqZvRj2M5ouTSvnastV5wdWKkz0DDp5250jDvDz0B+/trM
 /temZhZwC5129b92SQdZqEYq33AS2tU04hHcmlpV23FNBlvWLblgTG5mOSQ50nfxrunMWV/I6ZQzNy
 ZbElei5EV48g4kbgPdAg8M1rsLaLZ1Inv9zV1AiHE7tly+gtBLAAOm/8bqTq5AFLJyK8z72nA4finq
 oTZ87Ohrw4Vyi3T+EGk5/EFoPUI4aYWS8O4oUDbN/Aw443qJbjtMrizwXKrTjXtZtJL3wl2Arkdb4I
 yeeW+Okn9sPqwjb+EqKyAYWA3iVLuT0heByHfKrRmcRFj6sn/CtYtJ+APQCzEC85GoJlcVzqcVCj5o
 k/QvVNe2a47syYoSyljC2jLLH0D6VyqAWdJ745H38BqBxX60vIOcMNRztD3vkIMgwZWeUqisK/yFqy
 2TsKkN97isXcuv/g2FhAR2TSbpHgw38WDbw40Ipzc8htIkhT9fmcWAf4kaKg==
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

Document the display Dither on MT8365, which is compatible
with that of the MT8183.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 3d4ab3f86294..abaf27916d13 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
   reg:

-- 
2.25.1

