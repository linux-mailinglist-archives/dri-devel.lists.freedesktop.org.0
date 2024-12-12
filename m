Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CD49EEFA4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 17:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E002410EE2D;
	Thu, 12 Dec 2024 16:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cemZdlu0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454D110EE2D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 16:19:12 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38637614567so402418f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734020351; x=1734625151;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=;
 b=cemZdlu00YCMwPKRiLOnbcckmR/Cqwfeh3AYJDaBZxJyKYAOZiSPoro99s92xujgfF
 58gJ6EwZlX+ycyG2TsbmIWtu5p9zmxuW28Lf80etGviK0XE9abbff7QZGDH5ATdE/C+Q
 2wv9SUUHfQ8wTNVLnDZMngcgSD7l2OYvn9pvc5jWNjbgM0xxM4w8S1jejpN9+22Hi6NP
 bkvUTRRdhJROBlcimdTFVzo61FaNylPcQU9Jsj3Gefjg4qQkyrcZzVEfUccLKueVpbmy
 Z9JKFw06sU2lgrYsrUinqDmi5lSK13XlrlDf6E5d1Ipc+sBvZSGdFlkrotKm1czOlYmS
 7R8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734020351; x=1734625151;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=;
 b=TzqZ2GCQWeoMEcTlJU7F/+hR0swKvdZBHvkamRFlvqgSTdpp0KzM97xMtHj7hv/YUk
 sB4Bkx7QT19HVfQcfVNlSzRtynobD/Mx/5EmDt8JsvKipAwzlIw9ALCJTP4Fl7MsSFgv
 WlLtAbc7QDogrHJ0fNejW7Bl1fKKQYmw2LGUAIMvtdgGNP8+cXLhqYwfP88VayOROfEf
 xgq64/lp25lomG3wlzKpytIQbHztC+BB4r8yTSNkGQt8tFOe/mdiK7x9LcZoydtzOvbS
 rcHWpLqfjBJ/KCl+IwU2FGJ7WZgoouOU+xfu9acj1vGI8RdXaCmWz/QJTGjS3UZEOwkk
 G3vQ==
X-Gm-Message-State: AOJu0Yy6jxmDX3RsBmXDSVagex6UuxUVWv6Nx2UIyxgj5qfaW7f7AOeK
 UOoAt4LNRen68s4obZneKQdKg0csxRIjjHOkf542mYtnqNUq3elOAg03Uxgg/Q8=
X-Gm-Gg: ASbGncsj+1ditMj49erjRPfa5z9MAh+499X+8ULpB2LgDq2Jo7KVe/j0AeXK1tiNqUi
 wpoAUkWymx/ytmG1e24oNhhBUSd3ESx3zjT+wxVjzYMQh+Y4B9F6d3Om8A8NIxcIp4TXzul1iQ4
 U50BKnr1qSd5KjVdQJ6uAgi/LcXIJH+vU7s2W9V7mmcgqIREyrZxsvf/b75ulncB+iUxI2tKG9m
 vlVymKiXfAUN6PJHCllDO4smVDs5/hAFVd9QLW5r1RnKejA
X-Google-Smtp-Source: AGHT+IHSgOEfwH+piApFqEC2IhYZWJ+1L5bPpX/eXc0mgxxp6hdmD6CIHtNXbZfUGagQsK5T5vfHeQ==
X-Received: by 2002:a05:6000:4026:b0:385:ef39:6cd5 with SMTP id
 ffacd0b85a97d-3864ce89425mr6133942f8f.1.1734020350544; 
 Thu, 12 Dec 2024 08:19:10 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 08:19:09 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:56 +0000
Subject: [PATCH v2 6/7] arm64: dts: broadcom: Correct hdmi device node
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-6-35986e04d0f4@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
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

The names of the hdmi0 and hdmi1 nodes had addresses that
didn't match the reg properties for the nodes.

Fixes: f66b382affd8 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index bd78af0211b6..f42fad2d8b37 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -352,7 +352,7 @@ main_irq: interrupt-controller@7d508400 {
 			#interrupt-cells = <1>;
 		};
 
-		hdmi0: hdmi@7ef00700 {
+		hdmi0: hdmi@7c701400 {
 			compatible = "brcm,bcm2712-hdmi0";
 			reg = <0x7c701400 0x300>,
 			      <0x7c701000 0x200>,
@@ -381,7 +381,7 @@ hdmi0: hdmi@7ef00700 {
 			ddc = <&ddc0>;
 		};
 
-		hdmi1: hdmi@7ef05700 {
+		hdmi1: hdmi@7c706400 {
 			compatible = "brcm,bcm2712-hdmi1";
 			reg = <0x7c706400 0x300>,
 			      <0x7c706000 0x200>,

-- 
2.34.1

