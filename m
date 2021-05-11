Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9288637A7F2
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 15:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E1D6E519;
	Tue, 11 May 2021 13:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4326EA2F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 13:44:33 +0000 (UTC)
Received: from dggeml708-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FffDw1ddhzWh8H;
 Tue, 11 May 2021 21:40:16 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggeml708-chm.china.huawei.com (10.3.17.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 21:44:30 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 21:44:29 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Baruch Siach
 <baruch@tkos.co.il>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/1] drm/mediatek: Remove redundant error printing
Date: Tue, 11 May 2021 21:43:36 +0800
Message-ID: <20210511134338.6167-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v1 --> v2:
1. Combine the modifications of several drm/mediatek files into one patch.
2. According to Baruch Siach's review comment, simplify the following code snippets:
   -		ret = PTR_ERR(cec->regs);
   -		return ret;
   +		return PTR_ERR(cec->regs);

Zhen Lei (1):
  drm/mediatek: Remove redundant error printing

 drivers/gpu/drm/mediatek/mtk_cec.c        | 7 ++-----
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 4 +---
 drivers/gpu/drm/mediatek/mtk_dpi.c        | 7 ++-----
 drivers/gpu/drm/mediatek/mtk_dsi.c        | 1 -
 6 files changed, 7 insertions(+), 20 deletions(-)

-- 
2.26.0.106.g9fadedd


