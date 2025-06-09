Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE944AD2586
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 20:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5808410E439;
	Mon,  9 Jun 2025 18:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMl/ATCo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC5910E432
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 18:24:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599vrj7023336
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 18:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ecf/gs5q5Dw
 zFWtmUtIrh+h+5TTwNY0t6ORkyO3PRW0=; b=fMl/ATCopv81RuOcttIfLT3RGCV
 f2aFpC33dDon0kLyS+40JQ4W5Pm2bdSaCyaSfeO9ej6Q5a/5VZIxHJuEVE2pZAHx
 7fOEASnEIUe4EYRLaPVXWGZB2Nauq9gBZBfCoVlbceuikUOLy6EkajeRQmeXwXue
 qLnoGqBfkKECKtUtakL//L6/ak2etxDOwEPtxJhUDc2Poi9/Y6CvkSk60tq0rrnx
 c3bJ9JoRKMgsUss2RGWYKm/eLDxF6B3PoeJg1owl1ALvplNrQXnYIMmXLRlR90JQ
 ZDYoGJVWI6Tzvp23vkPEXxQpD0UJzxEs3HlxlTZyWKH91YENvDWwykoKyDw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jepna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 18:24:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-31215090074so6428793a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 11:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749493487; x=1750098287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ecf/gs5q5DwzFWtmUtIrh+h+5TTwNY0t6ORkyO3PRW0=;
 b=cXejzoDDMmqSV7YAq9+Q1BIWvADoTcOo4NEk0hJreSAqewxKsKdwcl8LXbtfu708hP
 07LVFy0WTX1lcPHesHotUaa1vueUZlSduJ1Odh6JEQ9YtqjJKG2ZI12DNCFyimug/YlU
 9lhyZmM22u9yt5avlVujq5gmlheV9+1iERk7DmhJ7bM3R759saQeIyY2ta1znWiIrQ7k
 id+7Ka7mvJMA+3m9i2lqVh+OrdacgyScseHzDuTWnXl2QD21s/NxavJPgbJD8Nfo4pTO
 2JNf09AOSDqn0EfMff/CBIip1SExozKmGBHbYO+4uqDzbOBENXMz7XSvC9hBfx/7XZLB
 vj1A==
X-Gm-Message-State: AOJu0YyV8bPPpr1fV/kyMR9aH6Tt89ipnfcICablR33c8xbPhuzWjmpG
 2ecgSvi1nJIxrJiGDJWsFRk9iS1ZIuMKu2UzbGZv6shwrEGMJ6/sZ/BeuAKrFgeJw9+JoApPnI7
 ncM1hZNxx1gOiUhGpXOTXlzMcNkFXaH1dlqHTM82fU+iJnQ/6xnMnGbCWXu4u2GYeFu7lRAhLod
 thpwU=
X-Gm-Gg: ASbGncs9WiEbFj0z7VDOimQntcAFh+QsZ0/KZPmo+8wNw7fmOPF2p/WjDUtl5N/rO/P
 +gSjDLtfb5Sy6VfmrBJAzk2P8FrgRDRmM51cOZD1bVpo9571gPzsXD3LqtvAxYgaRmF865YbHV0
 1lsd9T+rmTTMnBGyyaRQngIuA6LBW8XrRvZI2d/C5qIs21FbZhyXWUB02KFM60jwOCKw+89sweb
 tMNTN4dx6knFUgMxVLOZo1Xm9/ank95iAETaAZSZJU2Eb+Y93zIhbmddsKbSYQFGyXKmgf3ev3g
 j7nqoXF8D/LGjesuTG3v4A==
X-Received: by 2002:a17:90b:3c52:b0:311:ffe8:20e2 with SMTP id
 98e67ed59e1d1-313472d4297mr20221931a91.4.1749493486590; 
 Mon, 09 Jun 2025 11:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEigB0QkFd2i+DltDS7spF4Aiz+S0w1cLE1zE97QoFV7hOhFnk6CT2wbS3XvV3KokxiU/HvdA==
X-Received: by 2002:a17:90b:3c52:b0:311:ffe8:20e2 with SMTP id
 98e67ed59e1d1-313472d4297mr20221906a91.4.1749493486236; 
 Mon, 09 Jun 2025 11:24:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349f32c96sm6630688a91.12.2025.06.09.11.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:24:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] drm/msm/adreno: Check for recognized GPU before bind
Date: Mon,  9 Jun 2025 11:24:37 -0700
Message-ID: <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=684726ef cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=4MAclHcQAAAA:8 a=KW-EWzdukDj2kg_Rd5wA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=6vtlOZhwcO7ZS_iRoh4Z:22
X-Proofpoint-ORIG-GUID: kmSCduExQ3rpG8IDDRnm0Q5L0JUipsz_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEzOSBTYWx0ZWRfXz7UI+E1eYXo5
 GsJRyrnIJNLlIe16UDtUoP6DfaHN6VjYy9X8qshM+/EA32HB0mKbQ4kKFvOaOs1H46l2HVOav/W
 aYjwEUWdMeCziQmYl5YxWOxHxyr0mv3NymhbwKSPhGZhrN1gvwExHLdgO/zTF+gHlNJUfeWprkH
 yjRRJmiSR/7BIOllInXhZoMmF0DzhDKJbfrxX2e7MQv2sR7r5X2VHtXxGdNnOfJOSOWFxbVebGN
 GOtCAw7pmO9f9DPi/FzPPcVZKUajgVMkRBM9Sx7H350RsAJgjfTSGjtsnlwG+fndTudTNLNfvaq
 tg8sWwGm0b9J4v4Q7GQEcIM5CqW6a0uIYAq5MvEMIHX9fVrhUdEsMNLa1Zf8quQaqkeztVOPVXN
 aZJcz14Pcp3Ok8Ueuu9L9rK/Z93n8gyGUiquyoWknNVelkhYA5fXfgdjqw1MjaKKpfiGnAtD
X-Proofpoint-GUID: kmSCduExQ3rpG8IDDRnm0Q5L0JUipsz_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090139
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

If we have a newer dtb than kernel, we could end up in a situation where
the GPU device is present in the dtb, but not in the drivers device
table.  We don't want this to prevent the display from probing.  So
check that we recognize the GPU before adding the GPU component.

v2: use %pOF

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++----
 drivers/gpu/drm/msm/msm_drv.c              |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h              |  1 +
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 778e6ae7f137..0d12454b1f2e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -178,6 +178,26 @@ static int find_chipid(struct device_node *node, uint32_t *chipid)
 	return 0;
 }
 
+bool adreno_has_gpu(struct device_node *node)
+{
+	const struct adreno_info *info;
+	uint32_t chip_id;
+	int ret;
+
+	ret = find_chipid(node, &chip_id);
+	if (ret)
+		return false;
+
+	info = adreno_info(chip_id);
+	if (!info) {
+		pr_warn("%pOF: Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
+			node, ADRENO_CHIPID_ARGS(chip_id));
+		return false;
+	}
+
+	return true;
+}
+
 static int adreno_bind(struct device *dev, struct device *master, void *data)
 {
 	static struct adreno_platform_config config = {};
@@ -188,18 +208,17 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 
 	ret = find_chipid(dev->of_node, &config.chip_id);
-	if (ret)
+	/* We shouldn't have gotten this far if we can't parse the chip_id */
+	if (WARN_ON(ret))
 		return ret;
 
 	dev->platform_data = &config;
 	priv->gpu_pdev = to_platform_device(dev);
 
 	info = adreno_info(config.chip_id);
-	if (!info) {
-		dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
-			ADRENO_CHIPID_ARGS(config.chip_id));
+	/* We shouldn't have gotten this far if we don't recognize the GPU: */
+	if (!WARN_ON(info))
 		return -ENXIO;
-	}
 
 	config.info = info;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 87ee9839ca4a..40eb04bab35e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -956,7 +956,7 @@ static int add_gpu_components(struct device *dev,
 	if (!np)
 		return 0;
 
-	if (of_device_is_available(np))
+	if (of_device_is_available(np) && adreno_has_gpu(np))
 		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
 
 	of_node_put(np);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 5508885d865f..56bd1a646b83 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -729,6 +729,7 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
 struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
+bool adreno_has_gpu(struct device_node *node);
 void __init adreno_register(void);
 void __exit adreno_unregister(void);
 
-- 
2.49.0

