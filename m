Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B167868A4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 09:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11E810E4B1;
	Thu, 24 Aug 2023 07:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02B010E4AD;
 Thu, 24 Aug 2023 07:38:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F94D65CD5;
 Thu, 24 Aug 2023 07:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1D2C43397;
 Thu, 24 Aug 2023 07:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692862703;
 bh=+Z34z/S8rQGwpCMx4NBHY18dHHBoGvStdyvTsjgtCck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UupkmrNOgh56ldj2NhYcCjaK1ekkrhSYtHSJIKSrt3GsYyG5hKKb5RRUL6pjUBcTD
 hnEigFUDoyrGQYGMEqaKzFmqGmV6ZKZBNt76OZ7j7vFcrIS4SXWyKrZywfplNEDSju
 n9dDf3ngrL4Hc92XMBk83IyuckgsT9x1WUBcJesAQ1rv2Zobb/RtAbygYXM0Qv0vIX
 2owH56tvoMH1fQTTNeQiNaGzXzFaAWM3ltAhydf57y8UsxDB8eGhiCzOStjL30OA4Z
 g64pgZq98rjhAAV7VpMbjGxfoUeW3SpL/e/YcHS0GeK6+KrGeaY2mQzCxZ039TeN/F
 7LJndWX7fhIXA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 20/20] drm/amd/amdgpu/imu_v11_0: Increase buffer size to
 ensure all possible values can be stored
Date: Thu, 24 Aug 2023 08:37:05 +0100
Message-ID: <20230824073710.2677348-21-lee@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c: In function ‘imu_v11_0_init_microcode’:
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c:52:54: warning: ‘_imu.bin’ directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c:52:9: note: ‘snprintf’ output between 16 and 45 bytes into a destination of size 40

Signed-off-by: Lee Jones <lee@kernel.org>
---
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
index 4ab90c7852c3e..ca123ff553477 100644
--- a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
@@ -39,7 +39,7 @@ MODULE_FIRMWARE("amdgpu/gc_11_0_4_imu.bin");
 
 static int imu_v11_0_init_microcode(struct amdgpu_device *adev)
 {
-	char fw_name[40];
+	char fw_name[45];
 	char ucode_prefix[30];
 	int err;
 	const struct imu_firmware_header_v1_0 *imu_hdr;
-- 
2.42.0.rc1.204.g551eb34607-goog

