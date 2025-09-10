Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F9CB52297
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 22:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2090910E9E0;
	Wed, 10 Sep 2025 20:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHIvGWYD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE4310E9E2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgEek020770
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R/4Wft3ZFrBLCsBTvaTSzzDE7KvwF9edeAejAQ+B/BY=; b=HHIvGWYD30VWgh/x
 Y0GCG10lxYMkR+VEkiKxEny6Bw64sbPG9PzUNDVCF4cqgtSS5Ircjgk5HVzq5D+H
 NfoOrx9GGORI+uC6UqxqhhpCpVhygozg5sIw4RbB54EasURackySToq8mI0nmYrN
 lHSlQZa+CxDOc84l5j9B7GPDCQ7Wq7dTv7RkmV0owc2uhjOfRHcEMKnnhcTJ8eG/
 3HLjhmFD/qa0zKBbneoR2tmySKIYv6Oq+CWl71S/w1NlBog3irsytiQnhxQefaD+
 2WJwJ/eu1yXBRltpcIMW3OP8sEXDhaVJ0aW8jy5+FQa4UzO+dv+WOY0wzh9RZcfT
 Oru9Qw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc299r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b52358ededbso921023a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537077; x=1758141877;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R/4Wft3ZFrBLCsBTvaTSzzDE7KvwF9edeAejAQ+B/BY=;
 b=SnINFIt4n7Lr6tzjzurd+5AhNeaqtlOd2gHdhsEHU2jBbaH37dBni5jXMYlWv/1pop
 A82qxDIorgbe+G+TcuE1lxID/5FKkc1RC3JVeEkLesyIDuq4h0M2RtYW3DIEXLxJx0kM
 WwhpVzwNTmHxmOtBhgdXKqUWoBHi0eL/IlD4W8uU0MxMOGiPVzIn4sDGmEEGOHSBO5tD
 LAvX8NnazYYZLUld1Ft5YSG1LQP4iJJvE2Yzf80IH5gct0jiysl6ZP/F3Durv5RswLNK
 N6SycLFeBOitQPCgdtDQjlziVRUGbdLIc1gTk6Kk0H5GeUxCEUmgd2m9ggbp2iROGEZ5
 FQlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3wBTbRd8MBc4Pq+B5JCHPGa40exzA/cJzVxRDXg5ARlRcJ2e/C9KAdi0PFvYNo37PhUS6+N48A6g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yysoz13fyVsJNCaaFj5CxBdod3qJRkfkDl+eS1DEC6CeKi7fnWH
 p7MXJJHgIMOApM8muOkzzFxqVnNjfsnCCroLn88xKwpSEUVVyLxJBS+xMCOfT8hD+FrZDprvlCX
 yKL/ETch54N7I5lPE8qRO6D3OLseisg0Mbs+Sc3BoJ23jAKZRPILT9So8Lo7f1E3s1ClOQg3GKQ
 PcYeQ=
X-Gm-Gg: ASbGncuNsX/U0YCN3QyWBGocgrHK2ROqlPPDCed8sCdGOsX82DWmd5eSA3BAGSj9T+a
 gACFwRvTxYZTHy7m6csdxEt+/2dtE0zV/El/5HUp7PjATeCriFLf3WmHq+Osg6bPuqVDCetRp7A
 AZRS+3bTE5YCaW/t59QuZzIfLKIbhPMPEkPT+iaCaBJ7i7faF5pobxQt7CRkxc0I5j+O4oux0YT
 YbU3ny11Pf2RaWXEcIYk8PHzZd5LFEfSBnf/wzBUf5HHoLKcEJz7WICaCJHaEpNt7uQBxUQf046
 BAyDVpFrbdToGKAg8dMnGeh+Jn+pNot9aMvSqvJE0FM75evKxX10H87Lifw98jpZ
X-Received: by 2002:a17:90b:3b81:b0:32b:96f2:e2c9 with SMTP id
 98e67ed59e1d1-32dd1dbb188mr764764a91.12.1757537077225; 
 Wed, 10 Sep 2025 13:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ34b2+3kXaCBM79RfDIeYcFfBZlEs+rc1jvA1GOQktZ1ERKp+SFIbOTtPjv3X0doccjwcwQ==
X-Received: by 2002:a17:90b:3b81:b0:32b:96f2:e2c9 with SMTP id
 98e67ed59e1d1-32dd1dbb188mr764732a91.12.1757537076739; 
 Wed, 10 Sep 2025 13:44:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd61eaa42sm46771a91.5.2025.09.10.13.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 13:44:36 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 02:14:05 +0530
Subject: [PATCH v2 2/4] drm/msm/a6xx: Fix GMU firmware parser
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-assorted-sept-1-v2-2-a8bf1ee20792@oss.qualcomm.com>
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
In-Reply-To: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757537061; l=1478;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=QH5mzD4A8ywK4YBRLZvZeIsieAJxopW4JPv0czcGn2k=;
 b=E/JQ2p+GzDCp/eeNWvlYpTUdKgONOclrECZtOlrFo0XCQnrPuI5PqEEU6YFEduipWLvfU2Wdh
 vzsHgYpuTkTB2Q1CS2zJyzIgbG0fCoHVY2D4nELZY3onLWrozaS2Ia+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c1e336 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gF2G-XVBjaN319PmpW4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 8GnkYPp7pX5dpPwHf7g6pwE7Jxv6_FFN
X-Proofpoint-GUID: 8GnkYPp7pX5dpPwHf7g6pwE7Jxv6_FFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX+q1Y6BJGuJeU
 PPb6H6/XJojihBsPX0RLFcpYMFR8v07/EWFEFEF8SIzRRp8yxJEiqUO2rd6YKmXDa9xmw6YwyRX
 B8iQvdmmBYc32Gg+uc/q3ja8YTzIdCl+uMUHuJ2qAvCtEBtDEyeZ072TEbnUKk7LjMay7YGNEn9
 qVHTuGQle8PiW/QkaieoSvBRPpG4ndqsZjvtfrOMyQr8QnTzF39pBvtqRyOGENn9rKI/d455S0B
 vm5d17kO9es4qEd9i3ldzCp5zfRbrS1rOi2K6gr6invBqAnqE+5QGcHR//vvWNq6oIXhoFqvsSP
 6KXxSaUJT1G1ue92hxdzkq1efCi55acrL4MTMvYoDeEbw91vB2IN7HdQnNofMPEN3AG95YZ6SKm
 dgjNxMdy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 28e6705c6da682c7b41c748e375dda59a6551898..4c0510cc784864da990af8cad086176a5d92ae8a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -758,6 +758,9 @@ static bool fw_block_mem(struct a6xx_gmu_bo *bo, const struct block_header *blk)
 	return true;
 }
 
+#define NEXT_BLK(blk) \
+	((const struct block_header *)((const char *)(blk) + sizeof(*(blk)) + (blk)->size))
+
 static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
@@ -789,7 +792,7 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 
 	for (blk = (const struct block_header *) fw_image->data;
 	     (const u8*) blk < fw_image->data + fw_image->size;
-	     blk = (const struct block_header *) &blk->data[blk->size >> 2]) {
+	     blk = NEXT_BLK(blk)) {
 		if (blk->size == 0)
 			continue;
 

-- 
2.50.1

