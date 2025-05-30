Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5969FAC9418
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B231B10E1A6;
	Fri, 30 May 2025 16:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ILX+rnCh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084BD10E863
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:59:24 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so15268265e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748624362; x=1749229162; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOUnDZksgUPq4aY4rBL8aX+sFVS5jcV32pBW6xfenO8=;
 b=ILX+rnChcyIpG0WQVs0QVWEn8M+9z+PRP5frOyH6X0bOO19WUAgBY+ovIbuFkpTOek
 rsQ+Rt+5McoGtKo3D2wx/nzYh1A2AJEEcfyJoQtMnnGWsskoFIPs5BqBCJ1oV0gzAEYn
 1OZbiNAfbG1v42lKeIpj7x64M4gdiUk6/mIiMX9mXBNkwr9k37A7zAf5nCyatS/Jwpnt
 7IsCEl7sDfmdZyNCfrjXexVM5l6JSeElCFJOkhfUckA4WeqfY8sFYG6sNMXXBedXAs5y
 sgX3zkP2ReprSeLdUn9bm/FGtav7agsQ6hItXmSHyvzhoqJ7XAn2quuhLKv+e2tDsTsa
 ghMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748624362; x=1749229162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UOUnDZksgUPq4aY4rBL8aX+sFVS5jcV32pBW6xfenO8=;
 b=peC7GXRhbyGFbKIZw8P+m38TezVnOqmmwDANiHy5LG+sdlawRxSUZjlS1ejWdpvxBj
 SuhBchFo04VoWAY5rGSv4jPuItwjaUy+EtYlOFuH+dSmHFQuLiIKPeExVy6Ejex14UwJ
 MQBfPOd8yIfs1on9ia7I0RSX8qZrcTEejTwJGgstMW08kpCeURUtJ6sBXEjT039GY2Hb
 jsAal6aym3cDnBgWoNjHoLjxOkzeCB9SK3xLf1HekhOsk9AabaascjJYP98/SgiwNYeP
 DGIZLr4GmJurUyknQSGmDXWRojerrfeo4RkiKEWA/DW5xDw18ycV5KSc6FAlbq7BZl/E
 u0zQ==
X-Gm-Message-State: AOJu0YxCimP/FbrcmUQf3rUbUOLaNHiXLMVpFswmo6EUSwE/il8Zu9h2
 whm98/0EyFGMFc6psghAoNEsveagQsM/0tm6KbFewfApBgdNXab0lcuy
X-Gm-Gg: ASbGnctljKOBrYGV7Fo0yfMRnsSpy55a4tmlZXp4S+WLOSQKwqO1J6E6XrCVLQV2mxA
 kOTPm2C8Ax/koOVXiggmRzyGxjLZe6jA83tG7lGOCZW1YR919JzrP8a0KS+EKT3JdZrbMkIdoeP
 c+O7TZmvpqmmBWTBO88lS/A4wEQRKcqxpJsXWI37Qig4Scyqg67URoNf3zL7wPb2gBPJa4aYMD4
 huifyYet4sRwWEeuG2JeV0FTj+Is+jCN9P1qe7RWYkKh39tjn83uW3gQlyaH9aPsAewqh2sHwts
 NtEcq/J3jLyomkt4tE94E1kf0w/Gsv1pqnRLRTSxyQ/dr1/FOrbT0+kVlo640Jzn4ySNdL3fsgp
 ySY5Z8cHCVg==
X-Google-Smtp-Source: AGHT+IFzgn0QIVlghz5vyCIu/2/JW6FdsqCQ2bsc/449AIyFpCyM0aAnMLMWoMv9bJ4cXTfP+tlr6A==
X-Received: by 2002:a05:600c:524a:b0:450:cf01:7310 with SMTP id
 5b1f17b1804b1-450d6515d10mr42199455e9.12.1748624362159; 
 Fri, 30 May 2025 09:59:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 09:59:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 09/12] drm: renesas: rz-du: mipi_dsi: Add feature flag for
 16BPP support
Date: Fri, 30 May 2025 17:59:03 +0100
Message-ID: <20250530165906.411144-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v5->v6:
- Added Reviewed-by tag from Laurent

v4->v5:
- Updated RZ_MIPI_DSI_FEATURE_16BPP macro to use BIT(0)
- Added Reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Renamed RZ_MIPI_DSI_FEATURE_16BPP
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index fd5d4551f39d..506b5503a725 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -28,6 +28,8 @@
 
 #include "rzg2l_mipi_dsi_regs.h"
 
+#define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
@@ -37,6 +39,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 link_reg_offset;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	u8 features;
 };
 
 struct rzg2l_mipi_dsi {
@@ -644,8 +647,16 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
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

