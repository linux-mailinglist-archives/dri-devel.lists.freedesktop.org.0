Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6B076C6B6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE57110E500;
	Wed,  2 Aug 2023 07:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-73.mail.aliyun.com (out28-73.mail.aliyun.com
 [115.124.28.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DFA10E500;
 Wed,  2 Aug 2023 07:23:25 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.5205414|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.190381-0.000830124-0.808789; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047192; MF=sunran001@208suo.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.U6axboy_1690960997; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6axboy_1690960997) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 15:23:18 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in amdgpu_atombios.h
Date: Wed,  2 Aug 2023 07:23:16 +0000
Message-Id: <20230802072316.12985-1-sunran001@208suo.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Ran Sun <sunran001@208suo.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h
index b639a80ee3fc..0811474e8fd3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h
@@ -89,8 +89,7 @@ struct atom_memory_info {
 
 #define MAX_AC_TIMING_ENTRIES 16
 
-struct atom_memory_clock_range_table
-{
+struct atom_memory_clock_range_table {
 	u8 num_entries;
 	u8 rsv[3];
 	u32 mclk[MAX_AC_TIMING_ENTRIES];
@@ -118,14 +117,12 @@ struct atom_mc_reg_table {
 
 #define MAX_VOLTAGE_ENTRIES 32
 
-struct atom_voltage_table_entry
-{
+struct atom_voltage_table_entry {
 	u16 value;
 	u32 smio_low;
 };
 
-struct atom_voltage_table
-{
+struct atom_voltage_table {
 	u32 count;
 	u32 mask_low;
 	u32 phase_delay;
-- 
2.17.1

