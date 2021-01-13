Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B512F4D86
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF956EA4A;
	Wed, 13 Jan 2021 14:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E55E6EA09
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id e25so1863706wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AGeTlHRvpAdPio9vRmuctbq8OFArXLtHb/g2TDArOrk=;
 b=s5iALxr3dobAkBUTpXGoBoDm/4QIM6hPqOgnFBeyOPMxE44pJLX408VkWwnjf9EKr7
 cV7kywVBFk+BvK0rYKNvHfyqBUdb5WnuXOYKKGcbdNXTqGP8wzzNaWscr3GVpl5L+3e9
 59GwpRAnSZw8YR3uzHvOELb7YNB+MK3VqThmnI/SPsJGojvBSlVXx9pEChrkKe/NOSnL
 ISS27W14Wk79/qU5wLB7QGSr1xGvvu+viv/ZtzaO16hfIiOOc82jkjWv9QBVdfjnSd7c
 DsTks38v32N1wxNwz0nDYPs9DmW7h7iY6aRdoTTFZx6zjR6CxixctRYRVpRPsYNSW6i4
 aExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AGeTlHRvpAdPio9vRmuctbq8OFArXLtHb/g2TDArOrk=;
 b=bM9EZ2zrSY5lGbiBtDP11cQCxr1tESdJGmSv3b9r++GmN8VkP/biH5gRb8L72KBAym
 Y7d1lnQqaIxfBbgHkoiEnfo7lWTkEEd8ODyBQ1EVVS4F4oQmU+TK8Uq1dP2rqMtUfxqN
 9BCnkApDO23ZPp4DRpQ7djldigsxbFVWF3JTwg35CwMxfFG0z8lqN2ONc7bWlQVo8Y98
 7Vnrre1iW5NIGSZUk6yrX86bQFA9LPOSMJdf4IKsYN28jexR6l12e2VSQqOJLR+aNr9l
 /moF8MNi4uT/9+bLrecREuXIfgWDKzkDGI9+OH+fpEgX3DddEvQ1eBn3j7swITCulDU9
 5i0g==
X-Gm-Message-State: AOAM530iY6EyHgZWyKNYXXU2roQ7ZXGtYatn8ICrTmtCjzxSZeDtdvt+
 TNunv8lmPgmPO49pnhIn8HrTXw==
X-Google-Smtp-Source: ABdhPJyCW0t+4fXJ5f+EqccH4bSmfQRogXuSLR0mXqIvzlFByErtr2znDphOj6bW9fU2Yx0Dp0rX9w==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr2579994wmb.124.1610549414900; 
 Wed, 13 Jan 2021 06:50:14 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/31] video: fbdev: core: fbmon: Add missing description for
 'specs'
Date: Wed, 13 Jan 2021 14:49:39 +0000
Message-Id: <20210113145009.1272040-2-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Egbert Eich <Egbert.Eich@Physik.TU-Darmstadt.DE>,
 John Fremlin <vii@users.sourceforge.net>, Ani Joshi <ajoshi@unixbox.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 James Simmons <jsimmons@users.sf.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also fix a formatting issue

Fixes the following W=1 kernel build warning(s):

 drivers/video/fbdev/core/fbmon.c:617: warning: Function parameter or member 'specs' not described in 'fb_create_modedb'
 drivers/video/fbdev/core/fbmon.c:1103: warning: bad line:

Cc: James Simmons <jsimmons@users.sf.net>
Cc: Egbert Eich <Egbert.Eich@Physik.TU-Darmstadt.DE>
Cc: John Fremlin <vii@users.sourceforge.net>
Cc: Ani Joshi <ajoshi@unixbox.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/core/fbmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 1bf82dbc9e3cf..82f856fe3919f 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -605,6 +605,7 @@ static void get_detailed_timing(unsigned char *block,
  * fb_create_modedb - create video mode database
  * @edid: EDID data
  * @dbsize: database size
+ * @specs: framebuffer montior specifications
  *
  * RETURNS: struct fb_videomode, @dbsize contains length of database
  *
@@ -1100,7 +1101,6 @@ static u32 fb_get_hblank_by_hfreq(u32 hfreq, u32 xres)
  *                                    2 * M
  *        M = 300;
  *        C = 30;
-
  */
 static u32 fb_get_hblank_by_dclk(u32 dclk, u32 xres)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
