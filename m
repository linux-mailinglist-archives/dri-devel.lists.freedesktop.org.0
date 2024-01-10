Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4663182A4B2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 00:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EF010E659;
	Wed, 10 Jan 2024 23:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA09910E659;
 Wed, 10 Jan 2024 23:01:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40AN02vF020978; Wed, 10 Jan 2024 23:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=/YS2Oai9YBw3NO3mRKDTfqOrq1eQDMGBPpUCNxqEUG8=; b=ZW
 dmu3sQtSz1z7nxAiN8VIe4Fu+lbVLTjbbl+OGfkG6CH3vBKepBOoxOwYsyRbi6DT
 eXqSRrkTaBQ2o2CARYJAreAvxKtjzjrPVLU5rubsBXAOQC4KWAYyaBwbCkbuKVBb
 DwgIpI40BckPgo11752GWqOZeqsbCMngbkBJl2qU59vQkgx9tiAD0khnH+F2LZzn
 R5q79t08rgpSdWNEKMcJrb5CowHVfRM8Kf8HiB1t92WQo0CRjiL+7ANyH+azBA+k
 TYoznTCLUJZ7q6g7AA1aRR1f+Fi2tpqLVuBiUIfZwkE+TeP1mxo4Vu7JFGVMZwFO
 AvYsXxvhbthB44NP8srA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vhvwx14ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 23:01:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40AN1Dvi018002
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 23:01:13 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 10 Jan
 2024 15:01:12 -0800
Message-ID: <d11ffecb-010d-769a-2d3c-9634a046a453@quicinc.com>
Date: Wed, 10 Jan 2024 15:01:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] drm/msm/mdp5: drop split display support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
 <20231009205727.2781802-6-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231009205727.2781802-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2EfGgkWn1EmqH-xmUYUYD4SgTfvXArSu
X-Proofpoint-ORIG-GUID: 2EfGgkWn1EmqH-xmUYUYD4SgTfvXArSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401100183
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/9/2023 1:57 PM, Dmitry Baryshkov wrote:
> The MSM DSI driver has dropped support for calling
> mdp_kms_funcs::set_split_display() callback. Drop corresponding callback
> from the mdp5 driver together with the rest of the infrastructure.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  | 42 -------------------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  | 42 -------------------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 14 -------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h      |  9 ----
>   drivers/gpu/drm/msm/msm_kms.h                 |  4 --
>   5 files changed, 111 deletions(-)
>

The programming inside the set_split_display() looks right from what i 
see, so whenever (if at all) bonded_dsi is implemented for mdp5, this 
will remain intact. Its just that there are no consumers left for 
set_split_display anymore so its dead code. If someone wants to add that 
support, I guess they have to start by reverting this commit first. If 
thats the plan and agreement,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
