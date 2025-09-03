Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF39BB4267B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 18:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE0C10E90B;
	Wed,  3 Sep 2025 16:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BnQGU/DZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A342E10E8EF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 16:17:29 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3df3be0e098so68613f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756916248; x=1757521048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/okqN9bKCpoU9t2/g49V1bui3QD4VMJiIMsCcD14P8=;
 b=BnQGU/DZ/1+Q7C/Ja7XqbuUhA9O8oUqr2x365hMWc/qjgoudcOTMFgMs50zGUooI8R
 fWfstJRwJobto+V6O6a62IBDJaiqEZeOukKnkUZYT+RVEZt1iIyrXSxlW0yVDanA7jjw
 De0vF4KL34emH6jiQq80EX9FTvrR/PHh1Fwv4LEJgkrQXG3uZ5HKNtK1w6JaTUjgYafG
 D9xqv/R0BzRR6IO0mBHR95QiDQkf10+kqOca6J9s7tDYLGTgPWOb24VR+ZoR51OJw4ad
 H418ZFAgRv3RaRA5hsoL8rY/s8lYfCD/qIddYHWK3LP9Q3pn6BfOHDNgaxLCCqhNP/Dj
 QV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756916248; x=1757521048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g/okqN9bKCpoU9t2/g49V1bui3QD4VMJiIMsCcD14P8=;
 b=VNIdO0FrImLGhg/rdXVnpevpGiABECgWeIUwy9GW5qAFHLip6x0veRTpEdwXJCr70x
 0nYyepIFrf8QbvSOieofnY93MFHDG7yDevHHzxOe8wvkL4Jd23T3Th70AYW878z0c0Z+
 iNWiq2a9GYXRQy7gA3RqmDhKvgpYlk+p2JIJxhDGSHxuTEwqq8+zMDhXda0XJV0Lz6nN
 6Vj8mvZB4UcERGHWaAl83NgTNUCW8lYDpAaZZqEoz3PBk/vq0RdyxS21NhW+tEuolvdY
 RdVMIXLwu0N2Dlcx9vLjIdhvAmXQNaO3YBTZY264hQXnsZxPR2ieEz0F8jTHJKhmoRbO
 nnMw==
X-Gm-Message-State: AOJu0YypCnxzDAvVLC/MQ5tiwGvuNb5E2NElrofSRjbk/jU1cW4g9mzi
 XK5H8kE0Vhhi8sy48UcsFq3/kV1f0a2aFzkwqlHutdZx+2JR6X6fe10K
X-Gm-Gg: ASbGncuUcEyZ46GfnwwpNPEcfINIGBj5erJURQi389Y+bCrwyywWkeds2xIrHptXSPY
 aelIaQvEQkrbcwWpSkhE9rkNGOujvhPlcLxLzYN3CsvxJZufsHNSerP+JsUIdySJvzViQJB/u50
 +fIi61ZzBdXBYgCeQ05drWqKwV+3yFAeNledkbHieQnBOu0sojDgFexCjPlaqKbhP4KYpjv+szW
 dJEYCouTgFyTZRuiV5JqnHyW71d00gks78A9YTItgvZMnrz9oj04Rny/1NZcqeWANVy7PyU9luw
 M2+n7QnD6rnfiBz/1KCjmDMYZ01DH695q5MtDI4Qza5SO+SwWD6udh+8SrIw6hAhRU+/EcVBBfX
 D6+udWhaeIPrp6mi3D+pIATrWh1D7W1hDLB+3cODrl3OOklOvhnvZ1JRA
X-Google-Smtp-Source: AGHT+IG5fCsD9RpqHsN6fdU1xDs5FlEGumpRU6I9wG0qe9GQCj5TyawUM1xwIAow1pLMVJ+8FN259w==
X-Received: by 2002:a05:6000:2486:b0:3de:b99d:d43 with SMTP id
 ffacd0b85a97d-3deb99d10camr2123919f8f.19.1756916248033; 
 Wed, 03 Sep 2025 09:17:28 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:9019:aa0f:b6e4:7952])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3db72983560sm5645734f8f.1.2025.09.03.09.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 09:17:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 1/6] clk: renesas: rzv2h-cpg: Add instance field to struct
 pll
Date: Wed,  3 Sep 2025 17:17:13 +0100
Message-ID: <20250903161718.180488-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add a two-bit "instance" member to struct pll and extend the PLL_PACK()
macro to accept an instance parameter.  Initialize all existing PLL
definitions with instance 0 to preserve legacy behavior. This change
enables support for SoCs with multiple PLL instances (for example,
RZ/G3E we have two PLL DSIs).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v7->v8:
- Added reviewed-by tags from Geert and Biju

v6->v7:
- New patch
---
 drivers/clk/renesas/rzv2h-cpg.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 840eed25aeda..e2053049c299 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -16,20 +16,23 @@
  *
  * @offset: STBY register offset
  * @has_clkn: Flag to indicate if CLK1/2 are accessible or not
+ * @instance: PLL instance number
  */
 struct pll {
 	unsigned int offset:9;
 	unsigned int has_clkn:1;
+	unsigned int instance:2;
 };
 
-#define PLL_PACK(_offset, _has_clkn) \
+#define PLL_PACK(_offset, _has_clkn, _instance) \
 	((struct pll){ \
 		.offset = _offset, \
-		.has_clkn = _has_clkn \
+		.has_clkn = _has_clkn, \
+		.instance = _instance \
 	})
 
-#define PLLCA55		PLL_PACK(0x60, 1)
-#define PLLGPU		PLL_PACK(0x120, 1)
+#define PLLCA55		PLL_PACK(0x60, 1, 0)
+#define PLLGPU		PLL_PACK(0x120, 1, 0)
 
 /**
  * struct ddiv - Structure for dynamic switching divider
-- 
2.51.0

