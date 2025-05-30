Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FFFAC9422
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A27310E839;
	Fri, 30 May 2025 16:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K37cL/s3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB6210E853
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:59:24 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45024721cbdso17397735e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748624363; x=1749229163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Bsc1oUMW4VytILKq6eucAsxCxsFRVs9NwyCg9qybzg=;
 b=K37cL/s3LwOYY7Gf414Dw/0SYY7HTzIrH2YabEfgTQFWyHLCTujnjG0D9In/muQ3ll
 zu6fF9n70khzHGBpgrqFC5Yz00MuKYWwB9c49YkHwxe00iJqsAxouNXA0jJYRba2g/9o
 9F+40njm4Mba6Vo0s363V4eVTKMcKPlH3QsoADvWpX8dm5yZV7QTuKdYQpRFV3dlqBgz
 YEQaStxR1iKqk6dY5CbXSGPmy5Av/mnzU6dT9v29O7tiMXc4KEyLP/KjvAPMd9NVXC0Z
 3YLdh5RcOBmkV2nKB082U8/iMT35j+1OzAbsFilp+rFI4KJOIE4ueh69pznrhsshMnzZ
 47gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748624363; x=1749229163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Bsc1oUMW4VytILKq6eucAsxCxsFRVs9NwyCg9qybzg=;
 b=iwUp2O6Bz0piAeTchxPl4HYQAPyIswEP9UFH5I32JZwonPSCqlbHnhDa0WGIx3d5LS
 ryGldpUL6fMliuNo+WdwFdqAGHW9ABW4D6X6t5JRAEbtf3aw3BUCeuzMZcjCFX7eI7Pf
 O1RvhwLj+uVp3w/JCbKYGA6HtA/3XxkzBUCLVka+Gf6fgaojz1zhsVJHCISi5nwmiZvQ
 RzBpSFpgSTbYNaCY8gyOtR8V+X1xKOI3qenpIhteJNQYoRWc74E3XxH9gr6d1ZWuNK5d
 o8aI+n9kDQysKZCxiwLQgg8oUvJXMiAH4O/+R7q7k+ronVE4+TlBxpERl7C2mf5NihRZ
 ohqQ==
X-Gm-Message-State: AOJu0Yy7INtG+9UqYjQhw8SUSUGCLhlp5cTDzTufwZfkLCKuRz8ek099
 TSAi4dP3SX3k0bD2Yq9B0bHS7bfMAQ1jj59NmsmAZ0SFYdQhIWF3WOHd
X-Gm-Gg: ASbGncus9CxElka1IQtddVDyHiOqoNruABlHP+vqyzchKetVO7yBMYDsGn5aTeSqig8
 7Tn68bFlRHabBzP2rITB7yoJ8du8fE28ee2KA7155Wjev7OWjm8XIVOreJZSlSOQXsP+SA3niL8
 mgeLWbTUQDOXfBKXP4bEMligjqHol4UUBXMSMliXUSumLEmkVsQ3JWzwd9FsbRdHlc4Al5uwEgt
 fPYycBBRQNu3niIRdNr3T7SlIHGtecCUpD7+bH/6s+JvYGX7eDNk42fdfXKMunsT56GR0irliqK
 sQuiZB35uCWhQudmtMlMfz8X1pFUCOh6gVJvt/C5zF3JWVMBqTi3VGOGy7xwk//mT44uyqXaFsd
 wdeThQWO+XvcTZcCXz2sJ
X-Google-Smtp-Source: AGHT+IHX1pqPaNodbBcNM0xGNtsM6i9wiutFQO6+/zneQQbRJcqE/FktY/zMJOvdCcgJNOK4kMrYDQ==
X-Received: by 2002:a05:600c:620f:b0:442:e9eb:cba2 with SMTP id
 5b1f17b1804b1-450d6452cadmr53521755e9.0.1748624363359; 
 Fri, 30 May 2025 09:59:23 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 09:59:22 -0700 (PDT)
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
Subject: [PATCH v6 10/12] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init()
 callback for RZ/V2H(P)
Date: Fri, 30 May 2025 17:59:04 +0100
Message-ID: <20250530165906.411144-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 506b5503a725..ebbc6ac45484 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -34,6 +34,7 @@ struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
+	void (*dphy_startup_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -320,6 +321,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
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

