Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A7E73AD5F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 01:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED51F10E5BA;
	Thu, 22 Jun 2023 23:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFB010E0A1;
 Thu, 22 Jun 2023 23:50:29 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35MNb9rq015791; Thu, 22 Jun 2023 23:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=S7tSUJnPn1dEzpKf2XgWOApz3pVTip7ZL3T8bKa5CHc=;
 b=PcCgbVulhQSvpozQk8I2Ezf0L1saeGAp0zjU7uRGGsuX3QCm3068WZADpbwE0muKBP4r
 jje/mubZYeqg26OYzpQz2aZ8f0vIyhKU6UzkcBw6Wv7bm2NupejJJVmnAGxkHloHh3bv
 63fg+qMyaO1+FDkMGxsmehgHd0NyqqT9jCgLSQOSQ+gumwEAdUl4zuecI92Gpl5EkjaM
 e70CA4sCPQ8vV+TFJYKj6IKHuIBbfV9mrzcQefHUJFvCJoEFxVaqiUWD6wGaBQogFvWc
 cVcA895otqhANDct2/52DcZShSG1ru57IxvpOKq0Y+cPxAumgkm3UAwHnEqV9KpUtH3D Ow== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rc6b2bfv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 23:50:26 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35MNoP11024816
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 23:50:25 GMT
Received: from hu-rmccann-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 22 Jun 2023 16:50:24 -0700
From: Ryan McCann <quic_rmccann@quicinc.com>
Subject: [PATCH 0/6] Add support to print sub block registers in dpu hw catalog
Date: Thu, 22 Jun 2023 16:48:52 -0700
Message-ID: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOTdlGQC/x2NQQqDMBAAvyJ77oKNkJY+oU9okRKTjQk0MeyqC
 OLfG3scmGF2EOJIAo9mB6Y1SpxyheulARtMHgmjqwyqVV2rlUJHq52Y3JLKp5jZBnT+RnevvdO
 dgtoNRggHNtmGs3y+MEnCTNuM3yWZ8XQKk4/b//vuj+MHSGGB34cAAAA=
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-8a804
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687477824; l=1750;
 i=quic_rmccann@quicinc.com; s=20230622; h=from:subject:message-id;
 bh=E88LvHnVfsIwBxX5au8105/4Zv5bvv3I2h+zxYlOCBY=;
 b=L+m23s/ufPuFXEJGhMF8B51F3f3aKv8nuRs5+XNQhv9eeIofW86ro9RCqDLvU5ZUaWtbOV84m
 Wra59R6lvMBCNqOu+VR98r6RDRaLxKIM56gs9fdC71cI/+Qce1aQHYR
X-Developer-Key: i=quic_rmccann@quicinc.com; a=ed25519;
 pk=d/uP3OwPGpj/bTtiHvV1RBZ2S6q4AL6j1+A5y+dmbTI=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3WXUgvl2XMAJTcaNye_gkodPDx-dNWRB
X-Proofpoint-GUID: 3WXUgvl2XMAJTcaNye_gkodPDx-dNWRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_17,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=785 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306220205
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
Cc: Rob Clark <robdclark@chromium.org>, Ryan McCann <quic_rmccann@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The purpose of this patch series is to add support to print the registers
of sub blocks in the dpu hardware catalog and fix the order in which all
hardware blocks are dumped for a device core dump. This involves:

1. Changing data structure from stack to queue to fix the printing order
of the device core dump.

2. Removing redundant suffix of sub block names.

3. Removing redundant prefix of sub block names.

4. Eliminating unused variable from relevant macros.

5. Defining names for sub blocks that have not yet been defined.

6. Implementing wrapper function that prints the registers of sub blocks
when there is a need.

Sample Output of the sspp_0 block and its sub blocks for devcore dump:
======sspp_0======
...registers
...
====sspp_0_scaler====
...
...
====sspp_0_csc====
...
...
====next_block====
...

Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
---
Ryan McCann (6):
      drm/msm: Update dev core dump to not print backwards
      drm/msm/dpu: Drop unused num argument from relevant macros
      drm/msm/dpu: Define names for unnamed sblks
      drm/msm/dpu: Remove redundant suffix in name of sub blocks
      drm/msm/disp: Remove redundant prefix in name of sub blocks
      drm/msm/dpu: Update dev core dump to dump registers of sub blocks

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  90 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 194 +++++++++++++++++++---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c |   2 +-
 3 files changed, 214 insertions(+), 72 deletions(-)
---
base-commit: 710025fdedb3767655823c3a12d27d404d209f75
change-id: 20230622-devcoredump_patch-df7e8f6fd632

Best regards,
-- 
Ryan McCann <quic_rmccann@quicinc.com>

