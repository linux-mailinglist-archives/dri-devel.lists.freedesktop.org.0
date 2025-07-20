Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F6B0B5EF
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCB310E37F;
	Sun, 20 Jul 2025 12:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CK15wmZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4074A10E37F
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KAVqib004899
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sBmzzhW5Jj0p8WIW9/VlZBWqiN8JQGD2ZD52IVaRVEk=; b=CK15wmZjwLqVxFF+
 HUoGDkBx2r15Oxpj8YJuVlT5KgPd+CVdQnGrA3QlXxP75VuQoymPj7Hb0Qr6SgH9
 IAEZRMKDhNOWQau/kqrm06mIB4I61SsEBEAVjl3AQ3uq2oe047iyzR4+/ogMSI8S
 Oc8hDNwOYNFyR11olShvu9ilpL/auQ1VnO+p/J9bkQ0Eg9x15gwmh0j3W+X7Q3KH
 H+Ts4JuRVgKv4qUXKVQOaCM8YIdGA4BuxIz/LM/lpkjCYWKCQyw3EiaGji52jKiM
 s8Bfx2MLDsSJzUOYSXSZNOk1SEVOdsZtamAgRDk2IcrUt6lmr5vGGrePKSrhdh+9
 mMX+5A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045ha5xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-749177ad09fso1451331b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013859; x=1753618659;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sBmzzhW5Jj0p8WIW9/VlZBWqiN8JQGD2ZD52IVaRVEk=;
 b=AxxzYS3gevMFuRxnl5IbVUaRHGDUivzGERtTrEZELS+zKIyQD/uvN/NrT/1L0LJo1y
 lCtopqntJgkSp+EbqBCqU2r9Ej/FWRZckpn3Ud9Tmq5FwcY25+lFRFIf324zZplBE1Jt
 S9dHQxcztNyH8PkuyKujJ4YWWg+mpiK5KZRZc/Ux8NT9WFbXsuY9zspyI+usHNWhTUbW
 G8uAdw3iJKsbYJZKDL4AiwjFS1z2XHwN7IUSD7VGpJ9kHz2GxIA02mp1AxrsI0LYvzTo
 pPKTT6AjLGmS8qvDb/VpZAX76EJ9o+CCzveKwZN/nqbZx0j9Zsbs/IluL2LKYv5yV+vi
 5ozA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq9grTUfRoJIPk3eYgg5a+weBRDT2KQOuMjzWJ1AmcgYN75BNL0eWExt8eKGH6H5bzHAd3uzpwv+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyupnIRdvO44i0UFHnLKtHOSWtIcqvkxVyWZMYd9QHRh1PUpB4e
 EdeQIDqF4xSJiuPTUnIfuT8mpayKrcX/F908y0a1hWArGgZJtZm1Im8tGIyIFktPP7HV529ds5Q
 IhYELKV0I4LhZFMeU1ebGwS6SeALn1BBna0qIMufYu6KMa+dKDPOs51ocACPTkIiS1C9/H9Jorx
 hNrfk=
X-Gm-Gg: ASbGncvntNiAMPtOYegDQuOV1qCt3MjuQBvUL71ySCxf9xFS5jXqG/diBtNSiZX/99Z
 NdpSX657rCy59NsUCORKu6L49eWhoyou+Y1dq8RbvZ6B+E8u2quqG+ySbPu3IqNhB6GxCWZTQ5/
 cs3tHkBAcjtQPepgzXtk+TCpcOxupUKO9mVmzueHdbBWm2yY4I9/zjLngBK/xPhW303MQKi7pki
 QxixprAeflZ9AwHwumOlyoN6un+TZ/2ZjeENx7UBjAaUJY8+h64n3Ma79JCgSL3sXnQKINyolsr
 yqVKlfz6GyjTo3vNWsY7h6xpoedYa2r9ByhQ5SM4+BlxPGqiExB3p3guH1TX2qgI
X-Received: by 2002:a05:6a00:1d82:b0:759:3013:8dfa with SMTP id
 d2e1a72fcca58-75930138e54mr15194869b3a.18.1753013858937; 
 Sun, 20 Jul 2025 05:17:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHky5Ub717uk0wP0u9f8RtsuBSVWNnbbl9pWx4XoUOaKPKD1lY6iSnhVS3KCoxJyIWeda1fcw==
X-Received: by 2002:a05:6a00:1d82:b0:759:3013:8dfa with SMTP id
 d2e1a72fcca58-75930138e54mr15194831b3a.18.1753013858492; 
 Sun, 20 Jul 2025 05:17:38 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:38 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:13 +0530
Subject: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1263;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wqLkCf4B4+rAHo40MJEHOqWO43efxrMMyMYz8FlTqtg=;
 b=57s3/rl0XfByZyUpDrauyiUmLfsidvykGjHJF25PhHK0hs0Hz0klsQf6cNk5NMPG4Gw8jnW4b
 RIB6TjQpayICXoNmtM+GNdsFQFkeP9cvdQ8ia7aHmoGMGigvy0nd2ix
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ZtDtK87G c=1 sm=1 tr=0 ts=687cde68 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=_nbzAfXQmFRcFNHC6JoA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX8dJwHtKJfRTo
 2e2rlZIFGVmQD3or4QD8dT4HDLKVaBOlojlVD3GPPBwPgZmXf+l9d0q96QXyDTn/mDmSEB5KHWI
 nOPYnwMongkq2VTzOVn5/26USIuFzRQQzVQe0HHs0YlisAVXsDDi3WXjLWN9MKumaoH6Fsj5q+x
 HKwoZp9eENoQqJvvl4E2Ds7ex76yDEqNI6D5lrsvBwo61bypnXV+uuch348tyTZVHcrLIdMYk9I
 Xdh0s9QCWNJKz+k2NTGU9K1sxMfUvDBtf2jiPNNMXMyxgfrCU59Zel7FN/ipC34Pr1YJy2UonsY
 xSMstT4WPxEw0vkIMrQB3jr1VjATRcSMrjk1Z6r6g4YJWi/O/tORggA7Z0FqCO4D0Llp0czHhxI
 Ay9svItbDwcpNeiX/XipAMk5FKgQVxl0py+uNuUVq3A+uSGy4d9xWQGbC4rq7X37VAcEye0G
X-Proofpoint-GUID: iBZK15ZPzpcmWcJEyuECuO5H3vDpVsyM
X-Proofpoint-ORIG-GUID: iBZK15ZPzpcmWcJEyuECuO5H3vDpVsyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200118
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

When IFPC is supported, devfreq idling is redundant and adds
unnecessary pm suspend/wake latency. So skip it when IFPC is
supported.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af949cab36ce8409372 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include "adreno/adreno_gpu.h"
 #include "msm_gpu.h"
 #include "msm_gpu_trace.h"
 
@@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	if (!has_devfreq(gpu))
 		return;
 
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		return;
 	/*
 	 * Cancel any pending transition to idle frequency:
 	 */
@@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 	if (!has_devfreq(gpu))
 		return;
 
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		return;
+
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
 			       HRTIMER_MODE_REL);
 }

-- 
2.50.1

