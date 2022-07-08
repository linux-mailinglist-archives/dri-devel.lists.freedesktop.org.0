Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFE256B3BB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 09:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D175D10F69E;
	Fri,  8 Jul 2022 07:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTP id 94F5414A1CB;
 Fri,  8 Jul 2022 03:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=r2cOE
 uXAAAXANaMg92EJ+3l5uhuP8HS5zodz6szymtE=; b=i+kRGJxaXdIw8n7aqMDzz
 q9fxpRfqZIYhU2xDope3LqxrkoA28HKBkTH3yxfAa5ZyIiJ5BE0r5i+QsqsQaZ3b
 V0rhHi4/gakJsjpCyu5NNCgyvGdk0jw30unpsOpclpYhuabA5NxdmSmixEovfPUK
 ghEnHdh8DSNPXrC8dgRpU8=
Received: from bf-rmsz-11.ccdomain.com (unknown [218.17.89.92])
 by smtp13 (Coremail) with SMTP id EcCowACHj2E_oMdi_5ZWMQ--.36352S2;
 Fri, 08 Jul 2022 11:10:57 +0800 (CST)
From: Zhongjun Tan <hbut_tan@163.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, chandan.vurdigerenataraj@amd.com,
 tanzhongjun@coolpad.com, aurabindo.pillai@amd.com
Subject: [PATCH] drm/amd/display: Remove condition with no effect
Date: Fri,  8 Jul 2022 11:10:48 +0800
Message-Id: <20220708031048.43472-1-hbut_tan@163.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowACHj2E_oMdi_5ZWMQ--.36352S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1DAF45trWUArWUXr4xZwb_yoWkWFbEgF
 4vqFn5Kr15Ar4qgr47Zr1F9ryvvan8KF4DXrWIq3s0ywnIga47GFZ7GwnrWr1jvFsrXFZI
 ya10kF48Can7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnDKsUUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: xkex3sxwdqqiywtou0bp/1tbiSAE4xl+Fe25bJwAAsE
X-Mailman-Approved-At: Fri, 08 Jul 2022 07:43:02 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhongjun Tan <tanzhongjun@coolpad.com>

Remove condition with no effect

Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
---
 .../drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c   | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index 07f3a85f8edf..ec3ea94d3802 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -4670,10 +4670,6 @@ void dml32_CalculateMinAndMaxPrefetchMode(
 	} else if (AllowForPStateChangeOrStutterInVBlankFinal == dm_prefetch_support_uclk_fclk_and_stutter) {
 		*MinPrefetchMode = 0;
 		*MaxPrefetchMode = 0;
-	} else if (AllowForPStateChangeOrStutterInVBlankFinal ==
-			dm_prefetch_support_uclk_fclk_and_stutter_if_possible) {
-		*MinPrefetchMode = 0;
-		*MaxPrefetchMode = 3;
 	} else {
 		*MinPrefetchMode = 0;
 		*MaxPrefetchMode = 3;
-- 
2.29.0

