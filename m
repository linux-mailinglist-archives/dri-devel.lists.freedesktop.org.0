Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7AA38C2CA
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 11:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DF56F5ED;
	Fri, 21 May 2021 09:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B406F5ED
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:11:09 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id t206so10731845wmf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 02:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fZW3JQxx6D8WVX2oNBGW9X5yO2BDaFGMJF00+YKqPKI=;
 b=A5JQrzz89LKYb4PKK/4p6SiOe6fwrWZLhkGZHc+YHHDGcT/pI9z7k6xomb2TInx0Co
 /TpvL+Nm6bYZhWtfyWSMQnGj7djwKXbcaOkf/2a/aimYPaEoXpfigz1d+3Rb+7mEHDYJ
 gSnPA2ZxQuHEa5tsbkYkb06mI4XainprrOjsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fZW3JQxx6D8WVX2oNBGW9X5yO2BDaFGMJF00+YKqPKI=;
 b=WUzfjdk9DjHO1PeCJhuYwL/quKL9d2QTxHiEwDX5S7iSYj7sSyGL7mTadJNWIXavmA
 evVqMVHqxalvBlAwj5TXK9vPKWsko278NBkbjBB+h9JgYhydvaTqRCxBYkoMLtMrYRhV
 X/M0N++sU/YDrzMoo/7BeF6G3GYI8ad2NGg2nqVw7EsrU7ueTQnS+A+h6oYby3bufar7
 OWUQ+pgMw70MrtAPn7oNKCwIQziH3T0PpvBVhhMFHYPdCvOO2vOfWlrzokzRbzccqAJI
 4eym5u37bhNYlA27n+ar7+lqw/wFLUcz08IjeMIfWugcmrwLGyvNT0/whPKCyepAhkWg
 PMEQ==
X-Gm-Message-State: AOAM530TUqCazxQWDVzpJtHVArmMKVqcKDyReyhyPRuviJhLkWa/0dCz
 13/jbZSoHvwUA0VtKQUWeRBrj9yJzWrkoQ==
X-Google-Smtp-Source: ABdhPJw6d0H5iCVyMlNf7Zs0wu+y5TeoX0pyoWftg09wKFB6Mj497YJZa+pM7j7aWEded6QYcd2YvQ==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr8441380wmi.45.1621588268506; 
 Fri, 21 May 2021 02:11:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m9sm1375216wrq.78.2021.05.21.02.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 02:11:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/gem: Tiny kernel clarification for drm_gem_fence_array_add
Date: Fri, 21 May 2021 11:10:57 +0200
Message-Id: <20210521091057.1664425-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Spotted while trying to convert panfrost to these.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 9989425e9875..e5dc98425896 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1312,6 +1312,9 @@ EXPORT_SYMBOL(drm_gem_unlock_reservations);
  * @fence_array: array of dma_fence * for the job to block on.
  * @fence: the dma_fence to add to the list of dependencies.
  *
+ * This functions consumes the reference for @fence both on success and error
+ * cases.
+ *
  * Returns:
  * 0 on success, or an error on failing to expand the array.
  */
-- 
2.31.0

