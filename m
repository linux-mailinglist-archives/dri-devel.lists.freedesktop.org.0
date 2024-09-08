Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA2197073E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 14:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE9010E240;
	Sun,  8 Sep 2024 12:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="EZynd5DH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com
 [95.215.58.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6BB10E240
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 12:11:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725797490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFIA//LZNZFXa5gLBbDp9kzrenwYgY2aO2hf6ChFS/Y=;
 b=EZynd5DHsP7GDe9JZ3QNLDI5O6c/c86By1mI0LV0ZGnMGNcjBr3swwpHksMnEpN/3n6Glg
 W/eA5z1qewiBAyGTzSkn8tqnhTVwKFF3nFCLflD0IbYx1qeLQeyJNdA5jwoRSqFB4ny5bw
 tYRvA88+OxYWOrmcc5YtUHGA+ReQ0co=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Christian Gmeiner <cgmeiner@igalia.com>
Subject: [PATCH v2 3/5] drm/etnaviv: Drop the <linux/pm_runtime.h> header
Date: Sun,  8 Sep 2024 20:11:05 +0800
Message-ID: <20240908121107.328740-3-sui.jingfeng@linux.dev>
In-Reply-To: <20240908121107.328740-1-sui.jingfeng@linux.dev>
References: <20240908121107.328740-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the etnaviv_gem_submit.c isn't call any runtime power management
functions. So drop this unused header, we can include it back when it
really get used though.

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 3d0f8d182506..3c0a5c3e0e3d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -6,7 +6,6 @@
 #include <drm/drm_file.h>
 #include <linux/dma-fence-array.h>
 #include <linux/file.h>
-#include <linux/pm_runtime.h>
 #include <linux/dma-resv.h>
 #include <linux/sync_file.h>
 #include <linux/uaccess.h>
-- 
2.43.0

