Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F971717FF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF346ECA2;
	Thu, 27 Feb 2020 12:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44826EC94
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:03:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l5so3019244wrx.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7k4B4xeoXs3YLBA2vMb2kP4DHWFb+LUmdU32fG0p8Mc=;
 b=QZEyoBhf8xr57XhiV03Vy8ZxmVUbKR9r6uCPvct92F6D/65KC81cqCQPh2hpjre2nI
 LbR26cUaunqkI669S3tJ1GQoWrYrvTl5rt+h8mPneCt7fJqnIxt70dgU6/NnYk7/1a2u
 IwYLF4KExObhKiCPoORcF1cWk/9dlVsXbj+/P1bbMp6IhCJkCt0/ysoV9jMYq40427t9
 bOu/xjm99LLTxI7Kq2NtVv1fsOwsv/TGnhgVj6305WrE1Dew0LQ+cTmqbd8CxiVwjIgA
 zIKQuY6EcjOaGRleuNN74LCNLhz1ycrUrRTChFMsswmBnDc37tVHVc5463zRaFaPc+bo
 AQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7k4B4xeoXs3YLBA2vMb2kP4DHWFb+LUmdU32fG0p8Mc=;
 b=DMYc2mTFSctGMMqRAh72fjY7cKpqJqMeVGs/cG8RjtTtol1ZFoLr/cVQ1e2AT11RpT
 lqXL/1Kuex1byX0+sjDVHwgweiaEjt+PCiRSJCpfxOx1U0C/yjWik7vg+LIB86cTWhP1
 YY6CMyKtWO5WjnRzA8Kifl34hOBBDiq1ZhA/jpWaTDy8UqQtI8mtRPr0gSSDyu5KTPBR
 L65QQHwKXDDDHwiX4jxO7UHuiNngapO05LDHrXhtthq7Bkt9YdmgALyD4YL7f8rva0yX
 iJXjl85oatKrjvnwyl/gY0oAuyCaDtz9ZLH5k9qu0kDCdBNCXGPP+s21W4XK8WcrpS8N
 8dfQ==
X-Gm-Message-State: APjAAAVqQviaU77h2cHyJ2UIcnSi3d5wN/Z0aS/EtofxrJoMk4/LTLWG
 fMP/0W+VvLdx/7pzHGbdFlsoT68fnQA=
X-Google-Smtp-Source: APXvYqz4RLm66a87EsZNbGF1BxomQUXgmo4w1GxbZYBn9+p8SxoQwC1+zvR1dD3aqNATe3AZSeducQ==
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr77920wrn.347.1582805006629;
 Thu, 27 Feb 2020 04:03:26 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:26 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch,
	airlied@linux.ie,
	Eric Anholt <eric@anholt.net>
Subject: [PATCH 11/21] drm/v3d: make v3d_debugfs_init return void
Date: Thu, 27 Feb 2020 15:02:22 +0300
Message-Id: <20200227120232.19413-12-wambui.karugax@gmail.com>
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

Since commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
fails and should return void. Therefore, remove its use as the
return value of v3d_debugfs_init and have the function return void
instead.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/v3d/v3d_debugfs.c | 8 ++++----
 drivers/gpu/drm/v3d/v3d_drv.h     | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 9e953ce64ef7..2b0ea5f8febd 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -258,10 +258,10 @@ static const struct drm_info_list v3d_debugfs_list[] = {
 	{"bo_stats", v3d_debugfs_bo_stats, 0},
 };
 
-int
+void
 v3d_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(v3d_debugfs_list,
-					ARRAY_SIZE(v3d_debugfs_list),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(v3d_debugfs_list,
+				 ARRAY_SIZE(v3d_debugfs_list),
+				 minor->debugfs_root, minor);
 }
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 9a35c555ec52..4dd4772f5f27 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -301,7 +301,7 @@ struct drm_gem_object *v3d_prime_import_sg_table(struct drm_device *dev,
 						 struct sg_table *sgt);
 
 /* v3d_debugfs.c */
-int v3d_debugfs_init(struct drm_minor *minor);
+void v3d_debugfs_init(struct drm_minor *minor);
 
 /* v3d_fence.c */
 extern const struct dma_fence_ops v3d_fence_ops;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
