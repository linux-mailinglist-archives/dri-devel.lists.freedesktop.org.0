Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC0A08E90
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 11:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4899510F068;
	Fri, 10 Jan 2025 10:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BEQy6Pp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B9F10F068
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 10:53:43 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-21619108a6bso31337855ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736506423; x=1737111223; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V6D+Duy2KSB23Y0Rvwa3w0ojen1q7SpzhhAe7Fua6DI=;
 b=BEQy6Pp/v+V9qpZ4lbSTDG1HV8ytBGhkyI3XDJ84RwvObpSE/d7dRESal63e527k0a
 56ERnJroXPw7J9Uw82OZbI7xi50U0lnWKJz+IUT1pj5kIGJV+jTMGLcl+UyuuKYpbga0
 GT+bML9uAYHKWjzr/IJLnyWOCq2sgm0gOvzF6mk/wk7aNywKzcG/o5vcVXwTZJYSOrC+
 AOqKaKN2/3trS5QlC/ePDEY3Rk0+YVY0egSrrzWMhAGV/h494/WpWCHvFhSJpMi06+fr
 TMCVc7Rlh58alf/LwGj7uODv2fFtlmFOs5+LG+zcL0G7LEN4QvZ6Z011NIE6KLkIvzxY
 BYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736506423; x=1737111223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V6D+Duy2KSB23Y0Rvwa3w0ojen1q7SpzhhAe7Fua6DI=;
 b=n+uD1hvV5ha/H5F3mwIDwc/AHHJ1NktgFdmPjfV6ojFhYVAr1gRwX/kYejytkcTQxO
 A6yCTcvLqkc7lEHcmeIey1KLmOCFDu5buaVTOkG/G4mOqyttS7Trq3t2gzuGETCc2Xi0
 jjQ5hrmQEIHKFpayOKFtgm6izKdtp9lS2agA6e4J3Ov9roKt5IoIYOP4RLtC0kAFfFn2
 NguSNolBu06m1N96uSd6v/YNKEGboHA0ZsbpvPg4DHh0ZECQ6muKCWBQMWduqJmiUn4S
 8qAWKho7VmuOZJdFnvAedQRhXqe+LM7uZlnj1pW+IQdOVO8tqyCyjoDONh6R/b9Ttckv
 Y7Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsbHhQkETG5ARuv5alOZg+84xxePWnODxgRms1/ZBQNIPlP15GS5vgDi+5zkBt2BMnMXk/zriM50c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5wWVKqdXN0zZVgUcu70K5b5sxcCPeVfLuuRwu8u+Bf9RkeXV9
 u7Tb4lh2GBQz9XoPppS47vYj9yim2KW4pjBW6nZitjxh9xraqzk1NmaAPNul
X-Gm-Gg: ASbGncvaQ90dVRRYwkzrdSi/3hG7BiuV/U64q8HyAKDnR6KX2Hnj3P6z449FeJjRYwt
 4Vw/FUtImsTmDEhUAMKOl8yU+vbtQImO8Wij84c1ISXzmzSvqlX7imnOPhB1zakYiesy3DEbnbL
 g+tT6+740fV/bvqTy0aFpceprTF7RAkGiSVU9kVsptp/dz/sFNOY/PQicytJooLLVLpkMo3GQOv
 GfVyQVu1sIuUnOoOXtnnaNNW6065Q4kR8rqecSfdwcDL7Gau42rCr6ciQ==
X-Google-Smtp-Source: AGHT+IEXc3zedWc5CeLrQUkadcVEzJk8eqcEuyttO1WR8DTZLahGcQx2U529vW48eyEGuwRsZNX9tw==
X-Received: by 2002:a05:6a00:2c86:b0:71e:e4f:3e58 with SMTP id
 d2e1a72fcca58-72d21fbcf06mr14713527b3a.17.1736506423154; 
 Fri, 10 Jan 2025 02:53:43 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d406a57dcsm1333403b3a.170.2025.01.10.02.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 02:53:42 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Nick Chan <towinchenmi@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v5 3/3] MAINTAINERS: Add entries for Apple DWI backlight
 controller
Date: Fri, 10 Jan 2025 18:52:06 +0800
Message-ID: <20250110105304.71142-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110105304.71142-1-towinchenmi@gmail.com>
References: <20250110105304.71142-1-towinchenmi@gmail.com>
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

Add MAINTAINERS entries for the driver.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..67ad74f987c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2196,6 +2196,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2221,6 +2222,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.47.1

