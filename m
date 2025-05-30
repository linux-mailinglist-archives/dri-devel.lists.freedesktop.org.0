Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A58AC941F
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6BF10E872;
	Fri, 30 May 2025 16:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WHZA9uRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E2F10E85D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:59:15 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso17047565e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748624353; x=1749229153; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FoEHKnPQTr5zR3ciIiMZWPKrWLoE2LlKJRQLW44Bmv8=;
 b=WHZA9uRnO9wrrA/4VSmL7K1LxKLmjCC3NyyS68F5R5YXDkmEcA8diTvxeaXBG7iSOi
 +Ya5/7gT0ravgHudo6bqpmQZ1s5/aYDJkjDqiVALDI08e7jcpumZt21YCTejPtxG+SCd
 bCBDWMPfUdNmJ0cYNp+Do1IK2erF76GqbQj/FXrxWpMu6Ikb/JW4wrdUPj9r2SN+PUBu
 T3ChapRWvD61KiLjf8xgCMgvg7iiMzQwNwg6dL9c4bbWFSOeQ4kOzov/nLjeXWG6V73X
 7BD5UkyfWWy2x11Op5UHZsxO/nWhgr55WZ3GQ7QDokvVRkFzZrc+TQX0NRNsQe98Mkru
 dOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748624353; x=1749229153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FoEHKnPQTr5zR3ciIiMZWPKrWLoE2LlKJRQLW44Bmv8=;
 b=t+T1pmTZFrrHKfeL5KY0khBKXZgNraRkVbH6S/Dm6K0R5xWJUNsfwABx0/MOO6FG0M
 DNH7Pba/MUwH/QFFGYIqbcDGUDcrAWYaZiWIGvA8q1j7nB/GP91JXMvR1s7m17uffAtU
 Bp/jBr09aywlhn/Pkj5TZET5QorMDPuhCh4Q3BsjgMHNCI+7Prz5zpPjqgf8PAZdDYIA
 W1C/D2u45ydjTdzSII92pmKOSAV3Ru8kNZ9wuIhQs5e45RoVA153+3UpQC1wSkq8EJsN
 IbsronIiDTB0yw0kOtlZ4BGxGupiPXwCcZjGvLobIZksapmV8u2BcZcaBCpoFhAnb39i
 +m3Q==
X-Gm-Message-State: AOJu0Yypd1w46B8ebjR7tze9ArtO/45+XpkDgprhSKNkU+NxiYJ7TxmY
 LAsi3xQKS+fzJvCnQFiInNr6l90GgQzIprd8TmmFtZzXS53jmUzQ98u1
X-Gm-Gg: ASbGncvzYFvS4QQBm3qHKW0xVvVqxHJ/MceXN6IDGUGlBjms9vuabeIlQ0USed1G7St
 gKknCRuHQ2WCr3Plu4ASUAcr44u5TeT8xe9q66FoE3Jom9N0N+0vUW3Epuak92FD+mnIYiJMOKr
 bWNwdfYGbv2hmRYthOT4cv4VF9vzCUnvpLZZNLdnEdWgkJ4yp7X+VLWdH0xgudEk+1r0a3wvliM
 vYQet+LXOXi3pHIBo3Qaml3K6CXP3R03jI6nt0V4jH2DasWznOck793M/gXMcLoN3ybqD/Gyedu
 tUIPJnhkQExVWDr7+SFwEOXmzxOU6KznQQol259cP4Lj8tjDmvBy70s0NBIGz2oeSXTYUqugmCr
 c6D38khPMgA==
X-Google-Smtp-Source: AGHT+IGU2TmBQ9qYoBu+7qGqXAJP1YRkLBoB2GytIxCWe+V6JfpaNbAs9IJwJp2wzD66imLtn9z/sQ==
X-Received: by 2002:a05:600c:620a:b0:43c:f513:9591 with SMTP id
 5b1f17b1804b1-450d88493a1mr29456355e9.14.1748624353393; 
 Fri, 30 May 2025 09:59:13 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 09:59:12 -0700 (PDT)
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
Subject: [PATCH v6 02/12] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
Date: Fri, 30 May 2025 17:58:56 +0100
Message-ID: <20250530165906.411144-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame
Compression Processor (FCPVD), Video Signal Processor (VSPD), and
Display Unit (DU).

There is one LCDC unit available on the RZ/V2H(P) SoC which is connected
to the DSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v5->v6:
- Added reviewed tag from Laurent

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

