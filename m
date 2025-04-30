Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A620AAA55B7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 22:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E2E10E342;
	Wed, 30 Apr 2025 20:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F6mQQBb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DD510E32F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 20:41:26 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-39ee5ac4321so217750f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746045685; x=1746650485; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FmVRNDgJPoOZl+FC+46sU6QYP5fUdspzcddo65eVNA=;
 b=F6mQQBb92/8Y2+jDBcxZiyl7kWpew+urpRzAcs1CmOj788UwahDWTInoqTm6Vupf1T
 CFKJUu37v9VPbQ0Y7K7SJ0FXdlAU7YUIkGCJydC2idUl+Ebm920QTIFuipJmRn+cGUGd
 aaRoB2dXQzOSQAzErbmjvAlxsfyw2Xe6yadhJfSC5/A1d2Vd/qVD1jzrlidGey0C/1gM
 1WBcMytd3+jZa/hZ57nifuYMcPcSJUo2ngudQHeepcaQOcmdEXnkhDiRIkxXMyhoDRtP
 Y9Qs0dlt5TZ/LSZgl4BOcY9uZTVcboRHLfYuj+kNZd/s5G8EtY/fqtWKpw5zfeCfvHNv
 lSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746045685; x=1746650485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2FmVRNDgJPoOZl+FC+46sU6QYP5fUdspzcddo65eVNA=;
 b=LEKpNmn7wnPYXM7+DL0uHfC/vb4TCxh3zNbLM7Vp9ssTUJ6IjAbPLOvFjvTzASz3ol
 NE7K2MfGKYinJUblim8//IPWjZMOzyhqUDRU9JUEgAZGm3UDp+tfeaPw+13kFkqJxdmd
 rTOsBNuloh7eupVHcONatlb8lqhHVK78yTW06QI4+jmb1MGS5kgSXqzwJqgdBUh1AbQc
 txu8cqZ9vLJDq4Gs2Ice1SXJcCv9o0OpTneeEESE/9ooXe5YGF04o+pp+7WNp6IUgAkF
 6BJ1b6vWxtwrZ9OVfgM0JPiTlOic18kSJ4gWUsvRbMKFpibSk3m9qSrieYCfc9ReRoPN
 ewcw==
X-Gm-Message-State: AOJu0YyA60XVEVuFmm72gzl+1FtFfcKpBIWIPGhP1GFK2Pi5ktKYB4nP
 KH10b7kZpMjdLivLELSfII6wDgsVeBN6GjfHJpNtOy9re5kcll5k
X-Gm-Gg: ASbGncugoSbVEPFdfNJZgmepTNI/MTJLXzg0NFgATrpOuclvnhg+4T9HOgOlTYvSG4l
 QbKT+owBrP+063xg78VRjyLrOJ9CI95qLyexlF7YkXRpnhhkwhXY8VrzkShrcE2tML1v6/4ASqW
 V3kCFUdkIgArFde6uteEGUIdXxIu0JDpGnJDnj3b45IHn5ZPK6+hDaQPiMmeXmvwlKUroE4Nv6d
 90gpwmX2qREIcT11nnxMrYsVcSyx/oXVsi4XrCCXG3K3s0g4frS1ePUw1qQEkIlSklGs9r7HNXz
 hNw/WSyjjxLVzlbWvAjAOCmJ5GPcjytgUwa/uQ1d6bOpCO0nMTQqKqnpu9ZxndkfgKloFFvfiL2
 QmvQH2v9BEA==
X-Google-Smtp-Source: AGHT+IH9VR/VG4GN6DoM4fsKWmDGoKDTPJxSI0HLkhKGuQTGv3jCyVAJF+y5EeS1rD6wkxPX1n97wA==
X-Received: by 2002:a05:6000:310e:b0:39c:13f5:dba0 with SMTP id
 ffacd0b85a97d-3a08f760dcemr4921596f8f.13.1746045685394; 
 Wed, 30 Apr 2025 13:41:25 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 13:41:24 -0700 (PDT)
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
Subject: [PATCH v4 07/15] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ
 calculation
Date: Wed, 30 Apr 2025 21:41:04 +0100
Message-ID: <20250430204112.342123-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Simplify the high-speed clock frequency (HSFREQ) calculation by removing
the redundant multiplication and division by 8. The updated equation:

    hsfreq = (mode->clock * bpp) / (dsi->lanes);

produces the same result while improving readability and clarity.

Additionally, update the comment to clarify the relationship between HS
clock bit frequency, HS byte clock frequency, and HSFREQ.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
index ec8baecb9ba5..c5f698cd74f1 100644
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
+	hsfreq = (mode->clock * bpp) / dsi->lanes;
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
 	if (ret < 0)
-- 
2.49.0

