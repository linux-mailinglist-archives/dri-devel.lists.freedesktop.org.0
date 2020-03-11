Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C752181240
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 08:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1E489B69;
	Wed, 11 Mar 2020 07:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9046F89B69
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:45:57 +0000 (UTC)
X-UUID: c3db92029253409ab9606dc55780707f-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=kmuKx8yXnrVZRj26G1wT2tuW6nPEGkF1XeVUsCNtoWg=; 
 b=kshX+c6dHL/AB3e7H0xyPP/tvUkeBy3YvwTu+9VZisgDrQl4vlVDDHLmMVhd/EYcc1ENJT5wyHv+daO1zWHMeLYYzX0NUPtJS9L/6OPKcmSh8D1mxAHTxS559r+aqGcrdXRxliIGVMmB3tJtQMrt0q7LnytmDjt8bcP6wnwm8l4=;
X-UUID: c3db92029253409ab9606dc55780707f-20200311
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1501939638; Wed, 11 Mar 2020 15:40:52 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 11 Mar 2020 15:41:10 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 11 Mar 2020 15:42:00 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/4] Config mipi tx drive current and impedance
Date: Wed, 11 Mar 2020 15:40:28 +0800
Message-ID: <20200311074032.119481-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8B87C366A05019574894C8BE919C0DEE41E6FDE2156CBE9411D871362E6DA08A2000:8
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v2:
 - fix the title of commit message.
 - rename mipitx-current-drive to drive-strength-microamp

Changes since v1:
 - fix coding style.
 - change mtk_mipi_tx_config_calibration_data() to void

Jitao Shi (4):
  dt-bindings: display: mediatek: add property to control mipi tx drive
    current
  dt-bindings: display: mediatek: get mipitx calibration data from nvmem
  drm/mediatek: add the mipitx driving control
  drm/mediatek: config mipitx impedance with calibration data

 .../display/mediatek/mediatek,dsi.txt         |  9 +++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c        |  6 ++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h        |  1 +
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c | 64 +++++++++++++++++++
 4 files changed, 80 insertions(+)

-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
