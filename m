Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14EF2F4DA6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81576EA6F;
	Wed, 13 Jan 2021 14:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDEC6EA66
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:58 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d13so2385665wrc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ruS/5Q88or74bT1MGQpJfhS5CAkw8vidMq7dDib2fZs=;
 b=dw+awuMm/xszxko06x1zbZDXJLrY8h9w46Ii0r1I8t7M23qIokSEWF+lctfR7ifEG+
 10hTw/DwZRUnEFPhAVSO68dOG3xRMSECzOqgPEZGcaXkIwEZpNzwO47CVeLh022fRJlH
 jDBbte4+oRAEKQsXCuHQ59dmP92NSYRrJJV3l5taYJRqGkZfD+TVnytK3qk0j65GJPKu
 2f+mh5IUw8l2pURTp/2Vx0/xKSO+Pb15iZss30ox0FSMT0+dZ7zRgUjqCFkx8UoasarG
 0QTSmkjRG6zgnWk6plq18kDAdy0dxgi5AzQNxp96r0OLZ3jhu/aqmtWdmf/vSBNmKOFD
 AtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ruS/5Q88or74bT1MGQpJfhS5CAkw8vidMq7dDib2fZs=;
 b=TOpuJtOkEAOoV0JBuzB+dnj3xaBNReqSpPEVx8BJIeUwhKR7KH030jWezuCqrnA+Tt
 f40AaYfpfAYnpxRNk++zblPVYrSHYlPswV+Qu62uzG++faaglfpIKYvSmFOj6A9fzTuL
 FvR04RVgqIqUgUBcplVUL+uodyEqK18p5WyuaisF2bpoLyWdUPDl1CbVL8c7bdRA3Npw
 bEJu1RUxWZv8LrUl6UtTXynUI5Z5j2PuvX+CBEln5sSCxK86AI5MQXA2pfYRmJO5iBLg
 C0Yc52luql7OJudP8sGZ3Oi9kTwYbcpYKf9kha2MAHxUE/Mpz0Q7kJmETAITmMf6Zaz1
 gwaw==
X-Gm-Message-State: AOAM530IiiH5kSm1qUCVE5gA4sAqjCudbjTvg3R3QLHPzO/N5P8hlZLE
 gscI3OXplfs+OhPBocO/OZYwmg==
X-Google-Smtp-Source: ABdhPJxI76cMcy6SPfmM5W3HPZ9oHq45qLxC2KpwnypdTX8IGDVuElLlSdIgg82G0B9F5jmQLXJfmQ==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr3034474wrv.54.1610549457244; 
 Wed, 13 Jan 2021 06:50:57 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:56 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 31/31] video: fbdev: mx3fb: Fix some kernel-doc issues
Date: Wed, 13 Jan 2021 14:50:09 +0000
Message-Id: <20210113145009.1272040-32-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Software Engineering <lg@denx.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/video/fbdev/mx3fb.c:738: warning: Function parameter or member 'fbi' not described in 'mx3fb_set_fix'
 drivers/video/fbdev/mx3fb.c:738: warning: Excess function parameter 'info' description in 'mx3fb_set_fix'
 drivers/video/fbdev/mx3fb.c:1109: warning: Function parameter or member 'blank' not described in 'mx3fb_blank'
 drivers/video/fbdev/mx3fb.c:1109: warning: Function parameter or member 'fbi' not described in 'mx3fb_blank'
 drivers/video/fbdev/mx3fb.c:1134: warning: Function parameter or member 'fbi' not described in 'mx3fb_pan_display'
 drivers/video/fbdev/mx3fb.c:1134: warning: Excess function parameter 'info' description in 'mx3fb_pan_display'
 drivers/video/fbdev/mx3fb.c:1393: warning: Function parameter or member 'dev' not described in 'mx3fb_init_fbinfo'
 drivers/video/fbdev/mx3fb.c:1393: warning: Function parameter or member 'ops' not described in 'mx3fb_init_fbinfo'

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Software Engineering <lg@denx.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/mx3fb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
index d1c8f7a969ac3..a0fad25136fe5 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -731,7 +731,7 @@ static int mx3fb_unmap_video_memory(struct fb_info *fbi);
 
 /**
  * mx3fb_set_fix() - set fixed framebuffer parameters from variable settings.
- * @info:	framebuffer information pointer
+ * @fbi:	framebuffer information pointer
  * @return:	0 on success or negative error code on failure.
  */
 static int mx3fb_set_fix(struct fb_info *fbi)
@@ -1104,6 +1104,8 @@ static void __blank(int blank, struct fb_info *fbi)
 
 /**
  * mx3fb_blank() - blank the display.
+ * @blank:	blank mode (unblank, normal, {v,h}sync_suspend, powerdown)
+ * @fbi:	framebuffer information pointer
  */
 static int mx3fb_blank(int blank, struct fb_info *fbi)
 {
@@ -1125,7 +1127,7 @@ static int mx3fb_blank(int blank, struct fb_info *fbi)
 /**
  * mx3fb_pan_display() - pan or wrap the display
  * @var:	variable screen buffer information.
- * @info:	framebuffer information pointer.
+ * @fbi:	framebuffer information pointer.
  *
  * We look only at xoffset, yoffset and the FB_VMODE_YWRAP flag
  */
@@ -1384,7 +1386,7 @@ static int mx3fb_unmap_video_memory(struct fb_info *fbi)
 	return 0;
 }
 
-/**
+/*
  * mx3fb_init_fbinfo() - initialize framebuffer information object.
  * @return:	initialized framebuffer structure.
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
