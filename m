Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8748C73BE41
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 20:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2A110E694;
	Fri, 23 Jun 2023 18:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D950A10E0B1;
 Fri, 23 Jun 2023 18:03:30 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35NHu3li027390; Fri, 23 Jun 2023 18:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Zs4PqRwqM2oQI386HL9oV+ST8IFSsaCmf3wwh3DeOCs=;
 b=knNKf8beC9SThR1bUwjBew59dMPjVJHafyP+/BGWi7h0av392JS6KfMtNd9cT13GUIWS
 5YGFQNdhFqrqgq7UNE22VvBfr1WVgWD3Rv+IP6gj6JSL0edGNzWMVmIKKLpQeTuzSsst
 +0FkRaxgYheDQQ+BMn3Ly7YNeqs52/d6ou0CGyKxVha3cVFdlKyKwepO+shFtOvvzvl1
 iLvLuulLWT1h+8WwuJaXOojQ5LSXs0r/4l9qTiekakISX7CORhoYS92H6BcDX063JrWp
 FVES766bfhaN4ZFtLkl8O0CBu5VssRZqTLB/cY2JwRyzziZSkwMsLKorkWXeT453dU1g tA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rc6b2dcfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 18:03:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35NI3N9G008322
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 18:03:23 GMT
Received: from [10.110.6.30] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 23 Jun
 2023 11:03:22 -0700
Message-ID: <dbaefcfe-18f2-0842-1059-9557e0802a99@quicinc.com>
Date: Fri, 23 Jun 2023 11:03:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify DPU sub-blocks info
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dyqJ99a20fXbWmD6jBA-JsWhDF3_nO1d
X-Proofpoint-GUID: dyqJ99a20fXbWmD6jBA-JsWhDF3_nO1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_09,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306230161
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



On 6/23/2023 6:58 AM, Dmitry Baryshkov wrote:
> Ryan pointed out [1] that some (most) of of sub-blocks do not fill the
> field `name'. Further research showed that we can drop the fields `name'
> and `id' and further simplify the catalog. The handling code also
> usually knows, which sub-block it is now looking at.
> 
> Drop unused field and arguments and merge some of sub-block
> declarations. I did not merge inter-generation VIG_SBLK definitions,
> this is pending another cleanup (which will also switch to using
> hardcoded scaler version).
> 
> Dependencies: [2]

NAK on this series till we have responded to the comments on the other 
sub-blk series.

Please stop pushing changes in the middle of discussions with the goal 
of forcing others to adopt them or rebase them.

Its not going to happen and we want to have a collaborative culture and 
not an authoritative one.

> 
> [1] https://patchwork.freedesktop.org/patch/543903/?series=119773&rev=1
> [2] https://patchwork.freedesktop.org/series/118839/
> 
> Dmitry Baryshkov (6):
>    drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
>    drm/msm/dpu: drop the field `name' from DPU_HW_SUBBLK_INFO
>    drm/msm/dpu: drop the `smart_dma_priority' field from struct
>      dpu_sspp_sub_blks
>    drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
>    drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
>    drm/msm/dpu: merge dpu_csc_blk and dpu_dsc_blk into dpu_simple_blk
> 
> Ryan McCann (1):
>    drm/msm/dpu: Drop unused num argument from relevant macros
> 
>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  16 +--
>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  16 +--
>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  16 +--
>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  16 +--
>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  16 +--
>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   8 +-
>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   4 +-
>   .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |   8 +-
>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   4 +-
>   .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   4 +-
>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  16 +--
>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   8 +-
>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  16 +--
>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  16 +--
>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  20 +--
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 122 +++++++-----------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  48 +++----
>   17 files changed, 154 insertions(+), 200 deletions(-)
> 
