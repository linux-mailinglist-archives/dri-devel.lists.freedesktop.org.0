Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F005782A97A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1271810E826;
	Thu, 11 Jan 2024 08:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B04D10E070;
 Thu, 11 Jan 2024 02:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=V6R35R0+952N1XFVaV
 VFcQufmJRU97VsQf0bdd0bwRg=; b=Q+NG9STZKl5fZ/FZ1NJwn1EmYV+TLoFw5K
 Dz6IWgKX5ArPEMLqJIDXf4PlDxGvJmwbgZ/Cwvq6L1cm72vi2JMGChPH0iVyWEN2
 maoR6o0U4GaiV4r/fgmGMa+Jxm+KZPl88wmmiLEnZEQIq7gQsw7RmyPXpN85LW85
 DKDSxgABw=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-3 (Coremail) with SMTP id _____wD3P8JsWZ9lkFcuAA--.19717S2;
 Thu, 11 Jan 2024 10:58:52 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, daniel@ffwll.ch,
 Xinhui.Pan@amd.com, airlied@gmail.com
Subject: [PATCH] drm/amdgpu: Clean up errors in atom-bits.h
Date: Thu, 11 Jan 2024 02:58:50 +0000
Message-Id: <20240111025850.6778-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3P8JsWZ9lkFcuAA--.19717S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw15Gw1kWw47JF1UCw4rKrg_yoWftFX_C3
 WUZ392ga45WFyvkr1ay34qyFy2vFy5uan5Xr48Ka1ayF15Gr1DX3sIgryvqr1ruFs7CF95
 Ga1fXFW5A3ZxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRR_OzPUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiOhlixWVEuXqx0gABsE
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
Cc: chenxuebing <chenxb_99091@126.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited before that ',' (ctx:WxV)

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/atom-bits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/atom-bits.h b/drivers/gpu/drm/amd/include/atom-bits.h
index e8fae5c77514..2bfd6d0ff050 100644
--- a/drivers/gpu/drm/amd/include/atom-bits.h
+++ b/drivers/gpu/drm/amd/include/atom-bits.h
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

