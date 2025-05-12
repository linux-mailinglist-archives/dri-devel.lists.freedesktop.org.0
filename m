Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1ABAB4281
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231C110E47D;
	Mon, 12 May 2025 18:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D3nkRGlP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC2E10E476
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:23:50 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a0ac853894so4170099f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747074229; x=1747679029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MwBb1g27iDzzf3BiBc6CzURemWUN7mfIH2kOtBADY/I=;
 b=D3nkRGlPtaVf+FJ8RdvkDYoIItCzvpKcTvwDbYZoEBa/JBqoa3BxTs3gS7ZXcMMBLs
 eMRxxwHICY78TbY1prJQdwTJ5WeKZr+2MqkGyGTTKifHBF3kNcitMXZe7/y7ilA6O75S
 RgcsLO5IH3ssl3UU+o/syx6kX/XX00wwhEBvdfG9P9hIQ1EeJctbEA5AuXPjp1bXtkul
 cPYZDtaogrmVhwdXQnJyNVvu4aiVvVFdgG1Jhjo6TV3/aajl3aOibByAQzsVLvztfswN
 rcZGY1vKUwf/492j3yeBqNgSSvJY6bHtD40Tukb5A8u/VtX1LkD5d0ZaA0NymQNKadI2
 n90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074229; x=1747679029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MwBb1g27iDzzf3BiBc6CzURemWUN7mfIH2kOtBADY/I=;
 b=g0lH2E65BteiNp+5/WpifL0Okk368tJr2dhwJvu/hw428MCSTAJykSq21Go4QMaIfs
 vFlk4OAnMZkIwZ1kql2DDD5I8rjiCSQVh6tibDp3mArXHQYrzvRu+62CCDXg2hPkUXE/
 W9BM19dKl9V415TTESMGropsdH9LWRs3+SIjYE87KlKjnX02wWdL5VhNrHw3aDOcr2wk
 jd9IME6ozNmVyctAnTMWw1xp2AoJBlpupfYUz/vQ4fzJedkyZAalp29CvtHR5wkD1NEE
 GleDa/+MCQqJH6b8UpYcLVin0o5nR+JNY+jrfbPmqc4avkkoXQm8DIs4z/vhgL9f8Y8E
 Kdkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9IIkToSESajJ0fv8Z17wr3IfzeOkhuIKqDf8fVTt/0yimU8emnqLRg7IHTLSlWXKvB9Shj1ZM2Y8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxct4KfBFQuTPir++EzFw6qI0g+vW9p8juqUsHKHscqF558u0ke
 TzH7M2YT/UpeLPgC4Kwb7m9WP4akgfxjHztcGrRHyfSo8t6SWhGo
X-Gm-Gg: ASbGncsxQPYB6yvp/mgTQkpgHA7Ty5SukXrgfRjzupvErOSyQVzphjGL6q8i1EoAm7n
 iOPxy2pCMPSsDZOx2pJCSUeuqcuzSALGeeSUWnUGcNofZv2arNc6T7wSXSCA2nI0DiaczgW2ePt
 uUFVM0n6kgGzKRkSqJonEkQJhh7GDzmHGGm7kTmlOeBpcpOBNivbGGRS+PziYOcAyle+ApsQGcO
 iOzR2qmsNYwB9gM5jvHuEwSPC8BhQ6exMiDXVHJTmqngmioyf8kJTzIsVMrXNhRK8emDojUaTPV
 j0WVpxYcvT8nbi5Z12El8htT+aX9LV2Kv5uo50ek//AbOzIabItzGE/oAlBjL21ddf7Tuzha5qK
 A
X-Google-Smtp-Source: AGHT+IGlBcrs5+02hvmTpqDOCRIZFGOKwN+DxplEoFv/iZPTIPFZx7s33XvxvzzbOI3QLuMJaWvyGA==
X-Received: by 2002:a5d:59a7:0:b0:3a0:8325:8090 with SMTP id
 ffacd0b85a97d-3a1f64374d6mr12391535f8f.18.1747074228663; 
 Mon, 12 May 2025 11:23:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:23:47 -0700 (PDT)
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
Subject: [PATCH v5 02/12] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
Date: Mon, 12 May 2025 19:23:20 +0100
Message-ID: <20250512182330.238259-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame
Compression Processor (FCPVD), Video Signal Processor (VSPD), and
Display Unit (DU).

There is one LCDC unit available on the RZ/V2H(P) SoC which is connected
to the DSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- Added reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 5e40f0c1e7b0..e1aa6a719529 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -50,9 +50,20 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+	},
+};
+
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
 
-- 
2.49.0

