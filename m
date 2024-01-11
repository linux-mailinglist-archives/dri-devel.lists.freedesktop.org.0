Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C024182A95D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0315010E6C3;
	Thu, 11 Jan 2024 08:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C0C110E7DA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=2m6d3Tey7P5JZiYMjw
 JuGuygHTrtdi5Q/T031eQd4Sc=; b=UDc3Zxz7W0UtNFDfXMCPMeAGO3cvDlqW2T
 yyrxmGlfe/VR3He8Dm2rV0PQmAeCuR/FGDtuQuaq1YD1O1nd7RZt0EjWtFW8u3h8
 gCy3Ogjc5RTGiX9SbIFbG9K96GSb9G9IC/rSUYZgEmyJyjE2AXUBLT+8Y2RQg0WZ
 F7dZCTM9o=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wD3H5_jlJ9l3f6QAA--.20765S2;
 Thu, 11 Jan 2024 15:12:35 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: zackr@vmware.com, mripard@kernel.org, tzimmermann@suse.de, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com
Subject: [PATCH] drm/vmwgfx: Clean up errors in vmwgfx_so.c
Date: Thu, 11 Jan 2024 07:12:33 +0000
Message-Id: <20240111071233.9867-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3H5_jlJ9l3f6QAA--.20765S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFy8tFWUGFy7XFyUXr1UKFg_yoW3AFc_GF
 y8GrWxXrWUXF1Y93WI93yqvr12vw1rZrs7Zw1UKa47GF1xAr4vk3s7CFyDJw1xGF1DWF4D
 tw48WFn3ArW7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZXo7UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqBFi1mVOBk7KXgABs7
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

ERROR: spaces required around that '=' (ctx:VxW)

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_so.c b/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
index d199e718cb2d..124e583edf11 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
@@ -527,7 +527,7 @@ const SVGACOTableType vmw_so_cotables[] = {
 	[vmw_so_rs] = SVGA_COTABLE_RASTERIZERSTATE,
 	[vmw_so_ss] = SVGA_COTABLE_SAMPLER,
 	[vmw_so_so] = SVGA_COTABLE_STREAMOUTPUT,
-	[vmw_so_max]= SVGA_COTABLE_MAX
+	[vmw_so_max] = SVGA_COTABLE_MAX
 };
 
 
-- 
2.17.1

