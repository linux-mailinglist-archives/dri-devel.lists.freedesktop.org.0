Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EBDA93DB5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528D810E26F;
	Fri, 18 Apr 2025 18:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CnIkflRt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F0010E26D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:47:27 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so24703365e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745002046; x=1745606846; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+lsVVshjn637AMwgDjgZHkcdVY+ABO4wk8AkXQ6EbwA=;
 b=CnIkflRtHo5fm7G6168Ja4qQsFm7IPB6/HGIlLQGY0LcIe7Y/W2Tmq+EiQBuOJeCAP
 mZ4ShhRqpyegdBYyXoi1pAzIjbh+j/mKrU85+Q1i1Srb3kGrtJneEx+hxBkTT0Pe548z
 MJIM0XrfVTso7TrAMLY76xEASDmPn574q2MAXOqmSYqGbd3h2pP4KwCC3BU6+zuG1fkE
 UtyWRS06i+o/KzFCE0cIzf7/nYSavh08eOIoE61f2LSaPQJKxZO+iy4O1rO0Rr+AtQHR
 i8nYraKJQdUoywJfNaz1Z5RId3PFHLYX9Qj1b5htyARaRedLycYEqF8vHYrXAUtqIgWW
 50Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745002046; x=1745606846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lsVVshjn637AMwgDjgZHkcdVY+ABO4wk8AkXQ6EbwA=;
 b=IpQQMAJpPbrBnqD1zqg0y6/0SiK95ucGBTJzq3ixH1yTwxFuh/H7Y/7XDN79pT0e15
 pDc0fbeqPNLE7c6tUCYVP9HL+qqLXpcRMZsdUD1V/+jep1yQKYQ7vDNbFE0IIqM1LdtT
 /V8ffm/KQzXPvytoMFku+/plMbKp7lAiCb/IBbi3qmorr6ZFZ4VKu/iXfxF6Q+1kmHuf
 LU+0EDXZNEzWx/YsgESVmX+DunHoO2EsSMHa6t1UXkwTIxE2ftlxzult2OZrrXaTozlk
 DYE+HfqOjQF6ns0kR8si8ts36I+COmnF9TlGNoOBlRa1Vrg/vA2IfN/m89N7+bphnLp/
 7u1g==
X-Gm-Message-State: AOJu0Yw6kbzJbJvev8XLfNdU7TQMVvJY94c8NoLszzVhaJNIzWT4vT3n
 UW/T3k4TSDG3IR9V3iDlGKqpWIV9D5MeJfAidAMBpW5H5EIZFn3h
X-Gm-Gg: ASbGncv1dguiosPQpCLa844mQy69oKGHWkj/1oQDrpxfE1TdhuuvLGDUzm0C2kADsZy
 YuZQsJ78ylFwlWQMc0D+HEfU3CFOe8y0TIhLNSCx+g9WSmJnf/pqJCNZwggBEKWS2aEnx/xRacm
 T7hyM8efkCSnI98+/pEGjeXi9R5ZZjvQYU5Zi0i/XSHYzd+gVvx/vXbR18gcPjcreYnK/d15fp+
 mw0Kq9bgFzl9rj7WQzh4miXOpAzWvqIKaSAPBNvb1YnSwZdP3mFoddqD+tIoT+Kk043JjYOKPpD
 6LznvI2DplTsA7Hbk0nSayUmbzHHjtvmZsOb5DlT/hIvuwKzyGxp51tZvzvJE46qYotsil028LJ
 x
X-Google-Smtp-Source: AGHT+IGq3eSVxmXrUJUQFABqPX5WhZyelF4HqNf/myefyRzdq+X4avwziEFapnYPHasNOI9EmifFxA==
X-Received: by 2002:a05:600c:3b8c:b0:43a:b0ac:b10c with SMTP id
 5b1f17b1804b1-4406abfabc9mr30818445e9.26.1745002046493; 
 Fri, 18 Apr 2025 11:47:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:47:25 -0700 (PDT)
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
Subject: [PATCH v3 14/15] drm: renesas: rz-du: mipi_dsi: Add support for LPCLK
 handling
Date: Fri, 18 Apr 2025 19:46:57 +0100
Message-ID: <20250418184658.456398-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce the `RZ_MIPI_DSI_FEATURE_LPCLK` feature flag in
`rzg2l_mipi_dsi_hw_info` to indicate the need for LPCLK configuration.

On the RZ/V2H(P) SoC, the LPCLK clock rate influences the required
DPHY register configuration, whereas on the RZ/G2L SoC, this clock
is not present. To accommodate this difference, add an `lpclk`
clock handle in `rzg2l_mipi_dsi` and update the probe function to
conditionally acquire LPCLK if the SoC supports it.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No changes

v1->v2:
- Added LPCLK as feature flag
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 67520bb21dad..133a8f306d47 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -30,6 +30,7 @@
 
 #define RZ_MIPI_DSI_FEATURE_DPHY_RST	BIT(0)
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
+#define RZ_MIPI_DSI_FEATURE_LPCLK	BIT(2)
 
 struct rzg2l_mipi_dsi;
 
@@ -63,6 +64,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -788,6 +790,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_LPCLK) {
+		dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
+		if (IS_ERR(dsi->lpclk))
+			return PTR_ERR(dsi->lpclk);
+	}
+
 	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_DPHY_RST) {
 		dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
 		if (IS_ERR(dsi->rstc))
-- 
2.49.0

