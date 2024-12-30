Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44A09FE6AE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 14:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E9E10E087;
	Mon, 30 Dec 2024 13:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CNd++Nvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E8B10E087
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 13:53:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0BE5BA40C6F;
 Mon, 30 Dec 2024 13:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41710C4CED0;
 Mon, 30 Dec 2024 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735566802;
 bh=4KJMfkJbjuD1+I7HsDy0xyDU+DlgBavMOG3qlPzrG4c=;
 h=From:To:Cc:Subject:Date:From;
 b=CNd++Nvc/S3vwoaVFLgo5xuyrmVTyTcgkAnRPtoJioBsxm36SCmt+rlQ1uLjnACbc
 lSvcpFqHA0n6ypRSo3957U9NSnQU6QrZJhPt9CDnquNA8rJWQZi7qnvMcN+x13jZgo
 xMerSxY2TK3GQrP/Hu+tFp1EyqkYVaLjmcB4bMiu6EngbCEYGoY0gR4BSzhfvmlxBE
 +cDuQxc01HokM6IPL74hGk5+U3l8yTYT6XuMUm9zMSDCM9D9zI3mjh1EO0JfoD6nUN
 H6/vUMUW0gK4C4//iWZ7BcjeUxW9wXTkSZMfhoG51g6ABgWoZT0F1A3toIiWL/iavd
 PXON4Ifq41tMw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/mediatek: Remove unneeded semicolon
Date: Mon, 30 Dec 2024 13:53:14 +0000
Message-Id: <20241230135314.5419-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:1092:2-3: Unneeded semicolon

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412022048.kY2ZhxZ4-lkp@intel.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9a8ef8558da9..9d8286424e98 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1089,7 +1089,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		/* No devicetree graphs support: go with hardcoded paths if present */
 		dev_dbg(dev, "Using hardcoded paths for MMSYS %u\n", mtk_drm_data->mmsys_id);
 		private->data = mtk_drm_data;
-	};
+	}
 
 	private->all_drm_private = devm_kmalloc_array(dev, private->data->mmsys_dev_num,
 						      sizeof(*private->all_drm_private),
-- 
2.34.1

