Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FA79EFB1E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 19:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54B910EE64;
	Thu, 12 Dec 2024 18:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="t96n+dwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B80310EE5F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 18:36:46 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43618283d48so7166665e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 10:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734028604; x=1734633404;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=;
 b=t96n+dwxdWXTsXlygwqJLijX0LsstX0EX1wmZW65jQ6taqsdrqSJ6ATcVIHwv//RH6
 A8eWfs46a0E2OS/Lb2kb+T3kmeW0DgGQwzKPiAmshATiYZG+QCWkBfU4OlYK2TbwP+d6
 TwcURrrG2VQkJG7n21LfQbzKpUUA0I9P5EX8rJOdLAk7y75TTff4D5t+cIK9zbYinHJe
 SbtRoQGU7x3D3gSJf/bRSLKkfZ96Y21QrM1bFHua32gyHmkW+5IilEaau8pxBjzfMTgF
 PkAAg/XkcZNL3BYV1GErLffXiHlUZcMY9xDBi0TPJQS/w9VEXRNsXzn2UugoMdeWCMJ/
 v69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734028604; x=1734633404;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=;
 b=E6JdzCfNgJvYa0WRdWz5ijOzHx2/UL46JQYsJWThfvcs74pap/PdXOQBmEXSiFq577
 fo6ZqwdjLkUkx+SsohSeumDFaHm7fJUHXnTJtAyBVNnGhRI8gmpo1FaJLona5qG6bhxZ
 yidmDozCSnJXNc9qWwASlFrJzA78X9y0A7j7vjMRst6miQg693xOE+OKuf65s2v3AJYi
 TOcXjZpTesyvJKo8t3wnSCdwhMLstbrqlcuEdtmWVKBovQJDdsolPXMRrBW51XVlblT6
 Oqv0PiLAUSy4V7QkUbG+LRc9i6c6ZgA2dFF4ZNFc/IKlDVd9pr/MmvIl7irIslBA9n7G
 S5Iw==
X-Gm-Message-State: AOJu0YwrIYQdxGJ95dETrJRo9JlhmNKmRJn1brsRVLQo0HzHBE95TpCT
 pugXRivOZ7Fsgj7JeRxtMRH8zByEkS7ZJxwqEPf4UufJcymeoj8C6kVpXKKixYU=
X-Gm-Gg: ASbGncviNNKkyS75s35rjaKQ0g5VAt44x0YHJxee3Z8HoPvAyePra6Odqrd/sNoRORP
 IaCghp19FrQWNCl3fvpfhy3/43dkTLNjtou2dgBbq+LXa65GceSG1bGKdU8zM89BS2Ji083HNQI
 5I4SjS39LDFpxiOXn849SbLhHf3B5FIVF6WIPBcrTj2CtpghDpwOcWDJrTOjQwKH0TN3uobxp1/
 Q+tyzDkIO1Ra3q35McQsj+b1W1K3G3322R3dCtwzRHYfQnh
X-Google-Smtp-Source: AGHT+IFExc0XA8Xy/C4Mx5wK8VZwnwxFl/5BahFWH3EA4rW9cmekl8fnISqr+JRBJqWQX6UGHfnMOg==
X-Received: by 2002:a05:600c:4450:b0:436:1aa6:b8ee with SMTP id
 5b1f17b1804b1-4361c346a7emr72222265e9.2.1734028604531; 
 Thu, 12 Dec 2024 10:36:44 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 10:36:43 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:30 +0000
Subject: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
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

