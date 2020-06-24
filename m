Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2501C20768F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F4D6EB89;
	Wed, 24 Jun 2020 15:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001AB6E133
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:04:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l17so2656562wmj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+OscN/rzPmV+Ca3LDqP3+7QfjG8tQ3er8qfNyGN0efc=;
 b=XNDfNdRiXmh7t9RgId/4XIu21fy4oogY+Nr/WCo6/NyZHQ4Itv6OslAVjjAeFK19iG
 i0f5xKyDMsV7Y4sxJPI9YCbK1EV5DMyQj7kn5az4goE+ZWa4Hc/EbVOv8PPGwvzyvzbE
 4WqWCqGHmNWK5VT5Y/FG+T47fTbw53DNfdHg44MNHKBE2UAvgbjqSEO0jtByy5F7T5G/
 ErFuGywjPZ/ZLSOfBNKzhIRi6Zi+cXmpf6gCITOXFnk+trenk9HoqGajs0aLJ5DdlAuo
 iL8KWarHIl3WczC77gRnj4JI3dHaFMqREtkO9wIJig1PkRUTzCNZ3nVTe0zR5R0gh3Gu
 h8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+OscN/rzPmV+Ca3LDqP3+7QfjG8tQ3er8qfNyGN0efc=;
 b=WcUWWum9jsHyf48Ob9A22OzriVC5zz+77HkQeCLVnW/+aYDER8KGIcESddAvLS3pAO
 tNP6caRsw5zlN7ktiKG4Ptcs6S2L9NI1p+lj9l2ffRtpseyM6SHQlZ3tVdPw/bbeofjj
 yj26qEBwDgLU6ry0Mwj6ibh9N/RmWx4PpTek2PJpjtS7LWbfXB4rdWkHgOKiQ6gXwyKM
 dDby9ax7gGFdbMM4krAJin43zjFmc0dPzel1eek0ENvqIrB9R80Zom5ij29WQb47daeZ
 /xir+DE+pUsNCvm50Ywm5rYNh+2LKe2a/W2d0tgT3o94hEOz35cuX+nrm/fxozXqsYAb
 5MBA==
X-Gm-Message-State: AOAM530lVCltIPMVOCbTfONKFTUUWPDKgyXC0aPNMsk+WA6DJ7LS50PP
 FdCAeEUgbf1Qj9R1mOn+ClCOYw==
X-Google-Smtp-Source: ABdhPJwVNF8XQROSvPdr0XQdKc3EWPYY8aw/n5FerSWHfY3zltFgb+IFcI7EijR9JNDoP40hEcO9eQ==
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr16795235wmi.95.1593011085576; 
 Wed, 24 Jun 2020 08:04:45 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id f186sm8200319wmf.29.2020.06.24.08.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 08:04:44 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 4/8] backlight: ili922x: Remove invalid use of kerneldoc syntax
Date: Wed, 24 Jun 2020 15:57:17 +0100
Message-Id: <20200624145721.2590327-5-lee.jones@linaro.org>
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

Kerneldoc is for documenting function arguments and return values.

Prevents warnings like:

 drivers/video/backlight/ili922x.c:127: warning: cannot understand function prototype: 'int ili922x_id = 1; '
 drivers/video/backlight/ili922x.c:136: warning: cannot understand function prototype: 'struct ili922x '

Cc: <stable@vger.kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Software Engineering <sbabic@denx.de>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/backlight/ili922x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
index 8cb4b9d3c3bba..cd41433b87aeb 100644
--- a/drivers/video/backlight/ili922x.c
+++ b/drivers/video/backlight/ili922x.c
@@ -123,7 +123,7 @@
 
 #define set_tx_byte(b)		(tx_invert ? ~(b) : b)
 
-/**
+/*
  * ili922x_id - id as set by manufacturer
  */
 static int ili922x_id = 1;
@@ -132,7 +132,7 @@ module_param(ili922x_id, int, 0);
 static int tx_invert;
 module_param(tx_invert, int, 0);
 
-/**
+/*
  * driver's private structure
  */
 struct ili922x {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
