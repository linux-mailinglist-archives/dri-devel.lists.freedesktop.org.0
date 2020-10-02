Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E844F280E55
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 09:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D756E081;
	Fri,  2 Oct 2020 07:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BCE6E054
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 07:56:28 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w2so650323wmi.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tpFxooNhW2Kvrm+vhiaGDk0dQm8Q1RIvIKIJHt6cB8M=;
 b=ZpmYqQE/blhaQPmobzcS5z/BN9s/VEaP6+DSHQ8aRLDJHuFQF855vbqpjaulSaoAXR
 7fWY7ZY6qpJFeyta0OZPTNCdcQoMrlmH5aW4M7+76iVqvd/P9dM8cDAa4I1pcg7WO9VE
 fadiLwAQrtKtFWNukyYyrvHHaQ4EUijv9ZzKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tpFxooNhW2Kvrm+vhiaGDk0dQm8Q1RIvIKIJHt6cB8M=;
 b=JPoq/KeNrujxJUt602BSWA5KloofAOg5kxErQ4yxb7uEkOPITGZDaIuEsD4uxAxbIb
 fc1oU4qo4jhj9kd0GbwvjzCRUw+3U/6MJYePQR3qY9RQ2toceLpev5zD78+5sAVhk5qg
 Py7SDaUp/VYHGNQtt2rfOZKGpntQ/vlhU0RjrUezl6AVLLQ4EPVGQIe5UNxxcy/V4jcY
 3PIUSs+gEAMBOAdmUgmWv4SPS/wsYpRt6QJcASGhcTUq1QL0QmANXNfJYlZm0we8/2ZK
 kvu8rGg5dvEKmbQ7BCwlEpwPKc8MbL493rGtQ8yCyNurPy82+YfUcYsGyBGjanJoOqzw
 LH6w==
X-Gm-Message-State: AOAM5338O7NDlWqO6u44c7hwpEJPM34uw6biyBsNd7LZUhHQrkTDXqeK
 tpWE0T1qJxNOmoDXpkW6sJKD0YJC0s99OBP2
X-Google-Smtp-Source: ABdhPJxY1l6UdcC9lmkoMd69g3mATXIDpY4XANnXyQ6MWuiLi+0Myuh3uaJmYWNTVO2ZfnXcyskENw==
X-Received: by 2002:a1c:1d8d:: with SMTP id d135mr1321318wmd.173.1601625387047; 
 Fri, 02 Oct 2020 00:56:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t4sm819810wrr.26.2020.10.02.00.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 00:56:26 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/atomic: Make the kerneldoc a bit clearer
Date: Fri,  2 Oct 2020 09:56:20 +0200
Message-Id: <20201002075620.4157591-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Crank up the warning a notch and point at the right set of locking
functions for atomic drivers.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_atomic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index aac9122f1da2..b2d20eb6c807 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1642,11 +1642,11 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
  * to dmesg in case of error irq's.  (Hint, you probably want to
  * ratelimit this!)
  *
- * The caller must drm_modeset_lock_all(), or if this is called
- * from error irq handler, it should not be enabled by default.
- * (Ie. if you are debugging errors you might not care that this
- * is racey.  But calling this without all modeset locks held is
- * not inherently safe.)
+ * The caller must wrap this drm_modeset_lock_all_ctx() and
+ * drm_modeset_drop_locks(). If this is called from error irq handler, it should
+ * not be enabled by default - if you are debugging errors you might
+ * not care that this is racey, but calling this without all modeset locks held
+ * is inherently unsafe.
  */
 void drm_state_dump(struct drm_device *dev, struct drm_printer *p)
 {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
