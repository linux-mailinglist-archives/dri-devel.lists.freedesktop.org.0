Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FFEAD8FCD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB58710E088;
	Fri, 13 Jun 2025 14:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pay6qyGV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ACF10E088
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:41:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DAv5Ve029603
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=f8LvzWRSramzprfrBFvO2s+C1Hm+tEbtLlK
 RSfKO3eY=; b=pay6qyGVBWCIHRDWXvnRM8KGHFLmvqXlScGFJW1m0kP6ycHs2uS
 12j1vP2HUfI22Sr7degxe/C8v4R6fxxYhLv57pLOoCbayh9KEayLx7+NK7O6hgL9
 GH+9vx7+SGAgNh/saaT/p5Mp/MKWG+EyfGDn420awxfDOvJssKc2T8S4x582lllJ
 gq1YxzsYSN/h2RX9lAiWznmrGMSyuzMbADosqAZFJ0+CCue9LRI671oLRcPz7/0n
 EeQHxpoK7V1diHe/VDtMgNat+5fbczjHOaiQZoEU1dGPr0i13bLtFLbYckKQ8Ce3
 XrhamGf/gXNpoNmmdyQ98akCJ6PWmTBC1wQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d12bq34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:41:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b2c36d3f884so1571603a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 07:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749825711; x=1750430511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f8LvzWRSramzprfrBFvO2s+C1Hm+tEbtLlKRSfKO3eY=;
 b=s+QP6KefxzLQyzSqQd1q9Fx+pa8bYqPxwjdWSq5lPKDqCQG4AwT36JqxAUCgE0JE/7
 OVZrwkIJtETtaZFa/xoYfZDbiFsZVlBv+LWINKJkNhLIFbxQPcbj+Q7sK1e9fIbKxyiP
 vLFdRV4FenEZmeEI93fjChSy0GkdBYbsVTRSoQ7W5S74FnvWuBO1MGsxVH3C7VCiPhlq
 tmGNfJE3v0RQfODRay3p/wbkduUz8R59ud1lT+q/RlCc/nCTPLdPfdPe35T+jJi4ZaIM
 1FiSS9ZeDhoHKtrYUCgCPkd+cfv335YrbhzRPiGinkFW9TDK9+Kh3lU76GdS+l5ecylZ
 ZAdA==
X-Gm-Message-State: AOJu0YzvQX9qDWx/2DRiPSjLEk2XwH2FDYjFZqaC4P85kjdqkegmrZ2b
 ndMjd3sxzQC9x/jOrTOyHtSpXE13Vd/o8dIL2XuzHo0auh3nGQuGB1Y42xWCtC6nupDI7HHSXBN
 2muSGcXhyhfamewgsAb8MvHfXE8+Ocn/DLHO330POa7WaotjGqGHUiq/Sj2npvIk13BRWM7QjWy
 J+6UQ=
X-Gm-Gg: ASbGnctqnrSvja2s2vT9RqYT9GYVKCEbg7J6cs7flzbSd31+Va87OC+JR5LA3LsK8mt
 hGCoGttLLCafCy594VlokareEgnT6VQYXgsKGy4VLhjgvKMQTtEf0QFOa69DWoirsJKMM7dNIG8
 Kv1amFpqui+8J5RvPURJKF3tJQaBrdSZLxRFuMm1dbImt/j+LVrBUPmajs4Vk7hKvysvA0CW0sU
 1h3pTkZcY/OTuYIyz6SxcVP/523ctYLdQFIIKhG8aE3pwraw54vkZDKonMH4l9EE+OVPBbLi1cB
 GxfNkTgoQN1pVKdtMEToehxRG8kzojBI
X-Received: by 2002:a05:6a20:748c:b0:21f:a883:d1dd with SMTP id
 adf61e73a8af0-21facbdebf9mr4553243637.14.1749825710757; 
 Fri, 13 Jun 2025 07:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7GnAOt+z7rv+BSeU7ZHDxFM735EmwOZ4MxONhEpinIvFL7k6YOrMe2Cgq92R1/zv8XQne8A==
X-Received: by 2002:a05:6a20:748c:b0:21f:a883:d1dd with SMTP id
 adf61e73a8af0-21facbdebf9mr4553202637.14.1749825710353; 
 Fri, 13 Jun 2025 07:41:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1680c5fsm1775491a12.49.2025.06.13.07.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 07:41:50 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix inverted WARN_ON() logic
Date: Fri, 13 Jun 2025 07:41:44 -0700
Message-ID: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MPFatgwKBjpnRhr4yo_oiYkeGF7mvauF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNiBTYWx0ZWRfX0gAz+2QGBPZs
 5yPt06WQcjhjtuXeYizZahjKDj59Pj5MgHWcVGHLwpHTD6prTgmWkAQ3e4mj4nHbXgN4wCeE46w
 Yj7Z/RV2CDxZYhesAUXsoeT0LygyEoU6mU5IjTwhxAiin1FDDHIE0Vz5vsmC6HGEkFSrITxhByl
 DsiLpqQarDmOy1R2fVSPdLxRCU074GvN7/fEIb2zMrmTFoIz3MTJqAm7GDtrW7O6R7VwymCC+Xh
 /qYsyrnhZZTQNsJ7jXUY2i0NbgjcAcJIpkfh9jUc8CikCDCQ1Ht121swi0IIKN6lZD3nZl39pcN
 mqt062Tk4uZYRfuZpQVjqFhloM8uig0BmVxmKd/TcTqQLOU40OcnXzx6Gkgc+zkaYGe+BI/DavJ
 yBAun7Wwaquq/sMJbuIcoftyD7HD5qzsiNH4SCH+wvUGcvsQt1Ex1WkFBG0deYC5cQ/CAn4x
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684c38b0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4MAclHcQAAAA:8 a=r-1N9bTl5XODNADl1y4A:9
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22 a=6vtlOZhwcO7ZS_iRoh4Z:22
X-Proofpoint-ORIG-GUID: MPFatgwKBjpnRhr4yo_oiYkeGF7mvauF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130106
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

We want to WARN_ON() if info is NULL.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bind")
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 0d12454b1f2e..5c52d392427f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -217,7 +217,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 
 	info = adreno_info(config.chip_id);
 	/* We shouldn't have gotten this far if we don't recognize the GPU: */
-	if (!WARN_ON(info))
+	if (WARN_ON(!info))
 		return -ENXIO;
 
 	config.info = info;
-- 
2.49.0

