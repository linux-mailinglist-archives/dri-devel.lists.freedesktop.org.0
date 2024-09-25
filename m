Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C95985A81
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7905010E9E9;
	Wed, 25 Sep 2024 12:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dnlmuNmm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFB310E9E9;
 Wed, 25 Sep 2024 12:08:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7D2B1A440FD;
 Wed, 25 Sep 2024 12:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77ED2C4CECD;
 Wed, 25 Sep 2024 12:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727266112;
 bh=B5QuL0qqSIR5MOesCll76x9q2bnI8oUj3OEh00t2cqU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dnlmuNmm6UjJjf5wihXRTT1XVjwmWEgqBJgiINoG1MisfoxJJjdxsDEpuYyla7BKW
 JLdZbfAeA+5jE5pU7Rhz8OAfKIAqkIJOfk74YhaoPt/QOi+8BJFQt4wUClKKxWLdH0
 4sYDXBha+eNQr2GEwbQjomdmdomZ0+LaZb6C98nSoAzJ3DnzSVM7N7IRblU9EaZ4VZ
 lFHN9bKjiB8Zgw0jZhBUkmE4lR4tzk5X6sSCGUUidiJj4OStGnsBYTNfQ35gEudoME
 8Bn2E5vecHCtDhK7LlvKSto86W8VPDP4SIXtJyumjWHRDLQJIJeTToK5ucC2BBrJSf
 mNiLcgeT1Cfrg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 Sasha Levin <sashal@kernel.org>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 176/197] drm/xe: Drop warn on
 xe_guc_pc_gucrc_disable in guc pc fini
Date: Wed, 25 Sep 2024 07:53:15 -0400
Message-ID: <20240925115823.1303019-176-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

[ Upstream commit a323782567812ee925e9b7926445532c7afe331b ]

Not a big deal if CT is down as driver is unloading, no need to warn.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240820172958.1095143-4-matthew.brost@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 23382ced4ea74..69f8b6fdaeaea 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -897,7 +897,7 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 	struct xe_guc_pc *pc = arg;
 
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
-	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
+	xe_guc_pc_gucrc_disable(pc);
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
 }
-- 
2.43.0

