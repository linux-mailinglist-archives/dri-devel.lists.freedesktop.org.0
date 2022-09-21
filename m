Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D95C02AC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5767C10E9C0;
	Wed, 21 Sep 2022 15:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2246010E581;
 Wed, 21 Sep 2022 15:53:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A35A463165;
 Wed, 21 Sep 2022 15:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420B7C433D6;
 Wed, 21 Sep 2022 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663775635;
 bh=ON79Ezb0W4s0GNf/NoqKu+FimfoSIUQjcZclqHc3mXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kPeSYZyrxLRELOC/IWH30UIOFOnK0jtTWg6XLRsreStnucbI/p8u10xjLeO4XqG+5
 gsWG/WuOfScBZq6oRi4gA4ZysEvNeMKbefM4zHrUQECl7Qqg/7aZOJKxVgvyxYiyui
 AHA3Uml6E16i187tZNh1o2g/76+VQIfc97I7IWHxwrQrbDMhDPhzxUNUrReuRihKq3
 dPZ5q+D4CZjAit3ZvBBEUrW/ni8fweewGibD+/Sx0wwrQCI7q5Hx4OXmhQvqMUwqCj
 yVkCaks+qTXZQlLq4p645ZZkOaRgG4R0TvSuXAWJp9Rs740ESgUy9+FVk4TbFddZfY
 mH8tMmbJ23RMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 10/16] drm/amdgpu: Skip reset error status for
 psp v13_0_0
Date: Wed, 21 Sep 2022 11:53:26 -0400
Message-Id: <20220921155332.234913-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155332.234913-1-sashal@kernel.org>
References: <20220921155332.234913-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, mukul.joshi@amd.com, tao.zhou1@amd.com,
 airlied@linux.ie, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 YiPeng.Chai@amd.com, Stanley.Yang@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Candice Li <candice.li@amd.com>,
 john.clements@amd.com, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Candice Li <candice.li@amd.com>

[ Upstream commit 86875d558b91cb46f43be112799c06ecce60ec1e ]

No need to reset error status since only umc ras supported on psp v13_0_0.

Signed-off-by: Candice Li <candice.li@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index dac202ae864d..9193ca5d6fe7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1805,7 +1805,8 @@ static void amdgpu_ras_log_on_err_counter(struct amdgpu_device *adev)
 		amdgpu_ras_query_error_status(adev, &info);
 
 		if (adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 2) &&
-		    adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 4)) {
+		    adev->ip_versions[MP0_HWIP][0] != IP_VERSION(11, 0, 4) &&
+		    adev->ip_versions[MP0_HWIP][0] != IP_VERSION(13, 0, 0)) {
 			if (amdgpu_ras_reset_error_status(adev, info.head.block))
 				dev_warn(adev->dev, "Failed to reset error counter and error status");
 		}
-- 
2.35.1

