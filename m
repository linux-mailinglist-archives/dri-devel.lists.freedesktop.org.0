Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D445B786893
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 09:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BFC10E4A4;
	Thu, 24 Aug 2023 07:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C907010E4A3;
 Thu, 24 Aug 2023 07:38:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 33C3A65A43;
 Thu, 24 Aug 2023 07:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DC7C433CA;
 Thu, 24 Aug 2023 07:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692862680;
 bh=wEDqvEDOA3vxGIk6EexeUNwMrFtaZlnfxVGm/bMEvr4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fIKJHkj2WVKxeDY/g/PYgsJrPDBu4r0Q2mLQv1WsRpbImdKaDv6Sfi5UmzJHGHlZP
 /EzC9AQIvwtXl4YkhKBHfnpES4Kp8p0iTysNLX9AZzq9SmHEL4qzBlc/UUDiIZmAoO
 WjYmTlFojar9djx8fDMorymgkC55/WK22bS4j4KI6Q+CO7XDQuWtDYlT9f/Nr2wf96
 7Mr2FJAUzQfB3jXamFypkoSKtt0meqhPSRXnRXM4yp9OFzESP3XmU5gNnoJF3G3mt2
 4UY0GjWBH/koZ4QBgtg/CXHBCwTnJV3cKnMFbNPFwSUldIyq21t5k6dMjg1ZJQZmkQ
 XslXiYwP5lzgQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 12/20] drm/amd/amdgpu/amdgpu_device: Provide suitable
 description for param 'xcc_id'
Date: Thu, 24 Aug 2023 08:36:57 +0100
Message-ID: <20230824073710.2677348-13-lee@kernel.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824073710.2677348-1-lee@kernel.org>
References: <20230824073710.2677348-1-lee@kernel.org>
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
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:516: warning: Function parameter or member 'xcc_id' not described in 'amdgpu_mm_wreg_mmio_rlc'

Signed-off-by: Lee Jones <lee@kernel.org>
---
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
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e77f048c99d85..d4f0e4327dd3f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -507,6 +507,7 @@ void amdgpu_device_wreg(struct amdgpu_device *adev,
  * @adev: amdgpu_device pointer
  * @reg: mmio/rlc register
  * @v: value to write
+ * @xcc_id: xcc accelerated compute core id
  *
  * this function is invoked only for the debugfs register access
  */
-- 
2.42.0.rc1.204.g551eb34607-goog

