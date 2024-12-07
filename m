Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AF99E80B4
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268BF10E41D;
	Sat,  7 Dec 2024 16:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TI6dfRso";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A096610E303;
 Sat,  7 Dec 2024 16:17:59 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7258ed68cedso3093086b3a.1; 
 Sat, 07 Dec 2024 08:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588279; x=1734193079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8+aynnXkT2Tv8509cM1dO0nO9C5LPhaKj9kzwLt5iA=;
 b=TI6dfRsoKcgGrXc0UGQi+JqSJUhAW5yoUoujJQ5OclMcPiUYeeIJH17PqzbfTuFzIK
 aMKplsbKC0bLWTLudpT+ccRWgHIOKAv0KGIRU4uv8eDCsszi6JVssX5qXRr0ZYEI3b66
 SmcCuDQKftMfB08McEOEcqFa3gMCIbZIPc7uw/soEtw1pq+3v6OBmT1/N3WpK6FP4gid
 eX4M44rfUTB6GLdRvDzhmnOoNDdDphLTOxz0Yw8k0XtBEaDrVLjPMCNRSENhdMBTXCXY
 /f/FxSgWUsZcpgq7AD4JHh8FfmRkESWXDhwUYvH0ruX19r0ho1FxxWx/oEuTQWcz+S3o
 iiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588279; x=1734193079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W8+aynnXkT2Tv8509cM1dO0nO9C5LPhaKj9kzwLt5iA=;
 b=qkkew9cI1IcIevi50vjlVuXjt9j33WPRFXLeBEOMxlYUl++M+w/7DvsITTMfJ3ZzuN
 P+opKShRViUjKqUCosA6TWxmOEresEW0ZWBuZmxefVZFk+otG992n1hwKu7a8OiN15s8
 WFVfgveo2mSqLSblDCNtSfBiHfP4EezQqyGxQSi45Xlw9oOaoKm/+U8dbKWr1xqwZGCE
 4GHfYVSoXZscKBw6hc310ibeWL2FPGM+Bw6RVdth+o1xjkGnYbuidLsSXroNxKwACdYj
 lKwIouqJnsoPJ1QURSOZ9Tz5Iso1zU9ZielMz+Wtj0MSACBfrse1MklMUw5M+ai38zCm
 JO6w==
X-Gm-Message-State: AOJu0YxxEnNMp2ZiIN77J72Ah+IQlisxEI+l3HDrzE3bM5eJ8qbjMsCd
 g83PsNzjRWXeEFuq3GQ+zC/6yGffZSQOYgXeMaKppiah50Yqx1RkfWNlfQ==
X-Gm-Gg: ASbGncsjKmNcCqBt/p3374HVzQyVOfdIvv9zeVUwIkhDkboJQN/Il25ehVVkFo1dQLi
 Ey431sslqWOEkkT5IGiXTUY14KS6mzDdbL3Hdr2ndHJK/GBGmE39+1YRB1rx3UD99eWsBfsSCQr
 KoUlcJ2OBJUXxiaZ4yqXZ5vMMNgIAFPbjzeduAlaxKM9b56J/wwQRi3WduyBUcDtzb4Ax5JZvZv
 mrMUcQdWdqYWvKWiKGKamAbzDhlVDAczD7KU/dz1h64Yzswea8FhIajoN0GV2dxtewQ6kYm+1Ry
 ldG7ZrOT
X-Google-Smtp-Source: AGHT+IHIjdGL/dpBA/1X2A/Uf+yw41v8np6MWGp4a+GqznIPYiIdC8DVSHtSkopR6oq532/kgOxirA==
X-Received: by 2002:a05:6a20:7348:b0:1e0:e000:ca60 with SMTP id
 adf61e73a8af0-1e18712303amr11457387637.28.1733588278791; 
 Sat, 07 Dec 2024 08:17:58 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725deb60815sm391621b3a.109.2024.12.07.08.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:17:58 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC 12/24] drm/msm: Split submit_pin_objects()
Date: Sat,  7 Dec 2024 08:15:12 -0800
Message-ID: <20241207161651.410556-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For VM_BIND, in the first step, we just want to get the backing pages,
but defer creating the vma until the map/unmap/ops are evaluated.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 8a4f4c403404..51c92fe1146f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -292,12 +292,16 @@ static int submit_fence_sync(struct msm_gem_submit *submit)
 	return ret;
 }
 
-static int submit_pin_objects(struct msm_gem_submit *submit)
+static int submit_pin_vmas(struct msm_gem_submit *submit)
 {
-	struct msm_drm_private *priv = submit->dev->dev_private;
-	int i, ret = 0;
+	int ret = 0;
 
-	for (i = 0; i < submit->nr_bos; i++) {
+	/*
+	 * First loop, before holding the LRU lock, avoids holding the
+	 * LRU lock while calling msm_gem_pin_vma_locked (which could
+	 * trigger get_pages())
+	 */
+	for (int i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 		struct drm_gpuva *vma;
 
@@ -315,6 +319,13 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		submit->bos[i].iova = vma->va.addr;
 	}
 
+	return ret;
+}
+
+static void submit_pin_objects(struct msm_gem_submit *submit)
+{
+	struct msm_drm_private *priv = submit->dev->dev_private;
+
 	/*
 	 * A second loop while holding the LRU lock (a) avoids acquiring/dropping
 	 * the LRU lock for each individual bo, while (b) avoiding holding the
@@ -323,14 +334,12 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 	 * could trigger deadlock with the shrinker).
 	 */
 	mutex_lock(&priv->lru.lock);
-	for (i = 0; i < submit->nr_bos; i++) {
+	for (int i = 0; i < submit->nr_bos; i++) {
 		msm_gem_pin_obj_locked(submit->bos[i].obj);
 	}
 	mutex_unlock(&priv->lru.lock);
 
 	submit->bos_pinned = true;
-
-	return ret;
 }
 
 static void submit_unpin_objects(struct msm_gem_submit *submit)
@@ -760,10 +769,12 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			goto out;
 	}
 
-	ret = submit_pin_objects(submit);
+	ret = submit_pin_vmas(submit);
 	if (ret)
 		goto out;
 
+	submit_pin_objects(submit);
+
 	for (i = 0; i < args->nr_cmds; i++) {
 		struct drm_gem_object *obj;
 		uint64_t iova;
-- 
2.47.1

