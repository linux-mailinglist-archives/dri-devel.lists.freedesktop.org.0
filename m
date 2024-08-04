Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BE9946F39
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 16:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DA610E09D;
	Sun,  4 Aug 2024 14:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="Lb3av0c5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp2.math.uni-bielefeld.de (smtp2.math.uni-bielefeld.de
 [129.70.45.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB0D10E0B0;
 Sun,  4 Aug 2024 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=math.uni-bielefeld.de; s=default; t=1722779966;
 bh=ricJaOpwguMV/eqHdvuZbbkftQ+RBPZjBXgBbOHVmzs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lb3av0c5WijER/d6En96BoOLhshFin23KIXWGzAwCHvixjwSWcAmrlnzvy/46h3sv
 h1qW19TaBFFZDzX8XC6r1OVoNcDGukllll3zN1BkV42kj8O9Na1+Px0eSZi+24yJye
 xmSI/lNMhb7yaV1MVgPkNtSi7x1Hxg/2aMuUGtGzUzQmTyRGS0jISJgxpXACwe7r3M
 P9NCUGPAS90qoflpw2xE/s+LTOJiJO3kHtl/LaW1YF3hI2mPuCkFmgdx7v++jHji9n
 kltq3tOP07v+L73KCqaTAszzwsRf48AgDRG/CHaYSpEc7kUnZzd089g2o/1TMlfX4p
 LCOwg+n6stXsw==
Received: from localhost (dslb-088-074-203-146.088.074.pools.vodafone-ip.de
 [88.74.203.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id E189E20F4B;
 Sun,  4 Aug 2024 15:59:25 +0200 (CEST)
From: tjakobi@math.uni-bielefeld.de
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/amd: Make amd_ip_funcs static for SDMA v5.2
Date: Sun,  4 Aug 2024 15:56:28 +0200
Message-ID: <76780ac4164e7e86f45d8673a7e91ad77e26b1c0.1722778722.git.tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <cover.1722778722.git.tjakobi@math.uni-bielefeld.de>
References: <cover.1722778722.git.tjakobi@math.uni-bielefeld.de>
MIME-Version: 1.0
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

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The struct can be static, as it is only used in this
translation unit.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index af1e90159ce3..3196663dd4f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1674,7 +1674,7 @@ static void sdma_v5_2_ring_end_use(struct amdgpu_ring *ring)
 	amdgpu_gfx_off_ctrl(adev, true);
 }
 
-const struct amd_ip_funcs sdma_v5_2_ip_funcs = {
+static const struct amd_ip_funcs sdma_v5_2_ip_funcs = {
 	.name = "sdma_v5_2",
 	.early_init = sdma_v5_2_early_init,
 	.late_init = NULL,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.h b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.h
index b70414fef2a1..863145b3a77e 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.h
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.h
@@ -24,7 +24,6 @@
 #ifndef __SDMA_V5_2_H__
 #define __SDMA_V5_2_H__
 
-extern const struct amd_ip_funcs sdma_v5_2_ip_funcs;
 extern const struct amdgpu_ip_block_version sdma_v5_2_ip_block;
 
 #endif /* __SDMA_V5_2_H__ */
-- 
2.44.2

