Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4034451B5A4
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 04:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF95010E8B4;
	Thu,  5 May 2022 02:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68B910E8B4;
 Thu,  5 May 2022 02:11:04 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id e5so2570645pgc.5;
 Wed, 04 May 2022 19:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2JXqprHTSEwVqmxQ6E6dnaH9uepTywYAN4NcxLuZd6g=;
 b=BahfpvWfsZ5f932IPUJ2jABGavlcF1WDZZRQ1xqDVsDdv6eSrvo3aDFJKKKlW991/A
 QHBtOcY3VCtoHQTideoAXZigBBTPmmLNCh7gj8PPuqDL7getPhkiOxQGMhoh8AAwWVb7
 /0d8S/e63i68BJcrSa8koua2Reqb17gA1yKlM6KjVXnTSxhhHgUw0oqAxwcDpFBWXqiq
 Nac/PyrdR/EP3o+qf8AgOKKxmvu5rOYC/9a6f1+Yl4Kri1iPyhccktjHa/tWEJMGsM/a
 VxFKKBS6Ok7j25IFXwbIP70FzDCEXatGVpfFK/n7+uspR+zc7G0qTV1EeEgI+ifo4lyZ
 DyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2JXqprHTSEwVqmxQ6E6dnaH9uepTywYAN4NcxLuZd6g=;
 b=v+lnsCBq3Viqf8tY0PPRJujtdl8Wv3/DDuWxo8bvu5xjhxxP9xEXSewY8iQU17e1mk
 2/K/EoaCl5UVIi8w+crvFWgkiLdHgjEIefuHo92zPznNNTAKOBH3UJ1Nc9vVwwCnQQxD
 l8G/Row9jls6bOeDSnK4tkKfjjR3486lzSR2pjJG6PSb1ACzYd083DEa0wyUPzFe5nbQ
 iRIJMVlKDx2n4enX02/cowVGMosmNVbXzzyYsML1raX8MAphHDX92ie7MTl0WFUIEzX7
 bcGBglaN7preBqeL/ZahT4M/BexEHkDxucq8RrS0ryx2r4DGxAe0FCtSLuthMebzVGYj
 ZmPA==
X-Gm-Message-State: AOAM5303pMa0xIXGcCR7FApLP8G/n2gVzL4/tff0TMjJDkgAHSOjNRVh
 ggdfyNr12ZsKqTgLU3d1LeQ=
X-Google-Smtp-Source: ABdhPJxAiLJ63+QLwKXUbnFKKWPgiJBSXZs2RaHbatNjT2OEkLNBoKx5qJaZbbQSUW6AwyU4PsilqA==
X-Received: by 2002:a63:e60b:0:b0:3c2:2450:135a with SMTP id
 g11-20020a63e60b000000b003c22450135amr14174847pgh.8.1651716664263; 
 Wed, 04 May 2022 19:11:04 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902a40d00b0015e8d4eb200sm186977plq.74.2022.05.04.19.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 19:11:02 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: simplify the return expression
Date: Thu,  5 May 2022 02:10:57 +0000
Message-Id: <20220505021057.54044-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: amd-gfx@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 54446162db8b..3d8093bf1679 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4688,7 +4688,6 @@ static void gfx_v10_0_gpu_early_init(struct amdgpu_device *adev)
 static int gfx_v10_0_gfx_ring_init(struct amdgpu_device *adev, int ring_id,
 				   int me, int pipe, int queue)
 {
-	int r;
 	struct amdgpu_ring *ring;
 	unsigned int irq_type;
 
@@ -4708,17 +4707,13 @@ static int gfx_v10_0_gfx_ring_init(struct amdgpu_device *adev, int ring_id,
 	sprintf(ring->name, "gfx_%d.%d.%d", ring->me, ring->pipe, ring->queue);
 
 	irq_type = AMDGPU_CP_IRQ_GFX_ME0_PIPE0_EOP + ring->pipe;
-	r = amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
+	return amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
 			     AMDGPU_RING_PRIO_DEFAULT, NULL);
-	if (r)
-		return r;
-	return 0;
 }
 
 static int gfx_v10_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
 				       int mec, int pipe, int queue)
 {
-	int r;
 	unsigned irq_type;
 	struct amdgpu_ring *ring;
 	unsigned int hw_prio;
@@ -4743,12 +4738,8 @@ static int gfx_v10_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
 	hw_prio = amdgpu_gfx_is_high_priority_compute_queue(adev, ring) ?
 			AMDGPU_RING_PRIO_2 : AMDGPU_RING_PRIO_DEFAULT;
 	/* type-2 packets are deprecated on MEC, use type-3 instead */
-	r = amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
+	return amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
 			     hw_prio, NULL);
-	if (r)
-		return r;
-
-	return 0;
 }
 
 static int gfx_v10_0_sw_init(void *handle)
-- 
2.25.1


