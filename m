Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E43D560B8D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 23:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ED710E7BB;
	Wed, 29 Jun 2022 21:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D8D10E73C;
 Wed, 29 Jun 2022 21:19:14 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id r1so15233836plo.10;
 Wed, 29 Jun 2022 14:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2+Uwf6eQjQK058s1L2C++JQ0GBO1KImV4TiG9qRxWtw=;
 b=mVmuzUMDRrBJK9xwOiiziy5zE88qL0C/KMDcIMMNmU4pZj1mhmGf7EdWVJmET6PlPt
 KrGFxAYShAmk6btJUE5o3MUTAYc0tdGVx7A4Rzs8bzulZkxez9VUVwegDyU9J8yh6Bsf
 PO78/ehntJEH+3bhU6/7r+VU/IUpN5/wI91whybvSbjKuJe/LkGXN3esaucGNk2x1yyd
 7cJaxAJb5c/ziPb+WUnPt0XcPALlmaIGNoHmkRwCKgP8iS8ENkWqS1tPZT/zzJSOVZEq
 nqZOiJJhnbm8tyX43Z2+6N1ZO+0nRRqgtPa+juv3PhEBttwaMIgRZ3hvW1g/2O2OBahe
 U8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2+Uwf6eQjQK058s1L2C++JQ0GBO1KImV4TiG9qRxWtw=;
 b=TdIEYFgQkNtOqCCrNZrSAj9lRWKedXa3LctyWlC9Z9zHGAzstrr7FrP9ltfcqU7/bd
 V5lVWXPxRKIUQJwqKXi4XzbbS7w5AFEptY4G4i9703MZplZSEBk2WRUWpWlM0HXPm3K1
 803Llr7cNAQA37YBFUuD1dvz19N2txM2TZbcLab8+6uqW/+63UUYu/Fcz2m0eze+z+ww
 oEgk5d5iIo1GPV9ytOsPs8nn8dvnAagyrDNVGJ77avBhkgHG3pfisMZp9Qga4MWKTPzW
 7Plh7X2PYt1w/DcumEqAiGkMmuQL7y5Q8x8wUvpTU4+b5NRRhIzOfjJc3Z4LsvKwr6DL
 TRJg==
X-Gm-Message-State: AJIora8no1MvHqsuAxlKso8L74CIi9CjpNMbu4QPUzxUpQEfUXfNRWZ3
 VoozsPcLoLQFPrtGKyntdskflaMmaWc=
X-Google-Smtp-Source: AGRyM1tS7i5vwWTt5lfaXv/i3Vu4G1d7d58QYntNci+z9/AHoAI3GSJpl870upg1wxSaM3vy9Mr9Jw==
X-Received: by 2002:a17:903:1c4:b0:16a:73fd:3c6c with SMTP id
 e4-20020a17090301c400b0016a73fd3c6cmr10961913plh.115.1656537552990; 
 Wed, 29 Jun 2022 14:19:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 cp19-20020a056a00349300b005254ea64d4bsm11822958pfb.55.2022.06.29.14.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 14:19:11 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/gpu: Add GEM debug label to devcore
Date: Wed, 29 Jun 2022 14:19:16 -0700
Message-Id: <20220629211919.563585-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629211919.563585-1-robdclark@gmail.com>
References: <20220629211919.563585-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

When trying to understand an iova fault devcore, once you figure out
which buffer we accessed beyond the end of, it is useful to see the
buffer's debug label.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 1 +
 drivers/gpu/drm/msm/msm_gpu.c           | 4 ++++
 drivers/gpu/drm/msm/msm_gpu.h           | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index dff33f0558f3..382fb7f9e497 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -824,6 +824,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 			drm_printf(p, "  - iova: 0x%016llx\n",
 				state->bos[i].iova);
 			drm_printf(p, "    size: %zd\n", state->bos[i].size);
+			drm_printf(p, "    name: %-32s\n", state->bos[i].name);
 
 			adreno_show_object(p, &state->bos[i].data,
 				state->bos[i].size, &state->bos[i].encoded);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 293f3380fafe..fba85f894314 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -229,6 +229,10 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 	state_bo->size = obj->base.size;
 	state_bo->iova = iova;
 
+	BUILD_BUG_ON(sizeof(state_bo->name) != sizeof(obj->name));
+
+	memcpy(state_bo->name, obj->name, sizeof(state_bo->name));
+
 	if (full) {
 		void *ptr;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index b837785cdb04..4816caed22d0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -476,6 +476,7 @@ struct msm_gpu_state_bo {
 	size_t size;
 	void *data;
 	bool encoded;
+	char name[32];
 };
 
 struct msm_gpu_state {
-- 
2.36.1

