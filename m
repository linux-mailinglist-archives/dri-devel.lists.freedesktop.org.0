Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8045B80DE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 07:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D31C10E86C;
	Wed, 14 Sep 2022 05:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C852F10E86A;
 Wed, 14 Sep 2022 05:28:08 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VPlk9J-_1663133283; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VPlk9J-_1663133283) by smtp.aliyun-inc.com;
 Wed, 14 Sep 2022 13:28:05 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 4/8] drm/amd/display: make some functions static
Date: Wed, 14 Sep 2022 13:27:38 +0800
Message-Id: <20220914052742.116297-4-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220914052742.116297-1-jiapeng.chong@linux.alibaba.com>
References: <20220914052742.116297-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

These functions are not used outside the file dcn32_hubbub.c, so the
modification is defined as static.

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dccg.c:223:6: warning: no previous prototype for ‘dccg314_set_valid_pixel_rate’.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dccg.c:184:6: warning: no previous prototype for ‘dccg314_set_dpstreamclk’.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dccg.c:140:6: warning: no previous prototype for ‘dccg314_set_dtbclk_dto’.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2144
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
index 232cc15979dd..36630d532c18 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
@@ -137,7 +137,7 @@ static void dccg314_set_dtbclk_p_src(
 }
 
 /* Controls the generation of pixel valid for OTG in (OTG -> HPO case) */
-void dccg314_set_dtbclk_dto(
+static void dccg314_set_dtbclk_dto(
 		struct dccg *dccg,
 		const struct dtbclk_dto_params *params)
 {
@@ -181,7 +181,7 @@ void dccg314_set_dtbclk_dto(
 	}
 }
 
-void dccg314_set_dpstreamclk(
+static void dccg314_set_dpstreamclk(
 		struct dccg *dccg,
 		enum streamclk_source src,
 		int otg_inst,
@@ -220,7 +220,7 @@ void dccg314_set_dpstreamclk(
 	}
 }
 
-void dccg314_set_valid_pixel_rate(
+static void dccg314_set_valid_pixel_rate(
 		struct dccg *dccg,
 		int ref_dtbclk_khz,
 		int otg_inst,
-- 
2.20.1.7.g153144c

