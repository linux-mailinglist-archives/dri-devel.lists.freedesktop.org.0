Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44CABCB0BD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 00:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC9C10EB30;
	Thu,  9 Oct 2025 22:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d56Gdbse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5216C10EB30
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 22:14:19 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-637e74e9104so1952281a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 15:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760048057; x=1760652857; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+C1qgBpiLGQ9qb0EvZ/pqN9napeSCut88weJBHDFgWE=;
 b=d56Gdbseo9nynb9bF+XlSSPq0N9T3qapslh3EbZ7IT+QCrW8P3BR9nZrzaJjspQy5l
 izU0dURbWOjKGsiKYxglaWvCCFYXZSK+hxOIMautkalhygKxb/RuuHdUvOhpQpW5CJwd
 IjcAsY/9vwI6AbNr/TZcaLgAqKVYQcxz3UWyRAxOiseWZv9PkpgXxDbv/B97Ulmsjbwk
 1AoaqB4DTsQRZ2bIFX3TVHQmE+HHfnqys0GqVrmq+f3sZY4O24YRcVLB4itkDNCrHW7P
 /sTZgLFWRmOLbQncd6t9gmfHH8aPqt+kTSWUV4uwMZ7/W/ZfVR/nIfzN/GDp7j48musP
 sHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760048057; x=1760652857;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+C1qgBpiLGQ9qb0EvZ/pqN9napeSCut88weJBHDFgWE=;
 b=nfZYH4Q6TBm7cRZM3KXItIKTtyIIXIkkZOuGNktE+35WjhZZsBd1uaNZqMZ7FLGefH
 HuOvLVN1RlCY9qYzNLHUFUdPhVk4dI2Fv4tMSZLj138uujs5giWSR4Ok6GJQDyrQGCyN
 XJAUNfHquwePYHNV9PsTmGvr+AMjze3Jqmsfzm4m94b83hQxkUZd2a6B4IG/oWuO85zH
 xXq4NU84as4G0lZeTq8OkE7yjG6Uc307LweJrYIVBIZrH2cPz8TBiBK6wSLE7bZdPRZm
 GPpbxHBIHbd6mGxxBq/D97IIB/Hd8gum+Ij2lbjtLukc8fboTEywatn51uzKHEpnMzZb
 3sHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuUboDbjNpnIffcvL7UcwP352IpDVdOueX1+9c6T00fyaqmwinnqdgoEVPz1FQyHKjOFdQENn0qHY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycwXisGXBIAmw7aA0IUFTFm0PifswLj1y7f/PQUdSUMBPP0SFA
 HQ3gPLvvXUAC9B4mYlWdUHXjaqRCPG8PjBz+/hg5B5sQEL85w/RQx1U=
X-Gm-Gg: ASbGnctWYynjT4y7jj4V10/qk/C5+7s/va//NP9eHGfxvRK7jNVDddZD56TogFCXyn3
 NoEUx598xoHpTzgNaT45T8EhG3UnOLOCxN5leev1G0bBpwTOfyaRNzXWmLHMEuhMtLjUtp+T7Xt
 IdBR4tYJ7W0dkZnBC42sgYII06IYPIuEw5OIZpRdFQ4eZ2gXxIl1fmMUQ9xJSo6lWBIb67KB3/f
 AoQlRlI3aD7EXofZyCmAVfrcHElKI5agh80AgQjXpMf0YWSeiFQJoJl2beKl/MosSSUYVviPF3q
 Nj90vu1FltushWdgyXe739TJkmZpyBxIdya3lh/7T1h2W7sS31GWLw/0nCYyG/qvrahMBKUJA52
 XnCz+dAht4J05x78XUn6GxCVId9sby3Nti9EQQBGlWCafGMiWoUCWqBXMxlQrIN5lVnJ35THDeR
 D3fsgfnKzXfR9dGJz7oc5cNU6fAwapKP63R9A7YhhcXA==
X-Google-Smtp-Source: AGHT+IGJY2MnbndzBWS/Rpwtary79mPSlYcRrWBWKoF2nGdG3wTBAiynYZRbgnU4c2AkM1DSx73G6Q==
X-Received: by 2002:a17:907:60cb:b0:b3f:f6d:1da7 with SMTP id
 a640c23a62f3a-b50ac4c4085mr1073754066b.54.1760048057118; 
 Thu, 09 Oct 2025 15:14:17 -0700 (PDT)
Received: from [192.168.1.17] (host-79-26-169-51.retail.telecomitalia.it.
 [79.26.169.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67c9b68sm69162366b.32.2025.10.09.15.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 15:14:16 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Fri, 10 Oct 2025 00:13:35 +0200
Subject: [PATCH] drm/msm: make sure last_fence is always updated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-close_fence_wait_fix-v1-1-fd3e394dcadd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAI4z6GgC/x2MUQqAIBAFrxL7nbAKftRVIiTsWQuhoVFBdPekz
 xmYeaggCwr1zUMZpxRJsYJuG/LrFBcomSuTYWM1c6f8lgpcQPRw1ySHC3IrZmhvrNEAqKZ7RtX
 /dhjf9wOaWwlrZgAAAA==
X-Change-ID: 20251009-close_fence_wait_fix-00e1c2521eee
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760048055; l=1780;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=HDcLQ9jItgD9jx1XKHtGXKjYDLot5RODNSnCPekFFbU=;
 b=0XGlKf43ydVDbBU8ka57El68pwGM62R4dn0ImMJ8BTHLNe67KsNIpUaqhZjUzg1QMDFt7U5sG
 PjwlujPkoBdCnP5j5xX/9+hAc74gRAAO00sSJEmhoWgMgetUSoKT4Pd
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Make sure last_fence is updated in both the kernel managed vm path as
well as the vm-bind path.

This fixes a bug where last_fence is not waited on context close leading
to faults as resources are freed while in use.

Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
---
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3ab3b27134f93b01236fec5833a18a6e2ad2cf5e..ae91a5614bf377985ff7875fc36baf174780a250 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -409,6 +409,10 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 	struct msm_gem_vm *vm = to_msm_vm(submit->vm);
 	struct dma_fence *last_fence;
 
+	last_fence = vm->last_fence;
+	vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
+	dma_fence_put(last_fence);
+
 	if (msm_context_is_vmbind(submit->queue->ctx)) {
 		drm_gpuvm_resv_add_fence(submit->vm, &submit->exec,
 					 submit->user_fence,
@@ -427,10 +431,6 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 			dma_resv_add_fence(obj->resv, submit->user_fence,
 					   DMA_RESV_USAGE_READ);
 	}
-
-	last_fence = vm->last_fence;
-	vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
-	dma_fence_put(last_fence);
 }
 
 static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20251009-close_fence_wait_fix-00e1c2521eee

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

