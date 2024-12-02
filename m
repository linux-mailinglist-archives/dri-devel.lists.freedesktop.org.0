Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA9B9E050C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A693810E770;
	Mon,  2 Dec 2024 14:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="BWS+k32n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFDD10E76F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 14:32:21 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-434aa472617so36575185e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 06:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1733149940; x=1733754740;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0SWv286JLLtaOue4mQfrx4lljgfdeCl/Poe2xcsSj1A=;
 b=BWS+k32nmBl9JFcjTsKZWFcfTPAYij149F+Sgj+U32wt6oxQ4v7j4FxQk9QdJwLTB5
 HiWKngbVYBPI28fpgkEHQlb9pu6YME7et1Z1+wT0R8v7NRRe0CQYufe4Dadt8biWDyH+
 RqZXiGBi2wAphLmlqCDxLOeBvn7yNmdwPPLx/7oWzpPHzdy1+ab4kLJq/5nfJavt8n0f
 Z0zadFgfWU38CX3+L0UuV/VSy0nKe0LA7kf3sVtK7Gp7CyymL7SB30S4jxm1RO6iq/Ss
 j3m+EH/HFmZWRWVB2PGvkO1rFhQ8axOFFr1h6DgXk6w64aSZfapJN5pQY4cISlpWsLRJ
 SFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733149940; x=1733754740;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0SWv286JLLtaOue4mQfrx4lljgfdeCl/Poe2xcsSj1A=;
 b=Y/dDL+EavAC5XW61KHuKUa4koB3TrVTz178SmSFHxg+Dg8R3ur5iaorQ7VpyQXd+Zh
 knl7PXAgLMxUIdUlAmi4Qa0bjonAkLBnjpfJMAvlp10ZlyfehUXqMl7fS8lV36+RYvyI
 OW0pNygBJOE2T6yHM9SLNiKxbQiMm5ZQUPfS+gQcynHeMmqZBs+RvkGoT8ikWIkPNBGZ
 hPb5kq3oAYY7Jqz5MPpOj3ECC8g8ScLM7r+3a6+Zca8c1HxB1sGnzVktp5wLDcRhoXje
 givws14susew2679ljIVXTiNj5qC4zs6b7jJzf4lGH63ZzjxHFnisJNRbpSw3u8CcwCn
 iLng==
X-Gm-Message-State: AOJu0YzuzUJDGtyvfIAbopktyVhxIg2uTiSKvPLcxTOo86i0EYdj+vHt
 MJmAU9WXckjpUoNWNIk592v+V15dskwGXg3l+XZYm2QwbtpEy+RdHXodiMtF5wM=
X-Gm-Gg: ASbGncsclJuwuapknHeqrrCuQ89l0kJB8Dw+Ycn6acOKx9Qw+ZlT970ehxxUfoTy3R1
 ffs/Mefh9VFaHyKefHolg06mpyDl605F/UxCQ10XbB2dJEGcRfSM3FxFP3O/OanyyXxbHwdnuFy
 XsUk8DCj0/K33ewuqQyAmv30o4s4+u01fa0tWciep+U27fBw9olH4coMFM+oFPFEEqjJ5yTyApA
 YQRSYzugOIgESyuqGl2qw2A/hAkOorHdkX40oHybw==
X-Google-Smtp-Source: AGHT+IGdEnNzVlMLwDBvV0S4CV4yuBsyp8Dkp7xJueCrLVsr6eLGBmMPHRLxa0QvyyA/TmmOBjlOGA==
X-Received: by 2002:a05:600c:45c9:b0:434:a196:6377 with SMTP id
 5b1f17b1804b1-434a9dbed9bmr221354295e9.14.1733149940210; 
 Mon, 02 Dec 2024 06:32:20 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 06:32:19 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:31:58 +0000
Subject: [PATCH 5/7] arm64: dts: broadcom: Add interrupt-controller flag
 for intc on BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-5-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
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
 Bartosz Golaszewski <brgl@bgdev.pl>
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

BCM2712 DT was producing dtbinding validation errors of

interrupt-controller@7cd00000: 'interrupt-controller' is a required
property
interrupt-controller@7cd00000: '#interrupt-cells' is a required property

Fix them by adding the required flags.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index f42fad2d8b37..0ba076ab9caf 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -224,6 +224,8 @@ mailbox: mailbox@7c013880 {
 		local_intc: interrupt-controller@7cd00000 {
 			compatible = "brcm,bcm2836-l1-intc";
 			reg = <0x7cd00000 0x100>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		uart10: serial@7d001000 {

-- 
2.34.1

