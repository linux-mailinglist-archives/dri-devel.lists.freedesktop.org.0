Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 945D37D65F6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 10:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06A810E5DE;
	Wed, 25 Oct 2023 08:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9485010E5DE
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 08:59:01 +0000 (UTC)
X-UUID: cfc91cf648804cd0a5769e53c694496e-20231025
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:2fa55461-6189-4a51-950b-3fbfd28f5c8c, IP:15,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-INFO: VERSION:1.1.32, REQID:2fa55461-6189-4a51-950b-3fbfd28f5c8c, IP:15,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:17d2e428-cb22-4fa7-8134-287af20ad1fc,
 B
 ulkID:231025165717V3CMEEAR,BulkQuantity:1,Recheck:0,SF:44|66|38|24|17|19|1
 02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL
 :0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: cfc91cf648804cd0a5769e53c694496e-20231025
X-User: chentao@kylinos.cn
Received: from vt.. [(116.128.244.169)] by mailgw
 (envelope-from <chentao@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1174103866; Wed, 25 Oct 2023 16:58:50 +0800
From: Kunwu Chan <chentao@kylinos.cn>
To: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com
Subject: [PATCH] drm/imx: Spelling fix in comment
Date: Wed, 25 Oct 2023 16:58:37 +0800
Message-Id: <20231025085837.35330-1-chentao@kylinos.cn>
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
Cc: Kunwu Chan <chentao@kylinos.cn>, kunwu.chan@hotmail.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fix a misspelling of "concurrent".

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/gpu/drm/imx/dcss/dcss-ctxld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-ctxld.c b/drivers/gpu/drm/imx/dcss/dcss-ctxld.c
index 3a84cb3209c4..28727a8cb7e3 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-ctxld.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-ctxld.c
@@ -82,7 +82,7 @@ struct dcss_ctxld {
 	bool in_use;
 	bool armed;
 
-	spinlock_t lock; /* protects concurent access to private data */
+	spinlock_t lock; /* protects concurrent access to private data */
 };
 
 static irqreturn_t dcss_ctxld_irq_handler(int irq, void *data)
-- 
2.34.1

