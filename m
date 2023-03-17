Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6EE6BE32F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414F910EE7A;
	Fri, 17 Mar 2023 08:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A50D10EE74;
 Fri, 17 Mar 2023 08:23:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A606DB824F5;
 Fri, 17 Mar 2023 08:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C23C433EF;
 Fri, 17 Mar 2023 08:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041385;
 bh=Yy6qQhiWlQeyRXwDMARwFhqS8zBGMG54yD+MPv2mfpM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EjxtDlZyH9IgO2RrdO8cPGAXjcXr/cr9/taRKEB359jIZzlOSKIZiOLhafVN05amT
 B43Yyacb9tFrPYub1uHBTYJAY3rkO+IzwpY24lal5neRg0gKHn2z5vObTkojNxtM8h
 uKunhQxvc0pA7cbj7Mn4cHz4hzwAwU35bRyIH2M7cIHpRv00Y0ETIyM/yR4Zol3Xbv
 GBFLDU9/kq2WJk8pk4GnWH9NLe9t9+TemPeL2wDSf7QntdpobBn9UKMYmR6MTHNHeQ
 E0YhjH8jnhnS7Tsk+urMBX83n2gnnvEqC89mFyWbo9i7AYhqWwE0FmllDpthylwM7p
 IdiNp5YFmkYNw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 19/37] drm/amd/pm/swsmu/smu11/vangogh_ppt: Provide a couple of
 missing parameter descriptions
Date: Fri, 17 Mar 2023 08:17:00 +0000
Message-Id: <20230317081718.2650744-20-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Li Ma <li.ma@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:2381: warning: Function parameter or member 'residency' not described in 'vangogh_get_gfxoff_residency'
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:2399: warning: Function parameter or member 'entrycount' not described in 'vangogh_get_gfxoff_entrycount'

Cc: Evan Quan <evan.quan@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Li Ma <li.ma@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 4590374251f3b..7433dcaa16e04 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -2389,6 +2389,7 @@ static u32 vangogh_set_gfxoff_residency(struct smu_context *smu, bool start)
  * vangogh_get_gfxoff_residency
  *
  * @smu: amdgpu_device pointer
+ * @residency: placeholder for return value
  *
  * This function will be used to get gfxoff residency.
  *
@@ -2407,6 +2408,7 @@ static u32 vangogh_get_gfxoff_residency(struct smu_context *smu, uint32_t *resid
  * vangogh_get_gfxoff_entrycount - get gfxoff entry count
  *
  * @smu: amdgpu_device pointer
+ * @entrycount: placeholder for return value
  *
  * This function will be used to get gfxoff entry count
  *
-- 
2.40.0.rc1.284.g88254d51c5-goog

