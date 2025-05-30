Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49311AC9480
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 19:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6BC10E011;
	Fri, 30 May 2025 17:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E1xvJ5du";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86D610E011
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:18:52 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a374f727dbso1884596f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 10:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748625531; x=1749230331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ynEvrykvvMU0ksBhHKWbakf97c/AyKOyZ1b6YiZ4xoU=;
 b=E1xvJ5duUNSCWpOn8jEz/FDHQbTBJkc9Y6gwVWUsKEM8V6lvqDYSbjR5DLjAxSrLZ8
 p6doDM5U6oG7bs2mh+6x4+Fax7e91MRx7zWhslWE4hWJM0PbhemUeG08s7htvwXflGgG
 gXgA0UTA3wuygDJtTDyGGGItvRxeSWqF7kZLXx/+7cOJ6+uG0naQU0IMGF9fVVUXXJmQ
 1w8cb+jkMCqWcWSfrKVPayJXHZMYz3lGzv0+bGb6TmcCRhBfRupBkpl5gS9Mik+6hcyF
 aGHW4zF1o5JGmyYQTDGhRzbE1VUUwLCraFTUbOTasoCye/NoDNkfSf2UbS1sZRWijez2
 i8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748625531; x=1749230331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ynEvrykvvMU0ksBhHKWbakf97c/AyKOyZ1b6YiZ4xoU=;
 b=TzJi7r8ir/czbmbh0M4y5SGtBgt5XQLI6C2tJ3jGCh/lcstKan5VhWvH2pDxNyCPNs
 lDixS50xdQ3TurcgiOjFjSd6oB7S+a099xAB/SC4Tt3JOSFxoCH/Vtb9A6PxizNSGpIa
 Djl9mpWUcb/OQPfcZR0+xse5i1K9sPcse27/3jtX6yfXPE0uDLwWFYrW0u3d8OwgyvyA
 HW+4kDXSeII452nyhXvRpYF5zZEVuD2Vj+D+TOl8fwCsDFz1PuBnPiN0jgXCcWMO8oG5
 51fxGXadHFWEbAUnvtL0fLrB0YXkfyyozgrikCo0f8qwUytJWHt2xcyNKXOHaAVboSPC
 DRwg==
X-Gm-Message-State: AOJu0YxqbqYE8zGa+5AXDCFgZ1jsGlFSNa8+y0uVqom3qPo0/38BbcQc
 Zym0YpHZPPRLkcZUyL2vbdP6PkNiDurDeeags8HMoGKYE8wF4ltplrzEuQB+Jm8h
X-Gm-Gg: ASbGncu0GzvRRRBO/nAWk2D8gicfc6C0wMDKhus9wwiuNvAqQaOsS8+PrLejPrIjI/z
 6cdJuKVaXZFFycVK+nLl9mf/luGh6dfQEZHBP/aoU5Af/1AxhLWDmR5x4zCnlWxAbHJ/IpTOTTC
 ldRpatmxCwzLm8Oq1uIJXZs0c2ncsGz5nvFr1CRZUDOHmHZToqPnSW+SuF073qRL87YanCNCSsq
 QdPVm9MvDGy3YYS2MbYgqXtICODw+0bPx2XDPlwTDee30eH+HTryZ/nj80b8Tv1NYr259BEJLta
 jdSfrg2V0c4uU/cSX4Z7PocrNIcNH1ZuiKHS9sgaURfNbAWCUpP7rDVFBJ5KPpoQYlvsCGHLQCi
 vRaqWvJDCzA==
X-Google-Smtp-Source: AGHT+IEp6Pb6coP//ft8xEoxnN0XG2mGL8lYvmKsSoDN6jZiXpCVG5HXqDoz0TnLlIZVoVTUVF/FDw==
X-Received: by 2002:a05:6000:2204:b0:3a4:c713:7d8 with SMTP id
 ffacd0b85a97d-3a4f89a765fmr2551757f8f.16.1748625531267; 
 Fri, 30 May 2025 10:18:51 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00972c1sm5395963f8f.68.2025.05.30.10.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 10:18:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 0/4] Add support for DU/DSI clocks and DSI driver support
 for the Renesas RZ/V2H(P) SoC
Date: Fri, 30 May 2025 18:18:37 +0100
Message-ID: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds DU/DSI clocks and provides support for the
MIPI DSI interface on the RZ/V2H(P) SoC. It was originally part of
series [0], but has now been split into 4 patches due to dependencies
on the clock driver, making it easier to review and merge.

[0] https://lore.kernel.org/all/20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note: This patch series applies on top of the following patch series:
[1] https://lore.kernel.org/all/20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v5-> v6:
- Renamed CPG_PLL_STBY_SSCGEN_WEN to CPG_PLL_STBY_SSC_EN_WEN
- Updated CPG_PLL_CLK1_DIV_K, CPG_PLL_CLK1_DIV_M, and
  CPG_PLL_CLK1_DIV_P macros to use GENMASK
- Updated req->rate in rzv2h_cpg_plldsi_div_determine_rate()
- Dropped the cast in rzv2h_cpg_plldsi_div_set_rate()
- Dropped rzv2h_cpg_plldsi_round_rate() and implemented
  rzv2h_cpg_plldsi_determine_rate() instead
- Made use of FIELD_PREP()
- Moved CPG_CSDIV1 macro in patch 2/4
- Dropped two_pow_s in rzv2h_dsi_get_pll_parameters_values()
- Used mul_u32_u32() while calculating output_m and output_k_range
- Used div_s64() instead of div64_s64() while calculating
  pll_k
- Used mul_u32_u32() while calculating fvco and fvco checks
- Rounded the final output using DIV_U64_ROUND_CLOSEST()
- Renamed CLK_DIV_PLLETH_LPCLK to CLK_CDIV4_PLLETH_LPCLK
- Renamed CLK_CSDIV_PLLETH_LPCLK to CLK_PLLETH_LPCLK_GEAR
- Renamed CLK_PLLDSI_SDIV2 to CLK_PLLDSI_GEAR
- Renamed plldsi_sdiv2 to plldsi_gear
- Preserved the sort order (by part number).
- Added reviewed tag from Geert.
- Made use of GENMASK() macro for PLLCLKSET0R_PLL_*,
  PHYTCLKSETR_* and PHYTHSSETR_* macros.
- Replaced 10000000UL with 10 * MEGA
- Renamed mode_freq_hz to mode_freq_khz in rzv2h_dsi_mode_calc
- Replaced `i -= 1;` with `i--;`
- Renamed RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA to
  RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ and
  RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA to
  RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ.
  
Cheers,
Prabhakar

Lad Prabhakar (4):
  clk: renesas: rzv2h-cpg: Add support for DSI clocks
  clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P)
    SoC
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 116 ++++--
 drivers/clk/renesas/r9a09g057-cpg.c           |  63 ++++
 drivers/clk/renesas/rzv2h-cpg.c               | 278 +++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  17 +
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 345 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 include/linux/clk/renesas-rzv2h-dsi.h         | 210 +++++++++++
 7 files changed, 1025 insertions(+), 38 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-dsi.h

-- 
2.49.0

