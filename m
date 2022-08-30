Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580105A5A0D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 05:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFD310E9A1;
	Tue, 30 Aug 2022 03:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F5410E8A2;
 Tue, 30 Aug 2022 03:33:22 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U1lI1Q012962;
 Tue, 30 Aug 2022 03:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=UscvJRCGL8aIhbEbnV0kRxJdqJmZQHUYzgxZBMlXxpI=;
 b=DRR9unyDTFyEr2j2r+XNCR5F7w7FjkZgxWNdz8xzL6J4XrBIvH6YhH6XTtmLSukEa11U
 3TFHkSisBKGGRuMitkdxgzgGMk09PNuPZR08cGqMa31/dPNxXhaSW0dzW8er8pZJIO9b
 U8Pm+MjP/X53OKoxPmOTJGVTXbm5j7GQY+Eei2HwVdKKr11gnH3VJ79itimlfSAFRUli
 +fIcncUwJTkDjXkcjjAbvDNme7nMijNnwqLmFBHxY3hmcTVeCdGRuZgVJvooqhaAQ2Fg
 hqZZahwvpRP2huB/agIDQAcfxRgJNJJXxfeBYOXNKTmIUcK/itcR4cs1g7GFbNHmt69M rQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j8w4ta5cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 03:33:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27U3XIER022174
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 03:33:18 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 29 Aug 2022 20:33:17 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC PATCH 0/3] Limit pluggable display modes
Date: Mon, 29 Aug 2022 20:33:06 -0700
Message-ID: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MeyFFJKYUBhB5TQkZtkNGcG4CXoHSwBy
X-Proofpoint-ORIG-GUID: MeyFFJKYUBhB5TQkZtkNGcG4CXoHSwBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_13,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208300015
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
Cc: dianders@chromium.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As reported on https://gitlab.freedesktop.org/drm/msm/-/issues/17, currently
there is no mechanism to limit the display output to the pluggable displays
and it lets users connect any monitor on any chipset based device.

This can lead to undefined behavior because lets say the display
advertises an unsupported pixel clock as its preferred resolution, then
the end-user can experience undefined behavior such as black screen,
crash or an underrun.

The capabilities of every chipset are advertised in the product
specification for both on-device displays and pluggable displays.

Documents such as [1], [2] and [3] can easily be found on the vendor's
website which advertise the max resolution support for that chipset.

Utilize this information to filter out the resolutions which have
pixel clock more than the supported limits.

This change only addresses pluggable displays because the underlying
assumption is that for the built-in displays, the display being chosen
for the product will be done so after referring to the advertised limits.

For calculating the pixel clock, the value has been taken from the CEA
speficiation if the resolution is a CEA one and from the CVT specification
for non-CEA.

This change has only been compile tested so far to get a general feedback
first and once it takes a final shape, will validate on whatever devices I have
and will appreciate help from others who have devices which I dont.

[1]: https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/prod_brief_qcom_sd7c.pdf
[2]: https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/prod_brief_qcom_sd7c_gen2.pdf
[3]: https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/prod_brief_qcom_sd8cx_gen2.pdf

Abhinav Kumar (3):
  drm/msm/dpu: add max external pixel clock for all targets
  drm/msm: filter out modes for DSI bridge having unsupported clock
  drm/msm: filter out modes for DP/eDP bridge having unsupported clock

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  8 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 18 ++++++++----
 drivers/gpu/drm/msm/dp/dp_display.c            | 16 +++++++++--
 drivers/gpu/drm/msm/dp/dp_parser.h             |  1 -
 drivers/gpu/drm/msm/dsi/dsi.c                  |  5 ++++
 drivers/gpu/drm/msm/dsi/dsi.h                  |  6 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c             | 40 ++++++++++++++++++++++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c          |  2 +-
 drivers/gpu/drm/msm/msm_drv.h                  |  9 ++++--
 10 files changed, 88 insertions(+), 19 deletions(-)

-- 
2.7.4

