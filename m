Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503793454B3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 02:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D496E819;
	Tue, 23 Mar 2021 01:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com
 [59.111.176.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5196E819;
 Tue, 23 Mar 2021 01:10:11 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 0D0449802B8;
 Tue, 23 Mar 2021 09:10:07 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sung Lee <sung.lee@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Isabel Zhang <isabel.zhang@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>, Wyatt Wood <wyatt.wood@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: amd: Remove duplicate include of dce110_resource.h
Date: Tue, 23 Mar 2021 09:09:53 +0800
Message-Id: <20210323010955.132219-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHUlCHUgeQ0lJGh9NVkpNSk1PTUpDS0xOSE1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hOSFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PiI6Hjo*Vj8PGjo8OBorTjUC
 MghPFDJVSlVKTUpNT01KQ0tDT05OVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFJQ05CNwY+
X-HM-Tid: 0a785ca1bf4ed992kuws0d0449802b8
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

dce110/dce110_resource.h has been included at line 58, so remove
the duplicate include at line 64.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index 4a3df13c9e49..c4fe21b3b23f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -61,7 +61,6 @@
 #include "dcn21/dcn21_dccg.h"
 #include "dcn21_hubbub.h"
 #include "dcn10/dcn10_resource.h"
-#include "dce110/dce110_resource.h"
 #include "dce/dce_panel_cntl.h"
 
 #include "dcn20/dcn20_dwb.h"
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
