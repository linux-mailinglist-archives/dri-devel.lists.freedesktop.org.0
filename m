Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765D36814D1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 16:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F9610E277;
	Mon, 30 Jan 2023 15:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D4589711;
 Mon, 30 Jan 2023 15:21:43 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30UDZcdH021495; Mon, 30 Jan 2023 15:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=L9AIHrzPObiEg8iX+Q9mRhYtMsa2DNoNppfxH9yTVJE=;
 b=d+A+nRglxXVTV2TnSmmbqNcG//8LwuCvgS0EshyFuEYw+M9HTidtVJP4HHwzSLypbgbZ
 WjWQwr7MgMUF53Wei3d3y5UncV/Ud0LO4mrtZ7SScrZNGEnxgrgz104+7QXB45mKDWcB
 1qalzMLZGcpSgz5TT93WXzp1P9b+mb0HrlVu9HGQXg8ZYgRrwwLWD1B6MJwt7VgYaJSc
 Y2c7F1IgqMKcsuTyatqPZ6HHh6Ab2/amHDHNaPOTgVIg5Gxsbc2nI1ia/eiNDT+jei/y
 SHu084uegbOMAg0HOx+DHvFmQBV0ptQ7T6L3w2icXZougzfufaVvSCv7quz0uFdvWVT1 CA== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ncvfpbt94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 15:21:40 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30UFLZFK027518; 
 Mon, 30 Jan 2023 15:21:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3ncvsk4n3k-1;
 Mon, 30 Jan 2023 15:21:35 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30UFLZ1U027513;
 Mon, 30 Jan 2023 15:21:35 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 30UFLYIx027511;
 Mon, 30 Jan 2023 15:21:35 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 0FD3B4BA5; Mon, 30 Jan 2023 07:21:33 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] Reserve dspps based on user request
Date: Mon, 30 Jan 2023 07:21:29 -0800
Message-Id: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: XJ7YuC7qwxbWQYLfEdKwc_x9_115BZCa
X-Proofpoint-ORIG-GUID: XJ7YuC7qwxbWQYLfEdKwc_x9_115BZCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_14,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxlogscore=685 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300148
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
 swboyd@chromium.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series will enable color features on sc7280 target which has primary panel as eDP

The series removes dspp allocation based on encoder type and allows the dspp reservation
based on user request via ctm.

The series will release/reserve the dpu resources when ever there is a topology change
to suit the new requirements.

Kalyan Thota (3):
  drm/msm/disp/dpu1: clear dspp reservations in rm release
  drm/msm/disp/dpu1: add dspps into reservation if there is a ctm
    request
  drm/msm/disp/dpu1: reserve the resources on topology change

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 54 +++++++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  6 ++--
 5 files changed, 50 insertions(+), 17 deletions(-)

-- 
2.7.4

