Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D028CD2A0
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFEE10E365;
	Thu, 23 May 2024 12:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="COxi8dvq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB3A10E20F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:37 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-354f8a0cd08so1001208f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468575; x=1717073375;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PaynX4CLsc9MHihMomyw8yza7pwT0BGnTWcRWzqsy6w=;
 b=COxi8dvqDg0pcMK7KUPZD/M/FV2mxwym4NqsekHJ4LGGDHASCSLGnk+X/p88S5s+H4
 kbP/D9Y22XF+Sw4otBs5WesPe1Hd2o+mtgnJeleBqg7c6N0B2UhNmTFzsiPCoTqqWg1v
 3XtW0W5aaQTP254IAlvo4jyCOA9c8EVNFlDSlWPp3R94NYmuyHKp8MJSMbobkJecVj62
 I5alri5DCeuH5JnSRrmUpK3KWxb0mVrs4uiw5LrRWewb5ufkGgC1LPMLtwHFg7hUGs/5
 fdO+hPC/oebcHfbBJTcbnShB52dc726FtcauMB31QvbSlsHus7A2cJd1jGJ5va+XqfJs
 OFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468575; x=1717073375;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PaynX4CLsc9MHihMomyw8yza7pwT0BGnTWcRWzqsy6w=;
 b=D5zFfY7FULDP5P+6Vhdjyh+pN/jQ0WvamEv+K4OMyA0mYX0FO5k1SZltzPciIXaULQ
 CyJBGKE7W3DRR3AX7dXTxM14StXy+pLYrUu5uYbA6al8m+nEQkVXEU38Ms8LxtR+ftr7
 mf4BacjfGZ50ARkzjFOT83tFtCHb+hVNP1rVEzpECPEnUNepfQY9EUYJo+wh3bSgz6ZV
 qvrSnODFhVI5tHaxM/5u74hQQEDdU1LgOepjQ6Mg/6sK3thU+JTOXc9iPt9lRD25mLXh
 8jYPgtpU9U/zbyAuWzVjtadMVRjtVeAmj1NsWeMEsDXk5txEcsUlIN49el4MuIdMZ91X
 zGbg==
X-Gm-Message-State: AOJu0Yy43yiu1Zt5sffFa3IqMtiYgUQbJwbIf6dygL1uxbDHuEqnhrPu
 PrVwLg4ZtuLsOE38NDdm2eM8VITgy0PxWi06y1NbbmbPDY3/QgKQK+CMy9uwd7o=
X-Google-Smtp-Source: AGHT+IHrxKVIn+Ah4T60PhRTqB3+VWnYaiGrW6bwaLsVu7Mv9Ph1QZoghW7iJVxfZBri7m2KYPvfcA==
X-Received: by 2002:adf:a456:0:b0:354:eb35:a02a with SMTP id
 ffacd0b85a97d-354eb35a23bmr2884242f8f.70.1716468575603; 
 Thu, 23 May 2024 05:49:35 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:35 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:20 +0200
Subject: [PATCH v4 07/15] dt-bindings: display: mediatek: dpi: add
 compatible for MT8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-7-ed82eb168fb1@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=ofsgAkx0Hd1eRdaHM58268obvfR9196ltfSHKJAspXE=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTCd5N4Za7TkELJ09Q0aesgnC7TN8Qoc+T5A0V
 knVQ1uKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURTLbD/
 91F9gMAuFOYgmF+MAGvE/cY6jranhCAPq8fzGOEdtuqzJ0p7AOpHHhHXC/kZ+OIZabzd3pf02nCIOn
 XfCymikLALbvweG6G5T5fM0OQkbYANV3defBGV6hFEMjjh5+LZNLSiofRDeGELdRtHc1HtMC2OESWU
 rDVqy8dLnMYO3MdwpHahhTpT/KAkgOR5uGW6TxFpzYJsNjqPPObt6YadpJiH/RoEY8SgrQ5yI1wlro
 EpO80JbZqdH9bDyMVh+NxuN22stpZSh9E1ag3pBuAxW6O7/kVG6nvcsQz84BkZH4H4dZ5xAbziAFBo
 zqe4BxJnDoqiq3iDkE9yC5+pa+1W11RCh8o833mRoz7++dYlU7mmP7kxT24M7OxnReGfOUl+uoJv3g
 lZuVZvMtv1j/eg6pPRSKC+lkXo5esu+YST/8MJ+fhPW/9GdgzQ+ZJDtcMlyjH8MjwrIW9b7UBoHEAC
 UOaZvloM4OTolWKfTSswUU4PCvUhvz4WcOOAX4CLj3PzO6KPNjMawmZJcpAGMCV8Of+ouSJo5jAoP3
 XFpQuf5bzMOMrHSwFfe/uXvejPpv5LTWaKFO99pcG+Y52JYDWO1mZvrDJltWEsY6XSZGPe+O2AtMh4
 eXpg6UyLhdqHp72CcnTYXFaKbknfZkhCtEoFjXk5X1wmbLUl95NOMErcdEtA==
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

Add dt-binding documentation of dpi for MediaTek MT8365 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 169d054d81ff..21b93f356901 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -31,6 +31,10 @@ properties:
           - enum:
               - mediatek,mt6795-dpi
           - const: mediatek,mt8183-dpi
+      - items:
+          - enum:
+              - mediatek,mt8365-dpi
+          - const: mediatek,mt8192-dpi
 
   reg:
     maxItems: 1

-- 
2.25.1

