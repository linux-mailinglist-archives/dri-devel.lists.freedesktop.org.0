Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19C19E050D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE8110E773;
	Mon,  2 Dec 2024 14:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="HHRs73N6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AFA10E773
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 14:32:25 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-434a736518eso54700685e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 06:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1733149944; x=1733754744;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pli6SsFvDcPYaCKSCtuylkfG7oHLkLI1T7gsEQivs80=;
 b=HHRs73N6/2uiAo07uKa7UN7jbwr/byGALOyIDHXzDWaCqIcLC5OkRUIP2nRq/+0GXs
 lMFdol6POjqT5wVWgUGY/km1IR5IX9rrRs3pNtFmpZ3wF2RBmbb6zim7eJKdS9yqd43P
 A+6EuhMeixk5GNjVS8UQBPbhTp4YhcVgW0t+lGVJF0VAGEOvURwB2qlvkdbPDHOfrYBI
 f3F9UVDyHhA+f1rZb3yKNOBSxwTNDGHFpmaovdLZ4t+4bXlSmMDHjb5qkq2Rnygo3Gm7
 Dsm6e2wk7xL1GtMgCvdo0W1vx6OHQ771CE/r0qxH2jRiFKiqVgOeP5g1EfbYIBgiSoXd
 vyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733149944; x=1733754744;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pli6SsFvDcPYaCKSCtuylkfG7oHLkLI1T7gsEQivs80=;
 b=omL/mSRNXmh6tu39686A7lopoPlt65Dii5AxwEwUjFcstUZHgKHwDCbma9Fgl0SoBt
 jizm0RHtUNF+xnC6s8CpOIpi5ObrtkgBekhZKNvWkbPNR8ABnBXaq0QJ1VzCL6Rw+OYe
 8G5ARixXpf5tpZnlMGZFnOoLcTDsGNC+9dUQscbTBN6OHgoQj/gyNGFbDMhl4ofdLDbX
 fyqWobVSWxJyajC4G8jqqid5YDN9IXNST2OkztU/gVUEUyQ1+h5azGAul6k09clGBVhJ
 PKNpQg76TM/CHjWKrGKcghNlVodzYWyZ0YdYSIZOCR1Jrv4PQGr1NjVBw6V8LKcyVqBY
 +PRQ==
X-Gm-Message-State: AOJu0Yz5Oo+Qt/Hx0PVbLOrL+U/voEi3snfRu6fwDqRjvim6wkj8Hhad
 mrtdSW5YphD20DOwcCk72rw0tLWEt2sgs9+aalhm94YrvL1xCvSRYfK4Q8xs2Uk=
X-Gm-Gg: ASbGncvFqe/RqVZWqb2TShYqLrMEEJfRFa0kKyzX74n9KfYCBdW78WRckWLf1kPycPn
 vf1MENsu8qfGbhQiicminfd/ftzlzLCGtWbonNb0m3nFvR88SXCFVdNvjlIrk4+wHmO86wWeFBE
 xTPcyIGoqafveBKHNCaa9Z0RAos3a2MUBpDA6zbk7ZqEF6YN7vKZ4LcdqhZXZZYSHu0KJWOx1nR
 dp01wMLas92q70AS9dLuZSRid6/OmWHz4QugtInbQ==
X-Google-Smtp-Source: AGHT+IFok6tkFCPxh9TckNxxVOqWD00WXYrj3eZIwv/5rIdvTJ6mEyRfzTjnuA5/i326onD32S2G0w==
X-Received: by 2002:a05:600c:4686:b0:434:a986:11cf with SMTP id
 5b1f17b1804b1-434a9dc3030mr246706275e9.8.1733149943483; 
 Mon, 02 Dec 2024 06:32:23 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 06:32:23 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:32:00 +0000
Subject: [PATCH 7/7] arm64: dts: broadcom: Fix device tree errors on BCM2712.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-7-fac67cc2f98a@raspberrypi.com>
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

Resolves the issues on clocks and power nodes

Fixes: 4254a647b6c9 ("arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index fbc56309660f..26e05601416f 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -66,11 +66,7 @@ &sdio1 {
 &soc {
 	firmware: firmware {
 		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
-		#address-cells = <1>;
-		#size-cells = <1>;
-
 		mboxes = <&mailbox>;
-		dma-ranges;
 
 		firmware_clocks: clocks {
 			compatible = "raspberrypi,firmware-clocks";
@@ -85,6 +81,11 @@ reset: reset {
 
 	power: power {
 		compatible = "raspberrypi,bcm2835-power";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		dma-ranges;
+
 		firmware = <&firmware>;
 		#power-domain-cells = <1>;
 	};

-- 
2.34.1

