Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA9B82A972
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0489F10E824;
	Thu, 11 Jan 2024 08:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
 by gabe.freedesktop.org (Postfix) with ESMTP id 949BA10E036;
 Thu, 11 Jan 2024 02:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=/edpYkM+PNIoAN1Kxh
 JjCCs+q3EKzpx73YhOFtEdW1M=; b=cUB6xS97xPoHQsQ0MRGgpfstci0Y6vPR2Q
 fYKKHcEhcJVaulNcumcDVIb4gwTgHBXTeGP1dIkbXL83W7tfPB2WDxyUA0uzxTNa
 OzFNES+NIp8dvNXs2kMQ3bBDLAMJCBJ3gEAICGX5DLWWIJ5W4EdcMvMjVufuTrou
 q6H4D3coA=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wD3X4H8TZ9lvImbAA--.9890S2; 
 Thu, 11 Jan 2024 10:10:04 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: Xinhui.Pan@amd.com, christian.koenig@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: Clean up errors in amdgpu_rlc.c
Date: Thu, 11 Jan 2024 02:10:02 +0000
Message-Id: <20240111021002.5795-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3X4H8TZ9lvImbAA--.9890S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw15Zr1UKryDCryDKFWfKrg_yoW3trc_CF
 W7XryDXrW3ZFnFqr15Zw4rZ34jyr15uF4kWr1fJas3try7Z3yUAryDuF1jqw1ruF1xGF97
 Xw1vgFZ8AanrCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUeyIUUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiWR5ixWVLYT2tOwAAsE
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
 amd-gfx@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited before that '++' (ctx:WxB)

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c
index 35e0ae9acadc..a6b66e393a5b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c
@@ -241,7 +241,7 @@ void amdgpu_gfx_rlc_setup_cp_table(struct amdgpu_device *adev)
 			table_size = le32_to_cpu(hdr->jt_size);
 		}
 
-		for (i = 0; i < table_size; i ++) {
+		for (i = 0; i < table_size; i++) {
 			dst_ptr[bo_offset + i] =
 				cpu_to_le32(le32_to_cpu(fw_data[table_offset + i]));
 		}
-- 
2.17.1

