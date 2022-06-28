Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE70F55BFDF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 11:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E081112B1C6;
	Tue, 28 Jun 2022 09:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09E112B1BF;
 Tue, 28 Jun 2022 09:46:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A0B66181D;
 Tue, 28 Jun 2022 09:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BF3C36AE7;
 Tue, 28 Jun 2022 09:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656409590;
 bh=4DMz4UXLGu0uFuXPe+nKrtjSJ9DOJhlkac6gN7tBAmU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OgiGPoKdlAxpDh13ECLhDLR7tvZLpF+oBjOo2jCH+fdAGuBmotoBAKdxRqZyUKbWE
 0PdrXAAAkXmSFwMwTLEh9Z4y+Sxv4K0LW7R18MJcIKtE+9JNzXL3xcsV5wE6F2Ng+M
 K72cPmR/1P+xpT436+VvFwG2i0lAN1Y+sh7Vqw76jzyXlSVwA16rcv6c4/kEw3HxyC
 62GxkYn4VHWClZ+wgcXIvk3lecpOMx/RlREtZE1/EokQq4VSM6cy42Rq+YZR8ONohI
 Nm6qZWgzKnm34TYbR7T8y1EYCiTGDqb9SFOlAMQL3wifHEeDe4aQe/DvfAkDc8f04W
 RdFbNbjuDPvSg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1o67nf-005HFD-Qp;
 Tue, 28 Jun 2022 10:46:27 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 10/22] drm: amdgpu: amdgpu_device.c: fix a kernel-doc markup
Date: Tue, 28 Jun 2022 10:46:14 +0100
Message-Id: <ac8ece934af1145bc16531b9f10d69c76216cb66.1656409369.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1656409369.git.mchehab@kernel.org>
References: <cover.1656409369.git.mchehab@kernel.org>
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
Cc: Evan Quan <evan.quan@amd.com>, Guchun Chen <guchun.chen@amd.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lang Yu <lang.yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function was renamed without renaming also kernel-doc markup:
	drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:5095: warning: expecting prototype for amdgpu_device_gpu_recover_imp(). Prototype was for amdgpu_device_gpu_recover() instead

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/22] at: https://lore.kernel.org/all/cover.1656409369.git.mchehab@kernel.org/

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 9d6418bb963e..6d74767591e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5079,7 +5079,7 @@ static inline void amdggpu_device_stop_pedning_resets(struct amdgpu_device *adev
 
 
 /**
- * amdgpu_device_gpu_recover_imp - reset the asic and recover scheduler
+ * amdgpu_device_gpu_recover - reset the asic and recover scheduler
  *
  * @adev: amdgpu_device pointer
  * @job: which job trigger hang
-- 
2.36.1

