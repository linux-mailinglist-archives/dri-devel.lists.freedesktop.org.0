Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D18F9E0506
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972DF10E762;
	Mon,  2 Dec 2024 14:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="o0xe2+pH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C6510E772
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 14:32:16 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-434aafd68e9so36738105e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 06:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1733149935; x=1733754735;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=66NaRjYo+TdRIjIUtk+A/zrTfjyMbW0NLvNCk3ACUHQ=;
 b=o0xe2+pHQ6a5YU7lHy1Wbe21IWYo4+7KKC9xYc9XZyHj7G6sbA6W5Y3b8cA7+b5gpJ
 tZqOWAh1PU7yZ9MGzZwix0TLl9G9GdBp8fAJkGCKvRsFCqEn32mYwJT0TdrGXk4p4XJq
 Ds89dR8KbqyA9sQRbdJaaMcLiTdMV6XbQIEQUbAoSOPWPsuxQattS/CRF7uszPs/w2ty
 DRacvci82Qtz4ge3t9Z9nC4cBrNqCwtFdFFuuAkKbgxr6PZi+4upEsWVg1onfuMuMTEs
 3fo7uJjmEqQIjlTF5TpvrtHFtG0RD2tsdjYiagI8qckcKjDSBdhFL7LCTS5YXHqaDaB1
 GB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733149935; x=1733754735;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=66NaRjYo+TdRIjIUtk+A/zrTfjyMbW0NLvNCk3ACUHQ=;
 b=UfsBZXSWu5urubiLJQkXCfJ3j3GeehtRyI5vlaKwuyiQ/JMIXo86BAeXniGjQ9b6bH
 sPLNn919dyeJv4nMsyI5j+a5IrQ026T2RgDeAhKbVn9GBkwDr5Ppnx9f5HkUkJFa4ztU
 zIzCMpWdFVAnz/OISQkuh6DI6Q31Sdrr04tx/ugh7noS1/CP/Ta/wFbHSJ0zFG9MD03H
 IPfeV8xJwMAwI7BD2slMdT8HbKUdylEYushvgG40yp3kY8D80GbVF0ILLnUGTGrHdJEW
 7yElR657FtoJBuZN+2D9Hc3agmuVafptHUTMekeJ09Q3A5Ub25NPUIeHLBc/E44MmicR
 Uajg==
X-Gm-Message-State: AOJu0Yx2vvZuHmujmhZQrEhC5/0eInIJZ8bUtpF06lROMOgHFi0kzR/T
 4ssTP+Hb34dhTIg4zs+Mv2JYVMvODrkScQcHhDFCp76l/MmvZzPalyFXLfaomcY=
X-Gm-Gg: ASbGnctuVtip9xRiIcTij4tJc87WcyVOegoisCcNDakwkukTUd+7KCIU/HbJgJF+jC6
 kA74cy7kLhTrWjGM3fC2eMRZsSKBscW5e289/0L/NdYyHK4kq3a9dDGBiX4bmNHQFHArOfngoQY
 RkZ7OubUtfojH4CgEK+FDy1GS9eRic50f6FOBPUPtzfwsvCTBEBST/zgQOIdMeUMPTUAKtTvWjI
 1ZpXAOWKLA9gMjRG9NZVmzNxyYn0vusU9D6p4bf8g==
X-Google-Smtp-Source: AGHT+IFjvnTvxoYoYzXeiS+rT48r6tDHyIvnEQ/xQrP8Q+YrgHiGsItI6q35+4octUNLW9uQ5Wq4wQ==
X-Received: by 2002:a05:600c:1e09:b0:434:a8d8:760e with SMTP id
 5b1f17b1804b1-434a9dc6774mr200107125e9.19.1733149935182; 
 Mon, 02 Dec 2024 06:32:15 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 06:32:14 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/7] drm/vc4: Fixup DT and DT binding issues from recent
 patchset
Date: Mon, 02 Dec 2024 14:31:53 +0000
Message-Id: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANnETWcC/x3LQQqAIBBA0avErBvQQVK6SrTQmmoWWWhEEN49a
 fn4/BcyJ+EMffNC4luyHLFCtw1Mm48ro8zVQIqM1uRwvjBMO1lNuMjDGf0SFDuvvLEd1O1M/Id
 6DWMpHxlHVi9iAAAA
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

I missed the DT errors from the recent patchset[1] (DT patches
in linux-next via Florian, DRM bindings patches on dri-misc-next)
as Rob's bot report got spam filtered, so this is a fixup set.

Largely it was changes to number of interrupts or clocks in the
bindings, so those are now covered.

I've fixed up the missing "interrupt-controller" flags for 2711
and 2712 whilst here.

I can't get my head around what is meant to happen with ranges:
"soc@107c000000: firmware: 'ranges' is a required property"
The meaning seems obvious.

However if I add it then I get:
"firmware: '#address-cells', '#size-cells', 'dma-ranges', 'ranges' do
not match any of the regexes: 'pinctrl-[0-9]+'
from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#

There's obviously some other flag I need to set in the bindings,
but I can't work it out. We have similar errors for all the Pi
platforms for one or more nodes.
Please advise and I'll happily fix them all.

Thanks
  Dave

[1] https://lore.kernel.org/linux-arm-kernel/20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com/

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dave Stevenson (7):
      dtbindings: display: bcm2711-hdmi: Correct bindings for 2712
      dtbindings: display: Fix BCM2835 HVS bindings for BCM2712
      dt-bindings: gpio: brcmstb: add gpio-line-name
      arm64: dts: broadcom: Fix device tree warnings for BCM2712 display pipeline
      arm64: dts: broadcom: Add interrupt-controller flag for intc on BCM2712
      arm: dts: broadcom: Add interrupt-controller flag for intc on BCM2711
      arm64: dts: broadcom: Fix device tree errors on BCM2712.

 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 44 +++++++++----
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 77 +++++++++++++++++-----
 .../bindings/gpio/brcm,brcmstb-gpio.yaml           |  2 +
 arch/arm/boot/dts/broadcom/bcm2711.dtsi            |  2 +
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  9 +--
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 10 +--
 6 files changed, 106 insertions(+), 38 deletions(-)
---
base-commit: 8c3f4a248f35817d2f604c0e3df1bccf27590228
change-id: 20241128-dt-bcm2712-fixes-afb0e8a0a476

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

