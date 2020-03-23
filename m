Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD453190712
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B796E43D;
	Tue, 24 Mar 2020 08:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A45F89FA9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 11:28:11 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h9so16569529wrc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 04:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hw2/ohwzvhdDAwTeOPYmsLkFpaTkgjXMGVp6G44h3PI=;
 b=SCUPXLUw/uicEQqC2yi+8megAkqOkf+9OKn4NIu/93ohMq8xiPzCItbINGWJlS9JI2
 6jl6HgXpuxawRuG5YtcT4Xj8qypZfmst+TP5C6IXyQlnqo90oOHI3QeKfqOc8+ODWDH7
 bV/lq4EcxwGI+1P0Toc5KZczWbtsehyOc/5zCgpyv4XcYw0Ay92LchAzDj8SzSkp+Hv5
 /8lA22jOUI4/sZFR/hlJRvFpl1DrUELX3w5BYp0pwNviujN065xrah7N7ZpFDJcodGhN
 S339MsktCXEOpIf8A6U6V0YTX93mqF0GOlGElvnrpYE19ncHEO7PTbZXt1UpgN3mKh8e
 raCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hw2/ohwzvhdDAwTeOPYmsLkFpaTkgjXMGVp6G44h3PI=;
 b=Y/msyAU3rrFFTHLO/6fGdAvkTuIkLn4U+WrqXxuOoWrXgYOI2zAuOg81tXnGX8vun/
 r9cQVUrQDD3UO6MywM9P61p6OKkdYh1zfgjk5yvzG4QfcSvUUJ6cFX32woKX7SjsOVly
 O7S9Ydhx2sLkVunFybDzkoV6jMBSORgZJiIMhjpXlNVp12YGGfjsx7OdSdnYwmkeCV4Y
 QAHEyPBfQ1iB+QbghOuxI+wjdofD3Wib96BqFRFy6CnPWkuKK4ovn+xLn9neFJZCnFeB
 4K4U7/ExlQpCOvgSgfag+FRMbyy/x18ru3+h0rGZERyI69Byk2KS1pstkd4ibrwdVCCB
 56Cw==
X-Gm-Message-State: ANhLgQ2BgtIWfgUzJbv0aVdwUGZBP9iaSyvvSObmxmAfQmwmksxg9G5c
 IMfxDqFP1+8X0SWqL3gHErI=
X-Google-Smtp-Source: ADFU+vtQPSS6AllqJvb5//lTd0+Eq5uJsrK3kd4PejlM7cu+aEmdFUqp0c8a4/FGUOtoiEAlGF165g==
X-Received: by 2002:a5d:540c:: with SMTP id g12mr24543560wrv.178.1584962889945; 
 Mon, 23 Mar 2020 04:28:09 -0700 (PDT)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id s22sm19731666wmc.16.2020.03.23.04.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 04:28:09 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/vram-helper: remove unneeded #if defined/endif guards.
Date: Mon, 23 Mar 2020 14:28:02 +0300
Message-Id: <20200323112802.228214-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:09:16 +0000
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

Remove unneeded #if/#endif guards for checking whether the
CONFIG_DEBUG_FS option is set or not. If the option is not set, the
compiler optimizes the functions making the guards
unnecessary.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 76506bedac11..b3201a70cbfc 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1018,7 +1018,6 @@ static struct ttm_bo_driver bo_driver = {
  * struct drm_vram_mm
  */
 
-#if defined(CONFIG_DEBUG_FS)
 static int drm_vram_mm_debugfs(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
@@ -1035,7 +1034,6 @@ static int drm_vram_mm_debugfs(struct seq_file *m, void *data)
 static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
 	{ "vram-mm", drm_vram_mm_debugfs, 0, NULL },
 };
-#endif
 
 /**
  * drm_vram_mm_debugfs_init() - Register VRAM MM debugfs file.
@@ -1045,11 +1043,9 @@ static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
  */
 void drm_vram_mm_debugfs_init(struct drm_minor *minor)
 {
-#if defined(CONFIG_DEBUG_FS)
 	drm_debugfs_create_files(drm_vram_mm_debugfs_list,
 				 ARRAY_SIZE(drm_vram_mm_debugfs_list),
 				 minor->debugfs_root, minor);
-#endif
 }
 EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
