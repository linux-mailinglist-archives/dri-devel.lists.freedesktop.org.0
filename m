Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E1590A8F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 05:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA3BA07FE;
	Fri, 12 Aug 2022 03:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F654A0819;
 Fri, 12 Aug 2022 03:19:30 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R821e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VM.yIy1_1660274353; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VM.yIy1_1660274353) by smtp.aliyun-inc.com;
 Fri, 12 Aug 2022 11:19:26 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/display: remove unreachable code
Date: Fri, 12 Aug 2022 11:19:11 +0800
Message-Id: <20220812031911.62729-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.c:1658 dml32_TruncToValidBPP() warn: ignoring unreachable code.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=1894
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c   | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index 05fc14a47fba..0758e1da55a9 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -1654,10 +1654,6 @@ double dml32_TruncToValidBPP(
 		else
 			return DesiredBPP;
 	}
-
-	*RequiredSlots = dml_ceil(DesiredBPP / MaxLinkBPP * 64, 1);
-
-	return BPP_INVALID;
 } // TruncToValidBPP
 
 double dml32_RequiredDTBCLK(
-- 
2.20.1.7.g153144c

