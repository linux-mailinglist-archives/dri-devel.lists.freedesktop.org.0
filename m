Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF51A7CA697
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 13:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D4310E1BB;
	Mon, 16 Oct 2023 11:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3245110E1C5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 11:19:58 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40675f06f1fso33337355e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 04:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697455196; x=1698059996; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A8KsGpPOOoWej+EABAJ7O0MnezxzJN0p6iOYP9JLBdQ=;
 b=cf1eCCL4Gz1DX3TfD1gGQmeJwvHdYK4VmAdc6KowqdDWcW2quAsxvdvSQlON3450h4
 8obKMKrIbRNxkEhRPQhFHCnJ1HVPyCpmQow0mMbaUjh7KMwtr2K4PxwLnZpEBrFN/hWg
 IRlkvL9aZKr0bOqxzvOCFY3EO90+q6zi/UcgzVLD9ki7eTWcB1DrXs21pfeOBHvzVscz
 J4nWWNNggfHNWahh5f8zcgRKSV5o/QL15QzcfiecJ/YePz/6snLBTHs+beoXyUj7rB6e
 N4hyq8iyeXuJEwNK/dhjPAsf/J4Ar5/62AfBA9c5dw+IAw9Xm0OpGEQfD4O/bBiP+3kz
 0iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697455196; x=1698059996;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A8KsGpPOOoWej+EABAJ7O0MnezxzJN0p6iOYP9JLBdQ=;
 b=roCOVrLFb+ZdHrSEpPJA9rubtyz+yWQdHCGnaEWuRcAZVUHKUZWySirdq4SkLlFHRI
 P6/T4W/P1ZTqhr2aLKnIWWLE/eBQFbbRs9S8KvowdJBH3+kk/4GsGyb2yghjlcDJ/Pan
 u9xjIv8EHHOLCFhdMKsc/xFgtQjbk5JXrPUcMqg53Nwj9dNuN4fVxVIaOZZ6L589uRdO
 dYVnOQIvQOjH9FacX5OYCFJKnBU+xBzT8BXS83xLImaPjWr3KsQTE0Q4/+n3dK93v6kn
 ejSMptSrYMycu2bmO1l/jwy6vQ0cYlXdIq4AqfroAAhaKViPwzsv2r01kPPEUSsdAG+6
 h14A==
X-Gm-Message-State: AOJu0Yz8kTuAnZj1O3Ei8+WXxT0Lx50jBwKLN0jBjeVM1dw6iiEpd2+U
 1Bfl3wnhKRiTP4zxQCwYuIJvTQ==
X-Google-Smtp-Source: AGHT+IEwsg3DmJum5HD3wiLEYwzwIlJS3Ala8HDGksmUXDObbnciWs0r3lFHIdZY4gQew0/dSIC84g==
X-Received: by 2002:a05:600c:1552:b0:407:7def:382c with SMTP id
 f18-20020a05600c155200b004077def382cmr4012116wmg.13.1697455196603; 
 Mon, 16 Oct 2023 04:19:56 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c358b00b004075d5664basm6983560wmq.8.2023.10.16.04.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 04:19:56 -0700 (PDT)
Date: Mon, 16 Oct 2023 14:19:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: omapfb: fix some error codes
Message-ID: <843b063c-ee4a-4e17-add6-75e2cc82c2f4@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: linux-fbdev@vger.kernel.org, Xu Panda <xu.panda@zte.com.cn>,
 Lucy Mielke <mielkesteven@icloud.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Yang Yang <yang.yang29@zte.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return negative -ENXIO instead of positive ENXIO.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
No fixes tag because the caller doesn't check for errors.

 drivers/video/fbdev/omap/omapfb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index f28cb90947a3..42c96f1cfc93 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1645,13 +1645,13 @@ static int omapfb_do_probe(struct platform_device *pdev,
 	}
 	fbdev->int_irq = platform_get_irq(pdev, 0);
 	if (fbdev->int_irq < 0) {
-		r = ENXIO;
+		r = -ENXIO;
 		goto cleanup;
 	}
 
 	fbdev->ext_irq = platform_get_irq(pdev, 1);
 	if (fbdev->ext_irq < 0) {
-		r = ENXIO;
+		r = -ENXIO;
 		goto cleanup;
 	}
 
-- 
2.39.2

