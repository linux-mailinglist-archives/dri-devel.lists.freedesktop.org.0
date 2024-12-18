Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC499F68F0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 15:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8F610E193;
	Wed, 18 Dec 2024 14:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hlYgWnjj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEDA10E193
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 14:48:47 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so20285645e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 06:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734533326; x=1735138126;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDXweG3kfjLb98/KJdEpbSiDTI7ao8N9Ii+NpOdwthU=;
 b=hlYgWnjj/F6djkQo6HZ9TGv5kK2Tq8QDjyqpt4ymxi/Y8cFjcVN/D0UfayDux0Q3tL
 50kZcSkm2pbDOGWAUpI8TX2rp6cpXMiPJw5rBob+H40gs8LM5XINT6ym9wqYz/PqCc3+
 zdwfEDstvgsS1kQr5EvpVsV31s/ZYsOHmPIOGO6Suo2C6LkWV/IclQgNGKd0JfNlFqG+
 N5lNncCWFigqg+oefFJCyNLgqEUJYACYAUFUJw5J5qeeryDJ9tSlI526wQb0MY5swpQW
 amB68Tki80rbg4YPP/87aNRz+5It7Fow7/jTQSYR0mh8hPP4aXOroGLD3NYT2TWZiek9
 QtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734533326; x=1735138126;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZDXweG3kfjLb98/KJdEpbSiDTI7ao8N9Ii+NpOdwthU=;
 b=jwuQpu+5hwWrL2YmIFOO4vaEo4hA5SUTHRYMrpH4g1JE9A9LTZywJ+ggsL1qDJJvcE
 n3y+XkTK8kDbhWBtMM4jSQPJ+XFXZEMuIuxqDeN7t0EbxDzCWbJjGMyIuJD10FL6Ewrk
 n+QduX3nakczHKKMeOpRPR8l1u6XixnocZ20CIfmkHyeEZy6Z8eFXlAwB5aIJVKb6HXj
 5vsnZjqFsqgHrSKw/5lUbSrCoov/nBZCkmqLORO3jz2BhbA9/1uS6yCm+Vf105aBRNK5
 WlYMDpNE8rfDCJZ99E5oAq2ffWWA3YNzyR60Qbs/MpdXxpkPl/Ck+KwqR2NHz9a5fNmx
 6k4A==
X-Gm-Message-State: AOJu0YxojhNbs+SS3tyZfKextMeJrdkpv7oH5PO9J2Lwat24SIEH11+y
 VPnHK64v9ajtzPM2kQ4sTEC7dN+/T0hwb9f1d4PFJ4d08RHbzXqPjm5VgKAPHUY=
X-Gm-Gg: ASbGnctmDletlypzWRX4ZJy7ZqhtmerAPnHLqlF35Jc2VsO/SV1r3Rqdxzna1OMrK5L
 +W2qpHCzWb87ATdGY9+QJBdir1400FSfv0jhg9FEMefVay2NOQHHYq5HuZSIa+FPMki/CjrE6Zq
 knDkr1ZVsDad90mWQxTQNTxz90DEOf1glcqNFH0icxm9F4i1ou1AchEf7HeNvwODOqZivmEQsCv
 MQaUqdqcbi7Q4Qe24bbWxhvg/08NowdVLwBmevoEdkmqW6o
X-Google-Smtp-Source: AGHT+IFfdDvNqrmdKCha+Q3H8l6Dk2KAYhMhcpN6o1VocErcndhaGCI/5Ui3FTDsVOBZ1XMcpPOdcQ==
X-Received: by 2002:a05:600c:1c1c:b0:434:edcf:7461 with SMTP id
 5b1f17b1804b1-4365540c077mr31551435e9.30.1734533325609; 
 Wed, 18 Dec 2024 06:48:45 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-388c80613a9sm14165163f8f.101.2024.12.18.06.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 06:48:45 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v4 0/3] drm/vc4: Fixup DT and DT binding issues from recent
 patchset
Date: Wed, 18 Dec 2024 14:48:31 +0000
Message-Id: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMDgYmcC/4XNTQqDMBAF4KtI1k3JX03sqvcoXcQ4qVlYJZFQE
 e/e0W4KCt0MvBneNzNJEAMkci1mEiGHFPoXBnUqiGvt6wk0NJiJYEJxLgxtRlq7TmguqA9vSNT
 6moGxzCpdEqwNEbYDtu4PzG1IYx+n7UPm6/aL4dhjmVNGvXWldk74ythbtGmoIcZpCGfXd2Qls
 /hh+BEjkJGXypTAVMO8OmbkP0Yio5TVXsqKScn3zLIsH/vnawREAQAA
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
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Changes in v4:
- 1/7 Removed the duplication
- 2/7 Added "minItems: 2" and added to the commit text that the clock
  and interrupt names are required for bcm2712
- 3/7 Already applied by Bartosz, and 5-7/7 applied by Florian
- 4/7 added Krzysztof Acked-by
- Link to v3: https://lore.kernel.org/r/20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com

Thanks Krzysztof for your comments. Terms such as "widest constraints"
may be obvious to those regularly doing dtschemas, but not to me who
does them once in a blue-moon.

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
Dave Stevenson (3):
      dt-bindings: display: bcm2711-hdmi: Add interrupt details for BCM2712
      dt-bindings: display: Fix BCM2835 HVS bindings for BCM2712
      dt-bindings: interrupt-controller: brcm,bcm2836-l1-intc: Drop interrupt-controller requirement

 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 81 +++++++++++++++++----
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
 .../interrupt-controller/brcm,bcm2836-l1-intc.yaml |  2 -
 3 files changed, 137 insertions(+), 30 deletions(-)
---
base-commit: 29978a81e62128d2cee56f066ec92de584f4ab5f
change-id: 20241128-dt-bcm2712-fixes-afb0e8a0a476

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

