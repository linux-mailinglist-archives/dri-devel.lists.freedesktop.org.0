Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C5CA2746
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AE710E840;
	Thu,  4 Dec 2025 06:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WxMx9XAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F4D10E83B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:06:59 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-640aaa89697so634595a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764828418; x=1765433218; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
 b=WxMx9XAk0z80q7TS8sXeBXivBARQVWF1r42tOL4K4NK4gCxRgclpIGgTFiePNMW+Lc
 0yxDkaGQwRVMrl3oLup1SlJkZanCuy8Iu9WfzSTNntwcziqYr2r9PPjZkczEZOHALWB7
 xmkWCypwmcF1KPIyhSDkHfwutrND5lJEYy5PBNs1tmxWk+wlYpYIlxY43qsTu9fFZuu4
 qOV79p0logFa5pPyV7PGKpj51SpUy4dX8m+1G7Qfam4DL0k+ZximVy000F0CuTnXvT70
 wc10zwH/5TLI/q82CdKAY1ZTgL1ySB1iubwUBsuU1cEqL9Md0nCzxLYrUlqck7sU4t19
 JeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764828418; x=1765433218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
 b=Tr8MzfiY4GwTvGELg3LZTlgnX5j+1xu7B9D4BymHBfDywk4xU0y+uhMNWnQPl9C0f1
 6MqUUeg2cRHOQpozdzLyZ5F77jpA6jZ4oWypAA1eQjJiSvIUG7SltdlJ2gpHVjpOAhzt
 56irxxI7KC+aQzVcOKQCQLtN2cRBmbqcgque0Ckqio3RuJ4ii9XJ6gYAli2p7wUAU5gK
 furpetIvxBfutXd1gaaTOOko4u1BwDGCEP3AUTBmxGzUhynIgs+0YQRGyl7Y7Oikdyeg
 UyT9NsAIqpj35WbRa71agJ8RmhhNbzLUy0SUb/U+PR4QZrQkzbSFWHbKoF1hgn9nzz6B
 C/kw==
X-Gm-Message-State: AOJu0YzyM1c8o2Xnykrues5tvUKwWn2DdKOGLtsEoTwCSIYJLnucxrsU
 q6uvcmIzYDKq1uHpw1s/844ZKeSNvCqBs92FjRBrp8ncYTrvquIQZcSj
X-Gm-Gg: ASbGncsdTe3Md+dMYm9bI7E1OlrZwjF3llVvTJ5Rt7aEIkQ+81qQfipX5N+1wqda2s4
 QJVKeQaFr5uI+yrmPAHqA+f786u51iwO4q7V3DdOFOI4xsIgwwsaFH6afDkZfJY7zMU6kUTYCHD
 TVuVc7cZSU/SwhO4PmibOX6ZQOI9w9M7CsVbpsbibvIKa6im9ybugpQk8tNgSBWdrWwDK/iA69m
 QQ4KsGiAb3CKCp3DYdmwupyXImHi2Ig0sOt5iXdM+7cmHcUWfTN+WsujcthD9lLfhOIXncL/ord
 oiLqA8SLL6P2aqxnwBLbvsywk/Et72KQqExRy2SpK467am8UnBjKjircxrx/u8ANyAflgH7O8Zx
 SOpdfEgJquMfiN4X7ATgb0AvS+JYIQDuCZyS+gNzwzkLQhP4SAAHEx8mqYEcrJCjBS98QEAaRAb
 Q=
X-Google-Smtp-Source: AGHT+IGXflP92wBX3QY5yGh88FcTws5u5X6jjlfnKknX5OJZU/5ArSGnkpWD3xgTqzGaHgNugxHWww==
X-Received: by 2002:a05:6402:2110:b0:640:b06f:87ca with SMTP id
 4fb4d7f45d1cf-6479c471f5bmr4545828a12.6.1764828418360; 
 Wed, 03 Dec 2025 22:06:58 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:06:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 6/7 RESEND] dt-bindings: display: panel: document Samsung
 LTL106HL02 MIPI DSI panel
Date: Thu,  4 Dec 2025 08:06:22 +0200
Message-ID: <20251204060627.4727-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204060627.4727-1-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
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

Samsung LTL106HL02 is a simple DSI which requires only a power supply and
an optional reset gpio.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index f9f1e76a810c..01ac0af0e299 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -52,6 +52,8 @@ properties:
       - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
+        # Samsung ltl106hl02 10.6" Full HD TFT LCD panel
+      - samsung,ltl106hl02-001
         # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
       - samsung,s6e3fa7-ams559nk06
         # Samsung s6e3fc2x01 1080x2340 AMOLED panel
-- 
2.48.1

