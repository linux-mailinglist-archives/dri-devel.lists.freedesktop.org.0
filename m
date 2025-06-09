Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B080DAD2A0C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 00:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B35110E44A;
	Mon,  9 Jun 2025 22:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EyPtxson";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E55F10E206
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 22:56:56 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3a50fc819f2so3916833f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749509815; x=1750114615; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mJ04kIY50S4a/oCwlKLWoQlfyGZTGJpeZDyun/CaLg=;
 b=EyPtxsontrj/81qOKzdKxgV6LxhHJKiLtEMAEesz5p65kaBOLTbKQU6q5rqeFbrVX3
 /PC6oeiW22O6zbCH/jOrwOlRBIGTzWHJxk8zzyLUxO8ToJN+kHSyLiAJTLevU/B+LYl4
 ZQNzy08mpVUTErDDo3P2SmzZ01JGyrnoyV61bUigrK1KmOraACpqEjt/cowATiG2OyQc
 T/kCrwYPUmINoYapm9GjaKAWtkSt8ssRfF0w0xFRlL52rVbPOy0Q1DpRZ+4dq9wY9AqX
 U1jp+LgvQCszqxA4WyxiwDrthdf4NECxdNkO+QGn1mDkXKs8Wq/TQ33tRXtqCTgYVypU
 Bu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749509815; x=1750114615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mJ04kIY50S4a/oCwlKLWoQlfyGZTGJpeZDyun/CaLg=;
 b=Nf3AGqTbYKl7UabPKOXNbfee15E2029PXZrmjFSzItcegINJjGeUgDrP0grHE1+0z/
 2q5/n0OtQLiZpMNAc9Bk0M57SY38kFzcO/hAbsXcaRFL4VC8+l872XRq9J56VEmw5HRs
 adD1YNVDrHoprs1iNZJ7NioRLvVsiTSVwkRPxj1fPSVltWBAFiWeMh/HVglrSYhDiLdK
 WJ2lrLC17QieYXvPvuahKFBEEbPLLH4c5eW+QLkef1Wm/JyCRhxqEcuUzHnebdkM/Lve
 Vqy6nJAeGCajWM5sPjFXCeVimw98QDRzhoWyHpXgcT8OzBzCGxUi97MsDjy+QPHPBc2Q
 oPBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXIYi91Lmd9akZ5bsCXJJWiIWb5Gh788Y3ifMc2vvR72WY29AHoQyKm71fNNs2UdzUoTDlFa9V5OY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhRHCA62qh4DWRIhtm01vBTI+dCodS1Go8aIXsLBb7AhZQXz0I
 t5XuPV767wX0owxZPVRoGC0ftLsAZyiqPYmxWrK9VodXECxREWZAxnNr
X-Gm-Gg: ASbGncvNTOztN5RV9KPirdpOcoZioM2WjJuUkGcB0nCFxdO1Y0tCeTYRrP4ZQJEGyxi
 aHXNqCClaw7TAOjhJuH3DxwtUFjNIND5V4i45cAZCviWF//SADL5XAqVQtCpBqRDfjWU4eVQKJo
 049sWw5gIP3ZD7GSeKnrllOv0KyH1a9G9ydnybjUP1brVktgB65gkykGeJwijejEoejWF7op211
 taMvqNBhdwn48d/p1o1TN/W33hlXFU5WKY4hBmEE0iS/f+LHtZfw4zxUL+JG0E+aWd0cQwNl1X6
 rursxDm8NbrsmYko9X0aA1Pn8sN5gtqdZIzlkc/ZrjJaVCx6Nod55qHwDRR0YWe1coYKpw9SY8u
 XG/4ZjwfzIO85wSE2vv8=
X-Google-Smtp-Source: AGHT+IGWs2mxydO6AyZh32szGvoE+Z5bEw/CSpjmczATv545WPvvStrl0U5S/ZYeJpRamOQYcH101w==
X-Received: by 2002:a05:6000:188d:b0:3a5:2fae:1348 with SMTP id
 ffacd0b85a97d-3a5522ddb60mr288540f8f.51.1749509814907; 
 Mon, 09 Jun 2025 15:56:54 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 15:56:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 8/9] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init()
 callback for RZ/V2H(P)
Date: Mon,  9 Jun 2025 23:56:29 +0100
Message-ID: <20250609225630.502888-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6->v7:
- No changes

v5->v6:
- Renamed dphy_late_init to dphy_startup_late_init
- Added Reviewed-by tag from Laurent

v4->v5:
- Added Reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index afb427e678bd..12cb9f0d32fa 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -40,6 +40,7 @@ struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
+	void (*dphy_startup_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -331,6 +332,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	if (dsi->info->dphy_startup_late_init)
+		dsi->info->dphy_startup_late_init(dsi);
+
 	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
-- 
2.49.0

