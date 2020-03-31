Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4475C198E4F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 10:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BCC6E2CD;
	Tue, 31 Mar 2020 08:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0076989CCB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 08:28:03 +0000 (UTC)
X-UUID: 19d6c108d34f40ab864139469fd91c52-20200331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5o+60Ykpu4QaOR8sM8BtdowpYIMKFLDI/axtPlIoxEU=; 
 b=vDkn68gXSEj0djHm+u5Qh7q/2wO0ACEIP4iBaScwqfEYARDgDuIPFivoNBJgKYhqfp9/m3puOeptMuc+RIi6RIXceTCr+ch6oTUQghha+E37vVe/WT89mEQRZglhypJvCBHRwqQrhSotHNwiqga5wYNwusao6b3XkwXDrmIjnO0=;
X-UUID: 19d6c108d34f40ab864139469fd91c52-20200331
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 991516779; Tue, 31 Mar 2020 16:27:55 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 31 Mar 2020 16:27:54 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Tue, 31 Mar 2020 16:27:52 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/4] Config mipi tx current and impedance
Date: Tue, 31 Mar 2020 16:27:21 +0800
Message-ID: <20200331082725.81048-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 765C563F980AD3CE409FCDB0899B9382D2D47E9FF25AA5CE15BD52FF03A4E3272000:8
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

Changes since v3:
 - refine drive-strength-microamp as from 3000 to 6000.

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

 .../display/mediatek/mediatek,dsi.txt         | 10 +++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c        | 14 ++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h        |  1 +
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c | 64 +++++++++++++++++++
 4 files changed, 89 insertions(+)

-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
