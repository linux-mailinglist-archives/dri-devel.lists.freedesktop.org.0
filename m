Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 598182F4D8B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F003E6EA4F;
	Wed, 13 Jan 2021 14:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3476EA58
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:25 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id e25so1864152wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=41nyWegGgkKSptjKwd6Aeq/y24rv95GTAFlb1D5g4Jo=;
 b=pafm/yTul1VI6VgZ+awVR07fmX3mqTQQWpRtjlYSoHGu/InZpKlZn+TF3rRl17XSwP
 nVwCaHHy9o1NrbzI5Kqe7jaZlv2VbjcglCPPckq0exelBS2rP9Xphp3ItgG6M8CLTIda
 FwhjulzLUtcgvHitUQ8ektKlAMQXC7BiliexBGYJjJwdb+W/YgPFIvtHlO2IzbtQIst3
 2lSsdNd4+01TS9ZC+VwxrTVSuKXlQqv7Nl4gEzF2GdRsihWAM07i9laFCMuZ/apY4wep
 urDKWRfnc3vXE09BZNPfdVc8mjTIaiELGUowzaRoZqOiyF9oz78MBZlpqlJsYGj2kyLL
 xurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=41nyWegGgkKSptjKwd6Aeq/y24rv95GTAFlb1D5g4Jo=;
 b=L9WUAE8Ha3Zq59/4zbNmERJ6P1jm/o5Ma9e9HIfKiYS92t92JroYojG8ey5c+5RlBG
 iUgTePoc8coEpyHO1NkwSYV5iMBVB8+wGFaIsY1sM2NmDxpDoCEhFBV1Sh8ySG3xQPxi
 UVf7wR3nRy7lf7JXcwwWwVsnyWxn6QQWb2nFDU3OmLRt63+4jQvA20PI67mG1mZRaQzh
 NcXGtX+UCX1ksOrFNx/rjqedTpoBo+FwHAt4UvJvrDGk/TTg/Ou9rdgDagDTa2rPXOev
 Gx/RK6VWoTMm0y6Xe4o3G7BJERK7CQ+dH6j9vfpBZEAbwc4dZLp6LJ0QYzyezZZRsNbf
 Yf/A==
X-Gm-Message-State: AOAM532pblcJBygMt4E5om2dCjHsrWtrnyxH8da/dDGJ6mDFQhIgagBS
 84C2ZFs8OUc6Eo61e+Qg+f1mTQ==
X-Google-Smtp-Source: ABdhPJzywTsfi9Vnx2cWTPz0rA/vBrZ4+HLSZp3gHQQkVIeaDidlu8J3N598S3+EfWlm4YxHB5jcVA==
X-Received: by 2002:a1c:a145:: with SMTP id k66mr2551920wme.18.1610549423835; 
 Wed, 13 Jan 2021 06:50:23 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/31] video: fbdev: riva: fbdev: Fix some kernel-doc
 misdemeanours
Date: Wed, 13 Jan 2021 14:49:45 +0000
Message-Id: <20210113145009.1272040-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Ani Joshi <ajoshi@shell.unixbox.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/video/fbdev/riva/fbdev.c:485: warning: Function parameter or member 'data8' not described in 'rivafb_load_cursor_image'
 drivers/video/fbdev/riva/fbdev.c:485: warning: Excess function parameter 'data' description in 'rivafb_load_cursor_image'
 drivers/video/fbdev/riva/fbdev.c:863: warning: Function parameter or member 'var' not described in 'rivafb_do_maximize'
 drivers/video/fbdev/riva/fbdev.c:863: warning: Function parameter or member 'nom' not described in 'rivafb_do_maximize'
 drivers/video/fbdev/riva/fbdev.c:1229: warning: Excess function parameter 'con' description in 'rivafb_pan_display'

Cc: Antonino Daplas <adaplas@gmail.com>
Cc: Ani Joshi <ajoshi@shell.unixbox.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/riva/fbdev.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index ce55b9d2e862b..8adf9cf353410 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -464,12 +464,12 @@ static inline void reverse_order(u32 *l)
 
 /**
  * rivafb_load_cursor_image - load cursor image to hardware
- * @data: address to monochrome bitmap (1 = foreground color, 0 = background)
+ * @data8: address to monochrome bitmap (1 = foreground color, 0 = background)
  * @par:  pointer to private data
- * @w:    width of cursor image in pixels
- * @h:    height of cursor image in scanlines
  * @bg:   background color (ARGB1555) - alpha bit determines opacity
  * @fg:   foreground color (ARGB1555)
+ * @w:    width of cursor image in pixels
+ * @h:    height of cursor image in scanlines
  *
  * DESCRIPTiON:
  * Loads cursor image based on a monochrome source and mask bitmap.  The
@@ -840,19 +840,15 @@ static void riva_update_var(struct fb_var_screeninfo *var,
 	NVTRACE_LEAVE();
 }
 
-/**
- * rivafb_do_maximize - 
+/*
+ * rivafb_do_maximize
  * @info: pointer to fb_info object containing info for current riva board
- * @var:
- * @nom:
- * @den:
  *
  * DESCRIPTION:
  * .
  *
  * RETURNS:
  * -EINVAL on failure, 0 on success
- * 
  *
  * CALLED FROM:
  * rivafb_check_var()
@@ -1214,7 +1210,6 @@ static int rivafb_set_par(struct fb_info *info)
 /**
  * rivafb_pan_display
  * @var: standard kernel fb changeable data
- * @con: TODO
  * @info: pointer to fb_info object containing info for current riva board
  *
  * DESCRIPTION:
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
