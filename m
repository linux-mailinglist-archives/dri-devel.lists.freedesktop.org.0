Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A3B6BE321
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F15110EE78;
	Fri, 17 Mar 2023 08:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57BF10EE66;
 Fri, 17 Mar 2023 08:22:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87368B824FB;
 Fri, 17 Mar 2023 08:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04883C433EF;
 Fri, 17 Mar 2023 08:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041372;
 bh=2fN05X8Hk+oG8PadKtWMVED3+Ll+rVeU4UKuOLTmoos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aH9baG6QVrmLtZIdI8tXrP/9/h9JdO4iRzL9ptVItpVzfubVeDhu64SQG34nnfShh
 IW3/aqBd7XXQlSDX+Z+ElfX4mUconWVPK14ovcqHvE16r92hReuGKMYXkEPtTv1Ozy
 T6kCDLNPrKDEg9NnUdHxVm1AW6wGDSuo+DbnTDWHzEXIGhbBo7TJ5uciA/tCxKpkYd
 8yXwFCJOMUrGt4mWlNxwiwYMTsNeHOVIchI8L9G6ARzcPcLbnWttjGbbn9k22GkLTm
 +J6qwBY4Ydw15V3Po/I75RCWYk9/4ZrCFfwP+6F6lVW1OqtEH9dol2w58CAH2hwjuQ
 4DFphXR+tsYCA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 14/37] drm/amd/amdgpu/amdgpu_vm_pt: Supply description for
 amdgpu_vm_pt_free_dfs()'s unlocked param
Date: Fri, 17 Mar 2023 08:16:55 +0000
Message-Id: <20230317081718.2650744-15-lee@kernel.org>
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
 amd-gfx@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c:683: warning: Function parameter or member 'unlocked' not described in 'amdgpu_vm_pt_free_dfs'

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
index 01e42bdd8e4e8..df63dc3bca18c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -673,6 +673,7 @@ void amdgpu_vm_pt_free_work(struct work_struct *work)
  * @adev: amdgpu device structure
  * @vm: amdgpu vm structure
  * @start: optional cursor where to start freeing PDs/PTs
+ * @unlocked: vm resv unlock status
  *
  * Free the page directory or page table level and all sub levels.
  */
-- 
2.40.0.rc1.284.g88254d51c5-goog

