Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734449E0508
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A289810E768;
	Mon,  2 Dec 2024 14:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fXguO9YP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D353710E770
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 14:32:19 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-434a83c6b01so37615455e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 06:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1733149938; x=1733754738;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ezuuCfz4dXYu4hmKXltppQihukLHouMCBa2+WZneZxU=;
 b=fXguO9YPHRKfIyI1I3IoFWcrjq4bQe/WpXh8VwSsbMKkShzK+KYjt+5qnMoUHCkMdI
 IGUsI73450+b0hCUyheGfwLEv5I8klEM8RQGLYLsf3BAkvGyK9SDXN5yuVNk9ZK3TwCb
 LolVbkEZyVQi9DoDInxjiMm/zyCeiBWgnLoCuylv2TzfkWEgENJsaek2w8U3sv3s8Yrz
 wqOuge1ps79UHwwD0kCsWdI1HkBxfgtCaJeHEttFYSZbqLAN8q2VAU5UwUAz342/bzkX
 kVZS0ldKyswCueNg/OP/HcCcrOySANnZ5U58AQZcJRMklMoCJvfyQyh0NE6yAYX660/g
 8drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733149938; x=1733754738;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ezuuCfz4dXYu4hmKXltppQihukLHouMCBa2+WZneZxU=;
 b=Cwn36mkY7ycPSuA33fVec2ztWMz8i8rqAPqvBIKvI1OWxuWFu7/axtB26VCt/Yqg7H
 p2FeQo8YOjGjCnSWr/ie54cCdWKHsDmlkPpSEbG55NkqYH0lJYDOl/l9EN80XJXAK1MN
 mSVi7ecgu/Vr9dLnHbhziawrSMWMNZcXEB80ELkT8tLKvAHhZD+xd+7hMmXeMGbTfKz+
 TuiK3hFBNia2QFPM/RhX6oNnZMaStzDM0tL4Jvj2+4Vbxskdq6v18P0osa4mFd6NwRfM
 O11GHBAG+wKA2kdTwgIOSUFrTAM3xWwpX8cVNW458RtUxpR7YxTiFfn1/5i5cKphCqaB
 v5FA==
X-Gm-Message-State: AOJu0YwI5uIgieSxzCywrLuwZpVBzhZ/0/GkUxJjICXjlPJeNSX8fU4X
 pTw8XO7XTWbj8wx73FvPG1/5cB6TpazxD00dF/kg0+9P+LnpgEtFXT6yOGVOkJ8=
X-Gm-Gg: ASbGnctra03byaGorJy6hXHvJ1APWZ9unlk1NnIuG5dBIv5/XUTj5Pjx9DUNxjWVpJi
 7LFkrG3jHdcuBOPU3z8b2oT7G4uyvv3pzzc4KXaLwRcd0z/MGDyBz4n65TM8w1MtIKVWlQJsjkO
 5h5eFIgEPung4LhAA2JwU8IihCrwMqdhK1H/r/Yn2i4HLZilPhT+Y55tg25i/bk6Ndv4RQ1uRdd
 1a28yBsFUKWaf+QBVXXDPDyd8CxB4hoFmeKL8T20w==
X-Google-Smtp-Source: AGHT+IFOZoOXIOMn7ZNkA2Tq2IsupVCxJJKuWUAQoyj7TMD84BgwJO2qsC/1IZqo9dXxiJ/IAPakGA==
X-Received: by 2002:a05:600c:474c:b0:431:5aea:95f with SMTP id
 5b1f17b1804b1-434a9dc824dmr223443175e9.16.1733149938198; 
 Mon, 02 Dec 2024 06:32:18 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 06:32:17 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:31:56 +0000
Subject: [PATCH 3/7] dt-bindings: gpio: brcmstb: add gpio-line-name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-3-fac67cc2f98a@raspberrypi.com>
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

Support comes from gpiolib, so permit it through the binding.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
index f096f286da19..086d016df6ef 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
@@ -64,6 +64,8 @@ properties:
 
   gpio-ranges: true
 
+  gpio-line-names: true
+
   wakeup-source:
     type: boolean
     description: >

-- 
2.34.1

