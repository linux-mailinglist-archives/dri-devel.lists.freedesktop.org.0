Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B15D218863
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 15:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CEE6E8BF;
	Wed,  8 Jul 2020 13:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAFC6E8C4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 13:04:24 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w3so3013574wmi.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 06:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RxFZ0mM04Szq9whPZ3GL7Mk7ZTkZD0uYPWryvuVTQqY=;
 b=mCsupB04au9clciRuxVrDhmV/yk5CdYxDbfWAKUEqRFL8HrNjxFEsv0/7Obek98xVH
 /9C4GfH+bCFayzILNsMztA+i5/rN8b5+s5217riicElmsJIMnYAmrpNECDTTV1EJEGor
 RwJSHj/wSTRE7zJHK2gqKcQRa5Yhfx6rW08a5khnZoy4ho2Xzam1QjcFS00BOQTZaxUO
 4vKDnfegwxZ1ETmjpXWpWweTk/LamA34ohy6W9sjJbj4OaWfS4Le/aKq+AaVDRqTO+V6
 r9xd0hmcqJMy385gyxHt/uj3aCq5gsCEdnvXK67fNvjI9eELE1VwBOvQXWC6Rrag8PI3
 d2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RxFZ0mM04Szq9whPZ3GL7Mk7ZTkZD0uYPWryvuVTQqY=;
 b=CH0GJRT1c8puSxFPGc2IV7r1b//lFxnXHsec6nvnPYxrofxTlk+Gh0yazptNMCMlg2
 ocGIqhLsWG5tBUJj739hHLHoP6fbtLeQBPBA82gkt/QyaxmwgTW71p9/pP/Cbd7k3/BH
 5vYhg+IEyRaKEK4Z7XNg8Tef6cveU+9M6GCi0wHfIGnRLKB6s+bWbIqmTpVzcRWsbZmU
 RnpMlhQGy3IOSTEBJqyKVX/J2+ofI0KlaOdWHx36QdC0rwie9Ee/AcsC9kb1CS+ydyHS
 0v3kGbqMUiePeHg9wedV8Gi/qnWFy22lGDQXKGm31zwmGpyy3ISdjGTm9sEP0T/8FVyY
 I9sg==
X-Gm-Message-State: AOAM530X5iWuKQANI2th2rl3D7xYWYoTk1gV3X8jJfMp4vbS5JOWd+YQ
 zHcd90iCneEjGIA+ui5E7pwYmg==
X-Google-Smtp-Source: ABdhPJwkcRNPg0c+ui6qXxBzepuHHCjRwvrxhO3Qpq0Zdau5H9yd/UNhobH+cvwIzFKwffnbfXPm2A==
X-Received: by 2002:a1c:7311:: with SMTP id d17mr9078596wmb.60.1594213462831; 
 Wed, 08 Jul 2020 06:04:22 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id q3sm5767129wmq.22.2020.07.08.06.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 06:04:22 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 1/1] video: backlight: sky81452-backlight: Fix some kerneldoc
 issues
Date: Wed,  8 Jul 2020 14:04:19 +0100
Message-Id: <20200708130419.3445042-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Gyungoh Yoo <jack.yoo@skyworksinc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Firstly, all lines must begin with a '*'.  Secondly, arg descriptions
must be spelt correctly, so fix misspelling of 'gpioD_enable' and
'short_detecTion_threshold'

Fixes the following W=1 kernel build warning(s):

 drivers/video/backlight/sky81452-backlight.c:46: warning: bad line:                 If it is not defined, default name is lcd-backlight.
 drivers/video/backlight/sky81452-backlight.c:64: warning: Function parameter or member 'gpiod_enable' not described in 'sky81452_bl_platform_data'
 drivers/video/backlight/sky81452-backlight.c:64: warning: Function parameter or member 'short_detection_threshold' not described in 'sky81452_bl_platform_data'

Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Gyungoh Yoo <jack.yoo@skyworksinc.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/backlight/sky81452-backlight.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index 83ccb3d940fae..0ce1815850080 100644
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -43,13 +43,13 @@
 /**
  * struct sky81452_platform_data
  * @name:	backlight driver name.
-		If it is not defined, default name is lcd-backlight.
- * @gpios_enable:GPIO descriptor which control EN pin
+ *		If it is not defined, default name is lcd-backlight.
+ * @gpiod_enable:GPIO descriptor which control EN pin
  * @enable:	Enable mask for current sink channel 1, 2, 3, 4, 5 and 6.
  * @ignore_pwm:	true if DPWMI should be ignored.
  * @dpwm_mode:	true is DPWM dimming mode, otherwise Analog dimming mode.
  * @phase_shift:true is phase shift mode.
- * @short_detecion_threshold:	It should be one of 4, 5, 6 and 7V.
+ * @short_detection_threshold:	It should be one of 4, 5, 6 and 7V.
  * @boost_current_limit:	It should be one of 2300, 2750mA.
  */
 struct sky81452_bl_platform_data {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
