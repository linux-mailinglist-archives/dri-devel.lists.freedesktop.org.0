Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29054B42679
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 18:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E7410E8EF;
	Wed,  3 Sep 2025 16:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k+rxLko/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C83610E8EF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 16:17:28 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3cf48bde952so103997f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756916247; x=1757521047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zhI3DRe5+X+SOWNKbXoFOHpSP7IEamKPQO7YKwNjIhM=;
 b=k+rxLko/tvakDgn/0fRQX7HCbKxPmd9Gc2DaFHk4QqeKqKiDLFpNKE83M4ZaiCkWVp
 rkXEj4o6Rl1HvZizlSapVLcOyeV3ruFbFh2mlhJX3pmM6i5CDYL3GLxuyqDOk9Di7euz
 FE1E7UU5Js6SCxuyiShtwBMUEBgstsOuuTNCzIGzZFSkz+6cSvUBlbooTPVCC61mqVdq
 Kui5iFxc54+XwID31OJLRHiDx/Q3l5o478s7hnm+vgVugglWkG+G7glpUNVeCufTntvM
 9zKXHahne0/ZmWEvQKe+T4PbIqtbMS0Uys3sMhw0BW7iNF1K+luWaojkw72SWTW/YlMX
 Q8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756916247; x=1757521047;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zhI3DRe5+X+SOWNKbXoFOHpSP7IEamKPQO7YKwNjIhM=;
 b=mulW7XYtRsDwjyaX4RYgEDedOYFE4ryeUMWm3+X11n8xRllQFxVqJ6NulGT+n+P2tB
 lnSQ/8CS5fJNvAcWyiD/BARztnPV0gFOFwGI/fAwuHCGd3AEsWccc6iDUJ4g50JrIdec
 jKdYvYaZuUZXSyvIR3KN+wQDDMxEaHruo+CzFb6lT5oMzJgGS0nyTs9NZj43zZ/XMrfK
 9IIGpXzLbsHKl/8J/PDbFKspKPYiMd1FYMMfja/q50N4kr5UUEmmTlGuQz0PoCCC2lJk
 3iaofPN+sMMOYlHOgZjoFavLMKDyvq9WXqYabWsYzLLk3BjhtQzf6v/7hrSLVuGU4sFJ
 rHzA==
X-Gm-Message-State: AOJu0Yxkyqm24IFakkohyq/u31vzrdT1LlXrjiPGSILY5xLr9bptkRrA
 Vabl09bTSG1euSl+63q0SfwBCAt7PR0vWVRG6A52SvmXStBJtvT7Ttz9
X-Gm-Gg: ASbGncu8sToJ8HRpELp4u9eRGfsuB7J/lkS5AeN7ZWYkykzRfq0iNe7t1lj1MZAPU0E
 bzL1Nsn8xWmaxxpo9jCTSRiNNxXiQzZs+oT4c+WKQEIwTv2WMCnQoPGcTrVM9zY5Y1gRkYW7LK4
 kXtL0BeEHD7nQCOXbK6cW/kX0anMxmel6/597/jGH6agCUHp07OeF1rCzgjcqfaOkyks4jSjMId
 ZHdOMtARrFPDXvEqtt6M79kFPtllyVzv1Uz8lzlkznIGXSQUiSi6N8VyIUheW4OjzRHutASxYjd
 yQIjy/5coiXTafPqHgf0jHy7enqW7+YupTkULrd2eU6nfIIaPOEvvHswan5cLDBtphlmYxazBHz
 kHQCYknl6yNGLA8qF8y8SO98MEonv0u+NiugQK/lODIeQ/HwW92h+h7Q7Jhlsvsx5Q1o=
X-Google-Smtp-Source: AGHT+IGQvSyrqgXepsg7T3rt6MRb4D5lOt6u9g5K86HhZIiJtDR8DJpMha1fmoke+OZcXHmTNn9xUg==
X-Received: by 2002:a05:6000:40d9:b0:3dc:1473:18bb with SMTP id
 ffacd0b85a97d-3dc14731910mr4074650f8f.39.1756916246607; 
 Wed, 03 Sep 2025 09:17:26 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:9019:aa0f:b6e4:7952])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3db72983560sm5645734f8f.1.2025.09.03.09.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 09:17:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 0/6] Add support for DU/DSI clocks and DSI driver support
 for the Renesas RZ/V2H(P) SoC
Date: Wed,  3 Sep 2025 17:17:12 +0100
Message-ID: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
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
series [0], but has now been split into 6 patches due to dependencies
on the clock driver, making it easier to review and merge.

[0] https://lore.kernel.org/all/20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v7->v8:
- Added reviewed-by tags from Tomi, Geert and Biju
- Dropped rzv2h_get_pll_dsi_info() helper and opencoded instead.
- Dropped is_plldsi parameter from rzv2h_cpg_pll_clk_register()
- Updated commit message for patch 5/6 and 6/6
- Switched to use devm_clk_get() instead of devm_clk_get_optional()
  as lpclk clock is available on all SoCs.
- Simplified check in rzv2h_mipi_dsi_dphy_init() for PLL parameters
- Renamed start_index member to base_value in struct rzv2h_mipi_dsi_timings
- Added comments in the code for DSI arrays and their usage
- Added comments in the code for sleeps
- Rebased the changes on next-20250902

v6->v7:
- Renamed pllclk to pllrefclk in DT binding
- Added a new patch to add instance field to struct pll
- Renamed rzv2h_pll_div_limits to rzv2h_pll_limits
- Included fout_min and fout_max in the rzv2h_pll_limits structure
- Renamed rzv2h_plldsi_parameters to rzv2h_pll_div_pars and re-structured
  for readability
- Dropped rzv2h_dsi_get_pll_parameters_values() instead added modular apis
  to calculate the PLL parameters ie rzv2h_get_pll_pars/rzv2h_get_pll_div_pars/
  rzv2h_get_pll_dtable_pars
- Dropped plldsi_limits from rzv2h_cpg_info structure
- Updated the DSI driver to use the new PLL APIs
- Included the LPCLK patch
- Rebased the changes on next-20250728

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

Lad Prabhakar (6):
  clk: renesas: rzv2h-cpg: Add instance field to struct pll
  clk: renesas: rzv2h-cpg: Add support for DSI clocks
  clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
  dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
    RZ/V2N
  drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++--
 drivers/clk/renesas/r9a09g057-cpg.c           |  62 +++
 drivers/clk/renesas/rzv2h-cpg.c               | 298 +++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  29 +-
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 451 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 include/linux/clk/renesas-rzv2h-cpg-pll.h     | 395 +++++++++++++++
 7 files changed, 1349 insertions(+), 40 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-cpg-pll.h

-- 
2.51.0

