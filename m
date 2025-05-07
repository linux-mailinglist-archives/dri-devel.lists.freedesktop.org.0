Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B3AAAECDB
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387EA10E8A1;
	Wed,  7 May 2025 20:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XP08z0Ix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8208210E89B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:34 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-72c14138668so73955a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649354; x=1747254154; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=521t/CeHAKMYn/pwM/BkFVrSOh7CwyL/JsWX9K+z/SM=;
 b=XP08z0IxG9+27zNaOTO6+nlf1Rnyf5d6MjhTojP0RIgRHqdV8dPdj5AkbBv0zTU+Pl
 thfDndbdTxP3y4BCGOUt1Q9hKOAbVNVgMj8wEqMR9s/GWzviLyCSCcM0oEClT8HC+1TZ
 mYiTD809by/uVPRN4rjtbu7E4PzJ5q8v+joNi3Fp/HrFI7hU+Fj3zJIEbsSaSuk+CuWR
 D54bGj1Xr+BRGBUrZ5yDP0NtE+0BafTyVswuu2/GyQESxoB5F0JGjzC2S0e4cjpZm9K1
 UO/4XkSP6B2bpZZ7fvKzE6oX4D+xpZjP8/CSDEYpMbypKuE+MWUrmd3i3EyYhN9KCFsC
 eS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649354; x=1747254154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=521t/CeHAKMYn/pwM/BkFVrSOh7CwyL/JsWX9K+z/SM=;
 b=XqWgIXsj6NX0riuGUym8aM7B9TbOH5mU50gvGR/ugL7ad5TFtOtlL3ewHHfOY1beiQ
 ULb3EpFbZ8xDhv/kRKMB7n0AdgpJ4eHCECXwaGp/cEcMmmmInCaPddqqSngQhoA36cz5
 fpqz2rBWDO4qzY3O0Ro+HEyxieH/xyQT69I2oGxGsCEicuZS4m/NnRGHgFi2B42dJH0c
 EhdwxqAUXU6mWDOiNuQkjcKViufsSiWvIlgruRI92c+uNUhqBhVRZmyRf4CkyXramp37
 sIm/fIm73wZIMqu1APJkfYwYwcoEte/vqih2zyi9LdadHqzxRUlHA7+wMYkJsH2n7BYl
 MDnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw6zRM5PSw3IcPoOcwXRNRBEnCSy4BcOrBLK1n1p8Gq27yZzWRuJZn9qZoQNh9H79iUMkUbfs/CPU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbWbn8eKeen7Fv67S9SdTwJ0AZsAsRQEDmj2cu/zwzZcKERlnk
 f1NDEyeoNswZmjwdQRkE9P7U6gFdpwE1mURKcpqK6+8juL2mYUpz
X-Gm-Gg: ASbGncv1y94JozDsPMlxkNloEqGatjirPJ3e4Fq6qk74rFDyAyYgqRBMTmyfSO4quU9
 ViL7EXyLX4/gaxly6HuoKVIJqEIRunCNv8/ILqTdr3fwiHA1PDPutrUQrVK2SY1hmuawjwyGsuc
 mPXxAnmRucEf+rPSYQl0W+oj5iw03K7VL0AdIf5G/ezCkU/pxKOw0o267aUH1yhmymSwnlJMveY
 Q85makGRCtYYB2GCAXF4zAfiScyRGyQ1fwqLs8EK/zO/jjYKwwbA0yPe9HxVMICqGomOhqizsLO
 dBYC1ifi0nc0cmVVkre4ZUzkQiObvEjGw8a5+TMnhKmlRLutAzhplmuXWTc1
X-Google-Smtp-Source: AGHT+IEgovUo3fqEdnkhJw+bsJ52pKIQ7trPCxR4KR+DeBMftR4N+JrGDxjm3mhsjvknZyqu+0Tatg==
X-Received: by 2002:a05:6830:6204:b0:72b:a3f3:deb6 with SMTP id
 46e09a7af769-73210a692famr3145427a34.4.1746649353725; 
 Wed, 07 May 2025 13:22:33 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:33 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V9 08/24] dt-bindings: allwinner: add H616 DE33 clock binding
Date: Wed,  7 May 2025 15:19:27 -0500
Message-ID: <20250507201943.330111-9-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a clock binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems
---
 .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
index 70369bd633e4..7fcd55d468d4 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-de2-clk
       - const: allwinner,sun50i-h5-de2-clk
       - const: allwinner,sun50i-h6-de3-clk
+      - const: allwinner,sun50i-h616-de33-clk
       - items:
           - const: allwinner,sun8i-r40-de2-clk
           - const: allwinner,sun8i-h3-de2-clk
-- 
2.43.0

