Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E02AC6EDD92
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 10:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2D410E6BE;
	Tue, 25 Apr 2023 08:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7591710E6BE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 08:02:48 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id
 d2e1a72fcca58-63b87d23729so4409386b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682409767; x=1685001767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uNyUk8Ns/RhsfXSzaLAF6UMUhQKYphEjiySVHhAQeSs=;
 b=kvnDE7NQq2GkHlRwh0T2Dn2qzEVQKGGff1+0z6L/Ao6kHCxxXQW2X6Pgpip3tEht3w
 qFyc6GRVme8NGkhLh4aw540ZikHgV7nfHw4ZU+I9YzCNDctcXVKOG8mOQid+FJBtH5bp
 lB/yirmpeID98IXvxUZiDyRyaqz6J9DTPtIjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682409767; x=1685001767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uNyUk8Ns/RhsfXSzaLAF6UMUhQKYphEjiySVHhAQeSs=;
 b=EnZylaNDvCr4Pmk8ThSWYsP9/vlQCNUYimVmjd09IxE2wAXZO9xcc6DEKH6FU2e6jY
 2CRTGYLYjyVFzSKSME0i5B1y3RA5E1bRmdfiJZjl0+d7ce5gxXbHq26p5/4pWzAKLn00
 aUxmnlIBkcLwsAs1eMo49QlytEI51mmMVIF5/tgDkxREKcBA7yDbX6D4mjzlQCTgUGVg
 9Cji1C4eyxNKghDOGXzbZTyBz7sCkgoFA5MDqZfzo04XxMchbBRbHD5XXzYuJPpBci9O
 NkrsHJ0Pi4qqYFGqoFu58UFCQfWnU40f9RgF0YW3Ry80fyE2WP5pb4GhK7Iy9dBWCves
 HPvA==
X-Gm-Message-State: AAQBX9do6bFJ/Kip6W9UuUxBeCAKiScxBCyIXPrqp1/VRoqDohMGgWfn
 HoRQ4JDU9hEEr4l/acjZDiePsS+G0xxEf95h0CCvdIniZkbGTQ==
X-Google-Smtp-Source: AKy350bF/AI8kjM0PMqj8zc1EtjGr1LNX2OIUQmAv0RiZW7x1fQAQxZiDY4uu4s0smi4GTG8J9er7w==
X-Received: by 2002:a05:6a00:808:b0:63d:38db:60ef with SMTP id
 m8-20020a056a00080800b0063d38db60efmr21433595pfk.26.1682409766791; 
 Tue, 25 Apr 2023 01:02:46 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a627b04000000b0062cf75a9e6bsm8564986pfc.131.2023.04.25.01.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 01:02:46 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Documentation: vkms: clarify devres managed refernce cleanup
Date: Tue, 25 Apr 2023 08:02:40 +0000
Message-ID: <20230425080240.3582324-1-brpol@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: tzimmermann@suse.de, Brandon Pollack <brpol@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

added documentation to drm_dev_unregister clarifying that devres managed
devices allocated with devm_drm_dev_alloc do not require calls to
drm_dev_put.

Signed-off-by: Brandon Pollack <brpol@chromium.org>

---

This is my first patch to any tree.  I've tried my best to read as many
kernel docs etc as possible (wip). This took me a moment to realize so I
figured it was as good a candidate as any for a first patch (at the very
least to make sure I have the whole patching process figured out).  I
hope to make more janitorial changes as I continue to learn leading up
to the work I hope to do.

We're hoping to add multiple display hotplug output support to VKMS for
testing purposes.  Some work has been done already, but we'll be taking
over moving forward.  Our intent is to remain involved and assist in
maintaining these changes.

Looking forward to your comments/advice (now and henceforth!)
---
 drivers/gpu/drm/drm_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index cee0cc522ed9..12687dd9e1ac 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -969,7 +969,9 @@ EXPORT_SYMBOL(drm_dev_register);
  *
  * Unregister the DRM device from the system. This does the reverse of
  * drm_dev_register() but does not deallocate the device. The caller must call
- * drm_dev_put() to drop their final reference.
+ * drm_dev_put() to drop their final reference, unless it is managed with devres
+ * (as devices allocated with devm_drm_dev_alloc() are), in which case there is
+ * already an unwind action registered.
  *
  * A special form of unregistering for hotpluggable devices is drm_dev_unplug(),
  * which can be called while there are still open users of @dev.
-- 
2.40.0.634.g4ca3ef3211-goog

