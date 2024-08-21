Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278DC9594B5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 08:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9240E10E891;
	Wed, 21 Aug 2024 06:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098D610E889
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 06:33:31 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wpc1C56JXzhY0P;
 Wed, 21 Aug 2024 14:31:27 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 2E4961401F2;
 Wed, 21 Aug 2024 14:33:28 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 21 Aug
 2024 14:33:27 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <chaitanya.dhere@amd.com>, <jun.lei@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <alex.hung@amd.com>, <aurabindo.pillai@amd.com>, <colin.i.king@gmail.com>,
 <dillon.varone@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 5/5] drm/amd/display: Make dcn35_fpga_funcs static
Date: Wed, 21 Aug 2024 14:40:40 +0800
Message-ID: <20240821064040.2292969-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821064040.2292969-1-ruanjinjie@huawei.com>
References: <20240821064040.2292969-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sparse tool complains as follows:

drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:1071:22: warning:
	symbol 'dcn35_fpga_funcs' was not declared. Should it be static?

This symbol is not used outside of dcn35_clk_mgr.c, so marks it static.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
index e2d906327e2e..818a9b0933a5 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
@@ -1068,7 +1068,7 @@ static struct clk_mgr_funcs dcn35_funcs = {
 	.is_ips_supported = dcn35_is_ips_supported,
 };
 
-struct clk_mgr_funcs dcn35_fpga_funcs = {
+static struct clk_mgr_funcs dcn35_fpga_funcs = {
 	.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
 	.update_clocks = dcn35_update_clocks_fpga,
 	.init_clocks = dcn35_init_clocks_fpga,
-- 
2.34.1

