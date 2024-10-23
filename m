Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E2C9AD15C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F05C10E1F5;
	Wed, 23 Oct 2024 16:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="nezpsAcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE6110E1D0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:13 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so95856595e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702212; x=1730307012;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UraO/WfabHwA0kcDmdostvPDiMjVW2AKFSzHSQZmNBs=;
 b=nezpsAcb0JqqAjnE8Q89SgzenghVdOGa3EAMVrl5YcKwjKX6J7KlNZnjUeJQEhmMbV
 +PAGljgze6jS2vKF3CzUg/KxjXDQQXNGxU/mo99Wr5h9I/xUhUB1W1F7oIXalK5t+0vr
 qznNGxSh/DgAWFAosUefvt71KkLMj69L37mkGpsMbXr5MluAGCcso915bjx1D7Jmfa31
 kzCjvydoBXY4NCRrImZOv21mJTy+VKUONmd081dAGw6hwNS3EwETfFk5aI4730bzemyI
 Cu0gV3jwOUA/XLymgz54MUTcv60RaAk4DvFWVf8Ys+oa/rQWVsgZpRvKbeAFMlpoXkZH
 BV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702212; x=1730307012;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UraO/WfabHwA0kcDmdostvPDiMjVW2AKFSzHSQZmNBs=;
 b=vqAUfu/kRSH3ylZLTskV740hg9Yc9IgIPtWWIxZVt1kw0BUglatyZ/4OxcyOy3mwCU
 vRj19SB6iZlRwp9pb7shZcDQnfvkbzNJvi/bhooxZw2WbY20OQ6lIoa4T+UMSF1H8/0Z
 CEXPas++Ue94kJfO2guvN6bBLRnmmiO1Jpn7w3vX3WU3udqLLbs4xLJPmoP+FUwIMoxJ
 zy+RLGnxCYiHK6WxbP2CKHDOXpnsYspY0oOE/UkI+NcGwopVzAjTzJ0JBTK86DsO2VZT
 PZdEEOezFWifHN/kGHm0C2yDxKfT+uwwRDsgDRigMspItUrd4uWpT1HvkmS8NrxsEJ/1
 x+JQ==
X-Gm-Message-State: AOJu0YwyVR2551WAVOIJVekIZ36gFZzjot8RpAYWC40BTouImlPAYYF8
 jKbEzuO6N2n42yifTpjCIEgvABwp0q6IN7Ycg7GdPL/Vpos89fgdAfCrT/6uFj0=
X-Google-Smtp-Source: AGHT+IEZ2TQIiD2rD7dtSbDNYkDUqcAgoqtisqjGeExVyCYGMYZ5lugyYr5OzlQS2JdAABbh9QpYMg==
X-Received: by 2002:a05:600c:4ed3:b0:431:5c3d:1700 with SMTP id
 5b1f17b1804b1-43184213763mr34326675e9.21.1729702212298; 
 Wed, 23 Oct 2024 09:50:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:11 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:01 +0100
Subject: [PATCH 04/37] dt-bindings: display: Add BCM2712 HDMI bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-4-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

The BCM2712 HDMI controller uses a slightly different HDMI controller
than the BCM2711, and a completely different PHY.

Let's introduce a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 5b35adf34c7b..6d11f5955b51 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - brcm,bcm2711-hdmi0
       - brcm,bcm2711-hdmi1
+      - brcm,bcm2712-hdmi0
+      - brcm,bcm2712-hdmi1
 
   reg:
     items:

-- 
2.34.1

