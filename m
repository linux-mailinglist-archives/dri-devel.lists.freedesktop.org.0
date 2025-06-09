Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA53FAD2A03
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 00:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8ACE10E078;
	Mon,  9 Jun 2025 22:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YIsBOYl1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6ACA10E078
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 22:56:47 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a4f71831abso4529563f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749509806; x=1750114606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y2tg4REnvOCyUc7MwuvLcq48UH8TgGrD41gWMRdQ3RA=;
 b=YIsBOYl1kWWOMNh80lqk9IV0fgpn9WmYz7l6BPOm7wVd7TqFeynzrVc5BcH2KOObqs
 lesxdEaPH7DRnGQpPTYxQnzw/vdzz+DGP5Y2RtDi5t52MHzKnqzsCTfuEhQHmKpZvomV
 pp2unZHxdSSpiD8QPkr9CR9kK/cBwHjw/tqdYQTtnLIePxv5XBVWRdxywmamNrsAEH5I
 cH63le8tFR09uSHHPnHEeg0CugT0nLtyvmJ0wPW5MPA4ClE+sL4NKJFuuUSf1dO3QsCl
 9AUDE/yhpbCv5TenpreevR6mE6kVuhjuc+bGmATP/8T8mhEA9c/kyqUBcphHm9PQ+jBv
 6mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749509806; x=1750114606;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y2tg4REnvOCyUc7MwuvLcq48UH8TgGrD41gWMRdQ3RA=;
 b=l2HzNT0DLU5OXp7cI7+nLHGCXW36avm+icmaimuPFfG7odraArfnlvML1QKcS0rr3u
 REGrupgGs6ZBHMW/wXr2Jb8lra0xzg74NA7hLQ8WJSWskp6RJoNryOOEdtIw3Oj+61sY
 mvQt94rY33FyD7uzD8VuTumXLM/74ga3QkvssbKyDKNL00zDUpHDkSQ/frM2WXtwNs3+
 3hh7VGa6AEneJObIIjM+ih2eMVEU17grjRrKkc8NjZxJNCd5xWe1/fVtTRYlF5FBAjoc
 wUjWxacEdrTpwThHJDPko7p7WyRTwxkHQtr2R4puBcCozzEgEH6XPG2gywtPEFpaJzKf
 ZKOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpfWR8rztATsqMUofonN7G8z5wOhLHpco5e1z8H57+J2Bn+yqQnq+4cq91CtyN74ug28cHCmlhfL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwxclJnOuwCnTqc4kE5QVz3o3EKe96hMDQ0zU+87OU5b5RsOr/
 6/xaGrvI9xvazU85DBFyXjLOmfGSrCkrzTLC+LY2lwKqpb3ltyoSADeT
X-Gm-Gg: ASbGncuyFs3+RqGhQl/CV3tdhveAAW2em6UR1uqM2wiRxfaJH/Z+SyugIW/xvXdYewX
 tIbFCFF3LuGP4sdXZ7/NmI7wJ8X2vr9d6LBl1KZW0f9nCrAlyxkfS+GQvPurZEYyfM+F249IJD0
 zVL00e4izWcb701W6rk+eQEaTU2P0GdqMr7c9/rGW2IhAwH/CR+5U8ztCFtRXAFjhpdd6P2nj/1
 rm1wfL1GFR1bQa5QmwvKFzPL9K0cgwEY7y650WDiGBt9P29x8Zwgl2LX+ay3e6ZNKeu5MIGRJ/L
 1tTZ7SWwJMCAfY+SdwO/k8IUS3+Mt7ybuxon7jZcA/BDKZp3cDv742sqO3PzqsUQoVU8+c2QMdz
 CAvtusfeH9m7VLIheL2g=
X-Google-Smtp-Source: AGHT+IFJahUPqFeA1/CIDgdsJOEop2L5elXHggdcexotI4Nd98oxIGFQEFOWFLGL7BQt6JPOSKk2sA==
X-Received: by 2002:a05:6000:40c7:b0:3a0:a0d1:1131 with SMTP id
 ffacd0b85a97d-3a5318823c7mr12577315f8f.7.1749509805894; 
 Mon, 09 Jun 2025 15:56:45 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 15:56:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 0/9] drm: renesas: rz-du: mipi_dsi: Prepare driver to
 support RZ/V2H(P) SoC
Date: Mon,  9 Jun 2025 23:56:21 +0100
Message-ID: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series prepares the MIPI DSI driver to support the Renesas
RZ/V2H(P) SoC. These patches were originally part of series [0], but I have
split them into two parts to make them easier to review and merge.

v6->v7:
- Rebased the changes on drm-misc/next
- Dropped DU patches as they are already applied
- Fixed revie comments from Laurent
- Dropped patch 12/12 from v6 "drm: renesas: rz-du: mipi_dsi: Add
  support for LPCLK clock handling" as suggested by Laurent

v5->v6:
- Added reviewed tag from Biju and Laurent
- Updated commit messages
- Dropped parentheses around the calculation
- Added min_dclk above max_dclk in rzg2l_mipi_dsi_hw_info
- Renamed dphy_late_init to dphy_startup_late_init

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

Lad Prabhakar (9):
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

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 151 +++++++++++++-----
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   2 -
 2 files changed, 114 insertions(+), 39 deletions(-)

-- 
2.49.0

