Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5D97D8D3A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 04:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894B210E902;
	Fri, 27 Oct 2023 02:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53CD10E902
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 02:45:17 +0000 (UTC)
X-UUID: 09bb871ec5264d518916be34c95de084-20231027
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:71e1977d-41c2-466a-ad8e-5477f79bd0f0, IP:10,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:1
X-CID-INFO: VERSION:1.1.32, REQID:71e1977d-41c2-466a-ad8e-5477f79bd0f0, IP:10,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:1
X-CID-META: VersionHash:5f78ec9, CLOUDID:242960d7-04a0-4e50-8742-3543eab8cb8e,
 B
 ulkID:231027104509HV6UX8IC,BulkQuantity:0,Recheck:0,SF:17|19|42|66|24|102,
 TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: 09bb871ec5264d518916be34c95de084-20231027
X-User: chentao@kylinos.cn
Received: from vt.. [(116.128.244.171)] by mailgw
 (envelope-from <chentao@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 842782961; Fri, 27 Oct 2023 10:45:06 +0800
From: chentao <chentao@kylinos.cn>
To: hamza.mahfooz@amd.com
Subject: [PATCH v2] drm/atomic-helper: Fix spelling mistake "preceeding" ->
 "preceding"
Date: Fri, 27 Oct 2023 10:44:59 +0800
Message-Id: <20231027024459.12793-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d4ebae36-265b-4537-ac1b-ae878d236151@amd.com>
References: <d4ebae36-265b-4537-ac1b-ae878d236151@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: tzimmermann@suse.de, chentao@kylinos.cn, kunwu.chan@hotmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kunwu Chan <chentao@kylinos.cn>

There is a typo in the kernel documentation for function
drm_atomic_helper_wait_for_dependencies. Fix it.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/gpu/drm/drm_atomic_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 2444fc33dd7c..c3f677130def 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2382,10 +2382,10 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
 
 /**
- * drm_atomic_helper_wait_for_dependencies - wait for required preceeding commits
+ * drm_atomic_helper_wait_for_dependencies - wait for required preceding commits
  * @old_state: atomic state object with old state structures
  *
- * This function waits for all preceeding commits that touch the same CRTC as
+ * This function waits for all preceding commits that touch the same CRTC as
  * @old_state to both be committed to the hardware (as signalled by
  * drm_atomic_helper_commit_hw_done()) and executed by the hardware (as signalled
  * by calling drm_crtc_send_vblank_event() on the &drm_crtc_state.event).
-- 
2.34.1

