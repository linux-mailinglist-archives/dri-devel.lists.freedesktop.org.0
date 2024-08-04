Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2961946F3A
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 16:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB05810E0AC;
	Sun,  4 Aug 2024 14:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="G6Lhjg+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 434 seconds by postgrey-1.36 at gabe;
 Sun, 04 Aug 2024 14:07:28 UTC
Received: from smtp2.math.uni-bielefeld.de (smtp2.math.uni-bielefeld.de
 [129.70.45.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9CE10E09D;
 Sun,  4 Aug 2024 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=math.uni-bielefeld.de; s=default; t=1722779929;
 bh=at9u804XWKg105DvZq8kuM2cMuEa9Th7oiyNnGkRZhQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G6Lhjg+OV9MQqksP/lvS31W1wqwAVAyzH64mOHi8k1TYHnr7kr6A0Uf43ZBIpYWWH
 2F5ONhHMQcFoVbRkEvBpNRen/gCE1D3p1AR8gAQBNAPF8uw0GpWRNnz7iMJ4xKIzaD
 fzVYjxWOeJUavESsrK6FSmItq7+a45gkEccdMITzaoUkgliZVhD2vboP3px9JNwa7E
 BFJkLXyCBiLjavoI1dvdNhgUP8bnyGOuLUjDRI/0x/gjv4ERHiD2jrrZdcmafLqsLd
 NkX+j44rpLLEwSD/g3cRaEy9Q45dVlJPxb7rrCudDR2ueWs+48zLN2I+fLCWlknCte
 mQlcBNVsDLktw==
Received: from localhost (dslb-088-074-203-146.088.074.pools.vodafone-ip.de
 [88.74.203.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id 3A74C20C43;
 Sun,  4 Aug 2024 15:58:49 +0200 (CEST)
From: tjakobi@math.uni-bielefeld.de
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/amd: Make amd_ip_funcs static for SDMA v5.0
Date: Sun,  4 Aug 2024 15:56:27 +0200
Message-ID: <3b29b06f95f051d9b43796105a306a30a1c64347.1722778722.git.tjakobi@math.uni-bielefeld.de>
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
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index b7d33d78bce0..846c05332cd8 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -1718,7 +1718,7 @@ static void sdma_v5_0_get_clockgating_state(void *handle, u64 *flags)
 		*flags |= AMD_CG_SUPPORT_SDMA_LS;
 }
 
-const struct amd_ip_funcs sdma_v5_0_ip_funcs = {
+static const struct amd_ip_funcs sdma_v5_0_ip_funcs = {
 	.name = "sdma_v5_0",
 	.early_init = sdma_v5_0_early_init,
 	.late_init = NULL,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.h b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.h
index d4e3c2e696f6..2ab71f21755a 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.h
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.h
@@ -24,7 +24,6 @@
 #ifndef __SDMA_V5_0_H__
 #define __SDMA_V5_0_H__
 
-extern const struct amd_ip_funcs sdma_v5_0_ip_funcs;
 extern const struct amdgpu_ip_block_version sdma_v5_0_ip_block;
 
 #endif /* __SDMA_V5_0_H__ */
-- 
2.44.2

