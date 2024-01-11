Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FBE82A98C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858DC10E83A;
	Thu, 11 Jan 2024 08:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57DAE10E570
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=1gXnhZ66Ygt/sxM3Iu
 3BuDo8HgYk1gMQ33s6Qoaqb2c=; b=csxWlf9jmSrpm+h/fCPsCUXhUTSDqtgnzw
 rLZ9VejvOJf8n33gMZfXLiWizcdTGCLzzavnQy8SIFIB4gjm8UN0B1ImDHiheeHY
 JbR/1lRBtpg15HLWZ1dlgUT1fjc3PnwSk8YID8JuBh3QBhW2Hn0zu42A6WE2SkVP
 eFWihGNrY=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wD3P9syjp9l+RqiAA--.12958S2;
 Thu, 11 Jan 2024 14:44:02 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: airlied@gmail.com, tzimmermann@suse.de, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH] drm: Clean up errors in drm_dp_helper.h
Date: Thu, 11 Jan 2024 06:44:00 +0000
Message-Id: <20240111064400.8878-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3P9syjp9l+RqiAA--.12958S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw18JFy7Gr1rZw4rCryfJFb_yoWfAwbE9F
 18X34DurnrCF1qqr1DAF4Sgr10kFnxZ3y8uF13Ka43AFy2vr1rt39Fvw4DX3W5Ar47XF1q
 q3Z7tFnavws7KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZNVJUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiGAtixWVLZWcFwAABsc
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
 chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited before open square bracket '['

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index b1ca3a1100da..2704bf703040 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2133,7 +2133,7 @@ void drm_dp_aux_unregister(struct drm_dp_aux *aux)
 }
 EXPORT_SYMBOL(drm_dp_aux_unregister);
 
-#define PSR_SETUP_TIME(x) [DP_PSR_SETUP_TIME_ ## x >> DP_PSR_SETUP_TIME_SHIFT] = (x)
+#define PSR_SETUP_TIME(x)[DP_PSR_SETUP_TIME_ ## x >> DP_PSR_SETUP_TIME_SHIFT] = (x)
 
 /**
  * drm_dp_psr_setup_time() - PSR setup in time usec
-- 
2.17.1

