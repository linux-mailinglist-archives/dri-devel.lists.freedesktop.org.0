Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA0F207690
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C466E133;
	Wed, 24 Jun 2020 15:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16A06E133
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:04:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j94so2658062wrj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 08:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tLytrf9J+7CHVP5wu7KcfI+noBAdF1Wf8Twuues69S4=;
 b=Erqp8QynHDhJNjQVXw0Nml++ayuUC2985duv2TS42VTDHkluSux1WL8NVNlRd8PFfF
 Tr69ZgM7bf++tb18l5IAjqYmUpu9tlF7PJUiSz8Tr/vUqOcC+v8dsF8Tj4Kt+xMHXB7y
 fyOCi0BW4U5Gw4ul4uy156ZMt+/VwWbNKspvpwakR+6aCVHht2wBlU4p+IAvEkVI1ZMB
 1Z+gXQ77Ie+8ckr7Pl9VYdxjHb12JG1gSlFtHtQBcg1hfU9FICm9DSB1JAhMxSxyUTpN
 tcuNu/c7Vb6L56SkTxqn1Nf5SV14/ketmit5cqVFZ8i4Y61Uv3chtiOdN+0GUmuUGDIc
 zUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tLytrf9J+7CHVP5wu7KcfI+noBAdF1Wf8Twuues69S4=;
 b=MToICIAIosW2meXo/+LcMUs9f7+aTmBrVWAthbk9oziuZ2WoGlDQqmRw3pFWCXJ8i8
 65jcu+sKWGzLJicmL2TeIacz36Xmi0RoSLZfzlCcE4HfWRrW8Dwu3tO1djzGIyneRoLx
 WfO8jMU31Dk3uvnGcq191zrDzk8S3sFjd7eui/FA3/88/WrYIsYMkoKU5Mkjid9mHoLW
 2dZ2Y0rgsfaanhCt2aBueVU6vzzMbl8YnFP1riFPJKwzH5BSuy/oDRJIyTOpOM24xZ4p
 yANghzj8CQ2kCzEn6yDM4tbPpfqY/hdKMnGvOY91k9+VKDDf4l8aBmHAm0L0YQ6KpzOk
 02vA==
X-Gm-Message-State: AOAM530fSA20xAGIquMXqt7pooGpR2ShPD2HY91XwqJ0c4idA2606tMB
 WhdChuSgwxkqEtTKYeSgjzUq1g==
X-Google-Smtp-Source: ABdhPJysPmy/tKH5YJkFzQIv2duUP1ODgbSrj8iubXadOJPQ7Zmf5Z3K1aBiaL4Ibwz73S2H6Wavjg==
X-Received: by 2002:a5d:4283:: with SMTP id k3mr25625367wrq.322.1593011087317; 
 Wed, 24 Jun 2020 08:04:47 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id f186sm8200319wmf.29.2020.06.24.08.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 08:04:46 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 5/8] backlight: ili922x: Add missing kerneldoc description for
 ili922x_reg_dump()'s arg
Date: Wed, 24 Jun 2020 15:57:18 +0100
Message-Id: <20200624145721.2590327-6-lee.jones@linaro.org>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Software Engineering <sbabic@denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kerneldoc syntax is used, but not complete.  Descriptions required.

Prevents warnings like:

 drivers/video/backlight/ili922x.c:298: warning: Function parameter or member 'spi' not described in 'ili922x_reg_dump'

Cc: <stable@vger.kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Software Engineering <sbabic@denx.de>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/backlight/ili922x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
index cd41433b87aeb..26193f38234e7 100644
--- a/drivers/video/backlight/ili922x.c
+++ b/drivers/video/backlight/ili922x.c
@@ -295,6 +295,8 @@ static int ili922x_write(struct spi_device *spi, u8 reg, u16 value)
 #ifdef DEBUG
 /**
  * ili922x_reg_dump - dump all registers
+ *
+ * @spi: pointer to the controller side proxy for an SPI slave device
  */
 static void ili922x_reg_dump(struct spi_device *spi)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
