Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA72A17181C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868AB6ECBC;
	Thu, 27 Feb 2020 12:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E896EC94
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:03:39 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x7so514820wrr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A6giR7jkVNS7f8olWtdVB9r9gFLVEFocgKkHFBXumSM=;
 b=qtiph7rTPwSvoI8X9dyOJvpnelDSW6j0fJ9qb82EkXIWN0iu4X5c4qBKwi4OJSat7t
 e25bYmOIjcLHWX11AkNRI9Hjvp2F1P0fSaitDVtKr4ICufmsHgHiVM4ikqJUroaKfRac
 ud40Z77NAFACV4PgRFMLvTEGYmxzdZzKeV7hbmgLUHbiIJYANJga4ZYWvQVFscPgw47+
 jjY3l/RZn6ep08kgkFPXD8vmSobd+hQvhNyyktqD7WbREkmlc5NlDh6NfpXAxbbdfvtE
 fT3XHQUdj42+YyccNOU/pFBRnX+4LB7gHr42btocC8WWHvWgWM/475ImAZdBMjN+LlSb
 YYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6giR7jkVNS7f8olWtdVB9r9gFLVEFocgKkHFBXumSM=;
 b=DnmC2+Fn/opVcCQai3P+wHMMf9Xg7HTCSNc+V9VFR2oIRdXSETVBMdU9gL92B3PJoy
 7mtCMGA4CZ8kMrAdrLcBiKbnGMh0608yqragNpUBslIfSSoH+BTuMhThWmOobStEFINk
 CYr+uKdSKPI4IFMYzbwScS8GhvSB8HrqFUQvx5vFKGfohw0ZfyOfvhnporM7UXN4lBNI
 icObjQkvOmptqY4GlySeC5VYEMCNjoeViV0r+VNmt0U3MkVAz7I81R/9PIQtUP5Y+o+a
 XNBoteZBqqzSfnt8WkE8kR8A+X48CTtXuwruQl+DvwurEGTe4F6gJSRDYafZjqOF6bzA
 Ynhg==
X-Gm-Message-State: APjAAAVzKZcc1IeT3aTr2nWlDikIeJDf7R13BZ8VPQi4je52i836QFMQ
 Ky729RgrbRwnc0Cj2pFO4fg=
X-Google-Smtp-Source: APXvYqz2UYFvgu0Eu1AiFlAQOUZiIvr7aNsYGZxBKzzaL/wlRLO7BinAulm+0C+yFoZDQ0ISPP6ABA==
X-Received: by 2002:a5d:5148:: with SMTP id u8mr4826270wrt.132.1582805017785; 
 Thu, 27 Feb 2020 04:03:37 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:37 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch,
	airlied@linux.ie,
	Eric Anholt <eric@anholt.net>
Subject: [PATCH 14/21] drm/pl111: make pl111_debugfs_init return void
Date: Thu, 27 Feb 2020 15:02:25 +0300
Message-Id: <20200227120232.19413-15-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227120232.19413-1-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
drm_debugfs_create_files() never fail) drm_debugfs_create_files()
should return void. Therefore, remove its use as the return value in
pl111_debugfs_init, and have the function declared as void instead.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/pl111/pl111_debugfs.c | 8 ++++----
 drivers/gpu/drm/pl111/pl111_drm.h     | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_debugfs.c b/drivers/gpu/drm/pl111/pl111_debugfs.c
index 3c8e82016854..26ca8cdf3e60 100644
--- a/drivers/gpu/drm/pl111/pl111_debugfs.c
+++ b/drivers/gpu/drm/pl111/pl111_debugfs.c
@@ -51,10 +51,10 @@ static const struct drm_info_list pl111_debugfs_list[] = {
 	{"regs", pl111_debugfs_regs, 0},
 };
 
-int
+void
 pl111_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(pl111_debugfs_list,
-					ARRAY_SIZE(pl111_debugfs_list),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(pl111_debugfs_list,
+				 ARRAY_SIZE(pl111_debugfs_list),
+				 minor->debugfs_root, minor);
 }
diff --git a/drivers/gpu/drm/pl111/pl111_drm.h b/drivers/gpu/drm/pl111/pl111_drm.h
index 77d2da9a8a7c..ba399bcb792f 100644
--- a/drivers/gpu/drm/pl111/pl111_drm.h
+++ b/drivers/gpu/drm/pl111/pl111_drm.h
@@ -84,6 +84,6 @@ struct pl111_drm_dev_private {
 
 int pl111_display_init(struct drm_device *dev);
 irqreturn_t pl111_irq(int irq, void *data);
-int pl111_debugfs_init(struct drm_minor *minor);
+void pl111_debugfs_init(struct drm_minor *minor);
 
 #endif /* _PL111_DRM_H_ */
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
