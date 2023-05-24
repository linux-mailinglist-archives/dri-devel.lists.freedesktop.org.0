Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C366470F46B
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 12:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56AE10E655;
	Wed, 24 May 2023 10:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8439B10E655;
 Wed, 24 May 2023 10:41:04 +0000 (UTC)
X-UUID: 319a4933efcb48debdac32218feb0ddf-20230524
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:2b106396-7ad2-4e47-b070-7eac482c0e0b, IP:15,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-INFO: VERSION:1.1.22, REQID:2b106396-7ad2-4e47-b070-7eac482c0e0b, IP:15,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:0
X-CID-META: VersionHash:120426c, CLOUDID:63ebe3c1-e32c-4c97-918d-fbb3fc224d4e,
 B
 ulkID:230524184057H6SO669B,BulkQuantity:0,Recheck:0,SF:17|19|44|24|102,TC:
 nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 319a4933efcb48debdac32218feb0ddf-20230524
X-User: pengfuyuan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <pengfuyuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 763305722; Wed, 24 May 2023 18:40:54 +0800
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH] drm/i915/pxp:fix kernel-doc trivial warnings
Date: Wed, 24 May 2023 18:40:52 +0800
Message-Id: <20230524104052.1488836-1-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>, linux-kernel@vger.kernel.org,
 pengfuyuan <pengfuyuan@kylinos.cn>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 k2ci <kernel-bot@kylinos.cn>, Vitaly Lubart <vitaly.lubart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The test robot reports some make warnings.

Fix those warnings:
    drivers/gpu/drm/i915/pxp/intel_pxp_types.h:96: warning: Function parameter or member 'dev_link' not described in 'intel_pxp'

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 007de49e1ea4..41994a3294a0 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -33,7 +33,7 @@ struct intel_pxp {
 	 */
 	struct i915_pxp_component *pxp_component;
 
-	/* @dev_link: Enforce module relationship for power management ordering. */
+	/** @dev_link: Enforce module relationship for power management ordering. */
 	struct device_link *dev_link;
 	/**
 	 * @pxp_component_added: track if the pxp component has been added.
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
