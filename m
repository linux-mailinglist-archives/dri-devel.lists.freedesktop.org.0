Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94979801987
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 02:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE0610E9A8;
	Sat,  2 Dec 2023 01:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0B810E17E;
 Sat,  2 Dec 2023 01:34:04 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B21DZNC030119; Sat, 2 Dec 2023 01:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SSLTIQcGQ1pdAOqiZJ/2aRqYuOT51p1NgTlcKFEcBeM=;
 b=Xboy6nBA3WqyoH5ZZODxa/WhNfGCfQuRNNgZnpGg2jRSQ3Mt092EZO3Icz57bFJJnxk3
 EnOobHgPXTbimw1vmiD2c/mWkujMKiCUCRxo7VKZc8aQ/7Hfy5QiRif3xxHIoVUm9tu+
 yb1FI/OS1hPMwFryBwpAN1RlW/rG0be90JYFSK7YlkW582nPyTAHcVrq8vWvu2y09kfn
 dIks7WfxPiI9D8TWPI3As1udAeDNDNGn5pa2TKw+BnqFEbQZ9JG+bkMV4CcTEvQWGuJk
 wvTJd0TpO7vD1HWi9GCAYyS6vtudB5gn8yKRuNSX0PccEWkUeAp6lsBo5tKIKG7SEWjS BA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq3r2kb5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:33:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B21XtU6006096
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 2 Dec 2023 01:33:55 GMT
Received: from [10.110.73.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 17:33:55 -0800
Message-ID: <5a53b8b9-bd8a-0bbe-2641-8983509e8a7a@quicinc.com>
Date: Fri, 1 Dec 2023 17:33:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 17/17] drm/msm: drop mdp_get_formats()
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
 <20230708010407.3871346-18-dmitry.baryshkov@linaro.org>
 <47e95721-3113-3444-44e9-b162ac08c0e5@quicinc.com>
In-Reply-To: <47e95721-3113-3444-44e9-b162ac08c0e5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BxbkFOB6ndTBCbS4dyn3s4re2smFszAP
X-Proofpoint-ORIG-GUID: BxbkFOB6ndTBCbS4dyn3s4re2smFszAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxlogscore=742 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/1/2023 5:25 PM, Abhinav Kumar wrote:
> 
> 
> On 7/7/2023 6:04 PM, Dmitry Baryshkov wrote:
>> Drop the function mdp_get_formats(), which became unused after
>> converting both MDP4 and MDP5 planes to use static formats arrays.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/mdp_format.c | 24 ------------------------
>>   drivers/gpu/drm/msm/disp/mdp_kms.h    |  1 -
>>   2 files changed, 25 deletions(-)
>>
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Actually, I have one concern with patch 1 and patch 17 of this series.

You cannot get rid of static const struct mdp_format formats[] because 
mdp_get_format() still uses it.

Now, we end up having to maintain two arrays to hold the formats, the 
already existing formats[] one and newly added  mdp_rgb_formats[] and 
mdp_rgb_yuv_formats[].

This is an overkill.

I am fine with overall migrating to drmm-managed APIs but I think patch 
1 and this one are not necessary.
