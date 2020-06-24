Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A7A20767E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D0F6E14C;
	Wed, 24 Jun 2020 15:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FF66E161
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:04:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id j18so2641137wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N4d9MV/8IVDi6H6NDx3txaJsaoNizmHMUDUqyGZyRwc=;
 b=emOdUiDeUe+KFeHCqP/4Vwih/dwJXxtgOfA8pOQGoiPOx4UIAFEj52mjFAk5DhMU86
 gT5Wkp7zH2kxwdj2nAgh4si1eNBmRt6zQrHV/KaItnIMe2juaJ0mQG5otPsahO1pCdPJ
 uNv7FOOfhL9aTrRneY9in0QBdNS0svXag+qoK1jXiCuIROyJEZl6vCMGfgtx9e1iQCaZ
 fTogXsdUIy5yY0iXLhZIm6MgIN9gDmrnno6dwDdaJSxcXxVh5LP/EdDdXAVtip1VfRmS
 Qvg6LFloU7LYSBu/IitxhtD60aQwVHctr3SlOUisidawyOoQ3WVkyHKCgnAfwUkNPuA6
 Jdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N4d9MV/8IVDi6H6NDx3txaJsaoNizmHMUDUqyGZyRwc=;
 b=VjMfqKsDM1sjkbUQyOJ3B20voE6SaIONZAECn1EE8oy0NB9nEpo8XuPfjNy7P/my/S
 DPKf12I9YoeKLUtHHNyDqEfOz7V2ukJurl3/UM8nRaxwr+oCsYLw/0t4qF4TwcI1NmeF
 TijmBAtPhU2Km82EEF0CBx09kzetEEgsmaBqizwu2/JfXu6JqDgLp+BCsshatUOAL3Yg
 6qv/BghsQJmbxW9rddBZCkvOdcd8Fy06aTK/udECQ07oT8VR4QEkgN5K+v9pRMSIBSnO
 Np9Ct/2qu1L2QhijVVMzgbS8bjODu60meUXEjJFwrdgp7xKnIBCTfEycq0SCHbLiP9sO
 qMpw==
X-Gm-Message-State: AOAM530ATHywJfrApAaflIjQ9isfcdfQ5MUmlS7g6fOdzXfllZ42mzBg
 sM5/H2XsVhOSKWiFc1tgdZtiag==
X-Google-Smtp-Source: ABdhPJygPsccHa5jOlhVGhJlJB4d/4S7eDfjo8Nvz6itCY61Cz7n4glf/TvzYk4QWergu4UvpagYdQ==
X-Received: by 2002:a05:600c:204d:: with SMTP id
 p13mr29834871wmg.88.1593011082536; 
 Wed, 24 Jun 2020 08:04:42 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id f186sm8200319wmf.29.2020.06.24.08.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 08:04:41 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 2/8] backlight: lcd: Add missing kerneldoc entry for 'struct
 device parent'
Date: Wed, 24 Jun 2020 15:57:15 +0100
Message-Id: <20200624145721.2590327-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200624145721.2590327-1-lee.jones@linaro.org>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: Andrew Zabolotny <zap@homelink.ru>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jamey Hicks <jamey.hicks@hp.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This has been missing since the conversion to 'struct device' in 2007.

Cc: <stable@vger.kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Jamey Hicks <jamey.hicks@hp.com>
Cc: Andrew Zabolotny <zap@homelink.ru>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/backlight/lcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index 78b0333586258..db56e465aaff3 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -179,6 +179,7 @@ ATTRIBUTE_GROUPS(lcd_device);
  * lcd_device_register - register a new object of lcd_device class.
  * @name: the name of the new object(must be the same as the name of the
  *   respective framebuffer device).
+ * @parent: pointer to the parent's struct device .
  * @devdata: an optional pointer to be stored in the device. The
  *   methods may retrieve it by using lcd_get_data(ld).
  * @ops: the lcd operations structure.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
