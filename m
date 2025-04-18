Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E6A93DA9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1350610E3B4;
	Fri, 18 Apr 2025 18:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uf8YbWmg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B9710E26D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:47:16 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso1406847f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745002035; x=1745606835; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+95RTDXC74PC89KcMLnAbGqS5LYJGQCka2uPYYp6JLM=;
 b=Uf8YbWmgduBLdNcfM/ndqTQCAl06qKSLJ2MLVnnsHLH2tu5L6x9ij9ufLUS0aJAHmc
 l2pApgKBN4M1z5b6KBM/Y8oHk6xEuwg3Flt1s/lAbq4iy1Qe8MHfdRob5bOnQ8nLmNoQ
 4mM17+RIh72Ab0l5/grgXXEunTHH2sv2HRQr8CeRAZAoenl/A/VlpmTfKbWFYHeup/UC
 1k70phf2JHbKKnKTaK0DSAuN/18qXEVhkK+BKMwlsLE7Rt+iQHqEH5jHDdChfHq11sgV
 SAaY4WtpL2LmjsKVq9c5A8Bx/GRgIGsdzVpJ7T1qaF2vDCpPEjkoXA848eY/U1q9k14Y
 vh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745002035; x=1745606835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+95RTDXC74PC89KcMLnAbGqS5LYJGQCka2uPYYp6JLM=;
 b=hsLrznYoxuyWOg7mRZC42vvqWo7rB+oGZw6DyPffjJnAjsIo3s+oinnU+o/84m/y2R
 FmmyY3bIxZTiHHYCEFrbkjT0ITGMd+i19+oblxtpr7J3NVBYTFHIMilCrv7wgl98oMMW
 8vdqMCaSDy/oQILBWtWIHkWnIGS+DE7rITsAzxyk8ASUh6MQZkNIjD1t8PU/FlwCU8gw
 pzj9p9Lza27Oe84p5XnCqk/JvzqQCYuexK96oEab2/qV6epp1GAiH9ZOFiY/PzMMDUK/
 Rk+aAp19VLa92sAjpnu6f0ctct3nV25Zp4C5KE1qnYUVVJzkrEfk6VgB4NUy8UK0MR9u
 Z0bA==
X-Gm-Message-State: AOJu0YzzUAZ/8ae0OzMaMsr9d2JRAxEjtfDPAv50NGV2alls/RYVlBIj
 u4fCk8irzYeA0yY2zgYYdaogDeGuQfR+yDZA1iTO1qnMYn9OUQFS
X-Gm-Gg: ASbGncujDhdx8bP9jaR30RH9OMbaStoU3pun/A/F79RvgofwXuZgHVBUKfbR1v7McMx
 7kk1jByeb/8T59p3TYli7rU5V2hJ6F43UxgB3Odtu77UYOiAJTKyG1K43hEddUhV2HErBFAPhRQ
 H9En37+GOJ5NY7A3Vg4xBPfknjQ3aS43wuWTEyKAtTcDjfUvykUrFEPzlYA26qpUrf5YLXWz/nG
 YQ0TqT11P3Vpvv5mh7GBaWfuUHvmf79yVwyhdAoB4BJbNWCis9VUNDSGdeoM6WCKoK4tu5pZskJ
 QZGwOFZt81L1OBJInYR6dm8GoxNYmv5lrKAFr2Xyn8Wi0qWu+s0LxCcq1pZO9iTvDw==
X-Google-Smtp-Source: AGHT+IHwpmosrhJ80ZwpOiqZD+/pdcgM7gyuPqXB6SgIePk3fMcj/ZMOWh1Y9WtUx1n3TFw8Hw7uZQ==
X-Received: by 2002:a05:6000:2204:b0:39c:1f04:bb4a with SMTP id
 ffacd0b85a97d-39efba37ca6mr3012730f8f.10.1745002034821; 
 Fri, 18 Apr 2025 11:47:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:47:13 -0700 (PDT)
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
Subject: [PATCH v3 06/15] drm: renesas: rz-du: mipi_dsi: Add min check for
 VCLK range
Date: Fri, 18 Apr 2025 19:46:49 +0100
Message-ID: <20250418184658.456398-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The VCLK range for Renesas RZ/G2L SoC is 148.5 MHz to 5.803 MHz. Add a
minimum clock check in the mode_valid callback to ensure that the clock
value does not fall below the valid range.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
- No changes

v1->v2:
- Added Reviewed-by tag from Biju
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 4550c6d84796..ec8baecb9ba5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -584,6 +584,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > 148500)
 		return MODE_CLOCK_HIGH;
 
+	if (mode->clock < 5803)
+		return MODE_CLOCK_LOW;
+
 	return MODE_OK;
 }
 
-- 
2.49.0

