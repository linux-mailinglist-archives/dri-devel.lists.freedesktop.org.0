Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54467568026
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 09:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68423112388;
	Wed,  6 Jul 2022 07:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 917 seconds by postgrey-1.36 at gabe;
 Wed, 06 Jul 2022 05:13:42 UTC
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by gabe.freedesktop.org (Postfix) with ESMTP id C955C10F64F;
 Wed,  6 Jul 2022 05:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=HkwIy
 c9p7ULhqlETt5oNPcBKwEPx0xfgOW9txY0JjbE=; b=jjUGPU2ocezyxvss5D704
 F8J0R51wUnbBS5qHEcnQkZu/RhK2jCO+PILLOt80hpSZ5f6t+arWrnu3kBT5iQCP
 WSXm2KZ7ym8bsgHbddJmY0Z5G7BNY6510EotMhLFt6MPa3tt4UgpuxWmfRXMGJi4
 1TPBzM7WK0rzmB7if69HbY=
Received: from bf-rmsz-11.ccdomain.com (unknown [218.17.89.92])
 by smtp8 (Coremail) with SMTP id DMCowACHraswFsViC24FLw--.4616S2;
 Wed, 06 Jul 2022 12:57:21 +0800 (CST)
From: Zhongjun Tan <hbut_tan@163.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, chandan.vurdigerenataraj@amd.com,
 aurabindo.pillai@amd.com
Subject: [PATCH] drm/amdgpu/display: Remove duplicated argument to ||
Date: Wed,  6 Jul 2022 12:57:12 +0800
Message-Id: <20220706045712.19930-1-hbut_tan@163.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowACHraswFsViC24FLw--.4616S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw4kJrWDuFyxZFykJryUGFg_yoWDAFb_KF
 10vr9aq3WfZ3WqqrWxZr4ruw1Fqa15GFs7Jry2g34Iyw17Wr4jgF93GrnaqF1jyFs7AFZI
 y3WvkF1kXa97GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnqjg3UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: xkex3sxwdqqiywtou0bp/1tbiSBE2xl+Fe1c9EwAAsx
X-Mailman-Approved-At: Wed, 06 Jul 2022 07:41:40 +0000
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
Cc: Zhongjun Tan <tanzhongjun@coolpad.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhongjun Tan <tanzhongjun@coolpad.com>

Remove duplicated argument to ||

Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index 07f3a85f8edf..5a701d9df0f7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -275,7 +275,7 @@ void dml32_CalculateBytePerPixelAndBlockSizes(
 		*BytePerPixelDETC = 0;
 		*BytePerPixelY = 4;
 		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
+	} else if (SourcePixelFormat == dm_444_16) {
 		*BytePerPixelDETY = 2;
 		*BytePerPixelDETC = 0;
 		*BytePerPixelY = 2;
-- 
2.29.0

