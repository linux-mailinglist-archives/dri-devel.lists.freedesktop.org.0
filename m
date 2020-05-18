Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6D11D7311
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 10:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD50A6E1E0;
	Mon, 18 May 2020 08:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703526E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 08:37:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v12so10713371wrp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 01:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1vFYbej+L+7S2EhRLDWeid7SqWH8xjVGiJw3bq2rirE=;
 b=f5EUy+XlSocU8324NalYBdUZNBYwj+ffAkTULcF4JKDdfyEyWotn1yLfSLUXlumwzw
 zjb7vC3XSlmLAJDF6L5QUv+xamcESucmrCqrw3KDwXxanpeb2/Fl+p1LgDQbu/2Cpsyk
 RNsA1AhvbXFl1KIu00ZZ/ZEtJuQoiU7neg7V9SJT9s7rTGWzRmfwQYhXSMo3IJR0l0TC
 4XsGLREIO0O54Obs7HmuRoZJeSG9/XAlruPJY6UpXZCqxQExPygaCmV5WFrMPIREFj50
 mkX3AG3BVcTUjNe8CdL0lkgGd7ncdY1eN4oBpdPB44FV6MP5RREoEYP3RN3tLXkznCXY
 3NIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1vFYbej+L+7S2EhRLDWeid7SqWH8xjVGiJw3bq2rirE=;
 b=QjlaNwHLAQbEJeaFo59PQtTcfOtOW0w8LJu4JRapznPWsXZBVEmthIcoBgwyAslmaX
 cpwqlzwR1AwUCewZzKxePi+4ZE3Uu7dGSy18GhIZlVF8lBQs42QVAsupZTn4dywKxcoj
 /yZ5iti4tbYhNVHEDiUcBcqDF6BcYzUngn4pRZS5V2t2ITQ+XTmJFfAkszQvuOSDmQdv
 TXWSicp375KDbfsPNDDxmzgbUQYcqtPmUXQnb7O0pYF++O2h+scovscZ760DJvWmHqPQ
 sLo9aOXE7H6YbIrPb39XBSunK779rJYDIbNfavo+v7/2UA6qt3fA0b3qrszLiEyK6D0/
 R1Ug==
X-Gm-Message-State: AOAM532kyi1Zsuid2U59J0dU8ksXg31Q/1gGeyzlyF9koXko4Al/g+RG
 qr5JgpOJGc0omt0bp1lmZEoYrMFe
X-Google-Smtp-Source: ABdhPJwPRyjV0+6w+fePkfroqN3iFGJpvxj09KMUvZsTy/LdGWTdJ6RqQIvjHXwutL7JMXSEC6N80g==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr18351422wrt.411.1589791064757; 
 Mon, 18 May 2020 01:37:44 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id w13sm15010789wrm.28.2020.05.18.01.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 01:37:44 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/file: wrap excessively long line
Date: Mon, 18 May 2020 09:34:56 +0100
Message-Id: <20200518083456.132248-1-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/drm_file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 9b79bfc60ad7..97f7793b693f 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -342,7 +342,8 @@ static int drm_open_helper(struct file *filp, struct drm_minor *minor)
 		return -EBUSY;	/* No exclusive opens */
 	if (!drm_cpu_valid())
 		return -EINVAL;
-	if (dev->switch_power_state != DRM_SWITCH_POWER_ON && dev->switch_power_state != DRM_SWITCH_POWER_DYNAMIC_OFF)
+	if (dev->switch_power_state != DRM_SWITCH_POWER_ON &&
+	    dev->switch_power_state != DRM_SWITCH_POWER_DYNAMIC_OFF)
 		return -EINVAL;
 
 	DRM_DEBUG("comm=\"%s\", pid=%d, minor=%d\n", current->comm,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
