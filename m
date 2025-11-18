Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6557EC68562
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB55110E473;
	Tue, 18 Nov 2025 08:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSJrKjwo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4MR19Rc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD7410E46B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:54:09 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI6iAlT384611
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PrV6w/KNsg/+0gK7/2DObzlG/RNC5GFYtRF+8U90aj0=; b=XSJrKjwoVjc3E6RO
 PWDEeilTCueTASJKgSjrC3dJJBhl95aZ2GbxaMRERmW+cCH1EctTbG8YufS0NXS1
 elUEnVsHJfJqhC5O4e42Z3QfZsGtwJln1BhAzfla/PJE1oPmmGonbgBGJnSbG4S7
 uhsahzWLq29xyCVLAbR0KcDYFFgLR9PyT2/jElEqq9NmUl2UuMkvr9rGk13Xkm64
 jH+s/yuVabDyI8WYgBkIoNj+SQKARX4lmFL5hC2p8ZncvDbO7gXJ6XMvkfFdnf+G
 Q3gDpCgL2p23bFgPTwaXy804y7cUFKerC4U7LKdcxk40VWYDK7UWhQN5HiRg1zx5
 Z8Fmag==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8ht8j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:54:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2955555f73dso60590865ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763456048; x=1764060848;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PrV6w/KNsg/+0gK7/2DObzlG/RNC5GFYtRF+8U90aj0=;
 b=I4MR19RcLZGf0DjlhpZiwcJdK34Vq0/FKDFc8BtfyIr9BDkgaS2U/joSv3gaZI3MI7
 nhLNyJQPOC7/+2mGamhT7H6Mrjqrv0lSf1byBnIgx1g3mZuZ1DzGhDPuNTBLfcBhv+uV
 gCkw+y3j2poYB4YN+t/U7lKz9XH5YP++a/HESMkmEoGyhZC5lMgYkZls2ftjnYUZxlKd
 XHi1QFHTwrl+eKC0aqEsopJLSAWNAE4Yo2VbsW+7mAotboMxJlvPi/rpKzd3ZE6BBDWl
 3n12n+ZRYHScLiqfWYv/7wGD15d7C+bFqbvevREEzpn+FY/tzGnQPZxhmDjJRciFuVZi
 FTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763456048; x=1764060848;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PrV6w/KNsg/+0gK7/2DObzlG/RNC5GFYtRF+8U90aj0=;
 b=Hws5ImbXuZ6YucxYK92pben45nDDtWvy7KFOkT8vPUfxNlgu0Bsvsq+CRVnzeIC5EB
 OIh6iwOLBp0u+825tS1yVP2yQSyZ8iFu8l1mNhrn8hQBwWx38voAH+bsCDHi6k3lkcNC
 y1St1q6kANGwkiCFy18DsKU2R9fL47o9nk6jFJFxylhcyID6oDGsi3uthBYycGWvF4gt
 5b4pq+uO9SKRyBtk2w+JidGYg2NznbcQPsz/lrcC6HyyM0uRqrVQjB7MHC36ktQNP1o1
 us4Ki9rLwtEMN5B/ZBKsVXLgKuWZ5PCSXVNntub1umzZ/UEYK7nL2uxCsSOrU+c8Uoah
 6lvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqJ4OySxgFGCIgLiM6Nn/50v9sw1JvvF//2fljDxnnEPi8F88wUSf/Ufa16513MWr9DH8StbVWdFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQuXjlM0uvmBVc7DkjiijIj7ms7o5c8TfIO8l8QJstI0agPicO
 8e2x+soLNbjWCEfVLSamq3/SZ5ny8y1lW7P1m9+FS5CzGR5GhjeB0DWMPhU9IjmVqkXCrGdLh/i
 UvKkP95VBSkW9SosoTogkXt1/ahslpWlyqUKv65EGSZSOnaGUAGPiQtV9JVGspf0t8iNkI5M=
X-Gm-Gg: ASbGncui1K6hMcrmAE5CKMSki8nu0O6BBvGm5l5F5d5UU0C8rUjhZAVJmHRLFEYjdkD
 jP3YyER95PTEn8+E2xramOPqsjz2WGtbZITMPY6wXWuBP4OP5VlmP/hQ5FmnZa/UBTpu2no3cKK
 q9awZTke+EXGMyd36DxQ5he/4E1n9Swgx6j1O+CuSupHAwQawMQLKkeh16wXuRF/raWvANwtdwy
 yv93SH2mPUHhNtXDBJtKyRYPujAi0++TIiQJdr+iFE9Y681LtfSa70nuy9R+3Tb2CZ2jDjdcCc5
 Yb8MBMHzydQ6asr1vR8cnFnUWHyBWreqmnzci+NQQ4gFSJkYT82uGZwNVtB7TM3Q46sCywzy/8+
 4ECHn/uwFS91tT0kDTggdt84=
X-Received: by 2002:a17:903:2b10:b0:295:915d:1eed with SMTP id
 d9443c01a7336-2986a752d2dmr184977895ad.47.1763456048185; 
 Tue, 18 Nov 2025 00:54:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVjIlIvPTSiLdTNwr5hmoMfFZEBIQrZl3YPil3Ox+0tEXFjgQlXvbvrH6me3SXOyh31lsTdA==
X-Received: by 2002:a17:903:2b10:b0:295:915d:1eed with SMTP id
 d9443c01a7336-2986a752d2dmr184977645ad.47.1763456047717; 
 Tue, 18 Nov 2025 00:54:07 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:54:07 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:49 +0530
Subject: [PATCH v4 22/22] drm/msm/a8xx: Add UBWC v6 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-22-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=712;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wceYkLyUbkNoE/pP8sWa3zSzsulvkqlQyOrCItWxr1g=;
 b=ab9CsH8NF32fs2MhCaQYzdCr2lNXGHBIXRiN2OcE/b/eGPfTzV94cxPkR/EkNz+ftEVQXOWXR
 YhM7yhyZPncD+Uqsl3lAE5hf7Myb66BTpP+CS3Bd1dT6SCaSlLLFKhI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Wfh3ECBhhgwLJmhhPSLMsteoDG7K4mk7
X-Proofpoint-ORIG-GUID: Wfh3ECBhhgwLJmhhPSLMsteoDG7K4mk7
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c3430 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LUS0w5LV-g8XRIoliPwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX83Ortr/eFfZ5
 e9EdnjGTSDvGPatFyP11NW0qiOiSblveHRjpVgKP9qfQm9i4k1/BPvZ3UaO8TtChduxvqKtv+Du
 BuB5QE5tpcDXz64d27ZNe2E+m+sZMBnY57743hjm/V/f2Z/2ppLU6hK8oXBb5FogilN1biGShEU
 5fodHjps3j5lkz1aCCAPkwgKVI/vtg2kV9MeBEi2nHTmYZUP5Az/oJwZzRzWawo0zF0GHslXCDf
 dRwQaM5uRV05yZQDfMAE9oE/vuCA6TPcc6KPfLkq84pVhl9VH/05Md2IoQu3plz4XYpMheyx3a0
 AwqqtK1v2WHi66DKBqyBFpR1FlARGKeTr3K3iDAWFcxXkL29rBGzz2GGYDtjf00LRDN4Uumw+01
 4fgvv9MjysvpiF8Vadyf3F7H8ENiVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069
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

Adreno 840 GPU supports UBWC v6. Add support for this.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 30de078e9dfd..5a320f5bde41 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -276,6 +276,10 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
+	case UBWC_6_0:
+		yuvnotcomptofc = true;
+		mode = 5;
+		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;

-- 
2.51.0

