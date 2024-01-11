Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A016882A98D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F30810E84C;
	Thu, 11 Jan 2024 08:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2580B10E19D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=7tZ+Al8JEkFnVgRnmt
 irXvujrce962QyqAYda92sLOg=; b=pdK3rx4IQAyOKeWFiRijBlEx69g0SuiO0n
 zN/XTvnegJgEoi9urOFbatsHGnufdBXERNrj9cjMlFp+3NeepymTF3AZhNFqHngh
 pBqnHanCchx9r/CrO6PQMehL+nkimzOwKuVk7dZDhMKtOlXW10tlkBjzL/oRcMUy
 8+6SrdSNQ=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wD3n5b6lZ9lFHaRAA--.13440S2;
 Thu, 11 Jan 2024 15:17:14 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: alain.volmat@foss.st.com, airlied@gmail.com, daniel@ffwll.ch,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de
Subject: [PATCH] drm/sti: Clean up errors in sti_hda.c
Date: Thu, 11 Jan 2024 07:17:13 +0000
Message-Id: <20240111071713.10056-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3n5b6lZ9lFHaRAA--.13440S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw15uF48Zr4ftryUJry8uFg_yoWfZrb_GF
 W8Wrn5ZFZrAw1DAw13Cr1YvFyvvan8uFZ3Cw4S9a4aqFs7Ar4fJa4FgFyUWw1kXF42gFZx
 Aws2qry5ZrnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjT7KDUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqB9i1mVOBk7woAAAsw
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited before that ',' (ctx:WxW)

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/sti/sti_hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index 6ee35612a14e..1079ac0732c5 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -486,7 +486,7 @@ static void sti_hda_pre_enable(struct drm_bridge *bridge)
 	hda_write(hda, SCALE_CTRL_CR_DFLT, HDA_ANA_SCALE_CTRL_CR);
 
 	/* Configure sampler */
-	hda_write(hda , src_filter_y, HDA_ANA_SRC_Y_CFG);
+	hda_write(hda, src_filter_y, HDA_ANA_SRC_Y_CFG);
 	hda_write(hda, src_filter_c,  HDA_ANA_SRC_C_CFG);
 	for (i = 0; i < SAMPLER_COEF_NB; i++) {
 		hda_write(hda, coef_y[i], HDA_COEFF_Y_PH1_TAP123 + i * 4);
-- 
2.17.1

