Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B42265B927D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 04:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB62710EA3C;
	Thu, 15 Sep 2022 02:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Thu, 15 Sep 2022 02:03:17 UTC
Received: from out199-6.us.a.mail.aliyun.com (out199-6.us.a.mail.aliyun.com
 [47.90.199.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BC110EA3C;
 Thu, 15 Sep 2022 02:03:16 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VPqLcz8_1663207087; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VPqLcz8_1663207087) by smtp.aliyun-inc.com;
 Thu, 15 Sep 2022 09:58:08 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next 2/6] drm/amd/display: clean up some inconsistent
 indentings
Date: Thu, 15 Sep 2022 09:57:58 +0800
Message-Id: <20220915015802.59967-2-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220915015802.59967-1-yang.lee@linux.alibaba.com>
References: <20220915015802.59967-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clean up some inconsistent indentings

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2178
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 10477ca52a41..47159e9a0884 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -406,14 +406,14 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 		if (adev->reset_domain->type != XGMI_HIVE) {
 			hive->reset_domain =
 				amdgpu_reset_create_reset_domain(XGMI_HIVE, "amdgpu-reset-hive");
-				if (!hive->reset_domain) {
-					dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
-					ret = -ENOMEM;
-					kobject_put(&hive->kobj);
-					kfree(hive);
-					hive = NULL;
-					goto pro_end;
-				}
+			if (!hive->reset_domain) {
+				dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
+				ret = -ENOMEM;
+				kobject_put(&hive->kobj);
+				kfree(hive);
+				hive = NULL;
+				goto pro_end;
+			}
 		} else {
 			amdgpu_reset_get_reset_domain(adev->reset_domain);
 			hive->reset_domain = adev->reset_domain;
-- 
2.20.1.7.g153144c

