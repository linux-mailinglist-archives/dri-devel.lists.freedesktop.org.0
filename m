Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB4282A9AE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FE410E85C;
	Thu, 11 Jan 2024 08:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB30C10E1A0;
 Thu, 11 Jan 2024 08:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=hFyLYRGrdMsKKrb572
 UmJNs+TslUNdb4TSStKU71wo4=; b=DEhWlRLc5nBvJc7T1kmQf5FQf0jlfjkFW3
 Hhnec7P3YSfo8sSEuXaPZh6Zo8tqBw508Gb6QmnpMCTo6GRaIL2FQuUqxPux05ko
 5WKs0iMfCHdvTVJNb08oxXKhZZHscYNnJJ616H9rt3dTmPpAdBd51Jf4NWTk9SSo
 84hhgL+lI=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wDnb5SnqJ9l0suUAA--.19779S2;
 Thu, 11 Jan 2024 16:36:55 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in r600.c
Date: Thu, 11 Jan 2024 08:36:54 +0000
Message-Id: <20240111083654.12411-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDnb5SnqJ9l0suUAA--.19779S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWDZrWxuFy5Kry8JFWfuFg_yoW3WFX_Ca
 48Xws5JFW0vasY9F1IvF4DZr92ya18u397Gw1xKFn3Kry2q3yfua95Gr1fX3y8JF42qF1D
 Aan3XFy3CFsIvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZXo7UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEAti1mVOBk-1wgACs4
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
Cc: GuoHua Chen <chenguohua_716@163.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: that open brace { should be on the previous line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/r600.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
index a17b95eec65f..b5e97d95a19f 100644
--- a/drivers/gpu/drm/radeon/r600.c
+++ b/drivers/gpu/drm/radeon/r600.c
@@ -99,8 +99,7 @@ MODULE_FIRMWARE("radeon/SUMO_me.bin");
 MODULE_FIRMWARE("radeon/SUMO2_pfp.bin");
 MODULE_FIRMWARE("radeon/SUMO2_me.bin");
 
-static const u32 crtc_offsets[2] =
-{
+static const u32 crtc_offsets[2] = {
 	0,
 	AVIVO_D2CRTC_H_TOTAL - AVIVO_D1CRTC_H_TOTAL
 };
-- 
2.17.1

