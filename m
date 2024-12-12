Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195619EFB17
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 19:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC73C10E648;
	Thu, 12 Dec 2024 18:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jmmlpop5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB76910E642
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 18:36:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so10130095e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 10:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734028600; x=1734633400;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fv3fbXAGrIYdfjN2UmggTGBbw/plczA+5BniWAkzYYI=;
 b=jmmlpop5YmYzbotTW9sh/+qGQ+XGyoLs9/z7fCt10aJSQJYl5PU3MaMtsypod4iXO8
 yBIv/RNytHFxPWaaYwNgYW5AcsXu5UQbCIo4NNiCPb7oK/24+4uUgHUdO2msGy0OhL90
 SgWt9brfADnNZamncnL5Hbv/aU1v0Vk4D0idmQl5OfdbQQ3V+yfjMXBOw1ezBSp+lmW0
 IkYGEz49rTEhQ4+XR8VA0GqS0lDthdq2B8m3FSjMc3V5EcqWFtwKwqgX8TzqkYTNcI5a
 OOzrYdUp3ZixKz9FXMYu/jTQfNLBxUI3uzg+TpyHbpLc4SdO2wtSLEOKqtbmgh/VpaX2
 CGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734028600; x=1734633400;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fv3fbXAGrIYdfjN2UmggTGBbw/plczA+5BniWAkzYYI=;
 b=AGfHzeHuQYW9/BCf2JCQ11lKxfiNCPLlF4Fg6Qx4wqK611gk+K7KELXYsUkcCb3ilu
 J6gcjOgE0anayf3XjYBdf/U4c8CkdZus1bYnOCA3May+7CXZbYNRR2gR16NFaJlOxj8k
 k1bBNjMc0x9LgZEd93fxcIalbn5EyVe1gwC/caBR8AW3Gc4pJR+od+0qioefX96vIj4h
 y5p+UCSu/4AZxKj1xlRXJuGMJ6/KQ6sp8vDkNr8zBUPJkv7oo8sj+JhHa0TPLLGEA5MA
 boxQvZh4xGRy45DFpSivg/4lrRa/8Mp38Rz/sPeZMHjQi2qVtOSFTt2mXwVKVXJkB6a0
 8g5w==
X-Gm-Message-State: AOJu0Yyb15ORiGcClscj1crPgalMCTb5rJFG1SD7ybH4iwir+SVjLi6Y
 8KkvWdG5PYEKP5oIdrac68oUbQUMx0xG9hGjl9TfnXAJUFBp6EKOgVu6UlrPtVw=
X-Gm-Gg: ASbGncuRuWVGpPzc+ub4SX2/E+Bg9Hi4Nv0JtTvOTI0A+SkkH0K5ztFGjSrdUCMtouB
 W1vOiUV1CkVYSg2DR71UsTvJ201IWQF8n7smPSH+W7EUjlFxNOkS9QwMvxKZrjl9y1ktaNOkaGR
 XeUnuRKWxsGb4xnbY/10BzRyFXQbzN4lLtjZMhIeUDRjUi5ape3rW92iumeXo1JYWlWh0YaLFm/
 HJUG43LL50hK10+FhnFFtA9qXuIwcx8tDM5odTIdJNLTShY
X-Google-Smtp-Source: AGHT+IGhmyt8mpOnXb+dJ711Uf3mlUnOYDVx9MCQVeQjzLSO7tEtY0jrOPhc109rLLEz5hKiOUUacw==
X-Received: by 2002:a05:600c:4e49:b0:434:edcf:7474 with SMTP id
 5b1f17b1804b1-43622883cd8mr39949565e9.33.1734028600168; 
 Thu, 12 Dec 2024 10:36:40 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 10:36:38 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 0/7] drm/vc4: Fixup DT and DT binding issues from recent
 patchset
Date: Thu, 12 Dec 2024 18:36:27 +0000
Message-Id: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACstW2cC/23NPQ6DMAwF4KugzHWVmBQCU+9RdQjBKRn4UYKiI
 sTdG+hSiS6Wnq33eWWBvKPA6mxlnqILbhxSyC8ZM50eXgSuTZkhRykEKmhnaEyPpUCw7k0BtG0
 4Kc21LAuWapOn45Baj2fKnQvz6JfjQxT79oulccaiAA5Wm6I0Bm2l9N3rMDXk/TK5qxl7tpMRf
 xjxj8HE5LdKFcRly608M9u2fQDf01M7/QAAAA==
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
Changes in v3:
- Fixed up indentation on 1/7. (I fixed it once, but obviously reworked
  things and lost it).
- Link to v2: https://lore.kernel.org/r/20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com

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

