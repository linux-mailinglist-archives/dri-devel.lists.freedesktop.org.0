Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BD9AD24A3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 19:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A94310E14C;
	Mon,  9 Jun 2025 17:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bS5tLNMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273F510E411
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 17:04:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599arKo027404
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 17:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=XzZwPYZlbjF
 MZPye7rfYt1k670m73tYiBP58ZldSdxI=; b=bS5tLNMmGaTk0fsAqXaNNjrHiYe
 N3gHqmWXUDfnVH+wgr8H4JcLzIp6H9Zq/p4mEzC6+P2295TtVQ5LZuPHfJU2IWWY
 bs72wVFA5URZtBpe2+tJTwBWUvyVbr0/w355zMXtfNs/2PVVJfB6PykQkPG8dn2Y
 w7i86gKbxI3qIkapl1xcbP9ZuE0APkfmywZWCrwZXTMW8Z+I1UkZF6qVxEOmx+ug
 ATDCWo8aYB1lPpoZn7/+xpPhn6Ai8BspSaYAlDFyKydI65T6jQ8aS4tNwb2qyCzY
 PgU7yDxY1OAAwdupUgR5qXB9VHEDTyTDon5+6ZmS1NL6DZmIDqDMM4lIB7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11xw71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 17:04:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-234dbbc4899so71809665ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 10:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749488691; x=1750093491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XzZwPYZlbjFMZPye7rfYt1k670m73tYiBP58ZldSdxI=;
 b=II3EXokiWIsbofxDVm1t5NCOFpYuz7Otc3nJ667hAM5AQKyoIdhgGaKRZe6tD4tuZj
 8V7CethQwOHebxEC2bOS1RWv0ltGPgumOGrENVJTSoH5WO96iDM285eFP3fqvKSzYq1f
 GcMnOkp+laPPNKQ3LBb3lcAzemC9VEMeNqG7yiQ68bJ/ENaw59NIW1tKzOgfjS4e93/B
 LJiF5c+re7DhdBH2yMzYnt3DJe4LQvpcXjcVtPF+hc8r6whm3su8dhMrhib8uu2PROA3
 sETEwlZs8KdpHsYvtCX8VOda50s4/K+jxetU1I7vmgAq+bogfiJZq9bw15+kBfQr9gIB
 bTiA==
X-Gm-Message-State: AOJu0YzPW69v/B2eyOiAfjyRvgrd+2kRgczvHviEoI4PcVwCVpE3t8jL
 EuU6ZhBm86aqE7QPutO6YtoUPfkaBNAOcZXqVJjWzUAN2Waeuxv0FGwQP34qWV1yJuEyqSY546Q
 geM8CZv54qc9GIih8EHxpVt0jo4mrNhhJh/Cdq6Arakdfu7wq7mfBKqvR8P3acPC+JgnojjDaXl
 B0xDs=
X-Gm-Gg: ASbGnctpO7r2rQsvA/mkIu8DinCyShJDGi/oLtH+rMNVLhHbuyQ4dQS0bgnP08NsdDg
 +yz12DQB0NWN/Hlu0syi8s4zpy4gEWKOe/qY8YjiyirYvQVaneioqagTTEXLsKdE1TFUjqEjM0d
 Fa7DPl/6Scrsi5lpOK6owFZI6laYyIPkzehvjag6o7KkbE7G36coqnM0mfUU/YgVeibGlGVwUcl
 581qN84kNTm73SztlXOHLJzkRPBMRgSI8qRExkL8fG5BX8zTMPSEVyw6RyZ2uxJIU4ovg3os5rU
 W3mnLzNlfrMU4NycGzohYsYpue+I2T8r
X-Received: by 2002:a17:903:2301:b0:235:779:eddb with SMTP id
 d9443c01a7336-23601d7194bmr213852555ad.36.1749488690841; 
 Mon, 09 Jun 2025 10:04:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL1pHFRZONFYaAY8yeqfuRk4Hrvwb8mpHSMYXfnTl0BvljOd/9GrDX2S0s4MWKivdH4qiYQw==
X-Received: by 2002:a17:903:2301:b0:235:779:eddb with SMTP id
 d9443c01a7336-23601d7194bmr213852165ad.36.1749488690463; 
 Mon, 09 Jun 2025 10:04:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603504ed2sm57042115ad.219.2025.06.09.10.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 10:04:50 -0700 (PDT)
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
Subject: [PATCH 3/3] drm/msm/adreno: Check for recognized GPU before bind
Date: Mon,  9 Jun 2025 10:04:36 -0700
Message-ID: <20250609170438.20793-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
References: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ct6NQSwayoS7R4PVx35C52AVXBtXeVE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyOCBTYWx0ZWRfXyBxsCtcsgn0y
 ugWCKzWe5EhOkuUItoqGuOpt/uZSh2g0jOQHUS02dZ9Xnf9NKmx2qulVgCP1IjjNQKJuXtuO/uH
 nrzeweNS5CXr7B92361IliEXi932OkvPVhbPPVIddigl4ZyzxWy2ir2Dk72x44id8cjcb7dwh3i
 VDQIRtMmweMpLlnIHjDkh2G03kFFGpmEvtm7CWYzhyNqJlj0XRfpzIFlkQjXJc0NR+8V7wriPI4
 9a7ElWhJG+mAQ6CsXvKY6v5nHSkrmrp/vABAcilguR2YWgpLDsKaTUW06hfcPC4X/k+g3tBrn2O
 MSrgas1aY/cd+iudKZs5ufyGsp6h/m7uvHGpBbVLtJgYEcOfWG2+HniHZeRjZgidtEbhITWlJiw
 XBsvqw6fOOvY4G70pc5VLzZy+Fy2VWDjiZgxfHV063cntv2cKfu4CGV8j4HsyJ9+Pce/xckf
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68471434 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=4MAclHcQAAAA:8 a=MWJfq7QAy6hsqaZmoI4A:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=6vtlOZhwcO7ZS_iRoh4Z:22
X-Proofpoint-ORIG-GUID: ct6NQSwayoS7R4PVx35C52AVXBtXeVE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090128
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

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++----
 drivers/gpu/drm/msm/msm_drv.c              |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h              |  1 +
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 504174dbe6d6..002aaf365322 100644
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
+		pr_warn("%s: Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
+			node->full_name, ADRENO_CHIPID_ARGS(chip_id));
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

