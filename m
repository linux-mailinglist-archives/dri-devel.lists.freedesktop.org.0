Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481DC82A99D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CAD10E187;
	Thu, 11 Jan 2024 08:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
 by gabe.freedesktop.org (Postfix) with ESMTP id 746E010E070;
 Thu, 11 Jan 2024 02:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=MqvsdNpdgdevTDXLx/
 3wHJ+fUvPHE2tkCRPaSkqqFnc=; b=i7ETgvLpkj+Tbbo+l+WL6t6bbaDDejUXEj
 qCENh2JYuyyi9iPi/mULh1o3ePit2vHRLu0f9N5zNh+NcldamrNkmOPSYuZwBQNk
 M5hxqckrQTUEXkEM7fYH3jZPlihxQmmm+EHnAX12MGTuYsReP1trzYKBTLppTdqo
 SAaCtkOt0=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-4 (Coremail) with SMTP id _____wDXH75oS59l9eMsAA--.11769S2;
 Thu, 11 Jan 2024 09:59:05 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, Xinhui.Pan@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in clearstate_gfx9.h
Date: Thu, 11 Jan 2024 01:59:03 +0000
Message-Id: <20240111015903.5433-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDXH75oS59l9eMsAA--.11769S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF4rXF48CFyUJFWrJrWkWFg_yoW5tFWxpF
 1DAr1Ig3yxJ3WaqrWxtFs8KF1fGrZFv3Z2yr47K3WxG3Z5XayDXa4DJ3yrCrWUtFykZF1q
 yF4vqrWUKay8Cw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UbF4iUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiWQtixWVLYT1tUwAAs5
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: that open brace { should be on the previous line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h | 27 +++++++-------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h b/drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h
index 567a904804bc..9c85ca6358c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h
+++ b/drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h
@@ -21,8 +21,7 @@
  *
  */
 
-static const unsigned int gfx9_SECT_CONTEXT_def_1[] =
-{
+static const unsigned int gfx9_SECT_CONTEXT_def_1[] = {
     0x00000000, // DB_RENDER_CONTROL
     0x00000000, // DB_COUNT_CONTROL
     0x00000000, // DB_DEPTH_VIEW
@@ -236,8 +235,7 @@ static const unsigned int gfx9_SECT_CONTEXT_def_1[] =
     0x00000000, // PA_SC_VPORT_ZMIN_15
     0x3f800000, // PA_SC_VPORT_ZMAX_15
 };
-static const unsigned int gfx9_SECT_CONTEXT_def_2[] =
-{
+static const unsigned int gfx9_SECT_CONTEXT_def_2[] = {
     0x00000000, // PA_SC_SCREEN_EXTENT_CONTROL
     0x00000000, // PA_SC_TILE_STEERING_OVERRIDE
     0x00000000, // CP_PERFMON_CNTX_CNTL
@@ -521,15 +519,13 @@ static const unsigned int gfx9_SECT_CONTEXT_def_2[] =
     0x00000000, // CB_MRT6_EPITCH
     0x00000000, // CB_MRT7_EPITCH
 };
-static const unsigned int gfx9_SECT_CONTEXT_def_3[] =
-{
+static const unsigned int gfx9_SECT_CONTEXT_def_3[] = {
     0x00000000, // PA_CL_POINT_X_RAD
     0x00000000, // PA_CL_POINT_Y_RAD
     0x00000000, // PA_CL_POINT_SIZE
     0x00000000, // PA_CL_POINT_CULL_RAD
 };
-static const unsigned int gfx9_SECT_CONTEXT_def_4[] =
-{
+static const unsigned int gfx9_SECT_CONTEXT_def_4[] = {
     0x00000000, // DB_DEPTH_CONTROL
     0x00000000, // DB_EQAA
     0x00000000, // CB_COLOR_CONTROL
@@ -688,17 +684,14 @@ static const unsigned int gfx9_SECT_CONTEXT_def_4[] =
     0x00000000, // VGT_GS_OUT_PRIM_TYPE
     0x00000000, // IA_ENHANCE
 };
-static const unsigned int gfx9_SECT_CONTEXT_def_5[] =
-{
+static const unsigned int gfx9_SECT_CONTEXT_def_5[] = {
     0x00000000, // WD_ENHANCE
     0x00000000, // VGT_PRIMITIVEID_EN
 };
-static const unsigned int gfx9_SECT_CONTEXT_def_6[] =
-{
+static const unsigned int gfx9_SECT_CONTEXT_def_6[] = {
     0x00000000, // VGT_PRIMITIVEID_RESET
 };
-static const unsigned int gfx9_SECT_CONTEXT_def_7[] =
-{
+static const unsigned int gfx9_SECT_CONTEXT_def_7[] = {
     0x00000000, // VGT_GS_MAX_PRIMS_PER_SUBGROUP
     0x00000000, // VGT_DRAW_PAYLOAD_CNTL
     0, // HOLE
@@ -766,8 +759,7 @@ static const unsigned int gfx9_SECT_CONTEXT_def_7[] =
     0x00000000, // VGT_STRMOUT_CONFIG
     0x00000000, // VGT_STRMOUT_BUFFER_CONFIG
 };
-static const unsigned int gfx9_SECT_CONTEXT_def_8[] =
-{
+static const unsigned int gfx9_SECT_CONTEXT_def_8[] = {
     0x00000000, // PA_SC_CENTROID_PRIORITY_0
     0x00000000, // PA_SC_CENTROID_PRIORITY_1
     0x00001000, // PA_SC_LINE_CNTL
@@ -924,8 +916,7 @@ static const unsigned int gfx9_SECT_CONTEXT_def_8[] =
     0x00000000, // CB_COLOR7_DCC_BASE
     0x00000000, // CB_COLOR7_DCC_BASE_EXT
 };
-static const struct cs_extent_def gfx9_SECT_CONTEXT_defs[] =
-{
+static const struct cs_extent_def gfx9_SECT_CONTEXT_defs[] = {
     {gfx9_SECT_CONTEXT_def_1, 0x0000a000, 212 },
     {gfx9_SECT_CONTEXT_def_2, 0x0000a0d6, 282 },
     {gfx9_SECT_CONTEXT_def_3, 0x0000a1f5, 4 },
-- 
2.17.1

