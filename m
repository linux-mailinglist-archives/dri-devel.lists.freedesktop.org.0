Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F063E1E6898
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 19:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1986E5B9;
	Thu, 28 May 2020 17:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927646E5B9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 17:22:15 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id a45so876387pje.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 10:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=qcSzY/uymA1q+msx4bjKvFPacUb0/rhanm5U4h595gk=;
 b=EMe8pdSMV3jP/8QdUW1bAa269r+DWPydOCiOdYSSbNToAB/LSZqpWZb67ctpSHC1xG
 hi/t8r2btRhb4U/zmYs4grR/IYHEB4rnlgiZ9Hb7wJp4+xotpWznupRzx+GB9IbMo12s
 i844D61IioYB/xMuOvP2pQWIMnb4ji2p9l5Vy5hmF0bcDIhz2ovrsMH+u0Swju2QDe3U
 a9k73K2WSkqjx5qPNY2o/k6Vq4gsxUzo+DHki6ghCnECL+czNbeCrzK2FOatS4SGJTWi
 cw//UvztdLyYI+1xAlD4GYX+ajNWcb0gMYBnimxVjoRfS3JA5BxG4YJ9QWCfZdYWZRVG
 EQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qcSzY/uymA1q+msx4bjKvFPacUb0/rhanm5U4h595gk=;
 b=mDrr6fJFe+LuER6SBCEzGjQzjt3/4sqyV7u7jU4fm5TOVHgI4oAtilvY96MAQ7Cfv8
 0f/sSS9TzwLfNEEkERjlNFLnC+ym+h7QUallZIrKjv6eYf4QDEC64EQtCCmsAoBvhQAJ
 fj+fInjx/olsUVHPMLPI5Lgl919F12c0lzfEOmWjS02K23IYoW8nDhpqOqU/Rw//vjM1
 Mx49MSWYOQfAFCpDNyhUEDqtTKrJIsh4xLffumOuJgG4wOzRQ3zQXo1bfv/qz8BdWemZ
 gkqfXYSJI0p6/Zy8MwOpsJr0OOW7pnc+Eqc8tVQt8PMR4uqwEHc76bNTrU4sanjScjdz
 YEbQ==
X-Gm-Message-State: AOAM532ZlwFgNmGaF+oRHn6jtlZRi8YKwhRYMqnICoT/qXk7DuBtmgEN
 NcOVAc1LSKY0rvdHWRmwa80=
X-Google-Smtp-Source: ABdhPJwMKV6VVQS4lZTjyIbSP9Z+d+mVGjfwC6ZCtmJiJ9eUG74r7/zHGDAoDWr9od9cwTAl4zdIGg==
X-Received: by 2002:a17:902:9a43:: with SMTP id
 x3mr4567199plv.332.1590686535048; 
 Thu, 28 May 2020 10:22:15 -0700 (PDT)
Received: from localhost.localdomain ([61.83.141.141])
 by smtp.gmail.com with ESMTPSA id i11sm5270791pfq.2.2020.05.28.10.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 10:22:14 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] Documentation: Fix typo error in todo.rst
Date: Fri, 29 May 2020 02:21:59 +0900
Message-Id: <20200528172159.24641-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sidong Yang <realwakka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change wrong function name drm_modest_lock_all() to drm_modeset_lock_all()

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 Documentation/gpu/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 658b52f7ffc6..436489b53fea 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -305,7 +305,7 @@ acquire context. Replace the boilerplate code surrounding
 drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN() and
 DRM_MODESET_LOCK_ALL_END() instead.
 
-This should also be done for all places where drm_modest_lock_all() is still
+This should also be done for all places where drm_modeset_lock_all() is still
 used.
 
 As a reference, take a look at the conversions already completed in drm core.
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
