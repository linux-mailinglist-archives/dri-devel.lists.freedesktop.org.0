Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395B76EECE2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 06:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121D010E873;
	Wed, 26 Apr 2023 04:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAED910E873
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 04:03:34 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-63b52ad6311so7867903b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 21:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682481813; x=1685073813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jRvA37+TZqURtYKAjHmKMLWPmrsZ8ddC6S0Q1RiCXTs=;
 b=h+yrEfGpXUD9SP5n9yWLh2sTJDF5/bjZR+vYQbropc3QIhIBQT6iiCBv7emIgzengo
 idoBYQVz1IVsabub24GLyOWjfOAPGLCIcgxKKAEJ9+RMCKsNKQh2tGHxaz0Od4wx0wcs
 6dkEBwf1Zc3r+aDQlxfBcdsU5fyN6l8NFAueg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682481813; x=1685073813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jRvA37+TZqURtYKAjHmKMLWPmrsZ8ddC6S0Q1RiCXTs=;
 b=G8kvNnLxZku/09jUGSCYEVEIIzKGymafJjDnFvH/C8+KV8TxR0It9hy4BcFRlw4s5C
 EiAW9xGX/J6bBroJylCp26UK/JqLAyH1rYQ1sdRcyi8Q/p/tRG4N+BRi3/uMsymbSXFy
 B/ajPO5apCnNvsuydJzYz3zEdB8y9l5krYRBGRy+R+MfdNVsD8FUvNbVO0lX2C+5EesM
 8mMye+8aMXNthJ4rcEN1GPLpHOI5sFfUlaR3uwch2uRd3SzeP3DAd9H3aSmQ9MWPXlNn
 eES8L8VcGy8Tz1wTgouAY67sbon1/QpV8JAdBQQ5VVq3HQ5HHX/izC55XPCNT6tOTrm9
 BrRg==
X-Gm-Message-State: AAQBX9d8VW48+DWfFxghDWJsuDgGoB9Ct3ba9mwXhoqiBpyPULR+5tLL
 2+ZK2BS40/l5O5730RAfFjzaGT9fqND9dZMCJk8RKoVf
X-Google-Smtp-Source: AKy350btPWvDbB/VqNYU+PLrAt45K0WY10weyUZ3PytbEaUVilXQVxgp/mrZrMueMTmxZsjCjn/5ug==
X-Received: by 2002:a05:6a00:1947:b0:63f:18ae:1d5f with SMTP id
 s7-20020a056a00194700b0063f18ae1d5fmr23143113pfk.29.1682481813500; 
 Tue, 25 Apr 2023 21:03:33 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a62a115000000b0063b64f1d6e9sm9015886pff.33.2023.04.25.21.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 21:03:33 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drivers/vkms: checkpatch.pl suggested style fix
Date: Wed, 26 Apr 2023 04:03:27 +0000
Message-ID: <20230426040327.396866-1-brpol@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
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

added a newline for block comment

checkpatch.pl output:

-------------------------------
drivers/gpu/drm/vkms/vkms_drv.c
-------------------------------
WARNING: Block comments use a trailing */ on a separate line
+        * which ix XRGB8888 in all cases. */

total: 0 errors, 1 warnings, 274 lines checked
---
 drivers/gpu/drm/vkms/vkms_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e3c9c9571c8d..3be240355255 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -148,7 +148,8 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.cursor_height = 512;
 	/* FIXME: There's a confusion between bpp and depth between this and
 	 * fbdev helpers. We have to go with 0, meaning "pick the default",
-	 * which ix XRGB8888 in all cases. */
+	 * which ix XRGB8888 in all cases.
+	 */
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
-- 
2.40.1.495.gc816e09b53d-goog

