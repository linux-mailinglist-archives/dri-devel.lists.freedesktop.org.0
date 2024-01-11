Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB7382A981
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D363110E83C;
	Thu, 11 Jan 2024 08:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B40E10E7FE;
 Thu, 11 Jan 2024 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=4/Jx3JBI1HjdTdG8JO
 PlsexBLCUAbZM6wJbiVlJEdV0=; b=Vr0Vujg/9yithDZdETK1ydxLa6oOHOFsAs
 r/X1Y6mLJw7xhhlzG9ky7b/Mi/dP++d+EodnBo/FXuxxAiYIRPNUWaXAME+SBC2w
 7bGxcimoOBzsFBwVMr0YZxMwzeGm9LviXGV9gvWJlwguoGlUwcT7iR5puVU+HSIp
 EfGpSWB7w=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wD3X7AqqJ9lWq2UAA--.19387S2;
 Thu, 11 Jan 2024 16:34:50 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in si_dpm.h
Date: Thu, 11 Jan 2024 08:34:48 +0000
Message-Id: <20240111083448.12238-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3X7AqqJ9lWq2UAA--.19387S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWrKF1DWF1xKF1rXw4Utwb_yoW8uw4UpF
 srC343CrWkJr43ua43JFWUCF9I93srJrWIka1DG3yFy3WUZ34kCFn0kr4fZryxGrWF9w12
 yrn2gFy5Ww1a9rDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFdgAUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqAti1mVOBlDTuwAAsC
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
Cc: GuoHua Chen <chenguohua_716@163.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line
ERROR: open brace '{' following enum go on the same line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/si_dpm.h | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/radeon/si_dpm.h b/drivers/gpu/drm/radeon/si_dpm.h
index aa857906ef93..4887edebd348 100644
--- a/drivers/gpu/drm/radeon/si_dpm.h
+++ b/drivers/gpu/drm/radeon/si_dpm.h
@@ -26,15 +26,13 @@
 #include "ni_dpm.h"
 #include "sislands_smc.h"
 
-enum si_cac_config_reg_type
-{
+enum si_cac_config_reg_type {
 	SISLANDS_CACCONFIG_MMR = 0,
 	SISLANDS_CACCONFIG_CGIND,
 	SISLANDS_CACCONFIG_MAX
 };
 
-struct si_cac_config_reg
-{
+struct si_cac_config_reg {
 	u32 offset;
 	u32 mask;
 	u32 shift;
@@ -42,8 +40,7 @@ struct si_cac_config_reg
 	enum si_cac_config_reg_type type;
 };
 
-struct si_powertune_data
-{
+struct si_powertune_data {
 	u32 cac_window;
 	u32 l2_lta_window_size_default;
 	u8 lts_truncate_default;
@@ -56,8 +53,7 @@ struct si_powertune_data
 	bool enable_powertune_by_default;
 };
 
-struct si_dyn_powertune_data
-{
+struct si_dyn_powertune_data {
 	u32 cac_leakage;
 	s32 leakage_minimum_temperature;
 	u32 wintime;
@@ -68,8 +64,7 @@ struct si_dyn_powertune_data
 	bool disable_uvd_powertune;
 };
 
-struct si_dte_data
-{
+struct si_dte_data {
 	u32 tau[SMC_SISLANDS_DTE_MAX_FILTER_STAGES];
 	u32 r[SMC_SISLANDS_DTE_MAX_FILTER_STAGES];
 	u32 k;
@@ -122,8 +117,7 @@ struct si_mc_reg_table {
 #define SISLANDS_MCREGISTERTABLE_ULV_SLOT                   2
 #define SISLANDS_MCREGISTERTABLE_FIRST_DRIVERSTATE_SLOT     3
 
-struct si_leakage_voltage_entry
-{
+struct si_leakage_voltage_entry {
 	u16 voltage;
 	u16 leakage_index;
 };
@@ -131,8 +125,7 @@ struct si_leakage_voltage_entry
 #define SISLANDS_LEAKAGE_INDEX0     0xff01
 #define SISLANDS_MAX_LEAKAGE_COUNT  4
 
-struct si_leakage_voltage
-{
+struct si_leakage_voltage {
 	u16 count;
 	struct si_leakage_voltage_entry entries[SISLANDS_MAX_LEAKAGE_COUNT];
 };
-- 
2.17.1

