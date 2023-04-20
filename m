Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011E96E8D0F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 10:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABC010EBE8;
	Thu, 20 Apr 2023 08:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A2310EBE5;
 Thu, 20 Apr 2023 08:47:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E5DD8645FA;
 Thu, 20 Apr 2023 08:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF976C433D2;
 Thu, 20 Apr 2023 08:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681980437;
 bh=uADxxtxxbjR1ZmBmGvPD7EU2EEluZLYB+5f1TqvzOxs=;
 h=From:To:Cc:Subject:Date:From;
 b=ViTEOfcPaOYEWW6eyaRDKjG09tmHwSLtnm4Cljj4u20xjKIKZpyXkQO27yc4pIrI4
 tOSLhFA6R+2a7n9TDWtFgvtYuKFKX/PtfWkyV4+FspVRe5iNDXFqaWVE3arjpFO5Qh
 ETNPK3v2QOh3+Q4rCoxgk3HvJhYsMaHrTo5VhjN/3DPrQu+BTPbIabLzE2/55ssA8z
 q84IQU5rq3vBlW2TVlxKi/ax0nrc2ZkU7Izm8MPS4XxQ6PHfbyMxymCAGJ32e05yf8
 1nxyYUou7XEYImRNo0SltMmngP+iGObZ+r2F6zA7UKmJ8nf9922LaTkpdtsPJwvFcP
 GK7HNXCZEtHFA==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Le Ma <le.ma@amd.com>
Subject: [PATCH 1/3] drm/amdgpu: mark gfx_v9_4_3_disable_gpa_mode() static
Date: Thu, 20 Apr 2023 10:47:00 +0200
Message-Id: <20230420084711.3063453-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Morris Zhang <Shiwu.Zhang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

This was left global by accident, the corresponding functions for other
hardware types are already static:

drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:1072:6: error: no previous prototype for function 'gfx_v9_4_3_disable_gpa_mode' [-Werror,-Wmissing-prototypes]

Fixes: 86301129698b ("drm/amdgpu: split gc v9_4_3 functionality from gc v9_0")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index baa10ee8ec69..5d3aafba1f8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -1069,7 +1069,7 @@ static void gfx_v9_4_3_init_pg(struct amdgpu_device *adev, int xcc_id)
 	}
 }
 
-void gfx_v9_4_3_disable_gpa_mode(struct amdgpu_device *adev, int xcc_id)
+static void gfx_v9_4_3_disable_gpa_mode(struct amdgpu_device *adev, int xcc_id)
 {
 	uint32_t data;
 
-- 
2.39.2

