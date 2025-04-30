Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7715AA55AF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 22:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6DA10E32F;
	Wed, 30 Apr 2025 20:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KQB/2MY6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651A310E32F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 20:41:25 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so164472f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746045684; x=1746650484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/J6f44qXU4d+QYXzioKtQndqvRly6E758jI0u/hrS88=;
 b=KQB/2MY6PIpgKIFWMXYOc1I+NlIQ3vo7xnCfaxElfjcmhPpvMmcnXht0GY234ShII7
 60hlRoVYog4SUOS7hMeOFIGsIV2/hmkQ13/f1zPZcvc8tjAUB5UiO2AkM4WoItdwbfji
 wRX7UKgH/nkqME5SilD1nxWlCGhUSxKXoRw5Xn/6tjC2F0p0tpykzMarddf1gvJvWwcw
 +KRBGH9DXBnycCFsVWicZ1ZZoA+56hU+0gpd8ARhHL9tnxDvp2dBJY/vbeFjVgh2ym58
 qyIC6ohl3NRscDNB3S0oqQoeSJceMCTfQr5HxJ1v0fbVFe9d86ghA6IjzxTkddEMyN6b
 lOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746045684; x=1746650484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/J6f44qXU4d+QYXzioKtQndqvRly6E758jI0u/hrS88=;
 b=i6lmGvMaB40+MlClX+Nbmat/n9rIR04B/6IGkML+U/twh2jZWC1tDWpJmuU9CcT4Ql
 p28+mL7fYNBGWvKQlCppRJJ/9Ks4TfPBQu3inU3J0KvS1Nq9zpdvS+epmFJ+KGT2LsVL
 LaeJOs+MVLhha2wlRQ/3STldPe8K6/bVD8F+IflRhhdE/KGJA9ZgL8DSI1Wr1y6IBxbd
 DecH241MJuugjdhR9TrqUY1i9Mzy4cydhmjd+g37dM3aNfuYCk/8GLX+OYLO9dNoWKkT
 b6YaWolO+0wRKmHCU7UWLDtId5fwKPI+FcNDqyRwdBmt1EIJJR0oZezpv7rSj7JRgCbu
 jGjw==
X-Gm-Message-State: AOJu0Yx1iDBGAIyFE1nzrbSY0EpM+UNOcd00lFA9hg8OP2WyGilDjrfx
 P5L8VER5qyiiuPa39YTPwVG14Le1eUwyVws/KnKokFsFlA6SvQdL
X-Gm-Gg: ASbGncsx1p4wRr7Ts8v4YRWV9Etnpcn6vFLXuSyotkWX1nICfaqidmywAOour2HeEVP
 MG2yhoOT8UWyP+HDCxIdBITtL7auA5B1yxa81rHKbDa3/Znw3fSCl6jsaxsvaWdEbQuxrNfqECn
 wxYUqOoA9BL3Mj5h0/XESP7EksI5bx1sjhBqrbsxYUHaS73LnNRv3mS3HlxIPo/zHkoZXpjahCG
 2H04oG59v40TiIJBZzOc9wRp591hESkai3SI+PEMuCZ/Lgmf0lZ6PthwJcZhvH+V2L+hSVq+HIZ
 HUA2H35WNvMrN7JVoiflD3q5Xa7vysC1XwUdCn19ZmruxfJslM3uiHhx8PU/gH9Ua9wk9LJe7f+
 Bulst7Ft6jw==
X-Google-Smtp-Source: AGHT+IGihVH6SKs3W13DbVj6p5AfcNt/R8LnX1oxZatYwR5jlHBRYRJRXn55KS6WCOqZEYzxUTvVqQ==
X-Received: by 2002:a05:6000:2dc3:b0:39e:e588:6721 with SMTP id
 ffacd0b85a97d-3a08ff34cd8mr3628651f8f.3.1746045683894; 
 Wed, 30 Apr 2025 13:41:23 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 13:41:23 -0700 (PDT)
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
Subject: [PATCH v4 06/15] drm: renesas: rz-du: mipi_dsi: Add min check for
 VCLK range
Date: Wed, 30 Apr 2025 21:41:03 +0100
Message-ID: <20250430204112.342123-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The VCLK range for Renesas RZ/G2L SoC is 148.5 MHz to 5.803 MHz. Add a
minimum clock check in the mode_valid callback to ensure that the clock
value does not fall below the valid range.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- No changes
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

