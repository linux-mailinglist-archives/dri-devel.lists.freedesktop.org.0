Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EFBA0622E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A129210EC18;
	Wed,  8 Jan 2025 16:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y+3GTlaP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63ADB10EC0E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:40:27 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so319035e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 08:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736354366; x=1736959166;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cbxXwWR8AIKr2Z5xmtMFDic9EFUnqAlHiSI7jHWWslU=;
 b=y+3GTlaPt3hTh/CkgzXDKfaqbkr47FGg0pVf49dneDbSer61psB6uakQAk5/q1jV8D
 7AlavmiDq4rsCtrbCdoOoAgkJJJByAWDrBh2e+WxNsHbfY9kNQDBFPtD8MbktsaauU/Q
 RwGF+92pHcFtz8bwgM5J/wuZFySPPFZ0NE6oCifVT8MVVD7akc1N5Sh/bRutT5xo/X28
 71C7zyOejbKTQ8K5wGs5e6P+NzEKpzWbSOkMAB0XXg85PKUU94GbSetkX0NWsMMP36qc
 an+TWtw3Njn1cYUBIVz1eLitAm/BlkWkZpoggjOPOFYXTaLowlG6J3P6MY7jWxaq+oQr
 3vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736354366; x=1736959166;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cbxXwWR8AIKr2Z5xmtMFDic9EFUnqAlHiSI7jHWWslU=;
 b=swTMqVaMSloy78ipohwR0yzmHYcFHDn+jHSEer1Zd/pyfHNEfdRX1YohCogcOs+WnE
 6ZEg942XcoBY2suyI82cvQSQJYI2tYOIFwYadrKRevw8omdIjklK71vx4791dT4WmZG6
 ozVlUbcUth6wIWSlTpU3j/Y1TYXR2a2qEUkfbUKBy68n89nFVt9RfRp0g78vdMAtlXMD
 u+smcU95s85RKRcBf+rUjAQD5FK5jm2fiC4NeUj9eLg212x6y3FOZEp0Sd1feQnffUH9
 6b4i/Li41N18FbIw3/ZptuQa2pp3SvaeLcIEnek80XDsc7fX36unVDtHPdZTwM3dPWoh
 TPBw==
X-Gm-Message-State: AOJu0YzjEsmKyHYYfrX20xzCFlX5/P+xxhUGzfUt0qnGm6Z5eZzCUTJp
 aOzNjrNkyxC6Lf7/9+eSGZP2S19TW1aWWhtU2F0D717XyjSuJMhxvt68ibDC7TPDf6GXYTc55mQ
 su5s=
X-Gm-Gg: ASbGncuAQS6nBacNaLw4esrVJNPlUOHZlEiH5eDpIPr/tj8TOZ0dI2O66J+/P6WtdcP
 dMI24ueKTregDI8Jo4a6plsX+cyeCBoYxJlrInKpBGgYuanOOp6G2UJ8TZC/R7J+ggbQOj8uxfV
 3OuGktu6pdzg8YvgEA0tqXZI9jxKM98JmjwueuHDU0q1Es19doOSmuf0xc9fZsQaDlYHSp4oG0n
 V9j7vwyuIR8VDPB3f0IWpsR+bEknWcZhjjG+PdAYmvwqjKRgkd4wgPnePhE
X-Google-Smtp-Source: AGHT+IGGAa64d+bPHxfOT6F6vJgh1xofOm1puRyf5Gg2Qx08bu4NygW/ia9oSmUPKTI5x+9zroEuLw==
X-Received: by 2002:a05:600c:4e44:b0:434:e9ee:c3d with SMTP id
 5b1f17b1804b1-436e27070b1mr31379705e9.20.1736352947285; 
 Wed, 08 Jan 2025 08:15:47 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 08:15:46 -0800 (PST)
From: amergnat@baylibre.com
Subject: [PATCH v5 0/7] Add display support for the MT8365-EVK board
Date: Wed, 08 Jan 2025 17:15:42 +0100
Message-Id: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK6kfmcC/4XOwQ6CMAwG4FcxOzvD1oHTk+9hPKxbkSUKZEMiI
 by7G0ej4dDD36Tf35lFCp4iO+9mFmj00XdtCuV+x2xj2jtx71JmspAg0nDnY/8wE4+vvu/CwG2
 lhEYoSIkTS1doInEMprVNvhsoDiLv+0C1f69N11vKjY9DF6a1eBR5+79jFLzgpdVVQa60AHhBM
 z08BjrY7skyN8oNQiYCwJLWlUIpjz8I2CAgfwGgdQ3kQP36Qm0QKhHktCQUla5RfBHLsnwA7M2
 QN5IBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4389; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=9M5KGNUL9vwlasksx/eWxH2UHxU8J0vFX1+wbxwtEUA=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSx658xb7vf06grM0qAloaXvz/hrcb0mpGfxHdu
 epVdHV6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksQAKCRArRkmdfjHURWiYEA
 Cyi6gnp7YSYhtyIAMfKnndt3CITPF2/KZsZp9k2o8Npc50HP+C3COPSR1PQMuPYN5qv99iNVgVk2jV
 +b5/tfraZgj/FEwguRiDgvTlapCQzSp8nSqKQUQOMBy9W1CfLr/0WJ+IDwAkbSh7cixYua6gxzwyS+
 7yW94h56RgX2IVNPtFkUcK6WS2J3pOPo2OyDwYyOkPZKH6sKOG/ylVjCNH7Df32gHohwQfUpJkghP0
 mTtv5YPiHeTpc1sN9wFYzU6oeZXXtyMgLq9sofGPKzzSKbErqhXs1FYdg86nLE8lcJsWVQuBW05xFX
 OED0xynO9dvCNkLZJfs4sGX4MMwKjIDCWyH1B7u9x0ecdQ4e1Y4qcdVVs4EMUfSlnN4smNUz1Bvsl2
 EV7LdcTCDuvn69H7PuU3uuz0Fp/to1r08K5WbvWQKgDxLWMVLo/zA/aQEe3CoA8njD7DWu80/U9hTE
 kEDp7JNjhW/GdXkftNE9DamK2naSaDxYVXyGYsomUCZXjH3HDWlnj3pMvb0hTFP9wG9nvBtDWz9UV9
 PCRy6yw/n6dcDkIQ2DtbAv6Nv6t3DYj2OMJyv5OJMB0bTyTVJjienFJwn1Vylk+u7WJvWMZrSQfRnr
 ylZ62ANrjmM9e9hcriyWlZi0fE+LEezrw5tE+Q/1cd7Cdav9hnYtQlyJjF7Q==
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

The series is rebased on top of Angelo's series [1] to
use the OF graphs support.

Regards,
Alex

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v5:
- Patch merged, then removed from the series:
  - dt-bindings: display: mediatek: rdma: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: ovl: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: gamma: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: dpi: add compatible for MT8365
  - dt-bindings: display: mediatek: dsi: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: dither: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: color: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: ccorr: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: aal: add compatible for MT8365 SoC
- Enable STARTEK KD070FHFID015 panel in the defconfig.
- Rebase on top of 6.13-rc6.
- Link to v4: https://lore.kernel.org/all/20231023-display-support-v4-0-ed82eb168fb1@baylibre.com

Changes in v4:
- Patch merged, then removed from the series:
  - dt-bindings: display: mediatek: dpi: add power-domains property
  - dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC
  - clk: mediatek: mt8365-mm: fix DPI0 parent
- Remove mediatek,mt8365-dpi compatible from mtk_drm_drv.c because it
  use the mt8192's data. It's a miss.
- Add MT8365 OF graphs support, remove the hardcoded display path and
  rebase on top of Angelo's series [1].
- Link to v3: https://lore.kernel.org/r/20231023-display-support-v3-0-53388f3ed34b@baylibre.com

Changes in v3:
- Drop "drm/mediatek: add mt8365 dpi support" because it's the same
  config as mt8192 SoC
- Drop "dt-bindings: pwm: mediatek,pwm-disp: add power-domains property"
  because an equivalent patch has been merge already.
- Add DPI clock fix in a separate commit.
- Improve DTS(I) readability.
- Link to v2: https://lore.kernel.org/r/20231023-display-support-v2-0-33ce8864b227@baylibre.com

Changes in v2:
- s/binding/compatible/ in commit messages/titles.
- Improve commit messages as Conor suggest.
- pwm-disp: Set power domain property for MT8365. This one is optionnal
  and can be used for other SoC.
- Fix mediatek,dsi.yaml issue.
- Remove the extra clock in the DPI node/driver and fix the dpi clock
  parenting to be consistent with the DPI clock assignement.
- Link to v1: https://lore.kernel.org/r/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com

[1] https://lore.kernel.org/lkml/20240516081104.83458-1-angelogioacchino.delregno@collabora.com/

---
Alexandre Mergnat (5):
      drm/mediatek: dsi: Improves the DSI lane setup robustness
      arm64: defconfig: enable display connector support
      arm64: defconfig: enable STARTEK KD070FHFID015 panel
      arm64: dts: mediatek: add display blocks support for the MT8365 SoC
      arm64: dts: mediatek: add display support for mt8365-evk

Fabien Parent (2):
      dt-bindings: display: mediatek: dpi: add power-domains property
      drm/mediatek: add MT8365 SoC support

 .../bindings/display/mediatek/mediatek,dpi.yaml    |   5 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 236 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 336 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   8 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +
 6 files changed, 589 insertions(+)
---
base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
change-id: 20231023-display-support-c6418b30e419

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

