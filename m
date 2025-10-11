Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF008BCF5CC
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 15:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73C410E06D;
	Sat, 11 Oct 2025 13:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DLXlVJy8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824E210E06D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 13:45:42 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-63963066fb0so5949923a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 06:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760190341; x=1760795141; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eSN6YJly2uz/i5kBQYAcGqHNw257xKcldfsRLDm9KbU=;
 b=DLXlVJy8+DGzyfkKSDCBAnFxq/PeSBHE2UQL+HVh1kGUyYytNlQE/b3uWB0RTlpp5Q
 UZxCpnWRSS1FqpnJtlIVMqNDTOw8hxTeKFxhifY6PMlcY3Ux/8bWvudVoSNgnVsAqHQ5
 aBUSVREIsoIVq3oDvT7KHew5C7eHhTQSY+IrIfR4+pLVnJS41YqOShIl+o5L2xegXqWW
 DYRv7p92V0mlUREZXf/P/vMB4f82UhzBkdCg46MbBgTm5aHAv3JEkKUMTU1GM/dvwRU5
 kTNON9OuhWu9Lizyf1UiCbUprTvUMvuUO4jGrKUbulR3igXTobg6ynOZK6Uq4fmV1eDi
 zbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760190341; x=1760795141;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eSN6YJly2uz/i5kBQYAcGqHNw257xKcldfsRLDm9KbU=;
 b=jn2bndo4rq1kmYRq34RxtjXJyYME2XOpJWzgqY/EbNkqVCJvYizueTlLDwtF/kY92Y
 yvgLpAh7zJbTf47Lp5403ECbZQrPULvqnEka75Bk+Oqa4VU7MTp/IyTVRB0yPuQPHViw
 oCj9aDr1P/HCnDdSQ58pZIIoSr08g25AmjCiOGx2UAlE/r/3EGZ5mCf+L0Wd2MHu+nCa
 0sFPH9UXfBTzfE7Q0OMpxVWHC10CIbCqoFobvIgbvQQJtE9eRb/Ubu6INns/ZEwOaj2G
 LaNf+3CtseZ7Fl1NuLjIpmHxkuV8rKrYgQl4RcK/14dbpnENp8d6OosN3mG97KjmwjAC
 vcwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX99TR9mLx6NwwUAc79SzGzmnyWGpqOKBOv0y+K5/D1hrjOTMqMlFe6qc9bn9lRdG/Qem5055NEUCA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1RGb0T2UeEeuw4MvI41yj5i4MpVkYWoCh1OnCP6dYnqj6CM/a
 nhhbX0z+PJWP/sktVE1CA7ya0lvdb+D5FW+raxTo154CP8Hmdf28e5M=
X-Gm-Gg: ASbGncv4acjs8ro2zV1Z3xK4SJv7dD7RfMnqpYewMVLOEy99JI7crr2KtvH2VXGEa48
 nkdy6WWOvSL0j/wMIYFpzy5KZGDLy9d7rX26KQRRFBHeL/ivynIlDIztuc5Kb5umtLwfRIRYoI+
 kX88XgvBHXA2itS9H2KywasjhOTa2PgPb20JFW7VLe043+uFuFRVugPvKdRS63t6aszCnhLZ2t5
 D2Ls1R7xYK0mIQZHjP2i97RZQjB4apq5mxBaj7ksysqBL7zKwir0q/keYv/Ipj3KSDeNzOxIvWd
 hrPDZFdCK5ah4Zk4iULSrfYzsXlsusl/SELDFKej4P07vnk+hrfuDQxY13Wp3Em2Qyz+vm0Gest
 iaaayhhBrssUDbzojCp3DkbsZX8WwmRMUb5/+nafCP8+sLDUEsfUafRbs4C7QaK7NHLGsfDfvp/
 F5pHxKMpS88RC5GlqIHx2WDy9qaJl2egPUytHOehs=
X-Google-Smtp-Source: AGHT+IFxwNevxZuakuH1AwVGVUxgynpTEfjH50O/959om/vjv//gOoU0pSJRYKc+s8OpRyguD6wedQ==
X-Received: by 2002:a17:907:3e05:b0:b33:671:8a58 with SMTP id
 a640c23a62f3a-b50ac0cb5dcmr1592525966b.37.1760190340665; 
 Sat, 11 Oct 2025 06:45:40 -0700 (PDT)
Received: from [192.168.1.17] (host-87-19-169-144.retail.telecomitalia.it.
 [87.19.169.144]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d61ccb09sm470963166b.19.2025.10.11.06.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 06:45:40 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sat, 11 Oct 2025 15:45:10 +0200
Subject: [PATCH v3] drm/msm: make sure last_fence is always updated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251011-close_fence_wait_fix-v3-1-5134787755ff@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGVf6mgC/43NQQrCMBCF4auUrI1kEivUlfcQKWkyaQfapiQlK
 qV3Ny0uXLhw+T+YbxYWMRBGdikWFjBRJD/mUIeCmU6PLXKyuZkUsgQhKm56H7F2OBqsH5rm2tG
 TC4FgZCkBEVk+nQLmeWdv99wdxdmH1/4lwbZ+QBC/wQQcuLMKVXWyRlt7bQdN/dH4gW1gkv8gM
 iPaNkpJ2zh3Lr+RdV3fF0yhQ/0AAAA=
X-Change-ID: 20251009-close_fence_wait_fix-00e1c2521eee
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760190339; l=2066;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=iFYvEtWlC7xxF1kiaqDFQ3ELFe/iyBZgt0MDdURh88Y=;
 b=0JggH6t/TIHGmWfFVBv+owfEoMyqVT7mhRAb3nxyr2ha5tqUUZN4EesSAzkWYqalqgfHTvUq8
 DGbonyZztQrCEgdQZF7aL8H5sjt6yJwRvyVXi4tzO0dhOQpo283VE+a
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

Update last_fence in the vm-bind path instead of kernel managed path.

last_fence is used to wait for work to finish in vm_bind contexts but not
used for kernel managed contexts.

This fixes a bug where last_fence is not waited on context close leading
to faults as resources are freed while in use.

Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v3:
- Fixed Signed-off-by tag
- Link to v2: https://lore.kernel.org/r/20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com

Changes in v2:
- Only update last_fence on vm_bind path
- Link to v1: https://lore.kernel.org/r/20251010-close_fence_wait_fix-v1-1-fd3e394dcadd@gmail.com
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3ab3b27134f93b01236fec5833a18a6e2ad2cf5e..75d9f357437006ff261db148901e176eae670d41 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -414,6 +414,11 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 					 submit->user_fence,
 					 DMA_RESV_USAGE_BOOKKEEP,
 					 DMA_RESV_USAGE_BOOKKEEP);
+
+		last_fence = vm->last_fence;
+		vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
+		dma_fence_put(last_fence);
+
 		return;
 	}
 
@@ -427,10 +432,6 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
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

