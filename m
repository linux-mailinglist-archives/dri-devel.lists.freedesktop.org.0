Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F7A179D9A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 02:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3E989BBD;
	Thu,  5 Mar 2020 01:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD5B389F5F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 01:51:14 +0000 (UTC)
X-UUID: db45a00b25224708beda985022f93583-20200305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=yNE8qYUfGn70ZBeOmt6HoS4PVXCpWIv9nVFD/rwaGU0=; 
 b=b4WhZ0c0ndNVWVHCk/wbavoWsxpoQE4ejcWwQDgR6xOtiMfyWlA7ylfD4Lr84Stm+q7Ct/kW4VtPOdrMURHDmkZBnqvY6iaSVToilq1fWMnvy8zSOCgVmvTempBIyhx4Vtip3E2V6GqMF5Z4VNp5M+RWlMXNbmbrpUTMsEBqD9M=;
X-UUID: db45a00b25224708beda985022f93583-20200305
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1353492825; Thu, 05 Mar 2020 09:51:10 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 09:50:01 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Mar 2020 09:50:25 +0800
Message-ID: <1583373069.364.4.camel@mtksdaap41>
Subject: [GIT PULL] mediatek drm fixes for 5.6
From: CK Hu <ck.hu@mediatek.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, 
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 5 Mar 2020 09:51:09 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: Phong LE <ple@baylibre.com>, Sean Paul <seanpaul@chromium.org>,
 Evan Benn <evanbenn@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This include OVL, cursor, and gce fixup.

Regards,
CK

The following changes since commit
bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://github.com/ckhu-mediatek/linux.git-tags.git
tags/mediatek-drm-fixes-5.6

for you to fetch changes up to 3d2ed431b8f39483477bc3c3a2aefbc9778ffe12:

  drm/mediatek: Handle component type MTK_DISP_OVL_2L correctly
(2020-02-25 13:02:22 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.6

----------------------------------------------------------------
Bibby Hsieh (4):
      drm/mediatek: Add plane check in async_check function
      drm/mediatek: Add fb swap in async_update
      drm/mediatek: Move gce event property to mutex device node
      drm/mediatek: Make sure previous message done or be aborted before
send

Evan Benn (1):
      drm/mediatek: Find the cursor plane instead of hard coding it

Phong LE (1):
      drm/mediatek: Handle component type MTK_DISP_OVL_2L correctly

Sean Paul (1):
      drm/mediatek: Ensure the cursor plane is on top of other overlays

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 30
+++++++++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  7 +++++++
 3 files changed, 28 insertions(+), 10 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
