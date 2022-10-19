Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5B06039D1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 08:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CA810F159;
	Wed, 19 Oct 2022 06:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025F910F159;
 Wed, 19 Oct 2022 06:34:48 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Msgnk2xSQz1P79J;
 Wed, 19 Oct 2022 14:30:02 +0800 (CST)
Received: from huawei.com (10.67.175.83) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 14:34:45 +0800
From: ruanjinjie <ruanjinjie@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <jiapeng.chong@linux.alibaba.com>,
 <aurabindo.pillai@amd.com>, <isabbasso@riseup.net>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] drm/amd/display: make dcn32_mmhubbub_funcs static
Date: Wed, 19 Oct 2022 14:31:15 +0800
Message-ID: <20221019063115.3757510-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The symbol is not used outside of the file, so mark it static.

Fixes the following warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_mmhubbub.c:214:28:
warning: symbol 'dcn32_mmhubbub_funcs' was
not declared. Should it be static?

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
index 41b0baf8e183..c3b089ba511a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
@@ -211,7 +211,7 @@ static void mmhubbub32_config_mcif_arb(struct mcif_wb *mcif_wb,
 	REG_UPDATE(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_CLIENT_ARBITRATION_SLICE,  params->arbitration_slice);
 }
 
-const struct mcif_wb_funcs dcn32_mmhubbub_funcs = {
+static const struct mcif_wb_funcs dcn32_mmhubbub_funcs = {
 	.warmup_mcif		= mmhubbub32_warmup_mcif,
 	.enable_mcif		= mmhubbub2_enable_mcif,
 	.disable_mcif		= mmhubbub2_disable_mcif,
-- 
2.25.1

