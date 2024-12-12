Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216C89EEF9D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 17:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E6710E279;
	Thu, 12 Dec 2024 16:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="qOc0DnVH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C557310E279
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 16:19:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso5524705e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734020343; x=1734625143;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=68JInAhAW5Is8mwm4BYMUDXa8RJRJvDNCf4zhjotoGo=;
 b=qOc0DnVHv21pjLEY4+PVHFk0vaXpcHftbAgSZLMzqWdLL/nk+4Y0znh7zHiWHyl+nR
 Nw4FNHiojKKkqpVCosh9DlgPx/mFky71FK7kJ27OiwPmM2RFIVLfWjBNoBOq95CSes++
 46lOpl707Saxn4pplX0QP9pfMHeWV5SO4BWdP/9YP1llvGrxjh3me6lPtmA1hPmFL8Eu
 m+egIntTc4/uyM7ABs9Ro0RqrGirOV8k9mgIAWQTEibe3yfZm7zIeJTkhQsilNLHudET
 FtgiZXNzCadEwRm7/hZtH+CjF66PIQJfF6DzEW3Mqm9eVAOJC5RlrX4kAwgqqshKw7ak
 33kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734020343; x=1734625143;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=68JInAhAW5Is8mwm4BYMUDXa8RJRJvDNCf4zhjotoGo=;
 b=UhW6giaakBzkeq4IOM8aJQrch8bX7Sys4rsP5G9cnOVAYNgt5Ys6OFkjEgdtebrwAn
 En/8Yrn7SRcWP37GUClTDQmP8+QJvgYwHpDIa2yPWpre25tYe0z0wbJctj7qAjOkinn6
 5vo0W6NmwYejXDxSVSPdknI3dRRJcWPvAycE0BsQI3xvdXpF841gh0qFENEroE0yQ3Ug
 8fXT2/ZeuWmEhnSmy1vF+9QxbM9/ccCyXUFQWiQZ3TR+Q/RXPrTLDwnCJn3JIp9IpRAy
 41fsOKOnyQlwoDwA9YGWuqwgBKR3xzof2gdbGuVyGtFbhjuYa39eMwvvEnw5Yty05Vl5
 rX6A==
X-Gm-Message-State: AOJu0YyI1CcKfIeE/j5f89ZpKEeo0wlPSUS4LIZzy929Q9HpQ5ya0bZ1
 hXa4CwkxbrKK9C8BVYcocXLl9Va7CULchcY1rSp1t7BhwDXP/LxTBXShT6V+wXY=
X-Gm-Gg: ASbGncvuRHNSG8CymKUtwANtTXE9TANYKUmLciGZ47gdQvHkOknjH4MKyKxBtO5/lgg
 u49Ot9ltvYY1iDhfzbNNS8vObc7GAXqtpzHOL3XoicRsql0pSpng+NdbvAC7qxsIRLGflI51FNC
 V1zi5i8VXhZI1heoYb6w/YKDt51YOITXy6XsJi/gIiN9aDgk+WMhvKF33Z1YJMD+Nc1jIzvUI2a
 SV5Ol84gjw11k7E9Q+xSdeksFuU0WBPqMfGH6hX/wjpxbur
X-Google-Smtp-Source: AGHT+IHBf/CkYwwV5YCDCoDlBGs3t7DJrHBFw8STBH4yNhFZK8NKI7+uk6ZO9cjpKuabgBSSS8Q7eQ==
X-Received: by 2002:a05:600c:3acf:b0:434:a802:e99a with SMTP id
 5b1f17b1804b1-4361c346253mr66269165e9.4.1734020343031; 
 Thu, 12 Dec 2024 08:19:03 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 08:19:02 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 0/7] drm/vc4: Fixup DT and DT binding issues from recent
 patchset
Date: Thu, 12 Dec 2024 16:18:50 +0000
Message-Id: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoMW2cC/2WNzQqDMBCEX0X23C3JImp76nsUD2vc1Bz8YSOhI
 r57U3vsZeCbYWZ2iKJBItyLHVRSiGGeMtClADfw9BIMfWYgQ6W11GC/YudGqi2hD2+JyL4z0rD
 hsq4g1xaVM8itZ5t5CHGddTsfkv26v7Es/2PJokHPrqqdI39r+KEcl05UtyVc3TxCexzHBw0Ef
 TW2AAAA
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
Thanks to Stefan and Krzysztof for their reviews.
Hopefully I've addressed all points raised in the correct manner.

Changes in v2:
- Commits have now be merged from drm-misc-next to linux-next, so all
  commit hashes are valid on linux-next.
- 1/7 Removed references to "previous commit". Fixed up indentation.
  Added maxItems
- 2/7 Defined widest constraints
- 3/7 Added maxItems and removed reference to Linux
- 4/7 Described the errors. Split into two for fix of node name vs addr
  being wrong.
- Added new patch removing "required" for interrupt-controller and
  interrupt-cells for bcm2836-l1-intc
- 5/7 (now 7/7) Removed the intc node for 2712 - it's irrelevant on 64bit systems
- 6/7 dropped as updating the binding is the correct answer
- 7/7 dropped. simple-bus claims ranges is required, but adding it
  creates other errors. I'm unclear as to the right solution.

- Link to v1: https://lore.kernel.org/r/20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com

---
Dave Stevenson (7):
      dt-bindings: display: bcm2711-hdmi: Add interrupt details for BCM2712
      dt-bindings: display: Fix BCM2835 HVS bindings for BCM2712
      dt-bindings: gpio: brcmstb: permit gpio-line-names property
      dt-bindings: interrupt-controller: brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
      arm64: dts: broadcom: Rename bcm2712 interrupt controllers
      arm64: dts: broadcom: Correct hdmi device node names
      arm64: dts: broadcom: Remove intc controller on BCM2712.

 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 107 ++++++++++++++++++---
 .../bindings/display/brcm,bcm2835-hvs.yaml         |  83 +++++++++++++---
 .../bindings/gpio/brcm,brcmstb-gpio.yaml           |   4 +
 .../interrupt-controller/brcm,bcm2836-l1-intc.yaml |   2 -
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  13 +--
 5 files changed, 170 insertions(+), 39 deletions(-)
---
base-commit: 3a6b7ba51f16c093420959ab2bd3476d180547fa
change-id: 20241128-dt-bcm2712-fixes-afb0e8a0a476

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

