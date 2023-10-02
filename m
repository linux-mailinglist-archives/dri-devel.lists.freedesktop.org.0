Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4FF7B5B47
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 21:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A139010E23D;
	Mon,  2 Oct 2023 19:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652CC10E236
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 19:30:22 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1dce0f9e222so66711fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 12:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696275022; x=1696879822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jHvZe6aosJuHasAj0ipH38kAgmnBv9GPeYuxoWs7zI=;
 b=c7Z10zz/+fBHq5ZK6TnnGhqCYSFwccoBIkpT+a/eUdfUoBuPKq8UucfbrpkcUiYcUI
 UtjN92xCPRcaSVbh3KH8rggOSWV5OvFQeIlUKJuucDARddF/i0WdwGuAjnQlGWBgchTf
 Nz4iC9jd1E7H6eao1soIBl8To6sRTygioTWg+rmNw25Am88bfbI4V6KuVUl1WhoFAVJK
 jNO9HKzEoKL8+yMCO78ZTMUvu3AtQqse8Xn9HrV9+y2RCpQrCq9H73W22SqmLx8S9bTI
 bWPOcozAR9hE6PvU+M5JGDNgHpHE2dPblGJb8QOdjfsN9C04D/N8NzW3q7kNZ/lW6oIW
 YRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696275022; x=1696879822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3jHvZe6aosJuHasAj0ipH38kAgmnBv9GPeYuxoWs7zI=;
 b=jWcZJ8SJtwT7EKlqQYsEVzCqvZyB3Wu0yvr/F20+JtThaSEHRLDHBs2RMfuRKZR4BK
 E3MVicr+t+2FjJR9/qkangsW6KhcUKlUGySEOTmuvZCAHhcbH6TnIl3w4egB15e0IHyB
 zPNyrBxiy9BoC3bQyaTdwJA2H4iNUxq/idPj7d9LC3PLT+C9t5zXMyfb1i+OHueG8H4m
 UTiwjpW12LGwT/ccjn9ho8MKe0hbMlsRRZlTD3BHrO05kajSHaZoYyap9LWWqJF1pbM+
 swz3lkWbebOMF7bVKAW2S6PXezqXZmNLNC9HxkN6nM/nsK2q/VW3VXz3mL4SD3Qt/FlP
 H9RQ==
X-Gm-Message-State: AOJu0YyuCGIMU2QooYqWzsOpsEqVdGq9Lvs8Ztg8/0XJScfl2ATIQKKa
 77R9WT6kP9I+GnGWuza7LLuFofTZ/ug=
X-Google-Smtp-Source: AGHT+IEkqL6FTSuOMDJWac6sXEEHotCWHKEG4suprh91GcPG0WolwrnoAp7zBJ43Mtswbigkp1sdCQ==
X-Received: by 2002:a05:6870:2102:b0:1d0:f5bd:6cf with SMTP id
 f2-20020a056870210200b001d0f5bd06cfmr14611000oae.43.1696275021683; 
 Mon, 02 Oct 2023 12:30:21 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 ep35-20020a056870a9a300b001dc8b2f06a1sm4846398oab.55.2023.10.02.12.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 12:30:21 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH V3 2/2] drm/panel: nv3051d: Add Support for Anbernic 351V
Date: Mon,  2 Oct 2023 14:30:16 -0500
Message-Id: <20231002193016.139452-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002193016.139452-1-macroalpha82@gmail.com>
References: <20231002193016.139452-1-macroalpha82@gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic 351V. Just like the 353 series the
underlying vendor is unknown/unmarked (at least not visible in a
non-destructive manner). The panel had slightly different init
sequences and timings in the BSP kernel, but works fine with the
same ones used in the existing driver. The panel will not work without
the inclusion of the MIPI_DSI_CLOCK_NON_CONTINUOUS flag, and this flag
prevents the 353 series from working correctly, so a new compatible
string is added.

Tested colors and timings using modetest and all seem to work identical
to the 353 otherwise.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index ad98dd9322b4..f644dbc8ee8a 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -354,6 +354,7 @@ static const struct drm_panel_funcs panel_nv3051d_funcs = {
 static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
+	struct device_node *np = dev->of_node;
 	struct panel_nv3051d *ctx;
 	int ret;
 
@@ -388,6 +389,13 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
+	/*
+	 * The panel in the RG351V is identical to the 353P, except it
+	 * requires MIPI_DSI_CLOCK_NON_CONTINUOUS to operate correctly.
+	 */
+	if (of_device_is_compatible(np, "anbernic,rg351v-panel"))
+		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
 	drm_panel_init(&ctx->panel, &dsi->dev, &panel_nv3051d_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
-- 
2.34.1

