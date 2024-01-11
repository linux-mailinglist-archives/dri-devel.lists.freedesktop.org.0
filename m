Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C23582A979
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DB810E83D;
	Thu, 11 Jan 2024 08:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id E8D1410E1A0;
 Thu, 11 Jan 2024 08:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=4+7q/cJQbdUcZSZTlK
 ekvnUhkesNVgHuK7d6AEfDCjc=; b=kZayJxopMkdN6Qt8rH2r17nSmtjnYpLfRw
 JxXAv+IDWaOU6/6BXBDubESRja+oCuKjewSDZrfY+gd3Q1/VMdHUe0BTBg260CrZ
 42xWinMJixPuCeJG+teLqoID0onyjpmc5wgozXwUEOPnGd9rLIwsXv2uHvgGFYsK
 ERmjvUMYc=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wD33_Qvqp9lvS6VAA--.55985S2;
 Thu, 11 Jan 2024 16:43:27 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon/ci_dpm: Clean up errors in ci_dpm.c
Date: Thu, 11 Jan 2024 08:43:25 +0000
Message-Id: <20240111084325.12499-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD33_Qvqp9lvS6VAA--.55985S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gw4furWkKr47Wry5ZFW5ZFb_yoW7AF18pr
 4UurWvkrZYvFyYga15X3sFyF4F9r92v3yxua17Kw1S9395C348JF1rt3y7tF9xA340vFn0
 vF1qkryUXFZ2vFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFdgAUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqBNi1mVOBlEJBwAAs9
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

ERROR: that open brace { should be on the previous line
ERROR: need consistent spacing around '-' (ctx:WxV)
ERROR: space required before the open parenthesis '('
ERROR: "foo* bar" should be "foo *bar"

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/ci_dpm.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
index b8f4dac68d85..abe9d65cc460 100644
--- a/drivers/gpu/drm/radeon/ci_dpm.c
+++ b/drivers/gpu/drm/radeon/ci_dpm.c
@@ -46,36 +46,31 @@
 #define VOLTAGE_VID_OFFSET_SCALE1    625
 #define VOLTAGE_VID_OFFSET_SCALE2    100
 
-static const struct ci_pt_defaults defaults_hawaii_xt =
-{
+static const struct ci_pt_defaults defaults_hawaii_xt = {
 	1, 0xF, 0xFD, 0x19, 5, 0x14, 0, 0xB0000,
 	{ 0x2E,  0x00,  0x00,  0x88,  0x00,  0x00,  0x72,  0x60,  0x51,  0xA7,  0x79,  0x6B,  0x90,  0xBD,  0x79  },
 	{ 0x217, 0x217, 0x217, 0x242, 0x242, 0x242, 0x269, 0x269, 0x269, 0x2A1, 0x2A1, 0x2A1, 0x2C9, 0x2C9, 0x2C9 }
 };
 
-static const struct ci_pt_defaults defaults_hawaii_pro =
-{
+static const struct ci_pt_defaults defaults_hawaii_pro = {
 	1, 0xF, 0xFD, 0x19, 5, 0x14, 0, 0x65062,
 	{ 0x2E,  0x00,  0x00,  0x88,  0x00,  0x00,  0x72,  0x60,  0x51,  0xA7,  0x79,  0x6B,  0x90,  0xBD,  0x79  },
 	{ 0x217, 0x217, 0x217, 0x242, 0x242, 0x242, 0x269, 0x269, 0x269, 0x2A1, 0x2A1, 0x2A1, 0x2C9, 0x2C9, 0x2C9 }
 };
 
-static const struct ci_pt_defaults defaults_bonaire_xt =
-{
+static const struct ci_pt_defaults defaults_bonaire_xt = {
 	1, 0xF, 0xFD, 0x19, 5, 45, 0, 0xB0000,
 	{ 0x79,  0x253, 0x25D, 0xAE,  0x72,  0x80,  0x83,  0x86,  0x6F,  0xC8,  0xC9,  0xC9,  0x2F,  0x4D,  0x61  },
 	{ 0x17C, 0x172, 0x180, 0x1BC, 0x1B3, 0x1BD, 0x206, 0x200, 0x203, 0x25D, 0x25A, 0x255, 0x2C3, 0x2C5, 0x2B4 }
 };
 
-static const struct ci_pt_defaults defaults_saturn_xt =
-{
+static const struct ci_pt_defaults defaults_saturn_xt = {
 	1, 0xF, 0xFD, 0x19, 5, 55, 0, 0x70000,
 	{ 0x8C,  0x247, 0x249, 0xA6,  0x80,  0x81,  0x8B,  0x89,  0x86,  0xC9,  0xCA,  0xC9,  0x4D,  0x4D,  0x4D  },
 	{ 0x187, 0x187, 0x187, 0x1C7, 0x1C7, 0x1C7, 0x210, 0x210, 0x210, 0x266, 0x266, 0x266, 0x2C9, 0x2C9, 0x2C9 }
 };
 
-static const struct ci_pt_config_reg didt_config_ci[] =
-{
+static const struct ci_pt_config_reg didt_config_ci[] = {
 	{ 0x10, 0x000000ff, 0, 0x0, CISLANDS_CONFIGREG_DIDT_IND },
 	{ 0x10, 0x0000ff00, 8, 0x0, CISLANDS_CONFIGREG_DIDT_IND },
 	{ 0x10, 0x00ff0000, 16, 0x0, CISLANDS_CONFIGREG_DIDT_IND },
@@ -1216,7 +1211,7 @@ static void ci_thermal_initialize(struct radeon_device *rdev)
 
 	if (rdev->pm.fan_pulses_per_revolution) {
 		tmp = RREG32_SMC(CG_TACH_CTRL) & ~EDGE_PER_REV_MASK;
-		tmp |= EDGE_PER_REV(rdev->pm.fan_pulses_per_revolution -1);
+		tmp |= EDGE_PER_REV(rdev->pm.fan_pulses_per_revolution - 1);
 		WREG32_SMC(CG_TACH_CTRL, tmp);
 	}
 
@@ -3333,7 +3328,7 @@ static int ci_populate_all_memory_levels(struct radeon_device *rdev)
 }
 
 static void ci_reset_single_dpm_table(struct radeon_device *rdev,
-				      struct ci_single_dpm_table* dpm_table,
+				      struct ci_single_dpm_table *dpm_table,
 				      u32 count)
 {
 	u32 i;
@@ -3343,7 +3338,7 @@ static void ci_reset_single_dpm_table(struct radeon_device *rdev,
 		dpm_table->dpm_levels[i].enabled = false;
 }
 
-static void ci_setup_pcie_table_entry(struct ci_single_dpm_table* dpm_table,
+static void ci_setup_pcie_table_entry(struct ci_single_dpm_table *dpm_table,
 				      u32 index, u32 pcie_gen, u32 pcie_lanes)
 {
 	dpm_table->dpm_levels[index].value = pcie_gen;
@@ -3503,7 +3498,7 @@ static int ci_find_boot_level(struct ci_single_dpm_table *table,
 	u32 i;
 	int ret = -EINVAL;
 
-	for(i = 0; i < table->count; i++) {
+	for (i = 0; i < table->count; i++) {
 		if (value == table->dpm_levels[i].value) {
 			*boot_level = i;
 			ret = 0;
@@ -4304,7 +4299,7 @@ static int ci_set_mc_special_registers(struct radeon_device *rdev,
 	for (i = 0, j = table->last; i < table->last; i++) {
 		if (j >= SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE)
 			return -EINVAL;
-		switch(table->mc_reg_address[i].s1 << 2) {
+		switch (table->mc_reg_address[i].s1 << 2) {
 		case MC_SEQ_MISC1:
 			temp_reg = RREG32(MC_PMG_CMD_EMRS);
 			table->mc_reg_address[j].s1 = MC_PMG_CMD_EMRS >> 2;
@@ -4369,7 +4364,7 @@ static bool ci_check_s0_mc_reg_index(u16 in_reg, u16 *out_reg)
 {
 	bool result = true;
 
-	switch(in_reg) {
+	switch (in_reg) {
 	case MC_SEQ_RAS_TIMING >> 2:
 		*out_reg = MC_SEQ_RAS_TIMING_LP >> 2;
 		break;
@@ -4508,7 +4503,7 @@ static int ci_register_patching_mc_seq(struct radeon_device *rdev,
 		for (i = 0; i < table->last; i++) {
 			if (table->last >= SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE)
 				return -EINVAL;
-			switch(table->mc_reg_address[i].s1 >> 2) {
+			switch (table->mc_reg_address[i].s1 >> 2) {
 			case MC_SEQ_MISC1:
 				for (k = 0; k < table->num_entries; k++) {
 					if ((table->mc_reg_table_entry[k].mclk_max == 125000) ||
@@ -4683,7 +4678,7 @@ static void ci_convert_mc_reg_table_entry_to_smc(struct radeon_device *rdev,
 	struct ci_power_info *pi = ci_get_pi(rdev);
 	u32 i = 0;
 
-	for(i = 0; i < pi->mc_reg_table.num_entries; i++) {
+	for (i = 0; i < pi->mc_reg_table.num_entries; i++) {
 		if (memory_clock <= pi->mc_reg_table.mc_reg_table_entry[i].mclk_max)
 			break;
 	}
-- 
2.17.1

