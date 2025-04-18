Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D95A93DC1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DA410E289;
	Fri, 18 Apr 2025 18:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jf6eNeTJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DB710E26D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:47:25 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so1198791f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745002044; x=1745606844; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E5oOkopbDuQL0Q5zhCrtOHmIDTJa5SEh2Wc6sSfhmJY=;
 b=Jf6eNeTJWDn0rOvNAfzKI1ECxFX/EWeeOEKumVTH86oi8avUTIb8FijpgxfrWR6JT3
 ONfhpN02ZmIpcrXeLKiTBVqK82Vt3fMkRhZU1Qn3sDJnieHvSdjCnVlEtM0QVgamY1YD
 XeaLEPE8rj/s4x0DPUqNyx3/cQMi4pi04x1W1nbu6w54oxxKjvX2kkHzgxDK6QbWUIsm
 qQl8g1vXQV1BdALYKxK1rk9D8sTVgSQbx/hFK5H+CWOrLUagPurbKNA4Xlp3GP2CSaSl
 EOY/Eeg3cwrranML9mclcV1IUYXdIeJd7yXfSO8kMAW1+hbZOdHLRLxDtzzrs2nH3hoX
 YaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745002044; x=1745606844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E5oOkopbDuQL0Q5zhCrtOHmIDTJa5SEh2Wc6sSfhmJY=;
 b=FNvG1wf6my9euQOfWEPOAlAj87c5vxX0fOfewwzAHbYz398sjNnd38DqQhr39zI5av
 yP5WRBwkdx48vuambI7gKdzpGTK+gaLS0VFbjKQz+AGZHYHdnisYHdv5Rd4RMiVwU/PA
 X+XKc7F7rw4bjU3OatekJCoQdgpn7MLg6jCmtXH+KYrhdQC0ljjwrF7PPN68mzW0MvLI
 el8BVhtUlJDcgbGIw/OmeODm0icfr3b6PgFgfsI2D5X1zPUfYXxFNKZPAYP/uceqRbd+
 Qmd+psP1bp0zT2AM1D6pnbfSOaMOayuHcbu5uKJ6/0bpXJuBIjBCCaeVMN8+kra568RQ
 aIsw==
X-Gm-Message-State: AOJu0YypXGL2LX5U78n6u+HSH/6fZ6SqBZlgLhmGWBc2wM5soyfcSEZK
 zbUmStrxeCwWrXH/dROX6G8MfwRmhqZikoDpQhBXt4hWLPG3Vkf8
X-Gm-Gg: ASbGncuw0XebZgE1h0Y+DxRdfSDOyFdGumliLUzCzdel2ywtDbF+JgTbM/P7h0++NnD
 ZPhu7kvPC0AiIAUy9XXeewos2ZXDzJdDGWQ7LhyDJdX3K053y9RHW5Zs0AHkotRH1/zClL7fMsy
 EtXamIqqPebPPJNh/aBNojEfHvxzpn83F5IXWq6BXD8Y5kCiJe5DOkMfC5+1r0YYx5ClGcb+YQV
 splUqTPMphZfds/+rlTijCMtI6x1w9Q3/Egbx1fmIeYWN9XIABHfVX0Hb0C9GUsUsIDGV8G3jqq
 v0G/YSWsIjzb5YEDGuw0WCVowuCUocxzuTOO46ObBHJk3G9XM+0uSx4nxDw6KqpmBQ==
X-Google-Smtp-Source: AGHT+IGHbgal7IkFtfaM44VjgqN2XQ4CCC4mcvJ6+3sPEawAA3aXDEpE+v2hXgdqx5APUkTFPwXdEA==
X-Received: by 2002:a05:6000:2510:b0:390:f2f1:2a17 with SMTP id
 ffacd0b85a97d-39efbaf14c5mr3101088f8f.53.1745002043805; 
 Fri, 18 Apr 2025 11:47:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:47:22 -0700 (PDT)
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
Subject: [PATCH v3 12/15] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init()
 callback for RZ/V2H(P)
Date: Fri, 18 Apr 2025 19:46:55 +0100
Message-ID: <20250418184658.456398-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce the `dphy_late_init` callback in `rzg2l_mipi_dsi_hw_info` to
allow additional D-PHY register configurations after enabling data and
clock lanes. This is required for the RZ/V2H(P) SoC but not for the
RZ/G2L SoC.

Modify `rzg2l_mipi_dsi_startup()` to invoke `dphy_late_init` if defined,
ensuring SoC-specific initialization is performed only when necessary.

This change prepares for RZ/V2H(P) SoC support while maintaining
compatibility with existing platforms.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 36b8ef95f20b..c3bd3b21dd15 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -35,6 +35,7 @@ struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
+	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -318,6 +319,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	if (dsi->info->dphy_late_init)
+		dsi->info->dphy_late_init(dsi);
+
 	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, KILO);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
-- 
2.49.0

