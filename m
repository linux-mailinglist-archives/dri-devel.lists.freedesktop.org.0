Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A113C6B329E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400D610E8D7;
	Fri, 10 Mar 2023 00:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7D910E2D8;
 Fri, 10 Mar 2023 00:16:37 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 329NHIHC016042; Fri, 10 Mar 2023 00:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=3XeeKoW+8v2vcpHYM2XLOPfMthPlULcELZuQTL7yVdA=;
 b=mHhF3hrRNAHjO/4Uo9T19AlTHuppqB8Hsqz/IBp7h3fooz3DjPWIbbLezvi6PuSiJaum
 79TZpaZokRj0zWz3DWPy8WmBhtC+k49zDp1tP+0ZI6KRwOrB4qAQhflniH1ZUIF6xiyz
 Kb+DUdpVoipvXiIbmg0v1+XymuGhy2zX5fNFBUom4q4J+KtOfQH3PTQPgj0sL4O655lk
 vJ4p2+exPFHLiBufts+TlbujVrO45+68jAkG+akqdVIE+2YxuLPMl9ClR5pDSsCIinf8
 w/QYl3IPWwGdoTy0EogezWckTSXdpGvBH0jdjRvTniArKCy8n3pVBa9yetDBRxDyklcs rw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p7juts4rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 00:16:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32A0GVmm017458
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 00:16:31 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 9 Mar 2023 16:16:31 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 0/4] drm/msm/dpu: wide planes fixes
Date: Thu, 9 Mar 2023 16:16:16 -0800
Message-ID: <1678407380-20391-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: f-iVWRE12-dzGoHLGK2EyvW4tqD_uSR5
X-Proofpoint-ORIG-GUID: f-iVWRE12-dzGoHLGK2EyvW4tqD_uSR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_14,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=735 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090195
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

While validating the DPU wide planes series [1], some issues were seen
so decided to send this out in a separate series.

Changes include compilation fixes, critical bug fixes and cleanups.

These can easily be absorbed into that series as well but for the sake
of having a clean series and also to have a placeholder to push anymore
fixes/cleanups while I continue to validate , sending this out separately.

With this, wide planes works on basic homescreen and some of the testing
done on sc7280. While I continue the validation and find more issues, will
continue sending out more revisions to this series.

[1]: https://patchwork.freedesktop.org/series/99909/

Abhinav Kumar (4):
  drm/msm/dpu: avoid checking uninitialized plane format
  drm/msm/dpu: remove unused dpu_plane_validate_multirect_v2 function
  drm/msm/dpu: call _dpu_crtc_blend_setup_pipe for r_pipe
  drm/msm/dpu: log the multirect_index in _dpu_crtc_blend_setup_pipe

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 115 +-----------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   7 --
 3 files changed, 6 insertions(+), 123 deletions(-)

-- 
2.7.4

