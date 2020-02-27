Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07545171806
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E196ECA7;
	Thu, 27 Feb 2020 12:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FCA6E86D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:03:57 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f15so3240936wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qtHezE3UGL1RPYJOwBTjyDIi0Fh4N6k97/ik2JLlTsM=;
 b=TMJX/X0S8sBJVi0Yp1uUUHmgnXpAO/i1XPye+sdM84ZXBcJFwfGuRbf0QmdaNi5v6+
 WWs3HrfR+0tNL6/ctrvxd/vP556Ce6RZvgrl1hkmaKA1c9dxIsZ2Y7lOS24IeQwXHXv9
 e31xzGLy7AaM9+eoo5mFcNSF33Z6WfCXZX7uZCSCQ9EvNL4U6YWUQiGNectCr3YpFa+X
 gmpWJRW6j0+OrhUChyYwCCP0MV7mCK4tjF3qBjxVwDjROE2oRJeo5W0zZRh4aWZtoFMd
 59+b4OgpXT6Dg63JnxaVfhNV3y4w9ChKczgBJd3tMh+yk/ZIvdmtLkYTM7pmxxn7N+kZ
 qSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qtHezE3UGL1RPYJOwBTjyDIi0Fh4N6k97/ik2JLlTsM=;
 b=HOUSJ3HnBcZG+3vFya6veoeGUjRfmT+1/ZshUeB6Xcc4Zql2MtqZLcl9QSl2h9ViXC
 HT4OOcyFgUA8elVQHCDfSuq3eIdwJGTzMaspz/NPnK/Ac36+HRwPih9l+o15/kKCG3/Y
 WF4qFYQf4CO0d8Fr0AiZUVnkTxHGXa5dpqqkqfJuAv3ArcfUxE0Pm2MYdWv0WQwBRZFs
 G9E82sOGYlW7CLGJwKyqquQn2Xen3yKD9lSO1HsWDm40CRadtFb6QUsr8Id8jIkPwK7q
 eJtP+Xt4bxAOm6Bznady80V9pgUrUugWeAjk5BnT3Z5AThN7kGpdwP9yMbiqWCl4NVFx
 hMew==
X-Gm-Message-State: APjAAAXv7xi7UdwNmK4JbV/XZXtBQ/SPl9yYC7DSpjEbBKV7tW/ym/QD
 +RvtS/24LpsnN7LNXU8hTro=
X-Google-Smtp-Source: APXvYqws1uPMjBRoMVkeVqz7GBquunp9ZSqYKqUnCjXmOFLkbEp4mvdi77iUzZXlZKIR+Os1fu9FAQ==
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr2127251wmm.79.1582805036202; 
 Thu, 27 Feb 2020 04:03:56 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:55 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 19/21] drm/mipi_dbi: make midi_dbi_debugfs_init() return void.
Date: Thu, 27 Feb 2020 15:02:30 +0300
Message-Id: <20200227120232.19413-20-wambui.karugax@gmail.com>
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

As midi_dbi_debugfs_init() never fails and does not return anything
other than zero, declare its return value as void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 6 +-----
 include/drm/drm_mipi_dbi.h     | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 558baf989f5a..113a767442d3 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1308,10 +1308,8 @@ static const struct file_operations mipi_dbi_debugfs_command_fops = {
  * controller or getting the read command values.
  * Drivers can use this as their &drm_driver->debugfs_init callback.
  *
- * Returns:
- * Zero on success, negative error code on failure.
  */
-int mipi_dbi_debugfs_init(struct drm_minor *minor)
+void mipi_dbi_debugfs_init(struct drm_minor *minor)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(minor->dev);
 	umode_t mode = S_IFREG | S_IWUSR;
@@ -1320,8 +1318,6 @@ int mipi_dbi_debugfs_init(struct drm_minor *minor)
 		mode |= S_IRUGO;
 	debugfs_create_file("command", mode, minor->debugfs_root, dbidev,
 			    &mipi_dbi_debugfs_command_fops);
-
-	return 0;
 }
 EXPORT_SYMBOL(mipi_dbi_debugfs_init);
 
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 33f325f5af2b..30ebdfd8a51f 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -192,7 +192,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 })
 
 #ifdef CONFIG_DEBUG_FS
-int mipi_dbi_debugfs_init(struct drm_minor *minor);
+void mipi_dbi_debugfs_init(struct drm_minor *minor);
 #else
 #define mipi_dbi_debugfs_init		NULL
 #endif
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
