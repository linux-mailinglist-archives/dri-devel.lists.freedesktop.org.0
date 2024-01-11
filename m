Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D791C82A9A3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA64F10E80E;
	Thu, 11 Jan 2024 08:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id E706710E7F6;
 Thu, 11 Jan 2024 07:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=2szJIaDBzj+c7ED6cS
 ViTt18x//6EWpMlrvnMlbLknk=; b=UrJ+sutQXH2F+w0Wfl3xioDMGDFGNJKX3Z
 m3uqo4FJkNIhuRvYwJWM91miKljoTa86vO3cI+I5ZLdRWtvS+xsOkeuATDxvB1l8
 sP5/ecLo9FtfM9bxeoT/WEXPXi7Wxyr4zxPYRW/NTEvSXxuQU0lxxAxyi2yNjvn2
 smjfkwELA=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wD3P7EXmp9lTOIOAA--.3548S2; 
 Thu, 11 Jan 2024 15:34:47 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, airlied@gmail.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in trinity_dpm.c
Date: Thu, 11 Jan 2024 07:34:45 +0000
Message-Id: <20240111073445.10405-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3P7EXmp9lTOIOAA--.3548S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFWxtr18JF4UurWkCF1UAwb_yoW8tF43pw
 48WFyYyrZ5Jrs0gayktr9rArna9w1rZ3W8uFWIk343Zw4UCayUZFnYgrWrWry3AFZ7XF1j
 y3WkKrW5ur48t3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UwFxUUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEBpi1mVOBk6DggAAsc
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
ERROR: space prohibited before that ',' (ctx:WxW)
ERROR: need consistent spacing around '-' (ctx:WxV)

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/kv_dpm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/kv_dpm.c b/drivers/gpu/drm/radeon/kv_dpm.c
index f7735da07feb..55dbf450bd9c 100644
--- a/drivers/gpu/drm/radeon/kv_dpm.c
+++ b/drivers/gpu/drm/radeon/kv_dpm.c
@@ -64,8 +64,7 @@ extern void cik_exit_rlc_safe_mode(struct radeon_device *rdev);
 extern void cik_update_cg(struct radeon_device *rdev,
 			  u32 block, bool enable);
 
-static const struct kv_pt_config_reg didt_config_kv[] =
-{
+static const struct kv_pt_config_reg didt_config_kv[] = {
 	{ 0x10, 0x000000ff, 0, 0x0, KV_CONFIGREG_DIDT_IND },
 	{ 0x10, 0x0000ff00, 8, 0x0, KV_CONFIGREG_DIDT_IND },
 	{ 0x10, 0x00ff0000, 16, 0x0, KV_CONFIGREG_DIDT_IND },
@@ -931,9 +930,9 @@ static void kv_calculate_dfs_bypass_settings(struct radeon_device *rdev)
 					pi->graphics_level[i].ClkBypassCntl = 2;
 				else if (kv_get_clock_difference(table->entries[i].clk, 26600) < 200)
 					pi->graphics_level[i].ClkBypassCntl = 7;
-				else if (kv_get_clock_difference(table->entries[i].clk , 20000) < 200)
+				else if (kv_get_clock_difference(table->entries[i].clk, 20000) < 200)
 					pi->graphics_level[i].ClkBypassCntl = 6;
-				else if (kv_get_clock_difference(table->entries[i].clk , 10000) < 200)
+				else if (kv_get_clock_difference(table->entries[i].clk, 10000) < 200)
 					pi->graphics_level[i].ClkBypassCntl = 8;
 				else
 					pi->graphics_level[i].ClkBypassCntl = 0;
@@ -1577,7 +1576,7 @@ static void kv_set_valid_clock_range(struct radeon_device *rdev,
 			if ((new_ps->levels[0].sclk -
 			     table->entries[pi->highest_valid].sclk_frequency) >
 			    (table->entries[pi->lowest_valid].sclk_frequency -
-			     new_ps->levels[new_ps->num_levels -1].sclk))
+			     new_ps->levels[new_ps->num_levels - 1].sclk))
 				pi->highest_valid = pi->lowest_valid;
 			else
 				pi->lowest_valid =  pi->highest_valid;
-- 
2.17.1

