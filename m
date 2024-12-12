Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CAB9EEFA0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 17:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF7F10EE28;
	Thu, 12 Dec 2024 16:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="rU71ALn4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6711010EE28
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 16:19:08 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4361f796586so10232055e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734020347; x=1734625147;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=;
 b=rU71ALn4DEwlMW0IH45r7/kkqJVhMD70teM4gSsvunwMYtHdlZiUZ90SrCzJc9COwg
 lpLyrjrfehkGdNNo8wwzPcYD9QKX6bBcPk3cLzzZqWiq/aHiwLPjhAHvoRxrNKakH6CW
 dIJB+d09eBGkT5awnCfbw7O/OcbZMb8rtsUhHzfVZnYd45s984DRa1codgEaNp8STs+o
 GV10j0w+zi++xvP7LuPvjgDat0qNTlXJvArNuGpAfIZzUPZ+/eGIIwVYoonNljJC17wk
 5OXSUbETWSlLPv+w38ReYgBNRWtmRsljw8bRC16f/TRBo/uLBeZ6/p8fuNsWWzhAJ3A5
 UZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734020347; x=1734625147;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=;
 b=l6W28yrGv0AwXa/s8XFGMpAUO1sZxIKk3EwIJjDg+bXHjSGrH/aQjIxN7cdbtLwn37
 Jm1nFN13IOWP61DaNjzQEl/VZO2Wfwrq81LNp/qKFr7CVnDM/2wUUIZM5xS38nthcXUW
 nQ3M0QkF2RwKQ3DvktMUO8FqRuU1KpuUVp46D09FslQwSfYVd+EpeJcMhv/+Rv1eimWb
 0LRAIBPj13PriI0HtcIwqgSuGSQZvy2BJ7pnUQE0zJpwziiMWdw9m+OhGU8k7cDR6kdg
 wuptl7T/yvw7sdpDs9ZwPDMgUMadTaG+J4tKlLl4NIywCU/0Qcg5lpxy6QkLNeiU5ZAJ
 GgRw==
X-Gm-Message-State: AOJu0YwnMKUxMVQ+hGyGHcWWhvJUMY6rYRQeQSKQ7rnlZkGQ4mpof7c0
 vSQwoF4LZ7aho8p9uEQ4Ix0o2UKpidUxBLVs78V8lauxaD1TyWwzf0wsm84OmWs=
X-Gm-Gg: ASbGnctRTwyjPh1DoYoWEXosJ/s1Xk1q4zbrPwu0L+Ldl0htn+a3nG0dfPIuhJJE+MF
 TpJiJh6NdYzCzSp1Rz8gB9lD+VZSmQ7UE2fcuM1+OVFy94N1p/trxU4gedKQQcaZbXI4cVWfpIF
 O3a3cwAkxMTp6BAzQvZfr83HeUFJi8Sid5TnX83/f51hmRqHeofqH98RlnijeA7SxjPFdqm9LMr
 d/0l2z57RHg+igUOkizx+POXTz1MbqqsVdpNkS158typOIO
X-Google-Smtp-Source: AGHT+IHoZqbjRY4dxkOhKOSnSfMy3sMqazkkzCHwzeDCSj2+qMUGuSSsMXf/szART5dZ1m3BKwwUjQ==
X-Received: by 2002:a05:600c:468c:b0:436:18d0:aa6e with SMTP id
 5b1f17b1804b1-4361c396ad1mr69550575e9.5.1734020346842; 
 Thu, 12 Dec 2024 08:19:06 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 08:19:06 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:53 +0000
Subject: [PATCH v2 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-3-35986e04d0f4@raspberrypi.com>
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

gpio-line-names is a generic property that can be supported by any
GPIO controller, so permit it through the binding.

It is permitted to have a variable number of GPIOs per node based
on brcm,gpio-bank-widths, so define an arbitrary maximum number of
items based on current users.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
index f096f286da19..fbd69b4cecc7 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
@@ -64,6 +64,10 @@ properties:
 
   gpio-ranges: true
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 128
+
   wakeup-source:
     type: boolean
     description: >

-- 
2.34.1

