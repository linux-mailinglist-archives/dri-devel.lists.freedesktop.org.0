Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC49B0AB6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C01610E3F7;
	Fri, 25 Oct 2024 17:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="EYB0FOlw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D19810E3F7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:08 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-37d4a5ecc44so1445772f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876567; x=1730481367;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N3D0msUfHXMuv4C1SeqQ0nPQBde1GE17PCvfA0szIc8=;
 b=EYB0FOlwSQiJDPWjBLYQ4HwqN8M0hjEKK7+hWjc+yFmA4aYaswDEYFSbxLX3eXmFCv
 McTOGk3ugj2jYjaz4ndSBUUS6TmZZ+6R65AE6qqsYBYs9SZQJSvLw4QdJKBWdqai7O9q
 4KA56fin/PR5p/FLGLSiPCsY5hnpj4+Pxt7Tz8IvzWGxghDl3SIvKEKiV6nvM/ULqivv
 x+X9UbGzkByIkiQmTfNe9D9hr4kKWevehum35O4Tiidh3WyFsY6wH33pJa+nu8SQ9htF
 2d742O+1ZTvpCS5rtNV8G+YUJXCeVx/ArBhEEBFjpEHkjy9Ncfd5go+kmZzlU4YUAs8m
 Tg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876567; x=1730481367;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N3D0msUfHXMuv4C1SeqQ0nPQBde1GE17PCvfA0szIc8=;
 b=VcZkUqsnPD0Vy+4FDzrK/bLXEANpxv5Ett9X8XaCzUCuYrPQPg/816ljTw/xU/C+4D
 VH8VA1wLmm/SWxaREDdsXi4KfE/Cxoij8FXkXHSiFLqlWUU4cih7daVcIGvrZmdhPFqN
 g8OXgC+9+9btc7CkqSPbnim6xYwYz0pERiFGPbqIN3z49X5z8D2p5wrIzWiV4D96iZfz
 DkM1e94pyajCmBQEsdngfA9J/LensDTt9gBTKtgunIv7FwmupdwPijbCbXOk8QYzoTes
 4YRUYm4kq0ojISl6jvclvgwiIVx7kiIWgRcR27yRHc47KeJbRsoAcJpoOKiYobt8hozH
 JreQ==
X-Gm-Message-State: AOJu0YwjM5Srn97D+BbSovDt7Kds5zTEpti+zie8fIjKyjnymttlTrge
 KXThFcFYWNrmt5+7JwJ3icAQqAvvQt9j/NNzAlqOgB6Vx1ZHqR/wrGmwAK1Qj6w=
X-Google-Smtp-Source: AGHT+IG4wS89LpASUknXmvnY5DCWRnrRky+UYDTB7/8M+xpU5UpHS3oldLC31P65rzLuem6Jwptv4w==
X-Received: by 2002:a05:6000:c90:b0:37d:511b:aecc with SMTP id
 ffacd0b85a97d-380611ff90bmr97416f8f.54.1729876566840; 
 Fri, 25 Oct 2024 10:16:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:06 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:37 +0100
Subject: [PATCH v2 06/36] dt-bindings: display: Add BCM2712 MOP bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-6-35efa83c8fc0@raspberrypi.com>
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

The BCM2712 has a MOP controller which is basically a new revision of
the TXP.

Express that by adding a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
index bb186197e471..c9c08042cffc 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm2835-txp
+    enum:
+      - brcm,bcm2712-mop
+      - brcm,bcm2835-txp
 
   reg:
     maxItems: 1

-- 
2.34.1

