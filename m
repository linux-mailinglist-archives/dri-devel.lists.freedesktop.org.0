Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BAB82A9E3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141DB10E7F2;
	Thu, 11 Jan 2024 08:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7D1FE10E7F2;
 Thu, 11 Jan 2024 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=7+1szThLteqfC/lt5B
 oVJhS7U50tea7PBC7kTNKgkkY=; b=WA4/Eevdxo17AS22rOXQOGmtFPpxoOXXNn
 v5Y3oVLLUtnOwuWbrcj79g41DfaGYhfcW1AM4hXXg8elOFbB3l29XdTR/0V3e/gY
 nB6QD2+yeFsdj6UDiYY4suH10llrY3i8s6iA2nDD+FWT30/kQ401MduK1p51LLjJ
 wk7fbBV6w=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wD3_9OhrZ9lygaWAA--.47187S2;
 Thu, 11 Jan 2024 16:58:09 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in radeon_mode.h
Date: Thu, 11 Jan 2024 08:58:07 +0000
Message-Id: <20240111085807.13063-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3_9OhrZ9lygaWAA--.47187S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1kXF13tr13Wr4rAFWfGrg_yoWDtFg_CF
 y0qa4DWF909FnYqa1fuFnxZFW2vw4Ykr4rur1xtFyFyr9rXr48Za9xCa47X3yxWFZ7XFs8
 Jw4vgr1fArs7AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUuT5JUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqBli1mVOBlFPiQACs9
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

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/radeon_mode.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 59c4db13d90a..546381a5c918 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -603,8 +603,7 @@ struct atom_memory_info {
 
 #define MAX_AC_TIMING_ENTRIES 16
 
-struct atom_memory_clock_range_table
-{
+struct atom_memory_clock_range_table {
 	u8 num_entries;
 	u8 rsv[3];
 	u32 mclk[MAX_AC_TIMING_ENTRIES];
@@ -632,14 +631,12 @@ struct atom_mc_reg_table {
 
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

