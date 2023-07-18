Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D1A75834D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 19:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726C910E381;
	Tue, 18 Jul 2023 17:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9E110E381
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 17:17:04 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbfcc6daa9so55583235e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 10:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689700621; x=1692292621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cRDtp/WtEw9mLKqbxe9I85x6ziwi94Y2+xfVDhxRx98=;
 b=l35yAg6rLbX9bryJRqrdHh0SNSnkU2HjdV1QnN9k+iR1MDEyIHRodrxwx6D5yMd0Ty
 2riv5zpKPGWr7im5tYE4xWkAUZZiXWQHS7is8BiV43wZSm0Imt2H7poEsA2tsmnHpiJc
 LCL26sp6cjENNQjqthxsMGkg0DHwmqvkrM93ExyinF4DJZvg+nZTZgJpFTLkVRKjS2Yq
 jArb202ZSfEuSvOELPqI70eb+5cZVFsVR1RsKihhpHFg8hNmaJbV1haGcWOINg1AmpUy
 3Mf0mT6/pJ0pcsI7HTn9SB3vivnqCMWFF/Z9jrUnNoKKWuunSfMtEsKn/8OirxPAVkcx
 8VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689700621; x=1692292621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cRDtp/WtEw9mLKqbxe9I85x6ziwi94Y2+xfVDhxRx98=;
 b=T3oUgzrbyyZIGpk4ofA8SObdPe8q4SFTfmjr4CYBXOBs+1YkpQViwkU0AVogWQf/D1
 JwezRgbbCD8xEqxitZWtgKLu85mgtXau+mULdxAxZnV6qKiy/0ZjbzRXZdebwRGxvCNe
 tU6dpGrlNq+SBA48mjDMgTIvK3HHkfajBrjgUE7+w2ejNQDSmZL1N4fJc++iEF1i9Z0T
 pA4KqLmg5iCdtiwp+s7xnbLJn6PF6w6xBkg0ytg1C4EIbPNmEw/2xH7sTeZbYBL0t9Ss
 bV2edPe22oQDTzhFS/h9AtakLXSQT4pIqZJ7cLQ0xasKM8gsOlSsdm1dZMeifVePe+CT
 oP/Q==
X-Gm-Message-State: ABy/qLaQP5mXG5XbAflX53FrCmtlmpJqWWljQARbZJV2hPsPgF0ala2s
 8Hcdbrdeyo9bhG6XxL04tUQ=
X-Google-Smtp-Source: APBJJlG6LoYeezjNXpGpd5uIC0J1poUg9o9vS0RrXRrX0PkrfaGrt01RZcKAMG5YfuJpc/XYYaB0ww==
X-Received: by 2002:a7b:c387:0:b0:3fb:c217:722e with SMTP id
 s7-20020a7bc387000000b003fbc217722emr21174wmj.33.1689700621245; 
 Tue, 18 Jul 2023 10:17:01 -0700 (PDT)
Received: from localhost ([37.171.244.194]) by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003fb739d27aesm10877952wma.35.2023.07.18.10.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 10:17:00 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3] staging: fbtft: ili9341: use macro
 FBTFT_REGISTER_SPI_DRIVER
Date: Tue, 18 Jul 2023 19:20:24 +0200
Message-ID: <20230718172024.67488-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
ultimately causes a warning when the module probes. Fixes it.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---

Changes in v3:
	- added changelog

Changes in v2:
	- dropped MODULE_ALIAS changes
	- changed commit log for more accurate description

 drivers/staging/fbtft/fb_ili9341.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ili9341.c b/drivers/staging/fbtft/fb_ili9341.c
index 9ccd0823c3ab..47e72b87d76d 100644
--- a/drivers/staging/fbtft/fb_ili9341.c
+++ b/drivers/staging/fbtft/fb_ili9341.c
@@ -145,7 +145,7 @@ static struct fbtft_display display = {
 	},
 };
 
-FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9341", &display);
+FBTFT_REGISTER_SPI_DRIVER(DRVNAME, "ilitek", "ili9341", &display);
 
 MODULE_ALIAS("spi:" DRVNAME);
 MODULE_ALIAS("platform:" DRVNAME);
-- 
2.41.0

