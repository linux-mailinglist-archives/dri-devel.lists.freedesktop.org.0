Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5729991D884
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 09:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D7610E333;
	Mon,  1 Jul 2024 07:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Cj+0m9gN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-124.freemail.mail.aliyun.com
 (out30-124.freemail.mail.aliyun.com [115.124.30.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F3610E336;
 Mon,  1 Jul 2024 07:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1719817511; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=IM5TGvOlJvu0p7GNZlYVVp88qVq9MYjf5CUJSWGJK4g=;
 b=Cj+0m9gNNd0LIZIOKDgKBBtc1o5iaDhdD+ToHwa56WRHq//0FF6cYrdbNnfmqhOzvj7HudFOpXAXyil80ycBkMAd5lHkoDmNs7vEWlL9AFgOXZpTLva7ZQ7h4Nz+HrFtuS2S4qI4HyLEF4fSSaYPhDSYt8HppvKslogo2zeBSGY=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033045075189;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0W9b27vI_1719817509; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W9b27vI_1719817509) by smtp.aliyun-inc.com;
 Mon, 01 Jul 2024 15:05:11 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH 1/4] drm/amd/display: Fix warning comparing pointer to 0
Date: Mon,  1 Jul 2024 15:04:54 +0800
Message-Id: <20240701070454.106083-4-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20240701070454.106083-1-jiapeng.chong@linux.alibaba.com>
References: <20240701070454.106083-1-jiapeng.chong@linux.alibaba.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid pointer type value compared with 0 to make code clear.

./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c:31:12-13: WARNING comparing pointer to 0.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9458
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
index a34506a78c50..e0b9ece7901d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
@@ -28,7 +28,7 @@ bool dml2_pmo_create(enum dml2_project_id project_id, struct dml2_pmo_instance *
 {
 	bool result = false;
 
-	if (out == 0)
+	if (!out)
 		return false;
 
 	memset(out, 0, sizeof(struct dml2_pmo_instance));
-- 
2.20.1.7.g153144c

