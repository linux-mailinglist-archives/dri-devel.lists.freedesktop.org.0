Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FCBAB4286
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC82010E484;
	Mon, 12 May 2025 18:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MSV0MA+b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8457310E483
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:23:57 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a0ac853894so4170173f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747074236; x=1747679036; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1193UJbE32YYQYa9WtO0rNzoJW4bxqbFkUJaurJRCNE=;
 b=MSV0MA+b37Vnu79TibAurbyAU3IySqYmzmszhK1fxikCjAFWOf3hh7d/72bFiLPpML
 SaX+Faz4YRrB8jrgMOrGYUEukNhHBToqBuA+48RTdTnRthJkLXOMLNCb40YtgYzbK2sm
 wXqFvC6d9DO+EzZh4oOpEdEX3w/aGx6ys4CGGS/55uSBnVPakPm242nhKCaangX818GV
 vXh9+s2Si0uuwMnQ5dgjFQKHzRRwpn3C/P3HApZ4zjkYd53Kx02v1mFMnJFOJ1NsQUtA
 7+7v0lJ3OkUxnHrJRMMkoOHPY69ZqpbGkZfS6yVNI0y2rphTcH7T6V3/kYaXfDalJWdO
 T4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074236; x=1747679036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1193UJbE32YYQYa9WtO0rNzoJW4bxqbFkUJaurJRCNE=;
 b=v5bQHl3prZl5ctEjLn9Ie156UFvqzets31Ty188fCUOhNSKTetKb+jUJ9/HTPh/Lvm
 EJJOdEWUsWtaj/wQTIa8oaXQ0MTKo5tF8J0lrxEzwZSXrLaSdA32ihwI4wOHlQLPkMwm
 Uq24HsWunAVtFpOiOBX0vWZDCdMLnEocx84E2eara5OrVNpyLop0jLP0k7NvKk9oThKt
 /OKKA4V2DTnspKz6DQqZw0Rl0ah2NizX156VcIlXx3aJLt0yT2ayCTvrXSOBoJsE8H79
 dfRLFVTPqCh0UQ6H51ozRgKNoPdHJsHvPGrUcG3dgTojQ+GwuS5EJMI3q41+eEJnT/cy
 19QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWYaSXCGXHHE2rWNJXbMc1fvukHXw/ymYjRV/9qTH7tbzlzY+SVejKDdQiK3VgyT8Lq7BmYm+hgYc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV1XdA6NE/JEinqrJ9Wb2Ui6xQApU91kxSz8BPa7ma2dlsJtFV
 qknJjJSjMnPeiMk9UbbzOI9JwU74HUPHhd8E/Nuc2DcfbIsbklth
X-Gm-Gg: ASbGncuNzguefzWzydvO6e78CxvLUPocrnMLpH3S+OrN5L1I024+SFcACxM2hnL4nn9
 EP4XY5XP2B04vQE71/Z4RrwofkRlHmUYKQl6rIFvQjqZLypygQQ3cm5W7lAZIer5Q1fYWi52wtI
 VmF4W0w3TUdn//fOoj5uGkvxCavbBAqacvx/PuB0A2QQOAsntrDsuJ7ys7gLEJniGpSYyQSSHDK
 IVsw/umLlKtKCp9d/1rWX1dCTspqkem3bitRkAA6lEMAU8xTXLPDNlEOIXEfusc3zLC00p71rTk
 p7VxS7ba61b03eN8vyGbm+rn3PinZnF80gvdTamXaXyQGk9szZKZ45d+hBT1bpBVnqY+3F4WQDi
 t
X-Google-Smtp-Source: AGHT+IGCRxHRJFT1wb4lzfAl2BcV4olfCw3AoaKztULivpbUThs/lC/VzwFMFHTd9yhq7+8VNKrS6g==
X-Received: by 2002:a05:6000:40e1:b0:39e:cc5e:147 with SMTP id
 ffacd0b85a97d-3a1f64acc2bmr12468513f8f.55.1747074235981; 
 Mon, 12 May 2025 11:23:55 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:23:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 07/12] drm: renesas: rz-du: mipi_dsi: Make "rst" reset
 control optional for RZ/V2H(P)
Date: Mon, 12 May 2025 19:23:25 +0100
Message-ID: <20250512182330.238259-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 00c2bc6e9d6c..5fc607be0c46 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -748,7 +748,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
-	dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
+	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
 				     "failed to get rst\n");
-- 
2.49.0

