Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CD7B4267F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 18:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B93510E8F2;
	Wed,  3 Sep 2025 16:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YsCGKw8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CDA10E8F2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 16:17:35 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45b84367affso977845e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756916253; x=1757521053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NSjM+a/UtCOs+KeC+1Mwe43tHaErZzo30UMBBl9ALYI=;
 b=YsCGKw8u6Fl26iQHxqy/orjCpHkrBIzqm1YmncMqu+ELf6bnIbPhMOdvVwxLc/HDOr
 Gfh9SMUqVyjmURHWowkRXd7ftgH8gJjptDE6ubLXkiMweLk95rjFxcu4mWKtrTURJTmU
 +spCfeDnQQktZ+AlKeD7EK74q4xHImNCPGTAFttnyoLat7wEPtczzT/1xlW8utfF/9A0
 ESXA74tLjNO6N2LADJgLvYJumPevxaQVUdgTvgzvfabyb3HxXnuZRoAx/Oqwo/r10JAd
 JhcFyOCRB1uPWodbofYe6sN1x77MRPwfGOpS4b350PzWE4dlR6oPOiL1uYAv+MCzTVoa
 6d+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756916253; x=1757521053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NSjM+a/UtCOs+KeC+1Mwe43tHaErZzo30UMBBl9ALYI=;
 b=hwNYL8bnhglsiAocI061RJ/RngUR7Yp6vb11V2XuZtWBCigv9SpaItLqQ1CgbtEoQz
 ewVwSlvTA9DjPEBQjixuOkYOidA1aYeZoAIEQR8X4k6OtyBJ5Rnt9l/3omQqYSmnHK6p
 EPhpBXLAiUN+x8XBfuQjUDiNf4bwOOzJM/8VATeNr61P76Xianoj+eeF/KQq4MFW1xP4
 zoe/w1o9xq3+WCFMJOv80i8F3/J0ykGm5rbP3F29LdQ7PLRKaBbsBgqWaEKEf/2zaaW2
 QhpLJv4aBckaKJn53+sK2fVIq1Ta5zic2YpVw851coWsJcTeE+R2/EFRUSqFM4DZ6jvv
 RQlw==
X-Gm-Message-State: AOJu0YyHfQOvllkThBz+9aOdlB/OyqokouDbcLXhRoSrODunir8UuA3Y
 Qw7fPSETVSSm7VQRVs+YxwsbMF8iqtn5hRJTsIq/Y+SuVmsZ41jArJn8
X-Gm-Gg: ASbGncuSy3IkdEo3M7t9aAHX+0wqzZbQY29q/ClsXCsbIPG087fAHsCJLToRFAecigt
 Xs7Q7UpPNib4OmTMpGT+MXOJzZgBghJ02uPiYq0Ff3QLg/iWHXhV9ElXZWgsDroNPVCSPRnKjFT
 sIYBijt9Yq0cqRo+VbPu9rpJ4YLyecvg/eob0MBzR8FVz4WMHMXsFR0cTHNSPlKTDMPm79JqWsK
 pGRjhBQ2XFrbK4W98LqvLNtjxrx3JESpqX2hnanLsC3ka3OtQ1Bf+XLA4eJYxp8BodZ1ksHUk5s
 S739ij3CAjwNzCRyUO3nhAAzg40IARkYfHSPhXjYSgwFgaGzFYnRcjMvmhlvjO++wraQxqWNXbI
 S5PEsd7SbqALGBJPStXmBYBa8VnLh8+8s3klGhmbmXnYGunvkVj5ezasg
X-Google-Smtp-Source: AGHT+IH2Pu4JhVqS/UbbYXuRvueIRTHUHdGhkRCEOOqAyE1x3zxd/y+K9oiLsym8FuhfUcGJ4iZqig==
X-Received: by 2002:a05:6000:24c3:b0:3d0:ef30:d332 with SMTP id
 ffacd0b85a97d-3d1dea8dda6mr14556634f8f.46.1756916253425; 
 Wed, 03 Sep 2025 09:17:33 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:9019:aa0f:b6e4:7952])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3db72983560sm5645734f8f.1.2025.09.03.09.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 09:17:32 -0700 (PDT)
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
Subject: [PATCH v8 5/6] drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
Date: Wed,  3 Sep 2025 17:17:17 +0100
Message-ID: <20250903161718.180488-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add LPCLK clock handling to the RZ/G2L MIPI DSI driver to support proper
DSI timing parameter configuration on RZ/V2H SoCs. While lpclk is present
on both RZ/G2L and RZ/V2H SoCs, the RZ/V2H SoC specifically uses the lpclk
rate to configure the DSI timing parameter ULPSEXIT.

Introduce a new lpclk field in the rzg2l_mipi_dsi structure and acquire
the "lpclk" clock during probe to enable lpclk rate-based timing
calculations on RZ/V2H while maintaining compatibility with RZ/G2L.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
- Updated commit message
- Switched to use devm_clk_get() instead of devm_clk_get_optional()
  as lpclk clock is available on all SoCs.

v6->v7:
- New patch
Note, this patch was previously part of series [0].
[0] https://lore.kernel.org/all/20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 3b52dfc0ea1e..bb03b49b1e85 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -68,6 +68,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -979,6 +980,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
+	if (IS_ERR(dsi->lpclk))
+		return PTR_ERR(dsi->lpclk);
+
 	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
-- 
2.51.0

