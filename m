Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E735CA073A2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 11:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633A110ED5E;
	Thu,  9 Jan 2025 10:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YMthFytA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7C610ED5B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 10:45:47 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-300479ca5c6so6094261fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 02:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736419486; x=1737024286;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/CRkSXWyXf0xsAqoBIGl0gizy0vMiUiEuhlip5XNNFI=;
 b=YMthFytAEtfqOnMLnpMeikRi8MNRiQBxrDsFzoER3E7439N3fhSKyd5jXaPDVnAQzN
 CtP6yKD9JBc17aQ1yBopocwdojzfTo2VYwia/QBbJwwIYF6PcoaIrPGaibmrMKq7lCea
 3GvS+b4vioUlXE9B6oIKpgQJpcvS5WLOrGR8NFMlZcX8XL8NSCQ6MxPN3z5mvfXi26S2
 Ek7T2IQWMxDjg/DGdyOolt+qjsfEkVqSV3VBqNGfTsWKjBVwHPHdLG1dft0deRTzX6iB
 62pzICS+01qLtNIFdGbFTk4dz1RBEsvzoQah3KkCfPNAPsQCGJzcgWhLyAS3ZoH5f7qt
 rgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736419486; x=1737024286;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/CRkSXWyXf0xsAqoBIGl0gizy0vMiUiEuhlip5XNNFI=;
 b=sI7HBDm33YBbJUO8Irus/JXlQ+Iv1cPQ5nF0pJi9KIvYW+vE6AFHspJVomt09uOr0X
 kqMdCQ41ZdxOI+Y18iKAcNXYH4X4M+oe2uTa+E7Vk1yPa2fXcHUANV+mLWpFsxCAMP1X
 vx4b7DyMEPuwSb+G1Ncxr4izRNeEa5sZ8XqZEhhbdNeJVIwi+QMbQX11R0BZJI75I8sq
 jiJSVVQyP55HMJ7A7gYUtFUJqpWZPnrM5ZPEgOnZiYnSVCwH+sc8xuPMdqjmBTJ4E6hB
 bSHyrJwaxIQwlsV/ZvY1GbqVcAyPl0UBh8wz1Q1h1vDuzB6pHgvTq9TrPYExJch4AfGV
 m7yA==
X-Gm-Message-State: AOJu0Yw6Q6rJqjhxuNH6A1V/FNJDDV8fPAPXpMe9LiLEDioZxHdgiTMo
 LjGDV+2JRgYWJDYduVVRAIAUxSkgibzHcz6QziY82XbgSU1BtzVe/qfYXZeJbzgH8NF/Szbkgct
 ieE0=
X-Gm-Gg: ASbGncuYwGr/ss4ZhIglkb3vWojinX8voD6j26QsEenaZ/URedxE64JRGAFAk+8RJYa
 jWKEZ2YrypN/ySEBtq6jzrBBYwSk8cEC574KaYOi/i95MJ4P1qiUEvU5hPkAvI7K+p8UUP18UPk
 4By3XH0v6LPaPzl7CdyyAiijjOleWdcjrTK18vjSpADNBLEtQrYlRCnDYgIxC/GPHafjfTpsQNd
 GB1l3X304tCkUggFrXc8fizZRTG/fWzrvr3KOmNbH+ld2Iz8vABNbVgrDg=
X-Google-Smtp-Source: AGHT+IGoo6aCpQaw/38jzOJWljZd/4p+WYRQSK2etIlIn/JQoa+/t4gGr2EQYfHYcCjx9tdypO5CjA==
X-Received: by 2002:a7b:c315:0:b0:434:ffb2:f9df with SMTP id
 5b1f17b1804b1-436e26adf94mr58117845e9.17.1736419078947; 
 Thu, 09 Jan 2025 02:37:58 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436e9dc8826sm16428195e9.11.2025.01.09.02.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 02:37:58 -0800 (PST)
From: amergnat@baylibre.com
Date: Thu, 09 Jan 2025 11:37:54 +0100
Subject: [PATCH v6 1/6] dt-bindings: display: mediatek: dpi: add
 power-domains example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v6-1-c6af4f34f4d8@baylibre.com>
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
In-Reply-To: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=1JKrAs8ef9/G6ny5cfhuHd3DFIbQFHxMMv9wBH5/HqA=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf6cDgnHk/QDeV9U8e3dgtdQJKzCxpbiCFeCOLMRp
 NjwR1diJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3+nAwAKCRArRkmdfjHURexpEA
 DDgha/jEhBzdZ+TAQIqu03dqxRexVtWPw6SdcPV2rKQHlOzz66Usv0RV3Pr9ttZLknkmm+awrWLAbA
 SaX1ge0cH65bzfh3xplaNqdw4+NzUx9WRx4n7HZshUNcQzg0LPgUpaIkRN20xNAH2orofDhJVAcZaR
 OWXyGKpMhnXZZ2nrhMgkIL9Uu5VkxCBpKeB2Ry4z94dYBsDOmPLz47/b8dAht3T/BguzZW9MV4RZfS
 3NGTzBKFRSpufWVEqfYoQV3fY4UUqIIXdM+dPzwEiaGOFUZn0RvQQW16u+G+E0yXEMOZHQ9ep+d+Cv
 xyV5gHyDam6TNvSQCz7EUKfS9g0P//OQp4a1TXpdS2mvATg79+PUeC4pZhSiGj4VCFivIn7yMgQANM
 W4IBUk3M1KtaomudMm1TQXVljqNoz9jYzfSzZMOiTxLh6kkKpJWbEcvhh0uNtjL4rbuyRnuliKnDq4
 bSEyZXo3fRqB+vwZFV0yrOHlNUdZX9W4Ov7jtmb8bhX5tXMS/kjHh3pruU/o3lFM6XC+u2c+u2oTX4
 8IxjXfFJ+/zdE9qZrtDyOJbRStETHs1Qd2+xNLgQD6eRx+OKNffrGEkIwHM8EmaAHVeRVrD2FuEZIA
 PObseZEW9O1yyJq3q+Ux7rcwcc+ps/50ZQDD1phVFrJp95xV/fgML4iJhFAw==
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
Add the power-domains property to the binding example.

Fixes: 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 0f1e556dc8ef..d5ee52ea479b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -116,11 +116,13 @@ examples:
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

