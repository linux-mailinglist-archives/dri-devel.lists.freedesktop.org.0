Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E13B1A9026
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 03:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E60C6E7FE;
	Wed, 15 Apr 2020 01:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id D90646E1A7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 01:13:30 +0000 (UTC)
X-UUID: b0c1da76e8594517b441178e39adde5f-20200415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jZzwGiXUsQiJ0c9MXSUE3/kdW7bhbG0Ige7fRWOgpLY=; 
 b=SxsjKmj9s5ID3sKKvcEsCj/Jlb1GaPMBxqSeR3x4cc+bmpfHbtErPhAo0VFuDd5aY6dYbn7JIBBUdIn8reatnd3yl03OHp3DXfAh/RUhYGYhjoK+mK23LV3XkoEhwsll1vjrbSSzdnS5fMbOkwn/jJmMkEk0z3R8ifhuG2kTzFQ=;
X-UUID: b0c1da76e8594517b441178e39adde5f-20200415
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 34507685; Wed, 15 Apr 2020 09:13:23 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 15 Apr 2020 09:13:22 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 15 Apr 2020 09:13:20 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v15 0/3] mt8183 dpi support pin mode swap
Date: Wed, 15 Apr 2020 09:13:16 +0800
Message-ID: <20200415011319.25559-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 21897C5FFB277A678AE51BF96EC4A8AD5368332861C030EE93B37541AC2638C42000:8
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

Changes since v14:
 - add "Acked-by" and "Reviewed-by"
 - change port@0 to port in yaml

Changes since v13:
 - move dpi dual edge patches to another series because it will have long time
   to implement the dual edge change base boris patches.
   https://patchwork.kernel.org/cover/11354279/

Changes since v12:
 - fix mediatek,dpi.yaml make_dt_binding_check errors.

Change since v11:
 - fine tune mediatek,dpi.yaml.
 - add Acked-by: Rob Herring <robh@kernel.org>.

Change since v10:
 - convert the Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
   to yaml format.
 - read the pclk-sample in endpoint.

Changes since v9:
 - rename pinctrl-names = "gpiomode", "dpimode" to "active", "idle".
 - fix some typo.

Changes since v8:
 - drop pclk-sample redefine in mediatek,dpi.txt
 - only get the gpiomode and dpimode when dpi->pinctrl is successful.

Changes since v7:
 - separate dt-bindings to independent patches.
 - move dpi dual edge to one patch.

Changes since v6:
 - change dual_edge to pclk-sample
 - remove dpi_pin_mode_swap and

Changes since v5:
 - fine tune the dt-bindings commit message.

Changes since v4:
 - move pin mode control and dual edge control to deveice tree.
 - update dt-bindings document for pin mode swap and dual edge control.

Changes since v3:
 - add dpi pin mode control when dpi on or off.
 - update dpi dual edge comment.

Changes since v2:
 - update dt-bindings document for mt8183 dpi.
 - separate dual edge modfication as independent patch.

Jitao Shi (3):
  dt-bindings: display: mediatek: control dpi pins mode to avoid leakage
  dt-bindings: display: mediatek: convert the document format from txt
    to yaml
  drm/mediatek: set dpi pin mode to gpio low to avoid leakage current

 .../bindings/display/mediatek/mediatek,dpi.txt     | 36 --------
 .../bindings/display/mediatek/mediatek,dpi.yaml    | 97 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 31 +++++++
 3 files changed, 128 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml

-- 
2.12.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
