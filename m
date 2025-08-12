Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B60B21E75
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 08:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02A010E59A;
	Tue, 12 Aug 2025 06:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Hxp4Qaj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f100.google.com (mail-io1-f100.google.com
 [209.85.166.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4094B10E59A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 06:37:17 +0000 (UTC)
Received: by mail-io1-f100.google.com with SMTP id
 ca18e2360f4ac-879c737bc03so124133639f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 23:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754980636; x=1755585436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vnf9J8D/lbhMrAAVySeXBqauE+p5C7GABrpw1C+CN+M=;
 b=q8csfBm2ist4DHDurumSytQzPizJsmNRJF5Mjs2qIzWJ9TZOCFLGtlqzJ97vvgWUY4
 V1Ex78Lezz2PWyYAYoSh/D/07URKc59xlVZTMWewTK6w+RSJZVIQayRabToP0IVg/uOU
 d/EwUUqPd8ET6LVkgfAMI9D15vd0w3gU1YbU76q4bBjQmi+GlTgEhefP6/0HcrMVN2bl
 XHiug4Xs68lGOwNmYq5kpZCSB+lWG0plHuBqgS/XXRDKhHIbkIoOevLiFJwgfZFI9QxP
 1QwB2oDTn6aUYqHZcJzooaU99Ge7XPPWU2uGMurgx5lO7nCiZiYt2NEe2V833AO2/CvZ
 epTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGsM9ruXJixCmIc7tBxAXE9HgATNj9lmlyPMP2ELYTqFhkD+x/SJprt5WhX1/07vzWVwLm5rilrZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxHA87ueYnswgW+K7s3LnfRn6oih3U15NuIqB+kkeJO61HxQoU
 R2fRryBk8K/S/baZOsjZE9VmeYVdso7QbMA1Myei39Jz/31CmT7lpso12p7dXi2vbzWlrrEXMMU
 JvPNbqUQghUnZsqWMzOeo4gAPZCNY/0fUt4Ck94rI8iOk/QsM0NM5e23TRUd/2WZY+AbyratfNv
 YV63vF0QiHWTUc/pSpcbWTjB7LqYMj339k3xOaJMVJOJu8VFTj5hgHyJSRPzVbJ2LZ74tYNa9/+
 KLovmgNw5Qf794brADtFjZvf8/6Pw==
X-Gm-Gg: ASbGnctLT4Fdr/Oc1LYUxoDm1IoJoDifV8MVhSlyRzD0OnTPBvVDSyJmNdeBwpZm855
 28thLtdZvdecPm4I4IVjWERK07U/sKp4IzHAsypDw9qBOhV2GAMHxzXeCaylYfeWbVlT2dMOdCW
 f/T96bTEeqznB9F5iCF+CxEKJe6vGZQ93f+o2DwTCvSSefeom3tm2QfRpr+ECb/6kn53lFKlVwd
 ym6Q+kO0h/j+lM/yIPjl1PnMMhClTHX8AzoVup/m+C4AxdCj9GMIgUwgTLkiscgvsGO/xrWfLgu
 a+UVyor2rau9fjSz6+WmmDJSgiXKCfjnO332Qlc2hWw5a9WYVe3eLP/lwX2Izg2mzkmF3JKUOlL
 yPfupj9zFLiPW3DE4KW5dVlz+hyYTOtevzqZm+rzAdMv9zM/S9pkXQcTAZOsN3SjBjEZSAsEVxT
 N6EJ0bwQ==
X-Google-Smtp-Source: AGHT+IF7aNlFHmtAqBbuJUG16rWGdxBB/5a1M1IqqmMwmIOUpzYndxNnKqp9HR1uXF27paOH2ZgmpJP0a0YJ
X-Received: by 2002:a6b:e708:0:b0:87c:1542:8abc with SMTP id
 ca18e2360f4ac-883f11d2eeemr2450557339f.4.1754980636213; 
 Mon, 11 Aug 2025 23:37:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-122.dlp.protect.broadcom.com. [144.49.247.122])
 by smtp-relay.gmail.com with ESMTPS id
 8926c6da1cb9f-50ae9c492edsm686448173.50.2025.08.11.23.37.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:37:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4af22e50c00so125997111cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 23:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1754980635; x=1755585435;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vnf9J8D/lbhMrAAVySeXBqauE+p5C7GABrpw1C+CN+M=;
 b=Hxp4Qaj4R1FNh05nGbzX1e4LetY451hy1Kb1bRwOUErkitrheU09tsTsg/gcN6c6VT
 0IFa4wCOdPKuhmbeGbkwI4eFw0WzuhEMbd5uJBCTUfIsQ4Gsy7sTv6USv0IRp7SSvT38
 B3obv8SA81RwBlEDU65IR35KyWTMUXicOJ7jA=
X-Forwarded-Encrypted: i=1;
 AJvYcCVz1F35KpEu7ZQ5yP7Rg1cqi1zlKxAmffrfOIm9KofdrjsTo2PHiGvQQOprSlwGGhZlrQl9ACp1sBk=@lists.freedesktop.org
X-Received: by 2002:a05:622a:3c7:b0:4b0:641a:ddde with SMTP id
 d75a77b69052e-4b0aed86506mr214213981cf.59.1754980635083; 
 Mon, 11 Aug 2025 23:37:15 -0700 (PDT)
X-Received: by 2002:a05:622a:3c7:b0:4b0:641a:ddde with SMTP id
 d75a77b69052e-4b0aed86506mr214213721cf.59.1754980634597; 
 Mon, 11 Aug 2025 23:37:14 -0700 (PDT)
Received: from shivania.lvn.broadcom.net ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b095e6c7d4sm85319621cf.54.2025.08.11.23.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 23:37:14 -0700 (PDT)
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com,
 tapas.kundu@broadcom.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 lijo.lazar@amd.com, mario.limonciello@amd.com, sunil.khatri@amd.com,
 srinivasan.shanmugam@amd.com, siqueira@igalia.com, cesun102@amd.com,
 linux@treblig.org, zhangzekun11@huawei.com, andrey.grodzovsky@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Guchun Chen <guchun.chen@amd.com>, Sasha Levin <sashal@kernel.org>,
 Shivani Agarwal <shivani.agarwal@broadcom.com>
Subject: [PATCH v5.10] drm/amdgpu: handle the case of pci_channel_io_frozen
 only in amdgpu_pci_resume
Date: Mon, 11 Aug 2025 23:23:49 -0700
Message-Id: <20250812062349.149549-1-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

From: Guchun Chen <guchun.chen@amd.com>

[ Upstream commit 248b061689a40f4fed05252ee2c89f87cf26d7d8 ]

In current code, when a PCI error state pci_channel_io_normal is detectd,
it will report PCI_ERS_RESULT_CAN_RECOVER status to PCI driver, and PCI
driver will continue the execution of PCI resume callback report_resume by
pci_walk_bridge, and the callback will go into amdgpu_pci_resume
finally, where write lock is releasd unconditionally without acquiring
such lock first. In this case, a deadlock will happen when other threads
start to acquire the read lock.

To fix this, add a member in amdgpu_device strucutre to cache
pci_channel_state, and only continue the execution in amdgpu_pci_resume
when it's pci_channel_io_frozen.

Fixes: c9a6b82f45e2 ("drm/amdgpu: Implement DPC recovery")
Suggested-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
[Shivani: Modified to apply on 5.10.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index ff5555353eb4..683bbefc39c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -997,6 +997,7 @@ struct amdgpu_device {
 
 	bool                            in_pci_err_recovery;
 	struct pci_saved_state          *pci_state;
+	pci_channel_state_t		pci_channel_state;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 40d2f0ed1c75..8efd3ee2621f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4944,6 +4944,8 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 		return PCI_ERS_RESULT_DISCONNECT;
 	}
 
+	adev->pci_channel_state = state;
+
 	switch (state) {
 	case pci_channel_io_normal:
 		return PCI_ERS_RESULT_CAN_RECOVER;
@@ -5079,6 +5081,10 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
 
 	DRM_INFO("PCI error: resume callback!!\n");
 
+	/* Only continue execution for the case of pci_channel_io_frozen */
+	if (adev->pci_channel_state != pci_channel_io_frozen)
+		return;
+
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-- 
2.40.4

