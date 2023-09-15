Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 532AB7A29C7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 23:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4A510E696;
	Fri, 15 Sep 2023 21:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9D310E68F;
 Fri, 15 Sep 2023 21:51:36 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FLTVRe009236; Fri, 15 Sep 2023 21:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=alFHAVEu8kA0mtxk5/AB7s4qLluhhaCU1hdEBkJdU94=;
 b=pRkXL35iyLGGkiXui1RxibWf0UZAe5HNI3To0osgX327vZgYSOCne04X7CB1WBX36VOi
 06f5vI00xImi8HEXIZrqPSJklqjUkDwnbh5udIs1jIx9yqdk9b1mkezizwqEcugK0nnS
 M1mBC2OQwOx41Od7gIZR4KTRVmMcFH8IttnEO5mHUEH+au34JqQZtZD0xmmYnJ8FGd6N
 w9FAPJfxAlJENDez82et5j/FOFgKjgC7LOnVZ3Oit6L3ZZwmMrw3RusESWv6a0DUPW45
 BNQFRiHXRfLZHatORMmBICtX+F/Z3/pZCJQiiuG8RN4QkfAWk41h2a+/zaoEa7i40vqS EA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g072c8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 21:51:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FLpMTW003935
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 21:51:22 GMT
Received: from [10.110.81.121] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 14:51:19 -0700
Message-ID: <63fe9c82-da94-9e65-216a-41d962ae3bca@quicinc.com>
Date: Fri, 15 Sep 2023 14:51:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 7/9] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
 <20230911214521.787453-8-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230911214521.787453-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: B8fymKdAbOi--bbz4io5A9-rEHygHL9_
X-Proofpoint-ORIG-GUID: B8fymKdAbOi--bbz4io5A9-rEHygHL9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_19,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=906 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150196
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



On 9/11/2023 2:45 PM, Dmitry Baryshkov wrote:
> As the subblock info is now mostly gone, inline and drop the macro
> DPU_HW_SUBBLK_INFO.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 40 ++++++++++---------
>   1 file changed, 21 insertions(+), 19 deletions(-)
> 


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
