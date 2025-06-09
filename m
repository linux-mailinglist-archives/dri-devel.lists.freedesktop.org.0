Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A1FAD24A4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 19:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C363B10E414;
	Mon,  9 Jun 2025 17:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFlIHAJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6CE10E414
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 17:04:51 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559G2Va2002439
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 17:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=6W/371YKVn8
 zY+sgrwBLaaDGncwtCHPm73vufdI0Knw=; b=jFlIHAJW7s0p0FYHzBnfKk//Jbs
 VM4Z6p2u44RLC8bDfVfumcgJQRvycWQFi4JH3/ojlWcq3nbke/Kr3fLJz+vbDx15
 8ZIovZEa5E5KuF2ZmJ78+jhhfDzPq87m3cYW1YFJqCnzyMP/364oP1RD7faHPPqD
 lbr3YPuX9qrJNhrJLeJ+uUmLbFG+iqJFVY2q3wCbdNSTBCp1aUzicjn3ZENPWpy6
 GKitUW3DlS7KMfA08gPznUeCUBjAZKd5MEaIexUl+hMx9nzPaz1e9p+Ejk7UE3RY
 /qf3Bd9zRoRuwjmqJb3hikSgbW+C8KSl+4/x/0cn1qqOqTsZ1derLMC0bgg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y1f65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 17:04:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-747cebffd4eso3610974b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 10:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749488689; x=1750093489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6W/371YKVn8zY+sgrwBLaaDGncwtCHPm73vufdI0Knw=;
 b=p24XWYikZMlUO05RSP4pGIXdCenxXB+FfW/64oas+covYmjmHJCzKmuszeOG882Cf8
 E9UbZoQCjLXW2JBYYh2xKCXaJknRZAO492d9ZXkXvsFMT/Yi6wDagdPvQayyTihmyM9g
 gGzokp75HuOh0+9tph1P/i2Y75L5eAocslYj8SA2782ehwmtyV1VKafGW2iMi8Viyv3P
 fxq2qPI1dCS3DZc2bXSroiEvZdE9UwxSox+U2Ab3HENT0O/1F2hdiYY36zw3Y4A44GHd
 5LuPdNTnkAzRurzT5SF+kugmX0V+M41OhOPY7JZTt0hoXK4tn0njM7G277FM6bfm/rje
 Vhzg==
X-Gm-Message-State: AOJu0Yyqe4hJ6u0LjO8GCBLI4FhWQd3D21bI82AkjpD1x4kWBhgtJHvS
 0zWdmXMmv55mYa+ILeb3y30YnTgZRtvM01EWS7ezVHUSVwXLF3kfH1ZvRNTDdStl3NrqZJq/zWZ
 RwsLpj6L3NJRRW1IFSycQaNcL0uNCVQU+Czpwnv+2E4aaXmwlSUt08RxIBdnPwhc5tMX/Nma1mQ
 +eluY=
X-Gm-Gg: ASbGnctVqqwqtp5SG+APmuQ9YUdPiOaucLeC/wnYn196YX78xPqvyLWORVVazq6fMbs
 XAMhKGKKDLN98mZFX27uZIsy/dXTNuCyXU4fCS49igFWVveaNC1Wg3CsQ+2Pk5shcFqQPVg5Gar
 jnTrBKxHtzDffC86ZSDzP2sSTx70fn07f3spjb06kTNTGGy3MU16CxnEZCwoHQ5cAbNR3/GpSkR
 vikjBYkS/OCgKoc+bnD5ibGx5cOgLzPufJpVfyW250gihob6b+LjBkSYPBVOlQTWzvLAyxbtLKR
 NPbX/XAk41mOboK7NZNpjg==
X-Received: by 2002:a05:6a00:4f8e:b0:742:aecc:c46d with SMTP id
 d2e1a72fcca58-74827e4e9c7mr16970837b3a.5.1749488689462; 
 Mon, 09 Jun 2025 10:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVMskIvufXApiy1mvHcQX0CnDdei1oN4pY7QtQVLahbgeU0gQD7OlQZ+oMMskVwE/QXOj6Uw==
X-Received: by 2002:a05:6a00:4f8e:b0:742:aecc:c46d with SMTP id
 d2e1a72fcca58-74827e4e9c7mr16970818b3a.5.1749488689086; 
 Mon, 09 Jun 2025 10:04:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af7af0csm6186677b3a.62.2025.06.09.10.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 10:04:48 -0700 (PDT)
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
Subject: [PATCH 2/3] drm/msm/adreno: Pass device_node to find_chipid()
Date: Mon,  9 Jun 2025 10:04:35 -0700
Message-ID: <20250609170438.20793-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
References: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyOCBTYWx0ZWRfX0iY+6RKbcthC
 j/ufVW9INN8eT/H+dWn8i/ltnDScPT7Lp277dPqnz+DlXUVVwMyCKwOUdUVTWZoDS/vr6ewd+8+
 qzZJKKb3WiP3c14h8jAvAGSPOMhgmQrAnWNwMSr6xIPJfEqz7MgBxsTlQ2OrVWxQ69Fqg8sAm8s
 KTxn8+1CW+O5dITtScEbdoBf9ON5fMell0w+7NZPx3DVJSzeWDcY6EsAjpyF5yyUizL/wMEPEZT
 ImxAsKXM+U9qeSk1iryI+jMtavEx+dU9SYG1/3V5CgsJunjbjnooZxnPo64QCKqstzDYaY4NR0i
 1dhAy1uWMBGIo6G/fu0nNG21HVmFwK+BYcegLx74T5ICcpwIVIjTGHNMYVA5LTROFHXDIsNjbq6
 hZIf0M3a3KJmaQiGPSEwQSObz/434jlugRttceapqvhxRI3Al4emq0bKGvWQjgOEoG1UL2yM
X-Proofpoint-GUID: drs5ek2PmoZK0thbifNTz4XXpbu3To0d
X-Proofpoint-ORIG-GUID: drs5ek2PmoZK0thbifNTz4XXpbu3To0d
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68471432 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=DSfSXdSXGXaEfb08ihoA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090128
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

We are going to want to re-use this before the component is bound, when
we don't yet have the device pointer (but we do have the of node).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6b0390c38bff..504174dbe6d6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -133,9 +133,8 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	return NULL;
 }
 
-static int find_chipid(struct device *dev, uint32_t *chipid)
+static int find_chipid(struct device_node *node, uint32_t *chipid)
 {
-	struct device_node *node = dev->of_node;
 	const char *compat;
 	int ret;
 
@@ -169,11 +168,12 @@ static int find_chipid(struct device *dev, uint32_t *chipid)
 	/* and if that fails, fall back to legacy "qcom,chipid" property: */
 	ret = of_property_read_u32(node, "qcom,chipid", chipid);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "could not parse qcom,chipid: %d\n", ret);
+		DRM_ERROR("%s: could not parse qcom,chipid: %d\n",
+			  node->full_name, ret);
 		return ret;
 	}
 
-	dev_warn(dev, "Using legacy qcom,chipid binding!\n");
+	pr_warn("%s: Using legacy qcom,chipid binding!\n", node->full_name);
 
 	return 0;
 }
@@ -187,7 +187,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	struct msm_gpu *gpu;
 	int ret;
 
-	ret = find_chipid(dev, &config.chip_id);
+	ret = find_chipid(dev->of_node, &config.chip_id);
 	if (ret)
 		return ret;
 
-- 
2.49.0

