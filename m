Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AAB5B6660
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 06:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D151110E1A9;
	Tue, 13 Sep 2022 04:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTP id C47C010E1A9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 04:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=BhBHv
 zEVMyp3CnEaxDcDVkgFh4/ncYg7wV3iItqjlKw=; b=AWVhQcYc/8T/YPyifrNep
 opPLD5bllKm9HK3v4I+HX40znaLB0wF/0RC/iHLvSrVCbKdXzC6sKn3sLATFPxME
 4QT5wCx6FpX7P18MRHQZ4uAXZU41iOyHaOt7j/fiH7gVXoLWJ3BNVRcShMbkIwPF
 mTzQwMdFKPmtGvJxsmbx+4=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown
 [1.203.67.201])
 by smtp13 (Coremail) with SMTP id EcCowABnt6PiAyBjqDKtbg--.7738S4;
 Tue, 13 Sep 2022 12:15:43 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/writeback: Remove redundant initialization of variable ret
Date: Tue, 13 Sep 2022 12:15:28 +0800
Message-Id: <20220913041528.115637-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowABnt6PiAyBjqDKtbg--.7738S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFyrJF47KrWxuFWkKw1Utrb_yoW3Krc_uF
 1UXas7WrnrCFyqyr47Zan3AFyIk3WkuFs3J3Z5t3Z3t3ZrAw1fXry7Gry8Xw1jga47WF9r
 Way2gr4xArs7GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRZ-BN3UUUUU==
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/1tbisgl7F1UMWXkpYQACsk
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

    The variable ret is being initialized with a value that is never
    read, it is being updated later on. The assignment is redundant and
    can be removed.

Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
---
 drivers/gpu/drm/drm_writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index a031c335bdb9..1bf8987322cd 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -179,7 +179,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 				 const u32 *formats, int n_formats,
 				 u32 possible_crtcs)
 {
-	int ret = 0;
+	int ret;
 
 	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
 

base-commit: 5957ac6635a1a12d4aa2661bbf04d3085a73372a
-- 
2.34.1

