Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E48A93DAF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B9C10E27F;
	Fri, 18 Apr 2025 18:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="krPwiwx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E310C10E3B4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:47:17 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso14352705e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745002036; x=1745606836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DTNEXdavel8/vpubDiQKjXEe8EbRKVx9/bnL5+H0328=;
 b=krPwiwx554xK4nTNi9UgPU+9eqwrFsh1pIU7gziFdyaKCJ/MZShAFBPIsxgc4ibAje
 QGS9Tyaq13H74mKQPtS9oeTxrVJIvSJ2nwNJKOfZHzH9L0xop6pVhhoC5ZXlzcgXp1hL
 iVqH+2XbSO78jCwEAUtoNEJXyC0pRuh4skPjm87+HUcdZXWi1M8qB7zaXcFfXTUXMh51
 8guSIEhXoYtOAj9Abt2dtqxrBZfaRJc+hmvSdGh2dRIiQvbt4LOeh4eMfUUrE6dWI/77
 J9p2gZSBtt3PaoxHeUI0Z+t7tiWcdUrMt7ViPyHDcYFSpMlxWVbUJ5RwBBWbsZmf2j/f
 aOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745002036; x=1745606836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTNEXdavel8/vpubDiQKjXEe8EbRKVx9/bnL5+H0328=;
 b=E00KE6Z7MThfna3Fv4NfuRdHNCv4pK+BDxcfyMQhyg/SY57+T5PkHNR6mCQnG72Goo
 Gxma1ZTfZEbpcQBWo40axFFEzAxvdJtJLveC1vT6N4zvCkQuF/MhuTIc5gFMGMyl011q
 CfSUjavGY56Pkku+TlfQ+oUw3Ej9dkQYTQbc6svBI1EBCEAf8rdQcAKhxaJqUCUUCJI6
 qppomPctWnw5kZWgFHkV0/fKaA9O4yhn8w/a/HYACDeaZs/VnYR1S3Qt2Zd93IVDaw7j
 kr/3up1iFtwwDAOYwUM2BYOd+SZmw5dIiwCCiZ2m9r9nWL6U+7nxEKb9gu2HVEmtnL6J
 Wfnw==
X-Gm-Message-State: AOJu0YxgrUn9YpkjUaXRZy6/CGicXfptebUV+sf6GK7nkfM8m7b19379
 V/u26RB8TbzgzxXPHN4Xr/SgUfZQiDQt6UIecNTuqnwYg0QmEuvl
X-Gm-Gg: ASbGncskpebbrjkGJAiqSRg/dhZwnYQlT0dm3p0tWoBiUw1kFGS9Z5X5z8PTVNdWcGq
 +6dw//EqViTzEQmeKYsj1qeZh9LZq7j1CP1ZLDkVhiUtkkBkzKW5pPSI+6vOBt8W9s8GBGXQojI
 PB+7SfIBiu0G8teeIbXt0YOhbwnY/zFu450ZRsrYnRGyvJYWlRqGYK4VNXkACRpuHQ3ZWYfHgG7
 8mWHL2aVfI0RVpv7r/Fwi0wm4MTxVv6Suz3z0awP8iyEIm5TWJ3TPDOP1rMB89neoiKphHBlHwp
 F3OeQPqLZbFJb+nOWbd/pAh/yesfkVHQobm6pMa2uoS67TR3PTEzMBmcMVIwwcJlNZHVoYTjPoS
 c
X-Google-Smtp-Source: AGHT+IHLNwX1tMI/YGMuExRRpoPK3Z1dH7iRYyCehXiPk1akwv6jtSV9sHiaV+vtCzbBE7ulWs579Q==
X-Received: by 2002:a05:6000:40dd:b0:39c:27cc:7ba3 with SMTP id
 ffacd0b85a97d-39efba6d50bmr3192738f8f.33.1745002036337; 
 Fri, 18 Apr 2025 11:47:16 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:47:15 -0700 (PDT)
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
Subject: [PATCH v3 07/15] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ
 calculation
Date: Fri, 18 Apr 2025 19:46:50 +0100
Message-ID: <20250418184658.456398-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Simplify the high-speed clock frequency (HSFREQ) calculation by removing
the redundant multiplication and division by 8. The updated equation:

    hsfreq = (mode->clock * bpp) / (dsi->lanes);

produces the same result while improving readability and clarity.

Additionally, update the comment to clarify the relationship between HS
clock bit frequency, HS byte clock frequency, and HSFREQ.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
- No changes

v1->v2:
- Added Reviewed-by tag from Biju
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index ec8baecb9ba5..c5f698cd74f1 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -277,10 +277,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 *       hsclk: DSI HS Byte clock frequency (Hz)
 	 *       lanes: number of data lanes
 	 *
-	 * hsclk(bit) = hsclk(byte) * 8
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
+	hsfreq = (mode->clock * bpp) / dsi->lanes;
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
 	if (ret < 0)
-- 
2.49.0

