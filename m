Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF9BAC941D
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE4510E871;
	Fri, 30 May 2025 16:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ea4O0D0U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E8C10E1A6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:59:12 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a37a243388so1849214f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748624351; x=1749229151; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vkdnsh3Xxo+Ft79KgRHH0heaPX+QG6uGdrT0HQYcCXA=;
 b=ea4O0D0UesbXT5Y8x9a8XztP7UztfUdOR643Oar40+ACG+xstQLUVRVU6qjwGDfkDU
 imWbVUBs84VkiRB0h0drMEusPHs99clt2JN4Jg9e5+MHsQvPNHXBvpMUXJ7UUl/u3xS2
 HD+7GG7aO2TkiEJfCMS8wkWOgcm8aylCzWS6B00Hfg2rrs7bzZv2hLi4LjE861VJ60De
 yZDcy+Ikcp1bRYVgEy9wcQ1R9nAUHjCMj6YrJMj6b6DyykvlmYr8IMHDEVGtS2ugxKP2
 9kcm1Ps/HPPFCVOR+qlhR7oZsA26qHnzGSx6Ywc20F8EjLXkDvx6nloCidmxFSXmKs89
 Ymew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748624351; x=1749229151;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vkdnsh3Xxo+Ft79KgRHH0heaPX+QG6uGdrT0HQYcCXA=;
 b=iBdZgo8Nrm956V2Vr1PQQ4UoKCKQ66hdb7dRV/URl4IyVu0SV6YHztyPKcfJDCzlrR
 FlYel1ELyy3Qdx8X6jgaex/8HZvRta9orT9omsstHSFHntt1admMTRXdd1JDyeA/6+uj
 cjG750Cw5hNMrS51idUSgRFGu9wdvEncv9OaU1Q+uHrnozJtzplr7OynWSxMQf76nOi4
 11gYUJxQS1+iNvL1gfTJvwhb0Qamx16eZaY4drclhI6WFw8rcTsMFwB3U8TigHtyDqUg
 tU/qfOPxrN46UJh0JvtHSdyTcYVoa08UjuMcu1SI1QN0fmEcsM/IcXE+E8JnWQv3kb4D
 yq8w==
X-Gm-Message-State: AOJu0YxqcI49ZJxOYye5S0ZaOajiJlWiKUICY3vIWU7PxpiYxwLBo/lo
 2/j3H+WrCdtpptM9Xy1vgAg3Kzrd8YBSxAlXl56LFPeEbC3eI5lFcrxz
X-Gm-Gg: ASbGncuzoNBKCWwGrwO/hRfB4iIrRidG8gmeTX+Dn/nJXl1lNENoQDpgSjQYDaUUYPu
 WnexHWDoiMCXaKVDV78B47DRv80sT4hEl1UjhPpy8mcJr5lDlnGBxiLErexw63S4s5hImuy7noU
 Al9y6IHZrXu6qQsr+rzg/AsyXHv+43P8p2xNRTVsrDeLXfMDUMssfqDzyIUSyFMwit55npbNFwc
 QjjfcpSe36kck94o2+z8/+jgTF22/CxPIzoh6vytEy8B3eAD6MDv7fr07ymQIhMVVIZstOUc40t
 WcuhxVAJxBEdD5z8o4+tHGZzFaZbuhSeo95Dp+00bikKcL2JSaoiQFbwkt5EZlcNQ5rbXRBxPnt
 sZb+uAmlwWQ==
X-Google-Smtp-Source: AGHT+IEMdCh9bMOyoUceDJJDejeSDUZ4ZYwhPF0Vjns3pxUtXH1NXJj6z9RwihvUpQ4S/igJjH4hCw==
X-Received: by 2002:a05:6000:220b:b0:3a4:f50a:bd5f with SMTP id
 ffacd0b85a97d-3a4f7a825a2mr3097258f8f.31.1748624350952; 
 Fri, 30 May 2025 09:59:10 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 09:59:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 00/12] Add DU support for RZ/V2H(P) SoC
Date: Fri, 30 May 2025 17:58:54 +0100
Message-ID: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

