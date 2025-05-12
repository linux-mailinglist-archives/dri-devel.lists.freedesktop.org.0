Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463E3AB4283
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6BB10E480;
	Mon, 12 May 2025 18:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mDUYQ1kH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D43E10E476
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:23:48 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a0adcc3e54so2897342f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747074227; x=1747679027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ilHGY/SBXpmuchbNBUiAgnLFaJqUjHxmRnA6J0g+FNI=;
 b=mDUYQ1kHgq7cDdAixoiE6VrHs4yv9cU2jT4RHDtcdo+E82tFoIHvAZJm4hKrRVCGL3
 vwu6e+YWCCWsOW6ZfkXPdxRsAvFfPBnt8x8+YtyD2w9cn4VCes5ehrrPAqQsqJSy1Kzm
 gVNXHJIq3hoIDYQcM7MBPVxZebrqtp0xgv9ThTRqR3fClM3svlvmha/8dLNwFa41w7Lc
 wV7dwkPoip57o3yW5GrpBWE2RTpM/Ub5QxC0UPek3DeVVVeiGOB5DQmlDCxEv/8TRlkK
 r1hfbgXvX4XhhlPEB7pyb+W8xGTxmjXZWFWyyjn8lPLbhKl9Rs1UuBu5qrlr0kj7KMmM
 v50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074227; x=1747679027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ilHGY/SBXpmuchbNBUiAgnLFaJqUjHxmRnA6J0g+FNI=;
 b=Q7qixWseSi+j5MvQtEBGNm8Uglyrmn/XixmxYXJl5Y/L6+M++w0yb1zjRWAAwKvx+y
 o0RNonG1UUn2+UJqU38IZMS9IWersRRttlo0MfRfJFL67ZTuadAxLtLdUf/nqTt2rA5K
 7VcsI9JE65Mywb7Z/a1P3XDSdaLshouEY1kkMbS++mxA8NsPI/ypg3VrzDexhrbp4DQA
 W2UG39K2coKF3Wx4jkW/mOvTp8N2Ezzj/K9z8pYR9ZWno1ZsHN/XuUWQH3BB+dbNDEN7
 5/dHP/UuwVye2mjdeYfyqJ2oUp7WU8dGUhItljoehcph7UG+mtXJdE7a1BmdyS0sdLMt
 RhEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ2nLYSL08B0WPtrCwhXOBNo88RMFGyuyvJ/svzQaHQJn8e0hVRRATEpulqko8pzSYSq8++VmIuhk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0y4Q+ChFdGr9u+g6rQ+qnAOPZhKlQ9D+y2yXLhnWlW+254zyY
 TqwzsxGeMbBy3OgW1ckiXbwUhVVhWZXLeSLY2n0+ooGoO6nQ2AY/
X-Gm-Gg: ASbGnctZqtLuf4X791Fdw/P39BTaio+rDLv3nYlYKtgLk6CDAhfAMV9XHmEOkQpXqgS
 7X3ut7wYrvXP+tUw+uy95qT7pjN68PI67+AmUFKXjmN8ZHQjzUQa5B1l8uGwbwNOLOFnP3kUzok
 nJwfpGh//BckNBh4lARh04Cfi3tJiZXSMV2HHzeekWxJsNy2KNAOrhmOcRQ/t/j52WZszRXVLRJ
 +uCchqSCOXep37sVCNrZKKfWdAJDc1iqvR+o6hhXFVhe8VGQpT7hxKxtxhh6BoOLR6hkY4161e1
 03jTsoDyz/nqt3/Vb/zhmsC2I5zhnN78em3dODD0jGs4NKnetFiCzAldsXYWzga7dNuXTJog+4f
 ck0eV87Una10=
X-Google-Smtp-Source: AGHT+IHodW+DOLnG+Hp3KSPhPBglp6k0rsIi/MJiNipme6WTus3GMOGvlkseuWklg1JLL5ODZe9K3g==
X-Received: by 2002:a05:6000:420d:b0:3a2:30b:b2 with SMTP id
 ffacd0b85a97d-3a2030b01cbmr6738495f8f.57.1747074226480; 
 Mon, 12 May 2025 11:23:46 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:23:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 00/12] Add DU support for RZ/V2H(P) SoC
Date: Mon, 12 May 2025 19:23:18 +0100
Message-ID: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for the Display Unit (DU) and prepares
the MIPI DSI driver to support the Renesas RZ/V2H(P) SoC. These patches
were originally part of series [0], but I have split them into two parts
to make them easier to review and merge.

This patch series does not have any clock dependencies, so it can be
merged independently via the DU tree. The remaining patches from series
[0] will be sent as a follow-up series, which can be merged via the
Clock/DU tree as they have dependencies on the clock driver.

[0] https://lore.kernel.org/all/20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v4->v5:
- Split up the series
- Added Reviewed-by tag from Biju
- Dropped feature flags for reset and LPCLK
- Patch 07/12 is new.

v3->v4:
- Corrected parameter name in rzv2h_dsi_get_pll_parameters_values()
  description freq_millihz
- Used MILLI instead of KILO
- Made use of mul_u32_u32() for multiplication
- In rzv2h_dphy_find_ulpsexit() made the array static const.

v2->v3:
- Update the commit message for patch 1/15 to clarify the purpose
  of `renesas-rzv2h-dsi.h` header
- Used mul_u32_u32() in rzv2h_cpg_plldsi_div_determine_rate()
- Replaced *_mhz to *_millihz for clarity
- Updated u64->u32 for fvco limits
- Initialized the members in declaration order for
  RZV2H_CPG_PLL_DSI_LIMITS() macro
- Used clk_div_mask() in rzv2h_cpg_plldsi_div_recalc_rate()
- Replaced `unsigned long long` with u64
- Dropped rzv2h_cpg_plldsi_clk_recalc_rate() and reused
  rzv2h_cpg_pll_clk_recalc_rate() instead
- In rzv2h_cpg_plldsi_div_set_rate() followed the same style
  of RMW-operation as done in the other functions
- Renamed rzv2h_cpg_plldsi_set_rate() to rzv2h_cpg_pll_set_rate()
- Dropped rzv2h_cpg_plldsi_clk_register() and reused
  rzv2h_cpg_pll_clk_register() instead
- Added a guard in renesas-rzv2h-dsi.h header
- Reverted CSDIV0_DIVCTL2() to use DDIV_PACK()
- Renamed plleth_lpclk_div4 -> cdiv4_plleth_lpclk
- Renamed plleth_lpclk -> plleth_lpclk_gear
- Collected reviewed tag from Krzysztof for patch 3/15
- Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it
  is not needed.
- Simplified V2H DSI timings array to save space
- Switched to use fsleep() instead of udelay()

v1->v2:
- Rebased the changes on top of v6.15-rc1
- Kept the sort order for schema validation
- Added  `port@1: false` for RZ/V2H(P) SoC
- Added enum for RZ/V2H as suggested by Krzysztof as the list
  will grow in the future (while adding RZ/G3E SoC).
- Added Reviewed-by tag from Biju and Krzysztof.
- Replaced individual flags as reset flag
- Dropped unused macros
- Added missing LPCLK flag to rzvv2h info
- Dropped FCP and VSP documentation patch and sent them separately

Cheers,
Prabhakar

Lad Prabhakar (12):
  dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
  drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
  drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
  drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Add OF data support
  drm: renesas: rz-du: mipi_dsi: Make "rst" reset control optional for
    RZ/V2H(P)
  drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency
    calculations
  drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
  drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for
    RZ/V2H(P)
  drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring
    VCLK and mode validation
  drm: renesas: rz-du: mipi_dsi: Add support for LPCLK clock handling

 .../bindings/display/renesas,rzg2l-du.yaml    |  23 ++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 ++
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 144 ++++++++++++++----
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   2 -
 4 files changed, 146 insertions(+), 34 deletions(-)

-- 
2.49.0

