Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70A2A0920D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 14:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F37610E4FF;
	Fri, 10 Jan 2025 13:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QhwcpCXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB08610E4FF
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 13:32:23 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38a8b35e168so1310755f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 05:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736515882; x=1737120682;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/CRkSXWyXf0xsAqoBIGl0gizy0vMiUiEuhlip5XNNFI=;
 b=QhwcpCXB5FCIScVUDGrZIzmd5Xwx9wjTgYtKE7z9mj+4A522uECokzvt8UM7YL9FbZ
 f0LBeBrsGcDOsTVaTuEIi22xnWjTcIGVPnCFYVAPQEQct4U+jRyaliEnZL0m2nEjGcjt
 Bx3UVoU+bHKzZWpV6RSuQN23lndl7spkQF31uBy4gDSUovsH+8mBNo6U4rUzzBw2ATf+
 W4z30joVrORIN2H0et50u3/bptSViyzvcHyoJW19+cNVtu3laeNHsl9jxBMF6mAcUKyK
 FSdpIpDhga01Flw7MgyMiyp7MOgpuz4b2y2+o9eH/gbl4p6f9daxeVlbrdSYSuuj2tap
 0GXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736515882; x=1737120682;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/CRkSXWyXf0xsAqoBIGl0gizy0vMiUiEuhlip5XNNFI=;
 b=J+/4E12pe3P8p4UspTQwCjpjpRvYVI/9v4T972p+NggEl8He5leQ7H3877ZWaO/wPB
 dCzmaE0UM/f59+sxiWG72eE5IQ0/O/Q6TR551FDNGFfEgKzWZF+htjPHfebL/GIcV2Mg
 22EJUgDm/2M8ne8Ipbj7NpIfSBZgPPIUZoX1UJZGyQE5DCb/pqCw3aCq4X14Llv6AhAk
 ZE9r9x/IysU2L8g/IFhq6u805hyaDhLA6zxVfykludDS9EfGLQ6mLKCLr8gh38UAa5v5
 w2T4VfTsMbkGPVKOhjhFdHOWXWjXb3q0nMur6ZlRc7veC/4f6jS17/ZzwdMbaFAn3bjB
 3I/Q==
X-Gm-Message-State: AOJu0YzMuVIGaCqRfpq3S8Gzs/jzFvzf3qylu5GCcxoHvOLiFrJsrioo
 4BG5A996ZpV2G99b+HuLk0RCtOY9lZBVEieyi+9p6EIzw41/q9zNz7wm7lzTh+o=
X-Gm-Gg: ASbGncte0gXnsn9RdrNu3Gzy/xb2DQ8H+uavtTQ0/sKP24lIC8nW3trUvMyRVsLo1O9
 e04U6GSf7YSws/ItejcXQdQAkFEoUZvM9+R3XvCWli8rCUF1MIb2cCDF0xoHb8F+gFDP3cRkm/e
 DgRFcBRcFzh5/0YM0bXMqUVvLld0zZJTOfckr3iFGuHNe7FtZoIpMeKymRFlckdGt/X2fUeTwuK
 QNMrIF35Tjez09aDKrpxy2MGhLOZobJooTaJ5DyshkaxcD1qOSfITRlf/lG
X-Google-Smtp-Source: AGHT+IEeT/k14BcIEcdwF/8jsOntipWrqikOfy+83Y1jOalU/MN+akEWeVXNGmRe7c17qKDi731Pvg==
X-Received: by 2002:a05:6000:410a:b0:385:e8e7:d09a with SMTP id
 ffacd0b85a97d-38a8b0c71cbmr6605006f8f.2.1736515882478; 
 Fri, 10 Jan 2025 05:31:22 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38c990sm4598193f8f.56.2025.01.10.05.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:31:21 -0800 (PST)
From: amergnat@baylibre.com
Date: Fri, 10 Jan 2025 14:31:11 +0100
Subject: [PATCH v7 1/6] dt-bindings: display: mediatek: dpi: add
 power-domains example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v7-1-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBngSEneE6zOf8vEEwrluvT4BlZNUmmzfnh8+dgMnkc
 OKzALE+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ4EhJwAKCRArRkmdfjHURYjpEA
 DGf6hGHBkuj/S8FHNwSNHu+zjuNgTJivuTPoZm6K2uGhF9lAzwXa43mbbEEJya8ShfFWrU/m3v9KHP
 1Dzgk9DJTlOO1lvgkRv+N6DK8ptMx1C6Aef4kKpP6+dBg5x3dP5J4zL//RyEIZODOEq8GpIRXZMHxn
 HcNdOkYOM65h8eFd/qcfkRbgOH8zSSUUhdoaqPedu3H0TreyDnOD7i8q7k4SIOYYnnXsjxSiPqh3RE
 FPmcXUYg2ui411JC5xLGwyK/ui6RIx0/KpfKiH/ZJeT1SvepMvt4bme6wiqZDJjLKFYqkH6SRX5QDP
 FkMuLf2eqqkjko8WqYCdK2peo26/J/hwDlpMuokN9uJbQ3WR2zIxYjHy5xiexOtkqAjtxeXdJLlJUB
 FAhBmKw6sLzd/9K/D4r1sCSi4FcGfN7VSvIaL51H44UPdMl0etiRaMmMr+8upGdIF/KW1F+d+CAEbi
 eLKoW0d2PUIV2IeBfqXMEnZA+6J1jLZBLdsNdMvUmSoOhyB7utbOF9r7axjT8szg47IsXC6vB+4n8B
 md1my3Uh1z/civLxqDjHZblMSbEhyNglYKeXBleWsc2Dxqs2/dMiWkAslxuxoFbOxq3xPY2yICClKB
 32h3cbGNzGnVEne9TVLq23Z5N0xPqsYSqBDfnDJv+PV0Ihw8CS0a2PEsuYIg==
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

