Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F47AA55B9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 22:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A04810E354;
	Wed, 30 Apr 2025 20:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fsMIlbzR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A168710E758
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 20:41:33 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-39c1efbefc6so169145f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746045692; x=1746650492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zs5IS+IIZjSL2dWZDqgTPqknuqZPmDccKzSPgZKtB/A=;
 b=fsMIlbzRTOYVVxWSQ/+dPRxSGuVffp4iOn0bvT4/YuE4j89+5CA6PdGl0J5LziuAJI
 SBHLS+U5jM4PY9fQrrzt2u0RlIXcPajfI57gpyhNWNZOJqn2vospa5lh8sYT5HAwuVJz
 YVucKpuPKP3mzZL0E+ynwhQwfDdYja+iS8hfIfOZX9UNBtu7EiK/gdtPfOBZid6T4phE
 cP5zvh5Zq4/dcfyuSMCqPAfvbJjLuzW+Jod8DJW5kEgtpusZiSBziN+l9CORuov2idr6
 BFC1OGqDaCpy8dgldLl4WC1pOrTSHNI+lcWigaIW8CYYTJD0DAbqsf8pgsOpu64J3fct
 shlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746045692; x=1746650492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zs5IS+IIZjSL2dWZDqgTPqknuqZPmDccKzSPgZKtB/A=;
 b=v/yuezjvPdcFNUL24sEKcO7mEgyytQ1puiIeAp47qj1YgZ7IQmkuxRKAY4yNE87FRv
 zsixBB7buIFpimFZsN9XKyYwxK9cx1FGAPPigbu0I1clZkkVRsj0h9YDH/u4KBV40DZa
 pPt7zb1bmLM2KA0c8d8Dp7bUGSeS10SyoGkxApU7ckGcYXKWWdMRLFH8SfJb5WC2Lo/J
 34BHXeP+B6q7uNPTJH4L1mZlbydnOc7vsVvuj2LaNSxt7QYYp9bmSWYTFUBJGEDCeEmx
 TdoDIDH9RYBZNnTjB/Yr8bnk/rjt/5X11S/DqJEMd3AzxPjMC2uj30BeQZQ/g/oVZ2z1
 zQUw==
X-Gm-Message-State: AOJu0YyIeMnFhh0bt06vc3yl4Gb2MKYt6HddciavPV6yDBpGTOK8E7at
 w3F6niIkOFGdBDn9UdwCXtWI74jALvTHAZmoCSXDhO/SAmZeDFa6
X-Gm-Gg: ASbGncuAZkVWA7+jkzhSDPyKTxYc2duyNF5dBZ7xgu7lVFz+jiEbF7f7XPJv5ovTBJ/
 iCTt4KCBJEmN8hAwx6Iae/+KQnZSP5pEZhodhhq13UZol9+S0zdpKsSdPNjJTiuZS0oZxKuImik
 t2Xebiw90928g5okDBvt87n1zlJBJvhQWw9AqvMdRqQHOr82G4TSfeWy2jSl5B4ZOoemPa+vuNE
 d6ZMyWEnl67wFpivQWK6d/RTvxm/ccR00DmWy11jreVu3+wWdJQngPxBjlpm7UFnBGIJnGPWc24
 v9vEw0aj+EQ5sAA4DQYh38g3f/U4yGRsnQ+JMBPW9eSCbdicWKP8vlQGDQ2/eNrrwj8Fa7j6Bn4
 =
X-Google-Smtp-Source: AGHT+IF6WostFapxQBw6ajNHWZp/i5PjEELly2sDADJ+hQXmv+3xRiGu0yOTdYUI6fnh+IIxhIZCmQ==
X-Received: by 2002:a05:6000:2287:b0:39c:1f10:ba54 with SMTP id
 ffacd0b85a97d-3a09303bbb3mr428578f8f.35.1746045692273; 
 Wed, 30 Apr 2025 13:41:32 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 13:41:31 -0700 (PDT)
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
Subject: [PATCH v4 12/15] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init()
 callback for RZ/V2H(P)
Date: Wed, 30 Apr 2025 21:41:09 +0100
Message-ID: <20250430204112.342123-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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
index 8c7384b95411..66eef39af35e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -35,6 +35,7 @@ struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
+	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -318,6 +319,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	if (dsi->info->dphy_late_init)
+		dsi->info->dphy_late_init(dsi);
+
 	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
-- 
2.49.0

