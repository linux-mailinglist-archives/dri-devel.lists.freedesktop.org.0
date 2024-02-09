Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1738E84FC2B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 19:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC8610E2DA;
	Fri,  9 Feb 2024 18:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Gtx1iKMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8519910E0CC;
 Fri,  9 Feb 2024 18:44:04 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 419GL1Ah004579; Fri, 9 Feb 2024 18:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=cjKv+jVfvnPh9mUF0MHK6koNgD++0+DcNaTWgE5p9mc=; b=Gt
 x1iKMRBwtFQg4KaM3ubTJe7nyyb0ODm2llg3E6wfj9zqgVV5qB0ljHtal90Bchgq
 5E2EVj9hVByyTahXHnCuncrWXNNwjndI4tfB5BzJ7+vz9DQthMUNKAZLC3Le6Yky
 8/9R8UppQXD4e2q9e+xattg1SRa7BjtqA1rG2PfAemjiW8TlFdhM6U5ATvU1Udnr
 HzAKprqkoU+y3SYABs2EK2C1ofjA1JWIWcw8EeZ68gYjpeKmSUTl+JhemacHn3bM
 r8aa5gj24J5oVyf5ZEnU6peV8PQRuPEvyCa+3wbpr2YSMO+34HGsPybfOSUSWhFp
 rDBDoThIpWpYYk3UCk3w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5ann1x4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Feb 2024 18:44:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419Ii11K011288
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Feb 2024 18:44:01 GMT
Received: from [10.110.104.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 10:44:00 -0800
Message-ID: <9a4bf513-4390-3e36-f3b7-f9fef1c296fd@quicinc.com>
Date: Fri, 9 Feb 2024 10:43:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 2/4] drm/msm/dpu: support binding to the mdp5 devices
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
 <20240208-fd-migrate-mdp5-v4-2-945d08ef3fa8@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240208-fd-migrate-mdp5-v4-2-945d08ef3fa8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Gr34EX9Ru715wN-GU__jFD8-ecibzKXK
X-Proofpoint-GUID: Gr34EX9Ru715wN-GU__jFD8-ecibzKXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_16,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=962
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090137
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



On 2/8/2024 7:01 AM, Dmitry Baryshkov wrote:
> Existing MDP5 devices have slightly different bindings. The main
> register region is called `mdp_phys' instead of `mdp'. Also vbif
> register regions are a part of the parent, MDSS device. Add support for
> handling this binding differences.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 98 ++++++++++++++++++++++++++-------
>   drivers/gpu/drm/msm/msm_drv.h           |  3 +
>   drivers/gpu/drm/msm/msm_io_utils.c      | 13 +++++
>   3 files changed, 93 insertions(+), 21 deletions(-)
> 

I thought we had agreed on a quite version of msm_ioremap_mdss for 
vbif_nrt_phys?

Anyway, its not something to block this change. Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
