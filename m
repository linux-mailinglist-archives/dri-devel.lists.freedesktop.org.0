Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5B4B186F7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 20:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F8A10E8D8;
	Fri,  1 Aug 2025 18:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqjb021A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CA410E8E1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 18:00:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571Hg9FY008601
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 18:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=0qBkf9JDSmf
 FwdkCS8a187SNR+0cTRqqV9Ya3fpJH68=; b=lqjb021AtTqCvnIJMJBuUKy1mw+
 SKPUHSZlPGv/P89wjiX2SYFjrHJfsfOrmAeW50LSXHK3LPcaZpjRUMIMiGKVv9l+
 fsz1dmWa9hHOHAGkgdauML9IhAYm3w2/cFdcuzXzn+uRAZj5ymAKCQ5jZtwCO/L6
 jh8aity2LH5dT6DNbCvbF5/07qdwLikc99JXmBKHqcSh94zDrcv8gWs/MFTAqQFP
 wRvF/F+jZsQXtqU9XGaAKaZ+WqcIE9sHJfO+kdHzPdMET3MbR9UXycmCFmo5ME8w
 C4BFLfa7v6ANOSZmRCZbbDFei+f0bYxtgxzaZhuyh5DWKCz7dPHV+OFRj1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwghc51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 18:00:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-31ea14cc097so1785161a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 11:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754071216; x=1754676016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0qBkf9JDSmfFwdkCS8a187SNR+0cTRqqV9Ya3fpJH68=;
 b=oP/QrFZ7v+ZvGQCv/f16u+T5sA4uH8GBHoAvqFGFEArlyP9U4BvRHZiptltGMS7YWP
 nvwiXQJT39biUgiX5eWX84XgXjPCDfky+FDGj1UBnEY/z/9xXwH/CD4UxeRrNxC71TI7
 aEFuUeov3+MOwAWO/2I1fqPbdn0b+3D9DC0cqF8Y/KbA1ca5JU3biDnegN1DlNeQ/yzL
 1Sf+RnJEw10T8ZLfpc3Lh7Oy0US8pk+lJIRL+dBjt6n78ANg4/T3NvLVcT2Fnv0SDcW8
 xx43yJraZkiBdoXKEKQLquODc8wPt0f3pSDUYZqZGvhlvk4MhJdVEK0azZzCXf6iHiHl
 CtUg==
X-Gm-Message-State: AOJu0YwnVFJFi61hfq4IY/ELd79ffz9PwvYkt7KYNJjFYGEOFUxBYcnn
 35riMVT+P7K3b4mDk/ksHVUSMKWwz9kPSx/pSdtKRSIuyt665PG97v2ioF5B98avBakS9oZqJ/4
 VktY2RL33KgXZlcid2YcNU30ovGUiJSXb8YmHMTy5loEI6ykPTc674+vhDSY4c0c9cLPsaPOLaa
 3gJKY=
X-Gm-Gg: ASbGncush9Q9r8KST3WBq18ZWF6F0GJ32+WSLnFRrFdZMHtdkQdpeNwrbla64D8zLFM
 gjG/yjM8Z22iYKK9uIUCvYhPOcVw/00oPQ/FxIu08KSlybJiRtR3etJQ1mIESOsoSliaiurFAcn
 wGu279e0QLoqdGl70svOiKO5BBNylL9OVYSUjCSHK5s+W5IdQXnxpvaCM2xlRzR4bsO8YdDVKiq
 vMOFoKorA8Y//1Nss5OK1p0+UDMINHmqB1fLc18zrfwWUE5q2PX6c3PEe6t5L/0bt+QdDwJypld
 ZTASR7rtRPWjATJt7nbS4lcdcrlxVE1tKE2MdJVWS9GtFwgChK8=
X-Received: by 2002:a17:90b:3cc7:b0:311:ad7f:3281 with SMTP id
 98e67ed59e1d1-321161f1e4amr1051152a91.12.1754071216085; 
 Fri, 01 Aug 2025 11:00:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCufiAuEtwIrk4MYNpS/nkKxgS/INszns4WCKtfrhQYzpgeLZK2wqU3sVv0g6l8Ck4AhkzDQ==
X-Received: by 2002:a17:90b:3cc7:b0:311:ad7f:3281 with SMTP id
 98e67ed59e1d1-321161f1e4amr1051082a91.12.1754071215565; 
 Fri, 01 Aug 2025 11:00:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63dc1bb7sm7971555a91.10.2025.08.01.11.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 11:00:15 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/7] drm/msm: Add missing "location"s to devcoredump
Date: Fri,  1 Aug 2025 10:59:58 -0700
Message-ID: <20250801180009.345662-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688d00b1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=YFM8xwheDJGXjHaRWHsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: aQlAwxDkdvRV8O_VWitz6DtyJQK4JMuH
X-Proofpoint-GUID: aQlAwxDkdvRV8O_VWitz6DtyJQK4JMuH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfXzgg8Xa7Qu+fa
 dTRAcbpKJsxBIRrXBHZ4bb2jfo2xy0a7Ej+IBxsNDlcDnhDnm/QQLhDROuapTsbWmBGUpJp6k4a
 /LIwZMclxWISY2uZNhjMkUnOCNr6ZM//Y08IIcDp2Jkhz52b2uauwfZIky/Or1l0YhsMf4oabKN
 w2mSw7w00d85Enb1lT3/Mrp51elJTdxy8wZkoDZ2YX6ARwtSD5FjxXa2l/c/H4QAMwIwssrJJ/Y
 4PeauK/BMb4reHR69QJBFrMgYX2JskXvBMNG89BU9zNVv2eus/iwMbfWCtACol9ij+2oOz0SDRD
 fgcJTkcqT/+z7zXEorqi2gO4oUSZmqhjg3B47wLwfiWlonVl196VJvoMZybo06GQ6Q5JyQl+3uI
 4gJUrqCxWgsft/UHrWssk3e1u7q5nqf3gLQYlE0n2IGu6z1ATtzirkn35GHqRyAwrWb82PNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010138
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

This is needed to properly interpret some of the sections.

v2: Fix missing \n

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index fe38ea9328d4..a35cec606d59 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1800,6 +1800,7 @@ static void a7xx_show_shader(struct a6xx_gpu_state_obj *obj,
 
 	print_name(p, "  - type: ", a7xx_statetype_names[block->statetype]);
 	print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid]);
+	drm_printf(p, "    - location: %d\n", block->location);
 
 	for (i = 0; i < block->num_sps; i++) {
 		drm_printf(p, "      - sp: %d\n", i);
@@ -1877,6 +1878,7 @@ static void a7xx_show_dbgahb_cluster(struct a6xx_gpu_state_obj *obj,
 		print_name(p, "  - pipe: ", a7xx_pipe_names[dbgahb->pipe_id]);
 		print_name(p, "    - cluster-name: ", a7xx_cluster_names[dbgahb->cluster_id]);
 		drm_printf(p, "      - context: %d\n", dbgahb->context_id);
+		drm_printf(p, "      - location: %d\n", dbgahb->location_id);
 		a7xx_show_registers_indented(dbgahb->regs, obj->data, p, 4);
 	}
 }
-- 
2.50.1

