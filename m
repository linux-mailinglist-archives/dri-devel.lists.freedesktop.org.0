Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAA7A93DBE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CAB10E2F3;
	Fri, 18 Apr 2025 18:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ElSNIlDQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AED10E26D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:47:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so17293815e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745002042; x=1745606842; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0NMewUxZovXfHeQUZMOSswfntk9w8TolModhDZLmWs=;
 b=ElSNIlDQaVwHxH8c8ds/M03DbQhr+bRjA6gQQx/bM8NTf0o7CHkOgkDE4c3zMFDlT8
 N5DGxO9Lt1+wyTSwqQltijKTOAPePNohWOL6k7BKQPLhsP0wnsCfLPjT2+A+x7CgIsd4
 6CO3zP1uSkM0i3f7fl/l4gO9xm16pRZyvx6+iE73DDBhecM68KJcb1JgLYwkAGaHi8j5
 4IZdB9GbkXOiJAtBAHLfpEBmUY8+PngsDGKmmqMYYleYE8GmRALPpJIr43iuBExeSs4l
 6kmGtB3MAZylLVtVFohrlIv+uaXzlIVjaEG8O1i/JiZpxr4OTmFYS7RhmnF5hPSQVp/O
 RaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745002042; x=1745606842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0NMewUxZovXfHeQUZMOSswfntk9w8TolModhDZLmWs=;
 b=bp/KI8VExzYyj5/pdVmj7hOFdUb5ebVQTdYqLiVqhYVOdsjRQqTddSoxVqWVfzYtqA
 RwKQApx3lrGqmt4os6tvKqVRu5Ung15Q/4J6Wv1y2SEKPaXt2gpxlAmkmoPMwHvmEpyd
 fZyB7om1bmZzapsz4ylLx+hnTXS9tYRU9jgrsYMWT9i9MwTOrcGGUnHzUKHn2rboRhDX
 eApCYS8QAQxyxo/oWYopyfpLfeS3eFonwDW+PeAoq+xwl5rI2r+CdYrVMyBnEKyxNvjd
 pOMlnThErsQuKwfuic1wb0LOBvcCJgQbXsvI/4UpdJuJZZhlhnGutLriwjsIF4vTtxqK
 dUQQ==
X-Gm-Message-State: AOJu0Yy8MQvF5UUkqOajtY5NHj8YB9QCKufjaCpJj8oWpu5gAvOYVuee
 YJcNsN2wHfw9jnLQMq5TpgrAuDTKzYdoftU3J0TmqEvh/CdhK2/x
X-Gm-Gg: ASbGncsctSA7VK6WL6dRTLg6l+21USN5jdowid7UD6KIK1AOxLvlF7gSjy9BicRmUIo
 F4bhtltK4I4GSzRu16ynjARhJDsdlIUjMtTL97sjQeFnTSRkePJTNKYbCsoKXRl3cQ7q4+5aivE
 YTVwoHfVGCUM+AQfzHg4X42JU90Btpe2yeE51lg1sBkrKhh5YfwwhqiylwQuJNatNl4rZABtapm
 ZtUmYP7TfBElAhKcZnzWq+8Oxidcy+C2JuzwXYebDSLmQu8ykY/4Nn0tlFkhOtRY6INezZRUz8y
 nhxH7PkTOED7wyfiBRdLO1PKNveo4CpY7hPrcvJTZGY430akCc+NH8T548HaDyhHjg==
X-Google-Smtp-Source: AGHT+IHX9ZtNmNTyHB23rvzYHFaUftoJqAQ5DLhySdmI3cD51IST32BGJ0akFwZxFx5sCUh5HU5+hw==
X-Received: by 2002:a5d:47c9:0:b0:391:6fd:bb65 with SMTP id
 ffacd0b85a97d-39efba38482mr2681144f8f.9.1745002042363; 
 Fri, 18 Apr 2025 11:47:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:47:21 -0700 (PDT)
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
Subject: [PATCH v3 11/15] drm: renesas: rz-du: mipi_dsi: Add feature flag for
 16BPP support
Date: Fri, 18 Apr 2025 19:46:54 +0100
Message-ID: <20250418184658.456398-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3:
- No changes

v1->v2:
- Renamed RZ_MIPI_DSI_FEATURE_16BPP
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 0204af85fc64..36b8ef95f20b 100644
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

