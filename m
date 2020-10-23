Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 973FE297414
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291526F8B7;
	Fri, 23 Oct 2020 16:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E016E145;
 Fri, 23 Oct 2020 16:33:49 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20AFF246A7;
 Fri, 23 Oct 2020 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603470828;
 bh=Sm6vVeuESnikWfRWcK3zY2aHGRQZbkVkNsFoA/Hs8Fs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g2cgbOXqwo60/mWThB6DAqmhh9n1xCAhip126x4jhx1UfJX145E+eAbB15kIe8GKf
 ne5PJoTUI1m6tVd3+sLsEw7Mk8W2S0eso9OEZPnWHUFnCwC4ltxAA0ciGbIPz4rAaA
 3/jDiJxGEdi8pqp/h9ouAxUb4ff53Fuxamdgf9s0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kW00e-002AvS-O4; Fri, 23 Oct 2020 18:33:44 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v3 03/56] amdgpu: fix a few kernel-doc markup issues
Date: Fri, 23 Oct 2020 18:32:50 +0200
Message-Id: <632b3b11118969ff6fccb8a2f606c87fde41c138.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A kernel-doc markup can't be mixed with a random comment,
as it causes parsing problems.

While here, change an invalid kernel-doc markup into
a common comment.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f8785bdec79c..1d4b54950528 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -239,9 +239,11 @@ bool amdgpu_device_supports_baco(struct drm_device *dev)
 	return amdgpu_asic_supports_baco(adev);
 }
 
+/*
+ * VRAM access helper functions
+ */
+
 /**
- * VRAM access helper functions.
- *
  * amdgpu_device_vram_access - read/write a buffer in vram
  *
  * @adev: amdgpu_device pointer
@@ -4497,7 +4499,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	bool need_emergency_restart = false;
 	bool audio_suspended = false;
 
-	/**
+	/*
 	 * Special case: RAS triggered and full reset isn't supported
 	 */
 	need_emergency_restart = amdgpu_ras_need_emergency_restart(adev);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
