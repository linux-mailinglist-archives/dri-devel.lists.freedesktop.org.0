Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC6F8FD5D0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 20:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F5510E41E;
	Wed,  5 Jun 2024 18:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GM3vsyOm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF3E10E270;
 Wed,  5 Jun 2024 18:34:36 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455B1Pmc024196;
 Wed, 5 Jun 2024 18:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=FxUUnIPEm3fV/GcwwMgj0+
 14R+k3EUMg7IHt4M7PXuw=; b=GM3vsyOmpRvoPPOWLdOsXC2be2ZGq4aeOAyuD2
 tkrSzIzKefpB6yppTAKs5W8PZ7HgBGdwae0LK2cpH32mxACxaI0BqXr6e5QcSkiq
 iGyIlUO8beH7j2x+Jel43367JGC0nZSHr4Hu2q/w/GMRbVfIJS7MZD0u5N12B7vC
 kEjbX0qISl6cCv2ZVXZDpW6P/XvtvR9oDWwmcd4w0GFT4jdGYGjicmvf/6N49ne6
 08DsgTOj1tUWthGbZVHcdUJiretKGXojeggEG+M2Dd4qUKD2gKME8jUT9s8cZXYv
 TvQE0NVpoZkeCzZXsXtFKM/lquR3H5Ru0D+F0whzZ4PaDYLA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjabgtn9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2024 18:34:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455IYQNE026265
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Jun 2024 18:34:26 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Jun 2024 11:34:26 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, "Sean
 Paul" <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Connor Abbott <cwabbott0@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
 <quic_jesszhan@quicinc.com>, <nathan@kernel.org>, Rob Clark
 <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4] drm/msm/a6xx: use __unused__ to fix compiler warnings for
 gen7_* includes
Date: Wed, 5 Jun 2024 11:34:15 -0700
Message-ID: <20240605183415.259276-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FDllBJvY2nL5LcCcruaVBxUmXF_JeuVj
X-Proofpoint-ORIG-GUID: FDllBJvY2nL5LcCcruaVBxUmXF_JeuVj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050140
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

GCC diagnostic pragma method throws below warnings in some of the versions

drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:9: warning: unknown
option after '#pragma GCC diagnostic' kind [-Wpragmas]
  #pragma GCC diagnostic ignored "-Wunused-const-variable"
          ^
In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:18:0:
drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h:924:19: warning:
'gen7_0_0_external_core_regs' defined but not used [-Wunused-variable]
  static const u32 *gen7_0_0_external_core_regs[] = {
                    ^
In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:19:0:
drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h:748:19: warning:
'gen7_2_0_external_core_regs' defined but not used [-Wunused-variable]
  static const u32 *gen7_2_0_external_core_regs[] = {
                    ^
In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:20:0:
drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1188:43: warning:
'gen7_9_0_sptp_clusters' defined but not used [-Wunused-variable]
  static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
                                            ^
drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1438:19: warning:
'gen7_9_0_external_core_regs' defined but not used [-Wunused-variable]
  static const u32 *gen7_9_0_external_core_regs[] = {

Remove GCC version dependency by using __unused__ for the unused gen7_* includes.

Changes in v2:
	- Fix the warnings in the commit text
	- Use __attribute((__unused__)) instead of local assignment

changes in v3:
	- drop the Link from the auto add

changes in v4:
	- replace __attribute((__unused__)) with __always_unused

Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
Suggested-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 0a7717a4fc2f..59a4eb942b9b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -8,19 +8,15 @@
 #include "a6xx_gpu_state.h"
 #include "a6xx_gmu.xml.h"
 
-/* Ignore diagnostics about register tables that we aren't using yet. We don't
- * want to modify these headers too much from their original source.
- */
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wunused-variable"
-#pragma GCC diagnostic ignored "-Wunused-const-variable"
+static const unsigned int *gen7_0_0_external_core_regs[] __always_unused;
+static const unsigned int *gen7_2_0_external_core_regs[] __always_unused;
+static const unsigned int *gen7_9_0_external_core_regs[] __always_unused;
+static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] __always_unused;
 
 #include "adreno_gen7_0_0_snapshot.h"
 #include "adreno_gen7_2_0_snapshot.h"
 #include "adreno_gen7_9_0_snapshot.h"
 
-#pragma GCC diagnostic pop
-
 struct a6xx_gpu_state_obj {
 	const void *handle;
 	u32 *data;
-- 
2.44.0

