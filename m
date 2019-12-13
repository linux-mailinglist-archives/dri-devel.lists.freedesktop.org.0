Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2369111DF58
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 09:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860E26E2CC;
	Fri, 13 Dec 2019 08:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Fri, 13 Dec 2019 07:47:50 UTC
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [216.200.240.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720C76E284
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 07:47:50 +0000 (UTC)
X-UUID: 615e2bc96af143bcb9cd16e227fd3c29-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hE/LFR4VgS3BbRyTDvhyusFCTOwqCXLwuzkWfS0Tpg4=; 
 b=e4sWrFmrq05KGo5WU2lyaYyGm83EjoHyp3F69sczTgkl/xkZpJHFi7FqtXfMRwSd8P0Wj3k+6UNYxajLR4+zc75lOk8emhMvvcKDI3m2tN5UJNDcrukoUExwgiwcxuuYFIbxRimw0w5ULFBWES3ShG3xBnv/4jPW1MUYjPuXnyM=;
X-UUID: 615e2bc96af143bcb9cd16e227fd3c29-20191212
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1002112206; Thu, 12 Dec 2019 23:42:44 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 15:28:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 15:28:23 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2, 0/2] drm/mediatek: Add ctm property support
Date: Fri, 13 Dec 2019 15:28:50 +0800
Message-ID: <1576222132-31586-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:22:24 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v1:
-separate gamma patch
-remove cmdq support for ctm setting


Yongqiang Niu (2):
  drm/mediatek: Fix gamma correction issue
  drm/mediatek: Add ctm property support

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 18 +++++++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 62 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 +++++
 3 files changed, 85 insertions(+), 4 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
