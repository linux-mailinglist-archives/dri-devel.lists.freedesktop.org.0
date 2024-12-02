Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA539E050E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF6810E774;
	Mon,  2 Dec 2024 14:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="X59RbVOk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321C110E778
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 14:32:30 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-434a044dce2so54636775e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 06:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1733149948; x=1733754748;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qoO0W1lzMLcOdS6iQBTqdnnGTSDtRuJivefn0QP3emg=;
 b=X59RbVOkPtXGb5Fgqg3ycqqeLZxfvtrs8mB/L76wVX9PODfMrt6ORAXsDhUGI8QMI9
 E8j8MpxH6cbLNnNewkN3tN8FChqJQDI3dTsI8TQ5RbNli3R0XEal5eb2BcU2dDdBIZvT
 BUeDrX7KIfj9KkPSPaiSchwQcB7a2uaGr53JXtGOAV6xoXCP4MBRk5P8muGaKxJmqoa/
 3cuy5V9QkOl3gq0cgph29uAapQ8cdT12UmGwNLT0hfOTiW2mXAbqZFWqIB7ObYpa0H/p
 NUq0Y829RjgfcDr9ascuQiwtDsum9bNhs9MqUEjvH61+xfvsS59sJg3aWSRcdIn5K5T9
 crxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733149948; x=1733754748;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qoO0W1lzMLcOdS6iQBTqdnnGTSDtRuJivefn0QP3emg=;
 b=RgfXC5fC26Z7/h5hwjXdzqIXUwgOhnh9d+g9GV9XJ5RAsqdUN9gI40pXw78yn8Zar3
 v7X5wt2FWgSjCGS1ROkDDUKo1Kgs4dhDiJBh38pcjTaTMb3Jtk0u5MBwqmW0syNzeWIY
 i4kXR9HKj+hkD7ZXuIIpHZlxe6L7uQ6x0w0rC6pF8D0+8fP9SLSjGm1sThrqTEjLrvls
 X7nTSkhm4F0W4VqVjsRVds6jq2VUwL/WYKhzFeyNFrmScU/VkVbPTc6xfcaR0aodQOpK
 Ahgk3SCFHx0QKHUidfL4LbpZrr+KlvxXucdqp8Suey1FJ9v94tVAIuS7HtB9WzpOz31u
 MZLw==
X-Gm-Message-State: AOJu0YzMAAT6bZP2u7WVXqWJm388eouhjPdXv8veM42Rv+oF98Yb1vor
 4QPRnUorhZdXkk8nbBIhfKc/W54rxyhmCEiHAdOQPenFgVRkGqYZSDgh1V//7m8=
X-Gm-Gg: ASbGncvg1lY9xuZn900v3DIwxnnlyWWBB5A3QKnRuo3aT56EmkktoVtd9PCaCXBrra+
 sV8cB1n3s6TbS+33c4DQcwQWz2co+zQxl2JO9wyoOvRhfrD18CZh4WYcWtlfAb+M0ro+CJPLb4Z
 OFavosSzpjrf8U4EEDfzbzDC2QN0wyDfId67aINStfqN735FJv27YPek9wjPSNuviuo8srMegDZ
 HXaTqy9omi4MVP9rnkT3+PHA9HGLjn0a4RH2DmzLQ==
X-Google-Smtp-Source: AGHT+IE0KkUbbY+W4pZJfpChMoM/Bgrd/vrm1xb0nOBeoKJCjAgqt5slzwSLTSLUpuVmedDgVR+CWQ==
X-Received: by 2002:a05:600c:3549:b0:434:a923:9321 with SMTP id
 5b1f17b1804b1-434a9dbb626mr248858685e9.5.1733149941245; 
 Mon, 02 Dec 2024 06:32:21 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 06:32:20 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:31:59 +0000
Subject: [PATCH 6/7] arm: dts: broadcom: Add interrupt-controller flag for
 intc on BCM2711
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-6-fac67cc2f98a@raspberrypi.com>
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

BCM2711 DT was producing dtbinding validation errors of

interrupt-controller@40000000: 'interrupt-controller' is a required
property
interrupt-controller@40000000: '#interrupt-cells' is a required property

Fix them by adding the required flags.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index e4e42af21ef3..313b1046d74f 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -51,6 +51,8 @@ soc {
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
 			reg = <0x40000000 0x100>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		gicv2: interrupt-controller@40041000 {

-- 
2.34.1

