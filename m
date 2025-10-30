Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D29C21CCA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD8E10E9E8;
	Thu, 30 Oct 2025 18:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="CJNl/UMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D07E10E9FD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:10:24 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4710022571cso14574865e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761840623; x=1762445423; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2i47abyZfZz1bsH2DYwFEj9nyP4hs0s7U+jv9iT3E+I=;
 b=CJNl/UMGB5y2+Ss/y75JKzzg87mvX33hhA07WRoFBrCY5WVOC+THTqdKQMIQVwp7jT
 GoZcZZvPtP1B+Pp3lBwLxA5Y5OlotYZwffU4lLWViyt5oHpulR0InN4dfuNoRNjCmfF2
 nxDc2n1FAZ0Tb/eTYMINhIQ1dRGHj/uj+/+MwLJ72+LzAfm+MFUER3SlcG8H52gUFETe
 easj8+72hnaFKA6PwMMh380+KQ4Gyf32+XU/w9EMxTj9WZ6ZdASizWhf+Cke9Ni7NHVa
 WNjyg9x/0Ty9rP92coH8urcVf8J+RjNN3Z9l8N8xDFV2iN4A9g5IxHH3+Y3eEIaqBeVw
 Lc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761840623; x=1762445423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2i47abyZfZz1bsH2DYwFEj9nyP4hs0s7U+jv9iT3E+I=;
 b=aj9TVwf57M8SwbRHNnOVFi81GYnOEUTmaHL3ZzqslZGNxmD1K5Rqi5W8ze2SY4+CgU
 b3neUS6KrdrKyDFrbBtpRwxd/O9V2KSf3OzsDCwQsaJFH9ubJjgSinxC5bHNEu0w5JOE
 d/mg8IfFlff4RLvvBtWoGUMQaL4o08Pq8HJkxCPnn70YUb8HJ3vTjDAS5PFsl7y7KFXw
 nYF1w/Gu/R0JigbqRLTn9+F7HHDNgQg6rt6aN+89eZu6wIKosgER5Klv/D/oOgRYW85I
 RLpxm9IMjYRcic1sBWUkc7PHeQBQMuARPnQ+lUaaM2K6Q9go7Q4TCj76qzpxjcTO6HrM
 qkhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHhsUDzXbfHmdNjwVpHIQZl0IkA3bDZuFtM3FV3fbhB5TxLY0H2s7khqG6mMRFDRI6HtAeLkvuzOg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZCQjkZk+ZrdkrurTipNv44pp46bvJNhdvEhT7s9g7m5JOOUMn
 k9bRR2W2CY0PU1YF0Eo2E3sWEa5VgWEeJj/I0iqSzdjpPupLY7p/h7rcuQRzE+XZv2U=
X-Gm-Gg: ASbGncvNlwtvuhpWBKTKeulQk5Nd21q3k2/kDb3UGXEDCB/tNeIcMW752zjUGp5d4F5
 89W7b/5yYRfp2yBLDUn+PTGqSUD5mUIBR4ApuOT6qNrGFsNLPMOSFKvIKGcaXFO8oQYKlexM3VD
 HafcpfVQYhhdHw1MwgDlooM4VQ5kT4d3Q+YXPGzwo61rJWA3lvAOjUojwn6tUFJfWvpvCjnegpz
 VhZftYLSGZ+I9TKlBE8OJ8ZI9X9IR1nO73qm0dvGMLeeP/3F4dDJqMi2KWqi84dFVf47dEqvdIY
 CfCYWXEGB1UCj0YVdAMkaWzEN+M3WVZwpgMwW2TLMXqPsCKBx8xTs4ixbvO0tXns0A9Pjtbgun0
 InQ49h5a1g4fioUUPR1VSEvJyTFTsPlX3/dz3bPFhM6YHs8AkSv1P1JR/DeEdasdOgmg73ES5ua
 07Wpc8oNYlIJU/KC0=
X-Google-Smtp-Source: AGHT+IGAga75c6sY1Q+McZyix+GUEVEkjmtz7d93ls2cdpw2dE67igG9rZbHtTGqPlGirMSJ37N0Bg==
X-Received: by 2002:a05:600c:8b30:b0:471:15df:9fc7 with SMTP id
 5b1f17b1804b1-4773086d57cmr2259475e9.26.1761840622930; 
 Thu, 30 Oct 2025 09:10:22 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7a7csm33124857f8f.8.2025.10.30.09.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 09:10:22 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 2/4] drm/amdgpu: replace use of system_wq with system_percpu_wq
Date: Thu, 30 Oct 2025 17:10:09 +0100
Message-ID: <20251030161011.282924-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030161011.282924-1-marco.crivellari@suse.com>
References: <20251030161011.282924-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 18:42:34 +0000
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 8c4d79f6c14f..2f8160702f9a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4798,7 +4798,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		}
 		/* must succeed. */
 		amdgpu_ras_resume(adev);
-		queue_delayed_work(system_wq, &adev->delayed_init_work,
+		queue_delayed_work(system_percpu_wq, &adev->delayed_init_work,
 				   msecs_to_jiffies(AMDGPU_RESUME_MS));
 	}
 
@@ -5328,7 +5328,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 	if (r)
 		goto exit;
 
-	queue_delayed_work(system_wq, &adev->delayed_init_work,
+	queue_delayed_work(system_percpu_wq, &adev->delayed_init_work,
 			   msecs_to_jiffies(AMDGPU_RESUME_MS));
 exit:
 	if (amdgpu_sriov_vf(adev)) {
-- 
2.51.0

