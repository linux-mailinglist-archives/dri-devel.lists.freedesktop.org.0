Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE2052FADC
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 13:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FDD10E0D6;
	Sat, 21 May 2022 11:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FEB10E06B
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9tnuHSBQjVBU2e2Ow85bDHqPS4HDRuu3ASTrqzZC4Ic=;
 b=qH1MiJKlYojzoNEW1uuAP8YqCZ0Xx+YPVGCRDYmGBTP/xeMYcv3gkW6G
 sf56jp43t+xJrjQylm0ggAdyqow78lQMVvyZ0xMNYpiSVcZNCrLo4rw/y
 z/eKfkof9qWFXa2Hj2teoZzOeilXISidsdEnd0Xitlu+In606Jnss6V0T 4=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,242,1647298800"; d="scan'208";a="14727960"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 13:12:02 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau/mmu: fix typo in comment
Date: Sat, 21 May 2022 13:11:07 +0200
Message-Id: <20220521111145.81697-57-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Spelling mistake (triple letters) in comment.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 8bf00b396ec1..8b11dfa0998d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -280,7 +280,7 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool pfn, u32 ptei, u32 ptes)
 	if (desc->type == SPT && (pgt->refs[0] || pgt->refs[1]))
 		nvkm_vmm_unref_sptes(it, pgt, desc, ptei, ptes);
 
-	/* PT no longer neeed?  Destroy it. */
+	/* PT no longer needed?  Destroy it. */
 	if (!pgt->refs[type]) {
 		it->lvl++;
 		TRA(it, "%s empty", nvkm_vmm_desc_type(desc));

