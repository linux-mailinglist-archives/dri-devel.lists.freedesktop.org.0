Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D335433EBD9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 09:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0999A89B05;
	Wed, 17 Mar 2021 08:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492BA89B05
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 08:52:37 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id t4so38140126qkp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 01:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Uuz84Yw1409dXslxoeVZS7YIkkm9dB1XdIK6tSjsNA=;
 b=lSwLNJBPPZTTe4AJDNYR0kSTs/YZBuY28ZN4+RvC59dHnMwYi4QRM0uVlAP4CDE1aw
 2sX4w5VUq7JUuS/Afe79kgQ/fCHhJhV+dsIQ4Vf9zgxSkK0KDh+j5vv1ETfmiYA13Sdy
 ed94J7Pp3yeUR+htYdZ+ppplEKaZBePN7Ew6ZvE7G1JtHLpbf8peZ44sxN4dgQ5hcLaF
 QrV58KPeryrHKRATGyg84TM3ssMYBvfiIKlOCjjNHl2Hnjnwek6NwxmWRrIZyQ3zYX5s
 03mAk/SC38SPxol0CCenQwJ3neyhgBpR2tbY76GFd0VfUctzg+7d1crNB8xvnabIaMgG
 xSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Uuz84Yw1409dXslxoeVZS7YIkkm9dB1XdIK6tSjsNA=;
 b=qaxrC/nxu7D5hPNdIh4kRqBKNgdJs25d9zLHL7cBnQZjrhpuYKd5HqJwiiVnzNr/ho
 nRRclk5B8X9iFb3lAhmvqv38Fnk0D8xSCU0Jab3AG8No6pInSKuOUin3v2jJYj6eqdCd
 S8Eg1hSWVwDg0y/YOimcD9eyUvOTVG0lme013z8JvGwvi5agyID/3UZFqfGzsGPrA1Yo
 BPIsx1QCg1ly0NcvlbyQ5mMsB96EIEw8JEELtsHFSMGxGhxwtpp9Upks974xqHfkgvtK
 zwbwUQ+A6G+3LvfPvvoBmyEIUx/GrrYRtmxFTdBztEWMtSAeZJ/Wt8P5pz+iRJ/YCazY
 MCfQ==
X-Gm-Message-State: AOAM533VgiZjI6cwbHVLETkrU0mGYFWb2VkbmVJEpSbvX5ypcZHanMrQ
 K/NjNk0DnEcx6Gwgr4zSEB4=
X-Google-Smtp-Source: ABdhPJwwFVbF/eoxUOO3Pew3ehkXS5Du9ET/7izc3OH/eh0Dof6QFiHfheQXzlKK1tWgbnJZJLA1Aw==
X-Received: by 2002:a37:6796:: with SMTP id b144mr3578497qkc.432.1615971156520; 
 Wed, 17 Mar 2021 01:52:36 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.48])
 by smtp.gmail.com with ESMTPSA id f186sm17331260qkj.106.2021.03.17.01.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 01:52:36 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: Rudimentary typo fix in the file drm_drv.c
Date: Wed, 17 Mar 2021 14:22:10 +0530
Message-Id: <20210317085210.3788782-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/refence-count/reference-count/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 20d22e41d7ce..2bfc724e8e41 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -203,7 +203,7 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)

 /*
  * Looks up the given minor-ID and returns the respective DRM-minor object. The
- * refence-count of the underlying device is increased so you must release this
+ * reference-count of the underlying device is increased so you must release this
  * object with drm_minor_release().
  *
  * As long as you hold this minor, it is guaranteed that the object and the
--
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
