Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A7EA93DAA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBC010E3C4;
	Fri, 18 Apr 2025 18:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TXifFCBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFE910E26D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:47:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so10844935e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745002033; x=1745606833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DHpUo7IXIaM+PnhEo56Qocrj9Z5PVJ1Od15oQV9Jc3I=;
 b=TXifFCBbqcv4QiES68VMsqelg12biX10cvmdIqEuT4Y2OumKSTVenXpPDySr8Pxli9
 9O2C+bzKq/35nK0MLYJEKVBCCE6GVExnFfkrGIZ0ZZ5MNDSakkejDYWhSe+Onf5Gmges
 9v6AYsxFBQyiSagat0aa4oweaFUCSKZk2U7UUwBkXwxd3JcjPKUMxdos51gKIfxaSrx/
 rdDg+Af/PxZR3e8WEX8dqr6rNcceOnmmYgiuBpUOcCyBgGTAu6Vdo6KK1jcZ2WXFhNH5
 IDvavjM/Sjt6Bm552Ch4DoMGU4nksK5QjzSyhXrDIcP2kLrAPpZCl7K8UyldDSpsOdr6
 A4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745002033; x=1745606833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DHpUo7IXIaM+PnhEo56Qocrj9Z5PVJ1Od15oQV9Jc3I=;
 b=Ql+B54ZMW+D5tL79ibQUzmu+5zCb9+oQ6JXmKtAsKm7V+FaGkKLUJVFP0jxdgHAmMw
 ctBMR3rSClK9KGuY9Ee6gn0AZwwZmJ2kj8rVROhWXaBVQANT0T2QcoCdH4Ei89Tp+5jX
 QopiRiorFymY6a0I3x5P+MCqXaGURIc1n4GUKrrOrP1RMaFBfbPC2Tq+1cNqWviRJtba
 Uvt4niuz+WEJGA72NffT2utF69LKvylCkyx1JPdtNuvd3El87OSRWazGrry7ADhafAk3
 Kt2eHbZ69bXRdWfmBEzZWRpvrVUDHwi7FO9apppeoTXrRYRE3PQ7OebGtjsQt2y4h6dX
 I6Yg==
X-Gm-Message-State: AOJu0YzDgtVyfsD5DShG6bGifwOLTHlsSFmPLCXmu2xBQA5YSxNwqeH2
 z3zISXB7lpr90kqTgEWbx+rFVYO0/pr03aRSdhV3Y2Xbilo26gix
X-Gm-Gg: ASbGncuRWIV6Td+rpHs/JLElt3pfXceOf+ZUhdqx/szq1RLTN8OMdeKjz5ar2GwzJZc
 4hkMxh3lQtdox2wOlwJxrNGzVoiNeb6I4gMthZblngC6SinxE02X7fKpSsTvhJVJL5AQxUUdJZL
 5BjYrw9V4hZi/0Eok+h09bWBQc7bRK4860KctbraU6NF963Hr/um5n0t5S79NoEGPX/DTrXSViO
 HSKiFRXbm5LMuwhGWc1D8kaeHSidO8Rnc9u2D2fBwZXGKeYvfq5qiU+2DmjNKIWMJHlornmNlTp
 4IYySK4Md/Q3n7rVjEXdId7vIm6hZVo/Gpciwxu9mFU2PryhC7iu7NmoouN2zz/jB6bPKpi+Ok4
 d
X-Google-Smtp-Source: AGHT+IHCVe4EPQnJ4ADUnL8Ah64MkBffuhR+DPqTWbDUWGGczJQroDEJedl72/TwinIX/iIxLhx54A==
X-Received: by 2002:a05:6000:228a:b0:390:eacd:7009 with SMTP id
 ffacd0b85a97d-39efbad5316mr2785862f8f.42.1745002033380; 
 Fri, 18 Apr 2025 11:47:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:47:12 -0700 (PDT)
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
Subject: [PATCH v3 05/15] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
Date: Fri, 18 Apr 2025 19:46:48 +0100
Message-ID: <20250418184658.456398-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame
Compression Processor (FCPVD), Video Signal Processor (VSPD), and
Display Unit (DU).

There is one LCDC unit available on the RZ/V2H(P) SoC which is connected
to the DSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 5e40f0c1e7b0..e1aa6a719529 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -50,9 +50,20 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+	},
+};
+
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
 
-- 
2.49.0

