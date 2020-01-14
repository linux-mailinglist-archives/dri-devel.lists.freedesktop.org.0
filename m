Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A9E139FF7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 04:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D236E1D8;
	Tue, 14 Jan 2020 03:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3FA1F6E1D8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 03:28:57 +0000 (UTC)
X-UUID: 233558fa026040d691f6f784870da949-20200114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:To:From:Subject:Message-ID;
 bh=3lK1Ebr64dtMdpNNko6BZFpLwXLNtP0MU90WQGJmPks=; 
 b=dAQWXiEQI34eCnADVne70Fx0uu6Mu5+WU4GofNtkYu+uvGY0qw2wK16ll1/C2ABqScdpuqZ0SaNLOrxR2TnJt8TCp0Qp/NDzvjumNXSkUL/IG/Vwk7SxMgkyNQTwQ015bYHKo/Te4wTlDyt4h2wYmSf2Qs+uO/11FXxAsNspnmk=;
X-UUID: 233558fa026040d691f6f784870da949-20200114
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 254305644; Tue, 14 Jan 2020 11:28:53 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 11:27:31 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 Jan 2020 11:29:30 +0800
Message-ID: <1578972526.14594.8.camel@mtksdaap41>
Subject: [GIT PULL] mediatek drm next for 5.6
From: CK Hu <ck.hu@mediatek.com>
To: Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 14 Jan 2020 11:28:46 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 071BCE1FFB819546AB63B32ECE7083E45224F80BB23B15F37DB2B6807481E9D02000:8
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

Hi, Dave, Daniel:

This fix non-smooth cursor problem, add cmdq support, add ctm property
support and some refinement.

Regards,
CK


The following changes since commit
e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://github.com/ckhu-mediatek/linux.git-tags.git
tags/mediatek-drm-next-5.6

for you to fetch changes up to d04a07a8dc93dfc40b3a41c977db78ba340f209d:

  drm/mediatek: Fix indentation in Makefile (2020-01-10 14:10:49 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.6

----------------------------------------------------------------
Bibby Hsieh (11):
      drm/mediatek: use DRM core's atomic commit helper
      drm/mediatek: handle events when enabling/disabling crtc
      drm/mediatek: update cursors by using async atomic update
      drm/mediatek: disable all the planes in atomic_disable
      drm/mediatek: remove unused external function
      soc: mediatek: cmdq: remove OR opertaion from err return
      soc: mediatek: cmdq: define the instruction struct
      soc: mediatek: cmdq: add polling function
      soc: mediatek: cmdq: add cmdq_dev_get_client_reg function
      drm/mediatek: support CMDQ interface in ddp component
      drm/mediatek: apply CMDQ control flow

CK Hu (1):
      Merge tag 'v5.5-next-cmdq-stable' of
https://git.kernel.org/.../matthias.bgg/linux

Fabien Parent (1):
      drm/mediatek: Fix indentation in Makefile

Mark Yacoub (2):
      drm/mediatek: Return from mtk_ovl_layer_config after
mtk_ovl_layer_off
      drm/mediatek: Turn off Alpha bit when plane format has no alpha

Pi-Hsun Shih (1):
      drm/mediatek: Check return value of mtk_drm_ddp_comp_for_plane.

Yongqiang Niu (3):
      drm/mediatek: Fix can't get component for external display plane.
      drm/mediatek: Add gamma property according to hardware capability
      drm/mediatek: Add ctm property support

 drivers/gpu/drm/mediatek/Makefile           |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c   |   7 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  76 ++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  43 +++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 204
+++++++++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 184
+++++++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  56 ++++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  86 +-----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   7 -
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  47 +++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |   2 +
 drivers/soc/mediatek/mtk-cmdq-helper.c      | 147 ++++++++++++++++----
 include/linux/mailbox/mtk-cmdq-mailbox.h    |  11 ++
 include/linux/soc/mediatek/mtk-cmdq.h       |  53 ++++++++
 15 files changed, 666 insertions(+), 261 deletions(-)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
