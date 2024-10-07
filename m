Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C571D992548
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 09:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007D610E30E;
	Mon,  7 Oct 2024 07:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="AyuJYxBB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3317110E313
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 07:01:12 +0000 (UTC)
X-UUID: eb9cb280847911efb66947d174671e26-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cdVLVl3N47ciXjG7Oy/bGsFENgFtxv9nK8Vf1FgC59Y=; 
 b=AyuJYxBBEU1Dba0+PBP0HMbOdmxSHjv+d4KNPzxeqloVpMmdokmtyzWOGSLp097EzKJukko/cmcaLIaYq4B6ZXYEpzAymdTuYDQMhjBP4xtrdxsbU/YMBESIRC/6p6Ju1ay4LZ2++NN+ug4Ijrgue+7oW8YNqVkYxfMMo6gYe2A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:fe6b1c06-2ba8-4cde-b8d1-a3104b4354ee, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:5a7f6526-5902-4533-af4f-d0904aa89b3c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: eb9cb280847911efb66947d174671e26-20241007
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 214083769; Mon, 07 Oct 2024 15:01:05 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 15:01:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 15:01:02 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Adam Thiede <me@adamthiede.com>, Yassine Oudjana
 <yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v9 0/5] Fix degradation problem of alpha blending series
Date: Mon, 7 Oct 2024 15:00:56 +0800
Message-ID: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.174900-8.000000
X-TMASE-MatchedRID: eGFvCdSRBwl2eFocrSghDt8tWTI1R8epCt4iaV1DkEPXIZTIUrehXn/s
 DLdkieHykxyCprbGHp2Z4TZMmYnlr/QYZJBBoF8RXP5rFAucBUHYP0VsOD0E/lSOymiJfTYX0S+
 TvGOUgqIZOPGJ7ev0pdb0cMVDXqkVmllju3jrF/dsIyeExXlNbiEdaywSZvzOOZLXi4h9F1fygv
 NRZ7BeSJUyVyqodZ3toFW8SPM0GkIfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPCXvWw0dO6Vbr0nO
 Fn1o7e5q8+Xidcj0jM01NHdnzFNohLF53hJcvsn
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.174900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F7FE7AC0F13A2428F07B3170DBE8CC7DE0DDF6B0C0EB14DAD16D381D557390B22000:8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some SoCs do not support the ignore_pixl_alpha flag, which breaks the
XRGB8888 format. Some SoCs do not support pre-multiplied pixel formats
and extending configuration of OVL pre-multiplied color formats,
such as MT8173.

Fix the SoC degradation problem by this sreies.

---
Change in v9:
1. Add the fix patch for the XRGB8888 downgrade issue of MT8173
2. Add the refine patch for ignore_pixel_alpha statement

Change in v8:
Remove blend_modes for not supported pre-multiplied SoCs to fix the
return error from drm_plane_create_blend_mode_property().

Change in v7:
1. Add the remove color format comment patch for OVL
2. Fix warning: 'const' type qualifier on return type has no effect

Chnage in v6:
1. Use blend_modes instead of function pointer in OVL
2. Use ethdr instead of mdp_rdma to get blend_modes
3. Add 0 checking for adding blend_mode property for mtk_plane

Change in v5:
Add fix patch for mtk_plane

Change in v4:
Add lost cases of mtk_ovl_fmt_convert_with_blend

Change in v3:
Change MACRO approach to function pointer in driver data

Change in v2:
Fix build error and typo

Change in v1:
Add fix patch for OVL unsupport color format settings by driver data

---

Jason-JH.Lin (5):
  drm/mediatek: ovl: Fix XRGB format breakage for blend_modes
    unsupported SoCs
  drm/mediatek: ovl: Refine ignore_pixel_alpha comment and placement
  drm/mediatek: ovl: Remove the color format comment for
    ovl_fmt_convert()
  drm/mediatek: ovl: Add blend_modes to driver data
  drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs

 drivers/gpu/drm/mediatek/mtk_crtc.c           |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  2 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       | 10 +++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  2 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 70 ++++++++++++++-----
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  7 ++
 drivers/gpu/drm/mediatek/mtk_ethdr.c          |  7 ++
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |  1 +
 drivers/gpu/drm/mediatek/mtk_plane.c          | 15 ++--
 drivers/gpu/drm/mediatek/mtk_plane.h          |  4 +-
 10 files changed, 92 insertions(+), 27 deletions(-)

-- 
2.43.0

