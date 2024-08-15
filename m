Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E519542E2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 09:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB7C10E5B2;
	Fri, 16 Aug 2024 07:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y34mK5tS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85F610E4E8;
 Thu, 15 Aug 2024 18:27:46 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a7aac70e30dso145063166b.1; 
 Thu, 15 Aug 2024 11:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723746465; x=1724351265; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GYNQ3Kd9tk4rueRVocGNtRpvnUgsUyrxTXFbooCVABo=;
 b=Y34mK5tS7pKEpi8Jg77I1CXJfFTQKpW97YPUl0TJYvaUbeU6E1IvSAZobzafYgPNlU
 swQs50JqQBRVcgivuXTxFXyYgYnkhFvyFSkCKojMgWAlT7Jsyh5aMuMqk1fuiYGxZxHB
 nQ0Rz4WS7va4aio4Cdf2d7f7ibH8ERZFbRxefRNUWICIVMlW55/U6BJNXlYBnNd7gRK9
 M26XzDvgaIgqM7yYHxttUxWRbv1RxVqq+BKnb67tn7f08ARG9QFdIj6Ih9EFXdwWXS/A
 Rv8GtOjit5OVf2T7B1ZKo0smCGTRX7Ad8DRHoYQdjBehoueDdNHFw2jUTgYMPbARZv92
 lW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723746465; x=1724351265;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GYNQ3Kd9tk4rueRVocGNtRpvnUgsUyrxTXFbooCVABo=;
 b=D+HxaMXCEj8zR1y+yJNLOE62uSoK4A06CvZRkU+Q9DB1QVrLFp3s+/lzrgyLilx6bK
 j9iTzh+4ddXBakJHi5QHVP6f9VV58HIExW7xjJN8IbWmFzpQRSGFd/7eqHG9F2aJ6b8d
 GXx2mbQjNA01VtcgJ8NgYzuS1vp8lMDiCSAQiePuwkzLKh8Pez7GfjRw+tvwQQjdkxb6
 AKjpQaaaNvyS+DoCXeq2hoPF/ffj5QqmH3Q+WoCejk8ctrlMS+cD7ZOLPpQL9sIj8RDZ
 ufFCCh+W+ANl5FVllSnOu81f6HUMxthAJmrhe4qGYnD6JVd3Igk00y5eE4m4RTYIq61O
 ftZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtBr/QI9Iz7mJ+w8yrRJ8gIkDMIuYizEEKp9qx2M6wun5nnmwNt/z0qjcBhfiikhr89xUSens0khXnOPcN3p4ZyyHV/CJM4/xpF1aALmPw5zTpqZPmrSrcUgtmI91Y0YP9oJ6MIwKYTmqvrh6emRLg
X-Gm-Message-State: AOJu0Yx0G67G6qtbpYLtQ5/Lh8Jpho6S9D79NFmH27bfHMClpcESKg6I
 JWRoFSpH216t+QPKA6k7jR0EZJR3c8+fcc1HiL7/jzJD7yLvIT/9
X-Google-Smtp-Source: AGHT+IG7eGtE09/Qx++WFHjUPm+osUtSJegCIrquQ4d7QvqeC3N59wMKxmmm6RyPv1HQ4dTZwDJezg==
X-Received: by 2002:a17:907:7b8c:b0:a75:2495:a6a3 with SMTP id
 a640c23a62f3a-a8392a411d4mr27182466b.67.1723746465046; 
 Thu, 15 Aug 2024 11:27:45 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it.
 [79.35.172.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 11:27:44 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 15 Aug 2024 20:26:16 +0200
Subject: [PATCH 6/7] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=2101;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=GF/BCimeWie0a1inww3pyOMeudVhMYIVzh+LjcDJs6s=;
 b=7HXl9WtNfMMnNqPPtxHK4bSQyelfqNTETs83haTMurX8wKTu4RJi0olnliHSZG+aSrcc1BFA4
 Fb6DGs0HiwfDpe+qhFQtvcM0V7GXvWxo8k4YHDpUSlNkevPyRyU2K7P
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Mailman-Approved-At: Fri, 16 Aug 2024 07:39:16 +0000
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

Some userspace changes are necessary so add a flag for userspace to
advertise support for preemption.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
 include/uapi/drm/msm_drm.h            |  5 ++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1a90db5759b8..86357016db8d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -453,8 +453,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_MARKER, 1);
 	OUT_RING(ring, 0x101); /* IFPC disable */
 
-	OUT_PKT7(ring, CP_SET_MARKER, 1);
-	OUT_RING(ring, 0x00d); /* IB1LIST start */
+	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
+		OUT_PKT7(ring, CP_SET_MARKER, 1);
+		OUT_RING(ring, 0x00d); /* IB1LIST start */
+	}
 
 	/* Submit the commands */
 	for (i = 0; i < submit->nr_cmds; i++) {
@@ -485,8 +487,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			update_shadow_rptr(gpu, ring);
 	}
 
-	OUT_PKT7(ring, CP_SET_MARKER, 1);
-	OUT_RING(ring, 0x00e); /* IB1LIST end */
+	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
+		OUT_PKT7(ring, CP_SET_MARKER, 1);
+		OUT_RING(ring, 0x00e); /* IB1LIST end */
+	}
 
 	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_end));
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3fca72f73861..f37858db34e6 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -345,7 +345,10 @@ struct drm_msm_gem_madvise {
  * backwards compatibility as a "default" submitqueue
  */
 
-#define MSM_SUBMITQUEUE_FLAGS (0)
+#define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
+#define MSM_SUBMITQUEUE_FLAGS		    ( \
+		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
+		0)
 
 /*
  * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,

-- 
2.46.0

