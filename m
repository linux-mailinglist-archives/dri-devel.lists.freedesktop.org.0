Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDEEB0B5EC
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AB010E379;
	Sun, 20 Jul 2025 12:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpSL+t0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A22110E44E
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:44 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K9jq1I002154
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ofDofdzCPVMyjNC6oHyPmSF5XE7uMFwOH2VSJyJTTw8=; b=kpSL+t0X+VTqmfqT
 c2f0IZ+qkOAgDrsZGF2kMOPsNS02qyarYBl8Om2IgKbrlukyqREtOzxwtG1kuNaI
 Y4UDj4OcL2N9UA6z5m9rjL1v5Ay6wpWc8AEUcVGg1O4GUzuQidhAx14aMR5+FbDn
 c0sDFBnF76FuJL2/VHY2lf/YMDJSTkcQy3o6UURWUHTpLTkk0UTfk5Rk0HovbtY4
 3r14Yy6zkk1Ec25pLmiSZjOWEoPi8lFhjf1y/CvrrXeOJwcvmN1GDCN73Lk4ztu2
 gCziGNMme/dvqeFmvrc42redOInDPL9nF+eWrNULzfzW1c1SkEONW7i7Jg8sRt1C
 1KSjfg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044fa75u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-75494e5417bso3299176b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013863; x=1753618663;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ofDofdzCPVMyjNC6oHyPmSF5XE7uMFwOH2VSJyJTTw8=;
 b=NLjjtidfKIZ3pa3QU5lrOnrS45r9lnrmFiQD9b27jS9f7+1W/ehM4pX+JkHtqfG5VL
 ekrO+HqfQN+C33Kboe9GiIkNIFFKiyF1VsoRCXl1ZLVZu6aLeienUdRokxMx396l4/jZ
 pRt+UghXmD9uptt68nmiA3THWyvnMclMvWhDGyA5ytwoWMimVpzDUShK9nXuTMGJ/2vj
 nxPFSQOowG/iMbILqDNuc10EDogdUeZDeSf+Z71ZVEJOKAPexWWBoNaNw78dlzf5z7+Y
 zY923Of+Z7MSA+tCaG4m1bkYoR9TwmkbR6DI2vvHR245RzdbwCExl6QVlueYwsw5mtLg
 RFvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm8zkQK/qUum96ZTi6qbB4txjIbior5e4uQ943wIGLd7MAvN1YRFaOxb0R/TQt5DG0pRrrz1UwY/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0O+Ai/JQpvTU1oPxtIALV+KHVn4IAQaPJbgcdLWtDJIZNmufk
 GewtQPrf4AmacY989V35E75+QZwcehi5dQ7g4j9Hka1TeliKclj4k3004m1Ogj/MrEOATy8oqrp
 wey70vfOJ5K1SmzAHJ7tGSh3xzVoT57SeuaYD98Ep8MLJdOzdIql+ZuFOEBiIUgt7wkmF4Rw=
X-Gm-Gg: ASbGnctlLS/RTrmLKj6wNJixZ3f6WfVoZ7Idh5kKZW8kdjD3hMfmQzooViDi+vNX0Ty
 5LG6WmfvXUA6fHeBc8+oxBKqyAhULC/ncWGX98+Ac2TMI/AkzYPuvf/TQo16KH/H4/I8g9NTHXn
 1+FARtDXIcmQLAE5vW8TPbC+dVtYKwOpqXS9Vx/rZcnUQLI8MYqQGRgf4DPkh7ptNtNB6FEXStn
 2oq6wQoF1wYnKjb7+SP2AWFf34z2uJxbvIUqcbDj+SQ1NCg+FLbtZ4zW4ib4pBRDnsqfkg7gYxT
 /EJWbv0qxbaixJrRwjVTOeBk3SRZuigQ+C1tRczAOu0GC+4HmkgXRBHxze7seUsT
X-Received: by 2002:a05:6a00:9189:b0:749:eb:22c6 with SMTP id
 d2e1a72fcca58-759678986ecmr12599041b3a.1.1753013862983; 
 Sun, 20 Jul 2025 05:17:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmonQVHr4Bjv8W5fko1GeaHvzAIAD8dQNVPtEbw4P9/DZLSf2HcJy5PQKUDsuSf2r4OOuJdg==
X-Received: by 2002:a05:6a00:9189:b0:749:eb:22c6 with SMTP id
 d2e1a72fcca58-759678986ecmr12599015b3a.1.1753013862475; 
 Sun, 20 Jul 2025 05:17:42 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:14 +0530
Subject: [PATCH 13/17] drm/msm/a6xx: Fix hangcheck for IFPC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-13-9347aa5bcbd6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1726;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=UufTwoFz7ovGUA5R50wL9c78uLvl6377i+fkOk6Jefs=;
 b=CiVkKyycAjZFKjOMucGztI9T7mQEvFBYqWl/BB9hRnOWHJ1sN/2PxQHpgp6pXN3QaATDYWvrR
 h4znFJ38/PUBWDMBMqYvqyGNY0QXINe0yb2jEOge8498e2dGzdryR8t
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: UvjYaPdh4zJdOC3x5lmhsD_fpNHpNfsc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX3l7wyMCPgbSr
 Huuo+TCeXVttx+zGsErrLQLMc1rt9LXGGhufab3FuKvudKbd5ZDKeIi5e8CMBHHRrk3QBPd+wXz
 CfRgZDjuccqc/JNq2IOFK8mOPIRw9352AtTg3m12pwXGMUGXDoFxXK0GzoOy+3yk1DHQ1uzeOqN
 3cSkXXBUU8O+q9J8QszkIzp81FT3yZ0kHPS98mFFMIwh0JL3bzivV4KusOQXdNv88qFT+vwtD4T
 d1G9buXu1hAu6Kq3v7lU6rKN8YA/u/1Liv7EqJm3RIqbx0NkMumPMi94RJrk58qU88kWMuNRrOX
 KUt2KLAQrMS6RSbftlBt3CvNssBy9COwslSHkZTxAVNNpWrJidr7g+71PrQs111BCldhnMd71Z6
 QGZuLZMrpyGqPKQWqivU5oWdH10DFe/SHln3lGojuFUSdQl6RfryrEmBo1l94MHtQI5+xj2V
X-Proofpoint-GUID: UvjYaPdh4zJdOC3x5lmhsD_fpNHpNfsc
X-Authority-Analysis: v=2.4 cv=YtcPR5YX c=1 sm=1 tr=0 ts=687cde67 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Q_N0S3AoeJwl-lDGPIgA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=743 suspectscore=0 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
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

From the hangcheck handler, KMD checks a few registers in GX
domain to see if the GPU made any progress. But it cannot access
those registers when IFPC is enabled. Since HW based hang detection
is pretty decent, lets rely on it instead of these registers when
IFPC is enabled.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e331cbdb117df6cfa8ae0e4c44a5aa91ba93f8eb..b3becb230a94163cccff4eaffb8eed44f1c29ad0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2399,13 +2399,23 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 
 static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
-	struct msm_cp_state cp_state = {
+	struct msm_cp_state cp_state;
+	bool progress;
+
+	/*
+	 * With IFPC, KMD doesn't know whether GX power domain is collapsed or not. So, we can't
+	 * blindly read the below registers in GX domain. Lets trust the hang detection in HW and
+	 * lie to the caller that there was progress.
+	 */
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		return true;
+
+	cp_state = (struct msm_cp_state) {
 		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
 		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
 		.ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
 		.ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
 	};
-	bool progress;
 
 	/*
 	 * Adjust the remaining data to account for what has already been

-- 
2.50.1

