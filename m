Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC42FA773B6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D4710E4DE;
	Tue,  1 Apr 2025 05:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GySIRYLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABA510E4DE
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 05:12:04 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCqB8025623
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Apr 2025 05:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 su5HDLNPv0sRzcPmNzYwCft3R4LA3Sh56oZUJ6HjWts=; b=GySIRYLNGHbm1OAx
 K7XD7CAFr9HvrcWsAVJ5zIjE5YtAJJ+q3yAel+r02N50ESi6SggQzJQE1WFgr3e5
 DtePswXabB1iK4dAgraXOzCJlWgLCh/2TNAsL9TukKNDXkNfKfhLq6t2nw+KVNRa
 LQxdDa5VWaIO0Mc58IVdCDTssY/7gyk0pxTR71sN6wLOqr7OHZDsAX6cPpvVwOVb
 VUvKUsXiNVbZ3pPZZkCG2AZV/Kzn9LknffHnzoH/iwTQg1rvZjnQxpRFytKszn25
 Btrwqek5LmwHuaDeGLeYPIN5hxAh++ntsGK3+Wcn4wPVGy5uvDFPtl80UAfkV4Yk
 n4D/rQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhpr12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 05:12:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5c9abdbd3so509922685a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743484322; x=1744089122;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=su5HDLNPv0sRzcPmNzYwCft3R4LA3Sh56oZUJ6HjWts=;
 b=RE8A16GjfNTew5UQkk50w6+A/qAeMJFJ9QzHEfClpuoc4cOpdR2Pu+X7/qQeExlYU6
 m3MqJWdGVzDJygxvhGTcExPF3I+05d4M2dfpJh0u3nUFN1z7LGdBaQ1sZT5cKCXFNu2E
 J9Wc/lyZmRFS/Q+M2F0tm6YfAUgPPYu6g9MyvsiEjkMw8jhE1zH5Koq3Ht2Vhwy7ypQD
 6rzNBySzXpucXv9yFMANnrVSwSAot6VGaI7lQ5D8EOwkT+df0/8sQtE4PgO7azpuYsLl
 52mopFCC7AlKqgI4dRLv2Xi0xKa2ecL+SjaLaN56fKarzMO+mnJ/fz9bMg6gVu1SXmvg
 x5Bg==
X-Gm-Message-State: AOJu0YycAOZSOT5n2B5beyrMZoWI7hYmImXGChpe1vHakMl5hSiohMCQ
 PUU0lSTlR99qWxZUVh1/cp8IWPTRsLRekIyqVYuHr+ZDgony2KuzZaThqqhQWvUZ8pbfDgOyZO9
 iDnv0Vd2OZN9jxDi4ByCjh0FVFsi/O06MYqlVRQDl29p07Cn1nYLMwGutdz9Qq9DCmAU=
X-Gm-Gg: ASbGncvDiXW4+GDAMeDLV/xZ32htES93v5ukLIqgrlmQVNqiW1eJH00P6cJGdLl9cQp
 8Y0D7FrQl1xzo6ydFmQKryABRss6qCZ/Lwu1coblO19ki+ehGc1coh8drEzAQA6EaE1Gx01Ys7S
 T94vLmNBfzGjcoaNiwr6Pt38PhchMSVNP3e+qcjKA7+TE7fa15Eh5o0qFhNFv+TfwtTmJA/4uue
 pBb4inQQumfyGI7SjT/9dhnwuakzeskvKnmvwrlBD2WkTdB3AawcKPyQgOwFVjN4RxJkQnNwWcz
 hpM98UcRkpSLm1xb957LsWRi4WGtSM6OA5ttNUwyTyD/29l35OP8JhTS69qunCsIjBw78JD5pyh
 8Awcj4jo5KBBymqmaE9ePkTXUWpYz
X-Received: by 2002:a05:620a:2a0b:b0:7c5:4b37:ae49 with SMTP id
 af79cd13be357-7c69089511cmr1850601985a.48.1743484322122; 
 Mon, 31 Mar 2025 22:12:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfkh+VwvyZqGWd26i2DZpAeXVnuJcT2uXByll2V8BgpOUSTAvnwlH3MR5aeFbdPqlccIuedw==
X-Received: by 2002:a05:620a:2a0b:b0:7c5:4b37:ae49 with SMTP id
 af79cd13be357-7c69089511cmr1850598585a.48.1743484321703; 
 Mon, 31 Mar 2025 22:12:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b095a21b0sm1251697e87.243.2025.03.31.22.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 22:11:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 08:11:36 +0300
Subject: [PATCH 4/7] drm/bridge: analogic_dp: drop panel_lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-panel-return-void-v1-4-93e1be33dc8d@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
In-Reply-To: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ljnxHNh77aJKTn5PBnRyQ46dmjys7Q6lroI6kcr2K88=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn63WQ9JDhpO2O3km+J66d3OvjPxAK1AuTTf1XK
 9nMcbqhsXqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+t1kAAKCRCLPIo+Aiko
 1d2jCACvEOox/CQElqeioCPPoLsvAIxMwsML921E+NqK2RDDDcNofLsW12QfFmN4lf9xy3tbJ2h
 021oWlZ6tZF0FEUMjYqCe6OgIOaDaOCH2M1x0QVRLzVYOPzh/IAZeVGMA0VCtwylSfD17NqvK91
 vJ39nQupM51Yiq1BrM8jXCQG0hHmAfK8L5gpjSbL2Rxz6usoM1fbhtZdzKad+RJb7xsS9+W0DWu
 wljR/PcNZNKEiZDd5L15P74eNEgh1BAVP3UYCUOWxSJphSs4oHFSKi/KpT23St7eLsPh/S+MR+/
 H8xy5QoBR5qqJgTmEQF3iU9JXnBFdY7sXLZmSeGl7g9YrCPQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: vCCZaQ-nimn1He4_3-HFJYIwdcRa2o5H
X-Proofpoint-ORIG-GUID: vCCZaQ-nimn1He4_3-HFJYIwdcRa2o5H
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67eb75a3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KfGKz8IhEdz9gtDduwEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010033
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

The analogix_dp_prepare_panel() function is called from bridge's
atomic_pre_enable() and atomic_post_disable() callbacks, which can not
happen simultaneously. Drop the useless mutex.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 704c6169116eb2601d2ad02dc7294455ceff5460..1ec4d277fe6bb03ad9eb8451ae2af5ad5ada0978 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -974,14 +974,11 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
 	if (!dp->plat_data->panel)
 		return 0;
 
-	mutex_lock(&dp->panel_lock);
-
 	if (prepare)
 		ret = drm_panel_prepare(dp->plat_data->panel);
 	else
 		ret = drm_panel_unprepare(dp->plat_data->panel);
 
-	mutex_unlock(&dp->panel_lock);
 	return ret;
 }
 
@@ -1523,8 +1520,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	dp->dev = &pdev->dev;
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 
-	mutex_init(&dp->panel_lock);
-
 	/*
 	 * platform dp driver need containor_of the plat_data to get
 	 * the driver private data, so we need to store the point of
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index b679d5b71d276f458d905c936160f107225bc6c5..2b54120ba4a3ef55af518a0629a5c8469f275a0f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -169,8 +169,6 @@ struct analogix_dp_device {
 	bool			fast_train_enable;
 	bool			psr_supported;
 
-	struct mutex		panel_lock;
-
 	struct analogix_dp_plat_data *plat_data;
 };
 

-- 
2.39.5

