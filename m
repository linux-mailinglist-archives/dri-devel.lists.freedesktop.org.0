Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7557869108F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 19:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDD710EB4B;
	Thu,  9 Feb 2023 18:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6E310E7C5;
 Thu,  9 Feb 2023 18:45:08 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319Bv9Hr012155; Thu, 9 Feb 2023 18:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=PuAvhTo3gOUBcF6f35bfnZSpq+fKOS5K6rmXprV4fpw=;
 b=MtLLRlIParTTRBBIGsTagmjnV0EVhFjPor0th06PDnQgrnvUkWYLPa4t2pdsaNUSD/2m
 bAfxCRmEobsrgpKDYEC3+DiHg1KO6qBIQA+gorWHt8WbrMZq4ZgDCPsfrcau8nHV4Uvw
 f5np1XmhdqvMMWLg4PvZ5NyU1dPoOo91m/Q7V/ei5ZXRQywUID5XvAGijaEaaL/GR7ob
 Y10qjso1HVCv96Ei+MZJf1ViOa4alBhCx3hwqibZjh4sMgjoTWtOepZ/P1w5qyfQihz4
 laEuFTJqlfVMQvdVKPGbJ1p1DVYwix9yXtXf/3ndhlJeTzurG/xUe8UlL9KtgXuz0oC0 BA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nmpte2861-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 18:45:06 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 319Ij55q008313
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Feb 2023 18:45:05 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 10:45:04 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC PATCH v2 4/4] drm/msm/mdp4: Remove empty prepare_commit()
 function
Date: Thu, 9 Feb 2023 10:44:26 -0800
Message-ID: <20230209184426.4437-5-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
References: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LwFg8V1Rc6Hy7sI3Jqmnq9eNCVxut-hH
X-Proofpoint-ORIG-GUID: LwFg8V1Rc6Hy7sI3Jqmnq9eNCVxut-hH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=851 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090175
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org, dmitry.baryshkov@linaro.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove empty prepare_commit() function from MDP4 driver.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 9a1a0769575d..6e37072ed302 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -84,10 +84,6 @@ static void mdp4_disable_commit(struct msm_kms *kms)
 	mdp4_disable(mdp4_kms);
 }
 
-static void mdp4_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *state)
-{
-}
-
 static void mdp4_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	/* TODO */
@@ -154,7 +150,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.disable_vblank  = mdp4_disable_vblank,
 		.enable_commit   = mdp4_enable_commit,
 		.disable_commit  = mdp4_disable_commit,
-		.prepare_commit  = mdp4_prepare_commit,
 		.flush_commit    = mdp4_flush_commit,
 		.wait_flush      = mdp4_wait_flush,
 		.complete_commit = mdp4_complete_commit,
-- 
2.39.1

