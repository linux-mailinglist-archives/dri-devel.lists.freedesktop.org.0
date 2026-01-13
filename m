Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818AFD1A765
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F0910E533;
	Tue, 13 Jan 2026 16:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiJRy9dc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cluB3sGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35CE10E52E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:45 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DFYt3U3727188
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9ln+HxvUbm17UzFH53D4M7bFPebJ/beboKgAcEXWZ3Q=; b=CiJRy9dcnIbnk+bV
 stUMsfuWAJaVHkzK/H6VNN7SccgDAczR5qhRgLCTZGxqQZVJUCCLhaDANk7VttEX
 c0gtwreQi1LkwG577E0zK+IJhLHeBMwAdminnWB668LHCsJsmVqm3Y0SxooNfXYm
 3uzqaF0n23FjmhMMBmSq/IHI+SMRiatrYatE8DaZWREJfLMYH/qhyUSJzRB5D530
 36QJ3x5odjj33quKOqo5/PHN8WqAExkfs1DMbMnvw6sQrr1IhG+pvIA3HS4hbcS8
 /6HtUD0U5TsdTGoRoHwz9RuBIHLQu5RAX9GeMCzwo1iJNLrIeuX9V+7yjms8uaQA
 jEPBNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnjnu1phd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c52dcf85b2so101949285a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323464; x=1768928264;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9ln+HxvUbm17UzFH53D4M7bFPebJ/beboKgAcEXWZ3Q=;
 b=cluB3sGvFmOzOYSql/pN/3BTOkUxnyqfApYCBDeQ87NhlYJ+xb8Uy+sJf7BZwC1/p6
 3SgbaFLtuwLuNLxJ5kR1KaGBU4KysOBvwmiZrb4sF2TjIjd0nh3H7eVWWuRJ1A8zqkfq
 GZcmeJw95qck+HMOkFclaJGSqWE51XqLyg9wzNGsHiZG4F1kH5VmUIq1s1yk8rm1axfi
 W/wt9jR/9edSP/2lo8gHTFEA7fBVTqO984zMqrjtKVox6eEw1cAjdorHkMEo8w3ol0i/
 etWjDW6rRb2ETf9+OSeZ0UVTvsz2SNnX4HR4gDbSnlQ13IYtfF+KQ3Xl0p4y5P4jL+uH
 S2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323464; x=1768928264;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9ln+HxvUbm17UzFH53D4M7bFPebJ/beboKgAcEXWZ3Q=;
 b=kc9vhiIlGVLnHAj5HJEZyqVcfpOVX+r1l9adJYQMLdYkE9Vv36Fucbnm6espIsz7r7
 4kzXvHv9emeBjUnU5nwUtknAFcs3F66QIK4tkHQSh7A9BtGftWvXDoa5iH8icM0CgIMF
 0w88IInXKs2vzwIVGrMXsrb4eD0W14Hdh65wjunNyAhwJQlPDqdeZXv3/KFpfx63e6UU
 Vo1RLDJlCoEksj5yfqblDEYcJXw9bqQE71qSCFzK/bnYmbnQmjyVd9FTxc081AqOXefo
 I0eRHJ4VmpzkMLMYjK2+GrlYQLo5k9RebuD1ZO9wZeryDuKY+wxPeiIhjstBomirh86e
 WTWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt7Z+K1nhfL36TpaN5nLYtXbBWQ21vcqDswxYv0AOR4uCwv3/opCCvIj94klrKg2755ZovT3trTJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/v98WM1zAX4f/vwB6bfETawSBgiDe/aquc1UnCqXN0B9VUBYQ
 ZIAxUoayO0T09/iAHqHnP5mYr5jp2eIpsIQ9JK5HpZZZ8jEmVhTDjYAJJd4N5pbqAkDEibJLQrh
 3HGB2/vPsw/2sorIsYe/hPRi9NcXDVRPnIDsMp1UI3QGl509a+Y4P7DRLcoJXCTo8ZLL3/Is=
X-Gm-Gg: AY/fxX5FyEjESyL98RJvHbl06Q02OzgHysqu5bmzg+9OaW/UGi+6c9ocBLs7SCMh18n
 RWe0NgyWiqqBEaokpw5Wte8+B2FntmoHQDq0GX7cH+MOEiuxavD1BUjsLfDxavtgf8babaPjv/M
 htfcm683/jiALvq+OKqnbONiPsjbgMpCUgVPqeLI+W9KkqHMJosh8SXQSG4BtAngK+BQvY0JhMP
 BM1X6wMEbRXkQE+ApxZz2Pa1XskdKvNupdYme0q3URuz7TJ4oL1KfPpxXVabMnmFtp26C8UuwJU
 sfEpLbNqn9KXXVvQQ31kzWSxRdINpqUeGaPfrznBiOJK9A0JtDJ2+530q9oL0uGBhvjmx8zLDvQ
 j5UG9W/VSFj56g1D0feX4mugO20t2zlS5vPzGBwalrv3jmxOIgDmjFV0X+ou9KPDeDBa8WH1xqu
 URa5O2lFGGnKiuyvd+LD3KzPE=
X-Received: by 2002:a05:620a:4508:b0:891:a6b0:7cda with SMTP id
 af79cd13be357-8c389421ca4mr2991197885a.81.1768323464074; 
 Tue, 13 Jan 2026 08:57:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD/VzWtFUF012GOVfTS2hWslL26e4LFDs4fm8YOUqIn+Z0vpR8oG7HeQedj+KqHXV1pPkbog==
X-Received: by 2002:a05:620a:4508:b0:891:a6b0:7cda with SMTP id
 af79cd13be357-8c389421ca4mr2991194385a.81.1768323463585; 
 Tue, 13 Jan 2026 08:57:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:26 +0200
Subject: [PATCH v2 11/11] drm/msm/a6xx: use new helper to set min_acc
 length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-11-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h7MMn6eoIT/MLTtBQ0NByysAANWVyaCDgHBC25L6vPE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnl0qQzEujC0Os2qq3L19Z8ETx14X5sDCLumN
 QrOk+2NC6GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5dAAKCRCLPIo+Aiko
 1QNbB/9KFj3Ho6JZZambhNWCFaRf5CMzHvKhgD6aAHu/3jrbNWTIhWCZEZ6DHPQ6+581Nfl2fBj
 ViJ8+XB6bNZOyMTaJjbOzcvjWXi30dI+b4P2hH6cuJjkyH8BPxAMbBMQ6i4bgLZzYCYGEa0lp/N
 Z6WvrkerxNaudzOyUcJwlFnoLhzy/Ehvy0bSnKIO6AMEGlWbGjGSVZBaQjd7jp7LC/j3GlGhndR
 Tn35YWUmeO+YHWngHqxDCxEWf8qZDMgq2R0JNdeNoYsZvPcfyP9+UaXIm6IDzoMJwLDeeeJGE8o
 7am1BUVE1uZ43IdeV1qn8nBJTqu+EVGZUR5LSraprkj8zXjp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Vcl0aMtMOuRrVS1TXbYlr5TYmYVMEM5Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX1p4SiwwWmWks
 9BIOHqt9ulMaYzOlqYgNDpu2Q2uXXnKF4bMitmIPx4t+F/pCaaIt3AhUePzuFxREY3Spgne8LDk
 CFRDPT8oXnaGsj2sfN/1Gpnzy2EYixK2rS25RMlN55dV9VCk3Fb/1ccGssd44V0HKxBq0qrDK5P
 X2gcEXqpZBHNpWScjcZhcwT8VRg5cRLG7mMvtO0G14aR5PhJNnHUURaft7HQqBNOOa20/8IGH4Z
 C2fX9h7SghSWmQfHjvyOwzcqd/Fqr+42cC1We22YljLh3gkLo4O5muBn2TYIicfA02L95rDxA7+
 MoZ1spsMtOo55CO075mHFNoK8VV45BMUyeHsxKbUy6ziO4dzcdo7l4eXYiYtJKsx8TNgunvEH7e
 F9Y7ASdnFw3OTYarQ1v7LFHNOiZILBwl1SzEdNO6A6LlgBwIdGaO9DQLRZxT/BNK9IUt2Zfl8O6
 rpzNJjH4pKDdhreeDtA==
X-Authority-Analysis: v=2.4 cv=RMu+3oi+ c=1 sm=1 tr=0 ts=69667989 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Vcl0aMtMOuRrVS1TXbYlr5TYmYVMEM5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

