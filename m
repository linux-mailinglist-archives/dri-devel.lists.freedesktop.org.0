Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953B8A4FC64
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 11:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113C710E291;
	Wed,  5 Mar 2025 10:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0287C10E291
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 10:41:02 +0000 (UTC)
Received: from jtjnmail201620.home.langchao.com
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202503051840595898;
 Wed, 05 Mar 2025 18:40:59 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201620.home.langchao.com (10.100.2.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Mar 2025 18:40:59 +0800
Received: from locahost.localdomain (10.94.12.149) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Mar 2025 18:40:58 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <Jesse.zhang@amd.com>,
 <Hawking.Zhang@amd.com>, <mario.limonciello@amd.com>, <tim.huang@amd.com>,
 <Likun.Gao@amd.com>, <kevinyang.wang@amd.com>, <dan.carpenter@linaro.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] drm/amdgpu: fix inconsistent indenting warning
Date: Wed, 5 Mar 2025 18:40:57 +0800
Message-ID: <20250305104057.3416-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.12.149]
X-ClientProxiedBy: Jtjnmail201615.home.langchao.com (10.100.2.15) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 2025305184059bb5983e679e3534c0473304859018e69
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix below inconsistent indenting smatch warning.
smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:582 amdgpu_sdma_reset_engine() warn: inconsistent indenting

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 42a7b86e41c3..1037a2f9e3b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -579,5 +579,5 @@ int amdgpu_sdma_reset_engine(struct amdgpu_device *adev, uint32_t instance_id, b
 	if (suspend_user_queues)
 		amdgpu_amdkfd_resume(adev, false);
 
-       return ret;
+	return ret;
 }
-- 
2.43.0

