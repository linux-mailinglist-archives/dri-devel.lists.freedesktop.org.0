Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E19D0DBB6
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 20:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EED10E257;
	Sat, 10 Jan 2026 19:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGIbUD+g";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXeKbHmQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422CC10E267
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60AHw6WN3945099
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3MZnpYwI4AmU8ANsdt4IQetHLgrS69gpAaiV0A4L6G0=; b=BGIbUD+g0rST4H/0
 s+fwuFwEO+V7UWy9ZYxzanQD0tevxxu8zdc5G/CXdCLVk1bCRPK2GI1Y/f4lZ1MJ
 5TAnuANtmUMfvUmbmEFOTrVI5g4uPTVw1cuI0dL5XLqYySOgH1M1fXdKY0KJiLeW
 YMHX6jWZsrxFMs5a6TFAnolwIqs2BGtnVbarfXXLx8urJrVdKBxdxVHikPf6HApK
 jDpq0203gSs3aIfvOsiAmUJqSJU77qCRQbfEozXUpY4f2QJ1RYYCbHNzokpcZ9HZ
 288QB0F4J8VDQ/mJc3xB3Ko/1r1K8lFS9dTqA02wpP1EAl5dAtgGm28OFKRHDnoe
 vXhE0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf5795qp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c38129a433so1383475985a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073894; x=1768678694;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3MZnpYwI4AmU8ANsdt4IQetHLgrS69gpAaiV0A4L6G0=;
 b=MXeKbHmQKGZCfN5Zr0mLX7VIL2Uq+s6wvy0dhXpL93qieDd4SISlVvftvaAuJHgcH2
 W1oC4eGAQ0nOqVqORjj9xD5FvtSdRkotzZnwTjylGbdZfV8fYNGFIk2HwL5nVvm3Wb1K
 ou/vz95olps09bMqJjhvRfIl4svseneIG3GHyrgAUDn1dR3RnIDEUQ682TDXbSpNA1fs
 n0RPg5dah8TjraATPKUk5ODigXeRg1hgbUVUqeRgNyMcIH124Ro+HKsX1ncjggFeE1/N
 mDsf/KMoDAVWs1lBRzywVsKzJOrDXV7rfj/vxjFHhCSPq+iEpD9Lor3R/c1xbRfdCKb4
 hmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073894; x=1768678694;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3MZnpYwI4AmU8ANsdt4IQetHLgrS69gpAaiV0A4L6G0=;
 b=tryQ0Jns7cRpivyVyaiVh/U9d274efTrVQuOjxywcR0oATJ1EtzPiBCQqp+g/MmrAJ
 hq5AcTDx9FtyfnOJSKuK8xQqt6LtThC/hKhJ9KMYL4wqb6Wi4LqsBxvJ6hwGORuQFGX8
 /Kl1oletkITaBLFSxQCQuJD6YH6OTk2wLegd9JQcwAvXpwmv2WtFASvGpdhsDH+NOHEj
 VmYH0Uj/REO9eY4qvm7yIzuVaq71+dpsffFhjnelMkE/kzcuyjSp/UrSNKP9afYobKgD
 Se4LbnEqGjtfPJssPtf5q+zQlelRuKWZHMTwYgz6S/MNOCI8TSI1wrJOn1nvDK3nXeoJ
 AmcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgGx2yGrqMiiHpSOIHbDLnO6MYHJg8W/1Nhra/tmKm2sls78p4DFMPmNbmMCY8a0nEsPS7zKLc/o0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpHkbk5z9K9KWj1MsfF/9Lt4g6NeU1FhIRgxMgoRKtnCZz1wO7
 T3wQN3aLZCQwkD7TPezwGwOS3dpxNtPwP+RuCYjoAWKkEALCBYzfRtYWxQhNldR/TivXBZvyhRB
 ujFK7SF1NKeRXLjr7jEyRC9KAlXiSLxAztLOlDJmdGgyhaGV5mYTPQnrxU9NPCqlwpd8dKso=
X-Gm-Gg: AY/fxX54rp1R/nqMSBy1s6NvXKSxVq08v0Py/hA1eK5Jp3xif027A4U1pXe613k+J/r
 qIEc8e23MUY0IYT2gdkPSByWRrcDdj+xQVuqslB3R6ZYfPyf18uUucOGPQocvn4RZBxuZLFeC8N
 gMi9npnUpvFaIXeAc3UtIuXa2bMVBnWoMIXU8AACQAwJKdowoZI+IjyM/mYXc7wA+E/zZCLDEIm
 WvORhOwJSWBe3F4GhLA+Qo2tgXXP7e1arh3ln+AArZrziS6mSWiJ1XI6PlzT/riMiYhdFJL83OP
 LeFPhROkqcf4awumOMW9YqOtYTXTsBnpDLRgNPVbJjM+BNTlKJv22cDRP9CJm+8lbJ9AKKEp8Da
 XgdRxuhSX9o8If8Aisq00XjQ0cN79NSScbWw+nr6ZHzNytK/OHQibKHo7EvFWQsapNl3PPmeb3P
 1nnlE3ykaN5PIcbFdbIQ/NioM=
X-Received: by 2002:a05:620a:4607:b0:8bb:a346:8c84 with SMTP id
 af79cd13be357-8c38939268amr1573223385a.30.1768073893680; 
 Sat, 10 Jan 2026 11:38:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6d8vv7wylVfOWH9XQwmhfMHQFtcvp3+FKXUkq+XGELB6EtqNJ4uUpNaqA9VrR4pcXeMsvqQ==
X-Received: by 2002:a05:620a:4607:b0:8bb:a346:8c84 with SMTP id
 af79cd13be357-8c38939268amr1573219885a.30.1768073893190; 
 Sat, 10 Jan 2026 11:38:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:38:03 +0200
Subject: [PATCH 11/11] drm/msm/a6xx: use new helper to set min_acc length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-11-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mAfr3Sv0Osg0wOtrPrsuwPv22YVUtw2MtmFVrPEbyq8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqUQ96O3LFNjh39OwqvwVcUbZj9dUUmpcH1J
 kW0A1CPy/eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqlAAKCRCLPIo+Aiko
 1Q2vB/0cdBzIwbndH4UQREwf5CUHqbknV4FAHJoUp5nO2uiqTVR8KYcDVnNu/4bKaMWr9woUW8t
 bF33MrWi+KMVp1eVQm2pX1121AYflOiZrCRIvHZN2hZYrurraQMn2mDTXnhU+m1NC9KhXxBwwRv
 PudYpa2EfTtBI+yk3QITE49ai9QD4EC3nKu6S/PgWjUvvcOi70Q+jtgN5iNkPjO9XzCikktzLfT
 lhv8kOuKWh2o3wZqkIVUz6wACkmV0EWKGfSFKdv70gYqRh6UQ7CnlqC5llSFJM5IX2vdNI0B89e
 CmzEyN6Wq3HSblaiiSn6JxcgRLdg6ggEL3OfDMOpM8ZYyg3N
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6962aaa6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F1F9tmq6QbaLjm51Hh4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX3nXy4yenMfqO
 d6Plcb13Nfa/Fnlj74YgzM7wmXKqVG3O+mkLbAfTngiHGHdGCj/tb8cnmq07LrSaDDOCHGdYMAT
 taUviuU/Tsicnk8SsEv41JOOjsvJX+tOyK5It0S6uOcpVTgufk4yeMToLqqm2Cze+HhxWOjiV9P
 KnHe1z52oRatTEjfUM0q1V85u1nY0T8nzuW37K+vrmKl8lhSIcpWcE3o7EQBV/1r66Tho/aI5ji
 1/IhOgkpIa2blPJILhp4eO+JO9z1xYQ6PchxyOKidyyuSq1Ef4JgnnHAg6+k2L+yVc0YYkXXExa
 9WY44WfYLGWBdflywhVu4spDWvrE4yXuxz6xmbqRK92yJX1yzfhPjVKyUlwJaQyGpAtSSVJb3Pa
 4ZHLYU+Rq5pr94kUAkVrmTrlfXIXO+zKiRpWweDwoU2853g5A1bg6J+E9AyCfZ8ZL2HI8LbviJS
 rxSCi+nVZgbijtzL9wg==
X-Proofpoint-GUID: 93gWbjO4xEXA825l8kGZAg16lttkDBUx
X-Proofpoint-ORIG-GUID: 93gWbjO4xEXA825l8kGZAg16lttkDBUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173
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

Use freshly defined helper instead of hardcoding the checks in the
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2129d230a92b..04de4d598da0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -820,7 +820,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
-	bool min_acc_len_64b = false;
+	bool min_acc_len_64b;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
@@ -828,8 +828,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
 		uavflagprd_inv = 2;
 
-	if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
-		min_acc_len_64b = true;
+	min_acc_len_64b = qcom_ubwc_min_acc_length_64b(cfg);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |

-- 
2.47.3

