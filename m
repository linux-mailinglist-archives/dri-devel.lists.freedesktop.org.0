Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0584349151C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 03:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE621128D0;
	Tue, 18 Jan 2022 02:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBE91128CF;
 Tue, 18 Jan 2022 02:26:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5150961163;
 Tue, 18 Jan 2022 02:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CABC36AE3;
 Tue, 18 Jan 2022 02:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472768;
 bh=yqSwJVXMzPmSYPIZURiBbJ026IA9VE5I3L1uFRkpvjU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lDBz/6MvTvAoJF2vOspQ0CZY325ZVQaeEpqUewId82kG27GRrpcq7l2O0qPH93t/k
 SWvHLvKABmDNNI391ghVeCuD3PnLCKU0sT2sEMNBq7/neSgynYbFybxINlswu8VYmG
 YhBlbXn//cPNE+CNxXDVKLpFYNsQlAi2JFcbXkkBrHhklnv48MXgbenhfglCukELmQ
 JXcCNGBN08AbqrDrCTAsY5HNxbZdHsqbJ1mnb9CC7JbM9aamX+bsHRmWdM5GznSJSB
 ZYIdFvP3h7lh6pUbVjqiFZNG7ZvUBo1hrpLPbttxc754X5sfKrQCDcT/Qre6YZi2At
 DCfKs+s6fN6xA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 131/217] drm/amdgpu: fix
 amdgpu_ras_mca_query_error_status scope
Date: Mon, 17 Jan 2022 21:18:14 -0500
Message-Id: <20220118021940.1942199-131-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, mukul.joshi@amd.com, airlied@linux.ie,
 Xinhui.Pan@amd.com, nirmoy.das@amd.com, amd-gfx@lists.freedesktop.org,
 luben.tuikov@amd.com, Stanley.Yang@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Isabella Basso <isabbasso@riseup.net>, john.clements@amd.com,
 christian.koenig@amd.com, Dennis.Li@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Isabella Basso <isabbasso@riseup.net>

[ Upstream commit 929bb8e200412da36aca4b61209ec26283f9c184 ]

This commit fixes the compile-time warning below:

 warning: no previous prototype for ‘amdgpu_ras_mca_query_error_status’
 [-Wmissing-prototypes]

Changes since v1:
- As suggested by Alexander Deucher:
  1. Make function static instead of adding prototype.

Signed-off-by: Isabella Basso <isabbasso@riseup.net>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 08133de21fdd6..26b7a4a0b44b7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -867,9 +867,9 @@ static int amdgpu_ras_enable_all_features(struct amdgpu_device *adev,
 /* feature ctl end */
 
 
-void amdgpu_ras_mca_query_error_status(struct amdgpu_device *adev,
-				       struct ras_common_if *ras_block,
-				       struct ras_err_data  *err_data)
+static void amdgpu_ras_mca_query_error_status(struct amdgpu_device *adev,
+					      struct ras_common_if *ras_block,
+					      struct ras_err_data  *err_data)
 {
 	switch (ras_block->sub_block_index) {
 	case AMDGPU_RAS_MCA_BLOCK__MP0:
-- 
2.34.1

