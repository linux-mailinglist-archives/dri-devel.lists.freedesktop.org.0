Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5A678F6BC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 03:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6863A10E712;
	Fri,  1 Sep 2023 01:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2179B10E712;
 Fri,  1 Sep 2023 01:29:40 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R601e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VqzgJsZ_1693531775; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VqzgJsZ_1693531775) by smtp.aliyun-inc.com;
 Fri, 01 Sep 2023 09:29:36 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 harry.wentland@amd.com, Rodrigo.Siqueira@amd.com
Subject: [PATCH -next 5/5] drm/amd/display: clean up one inconsistent indenting
Date: Fri,  1 Sep 2023 09:29:24 +0800
Message-Id: <20230901012924.120196-5-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20230901012924.120196-1-yang.lee@linux.alibaba.com>
References: <20230901012924.120196-1-yang.lee@linux.alibaba.com>
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.c:260 dcn35_update_bw_bounding_box_fpu() warn: inconsistent indenting

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
index 525ca0ed9ea9..46eb2d0592f3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
@@ -348,8 +348,8 @@ void dcn35_update_bw_bounding_box_fpu(struct dc *dc,
 			dc->debug.dram_clock_change_latency_ns / 1000.0;
 	}
 	/*temp till dml2 fully work without dml1*/
-		dml_init_instance(&dc->dml, &dcn3_5_soc, &dcn3_5_ip,
-				  DML_PROJECT_DCN31);
+	dml_init_instance(&dc->dml, &dcn3_5_soc, &dcn3_5_ip,
+				DML_PROJECT_DCN31);
 }
 
 static bool is_dual_plane(enum surface_pixel_format format)
-- 
2.20.1.7.g153144c

