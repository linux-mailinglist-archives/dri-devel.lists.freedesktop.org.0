Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FAE9B0AB8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4AC10EB2A;
	Fri, 25 Oct 2024 17:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="QZEUeo48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C53710E3ED
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:06 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-37d58377339so1728570f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876565; x=1730481365;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F7a7/HziehwTjKT233D/IuQwrsCio9lv2e2bEhcrly0=;
 b=QZEUeo48xfKbvm/wG5rpTL2AlGQod1L7QwjDhNFeFVPvei3q70kZApuu8nRhfR8ZKb
 j7/Jy/GxXAAASbGaxTWtojYQ25z5/3+1ZJ6QxVyTBrgdjXvrHS3umMOjh2FBWk2GzVq8
 dVWinCtmgZpk/ACij9V7XFd3bo3xrsoMRb5Jpk1pDohsl+luDe408d7lYa/T/wYd37Bl
 c/TNrhrUUSr2Hphj4Nhdcyu9fSoAwSuV5dbEjGpt1J2+Cw4U2UdAviGc0F4ztRYtQwIV
 QtDl45HjuD5K6UVB/UYD6FJfFQp1JokUM9K5SdqLd0uItCQM3TOyJPDiWn2/pc04rkik
 wvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876565; x=1730481365;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F7a7/HziehwTjKT233D/IuQwrsCio9lv2e2bEhcrly0=;
 b=cahd11gZuTp3nKyhQjiDfR/pIZdB2Yy56EboFhBtmNTUhDOQioPfqN6WhESX7GTAUs
 WizJhMqXg5D9w1+iZYtBj7WjF3xOwcwu3RCsltaeuIKPO3WLZDT6mdHxpLtNYEOwOGNN
 6y7UF/TNGTU8/rmOWHD76l4WLy7vQnhCLBn6J6jMnpfcad5BWhlIKdKnlHw3t4p8olgz
 zCArhqwPKu9SnuHxGK2Qm2SvRo62MgM+WzRjH9buo54cVpkuH37vPJ1IGrhz25+9Hxj7
 QyfBunTMzRn2o8bz+8/7xU1/m2N05tLmkAqxSK6STfdA+5T2gf1kwf8/6ySHySrKEnSQ
 rw1Q==
X-Gm-Message-State: AOJu0YxWFiBFH0aMHkMGQMkcd3YsyYTBFDXgHRWtZvJWzAtVfruhnV1D
 jZReEBQrPecr0lXbTXJV1z8ncT2JtjNfjvvppgZ98BwC/++GCWzHZj0432EKXDo=
X-Google-Smtp-Source: AGHT+IEFF/mt9prwLkoO/wBDShJYk4RCDN1nX+/N8QkdDrkFHXlIdTeqdVrZSLG6RmWbSoiHWDwtlg==
X-Received: by 2002:a5d:4106:0:b0:37d:612c:5e43 with SMTP id
 ffacd0b85a97d-3806101335amr193017f8f.0.1729876564669; 
 Fri, 25 Oct 2024 10:16:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:04 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:35 +0100
Subject: [PATCH v2 04/36] dt-bindings: display: Add BCM2712 HVS bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-4-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
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

The BCM2712 has a completely different HVS than the previous
generations, so let's add a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index 2e8566f47e63..f91c9dce2a44 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - brcm,bcm2711-hvs
+      - brcm,bcm2712-hvs
       - brcm,bcm2835-hvs
 
   reg:
@@ -36,7 +37,9 @@ if:
   properties:
     compatible:
       contains:
-        const: brcm,bcm2711-hvs
+        enum:
+          - brcm,bcm2711-hvs
+          - brcm,bcm2712-hvs
 
 then:
   required:

-- 
2.34.1

