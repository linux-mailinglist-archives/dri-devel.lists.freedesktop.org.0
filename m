Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E556BE320
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060DA10EE72;
	Fri, 17 Mar 2023 08:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4C510EE66;
 Fri, 17 Mar 2023 08:22:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6835D6222D;
 Fri, 17 Mar 2023 08:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B8DC4339C;
 Fri, 17 Mar 2023 08:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041374;
 bh=wsKwBwChKHJxg3AMCoE7a0SMKdSUlSQzuGKV0y3RRnw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZiHHfJE5SEfpChRFw9oChAyZ5xWfm2B9xmKfqeqG1Fnkrc1SPEl4R9RDr8HxUwIq7
 xUCUNUtRC2Lfi3Hof9U5tI/pGga2Z+9/C2z+m3s1rC3dCTcCbjGIq/1gEL6TYt3crO
 E+N5AVxeCvwsep9/q4ushxN+Nn5XYOJfcwnkriX/4B4JRssWqAf+Mkoz+bYv6CxbNE
 Z1TlcHPKzYqLGLkqibK/Sc2MX7ziP6uu1SiAP3tjGe4EZdJi47ymD6v0+gWf8zW6+L
 4bL2P8Od5FxVqzDo8izDBbD6k1BwX1nP0V9z9ZYA0dD6MCzEu8rJdTreRd9Xoy/Tah
 WXQ1PODcVOhxw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 15/37] drm/amd/amdgpu/gmc_v11_0: Provide a few missing param
 descriptions relating to hubs and flushes
Date: Fri, 17 Mar 2023 08:16:56 +0000
Message-Id: <20230317081718.2650744-16-lee@kernel.org>
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
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c:282: warning: Function parameter or member 'vmhub' not described in 'gmc_v11_0_flush_gpu_tlb'
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c:282: warning: Function parameter or member 'flush_type' not described in 'gmc_v11_0_flush_gpu_tlb'
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c:322: warning: Function parameter or member 'flush_type' not described in 'gmc_v11_0_flush_gpu_tlb_pasid'
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c:322: warning: Function parameter or member 'all_hub' not described in 'gmc_v11_0_flush_gpu_tlb_pasid'

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index fad199ed15f38..9f4f28192c601 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -274,6 +274,8 @@ static void gmc_v11_0_flush_vm_hub(struct amdgpu_device *adev, uint32_t vmid,
  *
  * @adev: amdgpu_device pointer
  * @vmid: vm instance to flush
+ * @vmhub: which hub to flush
+ * @flush_type: the flush type
  *
  * Flush the TLB for the requested page table.
  */
@@ -313,6 +315,8 @@ static void gmc_v11_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
  *
  * @adev: amdgpu_device pointer
  * @pasid: pasid to be flush
+ * @flush_type: the flush type
+ * @all_hub: flush all hubs
  *
  * Flush the TLB for the requested pasid.
  */
-- 
2.40.0.rc1.284.g88254d51c5-goog

