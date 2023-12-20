Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9BC8196EE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 03:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA95F10E304;
	Wed, 20 Dec 2023 02:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3288210E304;
 Wed, 20 Dec 2023 02:46:52 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4Svyd26kR1z1Fgx;
 Wed, 20 Dec 2023 10:46:46 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4Svyd13K1JzCXNsX;
 Wed, 20 Dec 2023 10:46:45 +0800 (CST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4Svycv6NgBz8XrRJ;
 Wed, 20 Dec 2023 10:46:39 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4Svycr233Gz4xVcb;
 Wed, 20 Dec 2023 10:46:36 +0800 (CST)
Received: from xaxapp03.zte.com.cn ([10.88.97.17])
 by mse-fl2.zte.com.cn with SMTP id 3BK2kTsI065941;
 Wed, 20 Dec 2023 10:46:29 +0800 (+08)
 (envelope-from yang.guang5@zte.com.cn)
Received: from mapi (xaxapp03[null]) by mapi (Zmail) with MAPI id mid31;
 Wed, 20 Dec 2023 10:46:30 +0800 (CST)
Date: Wed, 20 Dec 2023 10:46:30 +0800 (CST)
X-Zmail-TransId: 2afb6582558662c-ceb76
X-Mailer: Zmail v1.0
Message-ID: <202312201046309071520@zte.com.cn>
Mime-Version: 1.0
From: <yang.guang5@zte.com.cn>
To: <harry.wentland@amd.com>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGRybS9hbWQvZGlzcGxheTogdXNlIGtjYWxsb2MgaW5zdGVhZCBvZiBvcGVuIGNvZGVkIGFyaXRobWV0aWM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 3BK2kTsI065941
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 65825595.001/4Svyd26kR1z1Fgx
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
Cc: srinivasan.shanmugam@amd.com, sunpeng.li@amd.com, cgel.zte@gmail.com,
 dri-devel@lists.freedesktop.org, xinhui.pan@amd.com, rodrigo.siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 chen.haonan2@zte.com.cn, alex.hung@amd.com, hersenxs.wu@amd.com,
 hamza.mahfooz@amd.com, jiang.xuexin@zte.com.cn, wayne.lin@amd.com,
 alexander.deucher@amd.com, airlied@gmail.com, christian.koenig@amd.com,
 mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yang Guang <yang.guang5@zte.com.cn>

Dynamic size calculations (especially multiplication) should not be 
performed in memory allocator (or similar) function arguments due 
to the risk of them overflowing. This could lead to values wrapping 
around and a smaller allocation being made than the caller was 
expecting. Using those allocations could lead to linear overflows 
of heap memory and other misbehaviors. 

Signed-off-by: Chen Haonan <chen.haonan2@zte.com.cn>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d7ac020bd8af..d6d63bd7482e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9204,7 +9204,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		 * Here we create an empty update on each plane.
 		 * To fix this, DC should permit updating only stream properties.
 		 */
-		dummy_updates = kzalloc(sizeof(struct dc_surface_update) * MAX_SURFACES, GFP_ATOMIC);
+		dummy_updates = kcalloc(MAX_SURFACES, sizeof(struct dc_surface_update), GFP_ATOMIC);
 		for (j = 0; j < status->plane_count; j++)
 			dummy_updates[j].surface = status->plane_states[0];

-- 
2.25.1
