Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557DDAE3608
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 08:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606F310E1A9;
	Mon, 23 Jun 2025 06:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="T9IjKvCT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ABC10E182
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 06:45:01 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6077dea37easo7243025a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jun 2025 23:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1750661100; x=1751265900; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W8j0earuMk91sZoSa/Jgd1WatXgxkmiiaUFmqx99Roc=;
 b=T9IjKvCTGgKxU1CoTqP3j852Mk3JGlbuFXlxXn4yAvpIr/4X0CKqrGDhdg2NfeA342
 cmx/eM/dDbQJwO+PDN6aZNa+OpJawh1LVCbCBBmCZRU/m/HYIh86aEoqN7HFwENMXYYM
 Vz3HGajmSlWxQSsdfw4BfwTYJZZb8qKqfuQrSSx7Q2ADwBePvwu5Qg7G9yVybXKf+PIL
 r4jp3iuRxJOjGVmNrlvcdkwOZlerHx4tuY5/ZZpp9eBvk0UDwSaxRFlTFD20qyvbZV6S
 5LWWt6rNZqlaouvqHpdtMOn6q4HFfE1LixOAaAVf1vyV7b56jansW7FnWHFOV0XiNGj1
 Cmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750661100; x=1751265900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W8j0earuMk91sZoSa/Jgd1WatXgxkmiiaUFmqx99Roc=;
 b=PPyV+7xHLTpPwxsRvTMrCMsHUdMSQYUfNsFBOleH6KO3zrJTl10uZnTacZTZ3RZcOf
 8e7nQF+ASV8QL/K65DamdIX6+J4oeXqOLgk1vYnMTTABWWOBelTlaFnEFRfgWjnmQq5D
 43nz2cHT2yNxtord7JPIWW2t21qqZM31gK9YtAIibnEDH0lbKonbUruxpl+yzPq6M+Kf
 GU1XOIluPAy+h5mfHwsTofoO8s3Q/HnsDCnRii/j81Ziemxjot2831bOmZ6OnsTNohxH
 z94ksTsAz+rfY4pn4slu2/x3R+vE9VjCBRLw4MO1kQHEOqrZv7MK/k3vqgqun4ldpib1
 6Exg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTwigOm7i9iAFXmHoME1HrJscJfEJkZR3ERS8pePp4mesmWWTh+TZJFgL8EaMs07wPJh11s7qEexw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrHbpI7/VdDekcwAarcJI75tHZbxx/ETE4WRaSPNyqaKMwOzXe
 de84+RZfP4rZeRx66674c/3Th+q9VAO96gKTETolj02TUfZaBlIrA5tQ2DZw+OFBpAQ=
X-Gm-Gg: ASbGncuohA4cXkhSA+LiRJsx+RZOiUIKIJDhVkS/dcG7oCHUAxPNTK1ZMckk4xN4LQo
 QQQyxnwrGGfzH8wvXO0iNiJLr2z0jUAqbyWh0xi8egWZDjZzxfXf5qnRiU8EBBQKU7YBGlACeG3
 E7D8KAbZ0MoQL/umFeIHCLHVth+DvAX1n3ghPX2UWyt+nAJepFBxE2lUjOjPvkknyrZnvFMohw5
 swGWviemp0E4TejCGatrz0SAQC2pjcr3sU9IqeIGB6/VmVsOaR1YF2fRG+Clr9jFU5sSCG+Ez58
 rk4WqaRiKMjbuC2q/ETiR1S0EOZrYThRBkyn/7yAaL91VJUGjb1Yg68hNAFGgynaFnjSQV6csrQ
 C12dXArb9+teR2qxtdFiQtCoS3MlD2u3Z
X-Google-Smtp-Source: AGHT+IE8m6sV6mGT4W4Z3eOR9YDBYYzBxtwk7TVZKt44W93HSiVrTunOecK2T81aA/Q+qJNWY1i1yg==
X-Received: by 2002:a17:907:1c95:b0:adb:449c:7621 with SMTP id
 a640c23a62f3a-ae057c0f672mr1169047266b.29.1750661099726; 
 Sun, 22 Jun 2025 23:44:59 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053ee4ce9sm659258266b.69.2025.06.22.23.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jun 2025 23:44:59 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 23 Jun 2025 08:44:48 +0200
Subject: [PATCH v2 4/5] fbdev/simplefb: Sort headers correctly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-simple-drm-fb-icc-v2-4-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
In-Reply-To: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750661095; l=1094;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FuWpotRDIyEvFRCG/nxmNN/jO2swjOVfbhbhqHJw88c=;
 b=kXVSPEOY4GhdxIVGXUvtFGyi8NaioGV03rhp+XgPSoKPhDZTGGSFak070HpEI5tJff8X94PQS
 azxFMPS9dLaDcaEfVYWwQaXl3Ps5kdOPKrCiKnmBij4JtYNIp525Z22
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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

Make sure the headers are sorted alphabetically to ensure consistent
code.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/video/fbdev/simplefb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index be95fcddce4c8ca794826b805cd7dad2985bd637..db27d51046af5cc3c46a0bc81ad9d9ed9a0783cc 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -13,18 +13,18 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/clk.h>
 #include <linux/errno.h>
 #include <linux/fb.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/platform_data/simplefb.h>
-#include <linux/platform_device.h>
-#include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_clk.h>
 #include <linux/of_platform.h>
 #include <linux/parser.h>
+#include <linux/platform_data/simplefb.h>
+#include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
 

-- 
2.50.0

