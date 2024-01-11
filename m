Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B10882A990
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD1A10E84B;
	Thu, 11 Jan 2024 08:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 09DF110E7C8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=5T0AHkxZ0BUdC30HXl
 e6vf8EoCWrpjRutkeHm3gI4X8=; b=Hezbn2R0UcTrThAh2Y53WDMxRlrS4Z7jUm
 PJEwiMvDRuUhi/iLp4vhNX5WnV0nBRidvhWmd+pWEiQuy8us3OOtG++6Cd1iabJa
 fioOfn+nCQ1nwiVdIdSkmf+Y9uvWzPO3kBUkoRXSOS7Xn7S+ql6XqmQ2xpCRHxSG
 M/Vh1FJ/8=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wD3P5Dhmp9l+sqRAA--.14643S2;
 Thu, 11 Jan 2024 15:38:09 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, airlied@gmail.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Subject: [PATCH] drm/radeon/r100: Clean up errors in r100.c
Date: Thu, 11 Jan 2024 07:38:07 +0000
Message-Id: <20240111073807.10577-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3P5Dhmp9l+sqRAA--.14643S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFy8tFWUGrWfWr48ZrW3Awb_yoW3ArcEgF
 18XFsFqas29F9IgF1j9FWvvryIvr45urs5Cr1Iya4fKF1xZryxZ3sak39xXws5Aa9IqFWD
 Jw4ktFy3ArsFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUtC7UUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEBpi1mVOBk6DhgADsb
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

ERROR: spaces required around that '+=' (ctx:VxV)o

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/r100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index cfeca2694d5f..86b8b770af19 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -1327,7 +1327,7 @@ int r100_packet3_load_vbpntr(struct radeon_cs_parser *p,
 	    return -EINVAL;
 	}
 	track->num_arrays = c;
-	for (i = 0; i < (c - 1); i+=2, idx+=3) {
+	for (i = 0; i < (c - 1); i += 2, idx += 3) {
 		r = radeon_cs_packet_next_reloc(p, &reloc, 0);
 		if (r) {
 			DRM_ERROR("No reloc for packet3 %d\n",
-- 
2.17.1

