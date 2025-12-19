Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D08CD0254
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 14:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8170810EFC8;
	Fri, 19 Dec 2025 13:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Y5ueGaRV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD3210EFC8;
 Fri, 19 Dec 2025 13:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wOkoS6nMvzL4WUDjqksIHJyfYCgeGCvcYwa5fihqj08=; b=Y5ueGaRVuhzqmfC8+N0urGlCMW
 pjZVeZNYr1Z+ov4SKwTqOoMMvfGe29VxlNqrL+PpVGaEu7ye0hw4shfWwuOMEWqiaJukGgS51g8Ry
 qmpiCT7E4i713ALYIMu7R5S6TShVIhvB17Dl8yCxLD55/DCGddogcbG3ZR3pH0x9YPJa0hih41UJf
 i5E/dppry3jI9OV8/CLt2FYALkEgvDuA4a9oCcQSL0VgahByOU8nGT5r8Ylp30uqDmzwUgd0A+eFo
 ATtryFgAa/qo3K1+YP25y7SJTgK2GJwCalgR9KeSYV+xj9v8jtck80GeJwbYUgVGmuYPzjuPr8diK
 cQ69m4eQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vWavx-00EeiT-2i; Fri, 19 Dec 2025 14:54:17 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 17/28] drm/amdgpu: Remove drm_sched_init_args->num_rqs usage
Date: Fri, 19 Dec 2025 13:53:39 +0000
Message-ID: <20251219135351.25880-18-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove member no longer used by the scheduler core.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 12201b8e99b3..72d1978a6e2a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3070,7 +3070,6 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 {
 	struct drm_sched_init_args args = {
 		.ops = &amdgpu_sched_ops,
-		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
 		.timeout_wq = adev->reset_domain->wq,
 		.dev = adev->dev,
 	};
-- 
2.51.1

