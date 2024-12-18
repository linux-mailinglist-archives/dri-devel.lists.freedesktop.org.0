Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 718C69F68F3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 15:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E2810EBC9;
	Wed, 18 Dec 2024 14:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="A9h0caAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3A110EBCF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 14:48:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso36083105e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 06:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734533329; x=1735138129;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=;
 b=A9h0caAhWbCuGnqCAayR8reaNzsXoWzgKfyaShnq1PHizxdemC65+JegOVg6w3+RqC
 60jEumef5STgyZpryecwcoc2tsktUydYVGVvLTT4zq6Rem2F44YR+6Wl7vz892mrflld
 wgyyPf3rnSHK/9TvMvuucMMSUWrNQFXT6x/ehf1qcEu4OsfLjilw8/wOuP4rDWBj+CzE
 /ZWATrwpai8CWX+jsJS7ldin2x03xB5EiKEjsnz5ZSoLaKc4z0NJZiVD+zI5r8sF19zc
 6j/ff0SEkZI2OYb8ovZQl3fKzIAcSmAJMGmoB1bKS3RbMwed74v9bAYLh/j+fFlNOAWV
 Zqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734533329; x=1735138129;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=;
 b=BSwMllr+HGP/t07uqLJBqzNsnTGt871X2y8AoJ6/HPnTIFDLUKOBA+kJBudjFpVohg
 jBsJvzGaCcqtIcxsiWXOPsY57WK/g5l975M/YuCc7cTTexDqvqmg0sji1CjJsPtyhTuX
 3ANeIZCP4ijiQbqCz9liMMOKhpv+PZeJYIR490AwdJeyjN4CI/yaG06MZEes3wyNP6Y7
 I+4NbAgV1x2uT/qjrrgvQIMHaUStRVCOqtgPeK4Dtnk7aKkvP3AQECIiSLl7p3U7zca/
 ZG7kosa9ql1Qqo2T1R/b4IgvxDpIkpn2LZbUtFdUO0kksNbTG2IE2OUF2uuquL0iaDpM
 wChQ==
X-Gm-Message-State: AOJu0YyoAz7T/Zam01RTa+/zjtfi3HXtSh/EDN7DrFkxcreyPHDR9hlx
 8bKKT97NsN/kzZjw7KDZtG1V2C8kBxRwV9qrzQy4qP7pQT1Iufn62uBu9giIunQ=
X-Gm-Gg: ASbGncvdm6Py7u2+cAX4sBkFse9HWt5Q0aMsrkWNtz0MGy/KVjs+SfyMTJzHXUuWwLC
 j5lNYbMYj4/iFLmjjPORsTO5WdZEus6tjGcirVEgvt5+BlfHWSgTOLjH5fBBjdR9iMcQb/2Mhaz
 gexPneBETnr6cjjB3zw/6B7Iw7Nkf8LLG8b7xHGG1V5+m1Lyi8sxroF8AmKOQQj2lznvqg+38ze
 R1poMNYY/yU6IBcwzNrOW9hPeUO5uaitQ4XgL5GROFwlCV2
X-Google-Smtp-Source: AGHT+IFUOlaIMq0ju4X1pMuz5qrQnXVsaODM2WgRs4TsUqex3ceWQT/oN7hnGqCDlfDO4YNtuXpslQ==
X-Received: by 2002:a05:600c:198c:b0:434:f1e9:afae with SMTP id
 5b1f17b1804b1-43655345207mr24910305e9.1.1734533328637; 
 Wed, 18 Dec 2024 06:48:48 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-388c80613a9sm14165163f8f.101.2024.12.18.06.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 06:48:48 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 18 Dec 2024 14:48:34 +0000
Subject: [PATCH v4 3/3] dt-bindings: interrupt-controller:
 brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-dt-bcm2712-fixes-v4-3-54cc88b6c229@raspberrypi.com>
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
In-Reply-To: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
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

Since commit 88bbe85dcd37 ("irqchip: bcm2836: Move SMP startup code to
arch/arm (v2)") the bcm2836-l1-intc block on bcm2711 is only used as a
base address for the smp_boot_secondary hook on 32 bit kernels. It is
not used as an interrupt controller.

Drop the binding requirement for interrupt-controller and interrupt-cells
to satisfy validation on this platform.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml  | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
index 5fda626c80ce..2ff390c1705b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
@@ -34,8 +34,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupt-controller
-  - '#interrupt-cells'
 
 additionalProperties: false
 

-- 
2.34.1

