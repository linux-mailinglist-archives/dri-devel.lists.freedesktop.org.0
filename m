Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9817402363
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 08:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA3089306;
	Tue,  7 Sep 2021 06:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2E1894FE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 19:52:06 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id z2so4510969qvl.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Sep 2021 12:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=/HWCAki5G+lVbiHxWhcyDiqEfC+VEd9DkU7YY2YmJIE=;
 b=mEMfKCujdhFTd1UNMLYapbDASirmCMlcWBmAG+ICS1uHk9R14HJqkGrlQUPsRRI25u
 P0Zdf7eVspSFnAUulxZHC+nvRVxMvW//gGUBb8CUDuNmC2IFXxxn4vvlJ4V7z+doCXGg
 vlSfvWDj58XD4pjDO+DUegyIt4r6BzyrwM+K4+zeQYwEZCIqNuVJ4NuAX8dsujwTTabb
 kBNFqmzIhkNJK4n5NBMhrYpZovE4ssULYobKDasABMNlf/QYd3Eg3jurWNGYB55wd8H3
 yhAgSIZarxCVlXOwMuS9r5YRoNF8jqkbXRTKaQ3kQa+ZKGBUEnuYQ1rCcS/LoRLe7gxB
 Xfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=/HWCAki5G+lVbiHxWhcyDiqEfC+VEd9DkU7YY2YmJIE=;
 b=Ax8IsOi6Vt6uq6JtcDnSthYp9ZfDgSBeUgOJTa4imhDbEHHDjWDKgQkU56RbkMwnKi
 vZ+nWQ0e0XB8oWgPi9gBsYc15WEl2CYtxebc8u5XaRswmz+V5/N3Cnrx56EC7aIwiJF1
 GeXMB0UJg2MjepMjUj+Zq/cHEiBCotIvOGsKs8rhuGkj9uqMbvwU12obGetgJPOVxRY+
 tNF2bsG41aaPTJfElws3A4/iD2CZE8a6BfGxg6qbwBTH8AxczfVdoDOV9GoiiyFBdyh2
 7ojnkWLQpMTKDEoPTKwTF5MmPVtC87Pd5wrMSeXYXKDbBMU+Z70srstd0WjIcqA5Tclz
 Keig==
X-Gm-Message-State: AOAM533cc1fin1dQZEjXVer7//N0XNV06MBLwSKu9UngnrKbICr0XriY
 rsH9vfTv0Pl+NutbvhKKvzvkTw==
X-Google-Smtp-Source: ABdhPJxkMdyPqihtMbecIkVh3QvlQZ6CM5K9jNcXKt6Os+i9+qJJSTCujwN5BKXl3Q+du82VzB6IjA==
X-Received: by 2002:a0c:b293:: with SMTP id r19mr6066662qve.19.1630957925669; 
 Mon, 06 Sep 2021 12:52:05 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m5sm7280699qkn.33.2021.09.06.12.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:52:04 -0700 (PDT)
Subject: [PATCH RESEND] drm/rockchip: cdn-dp-core: Fix cdn_dp_resume unused
 warning
Date: Mon,  6 Sep 2021 12:49:18 -0700
Message-Id: <20210906194917.376116-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: hjc@rock-chips.com, heiko@sntech.de
X-Mailman-Approved-At: Tue, 07 Sep 2021 06:27:04 +0000
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

cdn_dp_resume is only used under PM_SLEEP, and now that it's static an
unused function warning is triggered undner !PM_SLEEP.  This
conditionally enables the function to avoid the warning.

Fixes: 7c49abb4c2f8 ("drm/rockchip: cdn-dp-core: Make cdn_dp_core_suspend/resume static")
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
I sent this one out in January, but it looks like it got lost in the shuffle.
I'm getting this on a RISC-V allmodconfig now.
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 8ab3247dbc4a..bee0f2d2a9be 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -1123,6 +1123,7 @@ static int cdn_dp_suspend(struct device *dev)
 	return ret;
 }
 
+#ifdef CONFIG_PM_SLEEP
 static int cdn_dp_resume(struct device *dev)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
@@ -1135,6 +1136,7 @@ static int cdn_dp_resume(struct device *dev)
 
 	return 0;
 }
+#endif
 
 static int cdn_dp_probe(struct platform_device *pdev)
 {
-- 
2.33.0.153.gba50c8fa24-goog

