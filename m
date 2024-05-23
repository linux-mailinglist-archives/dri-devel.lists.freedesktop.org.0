Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9658CD2A8
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D24A10E3EC;
	Thu, 23 May 2024 12:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n0edqK7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8258610E20F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:34 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-354df3ee1a9so1645800f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468573; x=1717073373;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UIRR3PAsLDPeCVGxCiWamUF0dUalt0OAF0ONs7qTios=;
 b=n0edqK7ywigcvus34ocubt+aZtEABjA7t7R5xOP+ZZXrlP+xbRyxPK2XOAAaOftrd1
 mRdVBGd62w8B35P9zVLc6PoxbxQgusu/HB9PAmX4Id3Yahle3M70jWbt1SlEJw25RaWY
 i7y+2Mjx9GKuY/5w9XygNxQWjRWWus8y68qJn5ShB/5h+be7YJc0yU8AEQFG9Df4ojHq
 2UgMslb14TEAl5T+KUDYpEfJzs3z/XTAkhOXqntZCagtAQFsYBUGbJ3dmUXL2EElvGR/
 1jJ3kRiw2xWptXAGyOGmy2nvRzm8JnoCKcTjkaybBx8C7P9vk9SWai/daFLTdgnDpdD0
 xuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468573; x=1717073373;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UIRR3PAsLDPeCVGxCiWamUF0dUalt0OAF0ONs7qTios=;
 b=HCQemkh3ziHC5dQH57bQqh+4Gm8J0H60E6OyvJ1Izjtux9iVMdoqHsMURjQDat+AzM
 /ifCsdu8xsAef+l/32eWtV7s8T7QvFsvrw8Y+5d96lkCIBh/0f4AaTtgoVinZTzUcOhn
 bpL9bPGEvWw+3GhZmk7vPh2B4uaUdudtsjel13ewDfo61WIatGmUxlpJTapXFSjcAgHH
 iHiXRUpuhjBem5OkCvuhuf27L4/pTKrZInMr9RgBHqUOici1TI8Gf1HDIc7uO+cJEyy1
 MT1U6c50oeMYHPmiFVe0y5QQepULER87jutgI1e5Y0e7rmhbcJ0VsJcwSOyf4WJNLRrV
 pkPg==
X-Gm-Message-State: AOJu0YyS2MPvAMEgrcdvEcxPa8Tgscu3+JAKo4PMqephjjvsS1BFzLyu
 TRlAOxkjrQFO7f+GszCmCvKn2Rwx/gyhwmD8Vs2S0htat/tceOmQSl7otnNptuo=
X-Google-Smtp-Source: AGHT+IG8b4YiHAdHYRablfZZQ6Dn6FlVS/F/SaioWLZ8QofReLYA7LtmbLwTsCsrz9Ysprqw4ksAAA==
X-Received: by 2002:adf:f207:0:b0:354:eb2d:be00 with SMTP id
 ffacd0b85a97d-354eb2dbe62mr3152513f8f.62.1716468572639; 
 Thu, 23 May 2024 05:49:32 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:32 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:18 +0200
Subject: [PATCH v4 05/15] dt-bindings: display: mediatek: dsi: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-5-ed82eb168fb1@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=9kh6UGARON/UIfmPWxGK3T+BbLphijrZt3nYZp9vdEk=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTXxqS0hmmz99kc6jIQPW0PAPiCFWxDDtx6P/n
 7AXn33OJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURRbHEA
 C/PkBLP8vnZIf422AHZD2BfrARu79PMnaDfqDKnbla/IQshdf9BVJjs1L4BAXEA6TTpx+amUNn7Dc2
 9jwTLa8jJBcfFWRUV7TS7TYh2Cv7iUlFTXR0e/iYs0cVraWfpa+aJUSKJHM/+M994kskXCHFLvFq+8
 lTKzqpjzGkE8TX53gzag+3E7axudpA04GS48/fo53U5i9N2nyQhwjh6kS5RSFxp+G2UCjRFWCKsHY9
 uLFywRRlJxu0yJLN75GWz79zfVp5kPjxpTVroUms5GwioA7mp/NGlJwClop5dotRbE51BzhxUub6N3
 8uwIcG9Y2DMrhDCE1DCFiuXyMVDGjz8Knw1u0JEQuzCRIfV13wt7VRUsnI9EuynwCdbB2vw1bpqYa8
 I3HR1OdVZc6CT+7FBDGIv+9I6PJTbFsB87H+iXQzFpkfUmDmjBf5LBYbbPTZe+lUGkkPRE/sj7pFjm
 xCM8N/nqjYNPQiSoAIriUHuf/oiSqjbiX+O1rDSYgC0Dm5W4SLUOz5Mh2SzbJEYWf6CZcEg8kFcsPn
 jeeuPe/HtutARF0lGyaZ9bcb9nYYBgmgM+hvF6c1hLzd9C89tWyZrq2tgbSfLZ8ZTNd7TGgbWAcSjQ
 4sq9lPWc75OJQMVKtZfxRs3nUPCRPlUmTuHhN1lMqD3ooqGUTmuARdOWrjOg==
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

Document the Display Serial Interface on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 2e9d3d23cbc1..27ffbccc2a08 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8195-dsi
+              - mediatek,mt8365-dsi
           - const: mediatek,mt8183-dsi
 
   reg:

-- 
2.25.1

