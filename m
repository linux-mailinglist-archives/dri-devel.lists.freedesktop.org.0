Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8BDAC9424
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB55310E841;
	Fri, 30 May 2025 16:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RvkluXPI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E60D10E86C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:59:17 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3a361b8a66cso1409665f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748624356; x=1749229156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ep33XalneBbgJw013YVa3zWaUedAxlfWPYCFu9hRrHA=;
 b=RvkluXPIIry6g4lCmiyZZIzDLSQZtYAXvuBWNEnCdLypREmaunjguNWmsclFI98wAO
 EmoyGb+pLbc73KXQl5Y/7NMsHV+PWk1HelPT2LbZf/c5N8OpBTqc8B4hI5PEduLpFqgA
 EQnvhbpumVNehMnyxhZgCqZzmhsYHM4YIwLHZOrCcBDfPN9Dxn+3mgWt8zy0OAnsOPgk
 Gmh/MwD7XRk7WdEc0RuQ1vdwkh95EOKiMySGpWMc2aAfx4+7kXLnnV6mMErh4CdSTb6W
 QuIazH/5rP0/6yF6fDDPNB1gaD7qBLFNgV55fDDWRCW5m1bIwCj71CBQtXdg4wHnGcQ8
 nN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748624356; x=1749229156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ep33XalneBbgJw013YVa3zWaUedAxlfWPYCFu9hRrHA=;
 b=ks/MhkiCYx4Lr2b0sQxK+fUqQTFTgpnoqmbDoTCJi4RBPcJomUwwhtuAUjIAzp2cip
 567tav+J2RNpws3loVsSoLlHQQB1AWW34r6Vp1AJfkfLXlHdaJ2tvTZER9d0GnKcj09B
 KN/f1WcP51AB8OIq9ERg89RBBCGSRufWbgaIyzbNCPxBVKsfzoeC3NTdvqr2w2GS15qB
 2K3jWxb+OD64XjPyuO2cRdieY3Q9gYyx11FaPlGVy31tNTwpR5EtR/IyyCPuBwwAgndq
 SWRclZpFSwrEfFuqQtH0rYiHX6OAECJIUz2eBGoEozwk5vIFNekKN+j/qGBaLbgYMzUq
 9ICA==
X-Gm-Message-State: AOJu0Yxd3neZmbUVwHiEqS1XC3xHPb8x2VFBzCP+C1mw2sucPj4HKBfg
 0twi2ksmdyS3vzMyR5/JpH/4GcCqxTqF4+HJL8AZad6XJhf6Hl1C3mMq
X-Gm-Gg: ASbGnctYyy6nJnN+Y1BsnHMID+z8tBdAtqV62IN3Xj19VsY9GDKRzCHAaxGUzcoFAG9
 tN075Sy992egIlIdGCI/87vKZcybFp2t72YK+4136LZpK8Gmhh4G7abLRKfbp9ZppdiupEQ7ykT
 fOAb7ozSkuwriFo04+C+1MGxA+yT3gsdCuxHGo63A8Je3NrFUNbOxbmI0l6a9PzFJcyi8TmyXQB
 IcUDvjrhRLpC8tfdDfA3TULsTPY8MqDE1mZxtOQOmfHha3NBkTaiXDnKP+a1TqTtC0enlFL4uLr
 4E+UsZGPjC0hkEyNFZcRgOLJfTSbvm9LxxAN/7iPiUjIKni8vFIXniAuI1DL4GUyIlYDaBBaIv9
 sC/sMedp8CQ==
X-Google-Smtp-Source: AGHT+IHYiH3AqyGyheocdIkswg46QDLFkDwqyzaJhubDoD5U6wTGpioEJ3rCPpOKyjYwDrObzAjy7g==
X-Received: by 2002:a05:6000:18aa:b0:3a4:d0ed:257b with SMTP id
 ffacd0b85a97d-3a4f7a4b434mr3253740f8f.22.1748624355998; 
 Fri, 30 May 2025 09:59:15 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 09:59:15 -0700 (PDT)
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
Subject: [PATCH v6 04/12] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ
 calculation
Date: Fri, 30 May 2025 17:58:58 +0100
Message-ID: <20250530165906.411144-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Simplify the high-speed clock frequency (HSFREQ) calculation by removing
the redundant multiplication and division by 8. The updated equation:

    hsfreq = mode->clock * bpp / dsi->lanes;

produces the same result while improving readability and clarity.

Additionally, update the comment to clarify the relationship between HS
clock bit frequency, HS byte clock frequency, and HSFREQ.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v5->v6:
- Updated commit message
- Dropped parentheses around the calculation
- Added reviewed tag from Laurent

v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Added Reviewed-by tag from Biju
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 6aca10920c8e..e8ca6a521e0f 100644
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
+	hsfreq = mode->clock * bpp / dsi->lanes;
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
 	if (ret < 0)
-- 
2.49.0

