Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFC65B80E8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 07:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED6510E86F;
	Wed, 14 Sep 2022 05:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B916E10E869;
 Wed, 14 Sep 2022 05:28:23 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VPlj1Sf_1663133297; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VPlj1Sf_1663133297) by smtp.aliyun-inc.com;
 Wed, 14 Sep 2022 13:28:19 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 7/8] drm/amd/display: make some functions static
Date: Wed, 14 Sep 2022 13:27:41 +0800
Message-Id: <20220914052742.116297-7-jiapeng.chong@linux.alibaba.com>
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

These functions are not used outside the file dcn32_dccg.c, so the
modification is defined as static.

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_dccg.c:257:6: warning: no previous prototype for ‘dccg32_otg_drop_pixel’.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_dccg.c:248:6: warning: no previous prototype for ‘dccg32_otg_add_pixel’.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_dccg.c:211:6: warning: no previous prototype for ‘dccg32_set_dpstreamclk’.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_dccg.c:136:6: warning: no previous prototype for ‘dccg32_set_dtbclk_dto’.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2142
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
index 0d5e8a441512..26eb04ea472c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
@@ -133,7 +133,7 @@ static void dccg32_set_dtbclk_p_src(
 }
 
 /* Controls the generation of pixel valid for OTG in (OTG -> HPO case) */
-void dccg32_set_dtbclk_dto(
+static void dccg32_set_dtbclk_dto(
 		struct dccg *dccg,
 		const struct dtbclk_dto_params *params)
 {
@@ -208,7 +208,7 @@ static void dccg32_get_dccg_ref_freq(struct dccg *dccg,
 	return;
 }
 
-void dccg32_set_dpstreamclk(
+static void dccg32_set_dpstreamclk(
 		struct dccg *dccg,
 		enum streamclk_source src,
 		int otg_inst,
@@ -245,7 +245,7 @@ void dccg32_set_dpstreamclk(
 	}
 }
 
-void dccg32_otg_add_pixel(struct dccg *dccg,
+static void dccg32_otg_add_pixel(struct dccg *dccg,
 		uint32_t otg_inst)
 {
 	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
@@ -254,7 +254,7 @@ void dccg32_otg_add_pixel(struct dccg *dccg,
 			OTG_ADD_PIXEL[otg_inst], 1);
 }
 
-void dccg32_otg_drop_pixel(struct dccg *dccg,
+static void dccg32_otg_drop_pixel(struct dccg *dccg,
 		uint32_t otg_inst)
 {
 	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
-- 
2.20.1.7.g153144c

