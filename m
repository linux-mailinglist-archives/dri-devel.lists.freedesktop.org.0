Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6852382A977
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE0010E836;
	Thu, 11 Jan 2024 08:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B87B10E070;
 Thu, 11 Jan 2024 05:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=tvJdUgy4whsG2DS43i
 WPd56hnP6TT26Uha6LZDyTmWs=; b=E8vbJjjqHoh8M2U6PhYwbY6zP4RjNy0eK0
 uYBGxXoQ/w5W3CtQP2vX4C/3HQfsPqQJe+RDR/ryFuz93eDvO8XZVa4ON/QpP1xN
 /BmS1J7eq56XXd+z8owFrCUaPEp+EVPabfSvEmnziAg8gb8NlFwfelmVX4ns3dfu
 JrK6Jlepk=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-5 (Coremail) with SMTP id _____wD3n2bUfp9lTHWgAA--.29535S2;
 Thu, 11 Jan 2024 13:38:28 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: alexander.deucher@amd.com, daniel@ffwll.ch, airlied@gmail.com,
 Xinhui.Pan@amd.com, christian.koenig@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in atomfirmwareid.h
Date: Thu, 11 Jan 2024 05:38:27 +0000
Message-Id: <20240111053827.8169-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3n2bUfp9lTHWgAA--.29535S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1kGF1xAF4UGFWkKr47XFb_yoWkAwc_ur
 W8Xws7W345ZFWqvF129rs5Ary5Kw18ua1kWF1ftanaqFnrZr4UZw1DGF47A395uanxWF98
 ta95ur1rAwnrtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUnqXJUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiGBdixWVLZWYonAAAsx
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
Cc: chenxuebing <chenxb_99091@126.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following enum go on the same line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/atomfirmwareid.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/atomfirmwareid.h b/drivers/gpu/drm/amd/include/atomfirmwareid.h
index e6256efd03ae..1ca5fe7b131b 100644
--- a/drivers/gpu/drm/amd/include/atomfirmwareid.h
+++ b/drivers/gpu/drm/amd/include/atomfirmwareid.h
@@ -28,8 +28,7 @@
 #ifndef _ATOMFIRMWAREID_H_
 #define _ATOMFIRMWAREID_H_
 
-enum atom_master_data_table_id
-{
+enum atom_master_data_table_id {
     VBIOS_DATA_TBL_ID__UTILITY_PIPELINE,
     VBIOS_DATA_TBL_ID__MULTIMEDIA_INF,
     VBIOS_DATA_TBL_ID__FIRMWARE_INF,
@@ -51,8 +50,7 @@ enum atom_master_data_table_id
     VBIOS_DATA_TBL_ID__UNDEFINED,
 };
 
-enum atom_master_command_table_id
-{
+enum atom_master_command_table_id {
     VBIOS_CMD_TBL_ID__ASIC_INIT,
     VBIOS_CMD_TBL_ID__DIGX_ENCODER_CONTROL,
     VBIOS_CMD_TBL_ID__SET_ENGINE_CLOCK,
-- 
2.17.1

