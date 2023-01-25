Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543E267A7AF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 01:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD0310E27E;
	Wed, 25 Jan 2023 00:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F7110E0BF;
 Wed, 25 Jan 2023 00:28:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30ONp4tD003555; Wed, 25 Jan 2023 00:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RUdxCAgRvYjJfsQYHcE0KzbtswgbK7tcpIhB6iK5CIQ=;
 b=ZDcyJ7kT/lePr1KUwzeSBIWqQsFvRUQlNj+EMrWms3IDSiIbRp1AeirgFBfcp5MqBzfk
 J90UVMPSpMBTXRHoPX+IcN80YVcpHO+ja2qskKXVHWsLRgug9pe1QuCsdduiRACoa2iz
 qR+UoquNTlk0EfKO/RNQchlx090okNBE7yE5UWYT+X9avkS+IC2n7Nr9qDV1zWHL7fQr
 QjP+Qw7lG4jqNmpeYRhWExSpdzmREa2HkeqEqY0fyzjlIH6LdCMAPFvfhNXuNQt9zwG0
 1Oz9Hshpme8PgizlhDMvADmU7OMeTAzK089kRYNp8XP5V/SBORumGzMnN3QcCM51dBcE PA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nar2n854e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 00:28:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30P0SdHn024468
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 00:28:39 GMT
Received: from [10.110.33.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 16:28:38 -0800
Message-ID: <719feee4-f73d-5a5b-16db-31f9939b54c2@quicinc.com>
Date: Tue, 24 Jan 2023 16:28:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 00/14] add display port DSC feature
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, <dri-devel@lists.freedesktop.org>, 
 <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FjPHXHgTAGH7WQc5qJaVifgsGNLxGOpv
X-Proofpoint-GUID: FjPHXHgTAGH7WQc5qJaVifgsGNLxGOpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_17,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301250000
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Marijn
 Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry / Marijn

I have seen your review comments and agree there is much work to be done 
to get this in a better shape.

We will post a better V2 to address the concerns.

Would appreciate some patience till then.

Thanks for your support in reviews as always

Abhinav

On 1/23/2023 10:24 AM, Kuogee Hsieh wrote:
> This patch add DSC related supporting functions into to both dp controller and dpu enccoder
> 
> Kuogee Hsieh (14):
>    drm/msm/dp: add dpcd read of both dsc and fec capability
>    drm/msm/dp: add dsc factor into calculation of supported bpp
>    drm/msm/dp: add configure mainlink_levels base on lane number
>    drm/msm/dp: correct configure Colorimetry Indicator Field at MISC0
>    drm/msm/dp: upgrade tu calculation base on newest algorithm
>    drm/msm/dp: add display compression related struct
>    drm/msm/dp: add dsc helper functions
>    drm/msm/dp: add dsc supporting functions to DP controller
>    drm/msm/dsi: export struct msm_compression_info to dpu encoder
>    drm/msm/disp/dpu: add supports of DSC encoder v1.2 engine
>    drm/msm/disp/dpu1: add supports of new flush mechanism
>    drm/msm/disp/dpu1: revise timing engine programming to work for DSC
>    drm/msm/disp/dpu1: add dsc supporting functions to dpu encoder
>    drm/msm/disp/dpu1: add sc7280 dsc block and sub block
> 
>   drivers/gpu/drm/msm/Makefile                       |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c     | 537 +++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h     |  25 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 341 +++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   7 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  43 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  50 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  74 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  43 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  21 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  23 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  23 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     | 371 +++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 132 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  10 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   3 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   6 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  10 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  10 +-
>   drivers/gpu/drm/msm/dp/dp_catalog.c                | 176 ++++-
>   drivers/gpu/drm/msm/dp/dp_catalog.h                |  97 ++-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 839 ++++++++++++++-------
>   drivers/gpu/drm/msm/dp/dp_display.c                |  61 +-
>   drivers/gpu/drm/msm/dp/dp_link.c                   |  29 +-
>   drivers/gpu/drm/msm/dp/dp_panel.c                  | 749 +++++++++++++++++-
>   drivers/gpu/drm/msm/dp/dp_panel.h                  |  67 +-
>   drivers/gpu/drm/msm/dp/dp_reg.h                    |  40 +-
>   drivers/gpu/drm/msm/dsi/dsi.c                      |   3 +-
>   drivers/gpu/drm/msm/dsi/dsi.h                      |   3 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c                 |  14 +-
>   drivers/gpu/drm/msm/msm_drv.h                      | 113 ++-
>   32 files changed, 3429 insertions(+), 497 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> 
