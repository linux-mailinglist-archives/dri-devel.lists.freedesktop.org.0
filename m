Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C696F75415A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 19:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2D310E8C8;
	Fri, 14 Jul 2023 17:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7141310E8C8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 17:51:11 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-78374596182so89012139f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689357070; x=1691949070;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KLv94wsoBBZ7d+EdEhh5zJTvgGpi6n9qD3d4Savs9Jc=;
 b=cOWWcC366fLq4ggq1CsZRLuz64m6FU4G5fomsdlpuf6z9orpmNmRAVaGJ7P/4T59LM
 YpX6258+uwaOY12ATeBcFNHdAK+GC2g8k4gr8nyWu3u9uFWYjNfYyacaxC0AcBOlVa7d
 axdSVR5ET2+F/9u94TZ/3wpcMX72qcxGAZJUbGuymn+xnm7dbQpm4SfmyRflYFZZNhw8
 1VsZBiVisUgXR2EBgBStRyNeaEI40VB8kdDUtwPrKiCTGjkZutRI2oSr7bI8JGGc6vUW
 uI+wlofwilhVB9iyU2ExcNgKfte4vxUJdwFJBdFNjRqnOCiK/0xI9tg4passgr3ytfuF
 DbjQ==
X-Gm-Message-State: ABy/qLaDeK9Jpwfeo7uy0iP77uKbB7VnRzWjLc7tjc2DQShf9dAJB4lv
 BRmNOtBkbVEDepgBRQ0xyqFoRxAsvLxV
X-Google-Smtp-Source: APBJJlFNjy6HiNBGMn5U6dVY8e4F68GquR67qkJulZVMMhQwviKf2K65FuVhbV+ByBj4XJAhRwBYSg==
X-Received: by 2002:a6b:3113:0:b0:787:129a:1e6c with SMTP id
 j19-20020a6b3113000000b00787129a1e6cmr5413859ioa.4.1689357070351; 
 Fri, 14 Jul 2023 10:51:10 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a02c60c000000b0042b00378ec9sm2659829jan.34.2023.07.14.10.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:51:09 -0700 (PDT)
Received: (nullmailer pid 4065465 invoked by uid 1000);
 Fri, 14 Jul 2023 17:50:34 -0000
From: Rob Herring <robh@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH] backlight: qcom-wled: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:50:29 -0600
Message-Id: <20230714175029.4065326-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/video/backlight/qcom-wled.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index c6996aa288e6..10129095a4c1 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -9,8 +9,8 @@
 #include <linux/backlight.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 /* From DT binding */
-- 
2.40.1

