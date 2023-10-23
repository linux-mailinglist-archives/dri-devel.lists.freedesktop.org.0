Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E107D39A3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D905B10E046;
	Mon, 23 Oct 2023 14:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE6E10E046
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:40:20 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-7afc13d58c6so1255579241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072019; x=1698676819;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s9ub93Cdf9wtgxlTJaFYfR1eZIPMZ0+ANxwjapwdSNg=;
 b=y0XQmSt3O2UoBMtugixLcbaY2vPRWR+X68MWxmK3gGCmwZf3x090ME1qmKHqg5aadP
 NP/NxV8fKKAzTgfEN4bGn+KFbbz3CQ6EsjqjfsIgncRC+P+8YCJBpemXZGpMC+1SIs1D
 w6/sagqjWV+mwcMSAxUSbNsM0GaVTg5feddeHAdPelUtFFV0mYEEQs3u5PdXd6dDSPE/
 dbkXZlnTC886ehNkSPgnEd0J/TZl+BXyyoj//MFTInnzyeggo1EuN++zZrHVe95fnelp
 +Qf+U69kHN92l/aM8BY+rjIPk+r3aF9K6ff+L4YKPzoGPYLRgDxWo7sazbZetzdVamEW
 A7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072019; x=1698676819;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s9ub93Cdf9wtgxlTJaFYfR1eZIPMZ0+ANxwjapwdSNg=;
 b=c5p/FUHKebCqKHv0VPHlJky0+w48XJdRRZ965JPdA9IvDhr+yHtGjqOD2hP2YDqOHC
 s2XJPkMFyVnSU7FxSJvfThoZ62aF18dhNLcmPxG0u472fg1dQ7GKjGR70ltwv81V/FKE
 Ixdw78CP1SpPA9+QCWXfVQsbAON/m2q3ZDNNZTTG0k5Y7EKVrjiwSvegbEnx2shEag1H
 d5gOkospiP70OP2jrW1qC+oF/yO/dp/jbARdePrYVAtqGmWkjQt8gnTZMPdK/EflAepS
 D6uxX5j55ovQKOjvzNODiyUMUmby13AeZDEIy4ZkumKM4gSC15Gp21cdM1UVfTmaVpSX
 H/6w==
X-Gm-Message-State: AOJu0YxOYOkZ48G8ViyMLIzL6vFHDiGXG9oAks9DaLIZJUyPONZqaEMf
 hazZE/CA8QPn5NfnwTWUdr3uIw==
X-Google-Smtp-Source: AGHT+IHJKtPN+s3qbQB04ksDdQlqDmncwY1jaiRVU91xSoTR4TpQokxGMohekSd71DOrL0y+Cj2D8Q==
X-Received: by 2002:a67:b742:0:b0:452:72ed:7020 with SMTP id
 l2-20020a67b742000000b0045272ed7020mr9517700vsh.32.1698072018696; 
 Mon, 23 Oct 2023 07:40:18 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:40:18 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 00/18] Add display support for the MT8365-EVK board
Date: Mon, 23 Oct 2023 16:40:00 +0200
Message-Id: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMCFNmUC/x2NQQqDQAxFryJZGzAqYnuV4mJmjBoo45BMS4t49
 45d/MX78HgHGKuwwb06QPktJnssQHUFYXNxZZS5MLRN21EZzmLp6b5or5R2zRiGnkbfNdzTDYr
 lnTF6dTFsl5fZMl1/Ul7k8y89pvP8ATvkV+V5AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3206; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=DdZ6/V836kfp880KhEXam0/pg2tqhWjEoh+kbca/7ro=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXOTmxXiiwg+V6sYJXd2VtFuu8rpxi/5OZ3Bsqm
 CqwoEM+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzgAKCRArRkmdfjHURakDD/
 0Y/V7nSPbcGNYbM6NM+UqrWkjU+MFWZUZLEATcbdpLuCUIcgdBNyWF4+ocFPmgoy79rcrLY4jR4w+2
 tRDQaQR5qvgcN608HPRe16pHW9WavVDQUggWNMuGm4ePifBnu9bImn5/FIm89fp+CF8fhkh0QEVY9S
 T6sSplH35tU250AEM4lXGhIwJNhegUQbWfBeixu01aOlVxzOCXOLfLr2aMBkZktYy93zp5B6o4FiEH
 oHexmjDRB2kNmAS08GEQI4mMXQX98ZBb7sgjdh3IbXsHYKTinFUFH5sbr/qDoBrb7FgbPd/nsxQvEo
 1GfhIRNRPvhPsns+1Vf3IbW5bXMrUVDV/2vYTHL6B75ZTKhCDh86E0ykHoqHope+9AajwNwXZnJs7C
 v2ibGrOHI+6896fihV9LKC5YGrooRFqHLNChFrrOEGikLsYYZOc92gZZfNnI6fSCmTTBnQV7pQNGVM
 rcQd5AO0BuXPBAad+mSgYXGa5uZTbKynnMzV8zQXsgGmurakj9aqYDcakn1lyxre0w7+bwIPau4vj5
 z7FerJFtDahPtdvRDp1+D0G2AdgAzfvP/WyG0DMUDQbNaaN9xk+mPtuJkoSeJNz6YCzbhAWHSqeNAa
 h8YHMoFUk/M/2q2U1lJZaCuHBh7UT53hhnVr/H/suz0GKZrdMSGRNieqzBWg==
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

Regards,
Alex

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (14):
      dt-bindings: display: mediatek: aal: add binding for MT8365 SoC
      dt-bindings: display: mediatek: ccorr: add binding for MT8365 SoC
      dt-bindings: display: mediatek: color: add binding for MT8365 SoC
      dt-bindings: display: mediatek: dither: add binding for MT8365 SoC
      dt-bindings: display: mediatek: dsi: add binding for MT8365 SoC
      dt-bindings: display: mediatek: gamma: add binding for MT8365 SoC
      dt-bindings: display: mediatek: ovl: add binding for MT8365 SoC
      dt-bindings: display: mediatek: rdma: add binding for MT8365 SoC
      dt-bindings: pwm: add power-domains property
      dt-bindings: pwm: add binding for mt8365 SoC
      drm/mediatek: dsi: Improves the DSI lane setup robustness
      arm64: defconfig: enable display connector support
      arm64: dts: mediatek: add display blocks support for the MT8365 SoC
      arm64: dts: mediatek: add display support for mt8365-evk

Fabien Parent (4):
      dt-bindings: display: mediatek: dpi: add power-domains property
      dt-bindings: display: mediatek: dpi: add binding for MT8365
      drm/mediatek: dpi: add support for dpi clock
      drm/mediatek: add MT8365 SoC support

 .../bindings/display/mediatek/mediatek,aal.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |   3 +
 .../bindings/display/mediatek/mediatek,color.yaml  |   1 +
 .../bindings/display/mediatek/mediatek,dither.yaml |   1 +
 .../bindings/display/mediatek/mediatek,dpi.yaml    |  24 +++
 .../bindings/display/mediatek/mediatek,dsi.yaml    |   2 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |   1 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |   1 +
 .../devicetree/bindings/pwm/mediatek,pwm-disp.yaml |   9 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 183 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 146 ++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  50 +++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  30 ++++
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +
 16 files changed, 455 insertions(+), 1 deletion(-)
---
base-commit: d27bed55ce32b0732ef65561851fec3dc8d01852
change-id: 20231023-display-support-c6418b30e419

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

