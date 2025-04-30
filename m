Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FC0AA55C7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 22:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACBC10E806;
	Wed, 30 Apr 2025 20:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZiNUwsa+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5413610E32F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 20:41:24 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-39ee651e419so114182f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746045683; x=1746650483; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMYwFd61jeM/AnC60Zap8f4r2F5Tqp87rmWVrFS3Wvk=;
 b=ZiNUwsa+r9fKWPnyG/Ag3uvblpNK0LryH5gY4xu8dHGkCnSTfhJrPusTe8eWIYNY4O
 ZiKxXxZVtQky0nd3x5teDSJKj8z/uyi2V6sbRFEExpMBNzpypF6x/PRD+d8Kd5vAYDck
 tKwJQupA39e7yfCPwA9UmAVgpsdcVO3ywFtWi0kk/oY74cnX/AFBM+gF6XoCw4/C2B56
 OiezYEJiU2wpdRVG8Uddj5oJclTPE20/RFx2PbfXsyGQ4Q1W+Z/Iol0IzuP089mjKDne
 4hVAMillnZ5Zf9tRlC5pdtn6eHZm90ojeLQkNujMwYPO2a/cFIPGYKBBR6tSv5mumDF4
 4fEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746045683; x=1746650483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZMYwFd61jeM/AnC60Zap8f4r2F5Tqp87rmWVrFS3Wvk=;
 b=pGPlNtQJdiwWV3IJIr1HOinV0eQRN3BGyTaFP7WNoVvVvhb+/+mzSogAQ+Ypp2q8N0
 FQrmQ50aViJa3i8ndd9rQJDrK5vypE0XtUxYpVyFQBJmExg3YZf8hXFdIhOUqlIfUnb3
 SlXfvx2zU6wH0zH1TroBj3qsfR7CSC10Aw521W5N5MJBuNia1/rhE6JqfK1Okk9YCs3d
 0d9gsW+wCf9Vloh54wi5uaZzRN1T199Lmy+JOg3bSTZesM6H+IwVm9rUZo3Sv5050h9x
 IkCAYsDfF6TpDFbhjtGWiKr7w3UxklYMxmnFC9tY4ffHkxtaKtHqo1PKZyj8JtZLzeC6
 Vs3Q==
X-Gm-Message-State: AOJu0Yy+GlN8TdFoo2D0TA9uNqJ2QBpD6Mpe2Y1U31siEcFvBUyI0zHP
 XkIZP882NgW5AXU01V6E0NetzChG7zN/f281aGP/v16+AKGXcCAv
X-Gm-Gg: ASbGnctoXxbTQgrJ2Gvliqohy9pFGQfMHRjMtXGmj+v++tJIcAbyYjIVpd3noF91c6x
 qeCXb8L3bXpfxsbh33mGbQZkO1LdVgbW951ptjbLQ27No0Au47jMTrOWx9GGbGi+7Wo8aPsuyd+
 1cRd5/mvU4/Mw/qYoFPSY5fndHJP1E+pu4ipluJegpcowhMA3psymblpFb1arO7J7vec4G0hkY5
 ZGv+TeVFCV0mxh3cBvNZqUsx/wEEM6jHe9eJogKO15yHlDkWazuPsCPA+cK2OixCHgDi6X9Ll6/
 oWJYPZ1WyqUOmSkuCTUHvAvS3aB0nAovyNZJp8w7vQqlo/SVQgLz2LKs2Vx7pNwyMA7hahKdwV4
 B09MujCAhbw==
X-Google-Smtp-Source: AGHT+IG1s0JflHsvw7aoodVtDTDPq8eFL7Snt93pxGgKfMKfGwBj3pCsYKVbW91T/9KWyRPQ+tNe/g==
X-Received: by 2002:a5d:5f92:0:b0:39e:cbe0:4f3c with SMTP id
 ffacd0b85a97d-3a08f799858mr3861267f8f.8.1746045682804; 
 Wed, 30 Apr 2025 13:41:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 13:41:22 -0700 (PDT)
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
Subject: [PATCH v4 05/15] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
Date: Wed, 30 Apr 2025 21:41:02 +0100
Message-ID: <20250430204112.342123-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame
Compression Processor (FCPVD), Video Signal Processor (VSPD), and
Display Unit (DU).

There is one LCDC unit available on the RZ/V2H(P) SoC which is connected
to the DSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Added enum for RZ/V2H as suggested by Krzysztof as the list
  will grow in the future (while adding RZ/G3E SoC).
- Added Reviewed-by tag from Krzysztof.
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

