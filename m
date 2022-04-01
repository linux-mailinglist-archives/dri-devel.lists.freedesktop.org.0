Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 423684EE906
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 09:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF58B10FE6F;
	Fri,  1 Apr 2022 07:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.meizu.com (edge07.meizu.com [112.91.151.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id A955110F846;
 Fri,  1 Apr 2022 06:28:16 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail11.meizu.com
 (172.16.1.15) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 1 Apr 2022
 14:28:09 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Apr
 2022 14:28:07 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Mohammad Zafar Ziya <Mohammadzafar.ziya@amd.com>, Tao Zhou
 <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [PATCH V2] drm/amdgpu/vcn: Remove unneeded semicolon
Date: Fri, 1 Apr 2022 14:28:05 +0800
Message-ID: <1648794486-23302-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <2a2b1f76-7e9b-9561-e190-16d808eb5399@molgen.mpg.de>
References: <2a2b1f76-7e9b-9561-e190-16d808eb5399@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-124.meizu.com (172.16.1.124) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-Mailman-Approved-At: Fri, 01 Apr 2022 07:23:24 +0000
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
Cc: Haowen Bai <baihaowen@meizu.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

report by coccicheck:
drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:1951:2-3: Unneeded semicolon

Fixes: c543dcbe4237 ("drm/amdgpu/vcn: Add VCN ras error query support")

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
V1->V2: change title; change Fixed info;

 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index 3e1de8c..17d44be 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -1948,7 +1948,7 @@ static uint32_t vcn_v2_6_query_poison_by_instance(struct amdgpu_device *adev,
 		break;
 	default:
 		break;
-	};
+	}
 
 	if (poison_stat)
 		dev_info(adev->dev, "Poison detected in VCN%d, sub_block%d\n",
-- 
2.7.4

