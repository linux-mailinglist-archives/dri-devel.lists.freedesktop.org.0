Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BF16D21E6
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 15:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FC610F236;
	Fri, 31 Mar 2023 13:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E9210F230;
 Fri, 31 Mar 2023 13:58:55 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32VCI1bo023681; Fri, 31 Mar 2023 13:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=Js71QqueNw1lY9w3+9bRhDoCcGiBN6sicN22goZqP/g=;
 b=XJauhhwgOaBQXfNrxoWCLSezD1LNzFbsyuGHvVkgSeqr1LA2ZtgOxbKLyow5mGCEAfvb
 9tjKuKT8JodGd/ZN9DvPd+WBtYnlOp89C+o3OXIJ7elGy31xMODVg/N3WHc9/akf727h
 0CJmuWJQOZoAZSyFl8u7TQG+g5i+OqdDHd2+yFVr5wTYU7oAGZStRJnGqFPPuS81YNRK
 lA9G7VurISecEG/wzrSzm58JqIagLKxd5q21ugusdKYwCuKQzeyQu2b/RZi/kYroQy90
 oMvxxy8XMzT58Qr4xr3mv5F5JiiPZ2txvUdrhd1V3vOjiHsCmiI/sishODdifUDu4SFk yQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pnu6cs8fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 13:58:52 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32VDwpaA002708
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 13:58:51 GMT
Received: from vpolimer-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 31 Mar 2023 06:58:46 -0700
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 0/3] Fixes for PSR
Date: Fri, 31 Mar 2023 19:28:31 +0530
Message-ID: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cipl5w24uUFHSg9DMu_zpqF8gwhOLfbM
X-Proofpoint-ORIG-GUID: cipl5w24uUFHSg9DMu_zpqF8gwhOLfbM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=610 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310109
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

while in virtual terminal with PSR enabled, there will be
no atomic commits triggered resulting in no screen update.
Update the dirtyfb flag into plane state during atomic check 
to flush the pixel data explicitly.

Avoid scheduling PSR commits from different work queues while
running in PSR mode already.

Vinod Polimera (3):
  drm/msm/dpu: set dirty_fb flag while in self refresh mode
  msm/disp/dpu: allow atomic_check in PSR usecase
  msm: skip the atomic commit of self refresh while PSR running

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++++-
 drivers/gpu/drm/msm/msm_atomic.c         | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.7.4

