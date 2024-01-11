Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C56A82A966
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309E810E81B;
	Thu, 11 Jan 2024 08:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC26610E028;
 Thu, 11 Jan 2024 02:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=AOzGKHt46QvNHfyAsE
 g+vgxMfngoEk7dNjwEPlS5T4Y=; b=ZO5jHrfcpWEtByXtvuzg9f/6M8vnoKFdkF
 5Vvfk0DwcLyjcollw3yB8/7Y08W0Zu1AJ+2aSpEB7csx1GhU2AlnirTBvpgQZw85
 t/hX1CTCzfb3KRqXNpk1W6Xje0mi7g0xWzMO0hnYtRvBCEg3avn6mRslvnJDqu4i
 CdPkLyfiE=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wB3tBUiU59l77CcAA--.9723S2; 
 Thu, 11 Jan 2024 10:32:02 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: Xinhui.Pan@amd.com, alexander.deucher@amd.com, airlied@gmail.com,
 christian.koenig@amd.com, daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: Clean up errors in clearstate_si.h
Date: Thu, 11 Jan 2024 02:32:00 +0000
Message-Id: <20240111023200.6506-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wB3tBUiU59l77CcAA--.9723S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF48Xw1UWFW8KFWrZFWxCrg_yoW5Wry3pF
 nrXr1xCw48G3W3XryIq3WDGryrGa92vFZFyryUKw1xA3WkJ397W34DJ3y8AryYqFy8Ar1v
 yF4vqryUtayxCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRijjPUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiWQRixWVLYT4k0AAAs-
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
 drivers/gpu/drm/amd/amdgpu/clearstate_si.h | 24 ++++++++--------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/clearstate_si.h b/drivers/gpu/drm/amd/amdgpu/clearstate_si.h
index 66e39cdb5cb0..5fd96ddd7f0f 100644
--- a/drivers/gpu/drm/amd/amdgpu/clearstate_si.h
+++ b/drivers/gpu/drm/amd/amdgpu/clearstate_si.h
@@ -21,8 +21,7 @@
  *
  */
 
-static const u32 si_SECT_CONTEXT_def_1[] =
-{
+static const u32 si_SECT_CONTEXT_def_1[] = {
     0x00000000, // DB_RENDER_CONTROL
     0x00000000, // DB_COUNT_CONTROL
     0x00000000, // DB_DEPTH_VIEW
@@ -236,8 +235,7 @@ static const u32 si_SECT_CONTEXT_def_1[] =
     0x00000000, // PA_SC_VPORT_ZMIN_15
     0x3f800000, // PA_SC_VPORT_ZMAX_15
 };
-static const u32 si_SECT_CONTEXT_def_2[] =
-{
+static const u32 si_SECT_CONTEXT_def_2[] = {
     0x00000000, // CP_PERFMON_CNTX_CNTL
     0x00000000, // CP_RINGID
     0x00000000, // CP_VMID
@@ -511,8 +509,7 @@ static const u32 si_SECT_CONTEXT_def_2[] =
     0x00000000, // CB_BLEND6_CONTROL
     0x00000000, // CB_BLEND7_CONTROL
 };
-static const u32 si_SECT_CONTEXT_def_3[] =
-{
+static const u32 si_SECT_CONTEXT_def_3[] = {
     0x00000000, // PA_CL_POINT_X_RAD
     0x00000000, // PA_CL_POINT_Y_RAD
     0x00000000, // PA_CL_POINT_SIZE
@@ -520,8 +517,7 @@ static const u32 si_SECT_CONTEXT_def_3[] =
     0x00000000, // VGT_DMA_BASE_HI
     0x00000000, // VGT_DMA_BASE
 };
-static const u32 si_SECT_CONTEXT_def_4[] =
-{
+static const u32 si_SECT_CONTEXT_def_4[] = {
     0x00000000, // DB_DEPTH_CONTROL
     0x00000000, // DB_EQAA
     0x00000000, // CB_COLOR_CONTROL
@@ -680,16 +676,13 @@ static const u32 si_SECT_CONTEXT_def_4[] =
     0x00000000, // VGT_GS_OUT_PRIM_TYPE
     0x00000000, // IA_ENHANCE
 };
-static const u32 si_SECT_CONTEXT_def_5[] =
-{
+static const u32 si_SECT_CONTEXT_def_5[] = {
     0x00000000, // VGT_PRIMITIVEID_EN
 };
-static const u32 si_SECT_CONTEXT_def_6[] =
-{
+static const u32 si_SECT_CONTEXT_def_6[] = {
     0x00000000, // VGT_PRIMITIVEID_RESET
 };
-static const u32 si_SECT_CONTEXT_def_7[] =
-{
+static const u32 si_SECT_CONTEXT_def_7[] = {
     0x00000000, // VGT_MULTI_PRIM_IB_RESET_EN
     0, // HOLE
     0, // HOLE
@@ -924,8 +917,7 @@ static const u32 si_SECT_CONTEXT_def_7[] =
     0x00000000, // CB_COLOR7_CLEAR_WORD0
     0x00000000, // CB_COLOR7_CLEAR_WORD1
 };
-static const struct cs_extent_def si_SECT_CONTEXT_defs[] =
-{
+static const struct cs_extent_def si_SECT_CONTEXT_defs[] = {
     {si_SECT_CONTEXT_def_1, 0x0000a000, 212 },
     {si_SECT_CONTEXT_def_2, 0x0000a0d8, 272 },
     {si_SECT_CONTEXT_def_3, 0x0000a1f5, 6 },
-- 
2.17.1

