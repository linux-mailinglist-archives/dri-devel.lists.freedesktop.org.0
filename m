Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE6A28596C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BDA6E8A6;
	Wed,  7 Oct 2020 07:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94D86E511
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 19:33:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 6FABC28A7A9
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] soc: mediatek: Prepare MMSYS for DDP routing using tables
Date: Tue,  6 Oct 2020 21:33:16 +0200
Message-Id: <20201006193320.405529-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
Cc: chunkuang.hu@kernel.org, drinkcat@chromium.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear all,

The following series are intended to prepare the mtk-mmsys driver to
allow different DDP (Data Display Path) routing tables per SoC. Note
that the series has been tested only on MT8173 platform and could break
the display on MT2701 and MT2712 based devices. I kindly ask for someone
having these devices to provide a tested routing table (unfortunately I
didn't have enough documentation to figure out this myself).

For the other devices (MT8183, MT6779 and MT6797) DRM support is not in
mainline yet so nothing will break.

Thanks,
  Enric


CK Hu (2):
  soc: mediatek: mmsys: Create struct mtk_mmsys to store context data
  soc: mediatek: mmsys: Use an array for setting the routing registers

Enric Balletbo i Serra (1):
  soc: mediatek: mmsys: Use devm_platform_ioremap_resource()

Yongqiang Niu (1):
  soc / drm: mediatek: Move DDP component defines into mtk-mmsys.h

 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  34 +-
 drivers/soc/mediatek/mtk-mmsys.c            | 429 +++++++++++---------
 include/linux/soc/mediatek/mtk-mmsys.h      |  33 ++
 3 files changed, 263 insertions(+), 233 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
