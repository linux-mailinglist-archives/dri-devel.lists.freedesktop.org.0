Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DE3B3FE6E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB2010E688;
	Tue,  2 Sep 2025 11:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjBZ8smv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99CC10E687
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:50:52 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BM4Kl017097
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 11:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9Ecf2EnQwQu1LlRGQboGHCRDmSsyxJN4FsdN9WPMXtg=; b=jjBZ8smvY7EzlmxC
 vLwbTo+R9B1cZ29qygXVBlcbJtWwDCUVOz19v5dySma5+A3B9w21sgDfim6276Kn
 fzlJkMZ7jao9d22NjRllkIDf4DZvxtekR3zfOqWtLK2PT5dlhjQyST+1EAtJrN9z
 4LpgsRPBBZUmRLaWZHehbJ5njdJhmqYZArhY93o1Tf1euzb1F8nQORAdbBTZFp12
 AEr+MHCZEXCSw2AgSBAv8jxkrAJzUhEpl/OpsQfwxJddjddjfg54GeiUtRRwJ6sS
 IAYZ+Gutxpy11BUXbhsvgX22fBznE+JUEFt0hC5PFaaBFsGk3ECyyypeMhiKqM1c
 Cgwy7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8yf7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 11:50:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-244570600a1so65546635ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756813852; x=1757418652;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Ecf2EnQwQu1LlRGQboGHCRDmSsyxJN4FsdN9WPMXtg=;
 b=FPRZS7E9efcmozDl7Qn24i5pqSWJ4jyooAAvrVFyZ6msrPcvRLRwVI8ul5uY8iRT/N
 o7wdoOy862x7YqVnYb5fWPzOpkw6K0OKPahQDomcq6/ANP90eB7z7NgULjwotVdZVY9e
 +zEXGctCvCyc14UtYsJ+potxDLMF0pYQL9o62MVbsHjK4R4pwbYaIxFnBMUjK8D0bmRL
 46BzS3RAhiaAy9xmx7Yu9F+Bsse0dRaPL6bYLP+Q6D/PC7ZzhcQmXP9rE/ERHmH3gzsX
 wIHmQfM36V+n4IwOVBIMU0nK9jsNaRWUocAOrhGDsZoD0aT2YzMhBSLTya/wL1+yzqbG
 4tLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf4zfWircdBnGb4QBbST27UB/F8KoQMCxt8aOcigjxcwk0Mni6xUvNepb0OVQHvkYzF5K9Ce0jI9w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/mN6q+VR+o5LN9d94xjpzUheapJ3M8oUBEPE7i4DWZ4bC6jbu
 4Svw72ReW3MTLAcNpSVWOS4A3flcuSiIoeZBEkRSsIKjOnKF4tI3/oIzaH40nixWvVkpgilun2z
 /6p50w5/uSegnagdRuiJ1Du0Etw0j3f5Tnu3v+yTVtiiiKIAjsx+CYgqm2kaLuRZv2S9coo0=
X-Gm-Gg: ASbGnctACjfWADeDi+r/0VNYabRdNslKvvTROsNeknpw/4Ju33TDY0r4Tpy4+fepG+q
 8Mao4GYhBu9/Ko4BSgOZdmRq46aQ98h00CrG+va6/iCCzba/m7BQZEbHiwBY7Sl2euR5npQxj7B
 jY8jikNVtCt65t8dLloTBOIO9KmITGZTExurJ3geGgqFP3PuwE02TNTz0TX9x89qLCNMhSnfwWo
 ilYFRe+0SDzW+cM1NaAM2AW6iz8O6A7R4Ew1ydhhFAqIgqmRmUrwZzO9I0iPPYCqCJQf0K2La8U
 Oi9WsAugT89MLuBdvBVVPD5zgEQ6fz3nSxaTobDicpC0xiXSsv1fux+6Rgx37eHR
X-Received: by 2002:a17:902:e891:b0:246:2da9:73a2 with SMTP id
 d9443c01a7336-2493eff73d7mr150963165ad.27.1756813851556; 
 Tue, 02 Sep 2025 04:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe9tA9MOp9iJjbDEJjzynSMTlN4118IVJo0EM9iKkN4E39bGnaCYGlxUtOV+n/mB9jDr8Myw==
X-Received: by 2002:a17:902:e891:b0:246:2da9:73a2 with SMTP id
 d9443c01a7336-2493eff73d7mr150962885ad.27.1756813851076; 
 Tue, 02 Sep 2025 04:50:51 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:50:50 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 17:20:01 +0530
Subject: [PATCH 2/4] drm/msm/a6xx: Fix GMU firmware parser
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-assorted-sept-1-v1-2-f3ec9baed513@oss.qualcomm.com>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=1466;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=twGhxveDnx4sa4AY86Omvzu6sh4ndfEdD71Syjd0rOw=;
 b=9ysrXfc2HgE7q8Ud9ADJPJDqm3SHpwRv9C8hfpR3wt3KFdyZpE+MoLnjKe/XRgWoGg/qtW8Cw
 xWix1+PIdcwBtueU3gqiqKKj4HINkbU/zQsVGWnSrCRn7qlmE4rb5Sc
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: BbWvsbGfCBdsYv_GXgELIG4u6T4hi5hj
X-Proofpoint-ORIG-GUID: BbWvsbGfCBdsYv_GXgELIG4u6T4hi5hj
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b6da1c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gF2G-XVBjaN319PmpW4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX+vL9W/1OOwQl
 oac31a8IOo7yoL0vwPuqgxPXs5MFB+hT1F8uPKcS5RBYjFzgUCgslwzwDU4us082ZwDUk0k7lfM
 JpLrvrzHVodJJBsfHAZuElfVklviFHf5++y1wtjsOn0MRfVwD0ttbsAM87wAfUIpC5LUAJtrC5c
 QbWRyb+S1GGquY2ZH8xlXISYtfAieh7X3GGcrJgUSf5DNKqKw7Rfg6UuI8OQjphuD6OEwmRMHCO
 0M2IumC/ko8pEK4tWcKjKcqEqzPQFKOLUqwvbSAR34LlxiqZ+alwckz1IbJEfdYFNnSWQlCL94Q
 KGj7uDiuh1KpszNhBBTr51O/WYLs/ir7yqpIflRLyQeYJXrKKfhgoza07e90jc6YOhZ+5er0vJb
 21s7WVAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042
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

Current parser logic for GMU firmware assumes a dword aligned payload
size for every block. This is not true for all GMU firmwares. So, fix
this by using correct 'size' value in the calculation for the offset
for the next block's header.

Fixes: c6ed04f856a4 ("drm/msm/a6xx: A640/A650 GMU firmware path")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 28e6705c6da682c7b41c748e375dda59a6551898..ea52374c9fcd481d816ed9608e9f6eb1c2e3005a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -758,6 +758,8 @@ static bool fw_block_mem(struct a6xx_gmu_bo *bo, const struct block_header *blk)
 	return true;
 }
 
+#define NEXT_BLK(blk) ((const struct block_header *)((const char *)blk + sizeof(*blk) + blk->size))
+
 static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
@@ -789,7 +791,7 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 
 	for (blk = (const struct block_header *) fw_image->data;
 	     (const u8*) blk < fw_image->data + fw_image->size;
-	     blk = (const struct block_header *) &blk->data[blk->size >> 2]) {
+	     blk = NEXT_BLK(blk)) {
 		if (blk->size == 0)
 			continue;
 

-- 
2.50.1

