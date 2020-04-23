Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3010D1B6723
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FC86EA4F;
	Thu, 23 Apr 2020 22:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F406E9FC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 22:35:09 +0000 (UTC)
Received: by mail-pj1-x104a.google.com with SMTP id r3so6209895pjq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 15:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=dbCemmTBxtNcKPwKe5J0Ro4VRz3gGSecrsxNl0sYvi4=;
 b=B7DU6i92zef6mG0tMggcANnL0Glb7kdFKVRvL4aXBR8pZJ8czlwZAw+F/9hcQH6H9U
 UCpif/tybxS6DDDETvnOd6z4OAfxqLpo4arA2vXTj9dz4bS6I24POftkA4bZ/vlADTcn
 Zrk4xIxnnMXLyojy8P78srMhqFbQJmesPC0l+RJhK9oa5uFbKbyqrsrw5HaM5Eo8R6YW
 LxUy2srDxyqH1Zah6fZX9z18j/53ZLWWbgK4ICTkbJY+pM/tUK8S4ALkG6HpLCRkeJ65
 OGP0Evh39ac6f46ih75X1ZSl3hfyDSfrvW3ML+8oUiOBNSyLxGY9J+4XW/G8QFJTgJbM
 ebcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=dbCemmTBxtNcKPwKe5J0Ro4VRz3gGSecrsxNl0sYvi4=;
 b=P5oc0rWL/yxQQZCekKtunV8aqhWJq1t55v5gmZpyrnVvYNlB8oawIrFqf7hyKqzNVX
 g0gkpsJXEMbxkVXKIP8Tku/PV7tUxyeEnTGdePFt4OT4ayHXRcEY32Rnl9ET3Ya5tZZn
 Xjwy6QRhcZrxgsM0ScsOKMhikznkdDOIiLvMMkBUvyENY9I6a388UcP0RXcmBQ1oI2Yi
 wEYZ3rbC9+5jqNQ7dbm1ANu+iQV3zTQSorVTZhfO2aUQ7ZbNAAk1f++gfFRWygxOd3/l
 O2I70iM3cIsBMH7pa62e6zmg6qyZyTkSvq+/mJn6Ppb2oTKXFvv7PW+cbWgJm7GFS7Ni
 oU4Q==
X-Gm-Message-State: AGi0PuatoxmKxK/Ag7j3rSBba7x+wqm27i9fR8h68czff/pyBQboJYws
 t6x/5cWAyW1Vj90fVyDxa+bIYQM=
X-Google-Smtp-Source: APiQypLGxmglgQQ6eTBtJXkMlsrYnsNqGj+Xlu2lvS3wzJSr5v343JkXDLniw4iaJJAT/GR9kNbcdDk=
X-Received: by 2002:a17:90a:3268:: with SMTP id
 k95mr2879190pjb.185.1587681309402; 
 Thu, 23 Apr 2020 15:35:09 -0700 (PDT)
Date: Thu, 23 Apr 2020 15:34:59 -0700
Message-Id: <20200423223459.200858-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH] drm: pl111: enable render node
From: Peter Collingbourne <pcc@google.com>
To: Eric Anholt <eric@anholt.net>
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: Peter Collingbourne <pcc@google.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The render node is required by Android which does not support the legacy
drmAuth authentication process.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index aa8aa8d9e405..246662129715 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -225,7 +225,7 @@ DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
 
 static struct drm_driver pl111_drm_driver = {
 	.driver_features =
-		DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+		DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC | DRIVER_RENDER,
 	.ioctls = NULL,
 	.fops = &drm_fops,
 	.name = "pl111",
-- 
2.26.2.303.gf8c07b1a785-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
