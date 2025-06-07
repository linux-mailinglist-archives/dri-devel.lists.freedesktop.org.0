Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DCFAD14C9
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 23:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF77210ED68;
	Sun,  8 Jun 2025 21:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fATof735";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2751310E371
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jun 2025 19:50:07 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e7d925ff60bso2571394276.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jun 2025 12:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749325806; x=1749930606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tqod118D3jVEwrFCBqDSBhFWsP1/aqw+fydM9+fXVN0=;
 b=fATof73595iodikEMiSJRzJNSbLufYZ6HByX/Xv20hwTBtEYYMX70WX7Gh3dkJQH63
 bfLq8Sl07p7bBkQq3R9q5Lhrh7S54F87RReo6KvpXwu29PjHWQBk2bUmqcRzdEiozRSD
 0bNq9FocOmgBmj3MFTUPNGVhyhyUIa/Y4CvBmMmjA+DvgjsSGfdc33dExv3eNO7NW4y+
 8ZW1Rcd3/Mse5dT1wr0gJwNfGS1k1DChXZtAdlJJ4PsWglMzwgB4pUqpWSnmPc7yt4jG
 f5sXSEiZ8yNaTY5TfZJzYGnsnbHstT7IB08PWyYgZ12kiBo7Hyn9RICbJ0LLSIeS628G
 UKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749325806; x=1749930606;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tqod118D3jVEwrFCBqDSBhFWsP1/aqw+fydM9+fXVN0=;
 b=bO7ctbi0gKOa/gnU3m7GlJ/THdc9h4ZXKqbzcSIMCcVYkEeXkj7GEDHusGyS2YsPVt
 e3w3CDDZWTEfzP6oCGEDug0AD006SWXOmPzwcDK0F0St8yioL3hRMVPfPVoBglkm0n0E
 Odqm1eg3WbmcLEGUu1/Wv4rAfYpo0V3gYCUvjJuOsoKfj0nxq24LNqsTSNtMfXdHzN8L
 GmexyzH+YPve0UF0R3JUd2F1Xz3emPEnW6ea33a8G32z3NUl+7qIqKlrPCyDWnl+FETG
 aBTimoTfht42BRu5zaBZuZiyMoZ5R2s7+SqCrtXdZ7PLVqwl1CKUXju1ouvku+wWVCHu
 zDCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzn0m+TROn7g6pm772tj1cys5Jx0fN714ynGjsETrRTkmqz0H2m+w86fbtdeDAcoWdA47ytIC+xr0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv08/Pxj3rFItTGhtyAADAZY5KggMoHkJdpl7EPIuPqAHdlWpF
 yNx6ePHcC9TGGxXR/tdwNF0U+KvidtHaXhu5kqGvOx0BSfz/dz6QRVfJ
X-Gm-Gg: ASbGncthsWnRssscnlRDKiymXrsWQvsRN4Rxgt8PWHqu9lLRWqHHdXGJiv7FE2tb+fH
 T4l2gKblAQFd/hoAwIc7MQOYjjJ1eWQI33SU+YhdJJ7d7DII0hw+4wstY7ssThULIYIRTmnX/gU
 v7SjTCTIfSQg2uSCKpzZ4AX+8S0vxaUGhQEnVM1wuPlIyxCHwPmznq9aXiQSwSxHSluwbM+76nD
 o8A+6FJzxgQcdVURRhXQwfSYT7ceV3Z9MdEOaq3AsUGnU8a8Oby2VP/insegy081Fa2hmjGoF59
 cX8G+dYjZH/WmgbxCS21QDah7eLNukfG1Dr+WYvSEXTmwJGzQjmniL5n9uVhusRJ3w==
X-Google-Smtp-Source: AGHT+IGrAVOkmfywgRNZJlHdq6cUgR8Uazj/Z1eUT3SdelEKzOenCJ2XSMiEv42CZ8Eg65NFGzQY2A==
X-Received: by 2002:a05:6902:1108:b0:e81:843e:ea27 with SMTP id
 3f1490d57ef6-e81a21ee844mr10242074276.35.1749325806188; 
 Sat, 07 Jun 2025 12:50:06 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e81a41a48ddsm1253851276.49.2025.06.07.12.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 12:50:05 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alex Guo <alexguo1023@gmail.com>
Subject: [PATCH] fbdev: pm3fb: Fix potential divide by zero
Date: Sat,  7 Jun 2025 15:49:59 -0400
Message-Id: <20250607194959.2457473-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Jun 2025 21:44:43 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

variable var->pixclock can be set by user. In case it equals to
 zero, divide by zero would occur in pm3fb_check_var. Similar
crashes have happened in other fbdev drivers. There is no check
and modification on var->pixclock along the call chain to
pm3fb_check_var. So we fix this by checking whether 'pixclock'
is zero.

Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
Error out if 'pixclock' equals zero")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/video/fbdev/pm3fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/pm3fb.c b/drivers/video/fbdev/pm3fb.c
index 6e55e42514d6..d9b3f1937ce6 100644
--- a/drivers/video/fbdev/pm3fb.c
+++ b/drivers/video/fbdev/pm3fb.c
@@ -998,6 +998,9 @@ static int pm3fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 		return -EINVAL;
 	}
 
+	if (!var->pixclock)
+		return -EINVAL;
+		
 	if (PICOS2KHZ(var->pixclock) > PM3_MAX_PIXCLOCK) {
 		DPRINTK("pixclock too high (%ldKHz)\n",
 			PICOS2KHZ(var->pixclock));
-- 
2.34.1

