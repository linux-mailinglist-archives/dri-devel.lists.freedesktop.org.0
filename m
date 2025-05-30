Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC3AC9426
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419D310E863;
	Fri, 30 May 2025 16:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gM3xmK2Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F11710E821
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:59:21 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-450cfb79177so11050875e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748624360; x=1749229160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bVJsgqR8jeq1tLgPX7Ahyib5AR8x8wp1hOOblNNYTTI=;
 b=gM3xmK2Y2Gcq5f+Hl7hZZ4OLOi1lwHPTTHbunyvoZ75l+gvL3s35bsxB8O0yO4NgWg
 J+5cUFliMXd35amGzPK/OSNgMh2/8j6hHqqtRR4s+UPJKxnw5JyL1abECKd/Rcx8nu27
 UGyddeRTzioAMlaE/B1uQ9zZHOb1WKtZjqchmF78SGafF+PsSwRtkxDZ/l2j7Ke7k0jP
 Uzq6lNY4LeZqkA4ZT1b2DTnMQim5JPw9Kk4fJrP0Ghi/PB0uS6i6usliLbyGJ2Rt8RCL
 58yjHeudxig+6bXXGmQdiK+zsAe7AZq4imFGxkeHgdSgOmUfqG5zc0n8dGXIuTaDqRL3
 uftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748624360; x=1749229160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bVJsgqR8jeq1tLgPX7Ahyib5AR8x8wp1hOOblNNYTTI=;
 b=QMb+GAoW5NRLYnptrGqrEYe1vwjfDL2lndehzmNIO3/9nT7kMpoLFvlnJ96VVxi+sO
 gBv1gNfTNSkKK9kJyS4iMBG2bAMK3Ovcam/v9/h/yJfGaTpY8JGT/qTwbLOM4Lf0REcY
 lN3YjaHq5+1dsVH9SxyL8JrgflKlds40jDz0JlfU9sfeDmv+WNqXH1mlPja6GE8HSO4p
 dhqQnp4IKwN7wDV40Sx04qyvs9ZKcs5bzvXX8sN0RGCrFaLevDTOX930yZe+qb7uz+Ze
 SVD97+RYiVvlRBdKnP5+P1sK4kM3M7lqKcEAwhkyhGlRY1gt3flkE7yZUhb3xAe8X9gI
 YgFA==
X-Gm-Message-State: AOJu0Yzxf5iM1hauqRCcLM4uRNJH8ohRWn/z4o/Sm9Hz3u6jV7Y+tXuT
 ysiI/tVh3PGUytPi2NWfjF5XcXewz+ad5mpPh45gR9UyQI15ITkBMIY6
X-Gm-Gg: ASbGncuxE6WNPaKnxP/Oa8G8mDwiE2pg/7UEBGJHe5XiQGxC8Td2jDLQuAt5ISMOjbM
 IL2iHZ4jlel/8puy5aa92Idc9J+3ury0VE7A4apJvXcF5WDcTnsyrvYZCQPx+ZdtEP1IDx2lTOV
 rg/rsudsCy2iRH8bkoUjIDMSFkn5Ppl6FGboA0YcU4k0KEfoxbchLYjBWNeHkXGXmTHoKRXrFS2
 NOq5GSlVFplWSABVirylnYJMYigXyKBufIeCX/Z11PwFk4hxGdkgT39jYZTeCPOeUs3uo5zthSN
 3dmyKRBAci3t+k/a4EjBM9Jix6eeSB+4uoBDMQqKmKbgrPByVDSVJ6Ge4pqk9saQFx8KqCxaY4G
 80HldO/Ttww==
X-Google-Smtp-Source: AGHT+IHUpzj7UNyPaAj/DrVWUSbBAQLC84krhHBGh8wrBgJHz7oS0WJRv5LI2/bixWhWKyONOKHTCw==
X-Received: by 2002:a05:600c:3b0f:b0:440:6a37:be0d with SMTP id
 5b1f17b1804b1-450d884c411mr30637185e9.15.1748624359595; 
 Fri, 30 May 2025 09:59:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 09:59:18 -0700 (PDT)
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
Subject: [PATCH v6 07/12] drm: renesas: rz-du: mipi_dsi: Make "rst" reset
 control optional for RZ/V2H(P)
Date: Fri, 30 May 2025 17:59:01 +0100
Message-ID: <20250530165906.411144-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

In preparation for adding support for the Renesas RZ/V2H(P) SoC, make the
"rst" reset control optional in the MIPI DSI driver. The RZ/V2H(P) SoC
does not provide this reset line, and attempting to acquire it using the
mandatory API causes probe failure.

Switching to devm_reset_control_get_optional_exclusive() ensures
compatibility with both SoCs that provide this reset line and those that
do not, such as RZ/V2H(P).

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v5->v6:
- Added reviewed tag from Biju and Laurent

v4->v5:
- New patch
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 2c03cad66711..0e0659dfe5a5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -749,7 +749,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
-	dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
+	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
 				     "failed to get rst\n");
-- 
2.49.0

