Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9D76B26B4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220CA10E81D;
	Thu,  9 Mar 2023 14:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FF410E818
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:22:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id az36so1274283wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371776;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=5FiDC36ntLGrNSZa6vlSUQZ3D1HG3dOuV6xHakTuj6s=;
 b=4bgVjBF2EIMQ44B4JCbDst6J2lfRHr6Df/s/yqH/A/MA7XqcKSgedknTVMJt+hHdII
 2y8MeS28U4ah9+9qaoqgPYexgL8d5rJp6gRO6ypJpfiWw1BAxPJv8dAD9uIypmGGDMwX
 Jq5EFKPFuM1+IBhWXWz9F2rCDEL3MluQeuAq6b87gzNtroDnV7ZbjdkwMsccw0/pymvi
 MKheeWrf8HdMptW4UwzXi21cd6l+Rwj9UmJiuYOpmFV90iwnyMOHwzVZ7tkgEAG41E7y
 lTYOxfDvleLWj6Izskq+/0A39sOyVW5S4/yfxo1a4/i0XC19IyPEjrUl8F8CFWC58D77
 NTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371776;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5FiDC36ntLGrNSZa6vlSUQZ3D1HG3dOuV6xHakTuj6s=;
 b=Z/YgBoMYquKiVzOfg1JQwKNDI4DLeHG/ofrp5TcrQAxRAlQ7q1saDYD4mFi3sTvkkY
 Xy7ebjObUVX8qk8uaM82zI8GoRvPip6mTS5T5CGGKKb/7ukcWax4qYCRfW8DoBBUEX/+
 6MkwKs+pdoNR8etuekB98zyJI2hWOFL87BQKAdZlk6lsP816jdsXAERPv8uDY2OXfZUf
 qoNW5lCZsTMlV9zXbW2EDi+whCMvmfs6UhLaJCkYVVyS/jDD/dkXQa4aV0krPe6OOEJB
 h1LUB/gH4tnHb+njiUMIrA69bPTSVJXsXqWRjiGtzFfFIyXu7CKNKwfBq2c4qr3MzU/k
 hVEw==
X-Gm-Message-State: AO0yUKXSCOzHl/I3fSS2LeLfJO/92pX6BgIOl1eGjN4RkhS7B+Hbk6VF
 Htd3lwC5gtJkiH3G8b9H+hNArQ==
X-Google-Smtp-Source: AK7set+AWUgkp4kl5uNPa4qUkkZegzSl+qveeVYbRP/r1cC4lTv5CGXYzovfIHV3Z3eo5fLRFcWDPw==
X-Received: by 2002:a05:600c:348d:b0:3eb:9822:2907 with SMTP id
 a13-20020a05600c348d00b003eb98222907mr16466608wmq.4.1678371776060; 
 Thu, 09 Mar 2023 06:22:56 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:22:55 -0800 (PST)
Subject: [PATCH 00/21] Add display support for the MT8365-EVK board.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIALnrCWQC/2WMywrCMBBFf6XM2kgetBZX/kdxkcfUDMREEg2Ekn83uHV1OZfDOaBgJixwnQ7IWK
 lQigPEaQLrdXwgIzcYJJeKS8mZo/IKurFZud0sSki0Fxi20QWZyTpaP/z4CWGcnso75farVzFm+w9V
 wTgzfOH7KvWqZnEzugUyGc82PeHee/8CgBp4eaYAAAA=
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:49 +0100
Message-Id: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4844; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=WKkhfzSHvRiEeoYvfavuHcPlb71GrBA6+XzEpmG2AOg=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+4+b/NVrypUOW/QUVhijk4DknU+QJrtk2dWpu
 mmhXnOWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURWr7EA
 CJa2tpQCs4m6sqoTbnB361LG8FrGq9gfkng5NG8oQnTtRZWb3m/WLdCc/5AAT96XN249Ha5kYCAoUY
 Z+Zn5bGkJ2/HyzjtPgFiKiRRqN5EMW5w1iL/KHpmNyypxaM3edH7SOFB4MxF2lYzK7OFgUYaHL7Wwh
 qWuH81WwUTEXvAKExRJbDEie3oYWm41+wYMhn4ToMbAxN2WelKTHCHImG51MLyzmLNXNFqY94ZFe++
 DgBueEJyrnCMpOP/uEo1s4ZbncpFmiJe8/RrTZTL1MVWoUBMqQ+I6IP4FgcuUXo4r9b6gE73UQpeWf
 ghYtj455bFskL9KXjkps5WRebM2ImEr8UguKYt5YwIyTeN/6SPPUCoI1vnpcXp4RU9XG7KNqJXxuqW
 yxAiOFRAMhvG11DOLdL++2Hw1qIWyofTJTckvT0w2GgK0gJjInbuVqL7TiCY204mIC+K1BVCp4sVxo
 +h7QHiWOLHnFwW9gqHSISgIhhO33Fk6gO0abqvgAaQMzZd+t8DHXBdC3Z0zySzAJc8l268xmf4SPKs
 iMmm8+t7oZULKs4FgDSJBpvEUCA7hlnpCRp0Rh94Dv5nh2wn3rC7QJLSziErCZX1Lghw3TbeO/Czna
 91u9feMH4P0IqegDZIovsbrfgkOiYvEpEdUtgr83zNEB6zrg1UnH3z7bVQMw==
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The purpose of this series is to add the display support for the mt8365-evk.

This is the list of HWs / IPs support added:
- Connectors (HW):
  - HDMI
  - MIPI DSI (Mobile Industry Processor Interface Display Serial Interface)
- HDMI bridge (it66121)
- DSI pannel (startek,kd070fhfid015)
- SoC display blocks (IP):
  - OVL0 (Overlay)
  - RDMA0 (Data Path Read DMA)
  - Color0
  - CCorr0 (Color Correction)
  - AAL0 (Adaptive Ambient Light)
  - GAMMA0
  - Dither0
  - DSI0 (Display Serial Interface)
  - RDMA1 (Data Path Read DMA)
  - DPI0 (Display Parallel Interface)

The Mediatek DSI, DPI and DRM drivers are also improved.

This series depends to another one which add I2C, IOMMU and Power Domain support
for MT8365 SoC and EVK board [1].

Regards,
Alex

[1]: https://lore.kernel.org/all/20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com/

To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: Jitao Shi <jitao.shi@mediatek.com>
To: Xinlei Lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-pwm@vger.kernel.org
Cc: Fabien Parent <fparent@baylibre.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

---
Alexandre Mergnat (16):
      dt-bindings: display: mediatek: aal: add binding for MT8365 SoC
      dt-bindings: display: mediatek: ccorr: add binding for MT8365 SoC
      dt-bindings: display: mediatek: color: add binding for MT8365 SoC
      dt-bindings: display: mediatek: dither: add binding for MT8365 SoC
      dt-bindings: display: mediatek: dsi: add binding for MT8365 SoC
      dt-bindings: display: mediatek: gamma: add binding for MT8365 SoC
      dt-bindings: display: mediatek: ovl: add binding for MT8365 SoC
      dt-bindings: display: mediatek: rdma: add binding for MT8365 SoC
      dt-bindings: display: pannel: add startek kd070fhfid015 binding documentation
      dt-bindings: pwm: add power-domains property
      dt-bindings: pwm: add binding for mt8365 SoC
      dt-bindings: soc: mediatek: specify which compatible requires clocks property
      dt-bindings: soc: mediatek: add display mutex for MT8365 SoC
      arm64: dts: mediatek: add display blocks support for the MT8365 SoC
      arm64: dts: mediatek: add display support for mt8365-evk
      drm/mediatek: dsi: Improves the DSI lane setup robustness

Fabien Parent (4):
      dt-bindings: display: mediatek: dpi: add power-domains property
      dt-bindings: display: mediatek: dpi: add binding for MT8365
      drm/mediatek: dpi: add support for dpi clock
      drm/mediatek: add MT8365 SoC support

Guillaume La Roque (1):
      panel: startek-kd070fhfid015: add support of this display

 .../bindings/display/mediatek/mediatek,aal.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |   1 +
 .../bindings/display/mediatek/mediatek,color.yaml  |   1 +
 .../bindings/display/mediatek/mediatek,dither.yaml |   1 +
 .../bindings/display/mediatek/mediatek,dpi.yaml    |  53 ++-
 .../bindings/display/mediatek/mediatek,dsi.yaml    |  19 +-
 .../bindings/display/mediatek/mediatek,gamma.yaml  |   1 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |   1 +
 .../display/panel/startek,kd070fhfid015.yaml       |  55 +++
 .../devicetree/bindings/pwm/mediatek,pwm-disp.yaml |   9 +
 .../bindings/soc/mediatek/mediatek,mutex.yaml      |  21 +-
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 204 +++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 147 +++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  18 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  35 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 483 +++++++++++++++++++++
 20 files changed, 1048 insertions(+), 18 deletions(-)
---
base-commit: ae88468858a66ebe3fb5b3116400d75397f03e6d
change-id: 20230220-display-53dfb6312ec7

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>
