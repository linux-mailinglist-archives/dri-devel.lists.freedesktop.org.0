Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B881292DA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DCD6E1C4;
	Mon, 23 Dec 2019 08:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83BF6EBDA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 06:59:26 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BD535BB4347BE60FDE57;
 Fri, 20 Dec 2019 14:59:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Fri, 20 Dec 2019 14:59:13 +0800
From: Chen Zhou <chenzhou10@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <alexander.deucher@amd.com>
Subject: [PATCH next] drm/amd/display: make some symbols static
Date: Fri, 20 Dec 2019 14:55:57 +0800
Message-ID: <20191220065557.151393-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: chenzhou10@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make some structs and functions static to fix build warnings, parts of
warnings are as follows:

drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_resource.c:744:21:
	warning: symbol 'dce110_clock_source_create' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_resource.c:768:6:
	warning: symbol 'dce110_clock_source_destroy' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
index bf14e9a..87227db 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
@@ -741,7 +741,7 @@ struct dce_i2c_hw *dce110_i2c_hw_create(
 
 	return dce_i2c_hw;
 }
-struct clock_source *dce110_clock_source_create(
+static struct clock_source *dce110_clock_source_create(
 	struct dc_context *ctx,
 	struct dc_bios *bios,
 	enum clock_source_id id,
@@ -765,7 +765,7 @@ struct clock_source *dce110_clock_source_create(
 	return NULL;
 }
 
-void dce110_clock_source_destroy(struct clock_source **clk_src)
+static void dce110_clock_source_destroy(struct clock_source **clk_src)
 {
 	struct dce110_clk_src *dce110_clk_src;
 
@@ -1007,7 +1007,7 @@ static bool dce110_validate_bandwidth(
 	return result;
 }
 
-enum dc_status dce110_validate_plane(const struct dc_plane_state *plane_state,
+static enum dc_status dce110_validate_plane(const struct dc_plane_state *plane_state,
 				     struct dc_caps *caps)
 {
 	if (((plane_state->dst_rect.width * 2) < plane_state->src_rect.width) ||
@@ -1062,7 +1062,7 @@ static bool dce110_validate_surface_sets(
 	return true;
 }
 
-enum dc_status dce110_validate_global(
+static enum dc_status dce110_validate_global(
 		struct dc *dc,
 		struct dc_state *context)
 {
@@ -1305,7 +1305,7 @@ static void bw_calcs_data_update_from_pplib(struct dc *dc)
 		1000);
 }
 
-const struct resource_caps *dce110_resource_cap(
+static const struct resource_caps *dce110_resource_cap(
 	struct hw_asic_id *asic_id)
 {
 	if (ASIC_REV_IS_STONEY(asic_id->hw_internal_rev))
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
