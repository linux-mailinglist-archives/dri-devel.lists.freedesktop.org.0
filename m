Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC75B142B9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 22:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C9710E197;
	Mon, 28 Jul 2025 20:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xv05cdxD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F3A10E197
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:14:41 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so3222546f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753733679; x=1754338479; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T+utp1cms6cgiER7DRRzvLSUrGjn186aBUXh3YlWXY0=;
 b=Xv05cdxD8yK2KsAScVVeOelmEXW05Ld/iWecZox28C7wnKEhbLmV1LrlGGIjG06/Mz
 gyUPH1x195u8XW029RyE0rbZuW6WoiYkP/r22hsgdoYt7TEw9YfTElVtigJyzx7vwugg
 7/CYGIHLvVyhbkdkpKokhDRdIxuGfhDTvvPkRH+qINyUnDxfEsNGYCBE/KrvNmWp+Nz1
 u7NMk1rouGXvZAZVEBwO38cY/Sq8A5ljr7wdwTM4496/uWu/0hkDw/AKRvI5HEIjZfQB
 UTiyEfQx+a6y7ZR94v71ItXAxkQ2mLEiKHFdSz+fGAe6JaNOj1LGHfIgBnDYYZFyDoHh
 5MUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753733679; x=1754338479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T+utp1cms6cgiER7DRRzvLSUrGjn186aBUXh3YlWXY0=;
 b=amLhK0oHWP8cI8gBo5pEcVw/MBPc6dhEYyOUghnEGOWjWzYKgkD2gfxoFWXcm8ObXj
 +831dH3irEjvmj20+vQ2EZ3ES0hQL3lgwwvxmetqKZoxAc+VyV2438pPaPnSu86ZKt/u
 kQzglapdA0HkOYCKsEN5RDdKoXLQwwq1KKjAoEc4cdrUuIr6ZRV43Rgob6X+a51lei4C
 QcxB5qUAVTOvdcJZGzUIJ6w6JgYYVnWZKSdF/8sUocG88uhiK0dGJIg+FTOdeeucVUrw
 gUJ+rFjkUnKdtSjqVF/LHi4AFKBgFN7AZGMIOG6YRm3FWPt82+5hTBgm8rckBiwNIKyf
 mTKg==
X-Gm-Message-State: AOJu0YwzJDCgZt858InC2ICGOSJpMrUt/7GeUB3DfQPazvB+pPDb8naa
 eNbKINqWjryfkbM6fEuj4dd/pwQ1yanSgO7pFXvXFOcXT4bh8C1hEy2Q
X-Gm-Gg: ASbGnctXdzrEdiSb3fcvkUiqJswgoeJgObFqbYpwIwkQQNEoCDGwIxQbaRhsxlidLEC
 LmIa+qLyHIHMa/lkNUsmu7WH/1F6xRWdjJzdnxf7nIi8WrNDH9nhVnC9wKI/CfJA73+IhYmPgOp
 3DcUp2gOq1Awwce5WczG+ZRqn8J/xxVfoUlRsHiMML3wl86pL2hzv7sRRrwimd8ZNIVULkEMhBY
 BrLiXg6+ir2Df9uMHlnhWm6gx0Sg11FOIRH348SLbqtOPXHuXG1xFviNOc82ycBVNaRh+3SshUA
 XodFx67hK78ETm9Dv6KzvLz9llz66L858T2maLZEu0F3O3ZpmmHKX+X7/Z8f94I8o5LvgsWhf2Y
 4Gfep8RKVBYZkIHKs6Fr3MaNvTewOoG/14GamhSO/IEB3ZXC9DO8NLwy1fh5QpKhTXUxEeAGJk5
 R0iQ4Dxwo=
X-Google-Smtp-Source: AGHT+IEw4hxQDFyvDQPc/gmD3jB62NlzYomDEp60SWewFt3TQhW13eTkug0c+psbKhxHBuIBH7DGBg==
X-Received: by 2002:a05:6000:2003:b0:3b7:8718:f36 with SMTP id
 ffacd0b85a97d-3b78718165cmr4281120f8f.30.1753733679006; 
 Mon, 28 Jul 2025 13:14:39 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78889682bsm4317760f8f.77.2025.07.28.13.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:14:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 0/6] Add support for DU/DSI clocks and DSI driver support
 for the Renesas RZ/V2H(P) SoC
Date: Mon, 28 Jul 2025 21:14:29 +0100
Message-ID: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
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
  drm: renesas: rz-du: mipi_dsi: Add support for LPCLK clock handling
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 120 ++++--
 drivers/clk/renesas/r9a09g057-cpg.c           |  62 +++
 drivers/clk/renesas/rzv2h-cpg.c               | 309 +++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  29 +-
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 350 ++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 include/linux/clk/renesas-rzv2h-cpg-pll.h     | 395 ++++++++++++++++++
 7 files changed, 1257 insertions(+), 42 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-cpg-pll.h

-- 
2.50.1

