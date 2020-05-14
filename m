Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF11D3467
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 17:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DF06E34E;
	Thu, 14 May 2020 15:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DD86E34E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 15:05:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id F169B2A2F33
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/2] panfrost: Set default labeling helpers
Date: Thu, 14 May 2020 17:05:33 +0200
Message-Id: <7a799371c72f0c0312809feb310099071d06d765.1589468282.git.rohan.garg@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589468282.git.rohan.garg@collabora.com>
References: <cover.1589468282.git.rohan.garg@collabora.com>
In-Reply-To: <cover.1589468282.git.rohan.garg@collabora.com>
References: <cover.1589468282.git.rohan.garg@collabora.com>
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
Cc: kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the default labeling helpers in order to be able
to label the buffers.

Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 882fecc33fdb..335768236e3b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -12,6 +12,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_syncobj.h>
 #include <drm/drm_utils.h>
+#include <drm/drm_gem.h>
 
 #include "panfrost_device.h"
 #include "panfrost_devfreq.h"
@@ -567,6 +568,8 @@ static struct drm_driver panfrost_drm_driver = {
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
 	.gem_prime_mmap		= drm_gem_prime_mmap,
+	.set_label          = drm_gem_set_label,
+	.get_label          = drm_gem_get_label,
 };
 
 static int panfrost_probe(struct platform_device *pdev)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
