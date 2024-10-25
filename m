Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51459B0ACD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3782310EB38;
	Fri, 25 Oct 2024 17:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="AxCMrOOT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E4410EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:33 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4315baa51d8so22546325e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876591; x=1730481391;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RLNEe24VVIwAaP5agwCiuxY7rB4nwlR4wJvUVCZVQ/E=;
 b=AxCMrOOTlrRCV8U3TbFzTUN5BsbCM9TTN2EnaZXwK3B5d8NWWkwWDAhhj/T2nazZUD
 s4Aza9L+VgV7Z9tV/fAgM+PaO+Sxu2YoeHRiSrREkqzmRY5CwIkUczGxSD9U5EbVu2GI
 NanhNjnW+RPbKlVdaK+1AaMcQVwKzbIXiXhJwz53SWnXsYczL9EBy6YYhqiKAPYl5STm
 68+iNWYW2j5dz6iLdsXIWr21WUA+e7jv7Zc3o5INSvrb+g67pr2n+jZZ71zSGfOC9KPy
 5C4uLvC7Tf5qYYg5YBNbDTxawq8BadYm1qrOINdz0SAqdQ/OPcchYWdTB9wAorQmS/Y8
 J3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876591; x=1730481391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RLNEe24VVIwAaP5agwCiuxY7rB4nwlR4wJvUVCZVQ/E=;
 b=El0nZ1mkydrU8COGvjAMH0cM3Vn6qgVbPBYKykuZzMoGy1xKKG0V7OMGtXmt5zyAJ6
 24GLqML7Xb51nDM0K7kMvj3X5PNlipNYrv1TDDi+ufHfnJL9fWzJQkVOQsa1cBtEjxT6
 VPnxnEjaIvUUWybF8z5R5aS/x/O67R3dxG1i+ZUbWfW9ihCnUl6dCLkKAUDyxK3tdI0M
 JEzveCj6H3Gm1tTfZv27SMMZifrLALMEngGBCT53rBx6vp6a5j15iPZ0NDIibb5s9yej
 5PC9pfWDSASDppvFJKUWdBG6Ge7Ot+HJTYJeN4KlPJ7NuDtNy7LaYpSPdQ0czsmrN5tO
 qycg==
X-Gm-Message-State: AOJu0YypsLYgaSK2DrZV8tgXp93uSWtubBVh15FDrWewlcGWmC90GTL5
 /7odXYWv9/KsjdmETisjJ/M1AW0zmCoG5V3VSQ02gMAZ89KLjNbzL+1D7kTucfA=
X-Google-Smtp-Source: AGHT+IEf4KZxMhq0qk7/lCgwke2nZYw7jfKwbBRjQajizbRblmsymhNJTGNxxKLe3CTSVhp57vlUig==
X-Received: by 2002:adf:f411:0:b0:37d:4e59:549a with SMTP id
 ffacd0b85a97d-380611418abmr124517f8f.16.1729876591324; 
 Fri, 25 Oct 2024 10:16:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:30 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:02 +0100
Subject: [PATCH v2 31/36] clk: bcm: rpi: Enable minimize for all firmware
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-31-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1
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

From: Dom Cobley <popcornmix@gmail.com>

There isn't a reason not to minimise the clocks, and it saves
some power.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index d374538e7108..9f716b2223ae 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -111,21 +111,27 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 };
 

-- 
2.34.1

