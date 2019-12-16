Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0E011FFE8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3885B6E45C;
	Mon, 16 Dec 2019 08:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 662076E446
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 08:34:39 +0000 (UTC)
X-UUID: 8f406936df2f4bf48237b1de5cbf5162-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WhzTcd+pTtNcgJzwX1U6kGe1zUfl6N1bLB7CoWeNiCM=; 
 b=pdxpYAKb3p5SBOhwKMI0nXn6e91C/Mnd1pScxpMhg+9t4qnYn5CFm5HQTpLJH8x3glFGrHQL29Oq64sWToLM4HCW3ErvJbrGvmUM9Q7lI/RqXwWNLWqAMaE4AH9/J6PpYQY572osI3wjM33DS4VvTLWFswJE5O8coCaqsQnn4FQ=;
X-UUID: 8f406936df2f4bf48237b1de5cbf5162-20191216
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1296488313; Mon, 16 Dec 2019 16:29:33 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 16 Dec 2019 16:29:53 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 16 Dec 2019 16:29:15 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/4] Config mipi tx drive current and impedance
Date: Mon, 16 Dec 2019 16:29:33 +0800
Message-ID: <20191216082937.119164-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 944F9769D99980FD9F34232B6606DBCBEA77199AFBDE28CF16CC600B8A45F2AB2000:8
X-MTK: N
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in this patch:
 - add the mipitx driving current control.
 - config the mipitx impedance with calibration data in nvmem.

Jitao Shi (4):
  dt-binds: display: mediatek: add property to control mipi tx drive
    current
  dt-binds: display: mediatek: get mipitx calibration data from nvmem
  drm/mediatek: add the mipitx driving control
  drm/mediatek: config mipitx impedance with calibration data

 .../display/mediatek/mediatek,dsi.txt         |  9 +++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c        |  6 ++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h        |  2 +
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c | 70 +++++++++++++++++++
 4 files changed, 87 insertions(+)

-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
