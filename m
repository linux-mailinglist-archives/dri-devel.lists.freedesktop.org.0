Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC9D7D64FD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 10:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EBD10E58E;
	Wed, 25 Oct 2023 08:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FA110E606
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 08:26:58 +0000 (UTC)
X-UUID: 8caf84ca45df4e37a74b474e336fae37-20231025
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:7f8d438c-e792-4676-ad98-4a669ac0b97b, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-10
X-CID-INFO: VERSION:1.1.32, REQID:7f8d438c-e792-4676-ad98-4a669ac0b97b, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-10
X-CID-META: VersionHash:5f78ec9, CLOUDID:376ae428-cb22-4fa7-8134-287af20ad1fc,
 B
 ulkID:231025161822M8LQ68ZN,BulkQuantity:1,Recheck:0,SF:66|38|24|17|19|44|1
 02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL
 :0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 8caf84ca45df4e37a74b474e336fae37-20231025
X-User: chentao@kylinos.cn
Received: from vt.. [(116.128.244.169)] by mailgw
 (envelope-from <chentao@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1621551364; Wed, 25 Oct 2023 16:26:46 +0800
From: Kunwu Chan <chentao@kylinos.cn>
To: daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/atomic: Spelling fix in comments
Date: Wed, 25 Oct 2023 16:26:34 +0800
Message-Id: <20231025082634.34038-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
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
Cc: Kunwu Chan <chentao@kylinos.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kunwu.chan@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fix a typo in a comments.

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

