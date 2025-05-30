Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489B1AC9419
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD34010E818;
	Fri, 30 May 2025 16:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="etLYsbiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9ED10E820
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:59:16 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so16772565e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748624355; x=1749229155; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1FsGuKo8A34tONAxrY715sZ5lprEztwlbt/0ZyKX0A=;
 b=etLYsbiQH6TAGZfuEGeP17pqrNz6pDZGmoHovX/Rj+tht+A5LCWjEJKf8xZz/c0WGu
 nk8nODNJF5ZepH9iqQq2cyu6JQBBFddlyJVmBemE7xR5nyJ1+6EtVWo77jl/7tF5SMAT
 mzfCamvLDdO6p5Emrdzdpg+YJr1JcFv5clyOrXFLSF4j0qBE9b9H6H7Nk+hmzDQ0ntWu
 yE2Jggm4II3iZCK4wo1o6WAERYbJXKiM4S/osNsWenSEl0grYrLF74V7N5ryU2zVCgRr
 42mXXmlIJjPOvFo2hAqyskG+eQ/TGX4fbZUhb0qAM3sW0u9mhMDPqI/wWCpgPCjcmOuX
 XnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748624355; x=1749229155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1FsGuKo8A34tONAxrY715sZ5lprEztwlbt/0ZyKX0A=;
 b=PqGSICd4P5Lz4CXI0JU11yRoPQxChQD7Aq6At0DWLFMYNmX1e1XPTraqpmspJMJ3Eh
 YA/H+Vnu2sb/cA8b6D026DFn4ZmenY9ONqJ1LkaWNkjblwR/6TLPfJy/a7hNGBEe78PK
 NiHYaW75eI193rm/1XA3x8irHOCPv/Qyia/Jz1Z65wVbqsIpnn16achvDM7LtcwKl96A
 gd7/fC3KrRe1gPYCW4Wh3rgtzuC4jkV7F/YbJO+wnQfO8UdIBXPovW+BTLCZt9tR+/RG
 jYGAsoG1Id3xGzdUXxZBRxqIVrMizNAxQsXZZI7cUGMaP9J0OlUUcl3KPyCJ39k5IySb
 H6RQ==
X-Gm-Message-State: AOJu0Yz/RA63FYaIT3msfTCLxi71M8BtfIw0RfJ/6hnELOivP5XM6TDz
 EGzrok7U8eaPieqXGhRCqFaaqqA2h3i1LK6AsZdSNdx3rI3piXUD1Xin
X-Gm-Gg: ASbGncucUeCtWpgH1S4uZLLNbnY3kKB5+NoRj3+ONt4QDr4chtm5zxOCPODklFyAslM
 30J/GnPkA/wEqkiFkf6ayy33sZFrrconTL6fKKWhQ7yL0SciKAsVSsxqaLWu8fT8aCkDIQEyN+g
 h27OQXIkhL8uVl2oT4X26ltpshGDjwcD+LK4g0CchbhsWVIAIlvE8T1WAv3/DCCq7DHbjJMf2xR
 DOJa7G2Ds9E9Qm2Wyk+WMEzo2n6mldEGO09M/qTQJ3DyXJ8WpO7vTuwB5f8qkQBp3H5wTyjncoP
 sswF0/WGo0ZUQTkL5G0FEMtvFFdvuhAb/HBTVIt1WVe05/Z5mDB5tXL9t4XGJKolgfdCkuLRYu1
 92x5HU5XC+Q==
X-Google-Smtp-Source: AGHT+IEpj0CipGG3bDQgM3jXnJkIIdRrH6Y84XyBvr7Pg8ex1kKxt7Ij8cYeA/TKswgMUHF0SrV5sw==
X-Received: by 2002:a05:600c:4fce:b0:450:d4a6:79ad with SMTP id
 5b1f17b1804b1-450d887a68bmr27452775e9.23.1748624354623; 
 Fri, 30 May 2025 09:59:14 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 09:59:13 -0700 (PDT)
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
Subject: [PATCH v6 03/12] drm: renesas: rz-du: mipi_dsi: Add min check for
 VCLK range
Date: Fri, 30 May 2025 17:58:57 +0100
Message-ID: <20250530165906.411144-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The VCLK range for Renesas RZ/G2L SoC is 5.803 MHz to 148.5 MHz. Add a
minimum clock check in the mode_valid callback to ensure that the clock
value does not fall below the valid range.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v5->v6:
- Updated commit message
- Added reviewed tag from Laurent

v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Added reviewed tag from Biju 
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index dc6ab012cdb6..6aca10920c8e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -585,6 +585,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > 148500)
 		return MODE_CLOCK_HIGH;
 
+	if (mode->clock < 5803)
+		return MODE_CLOCK_LOW;
+
 	return MODE_OK;
 }
 
-- 
2.49.0

