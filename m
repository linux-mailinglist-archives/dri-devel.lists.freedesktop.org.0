Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2E166E354
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5506F10E194;
	Tue, 17 Jan 2023 16:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA5010E585;
 Tue, 17 Jan 2023 16:21:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30HEbExR003566; Tue, 17 Jan 2023 16:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=cg96SnQCqORoWKdPdsLknlM+aptVO8mCOtYYDlx2JgY=;
 b=XmksmQGJat8kWnfxVIbK4EiyeHNk/px5J8lsPCZcwo7j1TlOTE88sTCmMGDF2JjqXpFD
 aB+tkfzk1Amogju1q6IF/NTqPP9roDku3zsUNew6aozUhFiJDFQ1JBAjzrNzEzqCnygj
 YDcuUDfcFHy+la0zS21tRHgbvnq70assq5edO1/ckN+0/k+kTY1HUWxeWoyhsHpxee9s
 A8TQZAGdgH4exJY+RTMSMUYutZNQJlDdlJjqTt+8lKxBK/UAahneMbDyBNV3hOD3SmSo
 v/AmqEU7aZZYwcn8npo5CMXmcET9ug224YXVsSIKfD0K9jNw2r3HtiCZ3w+zIjhr8tXX qA== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n3j3nnyya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 16:21:36 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30HGLWG5014779; 
 Tue, 17 Jan 2023 16:21:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3n3nfk7sum-1;
 Tue, 17 Jan 2023 16:21:32 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30HGLWg1014774;
 Tue, 17 Jan 2023 16:21:32 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 30HGLVJ2014773;
 Tue, 17 Jan 2023 16:21:32 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id B31314B06; Tue, 17 Jan 2023 08:21:30 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] Allow composer fallbacks for color features
Date: Tue, 17 Jan 2023 08:21:25 -0800
Message-Id: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cB_wSQ1_KLobwF_95PJA3bCadlxkTVGp
X-Proofpoint-ORIG-GUID: cB_wSQ1_KLobwF_95PJA3bCadlxkTVGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_08,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=530 phishscore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170130
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, robdclark@chromium.org,
 dianders@chromium.org, quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series will enable color features on sc7280 target which has primary panel as eDP

The series removes dspp allocation based on encoder type and allows the datapath reservation
even if dspps are not available.

The series also adds a check to fail the composition during atomic check , if color management is requested 
and no dspps are allocated in the datapath.

This can allow composer fallbacks for color features if no relevant HW blocks are available.

Kalyan Thota (3):
  drm/msm/disp/dpu1: allow reservation even if dspps are not available.
  drm/msm/disp/dpu1: allow dspp selection for all the interfaces
  drm/msm/disp/dpu1: fail atomic check if color feature is requested
    with no dspp

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 11 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  8 +++++++-
 3 files changed, 27 insertions(+), 10 deletions(-)

-- 
2.7.4

