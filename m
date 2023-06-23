Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77DD73C8D8
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 10:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1576F10E0D2;
	Sat, 24 Jun 2023 08:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 514 seconds by postgrey-1.36 at gabe;
 Fri, 23 Jun 2023 10:17:05 UTC
Received: from out-2.mta0.migadu.com (out-2.mta0.migadu.com [91.218.175.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807A710E0E9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 10:17:05 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1687514922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01N/gRTBxFgDNySxI5l/vzBYcJURpU1c4PTDBFkFenU=;
 b=iVE+wCfu7F1lZw+i7xvth7KefJ7Fm0oVwOc9HakWxSE9euLod3n30C5QVkXV6rKMhBxr1G
 +VOhlWdHF0NLJA3SnKxhtza3ph0hpg1Po2K7X20cGpnrLvOHU/uHBEdEoumWsGLlW+ftGg
 +hyqHMoIZRSDBrjbQxiPCkoo3P6haeo=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 6/8] drm/etnaviv: No indentation by double tabs
Date: Fri, 23 Jun 2023 18:08:20 +0800
Message-Id: <20230623100822.274706-7-sui.jingfeng@linux.dev>
In-Reply-To: <20230623100822.274706-1-sui.jingfeng@linux.dev>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 24 Jun 2023 08:15:48 +0000
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
Cc: loongson-kernel@lists.loongnix.cn, Sui Jingfeng <suijingfeng@loongson.cn>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Single tab should be enough.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index cef97bb9c99f..14c2e9690ce1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -231,11 +231,11 @@ static int show_each_gpu(struct seq_file *m, void *arg)
 }
 
 static struct drm_info_list etnaviv_debugfs_list[] = {
-		{"gpu", show_each_gpu, 0, etnaviv_gpu_debugfs},
-		{"gem", show_unlocked, 0, etnaviv_gem_show},
-		{ "mm", show_unlocked, 0, etnaviv_mm_show },
-		{"mmu", show_each_gpu, 0, etnaviv_mmu_show},
-		{"ring", show_each_gpu, 0, etnaviv_ring_show},
+	{"gpu", show_each_gpu, 0, etnaviv_gpu_debugfs},
+	{"gem", show_unlocked, 0, etnaviv_gem_show},
+	{ "mm", show_unlocked, 0, etnaviv_mm_show },
+	{"mmu", show_each_gpu, 0, etnaviv_mmu_show},
+	{"ring", show_each_gpu, 0, etnaviv_ring_show},
 };
 
 static void etnaviv_debugfs_init(struct drm_minor *minor)
-- 
2.25.1

