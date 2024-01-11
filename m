Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CEB82A993
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAB910E855;
	Thu, 11 Jan 2024 08:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B54A10E7C8;
 Thu, 11 Jan 2024 08:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=Vxs/9a7sqhQlJj4S3j
 1ChSIbzxBuadcH2mbF7ZpIbfs=; b=EIqGb5+ESfJ3pp84gyeG2QDXQPulWO17Dc
 fIihFjNgjbRKMs1FayD9QI2PzpljkyXZxLme5Kur1tQAlxZDwRIvj5sIwaQFPyUz
 CV0NidyMLHD3pxvp2Z86wHnQyctK+v0SfWBJ1ZS+WXZMF02UiadFeauUERt3AAQ3
 c4Ef2qAV4=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wDXnxODo59lsiURAA--.4147S2; 
 Thu, 11 Jan 2024 16:14:59 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, airlied@gmail.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Subject: [PATCH] drm/radeon/btc_dpm: Clean up errors in btc_dpm.c
Date: Thu, 11 Jan 2024 08:14:56 +0000
Message-Id: <20240111081456.11404-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDXnxODo59lsiURAA--.4147S2
X-Coremail-Antispam: 1Uf129KBjvAXoW3ur15ZF15WrW7Jry7Kw1xZrb_yoW8JryxJo
 WxAry5Xa1xWrW7XF17ZF1qqFy7Ww4Iy3ZIgan5Jw48Cr9rKFs2qryxGwn5GFZIgrn8KF15
 Z342y34rJ3s7Jr4kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU1vtZUUUUU
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEARi1mVOBk95BAAAs-
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: that open brace { should be on the previous line
ERROR: space required before the open parenthesis '('
ERROR: spaces required around that '+=' (ctx:VxV)
ERROR: spaces required around that '=' (ctx:VxW)

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/btc_dpm.c | 90 +++++++++++---------------------
 1 file changed, 31 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/radeon/btc_dpm.c b/drivers/gpu/drm/radeon/btc_dpm.c
index 4e64ed38c439..70931b04bbac 100644
--- a/drivers/gpu/drm/radeon/btc_dpm.c
+++ b/drivers/gpu/drm/radeon/btc_dpm.c
@@ -53,8 +53,7 @@
 extern int ni_mc_load_microcode(struct radeon_device *rdev);
 
 //********* BARTS **************//
-static const u32 barts_cgcg_cgls_default[] =
-{
+static const u32 barts_cgcg_cgls_default[] = {
 	/* Register,   Value,     Mask bits */
 	0x000008f8, 0x00000010, 0xffffffff,
 	0x000008fc, 0x00000000, 0xffffffff,
@@ -107,8 +106,7 @@ static const u32 barts_cgcg_cgls_default[] =
 };
 #define BARTS_CGCG_CGLS_DEFAULT_LENGTH sizeof(barts_cgcg_cgls_default) / (3 * sizeof(u32))
 
-static const u32 barts_cgcg_cgls_disable[] =
-{
+static const u32 barts_cgcg_cgls_disable[] = {
 	0x000008f8, 0x00000010, 0xffffffff,
 	0x000008fc, 0xffffffff, 0xffffffff,
 	0x000008f8, 0x00000011, 0xffffffff,
@@ -162,8 +160,7 @@ static const u32 barts_cgcg_cgls_disable[] =
 };
 #define BARTS_CGCG_CGLS_DISABLE_LENGTH sizeof(barts_cgcg_cgls_disable) / (3 * sizeof(u32))
 
-static const u32 barts_cgcg_cgls_enable[] =
-{
+static const u32 barts_cgcg_cgls_enable[] = {
 	/* 0x0000c124, 0x84180000, 0x00180000, */
 	0x00000644, 0x000f7892, 0x001f4080,
 	0x000008f8, 0x00000010, 0xffffffff,
@@ -217,8 +214,7 @@ static const u32 barts_cgcg_cgls_enable[] =
 };
 #define BARTS_CGCG_CGLS_ENABLE_LENGTH sizeof(barts_cgcg_cgls_enable) / (3 * sizeof(u32))
 
-static const u32 barts_mgcg_default[] =
-{
+static const u32 barts_mgcg_default[] = {
 	0x0000802c, 0xc0000000, 0xffffffff,
 	0x00005448, 0x00000100, 0xffffffff,
 	0x000055e4, 0x00600100, 0xffffffff,
@@ -366,8 +362,7 @@ static const u32 barts_mgcg_default[] =
 };
 #define BARTS_MGCG_DEFAULT_LENGTH sizeof(barts_mgcg_default) / (3 * sizeof(u32))
 
-static const u32 barts_mgcg_disable[] =
-{
+static const u32 barts_mgcg_disable[] = {
 	0x0000802c, 0xc0000000, 0xffffffff,
 	0x000008f8, 0x00000000, 0xffffffff,
 	0x000008fc, 0xffffffff, 0xffffffff,
@@ -381,8 +376,7 @@ static const u32 barts_mgcg_disable[] =
 };
 #define BARTS_MGCG_DISABLE_LENGTH sizeof(barts_mgcg_disable) / (3 * sizeof(u32))
 
-static const u32 barts_mgcg_enable[] =
-{
+static const u32 barts_mgcg_enable[] = {
 	0x0000802c, 0xc0000000, 0xffffffff,
 	0x000008f8, 0x00000000, 0xffffffff,
 	0x000008fc, 0x00000000, 0xffffffff,
@@ -397,8 +391,7 @@ static const u32 barts_mgcg_enable[] =
 #define BARTS_MGCG_ENABLE_LENGTH sizeof(barts_mgcg_enable) / (3 * sizeof(u32))
 
 //********* CAICOS **************//
-static const u32 caicos_cgcg_cgls_default[] =
-{
+static const u32 caicos_cgcg_cgls_default[] = {
 	0x000008f8, 0x00000010, 0xffffffff,
 	0x000008fc, 0x00000000, 0xffffffff,
 	0x000008f8, 0x00000011, 0xffffffff,
@@ -450,8 +443,7 @@ static const u32 caicos_cgcg_cgls_default[] =
 };
 #define CAICOS_CGCG_CGLS_DEFAULT_LENGTH sizeof(caicos_cgcg_cgls_default) / (3 * sizeof(u32))
 
-static const u32 caicos_cgcg_cgls_disable[] =
-{
+static const u32 caicos_cgcg_cgls_disable[] = {
 	0x000008f8, 0x00000010, 0xffffffff,
 	0x000008fc, 0xffffffff, 0xffffffff,
 	0x000008f8, 0x00000011, 0xffffffff,
@@ -505,8 +497,7 @@ static const u32 caicos_cgcg_cgls_disable[] =
 };
 #define CAICOS_CGCG_CGLS_DISABLE_LENGTH sizeof(caicos_cgcg_cgls_disable) / (3 * sizeof(u32))
 
-static const u32 caicos_cgcg_cgls_enable[] =
-{
+static const u32 caicos_cgcg_cgls_enable[] = {
 	/* 0x0000c124, 0x84180000, 0x00180000, */
 	0x00000644, 0x000f7892, 0x001f4080,
 	0x000008f8, 0x00000010, 0xffffffff,
@@ -560,8 +551,7 @@ static const u32 caicos_cgcg_cgls_enable[] =
 };
 #define CAICOS_CGCG_CGLS_ENABLE_LENGTH sizeof(caicos_cgcg_cgls_enable) / (3 * sizeof(u32))
 
-static const u32 caicos_mgcg_default[] =
-{
+static const u32 caicos_mgcg_default[] = {
 	0x0000802c, 0xc0000000, 0xffffffff,
 	0x00005448, 0x00000100, 0xffffffff,
 	0x000055e4, 0x00600100, 0xffffffff,
@@ -640,8 +630,7 @@ static const u32 caicos_mgcg_default[] =
 };
 #define CAICOS_MGCG_DEFAULT_LENGTH sizeof(caicos_mgcg_default) / (3 * sizeof(u32))
 
-static const u32 caicos_mgcg_disable[] =
-{
+static const u32 caicos_mgcg_disable[] = {
 	0x0000802c, 0xc0000000, 0xffffffff,
 	0x000008f8, 0x00000000, 0xffffffff,
 	0x000008fc, 0xffffffff, 0xffffffff,
@@ -655,8 +644,7 @@ static const u32 caicos_mgcg_disable[] =
 };
 #define CAICOS_MGCG_DISABLE_LENGTH sizeof(caicos_mgcg_disable) / (3 * sizeof(u32))
 
-static const u32 caicos_mgcg_enable[] =
-{
+static const u32 caicos_mgcg_enable[] = {
 	0x0000802c, 0xc0000000, 0xffffffff,
 	0x000008f8, 0x00000000, 0xffffffff,
 	0x000008fc, 0x00000000, 0xffffffff,
@@ -671,8 +659,7 @@ static const u32 caicos_mgcg_enable[] =
 #define CAICOS_MGCG_ENABLE_LENGTH sizeof(caicos_mgcg_enable) / (3 * sizeof(u32))
 
 //********* TURKS **************//
-static const u32 turks_cgcg_cgls_default[] =
-{
+static const u32 turks_cgcg_cgls_default[] = {
 	0x000008f8, 0x00000010, 0xffffffff,
 	0x000008fc, 0x00000000, 0xffffffff,
 	0x000008f8, 0x00000011, 0xffffffff,
@@ -724,8 +711,7 @@ static const u32 turks_cgcg_cgls_default[] =
 };
 #define TURKS_CGCG_CGLS_DEFAULT_LENGTH  sizeof(turks_cgcg_cgls_default) / (3 * sizeof(u32))
 
-static const u32 turks_cgcg_cgls_disable[] =
-{
+static const u32 turks_cgcg_cgls_disable[] = {
 	0x000008f8, 0x00000010, 0xffffffff,
 	0x000008fc, 0xffffffff, 0xffffffff,
 	0x000008f8, 0x00000011, 0xffffffff,
@@ -779,8 +765,7 @@ static const u32 turks_cgcg_cgls_disable[] =
 };
 #define TURKS_CGCG_CGLS_DISABLE_LENGTH sizeof(turks_cgcg_cgls_disable) / (3 * sizeof(u32))
 
-static const u32 turks_cgcg_cgls_enable[] =
-{
+static const u32 turks_cgcg_cgls_enable[] = {
 	/* 0x0000c124, 0x84180000, 0x00180000, */
 	0x00000644, 0x000f7892, 0x001f4080,
 	0x000008f8, 0x00000010, 0xffffffff,
@@ -835,8 +820,7 @@ static const u32 turks_cgcg_cgls_enable[] =
 #define TURKS_CGCG_CGLS_ENABLE_LENGTH sizeof(turks_cgcg_cgls_enable) / (3 * sizeof(u32))
 
 // These are the sequences for turks_mgcg_shls
-static const u32 turks_mgcg_default[] =
-{
+static const u32 turks_mgcg_default[] = {
 	0x0000802c, 0xc0000000, 0xffffffff,
 	0x00005448, 0x00000100, 0xffffffff,
 	0x000055e4, 0x00600100, 0xffffffff,
@@ -935,8 +919,7 @@ static const u32 turks_mgcg_default[] =
 };
 #define TURKS_MGCG_DEFAULT_LENGTH sizeof(turks_mgcg_default) / (3 * sizeof(u32))
 
-static const u32 turks_mgcg_disable[] =
-{
+static const u32 turks_mgcg_disable[] = {
 	0x0000802c, 0xc0000000, 0xffffffff,
 	0x000008f8, 0x00000000, 0xffffffff,
 	0x000008fc, 0xffffffff, 0xffffffff,
@@ -950,8 +933,7 @@ static const u32 turks_mgcg_disable[] =
 };
 #define TURKS_MGCG_DISABLE_LENGTH sizeof(turks_mgcg_disable) / (3 * sizeof(u32))
 
-static const u32 turks_mgcg_enable[] =
-{
+static const u32 turks_mgcg_enable[] = {
 	0x0000802c, 0xc0000000, 0xffffffff,
 	0x000008f8, 0x00000000, 0xffffffff,
 	0x000008fc, 0x00000000, 0xffffffff,
@@ -972,8 +954,7 @@ static const u32 turks_mgcg_enable[] =
 
 
 //********* BARTS **************//
-static const u32 barts_sysls_default[] =
-{
+static const u32 barts_sysls_default[] = {
 	/* Register,   Value,     Mask bits */
 	0x000055e8, 0x00000000, 0xffffffff,
 	0x0000d0bc, 0x00000000, 0xffffffff,
@@ -993,8 +974,7 @@ static const u32 barts_sysls_default[] =
 };
 #define BARTS_SYSLS_DEFAULT_LENGTH sizeof(barts_sysls_default) / (3 * sizeof(u32))
 
-static const u32 barts_sysls_disable[] =
-{
+static const u32 barts_sysls_disable[] = {
 	0x000055e8, 0x00000000, 0xffffffff,
 	0x0000d0bc, 0x00000000, 0xffffffff,
 	0x000015c0, 0x00041401, 0xffffffff,
@@ -1013,8 +993,7 @@ static const u32 barts_sysls_disable[] =
 };
 #define BARTS_SYSLS_DISABLE_LENGTH sizeof(barts_sysls_disable) / (3 * sizeof(u32))
 
-static const u32 barts_sysls_enable[] =
-{
+static const u32 barts_sysls_enable[] = {
 	0x000055e8, 0x00000001, 0xffffffff,
 	0x0000d0bc, 0x00000100, 0xffffffff,
 	0x000015c0, 0x000c1401, 0xffffffff,
@@ -1034,8 +1013,7 @@ static const u32 barts_sysls_enable[] =
 #define BARTS_SYSLS_ENABLE_LENGTH sizeof(barts_sysls_enable) / (3 * sizeof(u32))
 
 //********* CAICOS **************//
-static const u32 caicos_sysls_default[] =
-{
+static const u32 caicos_sysls_default[] = {
 	0x000055e8, 0x00000000, 0xffffffff,
 	0x0000d0bc, 0x00000000, 0xffffffff,
 	0x000015c0, 0x000c1401, 0xffffffff,
@@ -1053,8 +1031,7 @@ static const u32 caicos_sysls_default[] =
 };
 #define CAICOS_SYSLS_DEFAULT_LENGTH sizeof(caicos_sysls_default) / (3 * sizeof(u32))
 
-static const u32 caicos_sysls_disable[] =
-{
+static const u32 caicos_sysls_disable[] = {
 	0x000055e8, 0x00000000, 0xffffffff,
 	0x0000d0bc, 0x00000000, 0xffffffff,
 	0x000015c0, 0x00041401, 0xffffffff,
@@ -1072,8 +1049,7 @@ static const u32 caicos_sysls_disable[] =
 };
 #define CAICOS_SYSLS_DISABLE_LENGTH sizeof(caicos_sysls_disable) / (3 * sizeof(u32))
 
-static const u32 caicos_sysls_enable[] =
-{
+static const u32 caicos_sysls_enable[] = {
 	0x000055e8, 0x00000001, 0xffffffff,
 	0x0000d0bc, 0x00000100, 0xffffffff,
 	0x000015c0, 0x000c1401, 0xffffffff,
@@ -1092,8 +1068,7 @@ static const u32 caicos_sysls_enable[] =
 #define CAICOS_SYSLS_ENABLE_LENGTH sizeof(caicos_sysls_enable) / (3 * sizeof(u32))
 
 //********* TURKS **************//
-static const u32 turks_sysls_default[] =
-{
+static const u32 turks_sysls_default[] = {
 	0x000055e8, 0x00000000, 0xffffffff,
 	0x0000d0bc, 0x00000000, 0xffffffff,
 	0x000015c0, 0x000c1401, 0xffffffff,
@@ -1112,8 +1087,7 @@ static const u32 turks_sysls_default[] =
 };
 #define TURKS_SYSLS_DEFAULT_LENGTH sizeof(turks_sysls_default) / (3 * sizeof(u32))
 
-static const u32 turks_sysls_disable[] =
-{
+static const u32 turks_sysls_disable[] = {
 	0x000055e8, 0x00000000, 0xffffffff,
 	0x0000d0bc, 0x00000000, 0xffffffff,
 	0x000015c0, 0x00041401, 0xffffffff,
@@ -1132,8 +1106,7 @@ static const u32 turks_sysls_disable[] =
 };
 #define TURKS_SYSLS_DISABLE_LENGTH sizeof(turks_sysls_disable) / (3 * sizeof(u32))
 
-static const u32 turks_sysls_enable[] =
-{
+static const u32 turks_sysls_enable[] = {
 	0x000055e8, 0x00000001, 0xffffffff,
 	0x0000d0bc, 0x00000100, 0xffffffff,
 	0x000015c0, 0x000c1401, 0xffffffff,
@@ -1154,8 +1127,7 @@ static const u32 turks_sysls_enable[] =
 
 #endif
 
-u32 btc_valid_sclk[40] =
-{
+u32 btc_valid_sclk[40] = {
 	5000,   10000,  15000,  20000,  25000,  30000,  35000,  40000,  45000,  50000,
 	55000,  60000,  65000,  70000,  75000,  80000,  85000,  90000,  95000,  100000,
 	105000, 110000, 11500,  120000, 125000, 130000, 135000, 140000, 145000, 150000,
@@ -1194,7 +1166,7 @@ void btc_apply_voltage_dependency_rules(struct radeon_clock_voltage_dependency_t
 	if ((table == NULL) || (table->count == 0))
 		return;
 
-	for (i= 0; i < table->count; i++) {
+	for (i = 0; i < table->count; i++) {
 		if (clock <= table->entries[i].clk) {
 			if (*voltage < table->entries[i].v)
 				*voltage = (u16)((table->entries[i].v < max_voltage) ?
@@ -1441,7 +1413,7 @@ void btc_program_mgcg_hw_sequence(struct radeon_device *rdev,
 	u32 i, length = count * 3;
 	u32 tmp;
 
-	for (i = 0; i < length; i+=3) {
+	for (i = 0; i < length; i += 3) {
 		tmp = RREG32(sequence[i]);
 		tmp &= ~sequence[i+2];
 		tmp |= sequence[i+1] & sequence[i+2];
@@ -2003,7 +1975,7 @@ static int btc_copy_vbios_mc_reg_table(struct atom_mc_reg_table *table,
 	for (i = 0; i < table->num_entries; i++) {
 		eg_table->mc_reg_table_entry[i].mclk_max =
 			table->mc_reg_table_entry[i].mclk_max;
-		for(j = 0; j < table->last; j++)
+		for (j = 0; j < table->last; j++)
 			eg_table->mc_reg_table_entry[i].mc_data[j] =
 				table->mc_reg_table_entry[i].mc_data[j];
 	}
-- 
2.17.1

