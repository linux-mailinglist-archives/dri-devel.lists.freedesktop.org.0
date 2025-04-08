Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E269DA81649
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0268110E1C1;
	Tue,  8 Apr 2025 20:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nyq0lhWq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2992210E1C1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 20:09:26 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so31139615e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744142965; x=1744747765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HxycxmR24mreWb3qYHH41P8fRm9tAvDYgVZJX5g6AZU=;
 b=Nyq0lhWqN/xkA0tuNqzmye3W3P1nXX3NOmqfnRhyHf6tPXZ1DuWJ6+sTzCsodL95lS
 34neff7bIdbtJ4+KWsD8pbhxch9Hd5bnbzN7GLGhz90AEQKdnoXjO2TyM8Sd0CPRTv6g
 AcQL9rg1ggNhk1KpWK7ikYOZnT0l4HHP4H69uU4V1nDqsMA1KOFPSPjdEYDzpary3jew
 EnWzcxozr/+1LSF1xmNmMP67NtDX9DKfweYH98OCYwHuejlNHNqhoiEo7F1sKNpY8HxL
 Wnp0TdI+Zw7WmOdwONZXRHPE2IxQewQZoiwehjon3kRFYHGkwYDnongwX/+eF/1mWeSx
 JRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744142965; x=1744747765;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HxycxmR24mreWb3qYHH41P8fRm9tAvDYgVZJX5g6AZU=;
 b=Ak8Rb3VXCQfAusoISsImFS73Yww+xgaQ+WF75OYk4AHkeaimzFApR0FjL+vEpRUNM5
 E3HGBOsVimkygwgRPR2vFga+HxV6lzkK2D56TMBL/1wFiEB3p2y10YXBPp+CY83xiVhE
 FcGt5pGLtt13SNAZxC3qwdwzFwX7s+e+MX4q4osTx3yzplb8NZQIwX/NkVOipER46hGN
 Vft0GpxR7X377dguycMpz42RjxXdl2+NoF3NWAylPsXbHimggETES9kGyqdvur+6hvET
 5biyasfMnedOojL+MYImryE0dxHV2WeC9uggqvhmcg8KEXiy8IYoQzgYbgAva5hZH4nV
 xgig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX0i9x8orqDOdF4VcJQVjvzkmnr66DIqt/0X9y6bsXRRHVEatUIJchDqsmlEBu7ERaNJiyC4yiMAw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdoIkrYfPaaLiZHbv1Nv6PxAwqqvhrEcGHUQwj7aVzy53nug3r
 o7qbRptEWlhClcJitBlP8btKfs1hnIZ95tbv1eHJcvNfoU/PJluy
X-Gm-Gg: ASbGncsJ4YxIN4y/ygm+GG4cJM8Usor/NsgdHDfb2j7DfNax90idBJWUso1eiIndVAL
 H1B/qFPKjtbST18qgh8otuON+ruGi9hNHtHu24GJNXJPT2cpLyXRniRwgk3frsjqO+ZBJjXF47E
 L4bcytnDKqidRGPNH4XZz2BqHjqEXkdluZKY+84L57lw6hawzfy6tNwC/reQyV84ojNa6kx/fCa
 /KXk7pwZijYlQ4D4J1+VW72ZgSUvVh0cSNLtIhSc4UgJh5fNa1wKtknEQF42Q0gmLFIJ3wObPZY
 FsxyRszTXZo28K39oNbNb786HzWeMTwTTOPPcWwV8zPdLglUX78pxhS1iRNnEX+3DIgRDCc1Xsi
 owTM=
X-Google-Smtp-Source: AGHT+IG4pnFJ8kcq862U72zyRWeCt8XlAxDg3swXx2I9PFJY/N49qCA0Jg1JfeOeNkChX7NGEB4opQ==
X-Received: by 2002:a05:600c:5107:b0:43c:f8fc:f69a with SMTP id
 5b1f17b1804b1-43f1fdbf975mr428285e9.4.1744142964596; 
 Tue, 08 Apr 2025 13:09:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 13:09:24 -0700 (PDT)
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 00/15] Add support for DU and DSI on the Renesas RZ/V2H(P)
 SoC
Date: Tue,  8 Apr 2025 21:08:57 +0100
Message-ID: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/clk/renesas/r9a09g057-cpg.c           |  63 ++
 drivers/clk/renesas/rzv2h-cpg.c               | 284 ++++++++
 drivers/clk/renesas/rzv2h-cpg.h               |  17 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 +
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 608 +++++++++++++++++-
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  36 +-
 include/linux/clk/renesas-rzv2h-dsi.h         | 207 ++++++
 9 files changed, 1299 insertions(+), 66 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-dsi.h

-- 
2.49.0

