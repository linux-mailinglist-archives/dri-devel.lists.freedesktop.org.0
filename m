Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EF182A965
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6711F10E80B;
	Thu, 11 Jan 2024 08:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 94C8F10E7F3;
 Thu, 11 Jan 2024 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=xrO6F352bB0OQHSkJm
 YMF2mTT4CT2aJj50jk7PWpqVk=; b=oSYWWDe/6x9DkJ2/8b07CWbiH8k4Ll+L+N
 nWIZ/gPhr814FoAslMJ1y4e2Qw75nWT0wWUzdEhvlBVLK87m1+kekwFdN9KsM48x
 ZKUE524zecBz9eBlXcuaNLfR/5SZtiulekypNWBN15Sl89DtfCz3ZwoqkxWL3TWf
 6/l9ffsbg=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wDnjxFQnp9lGeMPAA--.3951S2; 
 Thu, 11 Jan 2024 15:52:49 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, airlied@gmail.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in ni_dpm.c
Date: Thu, 11 Jan 2024 07:52:46 +0000
Message-Id: <20240111075246.11027-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDnjxFQnp9lGeMPAA--.3951S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw15ur4fJr15Jw4UAr43ZFb_yoWDJrX_WF
 18Z392ga9xuF9Ygr43Aa1qyFy2vFW5uw4kur4xKa13tFyUWF1kZF9xK340qr45AFs7AF95
 K3y7XFW3A3Z3WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZXo7UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEBRi1mVOBk7vVAAAso
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited before that ',' (ctx:WxV)
ERROR: space required after that ',' (ctx:WxV)

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/atom-bits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/atom-bits.h b/drivers/gpu/drm/radeon/atom-bits.h
index e8fae5c77514..2bfd6d0ff050 100644
--- a/drivers/gpu/drm/radeon/atom-bits.h
+++ b/drivers/gpu/drm/radeon/atom-bits.h
@@ -33,7 +33,7 @@ static inline uint8_t get_u8(void *bios, int ptr)
 #define CU8(ptr) get_u8(ctx->bios, (ptr))
 static inline uint16_t get_u16(void *bios, int ptr)
 {
-    return get_u8(bios ,ptr)|(((uint16_t)get_u8(bios, ptr+1))<<8);
+    return get_u8(bios, ptr)|(((uint16_t)get_u8(bios, ptr+1))<<8);
 }
 #define U16(ptr) get_u16(ctx->ctx->bios, (ptr))
 #define CU16(ptr) get_u16(ctx->bios, (ptr))
-- 
2.17.1

