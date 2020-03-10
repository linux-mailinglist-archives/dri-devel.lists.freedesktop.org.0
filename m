Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2683180C70
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDE66E8EF;
	Tue, 10 Mar 2020 23:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AA56E2DC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:31:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z15so15913095wrl.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TaPM+yiWV439Fzy3XUQMI+HGG8EtlsVxEFQ3vRRH5Sw=;
 b=d2me1s7ULKAeK9p/vgoO3AcVjguXJ5vlKgmzz9zC9aAMSeWOP8neMsZUfz8j6rxeSL
 j0tMmwOtvTdukiU9DOPwxcDKfLV0n4jGDAMfJIsxyn1ReQ5tlqrniSqALxtJxyVwWIKm
 vlKjhma9AKodVHEwzU6fylB+cfA8mqd7zoOeiPp4+dqRyDlSvPhdstaHzX63kX8H5uKI
 hG7W7HDZcCYNUf1zA4x/RkWJCsJZRvjwdDnHaZ4cpUy/u4jGeyqpHhsBaDAjCsnYNcAR
 4S+m5mxZr5mr6f173LPwq0EJtUE3j9RamfUoQ1/L2mbhXJzKpkcZGD/9waAix2mwoZOS
 0PUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TaPM+yiWV439Fzy3XUQMI+HGG8EtlsVxEFQ3vRRH5Sw=;
 b=F33c3xJF3usuCf8uccwZLl65G6KMDGJDYV0Er66D4fBLWAZVYcMqlCHuIQGG1IyP8y
 FLxFNlQ4nxbODv/1p5vdf579driI+8IWRR5Jk5vsw4qYOVpNdS1ppngr900gnxgSKwwj
 2YMue5oFfrQWfaaIdDYRSih2y1npSJAHkLG8lri/uxAPQKqVMgoL0ePgNFc5/KFfYs9w
 2iJ4lien6+zchI0YI7JrFioKTnEFyrHs5DuAtiWuKkEbF3EBbHClCmrnC+Y/y+/afPBY
 EeLarEC5k0OVmGi0NBSnwkzzrnT4SSkf+nRsmIejojZB8pdkjDP4Bzj+Dp3kOWfbHMCh
 7zmg==
X-Gm-Message-State: ANhLgQ230rLa9uSukf7X+HF6avk961gP7N95U5VzmSXEP4QVkmhnJZ9u
 FmcqSGMW93B2EkP7OVFm/6Q=
X-Google-Smtp-Source: ADFU+vtdC9olA8aA5REHbKpSKnDb0SKFwajF9MLgrdWe0koIUgGX/xKjQpu1LgVvxHG4sAdJUqb7Sw==
X-Received: by 2002:adf:8501:: with SMTP id 1mr29342949wrh.56.1583847092674;
 Tue, 10 Mar 2020 06:31:32 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:31 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 02/17] drm/tilcdc: remove check for return value of debugfs
 functions.
Date: Tue, 10 Mar 2020 16:31:06 +0300
Message-Id: <20200310133121.27913-3-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
fails. Therefore, remove the check and error handling of the return
value of drm_debugfs_create_files() as it is not needed in
tilcdc_debugfs_init().

Also remove local variables that are not used after the changes.

v2: remove conversion of tilcdc_debugfs_init() to void to avoid build
breakage and enable individual compilation.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 0791a0200cc3..3f7071eb9c78 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -480,24 +480,17 @@ static struct drm_info_list tilcdc_debugfs_list[] = {
 
 static int tilcdc_debugfs_init(struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
 	struct tilcdc_module *mod;
-	int ret;
 
-	ret = drm_debugfs_create_files(tilcdc_debugfs_list,
-			ARRAY_SIZE(tilcdc_debugfs_list),
-			minor->debugfs_root, minor);
+	drm_debugfs_create_files(tilcdc_debugfs_list,
+				 ARRAY_SIZE(tilcdc_debugfs_list),
+				 minor->debugfs_root, minor);
 
 	list_for_each_entry(mod, &module_list, list)
 		if (mod->funcs->debugfs_init)
 			mod->funcs->debugfs_init(mod, minor);
 
-	if (ret) {
-		dev_err(dev->dev, "could not install tilcdc_debugfs_list\n");
-		return ret;
-	}
-
-	return ret;
+	return 0;
 }
 #endif
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
