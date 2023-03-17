Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B06CB6BE32E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B626410EE74;
	Fri, 17 Mar 2023 08:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF70310EE79;
 Fri, 17 Mar 2023 08:23:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5777762220;
 Fri, 17 Mar 2023 08:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72552C433D2;
 Fri, 17 Mar 2023 08:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041382;
 bh=eVjVeNRWTWrNvZ0ADJpOpPfGExYmn5HJ+ecNEWoPDEg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ulun32YaRazjRkzxIZjPbqKxF6ImcLWBmaPIvepaMqbz8of7ETiXZcWkPs6RE3JxL
 2M1h8mkmBcoPxQ3wJmDd3ceuDE2Zwt59R7NXQiUEs1SWKUQfoADEX68QjACH/nQf7n
 KsFILlJiZoHeCWYwoj/9YwQv2XozshXqfLSHMLNVpr9+mjKDSxUkgC6GR4EFLLay++
 sze/f/kNYnk6DAF3roBOckVZdzWQyQNZEdYtVSYsZIzOfxE+esmve0pKaeAJ6xLEzi
 zp8UluWatlfV2ZVCj8bn144UDVaep1UKS5v12Kf5UWqBKO/Q+IrwccbSgwhpbrYd4A
 xlC/nXQYYkTTA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 18/37] drm/amd/amdgpu/amdgpu_vce: Provide description for
 amdgpu_vce_validate_bo()'s 'p' param
Date: Fri, 17 Mar 2023 08:16:59 +0000
Message-Id: <20230317081718.2650744-19-lee@kernel.org>
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

 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:599: warning: Function parameter or member 'p' not described in 'amdgpu_vce_validate_bo'

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 2fb61410b1c02..c4d65ade5c00a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -585,6 +585,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
 /**
  * amdgpu_vce_validate_bo - make sure not to cross 4GB boundary
  *
+ * @p: parser context
  * @ib: indirect buffer to use
  * @lo: address of lower dword
  * @hi: address of higher dword
-- 
2.40.0.rc1.284.g88254d51c5-goog

