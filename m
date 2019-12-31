Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD9212D5ED
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 04:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261276E0C1;
	Tue, 31 Dec 2019 03:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69D406E0C1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 03:18:26 +0000 (UTC)
X-UUID: 195ea2b4221b4247b0d70e3c18cc0556-20191231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:To:From:Subject:Message-ID;
 bh=KD18K732o3BxYczOblMAtlKYarxqLyLhgJR6AsUrreM=; 
 b=cF24K72UgUrKyk+Gfjqup9ukBImXidQmhnf3fS37hLwojMNI5NgFXLX0qnSjMlakxVd4lx6/jDO750HGw0NkHQp84XuNPB/CFDv5EsYZIFCOxz/yxcYfIcYxyUdUn99ZFRzJhmxIETLLSNbLmtwPZnUwH/NcL6AO8c/7LunaMBA=;
X-UUID: 195ea2b4221b4247b0d70e3c18cc0556-20191231
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 669843572; Tue, 31 Dec 2019 11:18:22 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Dec 2019 11:17:36 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 31 Dec 2019 11:18:31 +0800
Message-ID: <1577762298.23194.2.camel@mtksdaap41>
Subject: [GIT PULL] mediatek drm fixes for 5.5
From: CK Hu <ck.hu@mediatek.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, 
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 31 Dec 2019 11:18:18 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F7F959314EB0687E68F0E2354F4BCCE119135D8125203D2E913DEBAD18F37FAD2000:8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel:

This include phy timing and plane index fixes.

Regards,
CK

The following changes since commit
e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://github.com/ckhu-mediatek/linux.git-tags.git
tags/mediatek-drm-fixes-5.5

for you to fetch changes up to e18e0f6b7c8f220774dd68965e8a9b046905acc8:

  drm/mediatek: reduce the hbp and hfp for phy timing (2019-12-17
10:23:43 +0800)

----------------------------------------------------------------
Mediatek DRM fixes for Linux 5.5

----------------------------------------------------------------
Jitao Shi (1):
      drm/mediatek: reduce the hbp and hfp for phy timing

Pi-Hsun Shih (1):
      drm/mediatek: Check return value of mtk_drm_ddp_comp_for_plane.

Yongqiang Niu (1):
      drm/mediatek: Fix can't get component for external display plane.

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 ++++++---
 drivers/gpu/drm/mediatek/mtk_dsi.c      | 67
+++++++++++++++++++--------------
 2 files changed, 50 insertions(+), 35 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
