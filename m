Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46805324FD
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 10:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7183B10E559;
	Tue, 24 May 2022 08:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F31610E4A0;
 Tue, 24 May 2022 08:12:08 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R711e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VEHD8XS_1653379916; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VEHD8XS_1653379916) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 24 May 2022 16:12:04 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu/discovery: make amdgpu_discovery_get_mall_info
 static
Date: Tue, 24 May 2022 16:11:54 +0800
Message-Id: <20220524081154.35061-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: yifan1.zhang@amd.com, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 airlied@linux.ie, Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org, Likun.Gao@amd.com,
 flora.cui@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This symbol is not used outside of amdgpu_discovery.c, so marks it static.

Fixes the following w1 warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1364:5: warning: no
previous prototype for ‘amdgpu_discovery_get_mall_info’
[-Wmissing-prototypes].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 881570dced41..16cdfb30b013 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1361,7 +1361,7 @@ union mall_info {
 	struct mall_info_v1_0 v1;
 };
 
-int amdgpu_discovery_get_mall_info(struct amdgpu_device *adev)
+static int amdgpu_discovery_get_mall_info(struct amdgpu_device *adev)
 {
 	struct binary_header *bhdr;
 	union mall_info *mall_info;
-- 
2.20.1.7.g153144c

