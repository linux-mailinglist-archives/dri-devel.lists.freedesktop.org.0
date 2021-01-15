Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 532DD2F74A0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BE389A74;
	Fri, 15 Jan 2021 08:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F2A89F55
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 07:41:40 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id my11so5123875pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 23:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=O+ju7GzUSXgEyONqw2hDG3TWhp+lRUaB6LNMrBnInUE=;
 b=c4aQ4cyO+IgwfmpdLIqX1q419sayYIGKJD7IUTfQz/7f8CHhBNqAF3Wzrjya7/P7hH
 TxL/eVFXPOVDkVf5wwZ7v4kMLifmKRHFlyLUHIGST1zgiVGMHkR4hNYOkf4lveAhA0oS
 1JhKVacOoCfPS5nlfV+CbFh2UMrIOLz53NDcGWOpf0HOehUB3NoZjDItyhGiAit5SYUA
 htG0JawNAtwSzaVx015CNsEZEjiDBl98T+2wbYYjqRGUd5LgPSdeAVGnCAz3lL9uOC12
 8ABg0muchJyr4U4WR8mCRraOsIinPmYPLeoNSV/pmoNU0DQDIiI2WD4AIRmyA6QaSdUH
 eMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=O+ju7GzUSXgEyONqw2hDG3TWhp+lRUaB6LNMrBnInUE=;
 b=PYqkDqHpUvIj9lV/Vf16LlDvEWzY06Z1pD/UmsKX4ijPYzUcfebKmUt3gq3uvq+XnC
 iPSk2c9pNOGpR8yc3bI96mA+xr06OX55Cl/N8VffVFCB+541+AXBagdZ8jfmz8mjKAPS
 FEVla9p9KvnDjF8yPrPRYiWt27n4AhfJLbb535aNttYSJB3FFA685zVMLTGg0FLOWvbE
 dd2i6DSkyXf1oGK8c/FGzTsVKwgm043ujmG6pNGnDxFYCvue02tEAgUJEp0sKjoag4nF
 CSq239BHP2LxJ4gMwc9UVklYktikoKjxUbTeql5w2xs9RY+VP2lbs/zOjnfWyV65Iebx
 1zNw==
X-Gm-Message-State: AOAM533OIoQfnEK+u585TTp+Y2c7GKPUfk36QWsO7nxZ14pBOMZIissr
 vAKJ1s38grl97gHQag0hQ4pa4w==
X-Google-Smtp-Source: ABdhPJwsuvXD5qgp029828wqLpR1cX2SOM/CqGlwkz97B2cHjqrKqUR1XAm+Epc/0bMXU0qByl31WQ==
X-Received: by 2002:a17:902:a412:b029:db:cf5a:8427 with SMTP id
 p18-20020a170902a412b02900dbcf5a8427mr11747670plq.48.1610696499826; 
 Thu, 14 Jan 2021 23:41:39 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 4sm7656692pjn.14.2021.01.14.23.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 23:41:39 -0800 (PST)
Subject: [PATCH] drm/rockchip: cdn-dp-core: Fix cdn_dp_resume unused warning
Date: Thu, 14 Jan 2021 23:40:43 -0800
Message-Id: <20210115074043.2944-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
Cc: airlied@linux.ie, Palmer Dabbelt <palmerdabbelt@google.com>,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Palmer Dabbelt <palmerdabbelt@google.com>

cdn_dp_resume is only used under PM_SLEEP, and now that it's static an
unused function warning is triggered undner !PM_SLEEP.  This
conditionally enables the function to avoid the warning.

Fixes: 7c49abb4c2f8 ("drm/rockchip: cdn-dp-core: Make cdn_dp_core_suspend/resume static")
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index a4a45daf93f2..063a60d213ba 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -1121,6 +1121,7 @@ static int cdn_dp_suspend(struct device *dev)
 	return ret;
 }
 
+#ifdef CONFIG_PM_SLEEP
 static int cdn_dp_resume(struct device *dev)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
@@ -1133,6 +1134,7 @@ static int cdn_dp_resume(struct device *dev)
 
 	return 0;
 }
+#endif
 
 static int cdn_dp_probe(struct platform_device *pdev)
 {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
