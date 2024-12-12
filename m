Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD489EEFA2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 17:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373AD10EE2E;
	Thu, 12 Dec 2024 16:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="nlhOnvr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863D910EE28
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 16:19:09 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43618283dedso7602085e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734020348; x=1734625148;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fMHTsU0ZjvRQjwquvG/Hg5h2182Nwlr0NKl2ofXPRL8=;
 b=nlhOnvr5kAuSqdgpaqM0CN7grALGLIRj32du37pm+nddrbpR6oMnDfqIm+9/k12a65
 pw1DtexdtEAi7XI2GJxtXnlDKvSillrzKbd1BSoiIg0t/L7f0GFTZJX4QIpzWSNiOdO7
 OdZzbMZwQIime+C8ZcAx/U4LZrj7lDx1d1ino5NBjnusYZoL5R7v5xMjEllizg11ulbg
 xQauCIMs4T4CjJdK/u2StMXLDF3iIA6ZWTSZANKaatSNOYptG6gDQzl7V1fHETUW1bLV
 +syl5TAVOBuQhQpXJQJpwfmyXmy1k6jub3S9zclEhFWGYLZNR1gx1MAuC4lO/Ddb7DUA
 eErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734020348; x=1734625148;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fMHTsU0ZjvRQjwquvG/Hg5h2182Nwlr0NKl2ofXPRL8=;
 b=c3Hvw7SXBpNVqHSD3EJy4IRAcRmX63G6jwdoCr/ePN88rGKcg+zn1T+Jf6r95Cv2zu
 VLoVR4W1BMq3ikqGmayP21drJDRlTWa+JuYfkruvvFKgd7k4keHF8ceUKAb5KaHxRHbr
 /UVtY//JgmFdZ3Gy/aSNfXgpLsCiQRnqaHAGcMtSJRb9Wvwys0B5nKeGnFu0OacOCJ7F
 uYoX7/3AWQMvmP3C7JeDoJQkm3+EQP2PJOlAWqbarg+TaD+WbnqyZZG2lvn3Xs9Rnbdp
 B2yVIKFgsWZy0CBxL29kzPfpJ682BgEeBpx1LHwuigQwo2ZC8i5YIrFWZi/qNPfxdVc5
 fSEw==
X-Gm-Message-State: AOJu0YzFFUXw/eTv7yypS2gCoh31n63Fa3mpwZDn/P1TR5oIDiWlmp1P
 megBaX5j6iBW7FWRaPhyCwJ26ZCnCGVbMmfz4awztLdpm0xinIrysAVr2UC0+UM=
X-Gm-Gg: ASbGncsVubgIFtEkTkMfqjY8m6nk9gcO5bIyfW/dk5BX3UhQBbnJMip09TBG6XQrEB/
 er6zg8zBNMqBqTq+cBsAaDpXM4f6c2tmL0A+q6heUp7RK0cbDofUwyRMdmrcPP1wYzZT/YRovSj
 FQzIEk1Z1upnWENtWpYmlaRZduqqEN3nknQrzZwcA5veaWT/FVk5T1TbsQJyWXYCl/oStSLsltQ
 NxOG7uGZXgfJSVzS2njS6rYLOcDmsUyd2OT/wjXvo6KDhiB
X-Google-Smtp-Source: AGHT+IEW963IsJu+5kmA4Oes4+Y3LvbmvGkTXDKtXSMQMJQRuXOcNzh2GjScR8bf2D3ZBqv1bcGbwg==
X-Received: by 2002:a05:600c:1c82:b0:434:a815:2b57 with SMTP id
 5b1f17b1804b1-4362286399fmr31867605e9.20.1734020348074; 
 Thu, 12 Dec 2024 08:19:08 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 08:19:07 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:54 +0000
Subject: [PATCH v2 4/7] dt-bindings: interrupt-controller:
 brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-4-35986e04d0f4@raspberrypi.com>
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

Since commit 88bbe85dcd37 ("irqchip: bcm2836: Move SMP startup code to
arch/arm (v2)") the bcm2836-l1-intc block on bcm2711 is only used as a
base address for the smp_boot_secondary hook on 32 bit kernels. It is
not used as an interrupt controller.

Drop the binding requirement for interrupt-controller and interrupt-cells
to satisfy validation on this platform.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
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

