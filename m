Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D7EA93DA1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B703F10E23D;
	Fri, 18 Apr 2025 18:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bFfx3l8h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D9D10E23D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:47:07 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-39ee5a5bb66so1362685f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745002026; x=1745606826; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xf3q8YDPAJeeyFaU7k2MToDpz8/U6cAu9PboxW53bls=;
 b=bFfx3l8hpm/I/uc24Jm8rUsvIzhHCyd84zR0Sx+hOAmWqIuf1nFNcO97DOUgjnV8CQ
 IY7g4+C9jeFEHOpw2h8/fokjpu3/Ig1590JEctOmbfFZ6rGVawVq6FCih7uoiX8vq4om
 swHeWxo9kR2OmWAzfSAYtzMoIDGnggN/cpcZ2V8QnQ/x+0Pwh3IQvz/S6mnsAeeJP86v
 oib2I62XKlNwt58ssaBzyhiO+JlqbyykQvVOZSWtyw8l/OpkeccpOGJUONJsOwSYqjvl
 FxAVXsdU5B0Tltb4Z1VPXqMYYByr4CHzCXC1vSHUfq0p6Q4c/Zu5YOaimiMFvGV/28yH
 6HAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745002026; x=1745606826;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xf3q8YDPAJeeyFaU7k2MToDpz8/U6cAu9PboxW53bls=;
 b=AopmqD0ZVapGi++1ZB5NkE/0Pwj/9CqR/kK3JrYwzu4denYOhoLAuy9ZMA0UpslomG
 gHOJ+zaOa53RFl97b0F46S/mEHh8BeNH8XAsN2eBHQvTsIFi3Svu18ZF9Pt/JJmUO++q
 a9QGvvsuz2C4GSL0poyIMrxvnlmflAwXNGm/ozkJWj0HVHn125BlP4VBQMZvc6EUvsRc
 qBzJzpsqmazGgW3H+w/hIIo9yMp8PU8ZgX4WmWc9jbn1uN/JjhQ/tx3oYmIe10TeEoeS
 DgQgAPqNp3bTVYyi5UC4PxK7R1vq8DIuTmOxFMtJ26YCO70/C1cFs6LGQS4AXVkVL3u4
 01gw==
X-Gm-Message-State: AOJu0YyjVQmdlT/RqgJVj+/MGlOfsCt3pU/KfT6pzllV6q0liVrZaKhd
 JBE/deLyPGksM6rMMadqMMXc8aurQAXasYtnjErQ/lwKWmayy518
X-Gm-Gg: ASbGncuNpM8FWjY7T8exLooSmF/zs5/KOsJ6WWZiiwmfQlkFFOIMizTndYcNcRQyc7g
 +u0HiTC5WY1+Ldtq2D2vmibmp708tDDKDsqsLK347SPyoJXWtKbaMX5hxw+RwD/FDTZX/ouDY5t
 fmQKqQBESyu6khuKsr/i8uMa5BamF1hjgC5IgqsrDazfN7c5CbKvoogm8kVyrp/y7NcWyc4oWi+
 KHYJVNqKOUxk07ee+rXjb1BqmPZMKWH0K2Q6XRSZUQFMse5gQzdVpuj+Dl4DdkdTA3WCxsMRh1B
 etkgrJwyrAl0F6Vl73zNxIcn5fxOWKvSRMOJ3v9Ex8mLEIgrXF98vEED3lmXO4RvJG5A0q0xrUp
 U
X-Google-Smtp-Source: AGHT+IHS8vLHpVzBqvxGhBw2n+0p0yJYim/zKB8jUDojxZGyaa9qGnb0KdwqJy/aIiAhn82k2Kx5sQ==
X-Received: by 2002:a5d:584b:0:b0:391:412b:e23f with SMTP id
 ffacd0b85a97d-39efba3c819mr2746452f8f.15.1745002025495; 
 Fri, 18 Apr 2025 11:47:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:47:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 00/15] Add support for DU and DSI on the Renesas RZ/V2H(P)
 SoC
Date: Fri, 18 Apr 2025 19:46:43 +0100
Message-ID: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for the Display Unit (DU) and MIPI DSI
interface on the Renesas RZ/V2H(P) SoC. The initial patches add PLLDSI
clocks and reset entries for the DSI and LCDC and the later patches add
support for the DU and DSI drivers. The DU block is similar to the
RZ/G2L SoC, but the DSI interface is slightly different. The patches
include updates to the device tree bindings, clock and reset
controllers, and the DU driver to accommodate these changes.

Note, my initial intention was to split the clock patches and the DU/DSI
driver patches into two separate series. However, I found that sending
them together will make it easier for the reviewers to understand clock
related changes.

Note, the clock patches apply on top of the below patch series:
- https://lore.kernel.org/all/20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

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
- Added a gaurd in renesas-rzv2h-dsi.h header
- Reverted CSDIV0_DIVCTL2() to use DDIV_PACK()
- Renamed plleth_lpclk_div4 -> cdiv4_plleth_lpclk
- Renamed plleth_lpclk -> plleth_lpclk_gear
- Collected reviewed tag from Krzysztof for patch 3/15
- Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it
  is not needed.
- Simplifed V2H DSI timings array to save space
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

Lad Prabhakar (15):
  clk: renesas: rzv2h-cpg: Add support for DSI clocks
  clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
  dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P)
    SoC
  drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
  drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
  drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Add OF data support
  drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency
    calculations
  drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
  drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for
    RZ/V2H(P)
  drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring
    VCLK and mode validation
  drm: renesas: rz-du: mipi_dsi: Add support for LPCLK handling
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 116 +++-
 .../bindings/display/renesas,rzg2l-du.yaml    |  23 +-
 drivers/clk/renesas/r9a09g057-cpg.c           |  63 +++
 drivers/clk/renesas/rzv2h-cpg.c               | 237 ++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  17 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 +
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 498 ++++++++++++++++--
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  36 +-
 include/linux/clk/renesas-rzv2h-dsi.h         | 211 ++++++++
 9 files changed, 1144 insertions(+), 68 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-dsi.h

-- 
2.49.0

