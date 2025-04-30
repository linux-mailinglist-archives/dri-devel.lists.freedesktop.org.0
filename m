Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5840FAA55B8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 22:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B3410E348;
	Wed, 30 Apr 2025 20:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ty/wSACH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA3110E482
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 20:41:32 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso207625f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746045691; x=1746650491; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BeIimSTGkxAiQACuV5flhhZMsgNREPFEsZ2/L02ocZU=;
 b=Ty/wSACHVpT8OLcRXpXt0pOswfFsCWKQDCGopEI9Fe3SxoXuK5pKpzuXkEG0yIztzo
 wMcBlql4fjjvUMMWtMGXpTFN4MWlEFgym7kHlqdbhdgcF3u7d6crOSMkkd0r4qbTyHND
 H+UmmzM4GDa0GAWfOYjJtdAD2f1bLS+Gee+IGM+Oh3bGCwd/U/MnDxi1Ny+HDn5DSIP/
 hNTvHYArsP6UXzkud6SYXfulNSBXWgXIZhEA0GuiKEmTnTN7yu5y6haRfQ3/jdqUTVcQ
 VUpjSfCZH5cM19OM9SzcpzMBlo3xi41B+ZvbHailqpkb5YEXpnwhQWoroyIwR6XIpg4H
 kvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746045691; x=1746650491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BeIimSTGkxAiQACuV5flhhZMsgNREPFEsZ2/L02ocZU=;
 b=fhtiTuFcvxeTYNz+0mJHPUAN1TvVWa4UQhZ5iilv/X9dd9jIfUrFFPep+GPTIvOPvh
 1WdBZwyiy71POi9xCMYPsTysDBzdJ06nHNUttHNgm9gEt0qiy/5pU/mefnb/p5iM+M2/
 p42FT85iQhB9zGg7H4Fu8IPOKthfpmhMVyQuB4xicDTj2H16mITZxBH5VZ+A5mi4EGMG
 6YkyaDggPQdBC9xA1LhGuo8Szs+kDUI++h7+GqBqOP5/UaoOyqITpuaC/BL3TVtm4IS/
 t6NSdqGLHFUWFNff331YDHqAW98Uqm7H5IOO8iKBEQrsU99NGL/my9dlrCxFL7C6JlFm
 VrzA==
X-Gm-Message-State: AOJu0YwL/OpLvLaQFgAI7dawl1i8TlRpmJ96hJqq8v/PX37KKIDmpIlR
 Z4RYeW77WVGr5tFLsEh3jgP4Rx2XzaN6zCYrlPiQJVlOpv043ZDN
X-Gm-Gg: ASbGncsvqyXTmWFP4p+oHI6vQjrvXeswbkV0junERV9Y9s+tfBL/WzbYggToBEdDbsl
 +2epHfZkiua+RnwcMvVM2d11QZ/lpIXhymSa9lu69paDtfp8D1Ec5rxGRqN17qqW63URQiokE7X
 NIJxc3vCEzPLGCL8tmXmrrYVpTh0chvHNCtZRwuJvIcEVJIgcZcsCLogMPkA+LiZfg6SJHO7zX2
 5HDWEgmh1aRjgurl1YeflStv4v432xclCYE+yShuaJo6EvtkYQFVPohivKkGfFfhTz4/QG3XvJ3
 JobJQQn8rihkiqCxvWGfptFnQoqEapczP0Kreki5kZxcYO7Zi5iMYS5+jWQwgXqQsiJtQvrhaL8
 =
X-Google-Smtp-Source: AGHT+IGXi9gEHMu2kkOiJyeElS9pMvis5d/bb/bWjaAFc2lIThqPQuTspcq9AFbQpjJeQQy6eLr92g==
X-Received: by 2002:a5d:4d0c:0:b0:3a0:7cbd:ffb7 with SMTP id
 ffacd0b85a97d-3a092cf7e96mr629197f8f.16.1746045691125; 
 Wed, 30 Apr 2025 13:41:31 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 13:41:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v4 11/15] drm: renesas: rz-du: mipi_dsi: Add feature flag for
 16BPP support
Date: Wed, 30 Apr 2025 21:41:08 +0100
Message-ID: <20250430204112.342123-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce the `RZ_MIPI_DSI_FEATURE_16BPP` flag in `rzg2l_mipi_dsi_hw_info`
to indicate support for 16BPP pixel formats. The RZ/V2H(P) SoC supports
16BPP, whereas this feature is missing on the RZ/G2L SoC.

Update the `mipi_dsi_host_attach()` function to check this flag before
allowing 16BPP formats. If the SoC does not support 16BPP, return an error
to prevent incorrect format selection.

This change enables finer-grained format support control for different
SoC variants.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Renamed RZ_MIPI_DSI_FEATURE_16BPP
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index a4c0dbae4a46..8c7384b95411 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -29,6 +29,7 @@
 #include "rzg2l_mipi_dsi_regs.h"
 
 #define RZ_MIPI_DSI_FEATURE_DPHY_RST	BIT(0)
+#define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
 
 struct rzg2l_mipi_dsi;
 
@@ -643,8 +644,16 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
 	case 24:
+		break;
 	case 18:
 		break;
+	case 16:
+		if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_16BPP)) {
+			dev_err(dsi->dev, "Unsupported format 0x%04x\n",
+				device->format);
+			return -EINVAL;
+		}
+		break;
 	default:
 		dev_err(dsi->dev, "Unsupported format 0x%04x\n", device->format);
 		return -EINVAL;
-- 
2.49.0

