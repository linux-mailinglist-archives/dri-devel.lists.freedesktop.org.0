Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA415DE64
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788FE6FA3F;
	Fri, 14 Feb 2020 16:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E17A6FA2F;
 Fri, 14 Feb 2020 16:04:35 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6483124676;
 Fri, 14 Feb 2020 16:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696275;
 bh=HpiIeod6sqqqok91ZLMDjz0W7nDlJkN/pEmAn0kleNs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i+EsdO0h04L06q93O9MxpBLqmhNXvv7Ivw1FEk35MO6ZAenriQtqnZRezYryQJr/g
 OLSb1NLRjdZ3VANjpURbfrH8o2ewAC4ptY0DvhaAVObVzqK5PYOW+kEEHRWTWnNUgM
 YAv3ghhxJ7jkZ8RSa5XQ36sYgCZkqRrufNerCtjc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 125/459] drm/amd/powerplay: remove set but not
 used variable 'data'
Date: Fri, 14 Feb 2020 10:56:15 -0500
Message-Id: <20200214160149.11681-125-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 zhengbin <zhengbin13@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

[ Upstream commit 4bf321c177c74f7d834956387cd74805c3098322 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c: In function vega10_get_performance_level:
drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c:5217:23: warning: variable data set but not used [-Wunused-but-set-variable]

'data' is introduced by commit f688b614b643 ("drm/amd/pp:
Implement get_performance_level for legacy dgpu"), but never used,
so remove it.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
index beacfffbdc3eb..a3d9d612af1be 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
@@ -5247,13 +5247,11 @@ static int vega10_get_performance_level(struct pp_hwmgr *hwmgr, const struct pp_
 				PHM_PerformanceLevel *level)
 {
 	const struct vega10_power_state *ps;
-	struct vega10_hwmgr *data;
 	uint32_t i;
 
 	if (level == NULL || hwmgr == NULL || state == NULL)
 		return -EINVAL;
 
-	data = hwmgr->backend;
 	ps = cast_const_phw_vega10_power_state(state);
 
 	i = index > ps->performance_level_count - 1 ?
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
