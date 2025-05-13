Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AFCAB5FE3
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 01:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9A510E21B;
	Tue, 13 May 2025 23:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RW09l7vl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EF210E21B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 23:30:06 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DISIZn001005
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 23:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=9kw1tJ+fZlLjSs2Ct4UhM/
 9TxVd++C5yWC4uITx73v8=; b=RW09l7vlpXY5+Dfdol9YHPvQp9YsucwyxQ1mnQ
 Xs0GRsyo5cuRM1QX4fldPmhL7my9D2s7TIjhmtjrfAxMYc6ly93wB8EyyScjgKk3
 DG4JqNqvXdAONo+UABQlDfqAMBoJVH0XnU7UQehmPd/NKRL6lxO2vX+rfQT3oehi
 PVVtk9D2WOvSJUHwzndkVUoITdqc9dyEGHelo9dh/zRVZDJyTLcwrzBdKlqtWUr8
 kDwe4IHmHjC5sKfhhFDzS6Y0Ja3AuqSq8S0vrYtCxePQtrqeBCWbdlhbTkXxwXdl
 ALB0/3s13ScG3x7VTB1KIcBDFIq/YidGHIUl7oDcZqsSB7OQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr8q51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 23:30:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7caee990721so1355615385a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 16:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747179005; x=1747783805;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9kw1tJ+fZlLjSs2Ct4UhM/9TxVd++C5yWC4uITx73v8=;
 b=frsrLdq58/x510cDxbLwoG4nGQf+uUPqDNggLOjv+Bhpi52OYioIrcEH65IdDZYQSq
 /z1N5k3SurcuBkTO0VghRP+BHapE/Eh0TLGUYZ81P07KLvtyMK1XMdfirS6kEAyHK1/E
 vkNvhFV9BqJzD6K0TVYgBS8cNS5XtyeVyMcRQ1Xg05Nu1UOrtghxTsG4dOP24hTxUXsy
 V2dkhjl7q2mbeTUhSmJCBvkH5UuP8lGhed5e/oSD07mbwATMlyDJ07Cfgg697sP29U/P
 6KJyG27L2OisfJeI8yHH/8W9D5klkjwFYiC5m/wAkt2VBfHHQRO+2uYHytCUAECIRSMt
 Ifqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqHK0QWvHnodcXIcw41zakqYLmhMyytbyBqDTbNf2XsLQVwjGP2KtG67in86qxs0rQMMx/qOfbxPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzExi0LNBG9oErklyUShM79n5R+lnh+NgkJaPdCXINBRz0cOuLb
 d8GrE8B2tdzMLxmurw1THv5Aa0s8Nxe78uL64cMhiH32Q4m9JZpvtKrCx8hdZA+2fae55bi+gTP
 TbeID6IJi6rRyZLMGL3Zdhkq6+/VGUEn0UVuBCrhhCXNLovGBVai3tSbY3H7Bz7J8NRjRvg/Yrd
 s=
X-Gm-Gg: ASbGnct1EgwFSPrVflmA8zozfAKHdAePNgPfSSNeVMTedSx1Iij8wHHQlVOUIhus1HC
 KY+T9xJKuRHY/Gey4944tcC4sOaia1wAhKEhtdWFlUrtU35R7THOjIJF7LOXIGDOGJWVuGYlTM0
 qp3CU6r/XRk1gr+lu0Q2QPZEYzdgf/oJ9WifJSymVWQSQ5hJM5FyjRh53VZxEz3cMsznJH405os
 NnFcPak5M0wFFVwRM9EnvWZ22j2GZQVBfYKuz1ALFxPf6pkGObIAXd2hsZtTOUL0eNjnfhPHPCN
 nhcXNdtRXZdNEASjaiqKanTQLZrf9+HDasLe+radhE2CG668mx67BFFQynbAPISElRwg0vDXCnh
 YibiEZHPxcvJ0hkAO1EDLhjqY
X-Received: by 2002:a05:620a:461e:b0:7c7:ad45:b3d4 with SMTP id
 af79cd13be357-7cd28832c94mr210564885a.34.1747179004793; 
 Tue, 13 May 2025 16:30:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpnDrtMPY6cQ8xynl/hgQMZ86hVIrUSkBIdvk7KNw4pBWlsnsDSUVPVYKQl7IvTGOcZJUi3w==
X-Received: by 2002:a05:620a:461e:b0:7c7:ad45:b3d4 with SMTP id
 af79cd13be357-7cd28832c94mr210561385a.34.1747179004486; 
 Tue, 13 May 2025 16:30:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c33c26c2sm17934191fa.61.2025.05.13.16.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 16:30:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 14 May 2025 02:30:00 +0300
Subject: [PATCH RFT] drm/msm/dpu: enable virtual planes by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-dpu-enable-virt-planes-v1-1-bf5ba0088007@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPfVI2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0MT3ZSCUt3UvMSknFTdssyiEt2CnMS81GJd8yTz5FSDRLPkVKNEJaD
 mgqLUtMwKsMHRSkFuIUqxtbUAh78N7W0AAAA=
X-Change-ID: 20250514-dpu-enable-virt-planes-7b7ce0a6ce2a
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1LUajNbvybnKkxnxB8nGE1qDfFOK0dPtOLJKSSG9Rbs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoI9X4pcoyU/uZSpo25xT5kZjjrM9k/DGGXTpwN
 kNwXE7FjzCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCPV+AAKCRCLPIo+Aiko
 1bT+CACZMCems+sM/Qwu7e64/XI0cx6/aixT8cBMJNS7bOP7FFiLxSTwDupCGLBjnd9DHANBCOB
 TzgJc3lXaAZp4EB2pXrB6tZO5shx2hts44c633sXNGhEaI0zZG1GOokjOehFlpV8XQsT3rdbset
 GvGYfdYr7J+qy6KAoPgX02Jq0jlPU7p5dacBNptXj//a4RNTp5oDC7DnZ6mE4J5HxWVLXInHxM3
 XGClJQMc799EPmtKtvCOzhFH4A8L/zyaihIB6p2jfi+UWIrLBAyEz7gNn++iaHTr2n7rVrJXc5a
 kv++g1xB7RXyttdDR9DTlPzAredK8HaBxcIN9Sb6uWD0glvj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: nNc0GqED0pR3yGEp-ko8JdOFPxZiea3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDIyMCBTYWx0ZWRfXzHyWPiU2Rykk
 R7FC8ABho5dNl+GRr+o7lcTQN0nix7MhJ5xl+FwwlEp0L+sGY9lYxNfE2LvFhA1YIdpGO03Bk7q
 1nzKQxUkeTDTVoTt0pGIYKl31qwNKhQGtIyX+5maDcPwKUaZ5Zhkdn7Z5WatcsV2/eBWa+C5//h
 Lsl1PuAp1/Z5/z036ZYe7fnmcWC0CHJeWwzFyarrygCNLOhkgiAGIO5K5zjNtSr8md0FbfRCI0O
 Bte690f7mavZdL/tjIf1uOzHao808OMwJdHU3ANv7btIXzppCntEOgH+1h7QirGpim5YJjWnpXM
 TR3yTaN3Bi1ye+ZAFmJqIC4vaxUkHGzBfdODgGMHxbJKwgpYRNk93NFH9UPuPcXxa+gXhx22dAq
 g5yJP7ixLJ2aUM1QDTiexOcUcLQ5XW3xkun/Y/5FvvQrg7MrlTNW3/md7pya8UqFg90TlNeS
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6823d5fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=4RDPIAw37ivmvRzZDt4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: nNc0GqED0pR3yGEp-ko8JdOFPxZiea3t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505130220
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

Turn on the switch and use virtual planes by default, enhancing
utilisation of the display pipelines. It is still possible to use legacy
implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
parameter.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This is being sent as an RFT for now. Please give it a test with your
compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
the switch for 6.17.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1fd82b6747e9058ce11dc2620729921492d5ebdd..5c0ae6a15d0a55c7568bd7850509390a93cf2bca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -51,7 +51,7 @@
 #define DPU_DEBUGFS_DIR "msm_dpu"
 #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
 
-bool dpu_use_virtual_planes;
+bool dpu_use_virtual_planes = true;
 module_param(dpu_use_virtual_planes, bool, 0);
 
 static int dpu_kms_hw_init(struct msm_kms *kms);

---
base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
change-id: 20250514-dpu-enable-virt-planes-7b7ce0a6ce2a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

