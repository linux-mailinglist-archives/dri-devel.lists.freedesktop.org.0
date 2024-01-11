Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F7782A973
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048D810E825;
	Thu, 11 Jan 2024 08:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDDE610E028;
 Thu, 11 Jan 2024 02:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=nbbVvUF/7Gsgkfq6Xu
 1euEZczf3yX7tnXLat+g/jEbg=; b=V487I3661EHGOrtHEJZmbZzrAKmx1eYtqw
 bjlRIlNd35Bwg8dtgjQt6rb9z+QAzxA3xoPQdMRNsGglKIjWrlOf3Nxs0/+sITr+
 9nwhILbhYRLul9cXM8NWSs8DGCTUedXsa93jyOR6aPlnhSOSlo0UtgWQgM+5Bi8Q
 C6BGBvTzc=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-5 (Coremail) with SMTP id _____wD331ppUZ9lMjQtAA--.21367S2;
 Thu, 11 Jan 2024 10:24:41 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Xinhui.Pan@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in jpeg_v2_5.c
Date: Thu, 11 Jan 2024 02:24:37 +0000
Message-Id: <20240111022437.6239-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD331ppUZ9lMjQtAA--.21367S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWDWry7JF13Jry3Ary3twb_yoW8WFWUpa
 93AFy5urs5CFnFv3ZrX3WDZFnYkw13u3W5CrWUJw1fu3W5Jr98X3s7tFy5Z340qFWxCrWI
 vr48t3y7X3WIvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRijjPUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiHAxixWV2zz6PUgAAsI
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space required before the open parenthesis '('
ERROR: that open brace { should be on the previous line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
index e67a337457ed..99cd49ee8ef6 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
@@ -551,7 +551,7 @@ static int jpeg_v2_5_set_powergating_state(void *handle,
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	int ret;
 
-	if(state == adev->jpeg.cur_state)
+	if (state == adev->jpeg.cur_state)
 		return 0;
 
 	if (state == AMD_PG_STATE_GATE)
@@ -559,7 +559,7 @@ static int jpeg_v2_5_set_powergating_state(void *handle,
 	else
 		ret = jpeg_v2_5_start(adev);
 
-	if(!ret)
+	if (!ret)
 		adev->jpeg.cur_state = state;
 
 	return ret;
@@ -754,8 +754,7 @@ static void jpeg_v2_5_set_irq_funcs(struct amdgpu_device *adev)
 	}
 }
 
-const struct amdgpu_ip_block_version jpeg_v2_5_ip_block =
-{
+const struct amdgpu_ip_block_version jpeg_v2_5_ip_block = {
 		.type = AMD_IP_BLOCK_TYPE_JPEG,
 		.major = 2,
 		.minor = 5,
@@ -763,8 +762,7 @@ const struct amdgpu_ip_block_version jpeg_v2_5_ip_block =
 		.funcs = &jpeg_v2_5_ip_funcs,
 };
 
-const struct amdgpu_ip_block_version jpeg_v2_6_ip_block =
-{
+const struct amdgpu_ip_block_version jpeg_v2_6_ip_block = {
 		.type = AMD_IP_BLOCK_TYPE_JPEG,
 		.major = 2,
 		.minor = 6,
-- 
2.17.1

