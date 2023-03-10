Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980EF6B32A4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E3910E2D8;
	Fri, 10 Mar 2023 00:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E421610E905;
 Fri, 10 Mar 2023 00:16:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 329Ng6Wm013284; Fri, 10 Mar 2023 00:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=rir9y2EyhyrfgN9ee77lQCoa3MAk5Q1iGGDNWwfGlBg=;
 b=UzQlma4VKhmn419WAxrmxZxqOGr159tVfBz5ovhjykSGDYcKLJCHBHYJrTs6Mi6kVRj+
 GFlGglZ3ir0q5v2QCvyxD3OSYZIn4jfJIORvebq/mSb1ubOWuju8rLOmwzrmaO8Gw33e
 TpRcnuLq2ay48PzUVjxvq7pI+rtXG/JddIF1VgRMsxmLo1ek53qoNsScq4EHI2hc5cov
 P8/e4cOFqHHzhun5B4LAAbK94fE4oOA2KL7I4Ttmv9rmrVNnJTWiqk99qG5UO1EbvvqL
 k0exEcLoiWGTRejr4JiwzicRGh99gccMzptfjqlWcqjRUKTgTS4mKc+Rm2HjclQQkvXq 6w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p7rqgr4p5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 00:16:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32A0GcjT009509
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 00:16:38 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 9 Mar 2023 16:16:37 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/msm/dpu: log the multirect_index in
 _dpu_crtc_blend_setup_pipe
Date: Thu, 9 Mar 2023 16:16:20 -0800
Message-ID: <1678407380-20391-5-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1678407380-20391-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1678407380-20391-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 91xzdcJ-iPglxjYrG4NTsaj8arSJMPz0
X-Proofpoint-GUID: 91xzdcJ-iPglxjYrG4NTsaj8arSJMPz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_13,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 adultscore=0 mlxlogscore=975 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090194
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
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lets print the multirect_index as well in _dpu_crtc_blend_setup_pipe()
as it will give the complete information of the sw_pipe as well.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b748c4f17c90..96ffea069120 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -425,12 +425,13 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				   format->base.pixel_format,
 				   modifier);
 
-	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
+	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
 			 crtc->base.id,
 			 stage,
 			 plane->base.id,
 			 sspp_idx - SSPP_NONE,
-			 state->fb ? state->fb->base.id : -1);
+			 state->fb ? state->fb->base.id : -1,
+			 pipe->multirect_index);
 
 	stage_cfg->stage[stage][stage_idx] = sspp_idx;
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
-- 
2.7.4

