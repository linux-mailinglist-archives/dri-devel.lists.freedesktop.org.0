Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C0ECDCBEA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 16:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC88110FEF7;
	Wed, 24 Dec 2025 15:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1vPqkrm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jg3S05Km";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E14910FEF3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:36 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO8ld1Q1206755
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=; b=C1vPqkrmPQ8EOKdV
 9t8CJTtwYStkgR5EM547ilIAjZu8XQgTv0aKTYkDxAKDzYVaGGDBWPM7joNzhvMi
 w+HPpGXf5pfAIUdBQEld9btArFjUMFixaLUDURJTW7Yb9q800V/0qsVExSvTjPyP
 6kW/IunB93/DrwQALwW+hyRSRCz4by40MKoGndCS6anWcJkDafsMjnfyGL9gNgsv
 oPs6Cko1EK4Nz6d6kIAdWKiVbY4CtWQnbbwdBbSeUFRzch2LF7JGTFIzHDhYb/O6
 xcgDmtQDL+jTmcWIHk8ahF33SULriSUpWzRoqxIFbQHw27IukSjWnLghsleYRhdf
 kNAYMw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r2gmj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a32bd53cdso216021206d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766590954; x=1767195754;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
 b=Jg3S05Kmn4Rz+sMBiaDpBBRHPPcvCc+DrjOwJG5w2beSIhIpDpgJv+ij7y6UcM3xWp
 wpIEwI5Ymxd6BHMm6rgPDpfY6UsJ7O8gikRVOFSvF3pW+U6NPKxDvD77u6yjKhxg5ZXn
 Mrf/5dKfyOWKsZvLOU5ZqpCjqQJNhEkBrjuJlezIN+HELnTRM7yzJ9XzbAOJ/8WbikoY
 GIldIrlEktbrarCb7G/9SPG39AKhJk5J0qMSFHZ3X27K2XIBTQ3Vwogi0HUfGVZriM0j
 MwZmLXDK69ptnqqbzMbu5p6iPjFweZeKSjQEsIRE/cHa4XhSS3dJyh/lVoS6OJyukos/
 m62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766590954; x=1767195754;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
 b=PuR5GyC8LClc0KJOyc4c4VtQptBN1N5aYKIOK1ibAjiIJO580VdsLTNYdF2ulTqJws
 2+mEZpSb/gqVG5KcfFEBipBg4PmBvCgiT3DZAIgOalhh8OHRjUkU+IjnZFmOkGgVi//A
 IjQX1SM23TAkUAhqANYll/lgVu7imOkTmSZdh4Hr24jBj/+PWzWV5nH9Oy70rYrHlA1B
 1qz7pLEGIaP1e8febvJLZY18YXTYOY4ZIMxQnPzWfxJkv+VGRhKsy4UhTh1955Bpjiuf
 WHeX3W3DSpafrbBSMcjQr5dqAUxw9HUVLIRffU3NcYAfRTf1TrF2aM7pDGT9PtgF6QWj
 nKhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOOCTiRhvMzGv/mwaYnaeoDKxjwzMVNtk6VYxG3775gOKaTxNBy+cQAGP5DPKHLcWDZnVuuEQxe/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFY0CiDiY1TJ2HfUDvfncfdv781oUCb3m5e69TkkSWW7IwToSM
 VCd341SX056oA+Vds8dPBgOBXXYwML0fUuNv4zi+0bXFYrsRyS0IGdME8lFqRTO1UEUj6GcP+1R
 0GjlF15P1+gInWwKSycn1KGA+vSw8Yeyw4GWTPiWWvF1XmuE05QTyqYha1TEgpZsMs2N/opk=
X-Gm-Gg: AY/fxX4cjYnal9QnrgWt7oH0RagdqVLyTT7zlpc5WF5r563gqxDPxkcu26sVWV8Y8j7
 W2GW5TNLV5/KSo+TSAz4lqPwyI0dHiMNreNoy0/8KHgthwZVTpTepFsvOvmIFDV802BgvqxAZnW
 9Q/bJswRO9EO/kAXq4Ahs2y+FBXJRxSOOPFDxyoMUMxFQ4AFh53OETdZm6pTW/oeT6xdGyjkn3b
 ourv0geG5YOaq0jBlfUOf/HOZ6oZwFOd+BZR2SGPkhXPGU6Dk9r+xCsE9rsQsXYFAjiqfg7Om3/
 TeYF24GyrHs79hOE5B8M8O0cAuWE9Doz5KIBsvEU2js4HijcRo8VEeBO4+w2W6kjpP0yoR8WtcR
 otgPJ5NpCib9GBkUZuOLV2IXfL3M6ng8duE9aRXmlxvTIr2gqI48UQ2rBg/uKfNB8UB1XpuPOWg
 JdsEX8oBs4Hya6Dcjxt8/7sb4=
X-Received: by 2002:a05:622a:1aaa:b0:4ee:1227:479a with SMTP id
 d75a77b69052e-4f4abdd1c34mr264654971cf.84.1766590954451; 
 Wed, 24 Dec 2025 07:42:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJUaulADrZuO1E1rW2ACXAChMyl7OHsok4EwpCYelhHOao/akwZn/I2B3yyVgUqAj/Qpchlw==
X-Received: by 2002:a05:622a:1aaa:b0:4ee:1227:479a with SMTP id
 d75a77b69052e-4f4abdd1c34mr264654761cf.84.1766590954069; 
 Wed, 24 Dec 2025 07:42:34 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861f2e6sm5071562e87.69.2025.12.24.07.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:42:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:42:30 +0200
Subject: [PATCH v3 1/3] drm/msm/dpu: drop intr_start from DPU 3.x catalog files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mdp5-drop-dpu3-v3-1-fd7bb8546c30@oss.qualcomm.com>
References: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
In-Reply-To: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3891;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KGT0ib6f0S9x+W7J89kuc0HaNX2OlP5UrNenSreVEj4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpTAnnziVXM9tBiur/oDhZRvJxxsxCPopAEmiGt
 2MEGkk86pqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUwJ5wAKCRCLPIo+Aiko
 1d7bCACvxx6Jb0d3zC1nbjim5Ae8mQk1udJasKB08xZ0ijR08IxUFrmLeIaiubgxLVhcG4Kbnpv
 c22USuQpHqJHXMIXwmCfvDGpoQcGZSahvx1JIamkDA6Zx3hYZZrcJ3CWZbOeSwKEUWspVqO+QjD
 VKM2MF+2TKvxiC1/Ve0S3nQ62khUCnvzqvO5piQGtqiDZzEaxlffUTFSw8YZIxRzFlRE3uqCxGx
 KCNkZ3frm9K24UnpsnxOdN30Ca84DElh+CkljqsprUZw76UokPej3azZhkycGl5mht7YlvFeyUE
 KI5hck0RZ5iIzl6vKN/3mqYOjXjhuP14CmCpm+pj8svbxE49
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: zguyBsLVCsC5GcJxbz7vd9qZ-c5m265B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzOCBTYWx0ZWRfX1Na4MmwbKBZZ
 KJRGZ0bc2LoJ6wLemd1waMisf6+W998BsUFZseekbmKrgPpLFNfCror2JZK3MBdxZi+wgHJe7yO
 qyNT8OD1/Kjn8vyBj8UJiJXZ/78ck62mLQ2kz4ASiGms5iBGbwIUoiqJ//rBkqQcIY1sAP85HVW
 +k93SpvWI50V2lLKxckoqDs4GQ4fJAprwAARm/eJ3uqQ6h9aA2waB9Z/nF2OLmBKrMu32PPTlzD
 hZW6U1gMPuFeOA7+S1tezXu9aycGniRlSLeLlqLYmv6+PHvlQ1r6h8cjMcm96TtK4qRg14Hmtb0
 LJMTwKfVq1Hq+kiF4ZQTcnH1vo+g2yRkVJh7XPh/ToQATHHhvDreqgF87f2Du16aNY7zUT4Tej6
 81ZeQw3Zpv+UnV3t7PpvXO4IZ26GeJkkBIjh0t+/XFlsl6a9PNj2yg7nykJZ6Ky0rMQG+Eq58Go
 YBLT3OL2uie9937FHWA==
X-Proofpoint-GUID: zguyBsLVCsC5GcJxbz7vd9qZ-c5m265B
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694c09eb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-wdOMmJq3JXEukoY-DMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240138
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

DPU 3.x don't have separate intr_start interrupt, drop it from catalog
files.

Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  | 5 -----
 3 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index f91220496082..b1b03d8b30fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -42,24 +42,19 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 8f9a097147c0..64df4e80ea43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -37,24 +37,19 @@ static const struct dpu_ctl_cfg sdm660_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 0ad18bd273ff..b409af899918 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -36,24 +36,19 @@ static const struct dpu_ctl_cfg sdm630_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 

-- 
2.47.3

