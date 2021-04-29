Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8B036EAA2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21F96EE95;
	Thu, 29 Apr 2021 12:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m176218.qiye.163.com (mail-m176218.qiye.163.com
 [59.111.176.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDC86EE95;
 Thu, 29 Apr 2021 12:39:11 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m176218.qiye.163.com (Hmail) with ESMTPA id 1208F320114;
 Thu, 29 Apr 2021 20:39:09 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Aric Cyr <aric.cyr@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Jacky Liao <ziyu.liao@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] drm/amd/display: Remove duplicate declaration of dc_state
Date: Thu, 29 Apr 2021 20:38:36 +0800
Message-Id: <20210429123900.25156-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUhKHlZMS0kaGRhJHhkaTR1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MVE6CDo5Hz8IPEgvOD0KFT1C
 SDkKChRVSlVKTUpCTUJCQk9CQkJDVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFJQ0hKNwY+
X-HM-Tid: 0a791da3e029d978kuws1208f320114
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
Cc: kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two declarations of struct dc_state here.
Remove the later duplicate more secure.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
Changelog:
v2:
- Remove the later duplicate instead of the former.
---
 drivers/gpu/drm/amd/display/dc/dc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 8108b82bac60..6f3c95b5d1a2 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -594,7 +594,6 @@ struct dc_bounding_box_overrides {
 	int min_dcfclk_mhz;
 };
 
-struct dc_state;
 struct resource_pool;
 struct dce_hwseq;
 struct gpu_info_soc_bounding_box_v1_0;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
